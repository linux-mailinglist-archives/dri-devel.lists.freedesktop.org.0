Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378387D57A9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E3910E41D;
	Tue, 24 Oct 2023 16:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C8E10E422;
 Tue, 24 Oct 2023 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163923; x=1729699923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iL/Kggt96aZN7qZXaFHGGnuXzbL3GYSs3ahmgxkULj8=;
 b=E4pBBbhq6WDSi9aGdQYqqobaWm+S/x4/Pr9pJz24Xu3QA/lR3V+GXp6g
 oma7HTbc/NKz8AjKwsCagtjZnmy+Z8WDjW+7M3o7sHb8qJV/NGOv68/d+
 tfZ1Sc8tpoyg7GwWPge4Pfiyje1FvUWV3YHH5swe/R/U8kJ6dn22Ua5Gb
 5BwX+zAXJ5g1ANVgpC3EeoY9XpkSkmX6YVl0aPPChBNyqKQQSvmiwwDVG
 5EfwtZrOb5X1KOM9caDJICeaq+htLXTQkCtOKPP0JhHhOaNktxeBxKd2j
 QNqCqKEwLksy9DncupUhW4hy/IbhG2Q0Z/vqUGY8bcPVbHuL+elETgxaa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451328194"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="451328194"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:08:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902237322"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="902237322"
Received: from aidenbar-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.219.125])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 09:05:38 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 7/8] drm/i915: Implement cgroup controller over budget throttling
Date: Tue, 24 Oct 2023 17:07:26 +0100
Message-Id: <20231024160727.282960-8-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
References: <20231024160727.282960-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

When notified by the drm core we are over our allotted time budget, i915
instance will check if any of the GPU engines it is reponsible for is
fully saturated. If it is, and the client in question is using that
engine, it will throttle it.

For now throttling is done simplistically by lowering the scheduling
priority while clients are throttled.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  38 +++-
 drivers/gpu/drm/i915/i915_driver.c            |  11 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 203 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        |  11 +
 4 files changed, 253 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 683fd8d3151c..f87935a030a1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3086,6 +3086,42 @@ static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
 			break;
 }
 
+#ifdef CONFIG_CGROUP_DRM
+static unsigned int
+__get_class(struct drm_i915_file_private *fpriv, const struct i915_request *rq)
+{
+	unsigned int class;
+
+	class = rq->context->engine->uabi_class;
+
+	if (WARN_ON_ONCE(class >= ARRAY_SIZE(fpriv->client->throttle)))
+		class = 0;
+
+	return class;
+}
+
+static void copy_priority(struct i915_sched_attr *attr,
+			  const struct i915_execbuffer *eb,
+			  const struct i915_request *rq)
+{
+	struct drm_i915_file_private *file_priv = eb->file->driver_priv;
+	int prio;
+
+	*attr = eb->gem_context->sched;
+
+	prio = file_priv->client->throttle[__get_class(file_priv, rq)];
+	if (prio)
+		attr->priority = prio;
+}
+#else
+static void copy_priority(struct i915_sched_attr *attr,
+			  const struct i915_execbuffer *eb,
+			  const struct i915_request *rq)
+{
+	*attr = eb->gem_context->sched;
+}
+#endif
+
 static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
 			  int err, bool last_parallel)
 {
@@ -3102,7 +3138,7 @@ static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
 
 	/* Check that the context wasn't destroyed before submission */
 	if (likely(!intel_context_is_closed(eb->context))) {
-		attr = eb->gem_context->sched;
+		copy_priority(&attr, eb, rq);
 	} else {
 		/* Serialise with context_close via the add_to_timeline */
 		i915_request_set_error_once(rq, -ENOENT);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 8a0e2c745e1f..450bbcfc16af 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1794,6 +1794,13 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
 };
 
+#ifdef CONFIG_CGROUP_DRM
+static const struct drm_cgroup_ops i915_drm_cgroup_ops = {
+	.active_time_us = i915_drm_cgroup_get_active_time_us,
+	.signal_budget = i915_drm_cgroup_signal_budget,
+};
+#endif
+
 /*
  * Interface history:
  *
@@ -1823,6 +1830,10 @@ static const struct drm_driver i915_drm_driver = {
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
 
+#ifdef CONFIG_CGROUP_DRM
+	.cg_ops = &i915_drm_cgroup_ops,
+#endif
+
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index 2a44b3876cb5..403baf8c86ad 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -40,7 +41,7 @@ void __i915_drm_client_free(struct kref *kref)
 	kfree(client);
 }
 
-#ifdef CONFIG_PROC_FS
+#if defined(CONFIG_PROC_FS) || defined(CONFIG_CGROUP_DRM)
 static const char * const uabi_class_names[] = {
 	[I915_ENGINE_CLASS_RENDER] = "render",
 	[I915_ENGINE_CLASS_COPY] = "copy",
@@ -65,20 +66,204 @@ static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
 	return total;
 }
 
+static u64 get_class_active_ns(struct i915_drm_client *client,
+			       struct drm_i915_private *i915,
+			       unsigned int class,
+			       unsigned int *capacity)
+{
+	struct i915_gem_context *ctx;
+	u64 total;
+
+	*capacity = i915->engine_uabi_class_count[class];
+	if (!*capacity)
+		return 0;
+
+	total = atomic64_read(&client->past_runtime[class]);
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
+		total += busy_add(ctx, class);
+	rcu_read_unlock();
+
+	return total;
+}
+
+static bool supports_stats(struct drm_i915_private *i915)
+{
+	return GRAPHICS_VER(i915) >= 8;
+}
+#endif
+
+#if defined(CONFIG_CGROUP_DRM)
+u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file)
+{
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+	struct i915_drm_client *client = fpriv->client;
+	struct drm_i915_private *i915 = fpriv->i915;
+	unsigned int i;
+	u64 busy = 0;
+
+	if (!supports_stats(i915))
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++) {
+		unsigned int capacity;
+		u64 b;
+
+		b = get_class_active_ns(client, i915, i, &capacity);
+		if (capacity) {
+			b = DIV_ROUND_UP_ULL(b, capacity * 1000);
+			busy += b;
+		}
+	}
+
+	return busy;
+}
+
+int i915_drm_cgroup_signal_budget(struct drm_file *file, u64 usage, u64 budget)
+{
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+	u64 class_usage[I915_LAST_UABI_ENGINE_CLASS + 1];
+	u64 class_last[I915_LAST_UABI_ENGINE_CLASS + 1];
+	struct i915_drm_client *client = fpriv->client;
+	struct drm_i915_private *i915 = fpriv->i915;
+	struct intel_engine_cs *engine;
+	bool over = usage > budget;
+	struct task_struct *task;
+	struct pid *pid;
+	unsigned int i;
+	ktime_t unused;
+	int ret = 0;
+	u64 t;
+
+	if (!supports_stats(i915))
+		return -EINVAL;
+
+	if (usage == 0 && budget == 0)
+		return 0;
+
+	rcu_read_lock();
+	pid = rcu_dereference(file->pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+	if (over) {
+		client->over_budget++;
+		if (!client->over_budget)
+			client->over_budget = 2;
+
+		drm_dbg(&i915->drm, "%s[%u] over budget (%llu/%llu)\n",
+			task ? task->comm : "<unknown>", pid_vnr(pid),
+			usage, budget);
+	} else {
+		client->over_budget = 0;
+		memset(client->class_last, 0, sizeof(client->class_last));
+		memset(client->throttle, 0, sizeof(client->throttle));
+
+		drm_dbg(&i915->drm, "%s[%u] un-throttled; under budget\n",
+			task ? task->comm : "<unknown>", pid_vnr(pid));
+
+		rcu_read_unlock();
+		return 0;
+	}
+	rcu_read_unlock();
+
+	memset(class_usage, 0, sizeof(class_usage));
+	for_each_uabi_engine(engine, i915)
+		class_usage[engine->uabi_class] +=
+			ktime_to_ns(intel_engine_get_busy_time(engine, &unused));
+
+	memcpy(class_last, client->class_last, sizeof(class_last));
+	memcpy(client->class_last, class_usage, sizeof(class_last));
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
+		class_usage[i] -= class_last[i];
+
+	t = client->last;
+	client->last = ktime_get_raw_ns();
+	t = client->last - t;
+
+	if (client->over_budget == 1)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++) {
+		u64 client_class_usage[I915_LAST_UABI_ENGINE_CLASS + 1];
+		unsigned int capacity, rel_usage;
+
+		if (!i915->engine_uabi_class_count[i])
+			continue;
+
+		t = DIV_ROUND_UP_ULL(t, 1000);
+		class_usage[i] = DIV_ROUND_CLOSEST_ULL(class_usage[i], 1000);
+		rel_usage = DIV_ROUND_CLOSEST_ULL(class_usage[i] * 100ULL,
+						  t *
+						  i915->engine_uabi_class_count[i]);
+		if (rel_usage < 95) {
+			/* Physical class not oversubsribed. */
+			if (client->throttle[i]) {
+				client->throttle[i] = 0;
+
+				rcu_read_lock();
+				pid = rcu_dereference(file->pid);
+				task = pid_task(pid, PIDTYPE_TGID);
+				drm_dbg(&i915->drm,
+					"%s[%u] un-throttled; physical class %s utilisation %u%%\n",
+					task ? task->comm : "<unknown>",
+					pid_vnr(pid),
+					uabi_class_names[i],
+					rel_usage);
+				rcu_read_unlock();
+			}
+			continue;
+		}
+
+		client_class_usage[i] =
+			get_class_active_ns(client, i915, i, &capacity);
+		if (client_class_usage[i]) {
+			int permille;
+
+			ret |= 1;
+
+			permille = DIV_ROUND_CLOSEST_ULL((usage - budget) *
+							 1000,
+							 budget);
+			client->throttle[i] =
+			    DIV_ROUND_CLOSEST(permille *
+					      I915_CONTEXT_MIN_USER_PRIORITY,
+					      1000);
+			if (client->throttle[i] <
+			    I915_CONTEXT_MIN_USER_PRIORITY)
+				client->throttle[i] =
+					I915_CONTEXT_MIN_USER_PRIORITY;
+
+			rcu_read_lock();
+			pid = rcu_dereference(file->pid);
+			task = pid_task(pid, PIDTYPE_TGID);
+			drm_dbg(&i915->drm,
+				"%s[%u] %d‰ over budget, throttled to priority %d; physical class %s utilisation %u%%\n",
+				task ? task->comm : "<unknown>",
+				pid_vnr(pid),
+				permille,
+				client->throttle[i],
+				uabi_class_names[i],
+				rel_usage);
+			rcu_read_unlock();
+		}
+	}
+
+	return ret;
+}
+#endif
+
+#ifdef CONFIG_PROC_FS
 static void
 show_client_class(struct drm_printer *p,
 		  struct drm_i915_private *i915,
 		  struct i915_drm_client *client,
 		  unsigned int class)
 {
-	const unsigned int capacity = i915->engine_uabi_class_count[class];
-	u64 total = atomic64_read(&client->past_runtime[class]);
-	struct i915_gem_context *ctx;
+	unsigned int capacity;
+	u64 total;
 
-	rcu_read_lock();
-	list_for_each_entry_rcu(ctx, &client->ctx_list, client_link)
-		total += busy_add(ctx, class);
-	rcu_read_unlock();
+	total = get_class_active_ns(client, i915, class, &capacity);
 
 	if (capacity)
 		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
@@ -102,7 +287,7 @@ void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 * ******************************************************************
 	 */
 
-	if (GRAPHICS_VER(i915) < 8)
+	if (!supports_stats(i915))
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(uabi_class_names); i++)
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 67816c912bca..396dbb0780cc 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -29,6 +29,13 @@ struct i915_drm_client {
 	 * @past_runtime: Accumulation of pphwsp runtimes from closed contexts.
 	 */
 	atomic64_t past_runtime[I915_LAST_UABI_ENGINE_CLASS + 1];
+
+#ifdef CONFIG_CGROUP_DRM
+	int throttle[I915_LAST_UABI_ENGINE_CLASS + 1];
+	unsigned int over_budget;
+	u64 last;
+	u64 class_last[I915_LAST_UABI_ENGINE_CLASS + 1];
+#endif
 };
 
 static inline struct i915_drm_client *
@@ -49,4 +56,8 @@ struct i915_drm_client *i915_drm_client_alloc(void);
 
 void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
 
+u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file);
+int i915_drm_cgroup_signal_budget(struct drm_file *file,
+				  u64 usage, u64 budget);
+
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.39.2

