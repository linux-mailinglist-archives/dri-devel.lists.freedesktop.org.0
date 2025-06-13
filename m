Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B3FAD8305
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606DB10E8C6;
	Fri, 13 Jun 2025 06:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/JZzWrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7610E8C9;
 Fri, 13 Jun 2025 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749795368; x=1781331368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z/+9gztBcK14kSVAemXmrxR8yZeJ5ss/8zeUk4l4QNM=;
 b=N/JZzWrWh8nnKRYJfYeZnxIfYLhadi/0cs9WGwQxnx63ZSlQ9lWjw3JG
 QjwWSebeLg605OoBSLsoFCLd/oF+0P+Cswc8WlNRh4B0N34ETMCi/azv2
 InBUKRdUosf4ts453CiTmUCua7tPM0v/Bk8jyLsG0i9TNIK9Zvx4G8lwf
 FzmSQ2I4BzbdSahAKp5o0orN5WGCPwYqf1KbCd4dZL5Mtp6tFLIpBsB9D
 /qgVKBSQSAyN4NM+mkW2VTntFoMuEZclcxTgqNKh+1MQWrhV1MbIZsir7
 iguAR1Eee8RNNwDfGrxWFHdBggPcfJtbOliDkIMupZsXESCxR8fDEu4E9 g==;
X-CSE-ConnectionGUID: fmQzBilFSrG527SYe+irEw==
X-CSE-MsgGUID: FlpN5dFoRkqQ1w2r7SetrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39608791"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="39608791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:16:07 -0700
X-CSE-ConnectionGUID: xg4gHgrDRt6RGm077BGyYw==
X-CSE-MsgGUID: VGO2NrGXSVK6kmszEHFNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152717202"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 23:16:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 1/4] drm/writeback: Add function that takes preallocated
 connector
Date: Fri, 13 Jun 2025 11:45:47 +0530
Message-Id: <20250613061550.2893526-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613061550.2893526-1-suraj.kandpal@intel.com>
References: <20250613061550.2893526-1-suraj.kandpal@intel.com>
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

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index edbeab88ff2b..0d287ab9bded 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -414,6 +414,89 @@ int drmm_writeback_connector_init(struct drm_device *dev,
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
+
+	connector->interlace_allowed = 0;
+
+	ret = drm_connector_init(dev, connector, con_funcs,
+				 DRM_MODE_CONNECTOR_WRITEBACK);
+	if (ret)
+		goto connector_fail;
+
+	ret = drm_connector_attach_encoder(connector, enc);
+	if (ret)
+		goto attach_fail;
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
+attach_fail:
+	drm_connector_cleanup(connector);
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

