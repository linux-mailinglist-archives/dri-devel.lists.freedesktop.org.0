Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7614DEA76
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1D510ED56;
	Sat, 19 Mar 2022 19:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496A510E2E8;
 Sat, 19 Mar 2022 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647718953; x=1679254953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jU/aK/95X6rTDSeuxET9HUOTTCA6mU3z0tsc81rE3Yg=;
 b=kfh3Mh0ZLcx1xXVLeKlmuyU0CFZzm6eSDi8edSvo+ldBKDlNpXLlcZGc
 JcQF+omLNZq4biOBeCJ7PhPSTf2g7MGBMqQ9dfiCxauQsGAQT1I+iNPBy
 ozdjDW8lRKm7IprSLhd9aDETcB0wBJWcgGeHFbVaSSGwzgggYqRMbpufz
 L5sB1MlLjfUjac0WNC66zFZvNSqkLJoW0um58vyVdr9/9Ebkf4RQK6ElE
 QqRFe1ahNBX8BQ0wVwFKU4pv/8HJex9u40rjjKGTBkkHsq6H1jRjCusNN
 ekxiCjeebXyu6ygoqVDJL72UKdD/ZGb1DfDDNIsediXKTC4tKN4DnfSHV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282145184"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="282145184"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="600019683"
Received: from jpulito-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.255.231.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:32 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] Revert "drm/i915/gem: Almagamate clflushes on suspend"
Date: Sat, 19 Mar 2022 12:42:25 -0700
Message-Id: <20220319194227.297639-3-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220319194227.297639-1-michael.cheng@intel.com>
References: <20220319194227.297639-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 michael.cheng@intel.com, wayne.boyer@intel.com, daniel.vetter@ffwll.ch,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we are making i915 more architecture-neutral, lets revert this commit
to the previous logic [1] to avoid using wbinvd_on_all_cpus.

[1]. ac05a22cd07a ("drm/i915/gem: Almagamate clflushes on suspend")

Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 41 +++++++++++++++++---------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 00359ec9d58b..3f20961bb59b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -13,13 +13,6 @@
 #include "i915_driver.h"
 #include "i915_drv.h"
 
-#if defined(CONFIG_X86)
-#include <asm/smp.h>
-#else
-#define wbinvd_on_all_cpus() \
-	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
-#endif
-
 void i915_gem_suspend(struct drm_i915_private *i915)
 {
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
@@ -123,6 +116,13 @@ int i915_gem_backup_suspend(struct drm_i915_private *i915)
 	return ret;
 }
 
+static struct drm_i915_gem_object *first_mm_object(struct list_head *list)
+{
+	return list_first_entry_or_null(list,
+					struct drm_i915_gem_object,
+					mm.link);
+}
+
 void i915_gem_suspend_late(struct drm_i915_private *i915)
 {
 	struct drm_i915_gem_object *obj;
@@ -132,7 +132,6 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 		NULL
 	}, **phase;
 	unsigned long flags;
-	bool flush = false;
 
 	/*
 	 * Neither the BIOS, ourselves or any other kernel
@@ -158,15 +157,29 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
 	for (phase = phases; *phase; phase++) {
-		list_for_each_entry(obj, *phase, mm.link) {
-			if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
-				flush |= (obj->read_domains & I915_GEM_DOMAIN_CPU) == 0;
-			__start_cpu_write(obj); /* presume auto-hibernate */
+		LIST_HEAD(keep);
+
+		while ((obj = first_mm_object(*phase))) {
+			list_move_tail(&obj->mm.link, &keep);
+
+			/* Beware the background _i915_gem_free_objects */
+			if (!kref_get_unless_zero(&obj->base.refcount))
+				continue;
+
+			spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
+
+			i915_gem_object_lock(obj, NULL);
+			drm_WARN_ON(&i915->drm,
+			    i915_gem_object_set_to_gtt_domain(obj, false));
+			i915_gem_object_unlock(obj);
+			i915_gem_object_put(obj);
+
+			spin_lock_irqsave(&i915->mm.obj_lock, flags);
 		}
+
+		list_splice_tail(&keep, *phase);
 	}
 	spin_unlock_irqrestore(&i915->mm.obj_lock, flags);
-	if (flush)
-		wbinvd_on_all_cpus();
 }
 
 int i915_gem_freeze(struct drm_i915_private *i915)
-- 
2.25.1

