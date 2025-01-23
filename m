Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51246A1A6B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78510E206;
	Thu, 23 Jan 2025 15:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0zi2k7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D2110E206;
 Thu, 23 Jan 2025 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644976; x=1769180976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KWAMpzs+Lr32mpk5eO5dEjINHZ++mQLzpras+XWtHhc=;
 b=X0zi2k7mOCBHsAR3GPjKDz3wwmyzo7WJDAG3Q9d1ooFfS6g6l39TX5fC
 HSn7QYP8tFDhp2RMKmDIjt7g8VR+0D6qjoPsQxaWrMHBJRYRVtI4Vtcb7
 EVRTkRFOrQUPyJlM0AD064/zZ8IUWAMLtI3GkyIeFPNn9/TwkbNBdp8wO
 uWHz6+3loBW4FqgksdH2uNngH4sZYR/DjcxlH4cIBQC4HHponACCz8nAM
 nJ/Ja76wfIDeZOi+pv7EMKPZkl1JnathAk2oGZLNwrsuYayZo0cRkOrLX
 ezACOCUymVrMHxm+KWIz2fsFMHyFUnpyfyXOkbsOZm8044sxS2yLZ87JW A==;
X-CSE-ConnectionGUID: sQ40MgaOQr6VNnMX63RMqw==
X-CSE-MsgGUID: YQ/ddwWhQo6/zhHCAy5GlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49542426"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49542426"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:36 -0800
X-CSE-ConnectionGUID: B2tK7wA8Tumlhg+Rlmea1w==
X-CSE-MsgGUID: m1DrrfrrQnqIQzM04BTsNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108350329"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH 3/5] drm/sched: stop passing non struct drm_device to
 drm_err() and friends
Date: Thu, 23 Jan 2025 17:09:10 +0200
Message-Id: <fe441dd1469d2b03e6b2ff247078bdde2011c6e3.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1737644530.git.jani.nikula@intel.com>
References: <cover.1737644530.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The expectation is that the struct drm_device based logging helpers get
passed an actual struct drm_device pointer rather than some random
struct pointer where you can dereference the ->dev member.

Convert drm_err(sched, ...) to dev_err(sched->dev, ...) and
similar. This matches current usage, as struct drm_device is not
available, but drops "[drm]" or "[drm] *ERROR*" prefix from logging.

Unfortunately, there's no dev_WARN_ON(), so the conversion is not
exactly the same.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 69bcf0e99d57..e29af71d4b5c 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -92,7 +92,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 * the lowest priority available.
 		 */
 		if (entity->priority >= sched_list[0]->num_rqs) {
-			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
+			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
 						 (s32) DRM_SCHED_PRIORITY_KERNEL);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a48be16ab84f..d1c1f22fd1db 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -103,9 +103,9 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
 
-	drm_WARN_ON(sched, check_sub_overflow(sched->credit_limit,
-					      atomic_read(&sched->credit_count),
-					      &credits));
+	WARN_ON(check_sub_overflow(sched->credit_limit,
+				   atomic_read(&sched->credit_count),
+				   &credits));
 
 	return credits;
 }
@@ -130,9 +130,11 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 	/* If a job exceeds the credit limit, truncate it to the credit limit
 	 * itself to guarantee forward progress.
 	 */
-	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
-		     "Jobs may not exceed the credit limit, truncate.\n"))
+	if (s_job->credits > sched->credit_limit) {
+		dev_WARN(sched->dev,
+			 "Jobs may not exceed the credit limit, truncate.\n");
 		s_job->credits = sched->credit_limit;
+	}
 
 	return drm_sched_available_credits(sched) >= s_job->credits;
 }
@@ -790,7 +792,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		 * or worse--a blank screen--leave a trail in the
 		 * logs, so this can be debugged easier.
 		 */
-		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
+		dev_err(job->sched->dev, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
 	}
 
@@ -1280,7 +1282,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
 		/* This is a gross violation--tell drivers what the  problem is.
 		 */
-		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
 			__func__);
 		return -EINVAL;
 	} else if (sched->sched_rq) {
@@ -1288,7 +1290,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		 * fine-tune their DRM calling order, and return all
 		 * is good.
 		 */
-		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__);
 		return 0;
 	}
 
@@ -1343,7 +1345,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 Out_check_own:
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
-	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_sched_init);
-- 
2.39.5

