Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA22B11793
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E49D10E41E;
	Fri, 25 Jul 2025 05:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7lehPIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593FC10E419;
 Fri, 25 Jul 2025 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419858; x=1784955858;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+lCjD91myzsQgC8opfuAMchW/OE6eApOt869C0u26YY=;
 b=f7lehPICyO6Rx4ZoKbQMQRmVx3Z5OYj4SnkgwYu/ChDOxl7o3HCwLDIQ
 ZhyHzJdJFd/ZKKxM+WwiZrivAdvQyj/cHehI883wLpUACYItdYYMoUjZ5
 nZbtJMl0GR1fNyiAT63YlPJvg5TJgsWJtqu/5u+L4jRdPhqc96cRrKMxe
 EamPrVj2+LXlnMvuuziSDnm80csQ+/X6uter89Q/s1iFiXB6V+VfK74Zo
 EGmKSw8LDtTIFX/FjnbHQYv1zHkynATkqUfgX1A3L6Th98PRhf8YuQH9B
 E2JWys6iBMXWHpIXXeQNdADb4KWCOB132ywBXDx65P1GCePJ7Yq4vMtJF g==;
X-CSE-ConnectionGUID: 0goQ789KSK2t5LpJJD/zzQ==
X-CSE-MsgGUID: d1KoIjKRSUmzrUv4pjHXmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299512"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:18 -0700
X-CSE-ConnectionGUID: 51JVhvsaRsO0sDJL3rE5/g==
X-CSE-MsgGUID: obLqR/AYQ5anFybBYkZrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956474"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:16 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/28] drm/writeback: Add function that takes preallocated
 connector
Date: Fri, 25 Jul 2025 10:33:42 +0530
Message-Id: <20250725050409.2687242-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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

Write a function that takes a preallocated drm_connector instead of
using the one allocated inside the drm writeback connector init
function.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_writeback.c | 76 +++++++++++++++++++++++++++++++++
 include/drm/drm_writeback.h     |  7 +++
 2 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda6..fa58eb0dc7bf 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -416,6 +416,82 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_writeback_connector_init);
 
+/*
+ * drm_writeback_connector_init_with_conn - Initialize a writeback connector with
+ * custom encoder and connector
+ *
+ * @enc: handle to the already initialized drm encoder
+ * @con_funcs: Connector funcs vtable
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function assumes that the drm_writeback_connector's encoder has already been
+ * created and initialized before invoking this function.
+ *
+ * In addition, this function also assumes that callers of this API will manage
+ * assigning the encoder helper functions, possible_crtcs and any other encoder
+ * specific operation.
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors if they want to manage themselves the lifetime of the
+ * associated encoder.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int
+drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connector *connector,
+				       struct drm_writeback_connector *wb_connector,
+				       struct drm_encoder *enc,
+				       const struct drm_connector_funcs *con_funcs,
+				       const u32 *formats, int n_formats)
+{
+	struct drm_property_blob *blob;
+	struct drm_mode_config *config = &dev->mode_config;
+	int ret = create_writeback_properties(dev);
+
+	if (ret != 0)
+		return ret;
+
+	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
+					formats);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	connector->interlace_allowed = 0;
+
+	ret = drm_connector_init(dev, connector, con_funcs,
+				 DRM_MODE_CONNECTOR_WRITEBACK);
+	if (ret)
+		goto connector_fail;
+
+	INIT_LIST_HEAD(&wb_connector->job_queue);
+	spin_lock_init(&wb_connector->job_lock);
+
+	wb_connector->fence_context = dma_fence_context_alloc(1);
+	spin_lock_init(&wb_connector->fence_lock);
+	snprintf(wb_connector->timeline_name,
+		 sizeof(wb_connector->timeline_name),
+		 "CONNECTOR:%d-%s", connector->base.id, connector->name);
+
+	drm_object_attach_property(&connector->base,
+				   config->writeback_out_fence_ptr_property, 0);
+
+	drm_object_attach_property(&connector->base,
+				   config->writeback_fb_id_property, 0);
+
+	drm_object_attach_property(&connector->base,
+				   config->writeback_pixel_formats_property,
+				   blob->base.id);
+	wb_connector->pixel_formats_blob_ptr = blob;
+
+	return 0;
+
+connector_fail:
+	drm_property_blob_put(blob);
+	return ret;
+}
+EXPORT_SYMBOL(drm_writeback_connector_init_with_conn);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a..149744dbeef0 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -167,6 +167,13 @@ int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_encoder *enc,
 				  const u32 *formats, int n_formats);
 
+int
+drm_writeback_connector_init_with_conn(struct drm_device *dev, struct drm_connector *connector,
+				       struct drm_writeback_connector *wb_connector,
+				       struct drm_encoder *enc,
+				       const struct drm_connector_funcs *con_funcs,
+				       const u32 *formats, int n_formats);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 
-- 
2.34.1

