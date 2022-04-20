Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F9507E55
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CC110EEDE;
	Wed, 20 Apr 2022 01:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFF210EEBD;
 Wed, 20 Apr 2022 01:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650419196; x=1681955196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bg36CA68RfH+9DycYMEOfuFzClYGM/O3TRy84WvrdA4=;
 b=nZmd6w9Ekrg51G1q55Dn6bWZ0q1qevYIV1UVYAIzAbXsG49WmwsSH1z/
 +Wb+mQyzj5qEUceMORPMexmbJ5It+XMxOx3YQJoKRhESTfZNznBr4BzjO
 QK3urCKiVbRCUiJuQXzTWGh4dkoMrKFXgDmleA2H5IsEcEQ6wzZKC0muF I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Apr 2022 18:46:34 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:46:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:29 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:28 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 02/17] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Date: Tue, 19 Apr 2022 18:45:54 -0700
Message-ID: <1650419169-13760-3-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
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

changes in v5:
	- reorder this change to come before in the series
	  to avoid incorrect functionality in subsequent changes
	- continue using struct drm_encoder instead of
	  struct drm_encoder * and switch it in next change

changes in v6:
	- remove drm_writeback_connector_setup() and instead
	  directly call drm_writeback_connector_init_with_encoder()
	- fix a drm_writeback_connector typo and function doc which
	  incorrectly shows that the function accepts enc_helper_funcs
	- pass encoder as a parameter explicitly to the new API
	  for better readability

changes in v7:
	- fix the function doc slightly as suggested by Liviu

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_writeback.c | 72 +++++++++++++++++++++++++++++++++--------
 include/drm/drm_writeback.h     |  6 ++++
 2 files changed, 64 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 9e0b845..92658ad 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -178,6 +178,62 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const u32 *formats, int n_formats,
 				 u32 possible_crtcs)
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
+ * specific operation.
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
@@ -191,15 +247,6 @@ int drm_writeback_connector_init(struct drm_device *dev,
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
 
@@ -208,8 +255,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	if (ret)
 		goto connector_fail;
 
-	ret = drm_connector_attach_encoder(connector,
-						&wb_connector->encoder);
+	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
 		goto attach_fail;
 
@@ -238,12 +284,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
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
index 5d9263f..bb306fa 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -153,6 +153,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
 				 const u32 *formats, int n_formats,
 				 u32 possible_crtcs);
 
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

