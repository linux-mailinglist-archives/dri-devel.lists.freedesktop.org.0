Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49D9A59DC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 07:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD010E087;
	Mon, 21 Oct 2024 05:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECXiQTS8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3323510E087;
 Mon, 21 Oct 2024 05:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729489567; x=1761025567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LAWRuLZOMRnjYneUIFfPGrvR3icNvd4ynO0GWkl6RX0=;
 b=ECXiQTS8Zivp9kIDqP5RQfkHkZSsOg46fElYylaOn7nw25I6VFPJ2hEk
 TbiO8hRQwxLdxQTxJBuZ7gyiQSt2naIlSHHhZ02tCK8ZbWTZNT1ffaM0L
 DbCYK0q6XEocWnaB2d3t8w0waRCcCS81TuEtVTMfyN31mVJxmBpCYS5xC
 WsxTr1urTJMiBiVT2tPvZKyOkSZdQmkiL2hN3N7cp0cAabu1nXLi5m7Gx
 FXSkOUxVMN3WHGWHMgvf1g44eecfob2ZocQtXimhdUmJSJJiRPq4PIHf+
 gb2DRl/mbqSjgAK/l48u3kuJlNRCRGD1177Iie7oPv3f0279+ZRNjHhvg Q==;
X-CSE-ConnectionGUID: Yp/z7ne4RcWAHPE0+kPlng==
X-CSE-MsgGUID: oDpxo8EpTpea3lemoH3ewA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="40345938"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="40345938"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:06 -0700
X-CSE-ConnectionGUID: Bv89k6YESGOc6Bcb6/BL0Q==
X-CSE-MsgGUID: u0avAr4PTjSPjbAWUJKNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="110180204"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 22:46:05 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 0/5] drm/xe/sriov: Don't migrate dmabuf BO to System RAM
 while running in VM
Date: Sun, 20 Oct 2024 22:21:28 -0700
Message-ID: <20241021052236.1820329-1-vivek.kasireddy@intel.com>
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

One fix to this problem is to not migrate the BO and keep it in LMEM
during export. However, given that the GPU running in PF mode on the
Host cannot effectively access the PCI BAR addresses backing the
imported dmabuf BO, they need to be translated into LMEM addresses
(DPA) to enable this use-case to work properly.

With this patch series applied, it would become possible to display
(via Qemu GTK UI) Guest VM compositor's framebuffer (created in its LMEM)
on the Host without having to make any copies of it or a roundtrip
to System RAM. And, weston-simple-egl can now achieve ~59 FPS while
running with Gnome Wayland in the Guest VM.

Changelog:

v1 -> v2:
- Use a dma_addr array instead of SG table to store translated DMA
  addresses (Matt)
- Use a cursor to iterate over the entries in the dma_addr array
  instead of relying on SG iterator (Matt)
- Rebased and tested this series on top of [3] that introduces
  drm_pagemap_dma_addr and xe_res_first_dma/__xe_res_dma_next
  that this version relies on

[1] https://patchwork.freedesktop.org/series/131746/
[2] https://patchwork.freedesktop.org/series/135273/
[3] https://patchwork.freedesktop.org/series/137870/

Patchset overview:

Patch 1: PCI driver patch to unblock P2P DMA between VF and PF
Patch 2: Prevent BO migration to System RAM while running in VM
Patch 3: Helper function to get VF's backing object in LMEM
Patch 4-5: Create a new dma_addr array for LMEM based dmabuf BOs
	   to store translated addresses (DPAs)

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
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (5):
  PCI/P2PDMA: Don't enforce ACS check for functions of same device
  drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
  drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
  drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with
    VFs
  drm/xe/pt: Add an additional check for dmabuf BOs while updating PTEs

 drivers/gpu/drm/xe/xe_bo.c                 | 116 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h           |  11 +-
 drivers/gpu/drm/xe/xe_dma_buf.c            |   9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  23 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   8 +-
 drivers/pci/p2pdma.c                       |  17 ++-
 7 files changed, 172 insertions(+), 13 deletions(-)

-- 
2.45.1

