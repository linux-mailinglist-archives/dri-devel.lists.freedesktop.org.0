Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC2BAF5EF6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9A10E74E;
	Wed,  2 Jul 2025 16:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7vSOJYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9E10E74D;
 Wed,  2 Jul 2025 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751474875; x=1783010875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bJ/kR0mO6yP1Fm6QjMsMwfrHw2ayxOxCh+oR/JaHtAg=;
 b=B7vSOJYDR8oPIP4g0Cr2jDNcqtDrnj4HgByvaXiEAWF3nLrDaV25HYYA
 3SA4w/QNk9TdoMIKo0fEOXMsDKZYiM25Pw6Q+QZ4tu7qBpDXLwmI1fMHw
 k8MuqCPvGKT7uqmI+2tF+w4YMUm7EPZqOmMaSlk2SVSGtBst9H8e4hj1j
 pd1LoHienpUNGch6V7lej1BT+LQj/uAl9eHTEZRksTIvZ+mX7REkf0lVr
 9/KK3e1lF98U0tGAR2Qfk7AHjUq3N8vBxUpI6+1FggrLFmGQvv0c4N3TE
 mAb5nR4IKGiuWRZgeWXYWUKgU3wsQpXAFRH8YjUf67k1jxhCzl1UKkGhG w==;
X-CSE-ConnectionGUID: FTXsFRvvQzeCSdyygXcPuA==
X-CSE-MsgGUID: lmQ5Zw5YQGGci/hBQfCotA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380736"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64380736"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 09:47:55 -0700
X-CSE-ConnectionGUID: /Rwme+E6Tx+TW0jmpdo/qQ==
X-CSE-MsgGUID: 5nx2uR9uRJ++d9783IMXDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153535576"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:47:53 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: [PATCH v5 00/10] Introducing firmware late binding
Date: Wed,  2 Jul 2025 22:22:06 +0530
Message-Id: <20250702165216.557074-1-badal.nilawar@intel.com>
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

Alexander Usyskin (2):
  mei: bus: add mei_cldev_mtu interface
  mei: late_bind: add late binding component driver

Badal Nilawar (8):
  drm/xe/xe_late_bind_fw: Introducing xe_late_bind_fw
  drm/xe/xe_late_bind_fw: Initialize late binding firmware
  drm/xe/xe_late_bind_fw: Load late binding firmware
  drm/xe/xe_late_bind_fw: Reload late binding fw in rpm resume
  drm/xe/xe_late_bind_fw: Reload late binding fw during system resume
  drm/xe/xe_late_bind_fw: Introduce debug fs node to disable late
    binding
  drm/xe/xe_late_bind_fw: Extract and print version info
  drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI

 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  41 ++
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 454 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  77 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +
 drivers/gpu/drm/xe/xe_pm.c                  |   8 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 272 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  64 +++
 include/linux/mei_cl_bus.h                  |   1 +
 20 files changed, 1054 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

-- 
2.34.1

