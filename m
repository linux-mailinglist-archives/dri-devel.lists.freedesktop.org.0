Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA398A7E71
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4086C1132D8;
	Wed, 17 Apr 2024 08:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MotPJIYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662CB1132D4;
 Wed, 17 Apr 2024 08:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713343147; x=1744879147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=emMdFkrC5r4ruzXdsqFBsCQjKL+6q7YTiU1V9tF0HXc=;
 b=MotPJIYpi6PIPfwlEiEtgBcFQ5MJYtT0ddopDqQ7PtVulo2wFHtgn+ze
 ybMWRxpS2Yw+FSY4qgPmWqCr0/sNtDlM/1qt1v2nxD4oFuyJWafwHsk5q
 V3U7GUHFY3EZXQXhwRSXMEzRRFx3wiOUYC4GO9OxtC7pMgMI5RJ86AhF3
 qcny+h1lLyp84dy+jIaVmGnhLNJboCw8RdNDyVJ3IFZl6ohtg82WO6ZZK
 5KesmWK3irD17Hqcn0bhq7uKZ9HFPfRfwma6sSWsa63U1kbacP2gYg8Oh
 Ki2PE+IVckIPYIX8YhHWZOUhnQ5VrapDFG3aKntkl4qDQKml6QKrUbTMe g==;
X-CSE-ConnectionGUID: eVDVvK3URKOFGgB/yvHvuA==
X-CSE-MsgGUID: NKdUvP4VT5a21xo6DHwsVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12660869"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12660869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:06 -0700
X-CSE-ConnectionGUID: 1AY5B1kfRnWUamaJ7vB2GA==
X-CSE-MsgGUID: FYeDyXsTRjSiOOo+PD9Xgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27338894"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:03 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 0/4] drm/xe: Support PCIe FLR
Date: Wed, 17 Apr 2024 14:11:41 +0530
Message-Id: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Resending by adding the r-b's and to get ack from DRM maintainers
for the first patch in the series.

PCI subsystem provides callbacks to inform the driver about a request to
do function level reset by user, initiated by writing to sysfs entry
/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
without the need to do unbind and rebind as the driver needs to
reinitialize the device afresh post FLR.

v2:
1. Directly expose the devm_drm_dev_release_action instead of introducing
a helper (Rodrigo)
2. separate out gt idle and pci save/restore to a separate patch (Lucas)
3. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

dmesg snip showing FLR recovery:

[  590.486336] xe 0000:4d:00.0: enabling device (0140 -> 0142)
[  590.506933] xe 0000:4d:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  590.542355] xe 0000:4d:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  590.578532] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
0x0000002000000000
[  590.578556] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  590.578560] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
[0x0000000000000000-1000000000], io range:
[0x0000202000000000-202fff000000]
[  590.578585] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  590.578589] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
[0x0000001000000000-2000000000], io range:
[0x0000203000000000-203fff000000]
[  590.578592] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
0x0000002000000000
[  590.578594] xe 0000:4d:00.0: [drm] Available VRAM:
0x0000202000000000, 0x0000001ffe000000
[  590.738899] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  590.889991] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  590.892835] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
minor 1
[  590.900215] xe 0000:9a:00.0: enabling device (0140 -> 0142)
[  590.915991] xe 0000:9a:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  590.957450] xe 0000:9a:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  590.989863] xe 0000:9a:00.0: [drm] VISIBLE VRAM: 0x000020e000000000,
0x0000002000000000
[  590.989888] xe 0000:9a:00.0: [drm] VRAM[0, 0]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  590.989893] xe 0000:9a:00.0: [drm] VRAM[0, 0]: DPA range:
[0x0000000000000000-1000000000], io range:
[0x000020e000000000-20efff000000]
[  590.989918] xe 0000:9a:00.0: [drm] VRAM[1, 1]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  590.989921] xe 0000:9a:00.0: [drm] VRAM[1, 1]: DPA range:
[0x0000001000000000-2000000000], io range:
[0x000020f000000000-20ffff000000]
[  590.989924] xe 0000:9a:00.0: [drm] Total VRAM: 0x000020e000000000,
0x0000002000000000
[  590.989927] xe 0000:9a:00.0: [drm] Available VRAM:
0x000020e000000000, 0x0000001ffe000000
[  591.142061] xe 0000:9a:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  591.293505] xe 0000:9a:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  591.295487] [drm] Initialized xe 1.1.0 20201103 for 0000:9a:00.0 on
minor 2
[  610.685993] Console: switching to colour dummy device 80x25
[  610.686118] [IGT] xe_exec_basic: executing
[  610.755398] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  610.771783] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  610.773542] [IGT] xe_exec_basic: starting subtest once-basic
[  610.960251] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
[  610.962741] [IGT] xe_exec_basic: exiting, ret=0
[  610.977203] Console: switching to colour frame buffer device 128x48
[  611.006675] xe_exec_basic (3237) used greatest stack depth: 11128
bytes left
[  644.682201] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  644.699060] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  644.699118] xe 0000:4d:00.0: preparing for PCIe FLR reset
[  644.699149] xe 0000:4d:00.0: [drm] removing device access to
userspace
[  644.928577] xe 0000:4d:00.0: PCI device went through FLR, reenabling
the device
[  656.104233] xe 0000:4d:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  656.149525] xe 0000:4d:00.0: [drm] Using GuC firmware from
xe/pvc_guc_70.20.0.bin version 70.20.0
[  656.182711] xe 0000:4d:00.0: [drm] VISIBLE VRAM: 0x0000202000000000,
0x0000002000000000
[  656.182737] xe 0000:4d:00.0: [drm] VRAM[0, 0]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  656.182742] xe 0000:4d:00.0: [drm] VRAM[0, 0]: DPA range:
[0x0000000000000000-1000000000], io range:
[0x0000202000000000-202fff000000]
[  656.182768] xe 0000:4d:00.0: [drm] VRAM[1, 1]: Actual physical size
0x0000001000000000, usable size exclude stolen 0x0000000fff000000, CPU
accessible size 0x0000000fff000000
[  656.182772] xe 0000:4d:00.0: [drm] VRAM[1, 1]: DPA range:
[0x0000001000000000-2000000000], io range:
[0x0000203000000000-203fff000000]
[  656.182775] xe 0000:4d:00.0: [drm] Total VRAM: 0x0000202000000000,
0x0000002000000000
[  656.182778] xe 0000:4d:00.0: [drm] Available VRAM:
0x0000202000000000, 0x0000001ffe000000
[  656.348657] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  656.507619] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  656.510848] [drm] Initialized xe 1.1.0 20201103 for 0000:4d:00.0 on
minor 1
[  665.754402] Console: switching to colour dummy device 80x25
[  665.754484] [IGT] xe_exec_basic: executing
[  665.805853] xe 0000:4d:00.0: [drm] GT0: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  665.819825] xe 0000:4d:00.0: [drm] GT1: CCS_MODE=0 config:00400000,
num_engines:1, num_slices:4
[  665.820359] [IGT] xe_exec_basic: starting subtest once-basic
[  665.968899] [IGT] xe_exec_basic: finished subtest once-basic, SUCCESS
[  665.969534] [IGT] xe_exec_basic: exiting, ret=0
[  665.981027] Console: switching to colour frame buffer device 128x48



Aravind Iddamsetty (4):
  drm: add devm release action
  drm/xe: Save and restore PCI state
  drm/xe: Extract xe_gt_idle() helper
  drm/xe/FLR: Support PCIe FLR

 drivers/gpu/drm/drm_drv.c            |  6 ++
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++
 drivers/gpu/drm/xe/xe_gt.c           | 31 +++++++---
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          | 57 +++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  6 +-
 drivers/gpu/drm/xe/xe_pci_err.c      | 93 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
 include/drm/drm_drv.h                |  2 +
 11 files changed, 205 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h

-- 
2.25.1

