Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99153894E09
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA97210FB80;
	Tue,  2 Apr 2024 08:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRRQF4+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A65A10FB81;
 Tue,  2 Apr 2024 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712048176; x=1743584176;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BcpZ8LfWJgv4+dt5Te8A8V2XY751cmOifpHPQTlre4o=;
 b=MRRQF4+hmcyD1ZxmPxXx7Mab0rdKkNJZq+y98NMf1lP4F188jXWUuXBK
 s7I6bLi7BufbU3U4HGQSAm0QJS5pUS9hPwAY+u8zBrhCKont+Sedt7fZJ
 XDGg3zeNQEB9EHPlPiGpiTug/ikUb4XeOhu0YmqNPU16b+G7zJV+UO4oc
 4LNp0yU1gYQoCo+yxdNAyxPrxaITruPJzTLKuZP8KWlXocOSkYZfAaw3g
 qz/21mqukRT0bGnklrd/bzOtYrb603IIOQ2fCFnQ5/8m4mlhusnM8yA6m
 U8Bdv3a/Rm0InxiN1+uAUJ4ZFZpD5wL/8/WVndKOdRDkxLNEy7Qwhw3bh w==;
X-CSE-ConnectionGUID: Y33JE4FqRMSomE/No4nAvg==
X-CSE-MsgGUID: tgb8B350R1eyczermhKnZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18654768"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18654768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="49225961"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:13 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/xe: Support PCIe FLR
Date: Tue,  2 Apr 2024 14:28:55 +0530
Message-Id: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
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

