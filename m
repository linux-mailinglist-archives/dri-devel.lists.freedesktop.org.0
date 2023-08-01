Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E176BEC2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9990210E432;
	Tue,  1 Aug 2023 20:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8D210E429;
 Tue,  1 Aug 2023 20:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690923074; x=1722459074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dd+fx2XJT/5S633RvpLfZ/sglev7L2POlqePydFod/g=;
 b=TwZcmgM/+lafCggaA4LCPBWjVzrpayZuJ1EkV5vBvqGWXCfOQy+Vg6wL
 jvOajcpxZOks6fGl6LpJwrsRbz9RkGe/lN+mLRbaWyUDEnWKWwGXR0KCd
 yT+hJ+hG0icliwXZDvOsxP5qP5VsIrPUlL85o7Vyh7daDW8tJ2N/1+qLc
 aHQhVTTAC3W45uBvMZrmikVzBZECBZg7KolpTaCQETLPNkF1F3T0wRwli
 flKBbEPs/T1JH02ImIegAlhqN1GMwihQtP02moTSnyHlsg7xqoTj5h3rz
 qf3V3DGWKDUTQAx30cx4bbZ/ln6x7tUHWYYv3joTeQb2hg0SdCQQx7nj+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373051785"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="373051785"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872215422"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 8/8] drm/sched: Add helper to set TDR timeout
Date: Tue,  1 Aug 2023 13:51:03 -0700
Message-Id: <20230801205103.627779-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801205103.627779-1-matthew.brost@intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
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
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper to set TDR timeout and restart the TDR with new timeout
value. This will be used in XE, new Intel GPU driver, to trigger the TDR
to cleanup drm_sched_entity that encounter errors.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 ++++++++++++++++++
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9573f13f8459..19ec0cb5caee 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -374,6 +374,24 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_set_timeout - set timeout for reset worker
+ *
+ * @sched: scheduler instance to set and (re)-start the worker for
+ * @timeout: timeout period
+ *
+ * Set and (re)-start the timeout for the given scheduler.
+ */
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
+{
+	spin_lock(&sched->job_list_lock);
+	sched->timeout = timeout;
+	cancel_delayed_work(&sched->work_tdr);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+EXPORT_SYMBOL(drm_sched_set_timeout);
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 267bd060d178..f4af856aebd9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -589,6 +589,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-- 
2.34.1

