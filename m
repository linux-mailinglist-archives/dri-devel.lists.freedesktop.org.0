Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC3BD7D0F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3587C10E551;
	Tue, 14 Oct 2025 07:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFDKy1+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF810E551;
 Tue, 14 Oct 2025 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426036; x=1791962036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7e3TGyZywB21Vu0/e0A9fczh8EzgWJG4tKhN9TqfLKA=;
 b=DFDKy1+An/MAdNYok/BP0QGi8DWwGcokKTMkA3O3xdnqZpOz/lwgjvm8
 30zzxTX2d2PKkrb3dHB3whVS03viyDj9h5/tbtH4zGqao5a3J4e13MCLM
 HWn7vq4mpd/pe7Z8NLdu94rGa5qkC6p6XgDN3i+YNVy4OE7cs9ymJRPVb
 WLoWJaP9OyBL2GtIzSGEfTdI7zLT1luWxud6Am86UFtAh2SUTtyMp2fhV
 2LHWMGSDMPefd+Bw71dRoK9F8VU0/kb3BngkIV60KA5HhXheYJdLyZyRJ
 xR1hquheq/4WyEuo3LvwHa9WIXml9jKAwfMo5HYCdpSLXxANxQBG93gS+ w==;
X-CSE-ConnectionGUID: wFoyrntkT3iXilmc8y/tFg==
X-CSE-MsgGUID: /IdC9nvhSGSBmTrUbMwpFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257110"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:56 -0700
X-CSE-ConnectionGUID: swh+auFQROW2Qr5zTdTA6w==
X-CSE-MsgGUID: qJVGGFCERaKZudj2tCjxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369842"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:55 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC 0/8] dma-buf: Add support for mapping dmabufs via interconnects
Date: Tue, 14 Oct 2025 00:08:50 -0700
Message-ID: <20251014071243.811884-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
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

In a typical dma-buf use case, a dmabuf exporter makes its buffer
buffer available to an importer by mapping it using DMA APIs
such as dma_map_sgtable() or dma_map_resource(). However, this
is not desirable in some cases where the exporter and importer
are directly connected via a physical or virtual link (or
interconnect) and the importer can access the buffer without
having it DMA mapped.

So, to address this scenario, this patch series adds APIs to map/
unmap dmabufs via interconnects and also provides a helper to
identify the first common interconnect between the exporter and
importer. Furthermore, this patch series also adds support for
IOV interconnect in the vfio-pci driver and Intel Xe driver.

The IOV interconnect is a virtual interconnect between an SRIOV
physical function (PF) and its virtual functions (VFs). And, for
the IOV interconnect, the addresses associated with a buffer are
shared using an xarray (instead of an sg_table) that is populated
with entries of type struct range. 

The dma-buf patches in this series are based on ideas/suggestions
provided by Jason Gunthorpe, Christian Koenig and Thomas Hellström.
Note that the Xe driver patches in this series need to be rebased
in the next version to include feedback from the previous round
of review.

Patchset overview:
Patch 1-3: Add dma-buf APIs to map/unmap and match
Patch 4: Add support for IOV interconnect in vfio-pci driver
Patch 5: Add support for IOV interconnect in Xe driver
Patch 6-8: Create and use a new dma_addr array for LMEM based
           dmabuf BOs to store translated addresses (DPAs)

This series is rebased on top of the following repo:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio-v5

Associated Qemu patch series:
https://lore.kernel.org/qemu-devel/20251003234138.85820-1-vivek.kasireddy@intel.com/
Associated vfio-pci patch series:
https://lore.kernel.org/dri-devel/cover.1760368250.git.leon@kernel.org/

This series is tested using the following method:
- Run Qemu with the following relevant options:
  qemu-system-x86_64 -m 4096m ....
  -device ioh3420,id=root_port1,bus=pcie.0
  -device x3130-upstream,id=upstream1,bus=root_port1
  -device xio3130-downstream,id=downstream1,bus=upstream1,chassis=9
  -device xio3130-downstream,id=downstream2,bus=upstream1,chassis=10
  -device vfio-pci,host=0000:03:00.1,bus=downstream1
  -device virtio-gpu,max_outputs=1,blob=true,xres=1920,yres=1080,bus=downstream2
  -display gtk,gl=on
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine q35,accel=kvm,memory-backend=mem1 ...
- Run Gnome Wayland with the following options in the Guest VM:
  # cat /usr/lib/udev/rules.d/61-mutter-primary-gpu.rules
  ENV{DEVNAME}=="/dev/dri/card1", TAG+="mutter-device-preferred-primary", TAG+="mutter-device-disable-kms-modifiers"
  # XDG_SESSION_TYPE=wayland dbus-run-session -- /usr/bin/gnome-shell --wayland --no-x11 &

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (8):
  dma-buf: Add support for map/unmap APIs for interconnects
  dma-buf: Add a helper to match interconnects between exporter/importer
  dma-buf: Add support for IOV interconnect
  vfio/pci/dmabuf: Add support for IOV interconnect
  drm/xe/dma_buf: Add support for IOV interconnect
  drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
  drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with
    VFs
  drm/xe/pt: Add an additional check for dmabuf BOs while doing bind

 drivers/dma-buf/dma-buf.c                  | 113 +++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.c                 | 148 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h           |  12 ++
 drivers/gpu/drm/xe/xe_dma_buf.c            |  19 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  23 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h     |  19 +++
 drivers/vfio/pci/vfio_pci_dmabuf.c         | 141 +++++++++++++++++++-
 include/linux/dma-buf-interconnect.h       |  51 +++++++
 include/linux/dma-buf.h                    |  20 +++
 11 files changed, 540 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/dma-buf-interconnect.h

-- 
2.50.1

