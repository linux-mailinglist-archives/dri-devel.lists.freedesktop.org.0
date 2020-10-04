Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C643F282CA0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Oct 2020 20:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3054789E36;
	Sun,  4 Oct 2020 18:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4A089E36
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Oct 2020 18:58:35 +0000 (UTC)
IronPort-SDR: ab5cW4ECrHpB1gUMCILYLh/OIetmG9mIxAq/SKU8tws5VUtX9KIAXIpBoMLHExes+NZhxLtwpH
 EvY4+EulJ+bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="181422002"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="181422002"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 11:58:35 -0700
IronPort-SDR: nbh1lPpZhyt4Mpd6F073Y+j6ZlqOwdGtnAU39wccVebdg5uZ/JRWw9Nep1g8scilUUjK7nhrdT
 06y1rgzKIPCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="295384537"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2020 11:58:34 -0700
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 0/4] RDMA: Add dma-buf support
Date: Sun,  4 Oct 2020 12:12:27 -0700
Message-Id: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When enabled, an RDMA capable NIC can perform peer-to-peer transactions
over PCIe to access the local memory located on another device. This can
often lead to better performance than using a system memory buffer for
RDMA and copying data between the buffer and device memory.

Current kernel RDMA stack uses get_user_pages() to pin the physical
pages backing the user buffer and uses dma_map_sg_attrs() to get the
dma addresses for memory access. This usually doesn't work for peer
device memory due to the lack of associated page structures.

Several mechanisms exist today to facilitate device memory access.

ZONE_DEVICE is a new zone for device memory in the memory management
subsystem. It allows pages from device memory being described with
specialized page structures, but what can be done with these page
structures may be different from system memory. ZONE_DEVICE is further
specialized into multiple memory types, such as one type for PCI
p2pmem/p2pdma and one type for HMM.

PCI p2pmem/p2pdma uses ZONE_DEVICE to represent device memory residing
in a PCI BAR and provides a set of calls to publish, discover, allocate,
and map such memory for peer-to-peer transactions. One feature of the
API is that the buffer is allocated by the side that does the DMA
transfer. This works well with the storage usage case, but is awkward
with GPU-NIC communication, where typically the buffer is allocated by
the GPU driver rather than the NIC driver.

Heterogeneous Memory Management (HMM) utilizes mmu_interval_notifier
and ZONE_DEVICE to support shared virtual address space and page
migration between system memory and device memory. HMM doesn't support
pinning device memory because pages located on device must be able to
migrate to system memory when accessed by CPU. Peer-to-peer access
is currently not supported by HMM.

Dma-buf is a standard mechanism for sharing buffers among different
device drivers. The buffer to be shared is exported by the owning
driver and imported by the driver that wants to use it. The exporter
provides a set of ops that the importer can call to pin and map the
buffer. In addition, a file descriptor can be associated with a dma-
buf object as the handle that can be passed to user space.

This patch series adds dma-buf importer role to the RDMA driver in
attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
chosen for a few reasons: first, the API is relatively simple and allows
a lot of flexibility in implementing the buffer manipulation ops.
Second, it doesn't require page structure. Third, dma-buf is already
supported in many GPU drivers. However, we are aware that existing GPU
drivers don't allow pinning device memory via the dma-buf interface.
Pinning would simply cause the backing storage to migrate to system RAM.
True peer-to-peer access is only possible using dynamic attach, which
requires on-demand paging support from the NIC to work. For this reason,
this series only works with ODP capable NICs.

This is the third version of the patch series. Here are the changes
from the previous version:
* Use dma_buf_dynamic_attach() instead of dma_buf_attach()
* Use on-demand paging mechanism to avoid pinning the GPU memory
* Instead of adding a new parameter to the device method for memory
registration, pass all the attributes including the file descriptor
as a structure.
* Define a new access flag for dma-buf based memory region.
* Check for on-demand paging support in the new uverbs command

This series consists of four patches. The first patch adds the common
code for importing dma-buf from a file descriptor and mapping the
dma-buf pages. Patch 2 changes the signature of driver method for user
space memory registration to accept a structure of attributes and adds
dma-buf file descriptor to the structure. Vendor drivers are updated
accordingly. Patch 3 adds dma-buf support to the mlx5 driver. Patch 4
adds a new uverbs command for registering dma-buf based memory region.

Related user space RDMA library changes will be provided as a separate
patch series.

Jianxin Xiong (4):
  RDMA/umem: Support importing dma-buf as user memory region
  RDMA: Expand driver memory registration methods to support dma-buf
  RDMA/mlx5: Support dma-buf based userspace memory region
  RDMA/uverbs: Add uverbs command for dma-buf based MR registration

 drivers/infiniband/core/Makefile                |   2 +-
 drivers/infiniband/core/umem.c                  |   4 +
 drivers/infiniband/core/umem_dmabuf.c           | 291 ++++++++++++++++++++++++
 drivers/infiniband/core/umem_dmabuf.h           |  14 ++
 drivers/infiniband/core/umem_odp.c              |  12 +
 drivers/infiniband/core/uverbs_cmd.c            |  25 +-
 drivers/infiniband/core/uverbs_std_types_mr.c   | 115 ++++++++++
 drivers/infiniband/core/verbs.c                 |  15 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.c        |  23 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.h        |   4 +-
 drivers/infiniband/hw/cxgb4/iw_cxgb4.h          |   6 +-
 drivers/infiniband/hw/cxgb4/mem.c               |  19 +-
 drivers/infiniband/hw/efa/efa.h                 |   3 +-
 drivers/infiniband/hw/efa/efa_verbs.c           |  24 +-
 drivers/infiniband/hw/hns/hns_roce_device.h     |   8 +-
 drivers/infiniband/hw/hns/hns_roce_mr.c         |  28 +--
 drivers/infiniband/hw/i40iw/i40iw_verbs.c       |  24 +-
 drivers/infiniband/hw/mlx4/mlx4_ib.h            |   7 +-
 drivers/infiniband/hw/mlx4/mr.c                 |  37 +--
 drivers/infiniband/hw/mlx5/mlx5_ib.h            |   8 +-
 drivers/infiniband/hw/mlx5/mr.c                 |  97 ++++++--
 drivers/infiniband/hw/mlx5/odp.c                |  22 +-
 drivers/infiniband/hw/mthca/mthca_provider.c    |  13 +-
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c     |  23 +-
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.h     |   5 +-
 drivers/infiniband/hw/qedr/verbs.c              |  25 +-
 drivers/infiniband/hw/qedr/verbs.h              |   4 +-
 drivers/infiniband/hw/usnic/usnic_ib_verbs.c    |  12 +-
 drivers/infiniband/hw/usnic/usnic_ib_verbs.h    |   4 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_mr.c    |  24 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_verbs.h |   4 +-
 drivers/infiniband/sw/rdmavt/mr.c               |  21 +-
 drivers/infiniband/sw/rdmavt/mr.h               |   4 +-
 drivers/infiniband/sw/rxe/rxe_verbs.c           |  10 +-
 drivers/infiniband/sw/siw/siw_verbs.c           |  26 ++-
 drivers/infiniband/sw/siw/siw_verbs.h           |   5 +-
 include/rdma/ib_umem.h                          |  19 +-
 include/rdma/ib_verbs.h                         |  21 +-
 include/uapi/rdma/ib_user_ioctl_cmds.h          |  14 ++
 include/uapi/rdma/ib_user_ioctl_verbs.h         |   2 +
 40 files changed, 799 insertions(+), 225 deletions(-)
 create mode 100644 drivers/infiniband/core/umem_dmabuf.c
 create mode 100644 drivers/infiniband/core/umem_dmabuf.h

-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
