Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F55BA335
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 01:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB4610EC19;
	Thu, 15 Sep 2022 23:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F189310EC16;
 Thu, 15 Sep 2022 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663284421; x=1694820421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PYtD+E/vSPis7wOIecLUjsBiB0SZeZOJgiCiWGSMUo4=;
 b=DK3wpy7eDRPHG0jjiv2kW2wZigxoOVvADEUisoTBCQkIIULf3gNcjgcm
 /OJ2AwkWNRm6g7NAuHfFdI4GGf2hsoXrNlCxKwMuDlYE5rVGe/riXE2mt
 xC2kC1c1aSTtXlIWNu5hDOxKHg497BMEvr82Z6pjOuekzQoPyky2sui32
 hvNDbsfRCnNFRz4LOjCwcFUgRaxZXsIrUM/XWyIb+pJHlz7adXQp+/TSd
 AsfC3qKV4g3ET9ux7WIVEKYj8PjKl2itOelnMN/7gSAve0g/XCib6xzrq
 jpQc3Z3DMyRUEhvdnyRv+ewV+ud/EV1nPr64YGYOixBAdqnC+Tb0BhVP6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="299689110"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="299689110"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="685923305"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 16:26:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/i915: Make GEM suspend all GTs
Date: Thu, 15 Sep 2022 16:26:53 -0700
Message-Id: <20220915232654.3283095-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915232654.3283095-1-matthew.d.roper@intel.com>
References: <20220915232654.3283095-1-matthew.d.roper@intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Walk all GTs when suspending.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 2c80cc8362b6..e5bfb6be9f7a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -22,6 +22,9 @@
 
 void i915_gem_suspend(struct drm_i915_private *i915)
 {
+	struct intel_gt *gt;
+	unsigned int i;
+
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
 
 	intel_wakeref_auto(&to_gt(i915)->userfault_wakeref, 0);
@@ -36,7 +39,8 @@ void i915_gem_suspend(struct drm_i915_private *i915)
 	 * state. Fortunately, the kernel_context is disposable and we do
 	 * not rely on its state.
 	 */
-	intel_gt_suspend_prepare(to_gt(i915));
+	for_each_gt(gt, i915, i)
+		intel_gt_suspend_prepare(gt);
 
 	i915_gem_drain_freed_objects(i915);
 }
@@ -131,7 +135,9 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 		&i915->mm.purge_list,
 		NULL
 	}, **phase;
+	struct intel_gt *gt;
 	unsigned long flags;
+	unsigned int i;
 	bool flush = false;
 
 	/*
@@ -154,7 +160,8 @@ void i915_gem_suspend_late(struct drm_i915_private *i915)
 	 * machine in an unusable condition.
 	 */
 
-	intel_gt_suspend_late(to_gt(i915));
+	for_each_gt(gt, i915, i)
+		intel_gt_suspend_late(gt);
 
 	spin_lock_irqsave(&i915->mm.obj_lock, flags);
 	for (phase = phases; *phase; phase++) {
-- 
2.37.3

