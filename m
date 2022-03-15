Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EAE4DA613
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 00:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB89E10E377;
	Tue, 15 Mar 2022 23:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9D489E9B;
 Tue, 15 Mar 2022 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647385937; x=1678921937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=kQYkPTni2yz4gaadSXsF260RrBS+364Oort9/whEkBQ=;
 b=hSUd8v76HNwuJLTCz2faLFa+XQV/zuuA4dKV47zpnGRQIdRRhaEn59rI
 nUtqODaHxixxJE8ao6D862ENOiWzZ3juLJEdnIpXrTrLzCteYNl+xwKS5
 XLbEug083r206KhpH7i1GMo3qTad/mVRQaC07uIye/xaskUDW0HVKfZNH A=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 16:12:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 16:12:15 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 16:12:15 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 16:12:14 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/6] drm: allow real encoder to be passed for
 drm_writeback_connector
Date: Tue, 15 Mar 2022 16:11:57 -0700
Message-ID: <1647385922-31539-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1647385922-31539-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

For some vendor driver implementations, display hardware can
be shared between the encoder used for writeback and the physical
display.

In addition resources such as clocks and interrupts can
also be shared between writeback and the real encoder.

To accommodate such vendor drivers and hardware, allow
real encoder to be passed for drm_writeback_connector using a new
drm_writeback_connector_init_with_encoder() API.

In addition, to preserve the same call flows for the existing
users of drm_writeback_connector_init(), also allow passing
possible_crtcs as a parameter so that encoder can be initialized
with it.

changes in v2:
    - introduce a new API drm_writeback_connector_init_with_encoder()
	- allow passing possible_crtcs for existing users of
	  drm_writeback_connector_init()

Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_writeback.c | 144 +++++++++++++++++++++++++++++-----------
 include/drm/drm_writeback.h     |  27 +++++++-
 2 files changed, 129 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index dccf4504..9277dcb 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -149,36 +149,15 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
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
-				 const u32 *formats, int n_formats)
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
@@ -186,15 +165,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
 
 	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
 					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		goto fail;
+	if (IS_ERR(blob)) {
+		ret = PTR_ERR(blob);
+		return ret;
+	}
 
 	connector->interlace_allowed = 0;
 
@@ -204,7 +178,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 		goto connector_fail;
 
 	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+						wb_connector->encoder);
 	if (ret)
 		goto attach_fail;
 
@@ -233,13 +207,105 @@ int drm_writeback_connector_init(struct drm_device *dev,
 attach_fail:
 	drm_connector_cleanup(connector);
 connector_fail:
-	drm_encoder_cleanup(&wb_connector->encoder);
-fail:
 	drm_property_blob_put(blob);
 	return ret;
 }
+
+/**
+ * drm_writeback_connector_init - Initialize a writeback connector and its properties
+ * using an internal encoder
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
index 9697d27..5e752c8 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -25,13 +25,29 @@ struct drm_writeback_connector {
 	struct drm_connector base;
 
 	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
+	 * @encoder: handle to drm_encoder used by the connector to fulfill
 	 * the DRM framework requirements. The users of the
 	 * @drm_writeback_connector control the behaviour of the @encoder
 	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
 	 * function.
+	 *
+	 * For some vendor drivers, the hardware resources are shared between
+	 * writeback encoder and rest of the display pipeline.
+	 * To accommodate such cases, encoder is a handle to the real encoder
+	 * hardware.
+	 *
+	 * For current existing writeback users, this shall continue to be the
+	 * embedded encoder for the writeback connector.
+	 *
 	 */
-	struct drm_encoder encoder;
+	struct drm_encoder *encoder;
+
+	/**
+	 * @internal_encoder: internal encoder used by writeback when
+	 * a real encoder is not provided by the vendor drm drivers.
+	 * @encoder will be assigned to this for those cases.
+	 */
+	struct drm_encoder internal_encoder;
 
 	/**
 	 * @pixel_formats_blob_ptr:
@@ -150,7 +166,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 struct drm_writeback_connector *wb_connector,
 				 const struct drm_connector_funcs *con_funcs,
 				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats);
+				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
+
+int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
+		struct drm_writeback_connector *wb_connector,
+		const struct drm_connector_funcs *con_funcs, const u32 *formats,
+		int n_formats);
 
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
-- 
2.7.4

