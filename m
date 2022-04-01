Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD064EE516
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8410E31D;
	Fri,  1 Apr 2022 00:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6936F10E35D;
 Fri,  1 Apr 2022 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648771961; x=1680307961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=98ZCNTB8DVZqGDSX+i8faPJvEtYz1d/c6x5tGY8eIkM=;
 b=d7SAfrF9m4N5eKDoBdK++F3grhoi3yMpJ4+31KzmYmwvVxJMC9TEsTJG
 RMxRleuz1MNGcJ+fgvTd6HEesQcze06kU8Bf1XN9lUlCJPzaSG2Q9VaRF
 /73d2lWeLKJas2ZTVz+ApQNFKe8UdSH2/ZV6ThWBUQ6ic4Ghx5cryNMS1 k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2022 17:12:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 17:12:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 17:12:38 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 31 Mar 2022 17:12:38 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 2/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Date: Thu, 31 Mar 2022 17:12:11 -0700
Message-ID: <1648771933-18512-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, swboyd@chromium.org,
 melissa.srw@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For vendors drivers which pass an already allocated and
initialized encoder especially for cases where the encoder
hardware is shared OR the writeback encoder shares the resources
with the rest of the display pipeline introduce a new API,
drm_writeback_connector_init_with_encoder() which expects
an initialized encoder as a parameter and only sets up the
writeback connector.

changes in v6:
	- remove drm_writeback_connector_setup() and instead
	  directly call drm_writeback_connector_init_with_encoder()
	- fix a drm_writeback_connector typo and function doc which
	  incorrectly shows that the function accepts enc_helper_funcs
	- pass encoder as a parameter explicitly to the new API
	  for better readability

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 72 +++++++++++++++++++++++++++++++++--------
 include/drm/drm_writeback.h     |  6 ++++
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dc2ef12..797223c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -177,6 +177,62 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
 				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
 {
+	int ret = 0;
+
+	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
+
+	wb_connector->encoder.possible_crtcs = possible_crtcs;
+
+	ret = drm_encoder_init(dev, &wb_connector->encoder,
+			       &drm_writeback_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
+			con_funcs, formats, n_formats);
+
+	if (ret)
+		drm_encoder_cleanup(&wb_connector->encoder);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_writeback_connector_init);
+
+/**
+ * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
+ * using the encoder which already assigned and initialized
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @enc: handle to the already initialized drm encoder
+ * @con_funcs: Connector funcs vtable
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * This function assumes that the drm_writeback_connector's encoder has already been
+ * created and initialized before invoking this function.
+ *
+ * In addition, this function also assumes that callers of this API will manage
+ * assigning the encoder helper functions, possible_crtcs and any other encoder
+ * specific operation which is otherwise handled by drm_writeback_connector_init().
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors if they want to manage themselves the lifetime of the
+ * associated encoder.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+		struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
+		const struct drm_connector_funcs *con_funcs, const u32 *formats,
+		int n_formats)
+{
 	struct drm_property_blob *blob;
 	struct drm_connector *connector = &wb_connector->base;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -190,15 +246,6 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (IS_ERR(blob))
 		return PTR_ERR(blob);
 
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		goto fail;
 
 	connector->interlace_allowed = 0;
 
@@ -207,8 +254,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		goto connector_fail;
 
-	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
 		goto attach_fail;
 
@@ -237,12 +283,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
-fail:
 	drm_property_blob_put(blob);
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init);
+EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
 
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index db6214f..4795024 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -152,6 +152,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
 				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
 
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+				struct drm_writeback_connector *wb_connector,
+				struct drm_encoder *enc,
+				const struct drm_connector_funcs *con_funcs, const u32 *formats,
+				int n_formats);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 
-- 
2.7.4

