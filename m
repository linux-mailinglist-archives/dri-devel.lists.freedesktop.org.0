Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F70AFBB7B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 21:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AAD10E54A;
	Mon,  7 Jul 2025 19:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8G0pTWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C413D10E546;
 Mon,  7 Jul 2025 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751915298; x=1783451298;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c2YSEl9vpj0ifOWacuvN26c2JZ5CqpHX/3EngJUDEFk=;
 b=H8G0pTWShrpOPDmYkCV6eYSGHesUHsNXs6Xo6OPuG2k9hqP8wVIF/RYo
 by2UIhhFKD9zIEpj8udYJ6J4ddHQD26QhKzsR5YGMcjRbOVlmmP6uTvy6
 l/ePyxCmgLjiK/lwwtJ1LiSkIsGsFmbF7+4Qur/i9ljtti+hO8itONwZ5
 Ldkjfn5CFNwSwui83keIwWfCxZc76VHTCh0TvWmZaAhIXoB7WCo0bLRV9
 Y4CVxtjqjei+vPbPlUAP7leVYNIctozg8ob19UpAofzXLAi5SnFWHLUQp
 fa3652tIXSL7py1aDSU3jRjBy3qvx/csmoeysmhu++Q+CDDj5OweVe9ZS g==;
X-CSE-ConnectionGUID: 2fdTgYfDQzWmLgbSUpT6+w==
X-CSE-MsgGUID: ZqvaJyW7Q/ugnPZJ65WDqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57945660"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57945660"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 12:08:18 -0700
X-CSE-ConnectionGUID: /UdWRQuIRNiJ/blY2CBWHQ==
X-CSE-MsgGUID: CVpw7KzwSq6txjP5igm8sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154707401"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 12:08:13 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v7 0/9] Introducing firmware late binding
Date: Tue,  8 Jul 2025 00:42:28 +0530
Message-Id: <20250707191237.1782824-1-badal.nilawar@intel.com>
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

 - Dropped patch 10

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (7):
  drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  drm/xe/xe_late_bind_fw: Extract and print version info

 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  41 ++
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 462 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  75 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   2 +
 drivers/gpu/drm/xe/xe_pci_types.h           |   1 +
 drivers/gpu/drm/xe/xe_pm.c                  |   8 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |  11 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/mei_late_bind.c            | 271 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  62 +++
 include/linux/mei_cl_bus.h                  |   1 +
 18 files changed, 1044 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

