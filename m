Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D331C37F61B
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C442F6ECDE;
	Thu, 13 May 2021 11:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611B46ECDD;
 Thu, 13 May 2021 11:00:14 +0000 (UTC)
IronPort-SDR: YZr9t1F6ugnUMEI1tkt9dj894jAHC4+40lCZXmbepyBX0UUeBNo8zNPxCVFyPH3C9zfjoNvRlz
 YXbKidHwbN7w==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="187048077"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="187048077"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:13 -0700
IronPort-SDR: 9S+zUeqD95IH80U9/TDX8at3Jz5xMwERxsvZatISOkxgIv2DvL4jnHzGLuWittNTXaW+E4jAfG
 L1wp2PD4NOYg==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="400930419"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.166])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:00:12 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/i915: Make GEM contexts track DRM clients
Date: Thu, 13 May 2021 11:59:58 +0100
Message-Id: <20210513110002.3641705-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

If we make GEM contexts keep a reference to i915_drm_client for the whole
of their lifetime, we can consolidate the current task pid and name usage
by getting it from the client.

v2: Don't bother supporting selftests contexts from debugfs. (Chris)
v3 (Lucas): Finish constructing ctx before adding it to the list
v4 (Ram): Rebase on upstream

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Link: https://patchwork.freedesktop.org/patch/msgid/20210123153733.18139-4-chris@chris-wilson.co.uk
Link: https://patchwork.freedesktop.org/patch/msgid/20210124153136.19124-4-chris@chris-wilson.co.uk
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c   | 20 ++++++++++++-----
 .../gpu/drm/i915/gem/i915_gem_context_types.h | 13 +++--------
 drivers/gpu/drm/i915/i915_gpu_error.c         | 22 +++++++++++--------
 3 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index e5f8d94666e8..5ea42d5b0b1a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -345,13 +345,14 @@ void i915_gem_context_release(struct kref *ref)
 	trace_i915_context_free(ctx);
 	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
 
-	mutex_destroy(&ctx->engines_mutex);
-	mutex_destroy(&ctx->lut_mutex);
+	if (ctx->client)
+		i915_drm_client_put(ctx->client);
 
 	if (ctx->timeline)
 		intel_timeline_put(ctx->timeline);
 
-	put_pid(ctx->pid);
+	mutex_destroy(&ctx->engines_mutex);
+	mutex_destroy(&ctx->lut_mutex);
 	mutex_destroy(&ctx->mutex);
 
 	kfree_rcu(ctx, rcu);
@@ -895,6 +896,7 @@ static int gem_context_register(struct i915_gem_context *ctx,
 				u32 *id)
 {
 	struct drm_i915_private *i915 = ctx->i915;
+	struct i915_drm_client *client;
 	struct i915_address_space *vm;
 	int ret;
 
@@ -906,15 +908,21 @@ static int gem_context_register(struct i915_gem_context *ctx,
 		WRITE_ONCE(vm->file, fpriv); /* XXX */
 	mutex_unlock(&ctx->mutex);
 
-	ctx->pid = get_task_pid(current, PIDTYPE_PID);
+	client = i915_drm_client_get(fpriv->client);
+
+	rcu_read_lock();
 	snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
-		 current->comm, pid_nr(ctx->pid));
+		 i915_drm_client_name(client),
+		 pid_nr(i915_drm_client_pid(client)));
+	rcu_read_unlock();
 
 	/* And finally expose ourselves to userspace via the idr */
 	ret = xa_alloc(&fpriv->context_xa, id, ctx, xa_limit_32b, GFP_KERNEL);
 	if (ret)
 		goto err_pid;
 
+	ctx->client = client;
+
 	spin_lock(&i915->gem.contexts.lock);
 	list_add_tail(&ctx->link, &i915->gem.contexts.list);
 	spin_unlock(&i915->gem.contexts.lock);
@@ -922,7 +930,7 @@ static int gem_context_register(struct i915_gem_context *ctx,
 	return 0;
 
 err_pid:
-	put_pid(fetch_and_zero(&ctx->pid));
+	i915_drm_client_put(client);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
index 340473aa70de..eb098f2896c5 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
@@ -96,19 +96,12 @@ struct i915_gem_context {
 	 */
 	struct i915_address_space __rcu *vm;
 
-	/**
-	 * @pid: process id of creator
-	 *
-	 * Note that who created the context may not be the principle user,
-	 * as the context may be shared across a local socket. However,
-	 * that should only affect the default context, all contexts created
-	 * explicitly by the client are expected to be isolated.
-	 */
-	struct pid *pid;
-
 	/** link: place with &drm_i915_private.context_list */
 	struct list_head link;
 
+	/** client: struct i915_drm_client */
+	struct i915_drm_client *client;
+
 	/**
 	 * @ref: reference count
 	 *
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 99ca242ec13b..dc9eb6823270 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1235,7 +1235,9 @@ static void record_request(const struct i915_request *request,
 
 		ctx = rcu_dereference(request->context->gem_context);
 		if (ctx)
-			erq->pid = pid_nr(ctx->pid);
+			erq->pid = I915_SELFTEST_ONLY(!ctx->client) ?
+				   0 :
+				   pid_nr(i915_drm_client_pid(ctx->client));
 	}
 	rcu_read_unlock();
 }
@@ -1256,23 +1258,25 @@ static bool record_context(struct i915_gem_context_coredump *e,
 			   const struct i915_request *rq)
 {
 	struct i915_gem_context *ctx;
-	struct task_struct *task;
 	bool simulated;
 
 	rcu_read_lock();
+
 	ctx = rcu_dereference(rq->context->gem_context);
 	if (ctx && !kref_get_unless_zero(&ctx->ref))
 		ctx = NULL;
-	rcu_read_unlock();
-	if (!ctx)
+	if (!ctx) {
+		rcu_read_unlock();
 		return true;
+	}
 
-	rcu_read_lock();
-	task = pid_task(ctx->pid, PIDTYPE_PID);
-	if (task) {
-		strcpy(e->comm, task->comm);
-		e->pid = task->pid;
+	if (I915_SELFTEST_ONLY(!ctx->client)) {
+		strcpy(e->comm, "[kernel]");
+	} else {
+		strcpy(e->comm, i915_drm_client_name(ctx->client));
+		e->pid = pid_nr(i915_drm_client_pid(ctx->client));
 	}
+
 	rcu_read_unlock();
 
 	e->sched_attr = ctx->sched;
-- 
2.30.2

