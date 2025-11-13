Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A339EC58117
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD51210E1A1;
	Thu, 13 Nov 2025 14:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XBtl0UoF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E879210E850
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so1462233a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045628; x=1763650428; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TQQWYpV9Zou9tzyWqIRvulxHoyXxl7YO7YooFTRLgAA=;
 b=XBtl0UoFuvz5i2llptVwCKX4sfnyX5arJG1zb/nQ7PV3eI9w+nLIP1/kdnmfnEytrb
 2OV4IpRb3Cuc6O7i4VM0Fv0MJF6vaVyIHLNVft5fzE/4Xkq+OwKRyyRVd0UxX+3MJzC8
 HnRTNPrklUulOBuvNX0JfUzEAy05LwrVUYP1Elhk4rpFFg7jXMagLK+6VEmzXIMjqBJx
 Jbe2/I9bGdbxB6JDm+XK6R8L30Sd29fYPZUin5zkf8gUf69cThFI9TBpG1BqLSRyr5SX
 SfeO/LyeWvxCzZ47tUFbK35KuM9CggMl1rPhNiSqnVQrnPLdyPDI64vCVfOwTXKIaNta
 jSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045628; x=1763650428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TQQWYpV9Zou9tzyWqIRvulxHoyXxl7YO7YooFTRLgAA=;
 b=OKls7yF45C2/fNA4LPjW8JtbMZdhKbZL1FdR6iKaj5riKC7TqJ4pozaaI+fqriJVhu
 4Tj41oXryrFyjEG9r9zi962kmA4Cz6gnjeXtB3+QAtm0emSM0H2PQEJjL+eyHkVGpXsX
 B5hzY/d428J7xDaSkLPYw5FY7ZJqN5oVuEQdnRvhpMrYy0RKkqY7aWyMnIb96FDmVVr5
 CFbqrCBOR0t3rF36Gu+fFkWbQbil4qj1rqhY/KhBkIcfbzemVT3A5NWmUKky0ntHU6R4
 T9luAIxiGWrHF3kNDClQ45zNI06ncGNFCzQ9PFbQNV/TWck3l1NSlrXYDA43YlsIwQ/B
 TrtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLIaVvqpXrGbqddbXrrown83sauBP9qWSCS8zx5wd7sS2oQFC0c5Dy5lQQP4vdYDcUcZsu+U+H6CM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXnToCofMdDAfhBS5jmhxeaE4Ng67ekDkCZK9AMzBXcfQMFUcT
 1NFXV7S4D05DRjnxsqpUFP0O8q2VdTBghT4cEmXBLRWl0nagc/kjT2dcoiIUtd559VU=
X-Gm-Gg: ASbGnctQlKJ8vIpa42RnrCgLzxgnPlIzyupmuGv2dc43iR/mkPd1swkEd14dbziZX3c
 rpAKtsWf4ZcrviLZ4kaYzSPX0KvIr3iW+huS3B5mwFnk2XesS4ynYweWuTpeQRD2K9sE/8ITXGa
 p6rBGYt+WmaK4Czrrs6mvAv9ROqhWviLLWPoXZpyRmvpxt1/thYpmnN47xVdRAugiEi/iB7eboF
 tIPUGKsuRsF1eaxoTEC/OpYXptg4bW9STCW4ud3OcA1AxXYI8WKyS73H7ZZr4D818VXcKZWGicb
 ar9JTn5khC6M//pAzuSpn23ne4moP8fUTS1WRFgudGwKHr/0H8/nHHoS6AltUs+pgd1bJxTZfDf
 Hyf+uHLYWqRiGen0v1BK7ctNgtkJe6KvvXoEDZcVJdDC9GAoBiDqH4qpVvPSbv2ETFOldH759zb
 atavRbmugvQ5DA5nZUeY3hJw==
X-Google-Smtp-Source: AGHT+IFha4cmY1W5rI1Cy3tZWueXlKP3/AVtT/vUUsiD2FLG/O5uEWJLHKaViU9gQTa0MqRzBSX/Hw==
X-Received: by 2002:a17:906:f597:b0:b72:d2df:641c with SMTP id
 a640c23a62f3a-b7331ace22amr657711666b.49.1763045628271; 
 Thu, 13 Nov 2025 06:53:48 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:47 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 17/18] drm/xe: Promote xe_hw_fence_irq to an ref counted object
Date: Thu, 13 Nov 2025 15:51:54 +0100
Message-ID: <20251113145332.16805-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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
index 8724f8de67e2..68ec3ba4b995 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -140,7 +140,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->width = width;
 	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
 	q->logical_mask = logical_mask;
-	q->fence_irq = &gt->fence_irq[hwe->class];
+	q->fence_irq = gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6d479948bf21..e0461a36771d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -615,7 +615,8 @@ static void xe_gt_fini(void *arg)
 		xe_pm_runtime_put(gt_to_xe(gt));
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
-		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
+		if (gt->fence_irq[i])
+			xe_hw_fence_irq_finish(gt->fence_irq[i]);
 
 	xe_gt_disable_host_l2_vram(gt);
 }
@@ -629,7 +630,9 @@ int xe_gt_init(struct xe_gt *gt)
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
 		gt->ring_ops[i] = xe_ring_ops_get(gt, i);
-		xe_hw_fence_irq_init(&gt->fence_irq[i]);
+		gt->fence_irq[i] = xe_hw_fence_irq_init();
+		if (!gt->fence_irq[i])
+			return -ENOMEM;
 	}
 
 	err = devm_add_action_or_reset(gt_to_xe(gt)->drm.dev, xe_gt_fini, gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 0a728180b6fe..88a05edab51b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -240,7 +240,7 @@ struct xe_gt {
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

