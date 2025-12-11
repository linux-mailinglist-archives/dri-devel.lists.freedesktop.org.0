Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC93CB5D06
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEDA10E7EF;
	Thu, 11 Dec 2025 12:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SNYkG6Y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B983B10E7F9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so179975e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455863; x=1766060663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UzO56B2i2+8U9sOUzCIV38YVPug2eKaqoEQZTRXjhLU=;
 b=SNYkG6Y/J7kjEdwK4gXK8yGEd89ycuknJbt0BjtRstKFFrJWY9tl27kV/gwGOcDDnj
 urK7lf4xlIQv4QYtwcpsJzM4boF1NWdKdgeUnnjg1jZJQ3Ji2fxbsL91nxihVGin9Y2/
 T2HbnUi8kj73HfzLAZVYuzm6e/EuuwBekC3cn679PSfqnXzmqsZGma+gT9OG5C0d3NYV
 jwfSBvDhczmh4bdiZULJHi7Pm68OWKLsHqKMMas3LxfwlJwG1yGagD5Q+TaXGupmED85
 ryWLzIsyK5Kcw402FNul1ngjvUeGWb+fk8zOhKr10droWkmHS3Goa9SQdWpF0bb5GuMC
 7ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455863; x=1766060663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UzO56B2i2+8U9sOUzCIV38YVPug2eKaqoEQZTRXjhLU=;
 b=lbbd5B8sp4vmkdReDjjNNQ73EyV+zbZgxdEM2ItKVPd9hsgNMhQGe7E9Ej7vOpIPaq
 8ZgY/oxcdzyaYyBQgpYqY1p5RVx6gh+6ALnyUKzxLPwZghxFnZAa7JSb5kVK/243d3Qp
 s/LpeKipnspqeFeNjyKGHHGgrDVcyXQ+f63NRUhk/aGNG6Pvb5eG0yk3jMIu7VLGGPul
 8EkD29cnpQdiIh/+HWgA4Si/1E++nVlY6vFU9KgycFfLioLmSVHnxwduhNQjo2bYmW/a
 nw98iWzJLSPPFnUFf7tYxjR8as+MjfKsUs4eaONW+/ZzFOs2tfX8S3NuaK8EUrVBc0x7
 OwHA==
X-Gm-Message-State: AOJu0YyFluif5nhFUlftRp/DxBlqn6AqImAcXEuUdmsxKJ1VxkJ/toVM
 3T5mdwPP0nhlBi6vH0LSuN7/4WymQroR1JcWIQez7NBGliowz2u+Ee3LKLocafMcJ8I=
X-Gm-Gg: AY/fxX6C9bqiSowHlWnkrYMKAFkXenEyWX/xadlBPbaphKxUZAcfGJl3H7/oppJQJvk
 0gWG5nOy/poVCJHJnIiF1a147u60A8jPx0ypmafmWUzbHXqjOYTuXqG9t2dICDHXN4WfA1yGqaH
 C4b6GaTTg7XT9moCcEW17mNHXefs/TTswqC1xepY5VyAsFk2IIKAjjlI7O1SaxBW93OTgQXAZR3
 wSY8pQ2/ozxgmT+2m2hwCC59hVTV5dAWdi2PyuweP1tIFOHuUjGFkKFG9uaBKeI9HRYlLO7uGhQ
 FOp45O+0wleb/lMc0LdXOeMgw2ljUGPPSefrn8XMOhYU1As3KDTEDyyzQASNzmE/KUOyt+pjkrc
 tgMzpCRt1bDI20rxgz2sILCoWr5QSJ4mwGuVNKmCj82vdIjRk9Ev//JUJ4q3lsT0TuoRgYJtiST
 QnjTDDoaLq6PoXQYPKuEMPv+XV
X-Google-Smtp-Source: AGHT+IEggSQJyBno/a9Y783NmGqpQTVB69trRzaLUVJNX5b8bkWkJbnsFyZPi3TvY4+883g0wf5rdg==
X-Received: by 2002:a05:600c:6303:b0:477:9fcf:3ff9 with SMTP id
 5b1f17b1804b1-47a838113admr54209315e9.27.1765455863239; 
 Thu, 11 Dec 2025 04:24:23 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/19] drm/xe: Disconnect the low hanging fences from Xe module
Date: Thu, 11 Dec 2025 13:16:47 +0100
Message-ID: <20251211122407.1709-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index cc48663c2b48..2dc33f645bdd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -112,8 +112,6 @@ struct xe_oa_config_bo {
 struct xe_oa_fence {
 	/* @base: dma fence base */
 	struct dma_fence base;
-	/* @lock: lock for the fence */
-	spinlock_t lock;
 	/* @work: work to signal @base */
 	struct delayed_work work;
 	/* @cb: callback to schedule @work */
@@ -1017,8 +1015,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
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
index ac125c697a41..a98de8d1c723 100644
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
2.43.0

