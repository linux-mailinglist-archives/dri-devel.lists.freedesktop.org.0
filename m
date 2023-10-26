Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174947D7B64
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C9010E754;
	Thu, 26 Oct 2023 04:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2A510E752;
 Thu, 26 Oct 2023 04:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698293531; x=1729829531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wXhRjD8bhY6NT+38KZgUuP1KP13tqPmUjPZ9sQ4u8U4=;
 b=HFd6MalepM2oNwA+94MjzTjQ0o0oWDuUFUMObof1fKunN6RUX9J8FAUZ
 ebFHApXZ0qHTM6oZ3PMsop+06wi8cNm2aATYmbbKVauRHpL0V6jK4KV9F
 7fSx6kD6kbNByJ8/G0Xcm7gE0IkB23teWep696E4Nr05WPi+imhkJ9qYe
 tmFl5VK6hZ4XeDBKR2mg3UJQjANN03aHjnoZtvoq7Jz1uglCyJsl5oWyJ
 WZG9iR+7qwzeRQm83KqSxUgXIkfl3dRQikg8ILZg3iXHyb/t6pwD41hZq
 fj8pF0p9bp4bQVpNhdYVvwQlHVADj9qLnXABS7qV2FNSlCZX9OYuKzHlM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377823052"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377823052"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762685142"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762685142"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v7 5/6] drm/sched: Add drm_sched_start_timeout_unlocked helper
Date: Wed, 25 Oct 2023 21:12:35 -0700
Message-Id: <20231026041236.1273694-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026041236.1273694-1-matthew.brost@intel.com>
References: <20231026041236.1273694-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
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
index 3d89420d4ffb..ae66cabc3162 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -385,11 +385,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
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
@@ -502,11 +511,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
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
@@ -632,11 +638,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
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

