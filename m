Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860FC8BCC9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 21:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBCD10E6F0;
	Wed, 26 Nov 2025 20:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFYtJ4h4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F1510E68E;
 Wed, 26 Nov 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764188361; x=1795724361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQGssfzCUYwNZK0I6rlvV9RXLC97b76HeBHLA9yVfUU=;
 b=GFYtJ4h4YfQ5mYRiQ/F8rsSgn2/GejfVSm46acQmJWUBEKEdd9Sf2kHo
 vE6+0+cquE37v/OxHbYCc1t77i+2GazaSDP51ZcAHB7EPRRhRJG/02QeS
 kYE6nDDUGg497iZmNLts0HL1Y07su7lUXfGQGY0petuLByfzNKhTc+E+z
 vFsD20prf3dzTHep+vyKs4L8fnuxWaZdDT+0U3Rjpm6Hk0CmCdX+ga0yH
 4s3kjUQIzqX4Ad8v4Idxsuz3STZzPG2Ii8x4+U+fmeDudbm0Q+ScVSVTT
 US3DWuHZLWvYHbPeIECPPFhmHqJsetWscF15SqXfQWp3ZwdyC1rm6EtGF A==;
X-CSE-ConnectionGUID: mDu1dkiLRoeJKLIfdwlT3A==
X-CSE-MsgGUID: eyYWadomQvyvklPIV3DrUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76864164"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76864164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:21 -0800
X-CSE-ConnectionGUID: xhw0FNpzRHSlaFYk6dPuSg==
X-CSE-MsgGUID: XrtxA9JvSzK4yzsPmrAc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193137295"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:19:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 3/8] drm/xe: Add dedicated message lock
Date: Wed, 26 Nov 2025 12:19:11 -0800
Message-Id: <20251126201916.618996-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126201916.618996-1-matthew.brost@intel.com>
References: <20251126201916.618996-1-matthew.brost@intel.com>
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
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       | 5 +++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       | 4 ++--
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h | 2 ++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f91e06d03511..f4f23317191f 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -77,6 +77,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
@@ -117,7 +118,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
@@ -131,7 +132,7 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 			   struct xe_sched_msg *msg)
 {
-	lockdep_assert_held(&sched->base.job_list_lock);
+	lockdep_assert_held(&sched->msg_lock);
 
 	list_add(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index c7a77a3a9681..dceb2cd0ee5b 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -33,12 +33,12 @@ void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
 
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

