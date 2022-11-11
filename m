Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39976258A2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 11:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AE710E7F9;
	Fri, 11 Nov 2022 10:45:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9310E7EF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668163518; x=1699699518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hC1EBIm+7jYNTOyjNm4NvKLmNZ3MeEatF+PTtOwzgNI=;
 b=GdztehFbqGns3IPjAUyGn17sotfhHSXZvmYiFJY9HYJg5IdPfG9lddPZ
 axN7LhEVI55COe5tIWluIg134qAcTMsv0OFnxQKCjdqCcz8i9y8aSgQ+4
 71PL61Gb603kiAmfxlPIDc/baj9DIQjnCzxWl40FwTnSAwMDQJ1kf/q6t
 MzjpSE+TBxfpLUrMpbuWf9efac65Ib6LE69XRYMNTLu4tVgFTQD/d61pH
 2A90+bsqhkJjw/TPgr8AjuUVqrs4RHQeg7OqGbx2D9/CXMBHtSudhubD3
 lT3WnCP+HzE3wD/aGLh02GEH8dNWqQ0/ErgRe3O4tIwHAkHAeymMKKHf+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="299087630"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="299087630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670708559"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="670708559"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 02:45:16 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 11/13] cgroup/drm: Introduce weight based drm cgroup control
Date: Fri, 11 Nov 2022 10:44:33 +0000
Message-Id: <20221111104435.3152347-12-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
References: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

Children of the root cgroup will be exempt from split budgets and
therefore compete for the GPU time independently and without weight based
control.

This will be used to implement a soft, or best effort signal from drm
cgroup to drm core notifying about groups which are over their allotted
budget.

No guarantees that the limit can be enforced are provided or implied.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  37 ++
 drivers/gpu/drm/Kconfig                 |   1 +
 init/Kconfig                            |   1 +
 kernel/cgroup/drm.c                     | 507 +++++++++++++++++++++++-
 4 files changed, 545 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index dc254a3cb956..ab115fb4170e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2398,6 +2398,43 @@ HugeTLB Interface Files
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
+  drm.period_us (debugging aid during RFC only)
+	An integer representing the period with which the controller should look
+	at the GPU usage by the group and potentially send the over/under budget
+	signal.
+	Value of zero (defaul) disables the soft limit checking.
+
 Misc
 ----
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f30f99166531..e68a58237882 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -7,6 +7,7 @@
 #
 menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
+	default y if CGROUP_DRM=y
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
 	select DRM_NOMODESET
 	select DRM_PANEL_ORIENTATION_QUIRKS
diff --git a/init/Kconfig b/init/Kconfig
index 70c08f340961..a39b005b9b8a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1089,6 +1089,7 @@ config CGROUP_RDMA
 
 config CGROUP_DRM
 	bool "DRM controller"
+	select DRM
 	help
 	  Provides the DRM subsystem controller.
 
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index e165d8f542cc..c893c3738556 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -8,10 +8,38 @@
 #include <linux/cgroup_drm.h>
 #include <linux/sched.h>
 
+#include <drm/drm_clients.h>
+
 struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
+
+	unsigned int weight;
+	unsigned int period_us;
+
+	bool scanning_suspended;
+	unsigned int suspended_period_us;
+
+	struct delayed_work scan_work;
+
+	/*
+	 * Below fields are owned and updated by the scan worker. Either the
+	 * worker accesses them, or worker needs to be suspended and synced
+	 * before they can be touched from the outside.
+	 */
+	ktime_t prev_timestamp;
+
+	unsigned int sum_children_weights;
+
+	u64 per_s_budget_ns;
+	u64 prev_active_us;
+	u64 active_us;
+
+	bool over;
+	bool over_budget;
 };
 
+static DEFINE_MUTEX(drmcg_mutex);
+
 static inline struct drm_cgroup_state *
 css_to_drmcs(struct cgroup_subsys_state *css)
 {
@@ -23,20 +51,479 @@ static inline struct drm_cgroup_state *get_task_drmcs(struct task_struct *task)
 	return css_to_drmcs(task_get_css(task, drm_cgrp_id));
 }
 
+static u64 drmcs_get_active_time_us(struct drm_cgroup_state *drmcs)
+{
+	struct cgroup *cgrp = drmcs->css.cgroup;
+	struct task_struct *task;
+	struct css_task_iter it;
+	u64 total = 0;
+
+	css_task_iter_start(&cgrp->self,
+			    CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED,
+			    &it);
+	while ((task = css_task_iter_next(&it))) {
+		u64 time;
+
+		/* Ignore kernel threads here. */
+		if (task->flags & PF_KTHREAD)
+			continue;
+
+		time = drm_pid_get_active_time_us(task_pid(task));
+		total += time;
+	}
+	css_task_iter_end(&it);
+
+	return total;
+}
+
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
+static void
+signal_drm_budget(struct drm_cgroup_state *drmcs, u64 usage, u64 budget)
+{
+	struct cgroup *cgrp = drmcs->css.cgroup;
+	struct task_struct *task;
+	struct css_task_iter it;
+
+	css_task_iter_start(&cgrp->self,
+			    CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED,
+			    &it);
+	while ((task = css_task_iter_next(&it))) {
+		/* Ignore kernel threads here. */
+		if (task->flags & PF_KTHREAD)
+			continue;
+
+		drm_pid_signal_budget(task_pid(task), usage, budget);
+	}
+	css_task_iter_end(&it);
+}
+
+static bool
+__start_scanning(struct drm_cgroup_state *root, unsigned int period_us)
+{
+	struct cgroup_subsys_state *node;
+	bool ok = false;
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
+		if (node == &root->css)
+			drmcs->per_s_budget_ns =
+				DIV_ROUND_UP_ULL(NSEC_PER_SEC * period_us,
+						 USEC_PER_SEC);
+		else
+			drmcs->per_s_budget_ns = 0;
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
+		if (active > drmcs->prev_active_us)
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
+
+out:
+	rcu_read_unlock();
+
+	return ok;
+}
+
+static void scan_worker(struct work_struct *work)
+{
+	struct drm_cgroup_state *root =
+		container_of(work, typeof(*root), scan_work.work);
+	struct cgroup_subsys_state *node;
+	unsigned int period_us;
+	ktime_t now;
+
+	rcu_read_lock();
+
+	if (WARN_ON_ONCE(!css_tryget_online(&root->css))) {
+		rcu_read_unlock();
+		return;
+	}
+
+	now = ktime_get();
+	period_us = ktime_to_us(ktime_sub(now, root->prev_timestamp));
+	root->prev_timestamp = now;
+
+	/*
+	 * 1st pass - reset working values and update hierarchical weights and
+	 * GPU utilisation.
+	 */
+	if (!__start_scanning(root, period_us))
+		goto out_retry; /*
+				 * Always come back later if scanner races with
+				 * core cgroup management. (Repeated pattern.)
+				 */
+
+	css_for_each_descendant_pre(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+		struct cgroup_subsys_state *css;
+		unsigned int over_weights = 0;
+		u64 unused_ns = 0;
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
+			sibling->per_s_budget_ns  =
+				DIV_ROUND_UP_ULL(drmcs->per_s_budget_ns *
+						 sibling->weight,
+						 drmcs->sum_children_weights);
+
+			sibling->over = sibling->active_us * NSEC_PER_USEC >
+				        sibling->per_s_budget_ns;
+			if (sibling->over)
+				over_weights += sibling->weight;
+			else
+				unused_ns += sibling->per_s_budget_ns -
+					     sibling->active_us;
+
+			css_put(css);
+		}
+
+		/*
+		 * 3rd pass - spread unused budget according to relative weights
+		 * of over budget siblings.
+		 */
+		css_for_each_child(css, &drmcs->css) {
+			struct drm_cgroup_state *sibling = css_to_drmcs(css);
+
+			if (!css_tryget_online(css)) {
+				css_put(node);
+				goto out_retry;
+			}
+
+			if (sibling->over) {
+				u64 budget_ns =
+					DIV_ROUND_UP_ULL(unused_ns *
+							 sibling->weight,
+							 over_weights);
+				sibling->per_s_budget_ns += budget_ns;
+				sibling->over =
+					sibling->active_us * NSEC_PER_USEC >
+					sibling->per_s_budget_ns;
+			}
+
+			css_put(css);
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
+			signal_drm_budget(drmcs,
+					  drmcs->active_us * NSEC_PER_USEC,
+					  drmcs->per_s_budget_ns);
+		drmcs->over_budget = drmcs->over;
+
+		css_put(node);
+	}
+
+out_retry:
+	rcu_read_unlock();
+
+	period_us = READ_ONCE(root->period_us);
+	if (period_us)
+		schedule_delayed_work(&root->scan_work,
+				      usecs_to_jiffies(period_us));
+
+	css_put(&root->css);
+}
+
+static void start_scanning(struct drm_cgroup_state *drmcs, u64 period_us)
+{
+	drmcs->period_us = (unsigned int)period_us;
+	WARN_ON_ONCE(!__start_scanning(drmcs, 0));
+	drmcs->prev_timestamp = ktime_get();
+	mod_delayed_work(system_wq, &drmcs->scan_work,
+			 usecs_to_jiffies(period_us));
+}
+
+static void stop_scanning(struct drm_cgroup_state *drmcs)
+{
+	drmcs->period_us = 0;
+	cancel_delayed_work_sync(&drmcs->scan_work);
+	if (drmcs->over_budget) {
+		/*
+		 * Signal under budget when scanning goes off so drivers
+		 * correctly update their state.
+		 */
+		signal_drm_budget(drmcs, 0, drmcs->per_s_budget_ns);
+		drmcs->over_budget = false;
+	}
+}
+
+static struct drm_cgroup_state *drmcs_scanner(struct drm_cgroup_state *drmcs)
+{
+	while (drmcs->css.cgroup->level > 1)
+		drmcs = css_to_drmcs(drmcs->css.parent);
+
+	return drmcs;
+}
+
+static void start_suspend_scanning(struct drm_cgroup_state *drmcs)
+{
+	drmcs = drmcs_scanner(drmcs);
+
+	if (drmcs->scanning_suspended)
+		return;
+
+	drmcs->scanning_suspended = true;
+	drmcs->suspended_period_us = drmcs->period_us;
+	drmcs->period_us = 0;
+}
+
+static void finish_suspend_scanning(struct drm_cgroup_state *drmcs)
+{
+	drmcs = drmcs_scanner(drmcs);
+
+	if (drmcs->suspended_period_us)
+		cancel_delayed_work_sync(&drmcs->scan_work);
+}
+
+static void resume_scanning(struct drm_cgroup_state *drmcs)
+{
+	drmcs = drmcs_scanner(drmcs);
+
+	if (!drmcs->scanning_suspended)
+		return;
+
+	drmcs->scanning_suspended = false;
+	if (drmcs->suspended_period_us) {
+		start_scanning(drmcs, drmcs->suspended_period_us);
+		drmcs->suspended_period_us = 0;
+	}
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
-	kfree(css_to_drmcs(css));
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+
+	stop_scanning(drmcs);
+
+	kfree(drmcs);
+}
+
+static int drmcs_can_attach(struct cgroup_taskset *tset)
+{
+	struct cgroup_subsys_state *new_css;
+	struct task_struct *task;
+	int ret;
+
+	/*
+	 * As processes are getting moved between groups we need to ensure
+	 * both that the old group does not see a sudden downward jump in the
+	 * GPU utilisation, and that the new group does not see a sudden jump
+	 * up with all the GPU time clients belonging to the migrated process
+	 * have accumulated.
+	 *
+	 * To achieve that we suspend the scanner until the migration is
+	 * completed where the resume at the end ensures both groups start
+	 * observing GPU utilisation from a reset state.
+	 */
+
+	ret = mutex_lock_interruptible(&drmcg_mutex);
+	if (ret)
+		return ret;
+
+	cgroup_taskset_for_each(task, new_css, tset) {
+		start_suspend_scanning(css_to_drmcs(task_css(task,
+							     drm_cgrp_id)));
+		start_suspend_scanning(css_to_drmcs(new_css));
+	}
+
+	mutex_unlock(&drmcg_mutex);
+
+	cgroup_taskset_for_each(task, new_css, tset) {
+		finish_suspend_scanning(css_to_drmcs(task_css(task,
+							      drm_cgrp_id)));
+		finish_suspend_scanning(css_to_drmcs(new_css));
+	}
+
+	return 0;
+}
+
+static void tset_resume_scanning(struct cgroup_taskset *tset)
+{
+	struct cgroup_subsys_state *new_css;
+	struct task_struct *task;
+
+	mutex_lock(&drmcg_mutex);
+	cgroup_taskset_for_each(task, new_css, tset) {
+		resume_scanning(css_to_drmcs(task_css(task, drm_cgrp_id)));
+		resume_scanning(css_to_drmcs(new_css));
+	}
+	mutex_unlock(&drmcg_mutex);
+}
+
+static void drmcs_attach(struct cgroup_taskset *tset)
+{
+	tset_resume_scanning(tset);
+}
+
+static void drmcs_cancel_attach(struct cgroup_taskset *tset)
+{
+	tset_resume_scanning(tset);
+}
+
+static u64
+drmcs_read_period_us(struct cgroup_subsys_state *css, struct cftype *cft)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+
+	return drmcs->period_us;
+}
+
+static int
+drmcs_write_period_us(struct cgroup_subsys_state *css, struct cftype *cftype,
+		      u64 period_us)
+{
+	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
+	int ret;
+
+	if (WARN_ON_ONCE(!css->parent))
+		return -EINVAL;
+	if (css->cgroup->level != 1)
+		return -EINVAL;
+	if ((period_us && period_us < 500000) || period_us > USEC_PER_SEC * 60)
+		return -EINVAL;
+
+	ret = mutex_lock_interruptible(&drmcg_mutex);
+	if (ret)
+		return ret;
+
+	if (!drmcs->scanning_suspended) {
+		if (period_us)
+			start_scanning(drmcs, period_us);
+		else
+			stop_scanning(drmcs);
+	} else {
+		/*
+		 * If scanning is temporarily suspended just update the period
+		 * which will apply once resumed, or simply skip resuming in
+		 * case of disabling.
+		 */
+		drmcs->suspended_period_us = period_us;
+		if (!period_us)
+			drmcs->scanning_suspended = false;
+	}
+
+	mutex_unlock(&drmcg_mutex);
+
+	return 0;
 }
 
 void drmcgroup_client_exited(struct task_struct *task)
 {
 	struct drm_cgroup_state *drmcs = get_task_drmcs(task);
 
+	/*
+	 * Since we are not tracking accumulated GPU time for each cgroup,
+	 * avoid jumps in group observed GPU usage by re-setting the scanner
+	 * at a point when GPU usage can suddenly jump down.
+	 *
+	 * Downside is clients can influence the effectiveness of the over-
+	 * budget scanning by continuously closing DRM file descriptors but for
+	 * now we do not worry about it.
+	 */
+
+	mutex_lock(&drmcg_mutex);
+	start_suspend_scanning(drmcs);
+	mutex_unlock(&drmcg_mutex);
+
+	finish_suspend_scanning(drmcs);
+
+	mutex_lock(&drmcg_mutex);
+	resume_scanning(drmcs);
+	mutex_unlock(&drmcg_mutex);
+
 	css_put(&drmcs->css);
 }
 EXPORT_SYMBOL_GPL(drmcgroup_client_exited);
 
 static struct drm_cgroup_state root_drmcs = {
+	.weight = CGROUP_WEIGHT_DFL,
 };
 
 static struct cgroup_subsys_state *
@@ -51,16 +538,34 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 	if (!drmcs)
 		return ERR_PTR(-ENOMEM);
 
+	drmcs->weight = CGROUP_WEIGHT_DFL;
+	INIT_DELAYED_WORK(&drmcs->scan_work, scan_worker);
+
 	return &drmcs->css;
 }
 
 struct cftype files[] = {
+	{
+		.name = "weight",
+		.flags = CFTYPE_NOT_ON_ROOT,
+		.read_u64 = drmcs_read_weight,
+		.write_u64 = drmcs_write_weight,
+	},
+	{
+		.name = "period_us",
+		.flags = CFTYPE_NOT_ON_ROOT,
+		.read_u64 = drmcs_read_period_us,
+		.write_u64 = drmcs_write_period_us,
+	},
 	{ } /* Zero entry terminates. */
 };
 
 struct cgroup_subsys drm_cgrp_subsys = {
 	.css_alloc	= drmcs_alloc,
 	.css_free	= drmcs_free,
+	.can_attach	= drmcs_can_attach,
+	.attach		= drmcs_attach,
+	.cancel_attach	= drmcs_cancel_attach,
 	.early_init	= false,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
-- 
2.34.1

