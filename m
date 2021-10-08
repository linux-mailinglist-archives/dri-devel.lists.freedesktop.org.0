Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43551426BC7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDE36F512;
	Fri,  8 Oct 2021 13:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F716F512;
 Fri,  8 Oct 2021 13:35:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287388473"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="287388473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="522983749"
Received: from lenovo-x280.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.98])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 06:35:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 6/6] drm/i915: Use irq work for coalescing-only dma-fence-work
Date: Fri,  8 Oct 2021 15:35:30 +0200
Message-Id: <20211008133530.664509-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We are using a timeline-attached struct dma_fence_work to coalesce
dma-fences on eviction. In this mode we will not have a work callback
attached.
Similar to how the dma-fence-chain and dma-fence-array containers do this,
use irq work to signal to reduce latency.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_sw_fence_work.c | 36 ++++++++++++++++++-----
 drivers/gpu/drm/i915/i915_sw_fence_work.h |  2 ++
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index 87cdb3158042..4573f537ada4 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -32,16 +32,17 @@ void dma_fence_work_timeline_attach(struct dma_fence_work_timeline *tl,
 {
 	struct dma_fence *await;
 
+	might_sleep();
 	if (tl->ops->get)
 		tl->ops->get(tl);
 
-	spin_lock(&tl->lock);
+	spin_lock_irq(&tl->lock);
 	await = tl->last_fence;
 	tl->last_fence = dma_fence_get(&f->dma);
 	f->dma.seqno = tl->seqno++;
 	f->dma.context = tl->context;
 	f->tl = tl;
-	spin_unlock(&tl->lock);
+	spin_unlock_irq(&tl->lock);
 
 	if (await) {
 		__i915_sw_fence_await_dma_fence(&f->chain, await, tl_cb);
@@ -53,13 +54,14 @@ static void dma_fence_work_timeline_detach(struct dma_fence_work *f)
 {
 	struct dma_fence_work_timeline *tl = f->tl;
 	bool put = false;
+	unsigned long irq_flags;
 
-	spin_lock(&tl->lock);
+	spin_lock_irqsave(&tl->lock, irq_flags);
 	if (tl->last_fence == &f->dma) {
 		put = true;
 		tl->last_fence = NULL;
 	}
-	spin_unlock(&tl->lock);
+	spin_unlock_irqrestore(&tl->lock, irq_flags);
 	if (tl->ops->put)
 		tl->ops->put(tl);
 	if (put)
@@ -68,8 +70,6 @@ static void dma_fence_work_timeline_detach(struct dma_fence_work *f)
 
 static void dma_fence_work_complete(struct dma_fence_work *f)
 {
-	dma_fence_signal(&f->dma);
-
 	if (f->ops->release)
 		f->ops->release(f);
 
@@ -79,13 +79,32 @@ static void dma_fence_work_complete(struct dma_fence_work *f)
 	dma_fence_put(&f->dma);
 }
 
+static void dma_fence_work_irq_work(struct irq_work *irq_work)
+{
+	struct dma_fence_work *f = container_of(irq_work, typeof(*f), irq_work);
+
+	dma_fence_signal(&f->dma);
+	if (f->ops->release)
+		/* Note we take the signaled path in dma_fence_work_work() */
+		queue_work(system_unbound_wq, &f->work);
+	else
+		dma_fence_work_complete(f);
+}
+
 static void dma_fence_work_work(struct work_struct *work)
 {
 	struct dma_fence_work *f = container_of(work, typeof(*f), work);
 
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->dma.flags)) {
+		dma_fence_work_complete(f);
+		return;
+	}
+
 	if (f->ops->work)
 		f->ops->work(f);
 
+	dma_fence_signal(&f->dma);
+
 	dma_fence_work_complete(f);
 }
 
@@ -102,8 +121,10 @@ fence_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
 		dma_fence_get(&f->dma);
 		if (test_bit(DMA_FENCE_WORK_IMM, &f->dma.flags))
 			dma_fence_work_work(&f->work);
-		else
+		else if (f->ops->work)
 			queue_work(system_unbound_wq, &f->work);
+		else
+			irq_work_queue(&f->irq_work);
 		break;
 
 	case FENCE_FREE:
@@ -155,6 +176,7 @@ void dma_fence_work_init(struct dma_fence_work *f,
 	dma_fence_init(&f->dma, &fence_ops, &f->lock, 0, 0);
 	i915_sw_fence_init(&f->chain, fence_notify);
 	INIT_WORK(&f->work, dma_fence_work_work);
+	init_irq_work(&f->irq_work, dma_fence_work_irq_work);
 }
 
 int dma_fence_work_chain(struct dma_fence_work *f, struct dma_fence *signal)
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
index 6f41ee360133..c412bb4cb288 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
@@ -8,6 +8,7 @@
 #define I915_SW_FENCE_WORK_H
 
 #include <linux/dma-fence.h>
+#include <linux/irq_work.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
@@ -77,6 +78,7 @@ struct dma_fence_work {
 	struct i915_sw_dma_fence_cb cb;
 
 	struct work_struct work;
+	struct irq_work irq_work;
 
 	struct dma_fence_work_timeline *tl;
 
-- 
2.31.1

