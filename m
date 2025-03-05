Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B28A50B31
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBB389EAC;
	Wed,  5 Mar 2025 19:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru2QB7GV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EBC89E2A;
 Wed,  5 Mar 2025 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741201956; x=1772737956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vkvnXL4bg4NjI5RXmjIIctMdmRH3UwfvRzkvPK0G34A=;
 b=Ru2QB7GV/6tJ4asqyIA+E5Y4c+FqIUMgPuUqfizHYGWFKbzSrWDTIziQ
 GaucA2ImX6P3AtkRHwOfeKctEoAVLUDnlk+a43woSIhLWebN0ZhLY9CMs
 DNV2UNNjPaqiQ4qduPC3d7tQ2cY0g6RoJCLtkwNDGlf2mnOjrPGxpI1C7
 yBFdY8v/ReRepRtcA/pMHe82RZCInn/esuh+PQAKg/L+3oddg8gnYWWKR
 xWvbZd3LU8u9eJ6VNBBIfLaON/3m55hx/JMg4IUc9M96JTLXfs1koIzjr
 mSizIAvs1yU7sWAyJq3Yhd1jCIpTWkzP0Gy6UQ5meHJokyNXA4OIxC2Zd g==;
X-CSE-ConnectionGUID: W2PkQdBTRt6jW3p4NSqbaw==
X-CSE-MsgGUID: XXURyJTBRNeKXhydwzwnDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46110895"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="46110895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:36 -0800
X-CSE-ConnectionGUID: FRCZmq1bSCO3Dka4VcPj4g==
X-CSE-MsgGUID: DFC6uqEzSRCODvSS6/FFKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118803083"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:33 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v3 4/4] drm/i915: Group not skipped unregister steps
Date: Wed,  5 Mar 2025 20:11:13 +0100
Message-ID: <20250305191152.164615-10-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
References: <20250305191152.164615-6-janusz.krzysztofik@linux.intel.com>
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

Further simplification of i915_driver_unregister() requires moving of two
steps, intel_pxp_fini() and intel_gt_driver_unregister(), down, e.g.,
right behind drm_dev_unplug().  Local testing hasn't revealed any issues
with that move, so go for it.

Former placement of intel_gt_driver_unregister() within
i915_driver_unregister() originated from commit 42014f69bb235f ("drm/i915:
Hook up GT power management") while its content has grown significantly
since its introduction.  Placement of intel_pxp_fini() originated from
commit f67986b0119c04 ("drm/i915/pxp: Promote pxp subsystem to top-level
of i915").

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 7980bb880c7dc..0a07de2a7734b 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -673,7 +673,7 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 	unsigned int i;
 
 	if (!dev_priv->do_unregister)
-		goto do_pxp_gt;
+		goto do_unplug;
 
 	i915_switcheroo_unregister(dev_priv);
 
@@ -682,15 +682,6 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 
 	intel_display_driver_unregister(display);
 
-do_pxp_gt:
-	intel_pxp_fini(dev_priv);
-
-	for_each_gt(gt, dev_priv, i)
-		intel_gt_driver_unregister(gt);
-
-	if (!dev_priv->do_unregister)
-		goto do_unplug;
-
 	i915_hwmon_unregister(dev_priv);
 
 	i915_perf_unregister(dev_priv);
@@ -699,6 +690,11 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 do_unplug:
 	drm_dev_unplug(&dev_priv->drm);
 
+	intel_pxp_fini(dev_priv);
+
+	for_each_gt(gt, dev_priv, i)
+		intel_gt_driver_unregister(gt);
+
 	i915_pmu_unregister(dev_priv);
 	i915_gem_driver_unregister(dev_priv);
 }
-- 
2.48.1

