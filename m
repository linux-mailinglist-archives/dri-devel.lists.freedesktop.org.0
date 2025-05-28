Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED9AC6B36
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB7910E5EB;
	Wed, 28 May 2025 14:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fL2+OEMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419F710E2CD;
 Wed, 28 May 2025 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748441110; x=1779977110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+b8oFQ+o3n4GVpZkSbmFKxukgJHOdKZ0BeU7RaJ1ok=;
 b=fL2+OEMjSWClt3iluBKvP6Nw4XilZSvoeMaAZh8npvBJ2uZTmMdI5Fj6
 ZxF+szFh1khVag54cUX+AohSn9wdwvnR6LpDyR7g6+8D7TZ92IDZVPCbZ
 tHF3EAec/RoYX8ecvRio+hhdHGrRQr7fdvzYMKcY1ouTHB72kDbeuw0Yk
 0awgJZ7BZKmLkz8y1h+sZWvc7uztoPljwp4VwLKTQ8eoLbu4AiOTxenLi
 ylMOgkITNE3CsJ1X7tr25tO0l9zN3FSNNRvU4WTA6FGJnDQOkdlrxgkXk
 Li0o/N+60dpjSUPG6ltcJvWZdgFDpjn9Fwq/OV24T/bsQz7BwZft4HYyu g==;
X-CSE-ConnectionGUID: zgXcr3IITaeWt1ieJFAihw==
X-CSE-MsgGUID: 1pBTQ7KrRp+f6fVDkpUR1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61524757"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61524757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:09 -0700
X-CSE-ConnectionGUID: T4slOBrWRYOzAaVlSgycZQ==
X-CSE-MsgGUID: qwiu8CfXTtaojvQo5zb2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143238784"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:05:04 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v11 00/10] mtd: add driver for Intel discrete graphics
Date: Wed, 28 May 2025 16:51:05 +0300
Message-ID: <20250528135115.2512429-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add driver for access to Intel discrete graphics card
internal NVM device.
Expose device on auxiliary bus by i915 and Xe drivers and
provide mtd driver to register this device with MTD framework.

This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
and "spi: add driver for Intel discrete graphics"
series with connection to the Xe driver and splitting
the spi driver part to separate module in mtd subsystem.

This series intended to be pushed through drm-xe-next.

V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
    Enable NVM device on Battlemage HW (xe driver patch)
    Fix overwrite register address (xe driver patch)
    Add Rodrigo's r-b

V3: Use devm_pm_runtime_enable to simplify flow.
    Drop print in i915 unload that was accidentally set as error.
    Drop HAS_GSC_NVM macro in line with latest Xe changes.
    Add more Rodrigo's r-b and Miquel's ack.

V4: Add patch that always creates mtd master device
    and adjust mtd-intel-dg power management to use this device.

V5: Fix master device creation to accomodate for devices without
    partitions (create partitoned master in this case)
    Rebase over latest drm-xe-next
    Add ack's
V6: Fix master device release (use rigth idr in release)
    Rebase over latest drm-xe-next
    Grammar and style fixes

V7: Add patch with non-posted erase support (fix hang on BMG)
    Rebase over latest drm-xe-next

V8: Create separate partition device under master device, if requested
    and configure parent of usual partitions to this partition.
    Rebase over drm-tip.

V9: Fix checkpatch warning on non-posted erase patch.
    Add Rodrigo's review and ack.

V10: Drop master device creation patch as it now in mtd-next.
     Drop power-management patch, it will be merged lately after
     master device patch is propagated.
     Rebase over drm-tip.

V11: Fix review comments.
     Add reviewed-by.
     Add cleanup in error path.
     Add PADDING region that exists on some BMG devices.

Alexander Usyskin (9):
  mtd: add driver for intel graphics non-volatile memory device
  mtd: intel-dg: implement region enumeration
  mtd: intel-dg: implement access functions
  mtd: intel-dg: register with mtd
  mtd: intel-dg: align 64bit read and write
  drm/i915/nvm: add nvm device for discrete graphics
  drm/i915/nvm: add support for access mode
  drm/xe/nvm: add on-die non-volatile memory device
  drm/xe/nvm: add support for access mode

Reuven Abliyev (1):
  drm/xe/nvm: add support for non-posted erase

 MAINTAINERS                           |   7 +
 drivers/gpu/drm/i915/Makefile         |   4 +
 drivers/gpu/drm/i915/i915_driver.c    |   6 +
 drivers/gpu/drm/i915/i915_drv.h       |   3 +
 drivers/gpu/drm/i915/i915_reg.h       |   1 +
 drivers/gpu/drm/i915/intel_nvm.c      | 121 ++++
 drivers/gpu/drm/i915/intel_nvm.h      |  15 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   6 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
 drivers/gpu/drm/xe/xe_nvm.c           | 167 ++++++
 drivers/gpu/drm/xe/xe_nvm.h           |  15 +
 drivers/gpu/drm/xe/xe_pci.c           |   6 +
 drivers/mtd/devices/Kconfig           |  11 +
 drivers/mtd/devices/Makefile          |   1 +
 drivers/mtd/devices/mtd_intel_dg.c    | 830 ++++++++++++++++++++++++++
 include/linux/intel_dg_nvm_aux.h      |  32 +
 19 files changed, 1236 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0

