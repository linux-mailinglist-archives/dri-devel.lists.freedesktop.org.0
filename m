Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6864AB4252A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9F210E8F6;
	Wed,  3 Sep 2025 15:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AJ09Flzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B21C10E8E6;
 Wed,  3 Sep 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IsWnQWYQd8ok9z9F0TOX6bOGhUkIh9EKIXSKlJoEGYg=; b=AJ09FlzyVT9eal4yJ2y7P5g9IO
 w1f+9cHgbGl3iRDscUhAp0lbLfjExAOnXkIlUf2NlB3GGCaJQSx3efglfKiR+b+S56Sivu7WH44uP
 SUWaEv4spcoWUj0WJWDK5NbfGkcZhl6RonhveEVKddZMpGtjN+78NnM+DCRm5ot5gwOMbzDlOhXId
 DrPhG5xiNFlzXXwD67XjoBxDszQV5SzZubF3TxFxPvCSX/NR0OBWP2iMYlqV3n0ES62vlRmdKi9GY
 KDzC3mUPFeQC04i0WAFAOZaRiltFDelLdQVPc1ljAKjymgjKLii/k+f0+Z/831tzVTa32ffconV75
 yoPX4ZGQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utpKo-006Gak-6i; Wed, 03 Sep 2025 17:23:42 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 intel-xe@lists.freedesktop.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 15/21] cgroup/drm: Add scheduling weight callback
Date: Wed,  3 Sep 2025 16:23:21 +0100
Message-ID: <20250903152327.66002-16-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
References: <20250903152327.66002-1-tvrtko.ursulin@igalia.com>
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

Add a new callback via which the drm cgroup controller will be notifying
clients about their scheduling weight.

At the same time, in order to reduce the amount of tracking with drivers
which will not support any sort of control from the drm cgroup controller
side, lets express the funcionality as opt-in and use the presence of
drm_cgroup_ops as an activation criteria.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 include/drm/drm_drv.h | 26 ++++++++++++++++++++++++++
 kernel/cgroup/drm.c   | 27 +++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986d..5aa905187723 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -169,6 +169,22 @@ enum drm_driver_feature {
 	DRIVER_HAVE_IRQ			= BIT(30),
 };
 
+/**
+ * struct drm_cgroup_ops
+ *
+ * This structure contains callbacks that drivers can provide if they are able
+ * support the functionalities implemented by the DRM cgroup controller.
+ */
+struct drm_cgroup_ops {
+	/**
+	 * @notify_weight:
+	 *
+	 * Optional callback used by the DRM core to notify clients of their
+	 * scheduling weight.
+	 */
+	void (*notify_weight) (struct drm_file *, unsigned int weight);
+};
+
 /**
  * struct drm_driver - DRM driver structure
  *
@@ -431,6 +447,16 @@ struct drm_driver {
 	 * some examples.
 	 */
 	const struct file_operations *fops;
+
+#ifdef CONFIG_CGROUP_DRM
+	/**
+	 * @cg_ops:
+	 *
+	 * Optional pointer to driver callbacks facilitating integration with
+	 * the DRM cgroup controller.
+	 */
+	const struct drm_cgroup_ops *cg_ops;
+#endif
 };
 
 void *__devm_drm_dev_alloc(struct device *parent,
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index e9dc1e7cc4a4..ea7655edf86a 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -7,6 +7,8 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
+#include <drm/drm_drv.h>
+
 struct drm_cgroup_state {
 	struct cgroup_subsys_state css;
 
@@ -29,6 +31,22 @@ css_to_drmcs(struct cgroup_subsys_state *css)
 	return container_of(css, struct drm_cgroup_state, css);
 }
 
+static void __maybe_unused
+drmcs_notify_weight(struct drm_cgroup_state *drmcs)
+{
+	struct drm_file *fpriv;
+
+	lockdep_assert_held(&drmcg_mutex);
+
+	list_for_each_entry(fpriv, &drmcs->clients, clink) {
+		const struct drm_cgroup_ops *cg_ops =
+			fpriv->minor->dev->driver->cg_ops;
+
+		if (cg_ops && cg_ops->notify_weight)
+			cg_ops->notify_weight(fpriv, 0);
+	}
+}
+
 static void drmcs_free(struct cgroup_subsys_state *css)
 {
 	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
@@ -59,6 +77,9 @@ void drmcgroup_client_open(struct drm_file *file_priv)
 {
 	struct drm_cgroup_state *drmcs;
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	drmcs = css_to_drmcs(task_get_css(current, drm_cgrp_id));
 
 	mutex_lock(&drmcg_mutex);
@@ -74,6 +95,9 @@ void drmcgroup_client_close(struct drm_file *file_priv)
 
 	drmcs = css_to_drmcs(file_priv->__css);
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	mutex_lock(&drmcg_mutex);
 	list_del(&file_priv->clink);
 	file_priv->__css = NULL;
@@ -88,6 +112,9 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
 	struct drm_cgroup_state *src, *dst;
 	struct cgroup_subsys_state *old;
 
+	if (!file_priv->minor->dev->driver->cg_ops)
+		return;
+
 	mutex_lock(&drmcg_mutex);
 
 	old = file_priv->__css;
-- 
2.48.0

