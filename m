Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9968AC489
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9F411281E;
	Mon, 22 Apr 2024 06:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dh/808JE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A721311281E;
 Mon, 22 Apr 2024 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713768923; x=1745304923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PDkz9lOjbFcPCiVKYC2fqAKIeHNnUuNgw1R6bF4CXhc=;
 b=Dh/808JEA9kg3hyF321MOQcu0Fn9GxM2wbLctJeFVnODZiclNWIY5yLw
 m5JvalBGogQXPXPlhyfszZtnznGtJs5xgrJeHFVhvOPzC0a4s+aOYNtaP
 lWxg1BEc2FV+EFPoPawGZt/vdgqkDshbaDYu+BmpZOjtxgELoeOKmo74V
 t4RAXT0e+u/hlATke7vYPiTzte1rpnVzFZJH021Cpd3AfAK8oX0N/btTC
 wHAa8a9FfC2/rTnXdyYp+KjvDm9R58oFOKkykecWn2iHkxqdlq9/zYGC7
 xQklY4T9JLw4tf+WO+6JfjgM9ajaxKSabqNH9jRxv0cgZOkeZYs+Futmi g==;
X-CSE-ConnectionGUID: +s6ONWvQQZKc+esPTJJrtA==
X-CSE-MsgGUID: kfieOUdBQJOh9MWdnpgCdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20715503"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20715503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:22 -0700
X-CSE-ConnectionGUID: yzWdJnpLS4mlaB+mCIsrDQ==
X-CSE-MsgGUID: SHWea15HSWmG8/wCX/IPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28584488"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:18 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 0/4] drm/xe: Support PCIe FLR
Date: Mon, 22 Apr 2024 12:27:52 +0530
Message-Id: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
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

PCI subsystem provides callbacks to inform the driver about a request to
do function level reset by user, initiated by writing to sysfs entry
/sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
without the need to do unbind and rebind as the driver needs to
reinitialize the device afresh post FLR.

v4: add kernel-doc

v3: Trivial fix

v2:
1. Directly expose the devm_drm_dev_release_action instead of introducing
a helper (Rodrigo)
2. separate out gt idle and pci save/restore to a separate patch (Lucas)
3. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini

Rodrigo, retaining your r-b's since there are no functional changes.

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

 drivers/gpu/drm/drm_drv.c            | 13 ++++
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++
 drivers/gpu/drm/xe/xe_gt.c           | 28 +++++----
 drivers/gpu/drm/xe/xe_gt.h           |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
 drivers/gpu/drm/xe/xe_pci.c          | 57 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.h          |  6 +-
 drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
 include/drm/drm_drv.h                |  2 +
 11 files changed, 204 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h

-- 
2.25.1

