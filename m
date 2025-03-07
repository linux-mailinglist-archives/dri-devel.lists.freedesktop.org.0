Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC71A55FEC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BBF10EACD;
	Fri,  7 Mar 2025 05:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ofge1K4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8972010EACD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741325109; x=1772861109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ciLM32w5HRFjiS6cUXc8wcnZ8ChKpi8LzqUwiRrSiYA=;
 b=Ofge1K4hoezo85ccVCvHlNZP5qiic9J1Pg9gpOIwQmhYO4KSbpyFuNIx
 /vYL4coHy8RQtzVMZY+lOh9ChoION+iPDmltwFrkmXFY8AOtTbDjV5qlY
 Kl9BbcAOZ9grtSCtUnN5jkKY4oPrRTX4o4WJnPKF48awUpdondw0U+9sp
 wBrI0N1vUOpKTUSIpNqrylSvsKZ/XIW0dixT7ZvOIET/feajPn7JjF0io
 Z0H/Ph6qEN5NICyoA/zRM2cjmPk/FOijCLX5dX5C+vIh63xCwZs1VDQAv
 PdqJkz1TUTSdJjAeAZIw9RevaBm6ogjW6AV8r0CrXShlmlqrndm62FG2T g==;
X-CSE-ConnectionGUID: 1DxkUEmNQBy9oRoHIJ8iYQ==
X-CSE-MsgGUID: Y7om10GHT7GvtoU9TWXf8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46293076"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="46293076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:25:09 -0800
X-CSE-ConnectionGUID: uBlpWEfKTEyU1NaETdSYtQ==
X-CSE-MsgGUID: c3aP3d7mS6ysse/nqGlaNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="119232480"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 21:25:09 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Lin Guay <wguay@meta.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
Subject: [PATCH v3 0/3] vfio/pci: Allow MMIO regions to be exported through
 dma-buf
Date: Thu,  6 Mar 2025 21:16:41 -0800
Message-ID: <20250307052248.405803-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an attempt to revive the patches posted by Jason Gunthorpe at:
https://patchwork.kernel.org/project/linux-media/cover/0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com/

Here is the cover letter text from Jason's original series:
"dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

This series supports a use case for SPDK where a NVMe device will be owned
by SPDK through VFIO but interacting with a RDMA device. The RDMA device
may directly access the NVMe CMB or directly manipulate the NVMe device's
doorbell using PCI P2P.

However, as a general mechanism, it can support many other scenarios with
VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
generic and safe P2P mappings."

In addition to the SPDK use-case mentioned above, the capability added
in this patch series can also be useful when a buffer (located in device
memory such as VRAM) needs to be shared between any two dGPU devices or
instances (assuming one of them is bound to VFIO PCI) as long as they
are P2P DMA compatible.

The original series has been rebased and augmented to support creation
of the dmabuf from multiple ranges of a region.

Changelog:

v2 -> v3:
- Rebase onto 6.14-rc5
- Drop the mmap handler given that it is undesirable in some use-cases
- Rename the file dma_buf.c to vfio_pci_dmabuf.c to be consistent with
  other files in vfio/pci directory

v1 -> v2:
- Rebase on 6.10-rc4
- Update the copyright year in dma_buf.c (Zhu Yanjun)
- Check the revoked flag during mmap() and also revoke the mappings
  as part of move when access to the MMIO space is disabled (Alex)
- Include VM_ALLOW_ANY_UNCACHED and VM_IO flags for mmap (Alex)
- Fix memory leak of ranges when creation of priv fails (Alex)
- Check return value of vfio_device_try_get_registration() (Alex)
- Invoke dma_buf move for runtime PM and FLR cases as well (Alex)
- Add a separate patch to have all the feature functions take
  the core device pointer instead of the main device ptr (Alex)
- Use the regular DMA APIs (that were part of original series) instead
  of PCI P2P DMA APIs while mapping the dma_buf (Jason)
- Rename the region's ranges from p2p_areas to dma_ranges (Jason)
- Add comments in vfio_pci_dma_buf_move() to describe how the locking
  is expected to work (Jason)

This series is available at:
https://gitlab.freedesktop.org/Vivek/drm-tip/-/commits/vfio_dmabuf_v3

along with additional patches (needed for testing) for Qemu here:
https://gitlab.freedesktop.org/Vivek/qemu/-/commits/vfio_dmabuf_3

This series is tested using the following method:
- Run Qemu with the following relevant options:
  qemu-system-x86_64 -m 4096m ....
  -device vfio-pci,host=0000:03:00.1
  -device virtio-vga,max_outputs=1,blob=true,xres=1920,yres=1080
  -display gtk,gl=on
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine memory-backend=mem1 ...
- Run upstream Weston with following options in the Guest VM:
  ./weston --drm-device=card1 --additional-devices=card0
  where card1 is a dGPU (assigned to vfio-pci and using xe driver
  in Guest VM), card0 is virtio-gpu.
- Or run Mutter with Wayland backend in the Guest VM with the dGPU
  designated as the primary

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Wei Lin Guay <wguay@meta.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>

Vivek Kasireddy (3):
  vfio: Export vfio device get and put registration helpers
  vfio/pci: Share the core device pointer while invoking feature
    functions
  vfio/pci: Allow MMIO regions to be exported through dma-buf

 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/vfio_pci_config.c |  22 +-
 drivers/vfio/pci/vfio_pci_core.c   |  50 ++--
 drivers/vfio/pci/vfio_pci_dmabuf.c | 359 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_priv.h   |  23 ++
 drivers/vfio/vfio_main.c           |   2 +
 include/linux/vfio.h               |   2 +
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  25 ++
 9 files changed, 463 insertions(+), 22 deletions(-)
 create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c

-- 
2.48.1

