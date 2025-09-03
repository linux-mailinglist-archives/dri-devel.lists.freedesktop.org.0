Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0AB42CD9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 00:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF9A10E95D;
	Wed,  3 Sep 2025 22:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UipkUImw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346F310E953;
 Wed,  3 Sep 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756938968; x=1788474968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kohQ631vlaEFsIcaPjgepfsA48teOGkz5mTzfHsaQfk=;
 b=UipkUImwnE/x/cPlQohF6TvZEmptj6c9NIf3Z90WU6b5UH8QzU0J1H6H
 A9heY46FZxoxUHuWqeLO418k9Qg8O8EgxZPbUm879OcKu084QhVrLMX+j
 A5TOXVID5fS9akp7WJiXJ4Hn9Az3GGwB9TE5kQ5oK6NpiWteZsaQz/Ieb
 tnJNcTb+HA811x84QAmwKGVxURgkjsVSfue4aCXgZG0C4Q9LyDm2bPcGr
 cII1NV95NqdXzbCfnF/nxec6A4L95Dm9bfVBTscB7E4u0M23MEcJEegQ6
 Sd/fQIL0mpDxdjmiWewPo/H9dG3LcUrF9t6OX+89dCWLPAYyLAQgriL4w Q==;
X-CSE-ConnectionGUID: 3wzfGisVTq6K8wtkAYGP/Q==
X-CSE-MsgGUID: QljyHMIYSP+ukQ9Yal+lug==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76715631"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76715631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:08 -0700
X-CSE-ConnectionGUID: dvqe6zUpRAKz0tTEINAAbQ==
X-CSE-MsgGUID: Hmprsgg+QwCa1IVfEggdng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202570667"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 15:36:07 -0700
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
Subject: [PATCH v3 0/5] drm/xe/sriov: Don't migrate dmabuf BO to System RAM
 while running in VM
Date: Wed,  3 Sep 2025 15:30:53 -0700
Message-ID: <20250903223403.1261824-1-vivek.kasireddy@intel.com>
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
would yield ~50 FPS instead of ~59 FPS, assuming a mode of
1920x1080@60.

So, fix this issue by not migrating the BO and keep it in LMEM
during export. However, since the GPU running in PF mode on the
Host cannot effectively access the PCI BAR addresses backing the
imported dmabuf BO, they need to be translated into LMEM addresses
(DPAs) to enable this use-case to work properly.

With this patch series applied, it would become possible to display
(via Qemu GTK UI) Guest VM compositor's framebuffer (created in its
LMEM) on the Host without having to make any copies of it or a
costly roundtrip to System RAM. And, weston-simple-egl can now
achieve ~59 FPS while running with Gnome Wayland in the Guest VM.

Changelog:
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
  -device vfio-pci,host=0000:03:00.1
  -device virtio-vga,max_outputs=1,blob=true,xres=1920,yres=1080
  -display gtk,gl=on
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine memory-backend=mem1 ...
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
  drm/xe/dmabuf: Don't migrate BO to System RAM while running in VF mode
  drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
  drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with
    VFs
  drm/xe/pt: Add an additional check for dmabuf BOs while doing bind

 drivers/gpu/drm/xe/xe_bo.c                 | 98 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo_types.h           | 12 +++
 drivers/gpu/drm/xe/xe_dma_buf.c            |  9 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 23 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c                 |  7 ++
 drivers/pci/p2pdma.c                       | 18 +++-
 7 files changed, 163 insertions(+), 5 deletions(-)

-- 
2.50.1

