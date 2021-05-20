Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D613A38B2C6
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EC16F48E;
	Thu, 20 May 2021 15:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571A7895D7;
 Thu, 20 May 2021 15:13:18 +0000 (UTC)
IronPort-SDR: Kr1C4uaTuT+Bdv89Ox2QWQRHZrCzKBfcoDtmVPBu1p7WJl6Zf0X+mXi7LbFNt252akmeAg+0Zy
 NbmrH32wItfg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="265162787"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="265162787"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:13 -0700
IronPort-SDR: jBnWf/jkstZ281t3azm4oF4CApmCvzE1A40+xOL9PDcfy5XvEuHhqu9KFfQIfc2Oe20clPw/6a
 RAM/07hIl2+Q==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="543619245"
Received: from fgrogers-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.241.97])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2021 08:13:11 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [RFC 3/7] drm/i915: Make GEM contexts track DRM clients
Date: Thu, 20 May 2021 16:12:50 +0100
Message-Id: <20210520151254.959958-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

If we make GEM contexts keep a reference to i915_drm_client for the whole
of their lifetime, we can consolidate the current task pid and name usage
by getting it from the client.

v2: Don't bother supporting selftests contexts from debugfs. (Chris)
v3 (Lucas): Finish constructing ctx before adding it to the list
v4 (Ram): Rebase.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
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
index 8b964e355cb5..f5dfc15f5f76 100644
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

