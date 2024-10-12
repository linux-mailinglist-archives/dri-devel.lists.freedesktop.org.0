Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E099B055
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 05:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A46010E12D;
	Sat, 12 Oct 2024 03:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RX1Mm1+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F210E03B;
 Sat, 12 Oct 2024 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728702576; x=1760238576;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=atl/aZPG9eTBILf795lVhGtWKP57SdAb7suS20UKOBA=;
 b=RX1Mm1+06ugEBwxSi96z32UfHMfPdElr88G75lGddQdaE4V1USfREiuT
 Kd8zNP6zLwKFfphRQSlrsjsXai6UkNeHkmqJpYsc62ckjANKTm6vvv9w0
 72PZm+GoUj1G8X9TTo2Ugx+4FynpjoanR2x+BPaHD7a689ZpwC2N8MYAj
 vpjm5ioqy8F5TbZEUSIheQSnMNLKMSMsrGzx8/smW9OqvXUh5b24M1ets
 nVy93n6MhzKaLGnzyksP3cZpFgfn6YWVmR9r5zppTlsVoxLfjZZb7J8eN
 XiqwZUdKRYv1Fy68Af19l21NaUCSB8bMEuybOjSpNOb8N+yZTIc8gNEOF g==;
X-CSE-ConnectionGUID: OhCyPhOWQsqAvtfzq6SqTQ==
X-CSE-MsgGUID: yN1sh+E6TJqQ7pf+AfuTvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38687314"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="38687314"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:35 -0700
X-CSE-ConnectionGUID: twNCcypoTI2QDX26HEPVBw==
X-CSE-MsgGUID: n7yIuaFLRiafbQWBp0S4UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77278454"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 20:09:36 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v1 0/5] drm/xe/sriov: Don't migrate dmabuf BO to System RAM
 while running in VM
Date: Fri, 11 Oct 2024 19:40:22 -0700
Message-ID: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
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

While testing [1] and [2] with a SRIOV enabled dGPU, it was noticed
that migrating a BO to System RAM before exporting it as a dmabuf
results in considerable performance degradation while running in a
Guest VM. For example, running a simple 3D app such as weston-simple-egl
would yield ~50 FPS instead of ~59 FPS, assuming a mode of 1920x1080@60.

One fix to this problem is to not migrate the BO and keep it in VRAM
during export. However, given that the GPU running in PF mode on the
Host cannot effectively access the PCI BAR addresses backing the
imported dmabuf BO, they need to be translated into LMEM addresses
(DPA) to enable this use-case to work properly.

With this patch series applied, it would become possible to display
(via Qemu GTK UI) Guest VM compositor's framebuffer (created in its LMEM)
on the Host without having to make any copies of it or a roundtrip
to System RAM. And, weston-simple-egl can now achieve ~59 FPS while
running with Gnome Wayland in the Guest VM.

[1] https://lore.kernel.org/dri-devel/20240813035509.3360760-1-vivek.kasireddy@intel.com/
[2] https://lore.kernel.org/dri-devel/20240624065552.1572580-1-vivek.kasireddy@intel.com/

Patchset overview:

Patch 1: PCI driver patch to not block P2P DMA between VF and PF
Patch 2: Prevent BO migration to System RAM while running in VM
Patch 3: Helper function to get VF's starting address in LMEM
Patch 4-5: Create new SG for VRAM based dmabuf BO to hold translated
           LMEM addresses

This series is tested using the following method:
- Run Qemu with the following relevant options:
  qemu-system-x86_64 -m 4096m ....
  -device vfio-pci,host=0000:03:00.1
  -device virtio-vga,max_outputs=1,blob=true,xres=1920,yres=1080
  -display gtk,gl=on
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine memory-backend=mem1 ...
- Run Gnome Wayland with the following options in the Guest VM:
  # cat /usr/lib/udev/rules.d/61-mutter-primary-gpu.rules
  ENV{DEVNAME}=="/dev/dri/card1", TAG+="mutter-device-preferred-primary", TAG+="mutter-device-disable-kms-modifiers"
  # XDG_SESSION_TYPE=wayland dbus-run-session -- /usr/bin/gnome-shell --wayland --no-x11 &

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (5):
  PCI/P2PDMA: Don't enforce ACS check for functions of same device
  drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
  drm/xe/pf: Add a helper function to get a VF's starting address in
    LMEM
  drm/xe/bo: Create a new sg for dmabuf BOs that are associated with a
    VF
  drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs

 drivers/gpu/drm/xe/xe_bo.c                 | 108 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h           |   6 ++
 drivers/gpu/drm/xe/xe_dma_buf.c            |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  23 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   5 +-
 drivers/pci/p2pdma.c                       |  12 ++-
 include/linux/pci.h                        |   1 +
 8 files changed, 158 insertions(+), 7 deletions(-)

-- 
2.45.1

