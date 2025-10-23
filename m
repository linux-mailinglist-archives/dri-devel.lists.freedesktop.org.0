Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B8BFF130
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F66A10E875;
	Thu, 23 Oct 2025 04:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNPUfLlL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224D010E865;
 Thu, 23 Oct 2025 04:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192487; x=1792728487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X+jyQhAL1garEM/v4dWVjB27MltZCiKzUpXJKcqoGkI=;
 b=HNPUfLlL5oCZlX2opbsdXTCj2dEKJFSCos5n8CBf9eduSBD+RDTrDX6H
 dznQLFctv6iUKuxU3Re+/gFk18hwdPN6cLWScQHr03o1O/f0OchXXWk9T
 PUX93e8+moB1+DyRo385n6BMeF9nR7Xuq1bBhmRMgFaWBxi6v60Y89Uvy
 4S+AcTOX7/YIziprllRYxlpClqXEMtZyonzsVj8YFMlLJp0Rz/FRkzVqz
 5gxhuK97OiSytUQHLgeppf6rKZLPXw4d0AUz3zWylqkUrSahRGm57D2+E
 EkD18VrYxTJY8ZVbVxydh4fFJzqiP8CM7iILgmMcBxdTd8wiowJ/bBxp5 A==;
X-CSE-ConnectionGUID: zszOD7MRQXCNpxA6vR3mcA==
X-CSE-MsgGUID: tJfpSbo+SA6/vzp4iRbU7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391288"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391288"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
X-CSE-ConnectionGUID: XZ2xhH7uRA2uN73QCSrJqQ==
X-CSE-MsgGUID: 2oJ9HcQyQfijabHmhl2BcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="189175759"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:08:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com
Subject: [RFC PATCH 11/14] drm/xe: Disconnect the low hanging fences from Xe
 module
Date: Wed, 22 Oct 2025 21:07:57 -0700
Message-Id: <20251023040800.970283-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023040800.970283-1-matthew.brost@intel.com>
References: <20251023040800.970283-1-matthew.brost@intel.com>
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

Preempt, tlb invalidation, and OA fences now use embedded fence lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c                  | 5 +----
 drivers/gpu/drm/xe/xe_preempt_fence.c       | 3 +--
 drivers/gpu/drm/xe/xe_preempt_fence_types.h | 2 --
 drivers/gpu/drm/xe/xe_tlb_inval.c           | 5 +----
 drivers/gpu/drm/xe/xe_tlb_inval_types.h     | 2 --
 5 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index f901ba52b403..c8613bafb8db 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -111,8 +111,6 @@ struct xe_oa_config_bo {
 struct xe_oa_fence {
 	/* @base: dma fence base */
 	struct dma_fence base;
-	/* @lock: lock for the fence */
-	spinlock_t lock;
 	/* @work: work to signal @base */
 	struct delayed_work work;
 	/* @cb: callback to schedule @work */
@@ -1016,8 +1014,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	}
 
 	/* Point of no return: initialize and set fence to signal */
-	spin_lock_init(&ofence->lock);
-	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, NULL, 0, 0);
 
 	for (i = 0; i < stream->num_syncs; i++) {
 		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 7f587ca3947d..75f433aee747 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -145,9 +145,8 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 {
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
-	spin_lock_init(&pfence->lock);
 	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &pfence->lock, context, seqno);
+		       NULL, context, seqno);
 
 	return &pfence->base;
 }
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence_types.h b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
index 312c3372a49f..b54b5c29b533 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_preempt_fence_types.h
@@ -25,8 +25,6 @@ struct xe_preempt_fence {
 	struct xe_exec_queue *q;
 	/** @preempt_work: work struct which issues preemption */
 	struct work_struct preempt_work;
-	/** @lock: dma-fence fence lock */
-	spinlock_t lock;
 	/** @error: preempt fence is in error state */
 	int error;
 };
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..5c23e76b0241 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -133,7 +133,6 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	tlb_inval->seqno = 1;
 	INIT_LIST_HEAD(&tlb_inval->pending_fences);
 	spin_lock_init(&tlb_inval->pending_lock);
-	spin_lock_init(&tlb_inval->lock);
 	INIT_DELAYED_WORK(&tlb_inval->fence_tdr, xe_tlb_inval_fence_timeout);
 
 	err = drmm_mutex_init(&xe->drm, &tlb_inval->seqno_lock);
@@ -420,10 +419,8 @@ void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
 {
 	xe_pm_runtime_get_noresume(tlb_inval->xe);
 
-	spin_lock_irq(&tlb_inval->lock);
-	dma_fence_init(&fence->base, &inval_fence_ops, &tlb_inval->lock,
+	dma_fence_init(&fence->base, &inval_fence_ops, NULL,
 		       dma_fence_context_alloc(1), 1);
-	spin_unlock_irq(&tlb_inval->lock);
 	INIT_LIST_HEAD(&fence->link);
 	if (stack)
 		set_bit(FENCE_STACK_BIT, &fence->base.flags);
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
index 8f8b060e9005..80e893950099 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
@@ -104,8 +104,6 @@ struct xe_tlb_inval {
 	struct delayed_work fence_tdr;
 	/** @job_wq: schedules TLB invalidation jobs */
 	struct workqueue_struct *job_wq;
-	/** @tlb_inval.lock: protects TLB invalidation fences */
-	spinlock_t lock;
 };
 
 /**
-- 
2.34.1

