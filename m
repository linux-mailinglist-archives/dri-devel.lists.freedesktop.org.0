Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21C379C292
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 04:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E63310E37A;
	Tue, 12 Sep 2023 02:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9554510E2EB;
 Tue, 12 Sep 2023 02:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694485041; x=1726021041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yWcR6Dlyf5b8vnnuAOLlHrXy00me4TLW6vNKDFJRIwM=;
 b=hTDZ/feBys3ZFObpf7cFNxwaoLOCxGo00QfT47sUr4lJPn6FSdg8rGRo
 4TFMPAeQe0hmmu3uVjdm+hoe5G2Z2R8YDZOjEJxvGL07RoHS9GjQdJFHZ
 fowo+cm+9ysuRQ6DQ9TOt3kXuaMYwLPtzr6aWQTi4coVVyYQXtSqjVsRi
 vaczfH9aHzoIOkK7d7la7a5YuD1ly+m6xtEKOIRUx72F72/J/NUGmycbf
 n1pyTNSMjX0cS/D3G+vcw1TVoxjTh3HLwXY8tW44joKQZ5Kg1wuWVLcsU
 5iXhpIn800DrsUm4jjxfKhUTwAowxIAfynU0G7vVEV+z8LyUO4v6qMxxh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377172589"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="377172589"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917255584"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="917255584"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 19:16:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/sched: Add helper to set TDR timeout
Date: Mon, 11 Sep 2023 19:16:12 -0700
Message-Id: <20230912021615.2086698-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912021615.2086698-1-matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
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
 ketil.johnsen@arm.com, mcanal@igalia.com, Liviu.Dudau@arm.com,
 luben.tuikov@amd.com, lina@asahilina.net, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
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
index 9dbfab7be2c6..689fb6686e01 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -426,6 +426,24 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
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
index 5d753ecb5d71..b7b818cd81b6 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -596,6 +596,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-- 
2.34.1

