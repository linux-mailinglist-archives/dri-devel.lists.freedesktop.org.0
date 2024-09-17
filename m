Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6197AA90
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 06:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5C10E339;
	Tue, 17 Sep 2024 04:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSfrHoVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B94510E307;
 Tue, 17 Sep 2024 04:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726545825; x=1758081825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDHwYTD0WC4SEU1jX6R13ZEAdVrJxgdWKzuKbuWTqc0=;
 b=kSfrHoVGmrs/Yv8s/KWQF4fhlxFWZg9q24VJHdGkcxu1JwNBe6PuhvOI
 72dhY0xsXSgG7gAzuGJ4BRZzD8m008ZA4e4Rnfbgdgdz5EO/qnjasFQ06
 M8PYodUqQ1kgUK1begNkoBd68bCRJhVkBS4/ptHIw5yShmq13PGp1JUQO
 SzNYSSQ+WBYuztsIq6ZedVN2U++zzAdFLK48YQUsI78mfdR5ZzyDMf6M8
 ffVnRM5bqZtOrriA/POoMUSO6yhbpcDpUT7/OoJ5f/5MN/mvAVR7X0OQ/
 Nf7WFJica64NQ5wViZ8CifqnK7Ec6xF5OgVjCpaKvMHIHVfaQIloruDtP A==;
X-CSE-ConnectionGUID: U1dmwJqcTgy7YmtqaNNrXA==
X-CSE-MsgGUID: tVY7IiGHQ9WSMqIErT8AkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42865186"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42865186"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:03:44 -0700
X-CSE-ConnectionGUID: Khq1abFwQaKf34Pa2O+niA==
X-CSE-MsgGUID: 72Rf6eGYSwiliHsVc4S5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69168605"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 21:03:39 -0700
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
Subject: [PATCH v5 4/4] drm/i915: Use device wedged event
Date: Tue, 17 Sep 2024 09:32:35 +0530
Message-Id: <20240917040235.197019-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917040235.197019-1-raag.jadav@intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
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

Now that we have device wedged event supported by DRM core, make use
of it. With this in place, userspace will be notified of wedged device
on gt reset failure.

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
index fe905d65ddf7..0185fb41eb95 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -711,6 +711,15 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
 			 "DRM_I915_DEBUG_RUNTIME_PM enabled\n");
 }
 
+static void i915_setup_wedge_recovery(struct drm_i915_private *i915)
+{
+	struct drm_device *dev = &i915->drm;
+
+	/* Support both driver rebind and bus reset based recovery. */
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

