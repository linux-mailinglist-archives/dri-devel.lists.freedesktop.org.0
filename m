Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416F766620F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D7810E7B3;
	Wed, 11 Jan 2023 17:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3057D10E7B2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6VNc8UTTTDXWWB2J8ixgEiVj8sADziKCjNdhy0RtikY=; b=Yj/lS27fXLS3yLaZj4mefM/z2v
 uIAkzseozek5eMdW4ZNWIQC5X+84lgVXfZUiqqJ2/Dka/obRTFtee87Slq15eq8WLOFtNKU3Xb7r6
 APnH8g6PtI0amUi45qOhdDZoPgCUR9WA6xtAesm51bVIaHaPkuSMefxosDVbP8eJNSXB1wjpnfOfA
 dtnZ3Ka8kpzTNfEWm4vZRTIyZL/0HDp5K+oq/nX3Jq+DFrTO3ipm+YOYA/+IxNDfWhpPzorEthrIY
 s0ZqGUg3/eqKlOOQJejbO9AxO0soIdisJLg+W8w4nXk6XxmiDsyxyhtE1hAB1t/OTSbRxVXylJseU
 OGXc0QEQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3h-005Sku-BQ; Wed, 11 Jan 2023 18:38:41 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 04/13] drm/debugfs: Create a debugfs infrastructure for
 encoders
Date: Wed, 11 Jan 2023 14:37:39 -0300
Message-Id: <20230111173748.752659-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the ability to add DRM debugfs files to a list managed by the
encoder and, during drm_encoder_register_all(), all added files will be
created at once.

Moreover, introduce some typesafety as struct drm_debugfs_encoder_entry
holds a drm_encoder instead of a drm_device. So, the drivers can get
a encoder object directly from the struct drm_debugfs_encoder_entry
in the show() callback.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_debugfs.c  | 36 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_encoder.c  |  6 ++++++
 drivers/gpu/drm/drm_internal.h |  5 +++++
 include/drm/drm_debugfs.h      | 26 ++++++++++++++++++++++++
 include/drm/drm_encoder.h      | 15 ++++++++++++++
 5 files changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index d9ec1ed5a7ec..6a763fe1b031 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -36,6 +36,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
@@ -271,6 +272,17 @@ void drm_debugfs_connector_init(struct drm_connector *connector)
 	drm_create_file_from_list(connector);
 }
 
+void drm_debugfs_encoder_init(struct drm_encoder *encoder)
+{
+	struct drm_minor *minor = encoder->dev->primary;
+	struct drm_debugfs_encoder_entry *entry, *tmp;
+
+	if (!minor)
+		return;
+
+	drm_create_file_from_list(encoder);
+}
+
 void drm_debugfs_late_register(struct drm_device *dev)
 {
 	struct drm_minor *minor = dev->primary;
@@ -404,6 +416,30 @@ void drm_debugfs_connector_add_file(struct drm_connector *connector, const char
 }
 EXPORT_SYMBOL(drm_debugfs_connector_add_file);
 
+/**
+ * drm_debugfs_encoder_add_file - Add a given file to the DRM encoder debugfs file list
+ * @encoder: DRM encoder object
+ * @name: debugfs file name
+ * @show: show callback
+ * @data: driver-private data, should not be device-specific
+ *
+ * Add a given file entry to the DRM encoder debugfs file list to be created on
+ * drm_encoder_register_all().
+ */
+void drm_debugfs_encoder_add_file(struct drm_encoder *encoder, const char *name,
+				  int (*show)(struct seq_file*, void*), void *data)
+{
+	struct drm_debugfs_encoder_entry *entry = drmm_kzalloc(encoder->dev,
+							       sizeof(*entry),
+							       GFP_KERNEL);
+
+	if (!entry)
+		return;
+
+	drm_debugfs_add_file_to_list(encoder);
+}
+EXPORT_SYMBOL(drm_debugfs_encoder_add_file);
+
 static int connector_show(struct seq_file *m, void *data)
 {
 	struct drm_connector *connector = m->private;
diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 1143bc7f3252..d6de6237cb4f 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -30,6 +30,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -78,6 +79,7 @@ int drm_encoder_register_all(struct drm_device *dev)
 			ret = encoder->funcs->late_register(encoder);
 		if (ret)
 			return ret;
+		drm_debugfs_encoder_init(encoder);
 	}
 
 	return 0;
@@ -125,9 +127,12 @@ static int __drm_encoder_init(struct drm_device *dev,
 	}
 
 	INIT_LIST_HEAD(&encoder->bridge_chain);
+	INIT_LIST_HEAD(&encoder->debugfs_list);
 	list_add_tail(&encoder->head, &dev->mode_config.encoder_list);
 	encoder->index = dev->mode_config.num_encoder++;
 
+	mutex_init(&encoder->debugfs_mutex);
+
 out_put:
 	if (ret)
 		drm_mode_object_unregister(dev, &encoder->base);
@@ -197,6 +202,7 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
 	drm_mode_object_unregister(dev, &encoder->base);
 	kfree(encoder->name);
 	list_del(&encoder->head);
+	mutex_destroy(&encoder->debugfs_mutex);
 	dev->mode_config.num_encoder--;
 
 	memset(encoder, 0, sizeof(*encoder));
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index dd9d7b8b45bd..363936ee8628 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -186,6 +186,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
 int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 		     struct dentry *root);
 void drm_debugfs_connector_init(struct drm_connector *connector);
+void drm_debugfs_encoder_init(struct drm_encoder *encoder);
 void drm_debugfs_cleanup(struct drm_minor *minor);
 void drm_debugfs_late_register(struct drm_device *dev);
 void drm_debugfs_connector_add(struct drm_connector *connector);
@@ -204,6 +205,10 @@ static inline void drm_debugfs_connector_init(struct drm_connector *connector)
 {
 }
 
+static inline void drm_debugfs_encoder_init(struct drm_encoder *encoder)
+{
+}
+
 static inline void drm_debugfs_cleanup(struct drm_minor *minor)
 {
 }
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index c09c82274622..677ed3fee5e1 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -139,6 +139,23 @@ struct drm_debugfs_connector_entry {
 	struct list_head list;
 };
 
+/**
+ * struct drm_debugfs_encoder_entry - Per-encoder debugfs node structure
+ *
+ * This structure represents a debugfs file, as an instantiation of a &struct
+ * drm_debugfs_info on a &struct drm_encoder.
+ */
+struct drm_debugfs_encoder_entry {
+	/** @encoder: &struct drm_encoder for this node. */
+	struct drm_encoder *encoder;
+
+	/** @file: Template for this node. */
+	struct drm_debugfs_info file;
+
+	/** @list: Linked list of all encoder nodes. */
+	struct list_head list;
+};
+
 #if defined(CONFIG_DEBUG_FS)
 void drm_debugfs_create_files(const struct drm_info_list *files,
 			      int count, struct dentry *root,
@@ -154,6 +171,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
 
 void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
 				    int (*show)(struct seq_file*, void*), void *data);
+
+void drm_debugfs_encoder_add_file(struct drm_encoder *encoder, const char *name,
+				  int (*show)(struct seq_file*, void*), void *data);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -181,6 +201,12 @@ static inline void drm_debugfs_connector_add_file(struct drm_connector *connecto
 						  int (*show)(struct seq_file*, void*),
 						  void *data)
 {}
+
+static inline void drm_debugfs_encoder_add_file(struct drm_encoder *encoder,
+						const char *name,
+						int (*show)(struct seq_file*, void*),
+						void *data)
+{}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 3a09682af685..38b73f2a4e38 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -182,6 +182,21 @@ struct drm_encoder {
 	 */
 	struct list_head bridge_chain;
 
+	/**
+	 * @debugfs_mutex:
+	 *
+	 * Protects &debugfs_list access.
+	 */
+	struct mutex debugfs_mutex;
+
+	/**
+	 * @debugfs_list:
+	 *
+	 * List of debugfs files to be created by the DRM encoder. The files
+	 * must be added during drm_encoder_register_all().
+	 */
+	struct list_head debugfs_list;
+
 	const struct drm_encoder_funcs *funcs;
 	const struct drm_encoder_helper_funcs *helper_private;
 };
-- 
2.39.0

