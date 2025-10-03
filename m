Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC8BB8094
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 22:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260C910E972;
	Fri,  3 Oct 2025 20:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tw60n0Ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1406D10E96A;
 Fri,  3 Oct 2025 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759522322; x=1791058322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Oee+KZ0/D0DqYLLwolgrDMkvpMLCl1AUdkl1+jan30=;
 b=Tw60n0IbsxvfrS6Higmmvw19BeN5PJ3IqkMXd//QC9vR41ZN4E/3me6r
 K9dmRfYlrAXqsa5pQJC8330QJ4tAhhAlmys8edgizoR8KoJCOTIKEcFam
 psWIeS0oI1gLYcbp0hVnz+gSQhHFj9AB3x5wDZYPOGSLjFWs/vrSvbMUR
 a+jsz0Dxi0crM/q42Lp1Yi/ef/Xkw+n7OUKHO0b3RtcZQKdvlxiHLspcJ
 KiZOim+NeuRjbYH1AVWAb1AaSVB/2irf6a8GgikHv8Ix+hYB8R4mkfsop
 7hv5+cy6W+8GmGO1AgvQf/DBDg12+tAPvpi21q993/DWRqvA+JFlXGIZm Q==;
X-CSE-ConnectionGUID: LBMOTSuQQOKKCGNyrkX/Jw==
X-CSE-MsgGUID: 6UieDjGXRPOxga175SFSKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87265217"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="87265217"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
X-CSE-ConnectionGUID: 0Hy+MykbT8u0ADvufIOqnA==
X-CSE-MsgGUID: PCVkB703Q96n3RYV4x9vHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178656985"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 13:12:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com,
	pstanner@redhat.com,
	dakr@kernel.org
Subject: [RFC PATCH v2 3/4] drm/xe: Add dedicated message lock
Date: Fri,  3 Oct 2025 13:11:55 -0700
Message-Id: <20251003201156.1995113-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003201156.1995113-1-matthew.brost@intel.com>
References: <20251003201156.1995113-1-matthew.brost@intel.com>
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

Stop abusing DRM scheduler job list lock for messages, add dedicated
message lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 3 ++-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 455ccaf17314..bfd1aebe70e6 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
@@ -130,7 +131,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index e548b2aed95a..04f85c4f7e80 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -32,12 +32,12 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
-	spin_lock(&sched->base.job_list_lock);
+	spin_lock(&sched->msg_lock);
 }
 
 static inline void xe_sched_msg_unlock(struct xe_gpu_scheduler *sched)
 {
-	spin_unlock(&sched->base.job_list_lock);
+	spin_unlock(&sched->msg_lock);
 }
 
 static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 6731b13da8bb..63d9bf92583c 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -47,6 +47,8 @@ struct xe_gpu_scheduler {
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
 	struct list_head			msgs;
+	/** @msg_lock: Message lock */
+	spinlock_t				msg_lock;
 	/** @work_process_msg: processes messages */
 	struct work_struct		work_process_msg;
 };
-- 
2.34.1

