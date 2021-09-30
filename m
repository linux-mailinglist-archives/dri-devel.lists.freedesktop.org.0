Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9E41DFDF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614926EC2B;
	Thu, 30 Sep 2021 17:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702F6EC16;
 Thu, 30 Sep 2021 17:16:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="225321117"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="225321117"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="520489752"
Received: from dboland-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.223.141])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 10:16:28 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [RFC 6/6] drm/i915: Connect task and GPU scheduling priorities
Date: Thu, 30 Sep 2021 18:15:52 +0100
Message-Id: <20210930171552.501553-7-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Introduce the concept of context nice value which exactly matches the
process nice, and also make use of the task user nice notifier chain to be
able to dynamically adjust GPU scheduling. Apart from runtime adjustments
context also inherits the nice value when created.

Context nice is utilised secondary to context priority, only when the
latter has been left at the default setting, in order to avoid disturbing
any application made choices of low and high (batch processing and maybe
latency sensitive compositing). In those cases nice value adjusts the
effective priority in the narrow band of -19 to +20 around
I915_CONTEXT_DEFAULT_PRIORITY.

Opens:
 * The [-19, +20] range should work well with GuC scheduling since it
   effectively translates to three available buckets there, but should
   it perhaps be streched to cover the full [-1023, +1023] range?
 * Current implementation only has the nice apply to future submissions
   against the context. Is it worth dealing with already submitted work?
   I opted to avoid the complication since benefit seems marginal outside
   of the endless compute workloads (which would probably start up with
   the correct priority).

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  1 +
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/i915_drm_client.c        | 38 +++++++++++++++++--
 drivers/gpu/drm/i915/i915_drm_client.h        |  3 ++
 drivers/gpu/drm/i915/i915_request.c           |  2 +-
 drivers/gpu/drm/i915/i915_request.h           |  5 +++
 drivers/gpu/drm/i915/i915_scheduler.c         |  3 +-
 drivers/gpu/drm/i915/i915_scheduler.h         | 14 +++++++
 drivers/gpu/drm/i915/i915_scheduler_types.h   |  8 ++++
 9 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8d4d687ab1d0..fed0733cb652 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -257,6 +257,7 @@ proto_context_create(struct drm_i915_private *i915, unsigned int flags)
 	if (i915->params.enable_hangcheck)
 		pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
 	pc->sched.priority = I915_PRIORITY_NORMAL;
+	pc->sched.nice = task_nice(current);
 
 	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
 		if (!HAS_EXECLISTS(i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7147fe80919e..13c41f1f8ba5 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -250,7 +250,7 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
 
 static int rq_prio(const struct i915_request *rq)
 {
-	return READ_ONCE(rq->sched.attr.priority);
+	return i915_request_priority(rq);
 }
 
 static int effective_prio(const struct i915_request *rq)
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 82b9636482ef..13ac2311eb84 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -8,9 +8,33 @@
 #include <linux/types.h>
 
 #include "i915_drm_client.h"
+#include "gem/i915_gem_context.h"
 #include "i915_gem.h"
 #include "i915_utils.h"
 
+static int
+clients_notify(struct notifier_block *nb, unsigned long val, void *ptr)
+{
+	struct i915_drm_clients *clients =
+		container_of(nb, typeof(*clients), prio_notifier);
+	struct i915_drm_client *client;
+	unsigned long flags;
+
+	read_lock_irqsave(&clients->lock, flags);
+	hash_for_each_possible(clients->tasks, client, node, (uintptr_t)ptr) {
+		struct i915_gem_context *ctx;
+
+		if (client->owner != ptr)
+			continue;
+
+		list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
+			ctx->sched.nice = (int)val;
+	}
+	read_unlock_irqrestore(&clients->lock, flags);
+
+	return NOTIFY_DONE;
+}
+
 void i915_drm_clients_init(struct i915_drm_clients *clients,
 			   struct drm_i915_private *i915)
 {
@@ -21,6 +45,10 @@ void i915_drm_clients_init(struct i915_drm_clients *clients,
 
 	rwlock_init(&clients->lock);
 	hash_init(clients->tasks);
+
+	memset(&clients->prio_notifier, 0, sizeof(clients->prio_notifier));
+	clients->prio_notifier.notifier_call = clients_notify;
+	register_user_nice_notifier(&clients->prio_notifier);
 }
 
 struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients)
@@ -63,9 +91,9 @@ void __i915_drm_client_free(struct kref *kref)
 	struct xarray *xa = &clients->xarray;
 	unsigned long flags;
 
-	write_lock(&clients->lock);
+	write_lock_irq(&clients->lock);
 	hash_del(&client->node);
-	write_unlock(&clients->lock);
+	write_unlock_irq(&clients->lock);
 
 	xa_lock_irqsave(xa, flags);
 	__xa_erase(xa, client->id);
@@ -75,6 +103,8 @@ void __i915_drm_client_free(struct kref *kref)
 
 void i915_drm_clients_fini(struct i915_drm_clients *clients)
 {
+	unregister_user_nice_notifier(&clients->prio_notifier);
+
 	GEM_BUG_ON(!xa_empty(&clients->xarray));
 	xa_destroy(&clients->xarray);
 }
@@ -88,12 +118,12 @@ void i915_drm_client_update_owner(struct i915_drm_client *client,
 		return;
 
 	clients = client->clients;
-	write_lock(&clients->lock);
+	write_lock_irq(&clients->lock);
 	if (READ_ONCE(client->owner) != owner) {
 		if (client->owner)
 			hash_del(&client->node);
 		client->owner = owner;
 		hash_add(clients->tasks, &client->node, (uintptr_t)owner);
 	}
-	write_unlock(&clients->lock);
+	write_unlock_irq(&clients->lock);
 }
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 42fd79f0558a..dda26aa42ac9 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -9,6 +9,7 @@
 #include <linux/hashtable.h>
 #include <linux/kref.h>
 #include <linux/list.h>
+#include <linux/notifier.h>
 #include <linux/rwlock.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
@@ -24,6 +25,8 @@ struct i915_drm_clients {
 
 	rwlock_t lock;
 	DECLARE_HASHTABLE(tasks, 6);
+
+	struct notifier_block prio_notifier;
 };
 
 struct i915_drm_client {
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 79da5eca60af..a8c6f3a64895 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1930,7 +1930,7 @@ static int print_sched_attr(const struct i915_sched_attr *attr,
 		return x;
 
 	x += snprintf(buf + x, len - x,
-		      " prio=%d", attr->priority);
+		      " prio=%d nice=%d", attr->priority, attr->nice);
 
 	return x;
 }
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 7bd9ed20623e..c2c4c344837e 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -399,6 +399,11 @@ long i915_request_wait(struct i915_request *rq,
 #define I915_WAIT_PRIORITY	BIT(1) /* small priority bump for the request */
 #define I915_WAIT_ALL		BIT(2) /* used by i915_gem_object_wait() */
 
+static inline int i915_request_priority(const struct i915_request *rq)
+{
+	return i915_sched_attr_priority(&rq->sched.attr);
+}
+
 void i915_request_show(struct drm_printer *m,
 		       const struct i915_request *rq,
 		       const char *prefix,
diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..3883511f90ea 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -155,7 +155,7 @@ lock_sched_engine(struct i915_sched_node *node,
 static void __i915_schedule(struct i915_sched_node *node,
 			    const struct i915_sched_attr *attr)
 {
-	const int prio = max(attr->priority, node->attr.priority);
+	const int prio = max(i915_sched_attr_priority(attr), node->attr.priority);
 	struct i915_sched_engine *sched_engine;
 	struct i915_dependency *dep, *p;
 	struct i915_dependency stack;
@@ -305,6 +305,7 @@ void i915_sched_node_init(struct i915_sched_node *node)
 void i915_sched_node_reinit(struct i915_sched_node *node)
 {
 	node->attr.priority = I915_PRIORITY_INVALID;
+	node->attr.nice = 0;
 	node->semaphores = 0;
 	node->flags = 0;
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler.h b/drivers/gpu/drm/i915/i915_scheduler.h
index 0b9b86af6c7f..75ccc9f55d14 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.h
+++ b/drivers/gpu/drm/i915/i915_scheduler.h
@@ -38,6 +38,20 @@ void i915_sched_node_fini(struct i915_sched_node *node);
 void i915_schedule(struct i915_request *request,
 		   const struct i915_sched_attr *attr);
 
+static inline int i915_sched_attr_priority(const struct i915_sched_attr *attr)
+{
+	int prio = attr->priority;
+
+	/*
+	 * Only allow I915_CONTEXT_DEFAULT_PRIORITY to be affected by the
+	 * nice setting.
+	 */
+	if (!prio)
+		prio = -attr->nice;
+
+	return prio;
+}
+
 struct list_head *
 i915_sched_lookup_priolist(struct i915_sched_engine *sched_engine, int prio);
 
diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
index b0a1b58c7893..34124cfc93e9 100644
--- a/drivers/gpu/drm/i915/i915_scheduler_types.h
+++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
@@ -29,6 +29,14 @@ struct i915_sched_attr {
 	 * The &drm_i915_private.kernel_context is assigned the lowest priority.
 	 */
 	int priority;
+
+	/**
+	 * @nice: context nice level
+	 *
+	 * Nice level follows the CPU scheduler nice value as set for the
+	 * process owning the GPU context.
+	 */
+	int nice;
 };
 
 /*
-- 
2.30.2

