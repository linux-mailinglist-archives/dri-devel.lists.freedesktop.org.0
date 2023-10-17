Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C01527CC717
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 17:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1061510E30C;
	Tue, 17 Oct 2023 15:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5439A10E305;
 Tue, 17 Oct 2023 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697555378; x=1729091378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oRblEkvFnZSBS0jyD/7sV4PXb6dVSnwnOEVPOs1zpEY=;
 b=YXZYq9/I+OcT11wihZGvszhqeHPMGWm/yD3/OlDa51VFsVd+tJOSoWfn
 GIghxJMoBM6TkBL09Klh3qhJO9cc7QAGk8V318B5WnBd2kUQf4WR6GPEa
 p0ic8OySQMShskArBtFrz8VFWzZcffi4lThZ/txhZ1/GWdGLCfPMnDsb2
 zUavAO/Cj7gFDxxOeuG8IBReVR4/YnhSjcsJjHM2PgZM2RyE2m4dvTMpw
 TjW9kS5H5I/MRrKEq7XLHYuNHupJipctC4a3cxlrT1kXNiIoIhaPhSauj
 yOuCcd7Yf3Qen5AMCAq9toAHZ9ENMNo6VGpPKhhlr86vZ/8IaHlIcMASx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388665148"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388665148"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791257581"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791257581"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v6 6/7] drm/sched: Add drm_sched_start_timeout_unlocked helper
Date: Tue, 17 Oct 2023 08:09:57 -0700
Message-Id: <20231017150958.838613-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017150958.838613-1-matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
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
index b1b8d9f96da5..ff2cfad54342 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -427,11 +427,20 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
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
@@ -544,11 +553,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
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
@@ -674,11 +680,8 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
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

