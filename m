Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFFF6B97AD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 15:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD05010EA87;
	Tue, 14 Mar 2023 14:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6F710EA85;
 Tue, 14 Mar 2023 14:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678803599; x=1710339599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E6ZuJSeUKadzeCBjA+1GZqfjJV7vLBhQi3Js8kSATYs=;
 b=RYY3Pts1K0dEb2d56kaQjmWBOVCpH715+fyRoO256aENjBi608cJ1DXS
 X51zAmqzuQEqI3hSfleXcHTfVrEP0bHHNOOLbNJSwxfhs5pXU3wlGigdT
 hGDsOsNxHqdi12S1iePEI04Sx0gFLA75lutqzP4iDTtIHsBm7ELj0v9es
 +6kb758rhdbbkW4EwuVbri0aFySSfyWYmVBwdOGFjnVH0szDxg6/cLPI7
 /lIydvPKSDdVyiTjtYspWLvsLShcEfR+aznJ+RBXe1zZdEYz7LNX+REq1
 bVJZ9DMqVtupj+4zsV20TyY4JF8dOEVU0t39JcwgxwE7uTto3LveOyWPV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="321284976"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="321284976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="656363309"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; d="scan'208";a="656363309"
Received: from mjtillin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.236.227])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 07:19:54 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 10/10] drm/i915: Implement cgroup controller over budget
 throttling
Date: Tue, 14 Mar 2023 14:19:04 +0000
Message-Id: <20230314141904.1210824-11-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
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
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  38 ++++-
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 133 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  11 ++
 4 files changed, 182 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9dce2957b4e5..25ac3e065d1c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3065,6 +3065,42 @@ static void retire_requests(struct intel_timeline *tl, struct i915_request *end)
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
@@ -3081,7 +3117,7 @@ static int eb_request_add(struct i915_execbuffer *eb, struct i915_request *rq,
 
 	/* Check that the context wasn't destroyed before submission */
 	if (likely(!intel_context_is_closed(eb->context))) {
-		attr = eb->gem_context->sched;
+		copy_priority(&attr, eb, rq);
 	} else {
 		/* Serialise with context_close via the add_to_timeline */
 		i915_request_set_error_once(rq, -ENOENT);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index e956990a9870..ebe1bd45ced1 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1780,6 +1780,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 #ifdef CONFIG_CGROUP_DRM
 static const struct drm_cgroup_ops i915_drm_cgroup_ops = {
 	.active_time_us = i915_drm_cgroup_get_active_time_us,
+	.signal_budget = i915_drm_cgroup_signal_budget,
 };
 #endif
 
diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
index c9754cb0277f..72d92ee292ae 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.c
+++ b/drivers/gpu/drm/i915/i915_drm_client.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/ktime.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -159,6 +160,138 @@ u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file)
 
 	return busy;
 }
+
+int i915_drm_cgroup_signal_budget(struct drm_file *file, u64 usage, u64 budget)
+{
+	struct drm_i915_file_private *fpriv = file->driver_priv;
+	u64 class_usage[I915_LAST_UABI_ENGINE_CLASS + 1];
+	u64 class_last[I915_LAST_UABI_ENGINE_CLASS + 1];
+	struct drm_i915_private *i915 = fpriv->dev_priv;
+	struct i915_drm_client *client = fpriv->client;
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
+			get_class_active_ns(client, i, &capacity);
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
 #endif
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index c8439eaa89be..092a7952a67b 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -15,6 +15,8 @@
 
 #define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
 
+struct drm_file;
+
 struct drm_i915_private;
 
 struct i915_drm_clients {
@@ -38,6 +40,13 @@ struct i915_drm_client {
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
 
 void i915_drm_clients_init(struct i915_drm_clients *clients,
@@ -66,5 +75,7 @@ void i915_drm_client_fdinfo(struct seq_file *m, struct file *f);
 void i915_drm_clients_fini(struct i915_drm_clients *clients);
 
 u64 i915_drm_cgroup_get_active_time_us(struct drm_file *file);
+int i915_drm_cgroup_signal_budget(struct drm_file *file,
+				  u64 usage, u64 budget);
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.37.2

