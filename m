Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185021FE4F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224A6E867;
	Tue, 14 Jul 2020 20:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050BC6E888;
 Tue, 14 Jul 2020 20:14:17 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21820127-1500050 
 for multiple; Tue, 14 Jul 2020 21:14:10 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] dma-buf/sw_sync: Separate signal/timeline locks
Date: Tue, 14 Jul 2020 21:14:07 +0100
Message-Id: <20200714201407.28968-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200714200646.14041-2-chris@chris-wilson.co.uk>
References: <20200714200646.14041-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we decouple the sync_pt from the timeline tree upon release, in
order to allow releasing the sync_pt from a signal callback we need to
separate the sync_pt signaling lock from the timeline tree lock.

v2: Mark up the unlocked read of the current timeline value.

Suggested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/dma-buf/sw_sync.c    | 33 ++++++++++++++++++++-------------
 drivers/dma-buf/sync_debug.h |  2 ++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 807c82148062..5851bf7076d0 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -132,24 +132,32 @@ static void timeline_fence_release(struct dma_fence *fence)
 {
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
 	struct sync_timeline *parent = dma_fence_parent(fence);
-	unsigned long flags;
 
-	spin_lock_irqsave(fence->lock, flags);
 	if (!list_empty(&pt->link)) {
-		list_del(&pt->link);
-		rb_erase(&pt->node, &parent->pt_tree);
+		unsigned long flags;
+
+		spin_lock_irqsave(&parent->lock, flags);
+		if (!list_empty(&pt->link)) {
+			list_del(&pt->link);
+			rb_erase(&pt->node, &parent->pt_tree);
+		}
+		spin_unlock_irqrestore(&parent->lock, flags);
 	}
-	spin_unlock_irqrestore(fence->lock, flags);
 
 	sync_timeline_put(parent);
 	dma_fence_free(fence);
 }
 
-static bool timeline_fence_signaled(struct dma_fence *fence)
+static int timeline_value(struct dma_fence *fence)
 {
-	struct sync_timeline *parent = dma_fence_parent(fence);
+	return READ_ONCE(dma_fence_parent(fence)->value);
+}
 
-	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
+static bool timeline_fence_signaled(struct dma_fence *fence)
+{
+	return !__dma_fence_is_later(fence->seqno,
+				     timeline_value(fence),
+				     fence->ops);
 }
 
 static bool timeline_fence_enable_signaling(struct dma_fence *fence)
@@ -166,9 +174,7 @@ static void timeline_fence_value_str(struct dma_fence *fence,
 static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 					     char *str, int size)
 {
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	snprintf(str, size, "%d", parent->value);
+	snprintf(str, size, "%d", timeline_value(fence));
 }
 
 static const struct dma_fence_ops timeline_fence_ops = {
@@ -252,12 +258,13 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 		return NULL;
 
 	sync_timeline_get(obj);
-	dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
+	spin_lock_init(&pt->lock);
+	dma_fence_init(&pt->base, &timeline_fence_ops, &pt->lock,
 		       obj->context, value);
 	INIT_LIST_HEAD(&pt->link);
 
 	spin_lock_irq(&obj->lock);
-	if (!dma_fence_is_signaled_locked(&pt->base)) {
+	if (!dma_fence_is_signaled(&pt->base)) {
 		struct rb_node **p = &obj->pt_tree.rb_node;
 		struct rb_node *parent = NULL;
 
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..fd073fc32329 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @lock: fence signaling lock
  */
 struct sync_pt {
 	struct dma_fence base;
 	struct list_head link;
 	struct rb_node node;
+	spinlock_t lock;
 };
 
 extern const struct file_operations sw_sync_debugfs_fops;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
