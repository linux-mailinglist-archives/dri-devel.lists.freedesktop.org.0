Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE6B353CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339AE10E5C8;
	Tue, 26 Aug 2025 06:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIh0HS9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C617810E544;
 Tue, 26 Aug 2025 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756188516; x=1787724516;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u1PYRC+zf6clyrA+JUtzuS3Qss/6PdaOnYnCa+EqYa4=;
 b=hIh0HS9B+UsaxVrsKNLzuYxIKp2fHts7AAW54mp4QuiDYY7IdORloKB8
 4sum+uaEkgJSGUPnmyBS8ltc7FfLfVLdBFrkQU3Dv1+yx5dOoScZpHITb
 Alljgx07/FH838nttzQ8/HwaqSo8UOf9u3nleBNWw47g7k9NRh4MJ0RDf
 Xp6hJuM2DrG5s178SwigLphO7QSEZEc/l9fBwXBiQ/eWRAAoUrAtV8heg
 5Bm8DiJ3kEB4vGzDRmGnKsaR7KUSqYAMltPcFUOZpGUl2nauxxzbKhadD
 4wxmoETA4kpHJdnsxIwbXUtqJLYzunGzlyw4lh451eLPN6lAs2VijrLdO w==;
X-CSE-ConnectionGUID: 37h9Y2fBTSysPxSIaFCLeQ==
X-CSE-MsgGUID: G4jgyhuzR4utb8i8EEcwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58271897"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58271897"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:08:35 -0700
X-CSE-ConnectionGUID: K/AGJqQfTTmhVgpaPdStWQ==
X-CSE-MsgGUID: hzSmsG9/RcGaipC8o4nyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174756687"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:08:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH v9 00/10] Handle Firmware reported Hardware Errors
Date: Tue, 26 Aug 2025 12:04:07 +0530
Message-ID: <20250826063419.3022216-1-riana.tauro@intel.com>
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

Rev9: rebase

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

 Documentation/gpu/drm-uapi.rst                |  49 ++++-
 Documentation/gpu/xe/index.rst                |   1 +
 Documentation/gpu/xe/xe_device.rst            |  10 +
 Documentation/gpu/xe/xe_pcode.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                     |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h    |  20 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h         |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c               |   6 +-
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
 22 files changed, 512 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_device.rst
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

