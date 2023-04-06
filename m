Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B396D8E7D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 06:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752510E2BC;
	Thu,  6 Apr 2023 04:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE7710E2BC;
 Thu,  6 Apr 2023 04:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680756328; x=1712292328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6Q6gqp3ek+2oRnkd/AcroOqytDBL7ezNgEZ1yXn1VQ=;
 b=Lj8C3fM+PPzY0GtQY6I9Jq3YvVu2Xk8VWHDkEBizKCESxRNCsZGdmNfw
 1LXeYl0N1+WsYLDRKUqmAcCT8yKmdpYQOfqskB7ZNRe7jiLVDBYoB5/oK
 vvVm4LMJvXU/qzplX9/WIuJdUZNEIcqsqODkbAO9OJkdCaYogYI44qBYC
 3/0yfn5hk9V4Lo2rPMJIZJqc+TEoUm79aegbUjmyfpTD9mmK/6/GKw0rv
 Om6ZoxTwFx0ZIadOlBWjtuqFi2V2wZ+cKNSlXpVQ3daJ7HocVuB1kgVi7
 6Dy4v3ZJ1ntjot5gzDQzXdmeKUOFiwVfm736LyJcvrNJzHB9gIFgYABHZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345231906"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="345231906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 21:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830612090"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="830612090"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 21:45:27 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to complete
Date: Wed,  5 Apr 2023 21:45:22 -0700
Message-Id: <20230406044522.3108359-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
References: <20230406044522.3108359-1-ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of erroring out when GuC reset is in progress, block waiting for
GuC reset to complete which is a more reasonable uapi behavior.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9ab8971679fe3..4343efb48e61b 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -51,6 +51,7 @@ struct hwm_drvdata {
 	char name[12];
 	int gt_n;
 	bool reset_in_progress;
+	wait_queue_head_t wqh;
 };
 
 struct i915_hwmon {
@@ -400,10 +401,15 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 	int ret = 0;
 	u32 nval;
 
+retry:
 	mutex_lock(&hwmon->hwmon_lock);
 	if (hwmon->ddat.reset_in_progress) {
-		ret = -EAGAIN;
-		goto unlock;
+		mutex_unlock(&hwmon->hwmon_lock);
+		ret = wait_event_interruptible(ddat->wqh,
+					       !hwmon->ddat.reset_in_progress);
+		if (ret)
+			return ret;
+		goto retry;
 	}
 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
 
@@ -426,7 +432,6 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 			 PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
 exit:
 	intel_runtime_pm_put(ddat->uncore->rpm, wakeref);
-unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
 }
@@ -508,6 +513,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
 	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
 			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
 	hwmon->ddat.reset_in_progress = false;
+	wake_up_all(&hwmon->ddat.wqh);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 }
@@ -784,6 +790,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
 	ddat->gt_n = -1;
+	init_waitqueue_head(&ddat->wqh);
 
 	for_each_gt(gt, i915, i) {
 		ddat_gt = hwmon->ddat_gt + i;
-- 
2.38.0

