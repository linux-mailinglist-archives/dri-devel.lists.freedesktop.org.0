Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77A21FFF6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7817A6E881;
	Tue, 14 Jul 2020 21:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37426E881;
 Tue, 14 Jul 2020 21:24:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 21820609-1500050 
 for multiple; Tue, 14 Jul 2020 22:24:03 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] dma-buf/sw_sync: Separate signal/timeline locks
Date: Tue, 14 Jul 2020 22:24:00 +0100
Message-Id: <20200714212401.15825-3-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200714212401.15825-1-chris@chris-wilson.co.uk>
References: <20200714212401.15825-1-chris@chris-wilson.co.uk>
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
v3: Store a timeline pointer in the sync_pt as we cannot use the common
fence->lock trick to find our parent anymore.

Suggested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/dma-buf/sw_sync.c    | 40 +++++++++++++++++++++---------------
 drivers/dma-buf/sync_debug.c |  2 +-
 drivers/dma-buf/sync_debug.h | 13 +++++++-----
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 807c82148062..17a5c1a3b7ce 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -123,33 +123,39 @@ static const char *timeline_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *timeline_fence_get_timeline_name(struct dma_fence *fence)
 {
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	return parent->name;
+	return sync_timeline(fence)->name;
 }
 
 static void timeline_fence_release(struct dma_fence *fence)
 {
 	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
-	struct sync_timeline *parent = dma_fence_parent(fence);
-	unsigned long flags;
+	struct sync_timeline *parent = pt->timeline;
 
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
+	return READ_ONCE(sync_timeline(fence)->value);
+}
 
-	return !__dma_fence_is_later(fence->seqno, parent->value, fence->ops);
+static bool timeline_fence_signaled(struct dma_fence *fence)
+{
+	return !__dma_fence_is_later(fence->seqno,
+				     timeline_value(fence),
+				     fence->ops);
 }
 
 static bool timeline_fence_enable_signaling(struct dma_fence *fence)
@@ -166,9 +172,7 @@ static void timeline_fence_value_str(struct dma_fence *fence,
 static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 					     char *str, int size)
 {
-	struct sync_timeline *parent = dma_fence_parent(fence);
-
-	snprintf(str, size, "%d", parent->value);
+	snprintf(str, size, "%d", timeline_value(fence));
 }
 
 static const struct dma_fence_ops timeline_fence_ops = {
@@ -252,12 +256,14 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 		return NULL;
 
 	sync_timeline_get(obj);
-	dma_fence_init(&pt->base, &timeline_fence_ops, &obj->lock,
+	spin_lock_init(&pt->lock);
+	dma_fence_init(&pt->base, &timeline_fence_ops, &pt->lock,
 		       obj->context, value);
 	INIT_LIST_HEAD(&pt->link);
+	pt->timeline = obj;
 
 	spin_lock_irq(&obj->lock);
-	if (!dma_fence_is_signaled_locked(&pt->base)) {
+	if (!dma_fence_is_signaled(&pt->base)) {
 		struct rb_node **p = &obj->pt_tree.rb_node;
 		struct rb_node *parent = NULL;
 
diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 101394f16930..2188ee17e889 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -65,7 +65,7 @@ static const char *sync_status_str(int status)
 static void sync_print_fence(struct seq_file *s,
 			     struct dma_fence *fence, bool show)
 {
-	struct sync_timeline *parent = dma_fence_parent(fence);
+	struct sync_timeline *parent = sync_timeline(fence);
 	int status;
 
 	status = dma_fence_get_status_locked(fence);
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..56589dae2159 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -45,23 +45,26 @@ struct sync_timeline {
 	struct list_head	sync_timeline_list;
 };
 
-static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
-{
-	return container_of(fence->lock, struct sync_timeline, lock);
-}
-
 /**
  * struct sync_pt - sync_pt object
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @lock: fence signaling lock
  */
 struct sync_pt {
 	struct dma_fence base;
+	struct sync_timeline *timeline;
 	struct list_head link;
 	struct rb_node node;
+	spinlock_t lock;
 };
 
+static inline struct sync_timeline *sync_timeline(struct dma_fence *fence)
+{
+	return container_of(fence, struct sync_pt, base)->timeline;
+}
+
 extern const struct file_operations sw_sync_debugfs_fops;
 
 void sync_timeline_debug_add(struct sync_timeline *obj);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
