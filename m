Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78F65486A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BD310E5AC;
	Thu, 22 Dec 2022 22:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FED510E59F;
 Thu, 22 Dec 2022 22:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748120; x=1703284120;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=x5rHzdbpYSYe65Py16l/DZJ/6Ido7FuzqrYK7wK0hGw=;
 b=nL9qGhbcrQ6SiTRUwhoFGKpxe0N/s88wIvCHirMCZOecw18HQ4z6CwDD
 nYB9GGuI1ktEcn+2Dz1PduNcOtnwWwus2xXe2RtE2Q9qaousMFh+w2LIm
 q/yZapbrSj/pCOKMRlfvj/sL4D6WKxjQkFHfZs3+OIvkqW4XMzi9wV1jr
 vKsH1jB7BLwwSdN4/gd+8GYMuXTqJgshyn3LhA41xMQRl8TN20VA1AhPw
 KAmoaztP8hcPX3kNh3UQnH2g32dHP8e1vnowzJnSs5MNwqQdTVAqrzB5s
 D0exsYKyJhH1/uesCqzIs/sqregHmzlK9ZlwlvwbJ0vEeMJ1r7VcNTMhF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472854"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412316"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412316"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 08/20] drm/sched: Add helper to set TDR timeout
Date: Thu, 22 Dec 2022 14:21:15 -0800
Message-Id: <20221222222127.34560-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221222222127.34560-1-matthew.brost@intel.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
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
index fa25541bb477..bdf0541ad818 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -345,6 +345,24 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
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
index 31448deb9412..b9967af1788b 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -553,6 +553,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-- 
2.37.3

