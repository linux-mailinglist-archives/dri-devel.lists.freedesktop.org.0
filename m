Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06CB6291D6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 07:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856D110E36E;
	Tue, 15 Nov 2022 06:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D9D10E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 06:28:46 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c203so2110984pfc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 22:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28miqmbhBE1SXO17DceZt2lsuaubTUHoFD02vHmXDmc=;
 b=Ej9/j/55TR7388TSYG4uVzNJ4D2T0ovDDThWLvc8R0rTn43z3Fnvw02ir+dmfPP4Sv
 TB7ygRnMRsOHu1FWQT23nOv9AIzgpwkd8/e1wmVHyjmsEHV87S0nhanADor2koMLv0Av
 2vR48uZXDtRpYb848yMTrtAXXHlyl4CDZGtt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28miqmbhBE1SXO17DceZt2lsuaubTUHoFD02vHmXDmc=;
 b=Fowdpcy5HK6GM9C9JyDnvG8bUQAIHdv78kxhiIu2VUwIVswTUHWWG+CYfsY2gyLDWZ
 fP60FDp8/84SCULlE1H1rPqVB8jsd9DCN2e4sY+ZbkEkee9DS4/UQZzLg6EjMVieulPb
 akd7z/BBERddMx0m2oeAmZmNT+Ka0vYq2/Q49MoKo6pvgm51WB5NM2nhnwGCJD08clmR
 QrMMoEpQuUYMMh0lTevuiaKCGkbomFGKHP4VCJ/cPD06Yi0oIf9vnzcL6d6TdUp821dM
 3lfH/eipGy88DlTYohjHjw547mpufPGuEmBUtN6jkLrPLPJya7993VV76DlUMRjss1vs
 x5WA==
X-Gm-Message-State: ANoB5pnBEGg1iA/orIuUvQ4xN3HYolwoh+6bIPhyO01McN5DpEUF1sl2
 hqdz+n28T8DpkKLaTCj+ldCCTA==
X-Google-Smtp-Source: AA0mqf4ZBvHkQR1nEhVmwB2zftarC6mjwIXM9lTOUp0CyYULQbvps4wSZntuEeqNUQMKCktbM+DV2Q==
X-Received: by 2002:aa7:9ec7:0:b0:56e:3a98:f02 with SMTP id
 r7-20020aa79ec7000000b0056e3a980f02mr17168139pfq.53.1668493725187; 
 Mon, 14 Nov 2022 22:28:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:17d2:e181:950d:967a])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a630c16000000b004351358f056sm6956372pgl.85.2022.11.14.22.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 22:28:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 3/3] drm/bridge: it6505: handle HDCP request
Date: Tue, 15 Nov 2022 14:28:35 +0800
Message-Id: <20221115062835.3785083-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221115062835.3785083-1-hsinyi@chromium.org>
References: <20221115062835.3785083-1-hsinyi@chromium.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

it6505 supports HDCP 1.3, but current implementation lacks the update of
HDCP status through drm_hdcp_update_content_protection(). it6505 default
enables the HDCP. If user set it to undesired then the driver will stop
HDCP.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: allen chen <allen.chen@ite.com.tw>
---
v4->v5: no change
---
 drivers/gpu/drm/bridge/ite-it6505.c | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 21a9b8422bda..be08b42de4ea 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -423,6 +423,7 @@ struct it6505 {
 	struct extcon_dev *extcon;
 	struct work_struct extcon_wq;
 	int extcon_state;
+	struct drm_connector *connector;
 	enum drm_connector_status connector_status;
 	enum link_train_status link_state;
 	struct work_struct link_works;
@@ -2399,6 +2400,14 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
 	it6505->hdcp_status = HDCP_AUTH_DONE;
+	if (it6505->connector) {
+		struct drm_device *drm_dev = it6505->connector->dev;
+
+		drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+		drm_hdcp_update_content_protection(it6505->connector,
+						   DRM_MODE_CONTENT_PROTECTION_ENABLED);
+		drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+	}
 	it6505_show_hdcp_info(it6505);
 }
 
@@ -2931,6 +2940,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (WARN_ON(!connector))
 		return;
 
+	it6505->connector = connector;
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 
 	if (WARN_ON(!conn_state))
@@ -2974,6 +2984,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
+	it6505->connector = NULL;
 	if (it6505->powered) {
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D3);
@@ -3028,6 +3039,48 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 	return edid;
 }
 
+static int it6505_connector_atomic_check(struct it6505 *it6505,
+					 struct drm_connector_state *state)
+{
+	struct device *dev = &it6505->client->dev;
+	int cp = state->content_protection;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "hdcp connector state:%d, curr hdcp state:%d",
+			     cp, it6505->hdcp_status);
+
+	if (!it6505->hdcp_desired) {
+		DRM_DEV_DEBUG_DRIVER(dev, "sink not support hdcp");
+		return 0;
+	}
+
+	if (it6505->hdcp_status == HDCP_AUTH_GOING)
+		return -EINVAL;
+
+	if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		if (it6505->hdcp_status == HDCP_AUTH_DONE)
+			it6505_stop_hdcp(it6505);
+	} else if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		if (it6505->hdcp_status == HDCP_AUTH_IDLE &&
+		    it6505->link_state == LINK_OK)
+			it6505_start_hdcp(it6505);
+	} else {
+		DRM_DEV_DEBUG_DRIVER(dev, "invalid to set hdcp enabled");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int it6505_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	return it6505_connector_atomic_check(it6505, conn_state);
+}
+
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3035,6 +3088,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.attach = it6505_bridge_attach,
 	.detach = it6505_bridge_detach,
 	.mode_valid = it6505_bridge_mode_valid,
+	.atomic_check = it6505_bridge_atomic_check,
 	.atomic_enable = it6505_bridge_atomic_enable,
 	.atomic_disable = it6505_bridge_atomic_disable,
 	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
@@ -3354,6 +3408,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD;
+	it6505->bridge.support_hdcp = true;
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;
-- 
2.38.1.431.g37b22c650d-goog

