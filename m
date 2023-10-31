Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E427DC4D8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 04:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600C10E3EB;
	Tue, 31 Oct 2023 03:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5D10E3E8;
 Tue, 31 Oct 2023 03:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698722696; x=1730258696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VddqtxxaXR/lC8/tsZnMfTuif317JW2iAjBR/Ky+FCE=;
 b=Qrn87QD7h9OrF9HnOMf7ZQUe8z/Ry7S7UEGdscUg24yjqmgwhG1R899+
 sTi9WnS4rFPlLvYaF5aToV24I/kS0h6Z/69t48DnJwcLI/9tUuvru1LpQ
 9uc3k4GyPHTHUmTYe4cqNof1HHn/LqW4eGDFIYfWnKGZ9Tsp/QQmNGwjX
 SyoUiVheOhUF7q82Hp5b1nRdDHdcPxSHUtLx64mh3uNopzmZ6G10vJgqX
 5o5TDSZCg3P8vNEnGCjp9rnn1/bTpkshP/AX9TOPQV7Tl+kngSX9xjpAn
 NAZG8thcQt/3JX06iMo461Y2rfwyEXuiPC895O1QJbL4ykcSe8ElfsbLe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392069077"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="392069077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1661006"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:24:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v8 5/5] drm/sched: Add a helper to queue TDR immediately
Date: Mon, 30 Oct 2023 20:24:39 -0700
Message-Id: <20231031032439.1558703-6-matthew.brost@intel.com>
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

Add a helper whereby a driver can invoke TDR immediately.

v2:
 - Drop timeout args, rename function, use mod delayed work (Luben)
v3:
 - s/XE/Xe (Luben)
 - present tense in commit message (Luben)
 - Adjust comment for drm_sched_tdr_queue_imm (Luben)
v4:
 - Adjust commit message (Luben)

Cc: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 18 +++++++++++++++++-
 include/drm/gpu_scheduler.h            |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index fc387de5a0c7..98b2ad54fc70 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -338,7 +338,7 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
 }
 
 static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
@@ -348,6 +348,22 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
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
index 677ba96759ab..c1565694c0e9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -556,6 +556,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
 bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
-- 
2.34.1

