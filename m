Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F342A6DCD82
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 00:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54A510E3C4;
	Mon, 10 Apr 2023 22:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4B10E2F2;
 Mon, 10 Apr 2023 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681166116; x=1712702116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ceOzRxEppzb5XCd1akrW+qDZafkp656Azou4gzH6q2E=;
 b=AMZaRdiGBkyd6J/DhT+C52moKFayyx3FZaXzkqDZF/Hj0I+brrgKTowe
 HL7pVMj2/GMq5B+l+lCato3qRJL23jrLUlImz2Z5F0PQ8SPkNqNZgA7lW
 5xHhdqUCt+jm0Ooi3Ct+yED9GgwyN2ysJ34jwbC4JLnrxc/nbLqekuWrq
 +IJf82UM13hYOjH12UdBUNMvbnoCAVGOHXN+s5ppnt4oFPrJe0NJBUYaI
 AtlZIH6ep7dtgWB/i21I3WETjvIP3T+frsmsxByp06yMBl916GaB7YGd+
 bTioj8ZWTdHxemu08R8R9LHWNaOja4zP9mK3gDhlXpssicmZdZoH/qdAD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="342233896"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="342233896"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="777682136"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="777682136"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 15:35:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/hwmon: Block waiting for GuC reset to complete
Date: Mon, 10 Apr 2023 15:35:09 -0700
Message-Id: <20230410223509.3593109-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
References: <20230410223509.3593109-1-ashutosh.dixit@intel.com>
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

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 38 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9ab8971679fe3..8471a667dfc71 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -51,6 +51,7 @@ struct hwm_drvdata {
 	char name[12];
 	int gt_n;
 	bool reset_in_progress;
+	wait_queue_head_t waitq;
 };
 
 struct i915_hwmon {
@@ -395,16 +396,41 @@ hwm_power_max_read(struct hwm_drvdata *ddat, long *val)
 static int
 hwm_power_max_write(struct hwm_drvdata *ddat, long val)
 {
+#define GUC_RESET_TIMEOUT msecs_to_jiffies(2000)
+
+	int ret = 0, timeout = GUC_RESET_TIMEOUT;
 	struct i915_hwmon *hwmon = ddat->hwmon;
 	intel_wakeref_t wakeref;
-	int ret = 0;
+	DEFINE_WAIT(wait);
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
+		if (!timeout) {
+			ret = -ETIME;
+			break;
+		}
+
+		mutex_unlock(&hwmon->hwmon_lock);
+
+		timeout = schedule_timeout(timeout);
 	}
+	finish_wait(&ddat->waitq, &wait);
+	if (ret)
+		goto unlock;
+
 	wakeref = intel_runtime_pm_get(ddat->uncore->rpm);
 
 	/* Disable PL1 limit and verify, because the limit cannot be disabled on all platforms */
@@ -508,6 +534,7 @@ void i915_hwmon_power_max_restore(struct drm_i915_private *i915, bool old)
 	intel_uncore_rmw(hwmon->ddat.uncore, hwmon->rg.pkg_rapl_limit,
 			 PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
 	hwmon->ddat.reset_in_progress = false;
+	wake_up_all(&hwmon->ddat.waitq);
 
 	mutex_unlock(&hwmon->hwmon_lock);
 }
@@ -784,6 +811,7 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 	ddat->uncore = &i915->uncore;
 	snprintf(ddat->name, sizeof(ddat->name), "i915");
 	ddat->gt_n = -1;
+	init_waitqueue_head(&ddat->waitq);
 
 	for_each_gt(gt, i915, i) {
 		ddat_gt = hwmon->ddat_gt + i;
-- 
2.38.0

