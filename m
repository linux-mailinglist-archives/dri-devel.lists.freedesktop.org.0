Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D91B5715A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B598910E2DE;
	Mon, 15 Sep 2025 07:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJYT1SPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056A10E2DD;
 Mon, 15 Sep 2025 07:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757921145; x=1789457145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CX5Lu9UOoUKcFO9cw+HLSl71knagRZlwFhzDd1HrmIM=;
 b=MJYT1SPswypoFKnfz+Rb2bgvRRx7+JtbZ34T7Og0sQbVM/qkWnDMXBvD
 lkzI0J82xBuTejtFcjExp0t+ma9pBGv18Kpgj1hXHzn0Ty3gAyUS1aS4q
 co7IYA4VqRO3BhGaGMcWlBrLD8A70yOqsN+C3HMGhrEjkGLKXfLLTQVf5
 g3PIN+L1yyFhKCYqBA2jw9CR08+iXq8YpGMmFtGj3VDukZPyjFEjl0GYp
 6FIQGjEqB8s8CRd1Ju1jvr2IZTEsCEyzOS43zQFVXlZ3BzZebY28iffA+
 T+Q/g2yT/tFMcZTAJHN86MPjuo1fCDQpuMsjAmlj+JPZW+OT6YpZXFgkm A==;
X-CSE-ConnectionGUID: V7n52Pp1SIm8Wxs9t/bsDg==
X-CSE-MsgGUID: Bw2XZje/RZWku86D1p6wXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77619118"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="77619118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:45 -0700
X-CSE-ConnectionGUID: 1g+OrFoxQSS5+5RS87LbOw==
X-CSE-MsgGUID: qvIVlCXbSpqPE1R1Hj6wvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211693861"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:25:45 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v4 0/5] drm/xe/sriov: Don't migrate dmabuf BO to System RAM if
 P2P check succeeds
Date: Mon, 15 Sep 2025 00:21:04 -0700
Message-ID: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
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

While running 3D apps inside a Guest VM with a SRIOV enabled dGPU,
it was noticed that migrating a BO to System RAM before exporting
it as a dmabuf results in considerable performance degradation.
For example, running a simple 3D app such as weston-simple-egl
would yield ~44 FPS instead of ~59 FPS, assuming a mode of
1920x1080@60.

So, fix this issue by not migrating the BO and keep it in LMEM
during export if the P2P test (pci_p2pdma_distance()) succeeds.
However, since the GPU running in PF mode on the Host cannot
effectively access the PCI BAR addresses backing the imported
dmabuf BO, they need to be translated into LMEM addresses (DPAs)
to enable this use-case to work properly.

With this patch series applied, it would become possible to display
(via Qemu GTK UI) Guest VM compositor's framebuffer (created in its
LMEM) on the Host without having to make any copies of it or a
costly roundtrip to System RAM. And, weston-simple-egl can now
achieve ~59 FPS while running with Gnome Wayland in the Guest VM.

Changelog:
v3 -> v4:
- Drop the IS_SRIOV_VF() check in xe_dma_buf_pin() and instead rely
  on Qemu's virtual PCI ports to make virtio-gpu P2P compatible
  with VF
- Add an additional condition to check for Intel GPU in P2PDMA patch
  (Logan)
- Ensure that a reference is taken on VF's backing object in LMEM
  (Michal)
- Create a new type to store dma data for external dmabuf BOs

v2 -> v3:
- Rebased (and tested) on kernel 6.17.0-rc4 with B60
- Updated the commit message in the P2PDMA patch and other patches

v1 -> v2:
- Use a dma_addr array instead of SG table to store translated DMA
  addresses (Matt)
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)
- Rebased and tested this series on top of the one that introduces
  drm_pagemap_dma_addr and xe_res_first_dma/__xe_res_dma_next
  that this version relies on

Patchset overview:
Patch 1: PCI driver patch to unblock P2P DMA between VF and PF
Patch 2: Prevent BO migration to System RAM while running in VM
Patch 3: Helper function to get VF's backing object in LMEM
Patch 4-5: Create and use a new dma_addr array for LMEM based
           dmabuf BOs to store translated addresses (DPAs)

Associated Qemu patch series:
https://lore.kernel.org/qemu-devel/20250903054438.1179384-1-vivek.kasireddy@intel.com/
Associated vfio-pci patch series:
https://lore.kernel.org/linux-mm/cover.1754311439.git.leon@kernel.org/

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

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (5):
  PCI/P2PDMA: Don't enforce ACS check for device functions of Intel GPUs
  drm/xe/dmabuf: Don't migrate BO to System RAM if P2P check succeeds
  drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
  drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with
    VFs
  drm/xe/pt: Add an additional check for dmabuf BOs while doing bind

 drivers/gpu/drm/xe/xe_bo.c                 | 101 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h           |  12 +++
 drivers/gpu/drm/xe/xe_dma_buf.c            |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  23 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h     |  19 ++++
 drivers/pci/p2pdma.c                       |  15 ++-
 8 files changed, 180 insertions(+), 4 deletions(-)

-- 
2.50.1

