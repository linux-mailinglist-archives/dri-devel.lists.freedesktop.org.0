Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D064C7DC4D7
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 04:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19EE10E3F0;
	Tue, 31 Oct 2023 03:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E04510E3E8;
 Tue, 31 Oct 2023 03:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698722695; x=1730258695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKEhkrxCQeFQbvyuX0QhUphWRmaBpLUeUBV8qDhgtNw=;
 b=B7DBL8HDRIN2dQO8pOUpZSXIVPQ6zxWLgA89/uXdsEpsPipGcbK2j8rk
 ofhdTlGqfJpHV/64eIEHf6Qi5tjjvRj8xIFdJA1wDQ/itI6i3m+v24wI7
 dbPuQ/DKGEHiRmHSLD5jktGks0YyajTQZHDBc4DUt3sBMfcs7h3vP21Uf
 9OxlMUdlG42yI4cME3mWtVF/NIq6aLW16+37flgzzSjHbCp2OZkYvSlVM
 RRino3x0C7gyKzODxT4XXKFYkreKo/bWVwbsmIuW+a1jK82+BJ9gN62Bs
 EuIkQiZA7E9wTvr4pGQne86m+xeiGaTwVKJZNnL16DxC98DzA8oVsJSqh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392069065"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="392069065"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1661001"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v8 4/5] drm/sched: Add drm_sched_start_timeout_unlocked helper
Date: Mon, 30 Oct 2023 20:24:38 -0700
Message-Id: <20231031032439.1558703-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031032439.1558703-1-matthew.brost@intel.com>
References: <20231031032439.1558703-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 Luben Tuikov <luben.tuikov@amd.com>, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, boris.brezillon@collabora.com,
 dakr@redhat.com, donald.robson@imgtec.com, lina@asahilina.net,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also add a lockdep assert to drm_sched_start_timeout.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3b1b2f8eafe8..fc387de5a0c7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -334,11 +334,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
  */
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
+	lockdep_assert_held(&sched->job_list_lock);
+
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
 		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
+static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
@@ -451,11 +460,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (status != DRM_GPU_SCHED_STAT_ENODEV)
+		drm_sched_start_timeout_unlocked(sched);
 }
 
 /**
@@ -581,11 +587,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (full_recovery)
+		drm_sched_start_timeout_unlocked(sched);
 
 	drm_sched_wqueue_start(sched);
 }
-- 
2.34.1

