Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D81ACC170
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBA510E693;
	Tue,  3 Jun 2025 07:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx6U+LFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFCB10E693;
 Tue,  3 Jun 2025 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748937010; x=1780473010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZJYaeE5TC1W3Kq06aoIbpItE49BrLlO0BYJge2i65XI=;
 b=nx6U+LFfS7IAByuxPRCa5/W7xAPFtjRQ7icC5fhsQqb/nrONRLMqWDsr
 zeeW/2kiM5eSVVLqHy5IpM77EWJQ36yw9PJ08GjjBguT850RXEZySFOCo
 O2V0JLR5UqwgBTui9KMcLa6AjVxRxScoFxZ0smH02iwx8IEjhfl6f6wyF
 CLE6mAlGl87WGVswfzNUsjRiSSyGaOflNAruqOtQqBdHWTRzGVQp9yaIL
 G6T7QRuFULX6+VbsW4t+ptNCs96Lu4fLZyP8RZULZNzVcDSkWevACPJxF
 hYFurei99AyYhfhF3ow6/IsJAfNhCz0fWqm8WhHgvUlGDN0eFiULwYjVI g==;
X-CSE-ConnectionGUID: 3w17jfBOTHWG62MSdSYF0g==
X-CSE-MsgGUID: 3esMb4r+QT6PDIe5Z4Wr1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="76356188"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="76356188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:10 -0700
X-CSE-ConnectionGUID: 4OHs5F6gSpe1tK0C6d2uSg==
X-CSE-MsgGUID: mE1WKtc/QmKOYri6+dqdJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="144671497"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.227.90.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 00:50:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, himal.prasad.ghimiray@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH 0/4]  Handle Firmware reported Hardware Errors
Date: Tue,  3 Jun 2025 13:43:56 +0530
Message-ID: <20250603081409.1509709-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add support to handle firmware reported errors. When CSC firmware
errors are encoutered, a error interrupt is received by the GFX device as
a MSI interrupt.

Device Source control registers indicates the source of the error as CSC
The HEC error status register indicates that the error is firmware reported
Depending on the type of firmware error, the error cause is written to the HEC
Firmware error register.

On encountering such CSC firmware errors, the graphics device is
non-recoverable from driver context. The only way to recover from these
errors is firmware flash.

Add a firmware flash method to the drm device wedged uevent. Send
this method along with the uevent to notify userspace of the wedged
state and the possible recovery method.

$ udevadm monitor --property --kernel
monitor will print the received events for:
KERNEL - the kernel uevent

KERNEL[754.709341] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
ACTION=change
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
SUBSYSTEM=drm
WEDGED=firmware-flash
DEVNAME=/dev/dri/card0
DEVTYPE=drm_minor
SEQNUM=5973
MAJOR=226
MINOR=0

Bspec: 50875, 53073, 53074, 53075, 53076

Riana Tauro (4):
  drm: Add a firmware flash method to device wedged uevent
  drm/xe: Add a helper function to set recovery method
  drm/xe: Add support to handle hardware errors
  drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors

 Documentation/gpu/drm-uapi.rst             |   6 +-
 drivers/gpu/drm/drm_drv.c                  |   2 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  20 +++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
 drivers/gpu/drm/xe/xe_device.c             |  30 +++-
 drivers/gpu/drm/xe/xe_device.h             |   1 +
 drivers/gpu/drm/xe/xe_device_types.h       |   5 +
 drivers/gpu/drm/xe/xe_hw_error.c           | 171 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_error.h           |  15 ++
 drivers/gpu/drm/xe/xe_irq.c                |   4 +
 include/drm/drm_device.h                   |   1 +
 13 files changed, 249 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h

-- 
2.47.1

