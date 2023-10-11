Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793E7C614D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4834A10E3C6;
	Wed, 11 Oct 2023 23:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EBE10E3B7;
 Wed, 11 Oct 2023 23:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697068689; x=1728604689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WTPW8u7uX6qMG73qqsBTV+8yrJ8b6ac+yk4vDBp20tY=;
 b=XdM0atOy9u8Ho3SuOFtolrzc1K311e5s6HKAdVGE0Yk3dmB4poqaqRyT
 CmUkSWkBNWpu/704p72M3pUjrgx0Z5OskmEAieYYldffCi8AoXEK1ttQi
 UWouFCiNKQvIWSM56P7ydHdO+IFrGDpUQO8umGgH98jTkiF68BCARGNXp
 Sec9vpJFuhBe0jL5wzkHePx9OC8bfxIPeDgspupOgb/7TY0P8DaN/inWo
 bOKA6X2AH864KjiUm66dvnxOXGeArbDzRHPjHDBMxENTQD8Tu1jBC4yi9
 3PM9dWK2ZLiaDYPqr8e1hF1qKXSTT+wtjsZHedxLyeBQqU/mNMgwZ7Jdj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387637429"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="387637429"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824367803"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="824367803"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v5 7/7] drm/sched: Add helper to queue TDR immediately for
 current and future jobs
Date: Wed, 11 Oct 2023 16:58:26 -0700
Message-Id: <20231011235826.585624-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011235826.585624-1-matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
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

Add helper to queue TDR immediately for current and future jobs. This is
used in Xe, a new Intel GPU driver, to trigger a TDR to cleanup a
drm_scheduler that encounter errors.

v2:
 - Drop timeout args, rename function, use mod delayed work (Luben)
v3:
 - s/XE/Xe (Luben)
 - present tense in commit message (Luben)
 - Adjust comment for drm_sched_tdr_queue_imm (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c4d5c3d265a8..f2846745b067 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -431,7 +431,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -441,6 +441,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
 	spin_unlock(&sched->job_list_lock);
 }
 
+/**
+ * drm_sched_tdr_queue_imm: - immediately start job timeout handler
+ *
+ * @sched: scheduler for which the timeout handling should be started.
+ *
+ * Start timeout handling immediately for the named scheduler.
+ */
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	sched->timeout = 0;
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
+}
+EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
+
 /**
  * drm_sched_fault - immediately start timeout handler
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 625ffe040de3..998b32b8d212 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -568,6 +568,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-- 
2.34.1

