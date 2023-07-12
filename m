Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A47506C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852A610E502;
	Wed, 12 Jul 2023 11:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787810E502;
 Wed, 12 Jul 2023 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689162481; x=1720698481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Ctq1q9QDDpeEvhraxBTlmXP5zuP+vIgPx5jwystq7M=;
 b=c+eet48h5QdDh292NlGuqgjZkRP9btGIRcYOvl1Mdj8jJdj1beCRnIIh
 6skGtl0cEhE26rw+aiHB/a1LfwmNuLyqKcymCa3YpaCzsbFU0qjxtyVXJ
 /PnUm/6kzC9CCyCAev6rn6HHXtsRYgqSQyxkRCQgnNY+aHYZCdDlLPtL2
 FuhqJzjShI+iTqWfAkOTCZdPzpppd7gohB2D/0gwJyHUV7VBh1W4vEDwY
 ZFNUZcVSYXt0hxkVMxhIFVwe7RB9BSQL1xDjJOT50HvRVkshRb44Kd4TV
 PaoahZ+SVzc9EF7etPQlgt4K2UUyy8H4YKnQHTpXr1EznE2Iho3C3Ijpz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344469343"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="344469343"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866094141"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="866094141"
Received: from eamonnob-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.237.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:58 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/17] cgroup/drm: Introduce weight based drm cgroup control
Date: Wed, 12 Jul 2023 12:46:00 +0100
Message-Id: <20230712114605.519432-13-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
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
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Similar to CPU scheduling, implement a concept of weight in the drm cgroup
controller.

Uses the same range and default as the CPU controller - CGROUP_WEIGHT_MIN,
CGROUP_WEIGHT_DFL and CGROUP_WEIGHT_MAX.

Later each cgroup is assigned a time budget proportionaly based on the
relative weights of it's siblings. This time budget is in turn split by
the group's children and so on.

This will be used to implement a soft, or best effort signal from drm
cgroup to drm core notifying about groups which are over their allotted
budget.

No guarantees that the limit can be enforced are provided or implied.

Checking of GPU usage is done periodically by the controller which can be
configured via drmcg_period_ms kernel boot parameter and which defaults
to 2s.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>
---
 Documentation/admin-guide/cgroup-v2.rst |  31 ++
 kernel/cgroup/drm.c                     | 409 +++++++++++++++++++++++-
 2 files changed, 437 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 4ef890191196..da350858c59f 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2418,6 +2418,37 @@ HugeTLB Interface Files
         hugetlb pages of <hugepagesize> in this cgroup.  Only active in
         use hugetlb pages are included.  The per-node values are in bytes.
 
+DRM
+---
+
+The DRM controller allows configuring scheduling soft limits.
+
+DRM scheduling soft limits
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Because of the heterogenous hardware and driver DRM capabilities, soft limits
+are implemented as a loose co-operative (bi-directional) interface between the
+controller and DRM core.
+
+The controller configures the GPU time allowed per group and periodically scans
+the belonging tasks to detect the over budget condition, at which point it
+invokes a callback notifying the DRM core of the condition.
+
+DRM core provides an API to query per process GPU utilization and 2nd API to
+receive notification from the cgroup controller when the group enters or exits
+the over budget condition.
+
+Individual DRM drivers which implement the interface are expected to act on this
+in the best-effort manner only. There are no guarantees that the soft limits
+will be respected.
+
+DRM scheduling soft limits interface files
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+  drm.weight
+	Standard cgroup weight based control [1, 10000] used to configure the
+	relative distributing of GPU time between the sibling groups.
+
 Misc
 ----
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 60e1f3861576..b244e3d828cc 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -6,7 +6,9 @@
 #include <linux/cgroup.h>
 #include <linux/cgroup_drm.h>
 #include <linux/list.h>
+#include <linux/moduleparam.h>
 #include <linux/mutex.h>
+#include <linux/signal.h>
 #include <linux/slab.h>
 
 #include <drm/drm_drv.h>
@@ -15,10 +17,28 @@ struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
 
 	struct list_head clients;
+
+	unsigned int weight;
+
+	unsigned int sum_children_weights;
+
+	bool over;
+	bool over_budget;
+
+	u64 per_s_budget_us;
+	u64 prev_active_us;
+	u64 active_us;
 };
 
 struct drm_root_cgroup_state {
 	struct drm_cgroup_state drmcs;
+
+	unsigned int period_us;
+
+	unsigned int last_scan_duration_us;
+	ktime_t prev_timestamp;
+
+	struct delayed_work scan_work;
 };
 
 static struct drm_root_cgroup_state root_drmcs = {
@@ -27,6 +47,9 @@ static struct drm_root_cgroup_state root_drmcs = {
 
 static DEFINE_MUTEX(drmcg_mutex);
 
+static int drmcg_period_ms = 2000;
+module_param(drmcg_period_ms, int, 0644);
+
 static inline struct drm_cgroup_state *
 css_to_drmcs(struct cgroup_subsys_state *css)
 {
@@ -67,12 +90,263 @@ drmcs_signal_budget(struct drm_cgroup_state *drmcs, u64 usage, u64 budget)
 	}
 }
 
+static u64
+drmcs_read_weight(struct cgroup_subsys_state *css, struct cftype *cft)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+
+	return drmcs->weight;
+}
+
+static int
+drmcs_write_weight(struct cgroup_subsys_state *css, struct cftype *cftype,
+		   u64 weight)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+	int ret;
+
+	if (weight < CGROUP_WEIGHT_MIN || weight > CGROUP_WEIGHT_MAX)
+		return -ERANGE;
+
+	ret = mutex_lock_interruptible(&drmcg_mutex);
+	if (ret)
+		return ret;
+	drmcs->weight = weight;
+	mutex_unlock(&drmcg_mutex);
+
+	return 0;
+}
+
+static bool __start_scanning(unsigned int period_us)
+{
+	struct drm_cgroup_state *root = &root_drmcs.drmcs;
+	struct cgroup_subsys_state *node;
+	ktime_t start, now;
+	bool ok = false;
+
+	lockdep_assert_held(&drmcg_mutex);
+
+	start = ktime_get();
+	if (period_us > root_drmcs.last_scan_duration_us)
+		period_us -= root_drmcs.last_scan_duration_us;
+
+	rcu_read_lock();
+
+	css_for_each_descendant_post(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+
+		if (!css_tryget_online(node))
+			goto out;
+
+		drmcs->active_us = 0;
+		drmcs->sum_children_weights = 0;
+
+		if (period_us && node == &root->css)
+			drmcs->per_s_budget_us =
+				DIV_ROUND_UP_ULL((u64)period_us * USEC_PER_SEC,
+						 USEC_PER_SEC);
+		else
+			drmcs->per_s_budget_us = 0;
+
+		css_put(node);
+	}
+
+	css_for_each_descendant_post(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+		struct drm_cgroup_state *parent;
+		u64 active;
+
+		if (!css_tryget_online(node))
+			goto out;
+		if (!node->parent) {
+			css_put(node);
+			continue;
+		}
+		if (!css_tryget_online(node->parent)) {
+			css_put(node);
+			goto out;
+		}
+		parent = css_to_drmcs(node->parent);
+
+		active = drmcs_get_active_time_us(drmcs);
+		if (period_us && active > drmcs->prev_active_us)
+			drmcs->active_us += active - drmcs->prev_active_us;
+		drmcs->prev_active_us = active;
+
+		parent->active_us += drmcs->active_us;
+		parent->sum_children_weights += drmcs->weight;
+
+		css_put(node);
+		css_put(&parent->css);
+	}
+
+	ok = true;
+	now = ktime_get();
+	root_drmcs.last_scan_duration_us = ktime_to_us(ktime_sub(now, start));
+	root_drmcs.prev_timestamp = now;
+
+out:
+	rcu_read_unlock();
+
+	return ok;
+}
+
+static void scan_worker(struct work_struct *work)
+{
+	struct drm_cgroup_state *root = &root_drmcs.drmcs;
+	struct cgroup_subsys_state *node;
+	unsigned int period_us;
+
+	mutex_lock(&drmcg_mutex);
+
+	rcu_read_lock();
+
+	if (WARN_ON_ONCE(!css_tryget_online(&root->css))) {
+		rcu_read_unlock();
+		mutex_unlock(&drmcg_mutex);
+		return;
+	}
+
+	period_us = ktime_to_us(ktime_sub(ktime_get(),
+					  root_drmcs.prev_timestamp));
+
+	/*
+	 * 1st pass - reset working values and update hierarchical weights and
+	 * GPU utilisation.
+	 */
+	if (!__start_scanning(period_us))
+		goto out_retry; /*
+				 * Always come back later if scanner races with
+				 * core cgroup management. (Repeated pattern.)
+				 */
+
+	css_for_each_descendant_pre(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+		struct cgroup_subsys_state *css;
+		u64 reused_us = 0, unused_us = 0;
+		unsigned int over_weights = 0;
+
+		if (!css_tryget_online(node))
+			goto out_retry;
+
+		/*
+		 * 2nd pass - calculate initial budgets, mark over budget
+		 * siblings and add up unused budget for the group.
+		 */
+		css_for_each_child(css, &drmcs->css) {
+			struct drm_cgroup_state *sibling = css_to_drmcs(css);
+
+			if (!css_tryget_online(css)) {
+				css_put(node);
+				goto out_retry;
+			}
+
+			sibling->per_s_budget_us  =
+				DIV_ROUND_UP_ULL(drmcs->per_s_budget_us *
+						 sibling->weight,
+						 drmcs->sum_children_weights);
+
+			sibling->over = sibling->active_us >
+					sibling->per_s_budget_us;
+			if (sibling->over)
+				over_weights += sibling->weight;
+			else
+				unused_us += sibling->per_s_budget_us -
+					     sibling->active_us;
+
+			css_put(css);
+		}
+
+		/*
+		 * 3rd pass - spread unused budget according to relative weights
+		 * of over budget siblings.
+		 */
+		while (over_weights && reused_us < unused_us) {
+			unsigned int under = 0;
+
+			unused_us -= reused_us;
+			reused_us = 0;
+
+			css_for_each_child(css, &drmcs->css) {
+				struct drm_cgroup_state *sibling;
+				u64 extra_us, max_us, need_us;
+
+				if (!css_tryget_online(css)) {
+					css_put(node);
+					goto out_retry;
+				}
+
+				sibling = css_to_drmcs(css);
+				if (!sibling->over) {
+					css_put(css);
+					continue;
+				}
+
+				extra_us = DIV_ROUND_UP_ULL(unused_us *
+							    sibling->weight,
+							    over_weights);
+				max_us = sibling->per_s_budget_us + extra_us;
+				if (max_us > sibling->active_us)
+					need_us = sibling->active_us -
+						  sibling->per_s_budget_us;
+				else
+					need_us = extra_us;
+				reused_us += need_us;
+				sibling->per_s_budget_us += need_us;
+				sibling->over = sibling->active_us  >
+						sibling->per_s_budget_us;
+				if (!sibling->over)
+					under += sibling->weight;
+
+				css_put(css);
+			}
+
+			over_weights -= under;
+		}
+
+		css_put(node);
+	}
+
+	/*
+	 * 4th pass - send out over/under budget notifications.
+	 */
+	css_for_each_descendant_post(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+
+		if (!css_tryget_online(node))
+			goto out_retry;
+
+		if (drmcs->over || drmcs->over_budget)
+			drmcs_signal_budget(drmcs,
+					    drmcs->active_us,
+					    drmcs->per_s_budget_us);
+		drmcs->over_budget = drmcs->over;
+
+		css_put(node);
+	}
+
+out_retry:
+	rcu_read_unlock();
+	mutex_unlock(&drmcg_mutex);
+
+	period_us = READ_ONCE(root_drmcs.period_us);
+	if (period_us)
+		schedule_delayed_work(&root_drmcs.scan_work,
+				      usecs_to_jiffies(period_us));
+
+	css_put(&root->css);
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
-	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+	if (css != &root_drmcs.drmcs.css)
+		kfree(css_to_drmcs(css));
+}
 
-	if (drmcs != &root_drmcs.drmcs)
-		kfree(drmcs);
+static void record_baseline_utilisation(void)
+{
+	/* Re-capture baseline group GPU times to avoid downward jumps. */
+	WARN_ON_ONCE(!__start_scanning(0)); /* QQQ Retry if it fails? */
 }
 
 static struct cgroup_subsys_state *
@@ -82,6 +356,7 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 
 	if (!parent_css) {
 		drmcs = &root_drmcs.drmcs;
+		INIT_DELAYED_WORK(&root_drmcs.scan_work, scan_worker);
 	} else {
 		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
 		if (!drmcs)
@@ -90,9 +365,124 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 		INIT_LIST_HEAD(&drmcs->clients);
 	}
 
+	drmcs->weight = CGROUP_WEIGHT_DFL;
+
 	return &drmcs->css;
 }
 
+static int drmcs_online(struct cgroup_subsys_state *css)
+{
+	if (css == &root_drmcs.drmcs.css && drmcg_period_ms) {
+		mutex_lock(&drmcg_mutex);
+		record_baseline_utilisation();
+		root_drmcs.period_us = max(500, drmcg_period_ms) * 1000;
+		mod_delayed_work(system_wq,
+				 &root_drmcs.scan_work,
+				 usecs_to_jiffies(root_drmcs.period_us));
+		mutex_unlock(&drmcg_mutex);
+	}
+
+	return 0;
+}
+
+static void drmcs_offline(struct cgroup_subsys_state *css)
+{
+	bool flush = false;
+
+	if (css != &root_drmcs.drmcs.css)
+		return;
+
+	mutex_lock(&drmcg_mutex);
+	if (root_drmcs.period_us) {
+		root_drmcs.period_us = 0;
+		cancel_delayed_work(&root_drmcs.scan_work);
+		flush = true;
+	}
+	mutex_unlock(&drmcg_mutex);
+
+	if (flush)
+		flush_delayed_work(&root_drmcs.scan_work);
+}
+
+static struct drm_cgroup_state *old_drmcs;
+
+static int drmcs_can_attach(struct cgroup_taskset *tset)
+{
+	struct cgroup_subsys_state *css;
+	struct task_struct *task;
+
+	/*
+	 * QQQ
+	 * Same passing of state via global as cpuset_can_attach to
+	 * cpuset_attach. Always serialized?
+	 */
+
+	task = cgroup_taskset_first(tset, &css);
+	old_drmcs = css_to_drmcs(task_css(task, drm_cgrp_id));
+
+	return 0;
+}
+
+static void drmcs_attach(struct cgroup_taskset *tset)
+{
+	struct drm_cgroup_state *old = old_drmcs;
+	struct cgroup_subsys_state *css;
+	struct drm_file *fpriv, *next;
+	struct drm_cgroup_state *new;
+	struct task_struct *task;
+	bool migrated = false;
+
+	if (!old)
+		return;
+
+	task = cgroup_taskset_first(tset, &css);
+	new = css_to_drmcs(task_css(task, drm_cgrp_id));
+	if (new == old)
+		return;
+
+	mutex_lock(&drmcg_mutex);
+
+	list_for_each_entry_safe(fpriv, next, &old->clients, clink) {
+		cgroup_taskset_for_each(task, css, tset) {
+			struct cgroup_subsys_state *old_css;
+
+			if (task->flags & PF_KTHREAD)
+				continue;
+			if (!thread_group_leader(task))
+				continue;
+
+			new = css_to_drmcs(task_css(task, drm_cgrp_id));
+			if (WARN_ON_ONCE(new == old))
+				continue;
+
+			if (rcu_access_pointer(fpriv->pid) != task_tgid(task))
+				continue;
+
+			if (WARN_ON_ONCE(fpriv->__css != &old->css))
+				continue;
+
+			old_css = fpriv->__css;
+			fpriv->__css = &new->css;
+			css_get(fpriv->__css);
+			list_move_tail(&fpriv->clink, &new->clients);
+			css_put(old_css);
+			migrated = true;
+		}
+	}
+
+	if (migrated)
+		record_baseline_utilisation();
+
+	mutex_unlock(&drmcg_mutex);
+
+	old_drmcs = NULL;
+}
+
+static void drmcs_cancel_attach(struct cgroup_taskset *tset)
+{
+	old_drmcs = NULL;
+}
+
 void drmcgroup_client_open(struct drm_file *file_priv)
 {
 	struct drm_cgroup_state *drmcs;
@@ -121,6 +511,7 @@ void drmcgroup_client_close(struct drm_file *file_priv)
 	mutex_lock(&drmcg_mutex);
 	list_del(&file_priv->clink);
 	file_priv->__css = NULL;
+	record_baseline_utilisation();
 	mutex_unlock(&drmcg_mutex);
 
 	css_put(&drmcs->css);
@@ -144,6 +535,7 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
 	if (src != dst) {
 		file_priv->__css = &dst->css; /* Keeps the reference. */
 		list_move_tail(&file_priv->clink, &dst->clients);
+		record_baseline_utilisation();
 	}
 
 	mutex_unlock(&drmcg_mutex);
@@ -153,12 +545,23 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
 EXPORT_SYMBOL_GPL(drmcgroup_client_migrate);
 
 struct cftype files[] = {
+	{
+		.name = "weight",
+		.flags = CFTYPE_NOT_ON_ROOT,
+		.read_u64 = drmcs_read_weight,
+		.write_u64 = drmcs_write_weight,
+	},
 	{ } /* Zero entry terminates. */
 };
 
 struct cgroup_subsys drm_cgrp_subsys = {
 	.css_alloc	= drmcs_alloc,
 	.css_free	= drmcs_free,
+	.css_online	= drmcs_online,
+	.css_offline	= drmcs_offline,
+	.can_attach     = drmcs_can_attach,
+	.attach		= drmcs_attach,
+	.cancel_attach  = drmcs_cancel_attach,
 	.early_init	= false,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
-- 
2.39.2

