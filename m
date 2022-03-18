Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40284DD288
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 02:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A5F10E912;
	Fri, 18 Mar 2022 01:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DB310E90E;
 Fri, 18 Mar 2022 01:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647567958; x=1679103958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/pUBQFrO+ylnicwV04Io0OPUO/WDKjOFZOW53gVYKY8=;
 b=mlFJ2K9pOBknF4DzAdn6gfRa4TzBL89P3THSRBO3eysIg5geXF+M7ulZ
 Pxdfo1FF5ARsyFdPH0ErxKMh/+B5yS7t14YdPo/R8zdMLJiYoH40RqsJn
 JNea9Z4/UfqRwaqku9zZpJ8oukHeE0AjRr+A8vtECgyC2yVCViUqLYVxT Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Mar 2022 18:45:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 18:45:57 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:57 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 17 Mar 2022 18:45:56 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Date: Thu, 17 Mar 2022 18:45:35 -0700
Message-ID: <1647567936-11971-4-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
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

changes in v4:
	- removed the possible_crtcs part

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 147 ++++++++++++++++++++++++++++------------
 include/drm/drm_writeback.h     |   5 ++
 2 files changed, 108 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a4c17d6..d0672f5 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -149,37 +149,15 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
+static int drm_writeback_connector_setup(struct drm_device *dev,
+		struct drm_writeback_connector *wb_connector,
+		const struct drm_connector_funcs *con_funcs, const u32 *formats,
+		int n_formats)
 {
 	struct drm_property_blob *blob;
-	struct drm_connector *connector = &wb_connector->base;
 	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_connector *connector = &wb_connector->base;
+
 	int ret = create_writeback_properties(dev);
 
 	if (ret != 0)
@@ -187,20 +165,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
 
 	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
 					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
-
-	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder = &wb_connector->internal_encoder;
-
-	wb_connector->encoder->possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		goto fail;
+	if (IS_ERR(blob)) {
+		ret = PTR_ERR(blob);
+		return ret;
+	}
 
 	connector->interlace_allowed = 0;
 
@@ -239,13 +207,104 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(wb_connector->encoder);
-fail:
 	drm_property_blob_put(blob);
 	return ret;
 }
+
+/**
+ * drm_writeback_connector_init - Initialize a writeback connector and its properties
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ * @possible_crtcs: possible crtcs for the internal writeback encoder
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values. It will also create an internal encoder associated with the
+ * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
+ * the encoder helper.
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drm_writeback_connector_init(struct drm_device *dev,
+		struct drm_writeback_connector *wb_connector,
+		const struct drm_connector_funcs *con_funcs,
+		const struct drm_encoder_helper_funcs *enc_helper_funcs,
+		const u32 *formats, int n_formats, uint32_t possible_crtcs)
+{
+	int ret = 0;
+
+	wb_connector->encoder = &wb_connector->internal_encoder;
+
+	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
+
+	wb_connector->encoder->possible_crtcs = possible_crtcs;
+
+	ret = drm_encoder_init(dev, wb_connector->encoder,
+			       &drm_writeback_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
+	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
+			n_formats);
+
+	if (ret)
+		drm_encoder_cleanup(wb_connector->encoder);
+
+	return ret;
+}
 EXPORT_SYMBOL(drm_writeback_connector_init);
 
+/**
+ * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
+ * using the encoder which already assigned and initialized
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * This function assumes that the drm_writebac_connector's encoder has already been
+ * created and initialized before invoking this function.
+ *
+ * In addition, this function also assumes that callers of this API will manage
+ * assigning the encoder helper functions, possible_crtcs and any other encoder
+ * specific operation which is otherwise handled by drm_writeback_connector_init().
+ *
+ * Drivers should always use this function instead of drm_connector_init() to
+ * set up writeback connectors.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+		struct drm_writeback_connector *wb_connector,
+		const struct drm_connector_funcs *con_funcs, const u32 *formats,
+		int n_formats)
+{
+	int ret = 0;
+
+	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
+			n_formats);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c525b60..ed35c3d 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -166,6 +166,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
 				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
 
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+				struct drm_writeback_connector *wb_connector,
+				const struct drm_connector_funcs *con_funcs, const u32 *formats,
+				int n_formats);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 
-- 
2.7.4

