Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850CF6E99B7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 18:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C3110ECA6;
	Thu, 20 Apr 2023 16:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9303310E0DE;
 Thu, 20 Apr 2023 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682008849; x=1713544849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfQ6QTYGS/utgVu7drUR8+iwPsDuhc565pVwYueCQYo=;
 b=HkObsP+skX1zh4T/wmoXWwXuQ6eqeG/3usR9kWtja47x1rwykNISiYfN
 VAP1wPKKLnOapyDXpz07DoYaJnA84gx9Hl9yJCE9X+HhKQRzN/qjxoDzQ
 RobPnLJUb+V8qFeDeEbL6q12H83dnhVPT9xfKKBQdEpe+FTVZigd/qPL+
 4/pFxhiLIbhYG1OWxyKeeBI1E22uR8qX169PVtnB3Fdr6zBQ7lTbBTNt0
 gEOUM48XNHAv4P0UVDrBuhqDBoW+0iExstJ9NngOTsRbBZ/MP/ep+2BHP
 F2Hdmj0Veeg4qinbkILL6bA/RH6Qr1NOa4YIo1BLhMOCXd9BZBs8NxPjh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344540947"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="344540947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="724479590"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="724479590"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 09:40:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to complete
Date: Thu, 20 Apr 2023 09:40:41 -0700
Message-Id: <20230420164041.1428455-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230420164041.1428455-1-ashutosh.dixit@intel.com>
References: <20230420164041.1428455-1-ashutosh.dixit@intel.com>
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

v2: Avoid race between wake_up_all and waiting for wakeup (Rodrigo)
v3: Remove timeout when blocked (Tvrtko)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9ab8971679fe3..a3bdd9f68a458 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -51,6 +51,7 @@ struct hwm_drvdata {
 	char name[12];
 	int gt_n;
 	bool reset_in_progress;
+	wait_queue_head_t waitq;
 };
 
 struct i915_hwmon {
@@ -397,14 +398,32 @@ hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 {
 	struct i915_hwmon *hwmon = ddat->hwmon;
 	intel_wakeref_t wakeref;
+	DEFINE_WAIT(wait);
 	int ret = 0;
 	u32 nval;
 
-	mutex_lock(&hwmon->hwmon_lock);
-	if (hwmon->ddat.reset_in_progress) {
-		ret = -EAGAIN;
-		goto unlock;
+	/* Block waiting for GuC reset to complete when needed */
+	for (;;) {
+		mutex_lock(&hwmon->hwmon_lock);
+
+		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
+
+		if (!hwmon->ddat.reset_in_progress)
+			break;
+
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
+
+		mutex_unlock(&hwmon->hwmon_lock);
+
+		schedule();
 	}
+	finish_wait(&ddat->waitq, &wait);
+	if (ret)
+		goto unlock;
+
 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
 
 	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
@@ -508,6 +527,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
 	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
 			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
 	hwmon->ddat.reset_in_progress = false;
+	wake_up_all(&hwmon->ddat.waitq);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 }
@@ -784,6 +804,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
 	ddat->gt_n = -1;
+	init_waitqueue_head(&ddat->waitq);
 
 	for_each_gt(gt, i915, i) {
 		ddat_gt = hwmon->ddat_gt + i;
-- 
2.38.0

