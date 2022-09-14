Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E95B905F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 00:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD6410EA10;
	Wed, 14 Sep 2022 22:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6524010EA10;
 Wed, 14 Sep 2022 22:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663193081; x=1694729081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1xrco0Aflh85IeWHAaJgIUxZJlQeD1IPivU8FCPK/Vk=;
 b=Bs1Q+2II73wCG1XqWZczX1tDvI5f0MqdGM7q9yg2jYDnfWW+QjFvVyV2
 n4FAHY8yKowMAQYb+jV8nxeXu2xBT1EgGbToQBxKGplL/i+nuyP46kgXs
 vxuqZEfU7eP1OEjVB2XVITZeIbYXz4j+jXS94+8nOJPkzq6cau/Q1/bYQ
 V1oLwq07xYJ7q/uD2mMTJPnBcaS5Py/oq0F11jcuJv3X/WIXIIaWlWIn3
 ZWozeCDVWdcVlhOiOYNcsNgxVB4W6k+CfI8BpRSyabM7ItFVfRqkpI/4U
 bDZTdo6zqBETqyJHjBo+ExX6cVpLKhVXTrNWUbb+u/B4qbzVdYYuzyI+/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278280795"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="278280795"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 15:04:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="647570931"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 15:04:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915: Make GEM suspend all GTs
Date: Wed, 14 Sep 2022 15:04:26 -0700
Message-Id: <20220914220427.3091448-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914220427.3091448-1-matthew.d.roper@intel.com>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Walk all GTs when suspending.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
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

