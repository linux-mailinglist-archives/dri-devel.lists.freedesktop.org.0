Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0F256657
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F5D6EBFD;
	Sat, 29 Aug 2020 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9810E6E4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 15:49:21 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 12so953735lfb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egkk55sGDau+9n+stbkv1Ge3fT8d6jinbRQy2yb02Ng=;
 b=cFkKRoIiPAdeI4XAQN7af1kuUsXAmtAkmXC7pq/INbuny4p3+LmTxSSsOXiy748wNy
 9gGGTjEdC0VNF4+pAC3YH21q5isuD0JN7KH18SJxTj+I+P8F5pJqvsnJ3vpDxZIXWxi7
 /C9m5SDHMa81Sk244UESrXlCpCXtnjJdgLjACnT6DC5b61e3/C6Bf1bH1V6YqiYpzHSG
 OpZvtjk9RjiUc7LKeABF+ohRCaHn7/KOdb/ob0iQwmit/DqtLW8sHlmr+uqAQbglLgr8
 zDF+0iHl6TGtD+PcA1r5K83hYaf3lXXm1Vz6I5PLCel/4sOcsqywM3vCM8ITKsmhuOsA
 Kb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egkk55sGDau+9n+stbkv1Ge3fT8d6jinbRQy2yb02Ng=;
 b=pinmF0sCNpiPli3BWISnTBjLjjokOgk7XJPyoMcrt1Ox12BvS34k6TIlTLf4dV1BkX
 nNNb5YSyRoCE4iJ8BQc/dQ0WWvhhUqLflByFjuACcQqD9QJCj7ukP96wM7gWeHObwAI2
 geTg7vV0ENTRhMz6eZYMD1H+dGee5R7QpkDjabmyxGoyIlCJziX4j41k2vzI4kN9jze6
 8CshsDwBv23ToFdq4sVntPsurtb0OkgD62Gw75EmIaUpc/fwzZsERG5KdJakiqOpJL2A
 oiFAZp/j3aXtiHJQKRH/GorvL9J1mbMCqRCb8pFkI14xhrUL517M5sHxuyjdOT8lvaAU
 XCEw==
X-Gm-Message-State: AOAM5319Saxl6pjylCCzSBkBW99nGlGOP2l1zQcYw3fNss6n40Yc/j0i
 PdL+NVOmm7Env70DLFmS4nd/HA==
X-Google-Smtp-Source: ABdhPJxZQgMoUmV5ILdB4fxx6hPiQp1GIpcvpMnbMmO/U8ATGxmcZbUbyBDYpaVm+q6tSxwag9wfQw==
X-Received: by 2002:a19:6e0f:: with SMTP id j15mr1100826lfc.112.1598629759935; 
 Fri, 28 Aug 2020 08:49:19 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
 by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:49:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm: bridge: lt9611uxc: support working without
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Fri, 28 Aug 2020 18:49:06 +0300
Message-Id: <20200828154906.1662611-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
References: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the MSM driver does not specify DRM_BRIDGE_ATTACH_NO_CONNECTOR to
bridges, support working without this flag for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 80 +++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 77c5aa5c6ad7..47a48e440bb3 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -31,6 +31,7 @@
 struct lt9611uxc {
 	struct device *dev;
 	struct drm_bridge bridge;
+	struct drm_connector connector;
 
 	struct regmap *regmap;
 	/* Protects all accesses to registers by stopping the on-chip MCU */
@@ -105,6 +106,11 @@ static struct lt9611uxc *bridge_to_lt9611uxc(struct drm_bridge *bridge)
 	return container_of(bridge, struct lt9611uxc, bridge);
 }
 
+static struct lt9611uxc *connector_to_lt9611uxc(struct drm_connector *connector)
+{
+	return container_of(connector, struct lt9611uxc, connector);
+}
+
 static void lt9611uxc_lock(struct lt9611uxc *lt9611uxc)
 {
 	mutex_lock(&lt9611uxc->ocm_lock);
@@ -246,6 +252,75 @@ static struct mipi_dsi_device *lt9611uxc_attach_dsi(struct lt9611uxc *lt9611uxc,
 	return dsi;
 }
 
+static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
+{
+	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
+	unsigned int count;
+	struct edid *edid;
+
+	if (lt9611uxc->bridge.ops & DRM_BRIDGE_OP_MODES)
+		return lt9611uxc->bridge.funcs->get_modes(&lt9611uxc->bridge, connector);
+
+	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+}
+
+static enum drm_connector_status lt9611uxc_connector_detect(struct drm_connector *connector,
+							    bool force)
+{
+	struct lt9611uxc *lt9611uxc = connector_to_lt9611uxc(connector);
+
+	return lt9611uxc->bridge.funcs->detect(&lt9611uxc->bridge);
+}
+
+static enum drm_mode_status lt9611uxc_connector_mode_valid(struct drm_connector *connector,
+							   struct drm_display_mode *mode)
+{
+	struct lt9611uxc_mode *lt9611uxc_mode = lt9611uxc_find_mode(mode);
+
+	return lt9611uxc_mode ? MODE_OK : MODE_BAD;
+}
+
+static const struct drm_connector_helper_funcs lt9611uxc_bridge_connector_helper_funcs = {
+	.get_modes = lt9611uxc_connector_get_modes,
+	.mode_valid = lt9611uxc_connector_mode_valid,
+};
+
+static const struct drm_connector_funcs lt9611uxc_bridge_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = lt9611uxc_connector_detect,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc *lt9611uxc)
+{
+	int ret;
+
+	if (!bridge->encoder) {
+		DRM_ERROR("Parent encoder object not found");
+		return -ENODEV;
+	}
+
+	drm_connector_helper_add(&lt9611uxc->connector,
+				 &lt9611uxc_bridge_connector_helper_funcs);
+	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
+				 &lt9611uxc_bridge_connector_funcs,
+				 DRM_MODE_CONNECTOR_HDMIA);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector with drm\n");
+		return ret;
+	}
+
+	return drm_connector_attach_encoder(&lt9611uxc->connector, bridge->encoder);
+}
+
 static void lt9611uxc_bridge_detach(struct drm_bridge *bridge)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
@@ -266,8 +341,9 @@ static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		dev_err(lt9611uxc->dev, "This bridge driver does not support providing connector!");
-		return -EINVAL;
+		ret = lt9611uxc_connector_init(bridge, lt9611uxc);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* Attach primary DSI */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
