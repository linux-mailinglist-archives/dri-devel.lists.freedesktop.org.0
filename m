Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02487706C
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144AE10FE8B;
	Sat,  9 Mar 2024 10:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LLRC0vTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D4D10FE81
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:39 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d4141c4438so35455721fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980297; x=1710585097; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hyi2QAnNjyFXYN+N8eHamuXjGZsyue9nPfokclWOSHQ=;
 b=LLRC0vTaSC8wO1m89tQfvTUO/Sp2v40HM1+k4aEltzWxX6pG2qNrnPHxULjTyZotCL
 ybziS3KR6/JsugWqn9q/WSrjdHwXyWNCLZylFv6NNuNBncvBEeQwhPESKekgOTgllBr3
 p/CPjoZrKISoDWXomQlHMTNYKpxIlm/+9NRsnFDBrHzw8CQ7bUh0DThNhT2+c5vYOso9
 jLeMDpBa3zi9U0fYpVndQhW2bQOy2DUMnY5yv+Ct61QZf1WDywRzIFp+CEPUnA1ou8OJ
 K6JezwLhCt0AIUchuQMkONxCxT9orVhoYoRx+PYaXzpOObYJEfHjf40Id249M+nIxRnn
 773w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980297; x=1710585097;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hyi2QAnNjyFXYN+N8eHamuXjGZsyue9nPfokclWOSHQ=;
 b=IUbwl+iYcCoPnUv9mV1GnJRzmilQH2vmZcCsTxfeygONwGk7kLAJv/ddIVV+kzINxs
 t7If6tkFpnmS5/XqmdzYZwUym7lgP8st8sDvcuKxm/t1I6gxL4u9PLtUGYtlxnU+XOjF
 d2TZGyno4B4p3na7yTcj3yP/wbLhRMOfQ2/fl/EnSPp0TrFqwmZa/AxjeLUuiNpAp/U2
 eZmBEsrZDPyiMVHgl5v2AXwqOzgBP8RXirKXSifwvVQcFpQP7Qzd+LgZ2hk3aSKpNPMZ
 aTfVWPhV6GNKoXHFpKiQ/NaW7wxEfTovNPmyAghrZWbsvcC7+qp8vuInaoY/SbVIUu5b
 MBmQ==
X-Gm-Message-State: AOJu0Yxjbwlryc3xPA7b+sN8QlR7ztEim/3HMETs8q6jbg4VsXzDDwzo
 R25zWN+EgQdGeStgqKcYrhZPrBVUZAfYDUty4DPG2h2shNcHYUaqR/zpNLpUuDw=
X-Google-Smtp-Source: AGHT+IH0wB7tIe5qs41vlrt+Gu8llz2cUWH9bjqPwDCtDbfZ2V7QVdE0L+S1IuYPpbgE54ngituFNA==
X-Received: by 2002:a2e:3314:0:b0:2d4:236e:4026 with SMTP id
 d20-20020a2e3314000000b002d4236e4026mr871679ljc.53.1709980297147; 
 Sat, 09 Mar 2024 02:31:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:29 +0200
Subject: [PATCH RFC v2 2/5] drm/connector: hdmi: add
 drm_connector_hdmi_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7655;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TOTF8wEm+pn2aC2XeccwUCkVYk78cnNW5mkygODDCJU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqFwlNpVVpgyKST97JjgY7ycbVtY/HwH8O8O
 fsDOx2EETGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hQAKCRCLPIo+Aiko
 1QehB/9qQF3yZRna6aS+Bm9dZO43L79j4oI1UnT8UGU2P9RYLYDBzofqZidQXbWLfxbc8srIm0l
 aW4iJ0EGqPPxDvzmMQPKu5gTVtau5T2g9jTJt3k+Rgr510huIZspPcT65ODwWwI/5rYbbTOUlib
 XIVfx/J0w3j75A+VYbNS/Mubn334+h+9Jyvm6SCACNWfV+hOzn0qNiObjsjVgFneM6x7Qukkv7P
 4fbHD8x41HvyLYc5TSWhCMSicRzI1Pp98ToEz8tpyetEe4/rAAILNWuNtmCwIMmF813ozklFpRU
 YpKZ7BXl8LIF5v88NPHoG5/NmxjrgNsa4V/7GkW+AUPRugs+
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

To support connectors which do all the management on their own (like
drm_bridge_connector), add drm_connector_hdmi_init() in addition to
drmm_connector_hdmi_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 143 ++++++++++++++++++++++++++++++----------
 include/drm/drm_connector.h     |   9 +++
 2 files changed, 118 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 427816239038..d7c0e237f9c5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -453,39 +453,15 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @vendor: HDMI Controller Vendor name
- * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
- * @max_bpc: Maximum bits per char the HDMI connector supports
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
+static int __drm_connector_hdmi_init(struct drm_device *dev,
+				     struct drm_connector *connector,
+				     const char *vendor, const char *product,
+				     const struct drm_connector_funcs *funcs,
+				     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				     int connector_type,
+				     struct i2c_adapter *ddc,
+				     unsigned long supported_formats,
+				     unsigned int max_bpc)
 {
 	int ret;
 
@@ -506,7 +482,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
@@ -531,6 +507,105 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+
+/**
+ * drm_connector_hdmi_init - Init a preallocated HDMI connector
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
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_cleanup() and free the connector structure.
+ * The connector structure should not be allocated with devm_kzalloc().
+ *
+ * Note: consider using drmm_connector_hdmi_init() instead of
+ * drm_connector_hdmi_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_init(struct drm_device *dev,
+			    struct drm_connector *connector,
+			    const char *vendor, const char *product,
+			    const struct drm_connector_funcs *funcs,
+			    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			    int connector_type,
+			    struct i2c_adapter *ddc,
+			    unsigned long supported_formats,
+			    unsigned int max_bpc)
+{
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
+	return __drm_connector_hdmi_init(dev, connector, vendor, product,
+					 funcs, hdmi_funcs, connector_type, ddc,
+					 supported_formats, max_bpc);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_init);
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
+	if (drm_WARN_ON(dev, funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_connector_hdmi_init(dev, connector, vendor, product,
+					funcs, hdmi_funcs, connector_type, ddc,
+					supported_formats, max_bpc);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drm_connector_cleanup_action,
+				       connector);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5964ef283022..a97de8255e04 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2147,6 +2147,15 @@ int drmm_connector_init(struct drm_device *dev,
 			const struct drm_connector_funcs *funcs,
 			int connector_type,
 			struct i2c_adapter *ddc);
+int drm_connector_hdmi_init(struct drm_device *dev,
+			    struct drm_connector *connector,
+			    const char *vendor, const char *product,
+			    const struct drm_connector_funcs *funcs,
+			    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			    int connector_type,
+			    struct i2c_adapter *ddc,
+			    unsigned long supported_formats,
+			    unsigned int max_bpc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,

-- 
2.39.2

