Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B25287706E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 11:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D14810FE90;
	Sat,  9 Mar 2024 10:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="enD9++t8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78C10FE82
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so38628121fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709980298; x=1710585098; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/gKCRuHfTeAAN6eYp0daDO9DyP00Nw++DM0spECkWyc=;
 b=enD9++t8qDXYa0BnuaN918wuB74EPUTO0h2yBXUTzC63KSWaJ4sgPWrnvJYzcl83mJ
 DUi7sBD6U7TKOOrFBVsMK7JY6ADcgoYgHLjy8L3ilp1Abbif7SyEaYjzV69EB6+7GucU
 IxXuQkHaLf7EHs1oXkbZZJzO0RHe6eu4ZxQoVTIawPwqLktMfKzmloUFVkxomFBR6/bs
 pd1hXKT4OeJhCPbAC1NmEJ98C2S4Ckj7m2bDAkd2iGl1wa5QyeEbAzGZ2ZCFWdgqf9gj
 +fjePBVkA/dcENOndMJxuOTBAkOMZpR06Nk56g+GDKGmmRgrysllFzvASS1h3MlynvzM
 ajXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709980298; x=1710585098;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gKCRuHfTeAAN6eYp0daDO9DyP00Nw++DM0spECkWyc=;
 b=GvgqH1VFxFs8fz+6h7JZd6Sc9b/2d8i8sLIZE6rgVoDaRO+3pIu9Z2kjCtkOYq8pPB
 vaqkeKT0dUYUlBM9Un3kcxeWxozJHbKW2P+MiAqnNjInAycsQsWhylzpDOeWOPDFHoWX
 1h9sg4oP6lFhHUQMso7a0IPmAuaRQDydW8DI8/imHGW3uaoqMFkrQEEKItp5ZKqkDS3r
 uhnNzZaxx+J8Yk5xTO+Gj7hDsA2c8YSnUs6+HLuafMlUZy/ppnxLxv1A/BASAorAYpyu
 OTMVf7/TrdTG1ujHYUmZKA25Al6Y8zBM1CgPmLy8grMCErGYuljnL1484ke+qGyXzq+h
 sS2w==
X-Gm-Message-State: AOJu0Yycvf04dY1M21Rc7PiCfs2qsN4zTUMHsqv7Q0qHtHfbgrYjnaHx
 45Wb/THpQAQW/gNBh/pyen/cVaBid+/XO+2DGZKm3I2Fv0OjR3M4J/RhKBlA4o0=
X-Google-Smtp-Source: AGHT+IFAeh7KMVDugqewP6Hm8fZs7sNjILj2gnOP3VJmIZIk48bVzJBy/qeUGzU7+NB6uljOxaltIQ==
X-Received: by 2002:a2e:9043:0:b0:2d2:8ad9:a667 with SMTP id
 n3-20020a2e9043000000b002d28ad9a667mr1085321ljg.17.1709980298244; 
 Sat, 09 Mar 2024 02:31:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 02:31:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:30 +0200
Subject: [PATCH RFC v2 3/5] drm/bridge-connector: implement glue code for
 HDMI connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-3-1380bea3ee70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9464;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kABJHt3RkZZjsjZbUvVv96tWTAHBfq9FCIJhBeojd+4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+obq9amHD3mzdPeWXB8WcCrffVmKneGJaPljf3SQscn9
 jyezJXYyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJLFFj/1/1dLI+i9581RaB
 Ypuc9z7X3wetEv6zq/Xm3Onu4QV72QKuyy05pDF3Tq5zzFuDawsyZR3vb2G8I/r8jqDivGO/182
 6FT/dVOLKdY2YrpM6cy32N6Y+PbleWDZi6or+x8qzrEvlck8eqNL6rvtbc/GTY00LApL2qXBEM8
 yeG3vIWPNy5ZGKuIcc//o2nI09rN6Volxb6SzIfoNjg6qOKONOJXHDD15L2dPaw0JvMrJn54nuM
 nEsbGH5paFyQvHr0bncTWwRstM1z5tuDXIKVdo28/0ZaaHSO7Uds2J4VKq067x15CbZ8ipUeT8+
 FZ3urSS5jNNPbMeklh+xd/0fqD8zfBQR1PZko1si/zlmAA==
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
 drivers/gpu/drm/drm_bridge_connector.c | 118 ++++++++++++++++++++++++++++++++-
 include/drm/drm_bridge.h               |  82 +++++++++++++++++++++++
 2 files changed, 197 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..514dbb38dfed 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -86,6 +86,13 @@ struct drm_bridge_connector {
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
@@ -293,11 +300,86 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
+					     struct drm_atomic_state *state)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+	int ret;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge) {
+		ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
 	/* No need for .mode_valid(), the bridges are checked by the core. */
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
+	.atomic_check = drm_bridge_connector_atomic_check,
+};
+
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
+	if (bridge)
+		return bridge->funcs->tmds_char_rate_valid ?
+			bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate) :
+			MODE_OK;
+
+	return MODE_ERROR;
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
+	if (bridge)
+		return bridge->funcs->clear_infoframe ?
+			bridge->funcs->clear_infoframe(bridge, type) :
+			0;
+
+	return -EINVAL;
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
+	if (bridge)
+		return bridge->funcs->write_infoframe(bridge, type, buffer, len);
+
+	return -EINVAL;
+}
+
+static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
+	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
+	.clear_infoframe = drm_bridge_connector_clear_infoframe,
+	.write_infoframe = drm_bridge_connector_write_infoframe,
 };
 
 /* -----------------------------------------------------------------------------
@@ -325,6 +407,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	struct i2c_adapter *ddc = NULL;
 	struct drm_bridge *bridge, *panel_bridge = NULL;
+	const char *vendor = "Unknown";
+	const char *product = "Unknown";
+	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
+	unsigned int max_bpc = 8;
 	int connector_type;
 	int ret;
 
@@ -361,6 +447,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_detect = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_MODES)
 			bridge_connector->bridge_modes = bridge;
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EBUSY);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			if (bridge->supported_formats)
+				supported_formats = bridge->supported_formats;
+			if (bridge->max_bpc)
+				max_bpc = bridge->max_bpc;
+		}
+
+		if (bridge->vendor)
+			vendor = bridge->vendor;
+
+		if (bridge->product)
+			product = bridge->product;
 
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
@@ -383,9 +486,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drm_connector_init_with_ddc(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+	if (bridge_connector->bridge_hdmi)
+		ret = drm_connector_hdmi_init(drm, connector,
+					      vendor, product,
+					      &drm_bridge_connector_funcs,
+					      &drm_bridge_connector_hdmi_funcs,
+					      connector_type, ddc,
+					      supported_formats,
+					      max_bpc);
+	else
+		ret = drm_connector_init_with_ddc(drm, connector,
+						  &drm_bridge_connector_funcs,
+						  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3606e1a7f965..f44f32b182b8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -630,6 +630,54 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @tmds_char_rate_valid:
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
+	(*tmds_char_rate_valid)(const struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				unsigned long long tmds_rate);
+
+	/**
+	 * @clear_infoframe:
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
+	int (*clear_infoframe)(struct drm_bridge *bridge,
+			       enum hdmi_infoframe_type type);
+	/**
+	 * @write_infoframe:
+	 *
+	 * Program the infoframe into the hardware. It will be called multiple
+	 * times, once for every updated infoframe type.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
+	 */
+	int (*write_infoframe)(struct drm_bridge *bridge,
+			       enum hdmi_infoframe_type type,
+			       const u8 *buffer, size_t len);
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
@@ -773,6 +831,30 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
+	 * generation.
+	 */
+	const char *vendor;
+
+	/**
+	 * @product: Name of the product to be used for the SPD InfoFrame
+	 * generation.
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
+	 * @max_bpc: Maximum bits per char the HDMI bridge supports. This is
+	 * only relevant if @DRM_BRIDGE_OP_HDMI is set.
+	 */
+	unsigned int max_bpc;
 };
 
 static inline struct drm_bridge *

-- 
2.39.2

