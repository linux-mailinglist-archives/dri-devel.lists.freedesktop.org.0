Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB4875B53
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6077F10F603;
	Thu,  7 Mar 2024 23:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JE9Z5EAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BCF10F600
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:57:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-512b3b04995so1196993e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709855826; x=1710460626; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gY2QKi3iCCRu3R9ogdJP6Bt7K1zFE2wWgrj56u+POKc=;
 b=JE9Z5EAyLLnF5EncuHpNgslaRncXhPDnvjSQ1GoNxKzV9PV5fk9DtJCj076cY0gp1U
 f2UHnt/T0ffZUWsO643AcgR5CddQdg09v63pZY2Nr+TTHYKJdv+ajWmDUds/TLjmNuof
 B3lAbE2AB1fCqF4JttDY1pPJUKi6LU2ZVp5nIvTe5C4Dkyf1kFUrFlN8Q0pYjELpSx0l
 EyOduIRSFRztOtn9wZilwP89uWXsZ63Nsgik0zV6qNT6JGExAJTkVPYO0vGD1TtpTGg8
 eDH5FU8xFpCgefbsXh2P+N5mnYDLK/y5j/Cp+Q4vt/Oa629OBwTJ0x0a44gPRElK5hfv
 xVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709855826; x=1710460626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gY2QKi3iCCRu3R9ogdJP6Bt7K1zFE2wWgrj56u+POKc=;
 b=cECzbAlu+AT9rRX/kxFZSUi5l+ZAhEuYVDZTw9mGb+JKNFYEEru2cjjgmXvXmkElLR
 g6TLOYfkQ9A/DUCxxejbIUA8Gxslq0xJFO+Y/wMWIRy9bLB5P7T6IP+TVS21qLL5hn9f
 ZblOe+QY31J9y8imcgBY9SYClXkdiWIBRxCJ5mJnmkMZ5cQ7l11clfpFPjcQuE6oLmdY
 DXgyJ52lMVHE6LLKrEaeYYJt+stFEkmJxPz+rDlg4gla0juAPl6gCwuOn1hnpUD/x3+M
 RjC3r1l8NcrQzvGdj0eVC9tRDBWKdve1p/fiPqnK0KahTvGwsCR8ezQYJ0uYW7xq2N1p
 rv6g==
X-Gm-Message-State: AOJu0YxI6bK67d3Qso7YaMyq4hu4NE+WfcktrzI6BOnTbJO8rxhzCXyR
 TZSpc0g2P5d4+jD4ZRPWH7qgh/6grvTCeUMWwMPlA6ylkvN1t4BViKNf75HQGWWJIiC3KBf+SC0
 e
X-Google-Smtp-Source: AGHT+IEIYUwPWtmGW03RHbhLgl9+/GiaPgeGoRsjiKtdQa8Q6FcZOlnaaNwIQLUkOMUVGlYcZzqhtA==
X-Received: by 2002:a05:6512:3aa:b0:513:1551:e6 with SMTP id
 v10-20020a05651203aa00b00513155100e6mr2176294lfp.50.1709855826517; 
 Thu, 07 Mar 2024 15:57:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:02 +0200
Subject: [PATCH RFC 3/6] drm/connector: hdmi: split setup code of the HDMI
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-3-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5714;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ShiNv393ZQOFkQ1UT0mY5i+Ny9G4ynWKMDoiCyzGxCA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROJ6e2b1AVujzHUbjQVLrDEaTD481Rxbyny
 tZQJKp1V+2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1cVXB/42MRj2IrAMaxs8DpjGlZ1Q8ayl7IKSsS9Ib06j1TA+bAJnmNt2I3BsgWIW8kdOLHhqCy2
 kxUY09yWNS+7cvdkwuuOHBjv1AX/MJ/a4jKisWfw8yfRkvKfpeHccoT1D84cWlnln7eyGttXuNm
 QkbRRLfLhQBmifiR/Xw+97wbnb34bunzINBHxz8wKJ3Tp281N38bbFlE589UuiIr9LpCexqjvAo
 7xJaHNDIlVkBDZTwmMn9v60pBssiEIheo53N1zgFgidVCmzpApG5KUk49wtPFJNLtEtrBKVnsK7
 SQSd7kbtbWwPqWcHgmks4MDDmkgLdHqBUnpyDr45wAR3HrhJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

In order to use HDMI connector extensions from the bridge drivers, carve
out the drm_connector_hdmi_setup() from drmm_connector_hdmi_init(). This
way the drm_bridge drivers can call new function from their
setup_connector callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 67 ++++++++++++++++++++++++++++++-----------
 include/drm/drm_connector.h     |  5 +++
 2 files changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 427816239038..ba953eb45557 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -454,15 +454,11 @@ int drmm_connector_init(struct drm_device *dev,
 EXPORT_SYMBOL(drmm_connector_init);
 
 /**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
+ * drm_connector_hdmi_setup - Init a preallocated HDMI connector
  * @connector: A pointer to the HDMI connector to init
  * @vendor: HDMI Controller Vendor name
  * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
  * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
  * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
  * @max_bpc: Maximum bits per char the HDMI connector supports
  *
@@ -477,18 +473,12 @@ EXPORT_SYMBOL(drmm_connector_init);
  * Returns:
  * Zero on success, error code on failure.
  */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
+int drm_connector_hdmi_setup(struct drm_connector *connector,
 			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
-	int ret;
-
 	if (!vendor || !product)
 		return -EINVAL;
 
@@ -496,8 +486,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
 		return -EINVAL;
 
-	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
+	if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+	    connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
 		return -EINVAL;
 
 	if (!supported_formats || !(supported_formats & BIT(HDMI_COLORSPACE_RGB)))
@@ -506,10 +496,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
-
 	connector->hdmi.supported_formats = supported_formats;
 	strtomem_pad(connector->hdmi.vendor, vendor, 0);
 	strtomem_pad(connector->hdmi.product, product, 0);
@@ -531,6 +517,51 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_connector_hdmi_setup);
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc)
+{
+	int ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return drm_connector_hdmi_setup(connector, vendor, product, hdmi_funcs,
+					supported_formats, max_bpc);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5964ef283022..37d54d5ff0d6 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2156,6 +2156,11 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
+int drm_connector_hdmi_setup(struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);

-- 
2.39.2

