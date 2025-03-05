Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95401A50B2E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 20:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2989CB3;
	Wed,  5 Mar 2025 19:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nv/iJB9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD24789CC4;
 Wed,  5 Mar 2025 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741201953; x=1772737953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2y0IAQJOIHSlN2JegxVzy7R+8p+B5tU9ch8652S01Js=;
 b=Nv/iJB9fWG36P4t4NIXWDvE3Q/TWc1oNy7z5S8Opd+UC1ltX9HpMla0g
 YP81l84QI2j1uB1qZQHzk26WL7X7rYVoKUO6LL3NA6stkhNwU87jVV6l2
 ujSAa1GEwxE0ZrZRMzRViVOUCrKizFEcf/mLO1QsDorFaH1vEyKcdfpuQ
 y/LLHcZrvbt8CX6i6wslRCN8B7pWPCM/6UzpcL1Uto3Ts0azDmaM1KrQn
 YvGw9zRQcXiYlKzunNpYyrz0SWxZ/q/KHR5DWWSPwp6OD0haBnsyCTWxG
 UZChCmZDtA36TmB0PXIN2nWm3VCHk5F/9pEwcL9bnuj0yOAalA8mIYp7v w==;
X-CSE-ConnectionGUID: eqw325dXTX6TYAh/JSVnzw==
X-CSE-MsgGUID: jiqeRyliQ2Kmfgp2XP5ItA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46110889"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="46110889"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:33 -0800
X-CSE-ConnectionGUID: 26HK2nPTT46N4F2gK4LWDQ==
X-CSE-MsgGUID: +Pk2PL7eR7qgpglMjzADoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118803046"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.58])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:12:29 -0800
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
Subject: [PATCH v3 3/4] drm/i915: Fix asymmetry in PMU register/unregister
 step order
Date: Wed,  5 Mar 2025 20:11:12 +0100
Message-ID: <20250305191152.164615-9-janusz.krzysztofik@linux.intel.com>
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

To simplify i915_driver_unregister() code, make sure reverts of driver
registration steps executed before potentially unsuccessful device
registration are symmetrically called after drm_dev_unplug().  There is
one case that doesn't follow that rule, introduced by commit b46a33e271ed
("drm/i915/pmu: Expose a PMU interface for perf queries"), with no
justification for asymmetry provided in commit description, then assumed
not intentional.

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d865e90f54704..7980bb880c7dc 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -689,20 +689,17 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
 		intel_gt_driver_unregister(gt);
 
 	if (!dev_priv->do_unregister)
-		goto do_pmu;
+		goto do_unplug;
 
 	i915_hwmon_unregister(dev_priv);
 
 	i915_perf_unregister(dev_priv);
-do_pmu:
-	i915_pmu_unregister(dev_priv);
-	if (!dev_priv->do_unregister)
-		goto do_unplug;
 
 	i915_teardown_sysfs(dev_priv);
 do_unplug:
 	drm_dev_unplug(&dev_priv->drm);
 
+	i915_pmu_unregister(dev_priv);
 	i915_gem_driver_unregister(dev_priv);
 }
 
-- 
2.48.1

