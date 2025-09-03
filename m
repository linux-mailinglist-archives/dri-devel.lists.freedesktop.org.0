Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F333B4252D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7888D10E8FA;
	Wed,  3 Sep 2025 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X6YrWDyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FA310E8EB;
 Wed,  3 Sep 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rVo4IASprljUSyYkhmgMsFvJiSscGPQ1vHdYvHdZa5k=; b=X6YrWDyxPVJipqYjOorQISnWI+
 GlkADkms12sUkOiBJR6X7ouXllY4vWSYMyEReVToe0ckSx40a6gBMYGsExRCdnJY2of6aDgjSv87/
 HqWy177MFRnxlZH7HIDw5SfLh+llrDGxqlQpfg+v2fSEq05NDCD86UItvr0GpKesPkK7KDlZoO0ol
 qiyyL07d2LXihqBE3NfjxcHJYCxGEM1A2ptD22uzgtOBHV2grGCGZEl8vTV8BvCnwHH/uPp3Ij9vR
 SahyCwRPDOdJgHCG19J9V7HH3OP4YOeOTNtNG20OkH49FyjYjHOX46h3ImKhYw/geVXFZmLEByf0L
 uctGw69g==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKo-006Gat-TO; Wed, 03 Sep 2025 17:23:42 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Tejun Heo <tj@kernel.org>
Subject: [RFC 16/21] cgroup/drm: Introduce weight based scheduling control
Date: Wed,  3 Sep 2025 16:23:22 +0100
Message-ID: <20250903152327.66002-17-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
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

Similar to CPU and IO scheduling, implement a concept of weight in the DRM
cgroup controller.

Individual drivers are now able to register with the controller which will
notify them of the relative scheduling weight for each open DRM client.

The notifications are triggered on cgroup weight changes and DRM clients
appearing and disappearing in/from cgroups. Latter is done because it is
handy to ignore the groups with no DRM clients in relative weight
calculations.

The notifications are also consolidated by using a delayed worker.

On the userspace API level we use the same range and defaults as the CPU
controller - CGROUP_WEIGHT_MIN, CGROUP_WEIGHT_DFL and CGROUP_WEIGHT_MAX.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>
---
 Documentation/admin-guide/cgroup-v2.rst |  22 ++
 include/linux/cgroup_drm.h              |   2 +
 kernel/cgroup/drm.c                     | 324 +++++++++++++++++++++++-
 3 files changed, 335 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 51c0bc4c2dc5..924ffc156494 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2800,6 +2800,28 @@ HugeTLB Interface Files
         hugetlb pages of <hugepagesize> in this cgroup.  Only active in
         use hugetlb pages are included.  The per-node values are in bytes.
 
+DRM
+---
+
+The controller allows for configuring of scheduling weights of cgroups relative
+to their siblings.
+
+NOTE: This is an optional feature into which individual DRM drivers need to
+      opt-in if they want to support it.
+
+NOTE: Only single GPU systems will work as expected in the current
+      implementation.
+
+DRM Interface Files
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+  drm.weight
+        A read-write single value file which exists on non-root cgroups. The
+        default is "100".
+
+        The weights are in the range [1, 10000] and specify the relative
+        scheduling weights for cgroups in relation to their siblings.
+
 Misc
 ----
 
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 318b0e441496..98d18ace9df6 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -6,6 +6,8 @@
 
 #include <drm/drm_file.h>
 
+#define DRM_CGROUP_WEIGHT_SHIFT 10
+
 #if IS_ENABLED(CONFIG_CGROUP_DRM)
 void drmcgroup_client_open(struct drm_file *file_priv);
 void drmcgroup_client_close(struct drm_file *file_priv);
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index ea7655edf86a..ef35e181d269 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -13,10 +13,18 @@ struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
 
 	struct list_head clients;
+	unsigned int num_clients; /* Whole branch */
+
+	unsigned int sum_children_weights;
+
+	unsigned int weight;
+	unsigned int effective_weight;
 };
 
 struct drm_root_cgroup_state {
 	struct drm_cgroup_state drmcs;
+
+	struct delayed_work notify_work;
 };
 
 static struct drm_root_cgroup_state root_drmcs = {
@@ -31,7 +39,7 @@ css_to_drmcs(struct cgroup_subsys_state *css)
 	return container_of(css, struct drm_cgroup_state, css);
 }
 
-static void __maybe_unused
+static void
 drmcs_notify_weight(struct drm_cgroup_state *drmcs)
 {
 	struct drm_file *fpriv;
@@ -43,16 +51,159 @@ drmcs_notify_weight(struct drm_cgroup_state *drmcs)
 			fpriv->minor->dev->driver->cg_ops;
 
 		if (cg_ops && cg_ops->notify_weight)
-			cg_ops->notify_weight(fpriv, 0);
+			cg_ops->notify_weight(fpriv, drmcs->effective_weight);
 	}
 }
 
+static void drmcg_update_weights_locked(void)
+{
+	lockdep_assert_held(&drmcg_mutex);
+
+	/*
+	 * Coalesce series of rapid group re-configurations typical on cgroup
+	 * modifications and first/last clients entering/existing cgroups with
+	 * a delay not too short, for typically not very responsice GPU
+	 * scheduling capabilities, and not so long that it would significantly
+	 * limit the interactive usage of the controller.
+	 */
+	mod_delayed_work(system_wq,
+			 &root_drmcs.notify_work,
+			 usecs_to_jiffies(500));
+}
+
+static void drmcg_update_weights(void)
+{
+	mutex_lock(&drmcg_mutex);
+	drmcg_update_weights_locked();
+	mutex_unlock(&drmcg_mutex);
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
+	drmcg_update_weights_locked();
+	mutex_unlock(&drmcg_mutex);
+
+	return 0;
+}
+
+static void notify_worker(struct work_struct *work)
+{
+	struct drm_cgroup_state *root = &root_drmcs.drmcs;
+	struct cgroup_subsys_state *node;
+	bool updated;
+
+	mutex_lock(&drmcg_mutex);
+	rcu_read_lock();
+
+	/*
+	 * Always come back later if we race with core cgroup management.
+	 */
+	updated = false;
+	if (WARN_ON_ONCE(!css_tryget_online(&root->css)))
+		goto out_unlock;
+
+	css_for_each_descendant_post(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+
+		if (!css_tryget_online(node))
+			goto out_put;
+
+		drmcs->sum_children_weights = 0;
+		css_put(node);
+	}
+
+	css_for_each_descendant_post(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+		struct drm_cgroup_state *parent;
+
+		if (!css_tryget_online(node))
+			goto out_put;
+		if (!node->parent || !drmcs->num_clients) {
+			css_put(node);
+			continue;
+		}
+		if (!css_tryget_online(node->parent)) {
+			css_put(node);
+			goto out_put;
+		}
+
+		parent = css_to_drmcs(node->parent);
+		parent->sum_children_weights += drmcs->weight;
+		css_put(node);
+		css_put(&parent->css);
+	}
+
+	css_for_each_descendant_pre(node, &root->css) {
+		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
+		struct cgroup_subsys_state *css;
+
+		if (!css_tryget_online(node))
+			goto out_put;
+		if (!drmcs->num_clients) {
+			css_put(node);
+			continue;
+		}
+
+		css_for_each_child(css, &drmcs->css) {
+			struct drm_cgroup_state *sibling = css_to_drmcs(css);
+
+			if (!css_tryget_online(css)) {
+				css_put(node);
+				goto out_put;
+			}
+			if (!sibling->num_clients) {
+				css_put(css);
+				continue;
+			}
+
+			sibling->effective_weight =
+				DIV_ROUND_CLOSEST(sibling->weight <<
+						  DRM_CGROUP_WEIGHT_SHIFT,
+						  drmcs->sum_children_weights);
+			drmcs_notify_weight(sibling);
+			css_put(css);
+		}
+
+		css_put(node);
+	}
+
+	updated = true;
+
+out_put:
+	css_put(&root->css);
+out_unlock:
+	rcu_read_unlock();
+
+	if (!updated)
+		drmcg_update_weights_locked();
+
+	mutex_unlock(&drmcg_mutex);
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
-	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
-
-	if (drmcs != &root_drmcs.drmcs)
-		kfree(drmcs);
+	if (css != &root_drmcs.drmcs.css)
+		kfree(css_to_drmcs(css));
 }
 
 static struct cgroup_subsys_state *
@@ -62,6 +213,7 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 
 	if (!parent_css) {
 		drmcs = &root_drmcs.drmcs;
+		INIT_DELAYED_WORK(&root_drmcs.notify_work, notify_worker);
 	} else {
 		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
 		if (!drmcs)
@@ -70,9 +222,142 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 		INIT_LIST_HEAD(&drmcs->clients);
 	}
 
+	drmcs->weight = CGROUP_WEIGHT_DFL;
+	drmcs->effective_weight = (1 << DRM_CGROUP_WEIGHT_SHIFT) / 2;
+
 	return &drmcs->css;
 }
 
+static int drmcs_online(struct cgroup_subsys_state *css)
+{
+	drmcg_update_weights();
+
+	return 0;
+}
+
+static void drmcs_offline(struct cgroup_subsys_state *css)
+{
+	drmcg_update_weights();
+}
+
+static struct drm_cgroup_state *old_drmcs;
+
+static int drmcs_can_attach(struct cgroup_taskset *tset)
+{
+	struct cgroup_subsys_state *css;
+	struct task_struct *task;
+
+	task = cgroup_taskset_first(tset, &css);
+	old_drmcs = css_to_drmcs(task_css(task, drm_cgrp_id));
+
+	return 0;
+}
+
+static void __inc_clients(struct drm_cgroup_state *drmcs)
+{
+	struct cgroup_subsys_state *parent = NULL;
+
+	rcu_read_lock();
+	do {
+		drmcs->num_clients++;
+		WARN_ON_ONCE(!drmcs->num_clients);
+
+		if (parent)
+			css_put(parent);
+
+		parent = drmcs->css.parent;
+		if (parent) {
+			if (WARN_ON_ONCE(!css_tryget(parent)))
+				break;
+
+			drmcs = css_to_drmcs(parent);
+		}
+	} while (parent);
+	rcu_read_unlock();
+}
+
+static void __dec_clients(struct drm_cgroup_state *drmcs)
+{
+	struct cgroup_subsys_state *parent = NULL;
+
+	rcu_read_lock();
+	do {
+		WARN_ON_ONCE(!drmcs->num_clients);
+		drmcs->num_clients--;
+
+		if (parent)
+			css_put(parent);
+
+		parent = drmcs->css.parent;
+		if (parent) {
+			if (WARN_ON_ONCE(!css_tryget(parent)))
+				break;
+
+			drmcs = css_to_drmcs(parent);
+		}
+	} while (parent);
+	rcu_read_unlock();
+}
+
+static void
+drmcg_migrate_client(struct drm_file *fpriv,
+		       struct drm_cgroup_state *old,
+		       struct drm_cgroup_state *new)
+{
+	fpriv->__css = &new->css;
+	list_move_tail(&fpriv->clink, &new->clients);
+	__dec_clients(old);
+	__inc_clients(new);
+	css_put(&old->css);
+}
+
+static void drmcs_attach(struct cgroup_taskset *tset)
+{
+	struct drm_cgroup_state *old = old_drmcs;
+	struct drm_cgroup_state *src, *dst;
+	struct cgroup_subsys_state *css;
+	struct drm_file *fpriv, *next;
+	struct task_struct *task;
+	bool migrated = false;
+
+	if (!old)
+		return;
+
+	mutex_lock(&drmcg_mutex);
+
+	list_for_each_entry_safe(fpriv, next, &old->clients, clink) {
+		cgroup_taskset_for_each_leader(task, css, tset) {
+			if (task->flags & PF_KTHREAD)
+				continue;
+
+			/* Clients which have migrated away via SCM_RIGHTS. */
+			if (rcu_access_pointer(fpriv->pid) != task_tgid(task))
+				continue;
+
+			dst = css_to_drmcs(task_css(task, drm_cgrp_id));
+			src = css_to_drmcs(fpriv->__css);
+			if (src == dst)
+				continue;
+
+			css_get(&dst->css);
+			drmcg_migrate_client(fpriv, src, dst);
+			migrated = true;
+		}
+	}
+
+	if (migrated)
+		drmcg_update_weights_locked();
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
@@ -85,6 +370,8 @@ void drmcgroup_client_open(struct drm_file *file_priv)
 	mutex_lock(&drmcg_mutex);
 	file_priv->__css = &drmcs->css; /* Keeps the reference. */
 	list_add_tail(&file_priv->clink, &drmcs->clients);
+	__inc_clients(drmcs);
+	drmcg_update_weights_locked();
 	mutex_unlock(&drmcg_mutex);
 }
 EXPORT_SYMBOL_GPL(drmcgroup_client_open);
@@ -100,7 +387,9 @@ void drmcgroup_client_close(struct drm_file *file_priv)
 
 	mutex_lock(&drmcg_mutex);
 	list_del(&file_priv->clink);
+	__dec_clients(drmcs);
 	file_priv->__css = NULL;
+	drmcg_update_weights_locked();
 	mutex_unlock(&drmcg_mutex);
 
 	css_put(&drmcs->css);
@@ -110,35 +399,44 @@ EXPORT_SYMBOL_GPL(drmcgroup_client_close);
 void drmcgroup_client_migrate(struct drm_file *file_priv)
 {
 	struct drm_cgroup_state *src, *dst;
-	struct cgroup_subsys_state *old;
 
 	if (!file_priv->minor->dev->driver->cg_ops)
 		return;
 
 	mutex_lock(&drmcg_mutex);
 
-	old = file_priv->__css;
-	src = css_to_drmcs(old);
+	src = css_to_drmcs(file_priv->__css);
 	dst = css_to_drmcs(task_get_css(current, drm_cgrp_id));
 
 	if (src != dst) {
-		file_priv->__css = &dst->css; /* Keeps the reference. */
-		list_move_tail(&file_priv->clink, &dst->clients);
+		drmcg_migrate_client(file_priv, src, dst);
+		drmcg_update_weights_locked();
+	} else {
+		css_put(&dst->css);
 	}
 
 	mutex_unlock(&drmcg_mutex);
-
-	css_put(old);
 }
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
2.48.0

