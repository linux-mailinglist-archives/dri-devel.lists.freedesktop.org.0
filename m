Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF05B2649E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DB210E14C;
	Thu, 14 Aug 2025 11:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uj1aFLC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5EC10E14C;
 Thu, 14 Aug 2025 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755172156; x=1786708156;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7SmLXDG2NFybikpSXYlSqjIn6xTq+yIa0+B18w30Qiw=;
 b=Uj1aFLC3jB5G15j4Ax9mDLWjc7VKKm+QwUAgXncEqH6mNCuIHVtRq7Rt
 G6hhSgeE5NmyOzc1ZQWaj1Wv4bCZ+Fq73LlUzwI+Xk7PQn8IfIuJ7BAq7
 bborsm4zATua14OJvE2/yj/BzktTzlw8niC21IW6/EklrvIKrbDWJHJh1
 V7qnGRcH9FfZyQdWKKMRxdwCbabSKgDxGmbbYlJUW01jnib6goDsIaXfk
 0PnkHsvPHhVLSXeLnvesUUg0suyT6g9qPEHbIz8bi8CadM8lE+srccw61
 c+UooOHMtUK20bHKJqPBALs7KEaoPP+WO2k37HeXw4VuQ9tIbUCrFukPv A==;
X-CSE-ConnectionGUID: kML0aweVQNexZ2Q8YmJBPg==
X-CSE-MsgGUID: akEdcxxaS7mshFp1HdYWjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57388409"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57388409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:16 -0700
X-CSE-ConnectionGUID: azIyCmSgQXuvylwyIA1o2w==
X-CSE-MsgGUID: ChvusjzTSZ+7GWl23jia6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="171967073"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 04:49:11 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v8 00/10] Handle Firmware reported Hardware Errors
Date: Thu, 14 Aug 2025 17:44:30 +0530
Message-ID: <20250814121448.3380784-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add support to handle firmware reported errors. When CSC firmware
errors are encoutered, a error interrupt is received by the GFX device as
a MSI interrupt. Device Source control registers indicates the source of the error
as CSC. The HEC error status register indicates that the error is firmware reported
Depending on the type of firmware error, the error cause is written to the HEC
Firmware error register. On encountering such CSC firmware errors, the device is unusable
and can be recovered only using firmware update.

Whenever Xe KMD detects such a firmware error, system administrator/userspace needs to be
notified to trigger a firmware flash. To address the above need, a new
recovery method is added to drm device wedged uevent.

The initial proposal to add 'firmware-flash' as a recovery method was
not applicable to other drivers and could cause multiple recovery
methods specific to vendors to be added.
A more generic 'vendor-specific' method is introduced in this series,
guiding users to refer to vendor specific documentation and system
logs, additonal indicators for detailed vendor specific recovery procedure.

It is the responsibility of the consumer to refer to the correct vendor
specific documentation and usecase before attempting a recovery.
For example: If driver is XE KMD, the consumer must refer
to the documentation of 'Xe Device Wedging' under 'Documentation/gpu/xe/'.

The necessity of a firmware flash in Xe KMD is notified to the user with a
combination of vendor-specific wedged uevent, runtime survivability
mode and dmesg logs. Consumer must check both uevent and runtime
survivability sysfs before triggering a firmware flash.

Udev

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent


KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=vendor-specific
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5973
MAJOR=226
MINOR=0


Dmesg:

xe 0000:03:00.0: [drm] *ERROR* [Hardware Error]: Tile0 reported NONFATAL error 0x20000
xe 0000:03:00.0: [drm] *ERROR* [Hardware Error]: NONFATAL: HEC Uncorrected FW FD Corruption error reported, bit[2] is set
xe 0000:03:00.0: Runtime Survivability mode enabled
xe 0000:03:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:03:00.0 as wedged.
               IOCTLs and executions are blocked. Only a rebind may clear the failure
               Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
xe 0000:03:00.0: [drm] device wedged, needs recovery
xe 0000:03:00.0: Firmware flash required, Please refer to the userspace documentation for more details!


Runtime survivability Sysfs:

/sys/bus/pci/devices/<device>/survivability_mode

Bspec: 50875, 53073, 53074, 53075, 53076

IGT: https://patchwork.freedesktop.org/patch/660122/
fwupd PR: https://github.com/fwupd/fwupd/pull/9024

Rev2: add a fault injection for csc errors
      fix review comments

Rev3: add a vendor-specific recovery method
      add support for runtime survivability mode
      enable runtime survivability mode when csc errors are reported

Rev4: refactor survivability code

Rev5: Add more documentation
      add user friendly logs
      remove checks for BMG if not necessary
      fix other review comments

Rev6: Use consistent words
      revert to include BMG checks

Rev7: fix cosmetic changes

Rev8: add more documentation

Riana Tauro (10):
  drm/xe: Add documentation for Xe Device Wedging
  drm: Add a vendor-specific recovery method to drm device wedged uevent
  drm/xe: Set GT as wedged before sending wedged uevent
  drm/xe: Add a helper function to set recovery method
  drm/xe/xe_survivability: Refactor survivability mode
  drm/xe/xe_survivability: Add support for Runtime survivability mode
  drm/xe/doc: Document device wedged and runtime survivability
  drm/xe: Add support to handle hardware errors
  drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
  drm/xe/xe_hw_error: Add fault injection to trigger csc error handler

 Documentation/gpu/drm-uapi.rst                |  47 ++++-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe_device.rst            |  10 +
 Documentation/gpu/xe/xe_pcode.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h    |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c                |  73 ++++++-
 drivers/gpu/drm/xe/xe_device.h                |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +
 drivers/gpu/drm/xe/xe_heci_gsc.c              |   2 +-
 drivers/gpu/drm/xe/xe_hw_error.c              | 182 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h              |  15 ++
 drivers/gpu/drm/xe/xe_irq.c                   |   4 +
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 167 ++++++++++++----
 drivers/gpu/drm/xe/xe_survivability_mode.h    |   5 +-
 .../gpu/drm/xe/xe_survivability_mode_types.h  |   8 +
 include/drm/drm_device.h                      |   4 +
 22 files changed, 509 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

