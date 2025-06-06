Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B59AD07C8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 19:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CC610E145;
	Fri,  6 Jun 2025 17:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou413BN8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F372E10E044;
 Fri,  6 Jun 2025 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749232422; x=1780768422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UAGeH5P6BXlYuZ4hnsGEDvQhc8IZhq2khBp04Ju08Rs=;
 b=Ou413BN8pLYo63rTb+2faihdKmFLicRmsvMWKSvw3d41/B/oTYq3VhGK
 X0KbeAvC6RDYabiW2XCBLSV67aGeMCn2aX15jkN/s+1CKpU9+oa5GNriR
 LkA8KXI8LEHaflzkVqgqPskhon436LkbZM+icc5oxDts4a8EP5wB5Pwcb
 qu56avIIRpCwDCYvL759hxh6nfSUe7U+ahrCPA9ja879k3zkpN72qiarY
 A3T3AzCRoGbhQzBfnbZTaXKz1CPzQt/R4JsoRty6tmRDFVjESg22L+6ga
 ucxktsDWbgQxzmk5+9oy2AUTLG6gUKCj/38mm8jOF9CPEzKXRdZuF4VY8 w==;
X-CSE-ConnectionGUID: PRAwUhhjTze6XLOXWKUq2w==
X-CSE-MsgGUID: iHPfmU9nRwCKNseu3GAEVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51486760"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51486760"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:53:36 -0700
X-CSE-ConnectionGUID: vGSwHOW0SLeqEZ3wSAk7Wg==
X-CSE-MsgGUID: TfnntLySTF6Y8UcEEgBRBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="145787069"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:53:34 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v2 00/10] Introducing firmware late binding
Date: Fri,  6 Jun 2025 23:26:57 +0530
Message-Id: <20250606175707.1403384-1-badal.nilawar@intel.com>
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

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (7):
  drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  [CI]drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI Do not
    review

Rodrigo Vivi (1):
  {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 .../userspace-api/fwctl/xe_pcode_fwctl.rst    |  17 +
 drivers/gpu/drm/xe/Kconfig                    |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 300 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  84 +++++
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 212 +++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
 drivers/gpu/drm/xe/xe_pm.c                    |   9 +
 drivers/misc/mei/Kconfig                      |   1 +
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/bus.c                        |  13 +
 drivers/misc/mei/late_bind/Kconfig            |  12 +
 drivers/misc/mei/late_bind/Makefile           |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c    | 261 +++++++++++++++
 include/drm/intel/i915_component.h            |   1 +
 include/drm/intel/late_bind_mei_interface.h   |  37 +++
 include/linux/mei_cl_bus.h                    |   1 +
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_pcode.h                 |  82 +++++
 25 files changed, 1133 insertions(+)
 create mode 100644 Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h
 create mode 100644 include/uapi/fwctl/xe_pcode.h

-- 
2.34.1

