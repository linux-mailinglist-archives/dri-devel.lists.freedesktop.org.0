Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC04AA1136
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C6910E4F7;
	Tue, 29 Apr 2025 16:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLNqS4V7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3F710E445;
 Tue, 29 Apr 2025 16:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745942879; x=1777478879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jmaiOe7fLU3Gpo+V1NMEb5UagHHjoLQVPW0tai2efZY=;
 b=MLNqS4V77tSo8zqzd/f2hQbc0hwwGefdpDQ399yE/pWMvfAOgB+99TFT
 10L7ZNWZEIG17xpTf5MiUMiVFgeryr1Z/E4bHpf8iXU5GmDuBLtC3tkLt
 PIQoaGbOMcwYLLTNoACcFnotYhjPYT7drUTgAcHUr4lnVFlhOMQcWjbMT
 EiX+yHa4LAfNAhuYBKgx5hRWtcZOCX0otahFmskY/+gfmT4lIgeiafhYu
 RjQFjRgfKQhEu27IE3avesiOQ6XSfQNn/PdwHgSqrs3NGFCjW1krWC+SA
 cBYU22SZhX+VUgUFHkl2PpAPKs9shzQ5cWFBv+5PUeCveIghg7ZNx0PE2 A==;
X-CSE-ConnectionGUID: CVmNhannQOqiRDlJ/FEB7w==
X-CSE-MsgGUID: m2mjYp0mR26mHDzfH2mXKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47585432"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47585432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 09:07:54 -0700
X-CSE-ConnectionGUID: LxeiSsi4SDKpD6mMtW5uRA==
X-CSE-MsgGUID: tUvUi/ojQ4KRUw7nEz/1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="139055896"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:07:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [RFC 0/9] Introducing firmware late binding
Date: Tue, 29 Apr 2025 21:39:47 +0530
Message-Id: <20250429160956.1014376-1-badal.nilawar@intel.com>
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

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (6):
  drm/xe/late_bind_fw: Introducing late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw in S2Idle/S3 resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding

Rodrigo Vivi (1):
  {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl

 Documentation/userspace-api/fwctl/index.rst   |   1 +
 drivers/gpu/drm/xe/Kconfig                    |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
 drivers/gpu/drm/xe/xe_device.c                |   7 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 289 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  97 ++++++
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 218 +++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
 drivers/gpu/drm/xe/xe_pm.c                    |   7 +
 drivers/misc/mei/Kconfig                      |   1 +
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/bus.c                        |  13 +
 drivers/misc/mei/late_bind/Kconfig            |  12 +
 drivers/misc/mei/late_bind/Makefile           |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c    | 261 ++++++++++++++++
 include/drm/intel/i915_component.h            |   1 +
 .../drm/intel/xe_late_bind_mei_interface.h    |  49 +++
 include/linux/mei_cl_bus.h                    |   1 +
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_pcode.h                 |  80 +++++
 24 files changed, 1134 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/xe_late_bind_mei_interface.h
 create mode 100644 include/uapi/fwctl/xe_pcode.h

-- 
2.34.1

