Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B8AA721C
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4670510E925;
	Fri,  2 May 2025 12:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YxwFWLVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C436F10E920;
 Fri,  2 May 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+sTtbgkmT3oLpBwrf5+7YA2YAqnoO/5BAQjQk2WTRgI=; b=YxwFWLVJYMoOHXcfzBB6t+Qmoo
 2rkjhvw+xB1plW4mXbW0D59sHh48FfExeQPmwjeNtXQhRxAV4s708nfvFo0ztHOEiRXugLI6fJVyW
 BMeOZRU6cRmnWFRT5G24V+c+oI0QStlCCAuuOd8YLrpeNFtkWbLCy4l/TEC1h9Ef35YJ04yCOs31w
 FHKEdjX4VnAXK04+lP3MWwhqQfhZdr3ykogbuU827Hue3lKFZK4D1JICtUrsZPOXcIEJlxqADIzia
 rm0TLdEzXKsTyuJMmpc5/BTUhg3KlXySoIpEWILvDBpcntZQzUJ4H8b1MY/LY+R60WociqJi4McXl
 o32pjdaw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApYz-0025IJ-HJ; Fri, 02 May 2025 14:34:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 18/23] cgroup/drm: Track DRM clients per cgroup
Date: Fri,  2 May 2025 13:32:51 +0100
Message-ID: <20250502123256.50540-19-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
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

To enable propagation of settings from the cgroup DRM controller to DRM
and vice-versa, we need to start tracking to which cgroups DRM clients
belong.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_file.c |  8 +++++
 include/drm/drm_file.h     |  6 ++++
 include/linux/cgroup_drm.h | 20 ++++++++++++
 kernel/cgroup/drm.c        | 62 +++++++++++++++++++++++++++++++++++++-
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index cf2463090d3a..7500b2b14fd5 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -32,6 +32,7 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/cgroup_drm.h>
 #include <linux/dma-fence.h>
 #include <linux/file.h>
 #include <linux/module.h>
@@ -275,6 +276,8 @@ static void drm_close_helper(struct file *filp)
 	list_del(&file_priv->lhead);
 	mutex_unlock(&dev->filelist_mutex);
 
+	drmcgroup_client_close(file_priv);
+
 	drm_file_free(file_priv);
 }
 
@@ -339,6 +342,8 @@ int drm_open_helper(struct file *filp, struct drm_minor *minor)
 	list_add(&priv->lhead, &dev->filelist);
 	mutex_unlock(&dev->filelist_mutex);
 
+	drmcgroup_client_open(priv);
+
 	return 0;
 }
 
@@ -465,6 +470,9 @@ void drm_file_update_pid(struct drm_file *filp)
 	old = rcu_replace_pointer(filp->pid, pid, 1);
 	mutex_unlock(&dev->filelist_mutex);
 
+	if (pid != old)
+		drmcgroup_client_migrate(filp);
+
 	synchronize_rcu();
 	put_pid(old);
 }
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..76b194c0fc52 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -30,6 +30,7 @@
 #ifndef _DRM_FILE_H_
 #define _DRM_FILE_H_
 
+#include <linux/cgroup.h>
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/idr.h>
@@ -295,6 +296,11 @@ struct drm_file {
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
index 3e51fe517791..d6a9a2fbdbf5 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -4,4 +4,24 @@
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
index 55947a009e04..e9dc1e7cc4a4 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -3,17 +3,25 @@
 
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
@@ -40,11 +48,63 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
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
2.48.0

