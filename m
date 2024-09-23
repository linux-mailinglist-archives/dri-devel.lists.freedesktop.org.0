Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4C97E52A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 05:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF39E10E369;
	Mon, 23 Sep 2024 03:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7pRj/fV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FE910E367;
 Mon, 23 Sep 2024 03:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727063967; x=1758599967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qZET6bH34bdgo7kUCnMJt1I/FomkDh6SVUhEX0kdyU4=;
 b=T7pRj/fVlvvDTguDA2UcD38K0b0pBzosDuwZSm0mww7BYiwq1f2p7smm
 FbPlmfOQ/q5t36Qy+K0Ix70YkRKKzdZ+6TOS1sYkurLVEMAiyGNtpLXSO
 54SIukkSKTDyhcZ1OpgcWaQHe9C/hhCksaat4mjL0qOxs3VwyDbuVNVIg
 Qobsg4Xf8PQLcHwRpqRfaRbMaL8ZuRTGitu7a/YsHjmoiei4GahWLQeHX
 xSYwDr/hK/qT+Q+NnpPtAy+VNsRXhdkebdU9BrTgOmz9lmzrlZZuaUQbK
 SFQZ+OZlWovR+vEDWEDDXYQZcBq+fJnWx23RRTG6exVvr649X+7gpmMj0 g==;
X-CSE-ConnectionGUID: I/xlFDESSaO+/NoH6Bg6+A==
X-CSE-MsgGUID: RyhI1l5qS22pjzJAgNutGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29718231"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="29718231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2024 20:59:27 -0700
X-CSE-ConnectionGUID: sdwObKmnQF2S0A1u4jaJJg==
X-CSE-MsgGUID: bWwODathQUWe9OV0WMjgLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="101667432"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa002.jf.intel.com with ESMTP; 22 Sep 2024 20:59:21 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 0/4] Introduce DRM device wedged event
Date: Mon, 23 Sep 2024 09:28:22 +0530
Message-Id: <20240923035826.624196-1-raag.jadav@intel.com>
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

This series introduces device wedged event in DRM subsystem and uses
it in xe and i915 drivers. Detailed description in commit message.

This was earlier attempted as xe specific uevent in v1 and v2.
https://patchwork.freedesktop.org/series/136909/

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)
v3: Generic re-implementation in DRM subsystem (Lucas)
v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)
    Change authorship to Raag (Aravind)
v5: Send recovery method with uevent (Lina)
    Expose supported recovery methods via sysfs (Lucas)
v6: Access wedge_recovery_opts[] using helper function (Jani)
    Use snprintf() (Jani)

Raag Jadav (4):
  drm: Introduce device wedged event
  drm: Expose wedge recovery methods
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 drivers/gpu/drm/drm_drv.c             | 41 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c           | 22 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 ++
 drivers/gpu/drm/i915/i915_driver.c    | 10 +++++++
 drivers/gpu/drm/xe/xe_device.c        | 17 +++++++++--
 drivers/gpu/drm/xe/xe_device.h        |  1 +
 drivers/gpu/drm/xe/xe_pci.c           |  2 ++
 include/drm/drm_device.h              | 24 ++++++++++++++++
 include/drm/drm_drv.h                 | 18 ++++++++++++
 9 files changed, 135 insertions(+), 2 deletions(-)

-- 
2.34.1

