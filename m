Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256ACC25553
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF7610EBB4;
	Fri, 31 Oct 2025 13:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BNVx3i3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926A010EB85
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so16926285e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918320; x=1762523120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cO1J32Y6gIGa7uLqhKBAZ+ssI6ZF2+5Jo49aaqLm8A=;
 b=BNVx3i3nYSgj09n3gB6vNJnmDvgR3Otb4i9K7o6pbp40/b5Az4Y9pC8CIKCogz0JhF
 Toc0RFoZ+yC9SZQBOAj8JMPc35zYsGI9sVz/jV+F5XdrTDJJ3OTOmHe/vEntkLLIgiCN
 wVE9+BKJKy4YuOygChpeYCwS+t+f4KbsQtXdCD0CxIlWnoEMsDnNIIhiw+lhFp1dyrnl
 p8KzzDIbFx76n60Qsvj9okcd9+Bz7IKBTkRk4s4IsiDAJu7owxJtab75pb1ghgaXoMKi
 MfVLM9X3yO8L1BcCMRVX4RUslG9nxH5BWZWBxk7u/yU2IYccsUetCCrhrLVleBUMWXVg
 N4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918320; x=1762523120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9cO1J32Y6gIGa7uLqhKBAZ+ssI6ZF2+5Jo49aaqLm8A=;
 b=Ch6YftUGJe0ghiJhc7RA9SFTxi21IF8cjTnnWuqg84VNqBXI2HmIZRoXEjcgdcqDV9
 yT8TIY3BTfLVU1iifiNuSe5R9Am+utAueJEVSKR8/Z53IuXsGX8Kz+yk2R0OjPpq9aNq
 6xGLzWAlQs5LTCDHC0tV96Brho6cW+dn3YkSRMju/5rfUsOalDnAZOZGnh4Ue/eWn0vI
 vjdI+LI7QlooraGfIdJSPh/3uFeGTo4PwIOWsaDWosRHOhIA++sXXVwCG1EBDbxSC51X
 zJn9EL4EtGeFd1bjG36i+c1iKTqOcg88zexip8Vuak45epfjBVlBJbWnYEVXZ9oVmVJE
 CVZw==
X-Gm-Message-State: AOJu0YwoWku28wil/h/NzjZbUE2H4R3F65ezpe7CeivkmI8OXmZe+jYQ
 KVn7fsy7+LptowbVyxNZ4piOdRyfqqeNN8G6+GoD/s9bB1dUnsJUAKiJ
X-Gm-Gg: ASbGnctVpp/HY43IOF3+m87TINgVOhuHe23zwxmW+lgvTiNdYQk5uIEoI9io4wroRzX
 /CraDaixuxMDFANHkRnxRBdJof5JeRnkMfDvf8fb7Fh52KbQ8LheVLo+BDS/18GKLo/AjhLAGii
 ixoZzZLC6eHvLulnPVzcpNyK5kn1vAgGyGtjYmbtVMA+B6u0WbQcNKlkzICl25c8nCPH2cNlawv
 xZsNJBBDbd2fOMvjckNpb0lotULGEY5FQ77sWyeL1aCz4gM1tyispS14Oyj0BQ5qPPVDxaLuicI
 Eco5uFgq2hNyy5x1MAbjCgOxiM3EN1NvxQRz/DELsgxrgSLQJ7Di0j11aOmhYouRA3IL4Dgo6pP
 STv+H15KOR5612EGO467chxG+AzAgWipamdfzwchE8Ga4D+SK5tW0PbmZe5Jr93/OulekHKXnGX
 iEzPCOfLnt/VgZLjbGOhP88pknOL6BgR5hbPE=
X-Google-Smtp-Source: AGHT+IF25aXf9aMc7PHVkoYe1qut2GkM7xd/jELupGpWeORm+B+UasJL7EJwgATgSz9dXpDe+rwc7w==
X-Received: by 2002:a05:600c:608e:b0:475:d952:342f with SMTP id
 5b1f17b1804b1-477308cb956mr33194885e9.39.1761918319966; 
 Fri, 31 Oct 2025 06:45:19 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/20] drm/xe: Promote xe_hw_fence_irq to an ref counted object
Date: Fri, 31 Oct 2025 14:16:53 +0100
Message-ID: <20251031134442.113648-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

Help disconnect fences from the Xe module.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c     |  2 +-
 drivers/gpu/drm/xe/xe_gt.c             |  7 ++++--
 drivers/gpu/drm/xe/xe_gt_types.h       |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence.c       | 35 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_fence.h       |  2 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h |  4 +++
 7 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b57d7c2cc94..1ccc7f2ce75e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -139,7 +139,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->width = width;
 	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
 	q->logical_mask = logical_mask;
-	q->fence_irq = &gt->fence_irq[hwe->class];
+	q->fence_irq = gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 89808b33d0a8..d12b4669ebb6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -608,7 +608,8 @@ static void xe_gt_fini(void *arg)
 	int i;
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+		if (gt->fence_irq[i])
+			xe_hw_fence_irq_finish(gt->fence_irq[i]);
 
 	xe_gt_disable_host_l2_vram(gt);
 }
@@ -622,7 +623,9 @@ int xe_gt_init(struct xe_gt *gt)
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
-		xe_hw_fence_irq_init(&gt->fence_irq[i]);
+		gt->fence_irq[i] = xe_hw_fence_irq_init();
+		if (!gt->fence_irq[i])
+			return -ENOMEM;
 	}
 
 	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 0b525643a048..2e6066bc5056 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -305,7 +305,7 @@ struct xe_gt {
 	const struct xe_ring_ops *ring_ops[XE_ENGINE_CLASS_MAX];
 
 	/** @fence_irq: fence IRQs (1 per engine class) */
-	struct xe_hw_fence_irq fence_irq[XE_ENGINE_CLASS_MAX];
+	struct xe_hw_fence_irq *fence_irq[XE_ENGINE_CLASS_MAX];
 
 	/** @default_lrc: default LRC state */
 	void *default_lrc[XE_ENGINE_CLASS_MAX];
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 6a9e2a4272dd..480972c3da84 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -524,7 +524,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		info->irq_offset;
 	hwe->domain = info->domain;
 	hwe->name = info->name;
-	hwe->fence_irq = &gt->fence_irq[info->class];
+	hwe->fence_irq = gt->fence_irq[info->class];
 	hwe->engine_id = id;
 
 	hwe->eclass = &gt->eclass[hwe->class];
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index 5edcf057aceb..f5fad4426729 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -15,6 +15,25 @@
 #include "xe_map.h"
 #include "xe_trace.h"
 
+static void xe_hw_fence_irq_destroy(struct kref *ref)
+{
+	struct xe_hw_fence_irq *irq = container_of(ref, typeof(*irq), refcount);
+
+	kfree(irq);
+}
+
+static void xe_hw_fence_irq_put(struct xe_hw_fence_irq *irq)
+{
+	if (irq)
+		kref_put(&irq->refcount, xe_hw_fence_irq_destroy);
+}
+
+static struct xe_hw_fence_irq *xe_hw_fence_irq_get(struct xe_hw_fence_irq *irq)
+{
+	kref_get(&irq->refcount);
+	return irq;
+}
+
 static struct xe_hw_fence *fence_alloc(void)
 {
 	return kzalloc(sizeof(struct xe_hw_fence), GFP_KERNEL);
@@ -25,6 +44,7 @@ static void fence_free(struct rcu_head *rcu)
 	struct xe_hw_fence *fence =
 		container_of(rcu, struct xe_hw_fence, dma.rcu);
 
+	xe_hw_fence_irq_put(fence->irq);
 	kfree(fence);
 }
 
@@ -52,12 +72,20 @@ static void hw_fence_irq_run_cb(struct irq_work *work)
 	dma_fence_end_signalling(tmp);
 }
 
-void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq)
+struct xe_hw_fence_irq *xe_hw_fence_irq_init(void)
 {
+	struct xe_hw_fence_irq *irq = kzalloc(sizeof(*irq), GFP_KERNEL);
+
+	if (!irq)
+		return NULL;
+
+	kref_init(&irq->refcount);
 	spin_lock_init(&irq->lock);
 	init_irq_work(&irq->work, hw_fence_irq_run_cb);
 	INIT_LIST_HEAD(&irq->pending);
 	irq->enabled = true;
+
+	return irq;
 }
 
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
@@ -82,6 +110,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 
 	/* Safe release of the irq->lock used in dma_fence_init. */
 	synchronize_rcu();
+
+	xe_hw_fence_irq_put(irq);
 }
 
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
@@ -233,13 +263,14 @@ void xe_hw_fence_free(struct dma_fence *fence)
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
 		      struct iosys_map seqno_map)
 {
-	struct  xe_hw_fence *hw_fence =
+	struct xe_hw_fence *hw_fence =
 		container_of(fence, typeof(*hw_fence), dma);
 
 	hw_fence->xe = gt_to_xe(ctx->gt);
 	snprintf(hw_fence->name, sizeof(hw_fence->name), "%s", ctx->name);
 	hw_fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&hw_fence->irq_link);
+	hw_fence->irq = xe_hw_fence_irq_get(ctx->irq);
 
 	dma_fence_init(fence, &xe_hw_fence_ops, &ctx->irq->lock,
 		       ctx->dma_fence_ctx, ctx->next_seqno++);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index 96f34332fd8d..fa1620203b90 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -11,7 +11,7 @@
 /* Cause an early wrap to catch wrapping errors */
 #define XE_FENCE_INITIAL_SEQNO (-127)
 
-void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
+struct xe_hw_fence_irq *xe_hw_fence_irq_init(void);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index 58a8d09afe5c..0682c12520e9 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -28,6 +28,8 @@ struct xe_hw_fence_irq {
 	struct irq_work work;
 	/** @pending: list of pending xe_hw_fences */
 	struct list_head pending;
+	/** @refcount: ref count of this exec queue */
+	struct kref refcount;
 	/** @enabled: fence signaling enabled */
 	bool enabled;
 };
@@ -62,6 +64,8 @@ struct xe_hw_fence_ctx {
 struct xe_hw_fence {
 	/** @dma: base dma fence for hardware fence context */
 	struct dma_fence dma;
+	/** @irq: fence irq handler */
+	struct xe_hw_fence_irq *irq;
 	/** @xe: Xe device for hw fence driver name */
 	struct xe_device *xe;
 	/** @name: name of hardware fence context */
-- 
2.43.0

