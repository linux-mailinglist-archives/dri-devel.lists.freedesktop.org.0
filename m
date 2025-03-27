Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8BA7350F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 15:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9D210E8E3;
	Thu, 27 Mar 2025 14:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VPfEVh3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ED910E8E3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743087357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbeQeU7H02nj924RcSWV+5mz8cMqy8mef33chj6M5xo=;
 b=VPfEVh3j1huT2mvkwQvMzg3ZMlyABM+w7JC36kmeoHvmSpU4HAR0KVGe3YiIC7KlqOm+9T
 fuTFGjjcju6rgP4FhR7B7+k7sBED/UKLA2zC6YkPkNpmZvAxXmgcgB73FgrdvBxlKHUN5Z
 GjUKA8LSK+mKKQtwdM1PKHpbF9Yy6fQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-fEudDy3bMIygTf0MA_4A2g-1; Thu,
 27 Mar 2025 10:55:53 -0400
X-MC-Unique: fEudDy3bMIygTf0MA_4A2g-1
X-Mimecast-MFC-AGG-ID: fEudDy3bMIygTf0MA_4A2g_1743087352
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F07081800349; Thu, 27 Mar 2025 14:55:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B4134180A803; Thu, 27 Mar 2025 14:55:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 10:55:40 -0400
Subject: [PATCH v2 2/4] drm/panel: Add refcount support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
In-Reply-To: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743087343; l=4202;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=C9ZVKVj8BJ8HCZ7TThUN+biNcgvCqbE69hUNOeyr+QM=;
 b=0MTamHhaOufQXxagw1dSm3sFiooVIvo9iC6BJg9XI5bbkLrBqsQ3m83RMJvvjtxz5n2zm2jf9
 qKNRLqhZbFKDQj16T/yqGLclygT0hfddoDY0n4on0mcjb4EPLn6MEdh
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Allocate panel via reference counting. Add _get() and _put() helper
functions to ensure panel allocations are refcounted. Avoid use after
free by ensuring panel pointer is valid and can be usable till the last
reference is put.

v2: Export drm_panel_put/get() (Maxime)
- Change commit log with better workding (Luca, Maxime)
- Change drm_panel_put() to return void (Luca)
- Code Cleanups - add return in documentation, replace bridge to
panel (Luca)

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     | 14 ++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4d8332f748 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_find_panel);
 
+static void __drm_panel_free(struct kref *kref)
+{
+	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
+
+	kfree(panel->container);
+}
+
+/**
+ * drm_panel_get - Acquire a panel reference
+ * @panel: DRM panel
+ *
+ * This function increments the panel's refcount.
+ * Returns:
+ * Pointer to @panel
+ */
+struct drm_panel *drm_panel_get(struct drm_panel *panel)
+{
+	if (!panel)
+		return panel;
+
+	kref_get(&panel->refcount);
+
+	return panel;
+}
+EXPORT_SYMBOL(drm_panel_get);
+
+/**
+ * drm_panel_put - Release a panel reference
+ * @panel: DRM panel
+ *
+ * This function decrements the panel's reference count and frees the
+ * object if the reference count drops to zero.
+ */
+void drm_panel_put(struct drm_panel *panel)
+{
+	if (panel)
+		kref_put(&panel->refcount, __drm_panel_free);
+}
+EXPORT_SYMBOL(drm_panel_put);
+
+/**
+ * drm_panel_put_void - wrapper to drm_panel_put() taking a void pointer
+ *
+ * @data: pointer to @struct drm_panel, cast to a void pointer
+ *
+ * Wrapper of drm_panel_put() to be used when a function taking a void
+ * pointer is needed, for example as a devm action.
+ */
+static void drm_panel_put_void(void *data)
+{
+	struct drm_panel *panel = (struct drm_panel *)data;
+
+	drm_panel_put(panel);
+}
+
 void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
 			     const struct drm_panel_funcs *funcs,
 			     int connector_type)
 {
 	void *container;
 	struct drm_panel *panel;
+	int err;
 
 	if (!funcs) {
 		dev_warn(dev, "Missing funcs pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	container = kzalloc(size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
 
 	panel = container + offset;
+	panel->container = container;
 	panel->funcs = funcs;
+	kref_init(&panel->refcount);
+
+	err = devm_add_action_or_reset(dev, drm_panel_put_void, panel);
+	if (err)
+		return ERR_PTR(err);
 
 	drm_panel_init(panel, dev, funcs, connector_type);
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 53251c6b11d78149ede3dad41ffa6a88f3c3c58b..5f8ae1be0532b0f861c33bb4d522b349cd469e9a 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -267,6 +267,17 @@ struct drm_panel {
 	 * If true then the panel has been enabled.
 	 */
 	bool enabled;
+
+	/**
+	 * @container: Pointer to the private driver struct embedding this
+	 * @struct drm_panel.
+	 */
+	void *container;
+
+	/**
+	 * @refcount: reference count of users referencing this panel.
+	 */
+	struct kref refcount;
 };
 
 void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
@@ -295,6 +306,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);
 
+struct drm_panel *drm_panel_get(struct drm_panel *panel);
+void drm_panel_put(struct drm_panel *panel);
+
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 

-- 
2.48.1

