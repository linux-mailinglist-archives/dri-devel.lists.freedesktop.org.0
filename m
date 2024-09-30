Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A178989BBA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7514E10E3B4;
	Mon, 30 Sep 2024 07:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KcsHX4NM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8297410E3BC;
 Mon, 30 Sep 2024 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681999; x=1759217999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sl6Qv8wOCtprWGv2/+M1HJjrHpTQPyogDzqG/JnxWnc=;
 b=KcsHX4NM97jBUZaKU8zINU5v733oNdNRSgp1mP4uqL17YRN0N/7CkLoC
 PtbKuTXg8udUXtOzm9g20tWzcW5CEHP//AZ/3tX4DKUgbXtVTbUGULOd+
 Goy1Rgy0besVF1smYklUzB8GYXR4jIWjj/abvM2+HiTfpPm41MMafbFZ2
 34aQzZGLQT89x1GUqwtW+pVDCQlfk5iLE0eNRRV5yt96cKzoWOq9OSJ8F
 wvaKXu3YiUX4dPijp70rlYdueKyg3WDM5uFQvmMSb9gXq1YTvA86G+RoJ
 Q6EcBMQv/d2jIK4GJH6S3Lgnd3bLUUuIb1N7gB0hQkbEOJWQ4ghqkXIJh w==;
X-CSE-ConnectionGUID: MmgkMwuiRgOsqfnGKBU28A==
X-CSE-MsgGUID: fq5L/kSeSlKT0WgNGU0z8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315523"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:59 -0700
X-CSE-ConnectionGUID: hKsre1f4TCWB1TBWmBPQ5w==
X-CSE-MsgGUID: n/16mOQaQGW+WCpR5FkaKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797481"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:53 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 5/5] drm/i915: Use device wedged event
Date: Mon, 30 Sep 2024 13:08:45 +0530
Message-Id: <20240930073845.347326-6-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930073845.347326-1-raag.jadav@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
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

Now that we have device wedged event provided by DRM core, make use
of it and support both driver rebind and bus-reset based recovery.
With this in place, userspace will be notified of wedged device on
gt reset failure.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 ++
 drivers/gpu/drm/i915/i915_driver.c    | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 8f1ea95471ef..02f357d4e4fb 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1418,6 +1418,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged_event(&gt->i915->drm, DRM_WEDGE_RECOVERY_BUS_RESET);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index fe905d65ddf7..389d9fc67eeb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -711,6 +711,15 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 			 "DRM_I915_DEBUG_RUNTIME_PM enabled\n");
 }
 
+static void i915_setup_wedge_recovery(struct drm_i915_private *i915)
+{
+	struct drm_device *dev = &i915->drm;
+
+	/* Support both driver rebind and bus-reset based recovery. */
+	set_bit(DRM_WEDGE_RECOVERY_REBIND, &dev->wedge_recovery);
+	set_bit(DRM_WEDGE_RECOVERY_BUS_RESET, &dev->wedge_recovery);
+}
+
 static struct drm_i915_private *
 i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
@@ -812,6 +821,7 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	enable_rpm_wakeref_asserts(&i915->runtime_pm);
 
+	i915_setup_wedge_recovery(i915);
 	i915_welcome_messages(i915);
 
 	i915->do_release = true;
-- 
2.34.1

