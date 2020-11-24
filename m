Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00A2C327C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 22:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904D089F41;
	Tue, 24 Nov 2020 21:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C689F33
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 21:22:00 +0000 (UTC)
IronPort-SDR: uzhl/6s6+//1YWuzmgk2S9F1EoJjLQuM4otJKSAWoYqL/fM1Di8502ftfQGo253AkntEk1CSAX
 M7+9vnXii+sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172175989"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="172175989"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 13:21:58 -0800
IronPort-SDR: XzNxro7ON9VI3TZ7sj9ZoEKRaZ5ivvoHdLThSe+/4RMi43oF9uVCtdBn0/6Q+XgtIMEhSQZzGv
 qqzYtVjMeoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="343313411"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga002.jf.intel.com with ESMTP; 24 Nov 2020 13:21:58 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v12 0/4] RDMA: Add dma-buf support
Date: Tue, 24 Nov 2020 13:35:46 -0800
Message-Id: <1606253750-67057-1-git-send-email-jianxin.xiong@intel.com>
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

This is the twelfth version of the patch set. Changelog:

v12:
* Move the prototype of function ib_umem_dmabuf_release() to ib_umem.h
  and remove umem_dmabuf.h
* Break a line that is too long

v11: https://www.spinics.net/lists/linux-rdma/msg97860.html
* Rework the parameter checking code inside ib_umem_dmabuf_get() 
* Fix incorrect error handling in the new verbs command handler
* Put a duplicated code sequence for checking iova and setting page size
  into a function
* In the invalidation callback, check for if the buffer has been mapped
  and thus the presence of a valid driver mr is ensured
* The patch that checks for dma_virt_ops is dropped because it is no
  longer needed
* The patch that documents that dma-buf size is fixed has landed at:
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=476b485be03c
  and thus is no longer included here
* The matching user space patch set is sent separately

v10: https://www.spinics.net/lists/linux-rdma/msg97483.html
* Don't map the pages in ib_umem_dmabuf_get(); use the size information
  of the dma-buf object to validate the umem size instead
* Use PAGE_SIZE directly instead of use ib_umem_find_best_pgsz() when
  the MR is created since the pages have not been mapped yet and dma-buf
  requires PAGE_SIZE anyway
* Always call mlx5_umem_find_best_pgsz() after mapping the pages to
  verify that the page size requirement is satisfied
* Add a patch to document that dma-buf size is fixed

v9: https://www.spinics.net/lists/linux-rdma/msg97432.html
* Clean up the code for sg list in-place modification
* Prevent dma-buf pages from being mapped multiple times
* Map the pages in ib_umem_dmabuf_get() so that inproper values of
  address/length/iova can be caught early
* Check for unsupported flags in the new uverbs command
* Add missing uverbs_finalize_uobj_create()
* Sort uverbs objects by name
* Fix formating issue -- unnecessary alignment of '='
* Unmap pages in mlx5_ib_fence_dmabuf_mr()
* Remove address range checking from pagefault_dmabuf_mr()

v8: https://www.spinics.net/lists/linux-rdma/msg97370.html
* Modify the dma-buf sg list in place to get a proper umem sg list and
  restore it before calling dma_buf_unmap_attachment()
* Validate the umem sg list with ib_umem_find_best_pgsz()
* Remove the logic for slicing the sg list at runtime

v7: https://www.spinics.net/lists/linux-rdma/msg97297.html
* Rebase on top of latest mlx5 MR patch series
* Slice dma-buf sg list at runtime instead of creating a new list
* Preload the buffer page mapping when the MR is created
* Move the 'dma_virt_ops' check into dma_buf_dynamic_attach()

v6: https://www.spinics.net/lists/linux-rdma/msg96923.html
* Move the dma-buf invalidation callback from the core to the device
  driver
* Move mapping update from work queue to pagefault handler
* Add dma-buf based MRs to the xarray of mmkeys so that the pagefault
  handler can be reached
* Update the new driver method and uverbs command signature by changing
  the paramter 'addr' to 'offset'
* Modify the sg list returned from dma_buf_map_attachment() based on
  the parameters 'offset' and 'length'
* Don't import dma-buf if 'dma_virt_ops' is used by the dma device
* The patch that clarifies dma-buf sg lists alignment has landed at
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac80cd17a615
  and thus is no longer included with this set

v5: https://www.spinics.net/lists/linux-rdma/msg96786.html
* Fix a few warnings reported by kernel test robot:
    - no previous prototype for function 'ib_umem_dmabuf_release' 
    - no previous prototype for function 'ib_umem_dmabuf_map_pages'
    - comparison of distinct pointer types in 'check_add_overflow'
* Add comment for the wait between getting the dma-buf sg tagle and
  updating the NIC page table

v4: https://www.spinics.net/lists/linux-rdma/msg96767.html
* Add a new ib_device method reg_user_mr_dmabuf() instead of expanding
  the existing method reg_user_mr()
* Use a separate code flow for dma-buf instead of adding special cases
  to the ODP memory region code path
* In invalidation callback, new mapping is updated as whole using work
  queue instead of being updated in page granularity in the page fault
  handler
* Use dma_resv_get_excl() and dma_fence_wait() to ensure the content of
  the pages have been moved to the new location before the new mapping
  is programmed into the NIC
* Add code to the ODP page fault handler to check the mapping status
* The new access flag added in v3 is removed.
* The checking for on-demand paging support in the new uverbs command
  is removed because it is implied by implementing the new ib_device
  method
* Clarify that dma-buf sg lists are page aligned

v3: https://www.spinics.net/lists/linux-rdma/msg96330.html
* Use dma_buf_dynamic_attach() instead of dma_buf_attach()
* Use on-demand paging mechanism to avoid pinning the GPU memory
* Instead of adding a new parameter to the device method for memory
  registration, pass all the attributes including the file descriptor
  as a structure
* Define a new access flag for dma-buf based memory region
* Check for on-demand paging support in the new uverbs command

v2: https://www.spinics.net/lists/linux-rdma/msg93643.html
* The Kconfig option is removed. There is no dependence issue since
  dma-buf driver is always enabled.
* The declaration of new data structure and functions is reorganized to
  minimize the visibility of the changes.
* The new uverbs command now goes through ioctl() instead of write().
* The rereg functionality is removed.
* Instead of adding new device method for dma-buf specific registration,
  existing method is extended to accept an extra parameter. 
* The correct function is now used for address range checking. 

v1: https://www.spinics.net/lists/linux-rdma/msg90720.html
* The initial patch set
* Implement core functions for importing and mapping dma-buf
* Use dma-buf static attach interface
* Add two ib_device methods reg_user_mr_fd() and rereg_user_mr_fd()
* Add two uverbs commands via the write() interface
* Add Kconfig option
* Add dma-buf support to mlx5 device

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

This series consists of four patches. The first patch adds the common
code for importing dma-buf from a file descriptor and mapping the
dma-buf pages. Patch 2 add the new driver method reg_user_mr_dmabuf().
Patch 3 adds a new uverbs command for registering dma-buf based memory
region. Patch 4 adds dma-buf support to the mlx5 driver.

Related user space RDMA library changes are provided as a separate
patch series.

Jianxin Xiong (4):
  RDMA/umem: Support importing dma-buf as user memory region
  RDMA/core: Add device method for registering dma-buf based memory
    region
  RDMA/uverbs: Add uverbs command for dma-buf based MR registration
  RDMA/mlx5: Support dma-buf based userspace memory region

 drivers/infiniband/core/Makefile              |   2 +-
 drivers/infiniband/core/device.c              |   1 +
 drivers/infiniband/core/umem.c                |   3 +
 drivers/infiniband/core/umem_dmabuf.c         | 173 ++++++++++++++++++
 drivers/infiniband/core/uverbs_std_types_mr.c | 114 +++++++++++-
 drivers/infiniband/hw/mlx5/main.c             |   2 +
 drivers/infiniband/hw/mlx5/mlx5_ib.h          |  18 ++
 drivers/infiniband/hw/mlx5/mr.c               | 128 ++++++++++++-
 drivers/infiniband/hw/mlx5/odp.c              |  86 ++++++++-
 include/rdma/ib_umem.h                        |  41 ++++-
 include/rdma/ib_verbs.h                       |   6 +-
 include/uapi/rdma/ib_user_ioctl_cmds.h        |  14 ++
 12 files changed, 574 insertions(+), 14 deletions(-)
 create mode 100644 drivers/infiniband/core/umem_dmabuf.c

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
