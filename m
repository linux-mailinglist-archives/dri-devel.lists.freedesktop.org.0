Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800717506AF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 13:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F410E4FE;
	Wed, 12 Jul 2023 11:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B328810E4F5;
 Wed, 12 Jul 2023 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689162470; x=1720698470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k6qOYu4NXclI3gFUyWZN4CiwVZNliuA6Qng+UvN29DI=;
 b=GMKdUcYkbUwO+AIgiragx27EjOb4Cbi5qcDnS4RS5rKB91AyAfTtJ1u9
 d5AWsgN6hnXDvXySxYfyAEZy6V+ZPhMKqQpgcjJkKNp/vY5SwkKuzaGcj
 yny27I3MeQGSHQC9HIBsFxyYg8Hac7WCOj8je0VUhkk2hRIGYEeHDyoEF
 p8bN1yS2p7geQ5o5gSHM8bOIfX9Pr/6AVyYFA5wgk1cWGfJ1Xn5OjcbmS
 G7g25b4AlqCksg9DvmZPnGve6EbxLAbwHhZ9mKwDQ/XNvsU8wEvMSOiGP
 nrGvNlMOStU117+bz2tXVgakEAueF82UKYKktLOn+crxH+dyjzugcUaYi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344469217"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="344469217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="866094113"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; d="scan'208";a="866094113"
Received: from eamonnob-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.237.202])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 04:46:43 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/17] drm/cgroup: Track DRM clients per cgroup
Date: Wed, 12 Jul 2023 12:45:56 +0100
Message-Id: <20230712114605.519432-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
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

To enable propagation of settings from the cgroup DRM controller to DRM
and vice-versa, we need to start tracking to which cgroups DRM clients
belong.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_file.c |  6 ++++
 include/drm/drm_file.h     |  6 ++++
 include/linux/cgroup_drm.h | 20 ++++++++++++
 kernel/cgroup/drm.c        | 62 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e692770ef6d3..794ffb487472 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -32,6 +32,7 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/cgroup_drm.h>
 #include <linux/dma-fence.h>
 #include <linux/file.h>
 #include <linux/module.h>
@@ -304,6 +305,8 @@ static void drm_close_helper(struct file *filp)
 	list_del(&file_priv->lhead);
 	mutex_unlock(&dev->filelist_mutex);
 
+	drmcgroup_client_close(file_priv);
+
 	drm_file_free(file_priv);
 }
 
@@ -367,6 +370,8 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
+	drmcgroup_client_open(priv);
+
 #ifdef CONFIG_DRM_LEGACY
 #ifdef __alpha__
 	/*
@@ -533,6 +538,7 @@ void drm_file_update_pid(struct drm_file *filp)
 	mutex_unlock(&dev->filelist_mutex);
 
 	if (pid != old) {
+		drmcgroup_client_migrate(filp);
 		get_pid(pid);
 		synchronize_rcu();
 		put_pid(old);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index c76249d5467e..e8fb3a39d482 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -30,6 +30,7 @@
 #ifndef _DRM_FILE_H_
 #define _DRM_FILE_H_
 
+#include <linux/cgroup.h>
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/idr.h>
@@ -283,6 +284,11 @@ struct drm_file {
 	/** @minor: &struct drm_minor for this file. */
 	struct drm_minor *minor;
 
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+	struct cgroup_subsys_state *__css;
+	struct list_head clink;
+#endif
+
 	/**
 	 * @object_idr:
 	 *
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index 8ef66a47619f..176431842d8e 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -6,4 +6,24 @@
 #ifndef _CGROUP_DRM_H
 #define _CGROUP_DRM_H
 
+#include <drm/drm_file.h>
+
+#if IS_ENABLED(CONFIG_CGROUP_DRM)
+void drmcgroup_client_open(struct drm_file *file_priv);
+void drmcgroup_client_close(struct drm_file *file_priv);
+void drmcgroup_client_migrate(struct drm_file *file_priv);
+#else
+static inline void drmcgroup_client_open(struct drm_file *file_priv)
+{
+}
+
+static inline void drmcgroup_client_close(struct drm_file *file_priv)
+{
+}
+
+static void drmcgroup_client_migrate(struct drm_file *file_priv)
+{
+}
+#endif
+
 #endif	/* _CGROUP_DRM_H */
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 02c8eaa633d3..d702be1b441f 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -5,17 +5,25 @@
 
 #include <linux/cgroup.h>
 #include <linux/cgroup_drm.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 
 struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
+
+	struct list_head clients;
 };
 
 struct drm_root_cgroup_state {
 	struct drm_cgroup_state drmcs;
 };
 
-static struct drm_root_cgroup_state root_drmcs;
+static struct drm_root_cgroup_state root_drmcs = {
+	.drmcs.clients = LIST_HEAD_INIT(root_drmcs.drmcs.clients),
+};
+
+static DEFINE_MUTEX(drmcg_mutex);
 
 static inline struct drm_cgroup_state *
 css_to_drmcs(struct cgroup_subsys_state *css)
@@ -42,11 +50,63 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
 		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
 		if (!drmcs)
 			return ERR_PTR(-ENOMEM);
+
+		INIT_LIST_HEAD(&drmcs->clients);
 	}
 
 	return &drmcs->css;
 }
 
+void drmcgroup_client_open(struct drm_file *file_priv)
+{
+	struct drm_cgroup_state *drmcs;
+
+	drmcs = css_to_drmcs(task_get_css(current, drm_cgrp_id));
+
+	mutex_lock(&drmcg_mutex);
+	file_priv->__css = &drmcs->css; /* Keeps the reference. */
+	list_add_tail(&file_priv->clink, &drmcs->clients);
+	mutex_unlock(&drmcg_mutex);
+}
+EXPORT_SYMBOL_GPL(drmcgroup_client_open);
+
+void drmcgroup_client_close(struct drm_file *file_priv)
+{
+	struct drm_cgroup_state *drmcs;
+
+	drmcs = css_to_drmcs(file_priv->__css);
+
+	mutex_lock(&drmcg_mutex);
+	list_del(&file_priv->clink);
+	file_priv->__css = NULL;
+	mutex_unlock(&drmcg_mutex);
+
+	css_put(&drmcs->css);
+}
+EXPORT_SYMBOL_GPL(drmcgroup_client_close);
+
+void drmcgroup_client_migrate(struct drm_file *file_priv)
+{
+	struct drm_cgroup_state *src, *dst;
+	struct cgroup_subsys_state *old;
+
+	mutex_lock(&drmcg_mutex);
+
+	old = file_priv->__css;
+	src = css_to_drmcs(old);
+	dst = css_to_drmcs(task_get_css(current, drm_cgrp_id));
+
+	if (src != dst) {
+		file_priv->__css = &dst->css; /* Keeps the reference. */
+		list_move_tail(&file_priv->clink, &dst->clients);
+	}
+
+	mutex_unlock(&drmcg_mutex);
+
+	css_put(old);
+}
+EXPORT_SYMBOL_GPL(drmcgroup_client_migrate);
+
 struct cftype files[] = {
 	{ } /* Zero entry terminates. */
 };
-- 
2.39.2

