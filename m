Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D79EB45CCE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225D510EBF0;
	Fri,  5 Sep 2025 15:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY12Ubh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5EC10EBEE;
 Fri,  5 Sep 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757087117; x=1788623117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZA3KuiUrCXrGL+kA3QY+rg/vAplHfhJkpg1VyzIApQU=;
 b=YY12Ubh570G62glnaCH6yUoAr9WWmWJAFSVgr8vHY9hnVvam4KDiS2/Y
 7f90UoxnlLqBCvOYSZfgcDPlOfwFP1hTuw/zSrb1AQrmiRo1pp2WoSFRA
 ipVQO+6+Y+hBH6+cHSPNbfX5TUIhDS8lk50lKAXKgXOLoliPs5lLS/LJu
 j2ZPSWLpfqx2h7o0/FrOJZjfqnsPLjyeJtviceRXaJynG9GYQb80J7EFE
 39tO/SNRE0pHmpSY489KmMHRDAn3g30QBL/NKrkaBg5X59K1Nk5aPVQod
 qmTXIvPGAXefC5TOHZpB5XeNzww4aqNq5VoHS9lVpttW0R90chMwnTR5U g==;
X-CSE-ConnectionGUID: jJ6a+rp7Tm69rnPq3R2BiQ==
X-CSE-MsgGUID: pFcpjT2XRL+0sy6MMZf05w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70144624"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="70144624"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:17 -0700
X-CSE-ConnectionGUID: ZLfsiy5bQHiMHsIcKKRT/g==
X-CSE-MsgGUID: 0mrTalSGTiSvVcPGDy7MPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172071699"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:45:13 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, mika.westerberg@linux.intel.com,
 lucas.demarchi@intel.com, karthik.poosa@intel.com
Subject: [PATCH v9 0/9] Introducing firmware late binding
Date: Fri,  5 Sep 2025 21:19:44 +0530
Message-Id: <20250905154953.3974335-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

Introducing firmware late binding feature to enable firmware loading
for the devices, such as the fan controller and voltage regulator,
during the driver probe.
Typically, firmware for these devices are part of IFWI flash image but
can be replaced at probe after OEM tuning.

v2:
 - Dropped voltage regulator specific code as binaries for it will not
   be available for upstreaming as of now.
 - Address review comments
v3:
 - Dropped fwctl patch for now
 - Added new patch to extract binary version
 - Address v2 review comments
v4:
 - Address v3 review comments
v5:
 xe_kmd:
 - Dropped mutex is worker flush in unbind blocking component
   removal while fw download is in progress
 - Handled the fw load in all 3 scenarios (probe, system resume, rpm resume)
   by holding rpm wake ref in outer bounds of worker.
 mei:
 - Most of the review comments
v6:
 - rebased
 - Disabled fw load upon error
v7:
 xe_kmd:
 - resolved kernel doc warnings
 mei:
 - Address v6 review comments (greg kh)
v8:
 - https://lore.kernel.org/intel-xe/20250710150831.3018674-11-rodrigo.vivi@intel.com
v9:
 mei:
 - The MEI patches underwent internal review, as requested by Greg in v8.
 xe_kmd:
 - Rebased, Address review comments

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (7):
  drm/xe/xe_late_bind_fw: Introduce xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  drm/xe/xe_late_bind_fw: Extract and print version info

 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c            |  41 ++
 drivers/gpu/drm/xe/xe_device.c             |   5 +
 drivers/gpu/drm/xe/xe_device_types.h       |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 464 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h       |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  75 ++++
 drivers/gpu/drm/xe/xe_pci.c                |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h          |   1 +
 drivers/gpu/drm/xe/xe_pm.c                 |   8 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++
 drivers/misc/mei/Kconfig                   |  13 +
 drivers/misc/mei/Makefile                  |   1 +
 drivers/misc/mei/bus.c                     |  13 +
 drivers/misc/mei/mei_lb.c                  | 312 ++++++++++++++
 include/drm/intel/i915_component.h         |   1 +
 include/drm/intel/intel_lb_mei_interface.h |  70 ++++
 include/linux/mei_cl_bus.h                 |   1 +
 18 files changed, 1097 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/mei_lb.c
 create mode 100644 include/drm/intel/intel_lb_mei_interface.h

-- 
2.34.1

