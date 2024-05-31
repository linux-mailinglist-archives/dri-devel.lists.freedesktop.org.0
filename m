Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7394E8D6A5B
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 22:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBEB10E148;
	Fri, 31 May 2024 20:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RLqdcK9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A393310E142
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 20:07:34 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2e96f29884dso27960491fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186053; x=1717790853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=foy6JQDzCRlndu2wDkMW+/KfxEQHtUuSgLRAcEoN4C0=;
 b=RLqdcK9OxgauOwsbxxzDdSFnwiaipCwLXCb4O6kG6XP1yMh5EFVH4/g7dJOzQDh1gH
 6BKLl+Zh/RnPBaPfSMTo9wNIsIdf6k5Z22OnEVFYjgSVhx1H1qcm6t5ocLrJjXrKW+ip
 oe4WscassJUgDuZFVe7zc3BcEfEke0mce3bdrOTLUV+SMWAK6DAeC+2qggW+YjAGxhZ8
 3WFGCKvUr6mRlXuigZcvvyrzqLyFXS0tGNllJZm02ldh9sXox4jU3Xu/qbU0BP9lC5+k
 zHaylPvgMLULf5uaqpz+7yhzXDKAsPM6GyIOBjHQ0SZ5YcvkpQIqQ3Kkd21m4mpXC2WU
 tROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186053; x=1717790853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=foy6JQDzCRlndu2wDkMW+/KfxEQHtUuSgLRAcEoN4C0=;
 b=dGjb9Pi25fzV4hq79KFDJ9ykRsmSxAMihfsybIK0WeqfUUDDqiMi3N6xXBkh+SwIOp
 vhb3qDDJfXpLhwqfKDHMTZpqBjGoBDX5BYRDag4kgBtkCn8VcLOaJrd0Q/v5KsrXv3BE
 J1bc9KZkbY88QqlR+2WKsviMSWYTP7f4SN1wO1sceRJ9fVJHDDSiv9KdFAeLFv2ywyux
 Ys+LdnyblfzcC9sOHdLx08DNBQgQP7u9OWvqIySsuEX9mLfoWfBpVZMJ/zBByrG4w96G
 z7OJDau5BuxZFPKtoRWeW61PRkoh3Wt57xsL8LHt6Rak5M+Vzxi5MsmxitOZHaUZViXJ
 0dAw==
X-Gm-Message-State: AOJu0YwS5Li6RI5m7u9y9ruzCW0O/lp7V9JKxxyIPEY8n7kmDfxeaGf/
 ZuqJQdZig/4c/ljE2z02AelMgfOgkPgPDIAFS7IhVmu4mTD6UxWunBNnFfiPQfI=
X-Google-Smtp-Source: AGHT+IHe08TPzRwu8QJpB+XlF9UFkX4BM6/WRN6Xrq2DzKyEX+hm+4hCpcrc/wdSno18d3D2NGT4xw==
X-Received: by 2002:a2e:a99b:0:b0:2e0:37be:b70f with SMTP id
 38308e7fff4ca-2ea95160333mr22535721fa.26.1717186052632; 
 Fri, 31 May 2024 13:07:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:26 +0300
Subject: [PATCH v4 3/9] drm/bridge-connector: implement glue code for HDMI
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-3-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9637;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cqCdor0KJlbsJ87CXjTFhRdAs763FYhaLzSStx5DE/w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4AlEFNoNujj5XVYXq2skTWjPqicVVG7XXx7
 DFHgfkY++mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1ZynCACJC6aYfwTMqIXQVEPf/+vDvVuJvSFIKAKY9BsMpSSF0aHRQqoZfgfOPwNuHDtVDJrImNF
 WeycDKKG3J4huOXpcWnVVzCUqQ6Rq7WX3QBE+Aj/HQdvn6bl8WiwDU72wS0Lx4icdt9u5/6u/VE
 MClLhBpcVl3QPDFF3Ozg8UFF1k1mXs1ZTPMGqDGJ1/2NDTCRISzU+KzGUR3QC49Rxh/EMzb57rB
 CqCIbWIqBHbnhYMas+wj6uuvkn4QyaCmp6uOKtTibuN7iEDZTjr8ARGEHuTdBz03bdhTBgYtmBT
 l1dRUhj9kwHsrLTLcePFMmOo1LQchQMGFZL7I6azopuE48fv
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

In order to let bridge chains implement HDMI connector infrastructure,
add necessary glue code to the drm_bridge_connector. In case there is a
bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
implementation.

Note, to simplify implementation, there can be only one bridge in a
chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
an error. This limitation can be lifted later, if the need arises.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 96 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/drm_debugfs.c          |  2 +
 include/drm/drm_bridge.h               | 83 +++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index e093fc8928dc..95af857b271d 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_state_helper.h>
 
 /**
  * DOC: overview
@@ -87,6 +88,13 @@ struct drm_bridge_connector {
 	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
 	 */
 	struct drm_bridge *bridge_modes;
+	/**
+	 * @bridge_hdmi:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
+	 */
+	struct drm_bridge *bridge_hdmi;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -287,6 +295,63 @@ static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };
 
+static enum drm_mode_status
+drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
+					  const struct drm_display_mode *mode,
+					  unsigned long long tmds_rate)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return MODE_ERROR;
+
+	if (bridge->funcs->hdmi_tmds_char_rate_valid)
+		return bridge->funcs->hdmi_tmds_char_rate_valid(bridge, mode, tmds_rate);
+	else
+		return MODE_OK;
+}
+
+static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_clear_infoframe)
+		return bridge->funcs->hdmi_clear_infoframe(bridge, type);
+	else
+		return 0;
+}
+
+static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
+						enum hdmi_infoframe_type type,
+						const u8 *buffer, size_t len)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
+}
+
+static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
+	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
+	.clear_infoframe = drm_bridge_connector_clear_infoframe,
+	.write_infoframe = drm_bridge_connector_write_infoframe,
+};
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -312,6 +377,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
+	unsigned int max_bpc = 8;
 	int connector_type;
 	int ret;
 
@@ -348,6 +415,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_detect = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EBUSY);
+			if (!bridge->funcs->hdmi_write_infoframe)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			if (bridge->supported_formats)
+				supported_formats = bridge->supported_formats;
+			if (bridge->max_bpc)
+				max_bpc = bridge->max_bpc;
+		}
 
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
@@ -370,9 +450,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drmm_connector_init(drm, connector,
-				  &drm_bridge_connector_funcs,
-				  connector_type, ddc);
+	if (bridge_connector->bridge_hdmi)
+		ret = drmm_connector_hdmi_init(drm, connector,
+					       bridge_connector->bridge_hdmi->vendor,
+					       bridge_connector->bridge_hdmi->product,
+					       &drm_bridge_connector_funcs,
+					       &drm_bridge_connector_hdmi_funcs,
+					       connector_type, ddc,
+					       supported_formats,
+					       max_bpc);
+	else
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index dd39a5b7a711..e385d90ef893 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -762,6 +762,8 @@ static int bridges_show(struct seq_file *m, void *data)
 			drm_puts(&p, " hpd");
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			drm_puts(&p, " modes");
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
+			drm_puts(&p, " hdmi");
 		drm_puts(&p, "\n");
 	}
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4baca0d9107b..3e86bb07eaa7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -630,6 +630,54 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @hdmi_tmds_char_rate_valid:
+	 *
+	 * Check whether a particular TMDS character rate is supported by the
+	 * driver.
+	 *
+	 * This callback is optional and should only be implemented by the
+	 * bridges that take part in the HDMI connector implementation. Bridges
+	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
+	 * in &enum drm_mode_status.
+	 */
+	enum drm_mode_status
+	(*hdmi_tmds_char_rate_valid)(const struct drm_bridge *bridge,
+				     const struct drm_display_mode *mode,
+				     unsigned long long tmds_rate);
+
+	/**
+	 * @hdmi_clear_infoframe:
+	 *
+	 * This callback clears the infoframes in the hardware during commit.
+	 * It will be called multiple times, once for every disabled infoframe
+	 * type.
+	 *
+	 * This callback is optional and should only be implemented by the
+	 * bridges that take part in the HDMI connector implementation. Bridges
+	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
+	 * &drm_bridge->ops.
+	 */
+	int (*hdmi_clear_infoframe)(struct drm_bridge *bridge,
+				    enum hdmi_infoframe_type type);
+	/**
+	 * @hdmi_write_infoframe:
+	 *
+	 * Program the infoframe into the hardware. It will be called multiple
+	 * times, once for every updated infoframe type.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*hdmi_write_infoframe)(struct drm_bridge *bridge,
+				    enum hdmi_infoframe_type type,
+				    const u8 *buffer, size_t len);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -705,6 +753,16 @@ enum drm_bridge_ops {
 	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
 	 */
 	DRM_BRIDGE_OP_MODES = BIT(3),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
+	 * including infoframes support. Bridges that set this flag must
+	 * implement the &drm_bridge_funcs->write_infoframe callback.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers.
+	 */
+	DRM_BRIDGE_OP_HDMI = BIT(4),
 };
 
 /**
@@ -773,6 +831,31 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
+	 * generation. This is required if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	const char *vendor;
+
+	/**
+	 * @product: Name of the product to be used for the SPD InfoFrame
+	 * generation. This is required if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	const char *product;
+
+	/**
+	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported
+	 * output formats. This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int supported_formats;
+
+	/**
+	 * @max_bpc: Maximum bits per char the HDMI bridge supports. Allowed
+	 * values are 8, 10 and 12. This is only relevant if
+	 * @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int max_bpc;
 };
 
 static inline struct drm_bridge *

-- 
2.39.2

