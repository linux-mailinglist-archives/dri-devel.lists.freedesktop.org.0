Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC46A5E91E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 01:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB3B10E7DD;
	Thu, 13 Mar 2025 00:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aTcYTRi+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 248DC10E6B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 00:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741827299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vd4fCNFC+lOuRE2nCJ87YsqmQcaEJLBl3PTt38kWZ1M=;
 b=aTcYTRi+nM5lUDD0YDpUgNbwYndThufPyH5fuVNGsIY6DaUgFdn24IQRFj4mdS9rxYhbeV
 0QyJGb7GdWRnDKc4jeGhct9Pr21dz+PJqIASj7c9gKkyi1RjXlzdPJE/yX1mzrtxvtHfqS
 1IqYbSWWZ0D1jvBDxLGWb4f7TM+a88c=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-4v9x4ajGOwOoPz2gnt9GuQ-1; Wed,
 12 Mar 2025 20:54:57 -0400
X-MC-Unique: 4v9x4ajGOwOoPz2gnt9GuQ-1
X-Mimecast-MFC-AGG-ID: 4v9x4ajGOwOoPz2gnt9GuQ_1741827295
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 49CB91801A07; Thu, 13 Mar 2025 00:54:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 126D31944EAA; Thu, 13 Mar 2025 00:54:52 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 12 Mar 2025 20:54:42 -0400
Subject: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
In-Reply-To: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741827289; l=5147;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=4eVmaTh/DsiiU1jYHU7InsIJ/mtV1Znbj9kTZr9ARLg=;
 b=phOKrCm/dhCkVNgihJRTEqzPfohSjfuWE+qbZ9n9iAEZtiVYEH8bzYli5xYhgVG8ePHvATK/U
 FIEpTc+mOwTClAwbvX85nbhtE8s+3H0wSIku3BAx7cGGnX7O30974vF
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

Introduce reference counted allocations for panels to avoid
use-after-free. The patch adds the macro devm_drm_bridge_alloc()
to allocate a new refcounted panel. Followed the documentation for
drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
implementations for this purpose.

Also adding drm_panel_get() and drm_panel_put() to suitably
increment and decrement the refcount

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 50 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_panel.h     | 58 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c627e42a7ce70459f50eb5095fffc806ca45dabf..b55e380e4a2f7ffd940c207e841c197d85113907 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -79,6 +79,7 @@ EXPORT_SYMBOL(drm_panel_init);
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	drm_panel_get(panel);
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -96,6 +97,7 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
@@ -355,6 +357,54 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_find_panel);
 
+/* Internal function (for refcounted panels) */
+void __drm_panel_free(struct kref *kref)
+{
+	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
+	void *container = ((void *)panel) - panel->container_offset;
+
+	kfree(container);
+}
+EXPORT_SYMBOL(__drm_panel_free);
+
+static void drm_panel_put_void(void *data)
+{
+	struct drm_panel *panel = (struct drm_panel *)data;
+
+	drm_panel_put(panel);
+}
+
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs)
+{
+	void *container;
+	struct drm_panel *panel;
+	int err;
+
+	if (!funcs) {
+		dev_warn(dev, "Missing funcs pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	container = kzalloc(size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	panel = container + offset;
+	panel->container_offset = offset;
+	panel->funcs = funcs;
+	kref_init(&panel->refcount);
+
+	err = devm_add_action_or_reset(dev, drm_panel_put_void, panel);
+	if (err)
+		return ERR_PTR(err);
+
+	drm_panel_init(panel, dev, funcs, panel->connector_type);
+
+	return container;
+}
+EXPORT_SYMBOL(__devm_drm_panel_alloc);
+
 /**
  * of_drm_get_panel_orientation - look up the orientation of the panel through
  * the "rotation" binding from a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index a9c042c8dea1a82ef979c7a68204e0b55483fc28..f7cfda0039c066ea2c2b26da5062015e61880971 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 
 struct backlight_device;
 struct dentry;
@@ -266,8 +267,65 @@ struct drm_panel {
 	 * If true then the panel has been enabled.
 	 */
 	bool enabled;
+
+	/**
+	 * @container_offset: Offset of this struct within the container
+	 * struct embedding it. Used for refcounted panels to free the
+	 * embeddeing struct when the refcount drops to zero.
+	 */
+	size_t container_offset;
+	/**
+	 * @refcount: reference count for panels with dynamic lifetime
+	 */
+	struct kref refcount;
 };
 
+void __drm_panel_free(struct kref *kref);
+
+/**
+ * drm_panel_get - Acquire a panel reference
+ * @panel: DRM panel
+ *
+ * This function increments the panel's refcount.
+ *
+ */
+static inline void drm_panel_get(struct drm_panel *panel)
+{
+
+	kref_get(&panel->refcount);
+}
+
+/**
+ * drm_panel_put - Release a panel reference
+ * @panel: DRM panel
+ *
+ * This function decrements the panel's reference count and frees the
+ * object if the reference count drops to zero.
+ */
+static inline void drm_panel_put(struct drm_panel *panel)
+{
+	kref_put(&panel->refcount, __drm_panel_free);
+}
+
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs);
+
+/**
+ * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
+ * @dev: struct device of the panel device
+ * @type: the type of the struct which contains struct &drm_panel
+ * @member: the name of the &drm_panel within @type
+ * @funcs: callbacks for this panel
+ *
+ * The returned refcount is initialised to 1
+ *
+ * Returns:
+ * Pointer to new panel, or ERR_PTR on failure.
+ */
+#define devm_drm_panel_alloc(dev, type, member, funcs) \
+	((type *)__devm_drm_panel_alloc(dev, sizeof(type), \
+					 offsetof(type, member), funcs))
+
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);

-- 
2.48.1

