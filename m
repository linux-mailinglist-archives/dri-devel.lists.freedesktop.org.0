Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA37661706
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 17:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BC810E1FD;
	Sun,  8 Jan 2023 16:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4F110E1F4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 16:57:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id cf42so9556552lfb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 08:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/cju9fotz0lov5duz5S4oQdny3N24g+NVMg5SEoeSQ=;
 b=RKb+kjNwOiCJvONsL81ZqXj94XS9E4HEzXwI/88wV9w1VEa9HQB2ssslUihF/KiZAD
 rs2xflVqbmyvXc8M6Sb9e6W5jSvGCBCivchlAAwuvbBomMXvUb/pGlcJJSCPAFNWCJg0
 I67AaX535YkOn0NG7S4kKDBuIF7FHqZQOVtBPKJxyfgxlAFBVgy8ItukQC3/08HYUTda
 aRT3xI8WhtNfWQseSwSMKKef2F8+CJVED2oZtUdQfAIUq2XH66lVQ7x0vFjx//Hubw6q
 6L3zivk30B40LuxN3XBQW3gUfzeuoBkeZ75A6ABqIF98sI2nWuGudA/hXNSpcliVTTOX
 Xzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/cju9fotz0lov5duz5S4oQdny3N24g+NVMg5SEoeSQ=;
 b=hj5sQ0eMmxbDfepFFLgDUr6vBYwoeqmRXNywnDG3NFsjSppRCwOYMZYjktc8+cQKzj
 AbpylRoJXBZZJNB3IE3AhV0pcTnvsuESXEmjyxxPXELt1WRUQbj4S4UFrbEcusGU0Ane
 o9Z5fwE3nOWaueLiClzyrb+80fRnkbKpb/+yu+6TC5nvUiJ9ZwsfYS2hDIQcqxnKDbMf
 yDw3jJHNItcQttH3ozQerUMVnXI9RyNEoPjdvfS0za4OTQtM/qjdmGLxK23Fl+vgSrKd
 BNAhK3EZhmwb5ePtG/OtGQf6UFyEj9yMkjzyJNuEIoJ1wTJkYRTvQh4vSlbIcxSgi+Jc
 kVvQ==
X-Gm-Message-State: AFqh2kpYyu1fIdFU3LUJwdlyxQ9rCmOxfQ1avatueJRlv8+xfZUHFOFD
 baV3qYaS4Rp63D3scvuIVXyr3Q==
X-Google-Smtp-Source: AMrXdXtOSdQID4b58q1Qb1/+qU0iFkZFkUaXlF0+sv0upP5V/jnr+RACHrBHcmmcZ5rJVZeu7VOF+Q==
X-Received: by 2002:ac2:4f12:0:b0:4b5:b5d0:36e4 with SMTP id
 k18-20020ac24f12000000b004b5b5d036e4mr20605695lfr.13.1673197023664; 
 Sun, 08 Jan 2023 08:57:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:57:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 08/13] drm/bridge: lt9611: attach to the next bridge
Date: Sun,  8 Jan 2023 18:56:51 +0200
Message-Id: <20230108165656.136871-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bindings require that there is a next bridge after the lt9611. If
nothing else it can be the hdmi-connector (as used on the RB3 platform,
see sdm845-db845c.dts).

Bring in the next bridge into the drm bridges chain and attach to it.

Since lt9611 is not anymore the last bridge in the chain, this also
allows us to drop all the !DRM_BRIDGE_ATTACH_NO_CONNECTOR functionality.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 99 ++-----------------------
 1 file changed, 7 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1b65a573be27..773d7a56f86f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -19,6 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -33,7 +34,7 @@
 struct lt9611 {
 	struct device *dev;
 	struct drm_bridge bridge;
-	struct drm_connector connector;
+	struct drm_bridge *next_bridge;
 
 	struct regmap *regmap;
 
@@ -107,11 +108,6 @@ static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 	return container_of(bridge, struct lt9611, bridge);
 }
 
-static struct lt9611 *connector_to_lt9611(struct drm_connector *connector)
-{
-	return container_of(connector, struct lt9611, connector);
-}
-
 static int lt9611_mipi_input_analog(struct lt9611 *lt9611)
 {
 	const struct reg_sequence reg_cfg[] = {
@@ -581,9 +577,9 @@ static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
 	return NULL;
 }
 
-/* connector funcs */
-static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
+static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	unsigned int reg_val = 0;
 	int connected = 0;
 
@@ -596,12 +592,6 @@ static enum drm_connector_status __lt9611_detect(struct lt9611 *lt9611)
 	return lt9611->status;
 }
 
-static enum drm_connector_status
-lt9611_connector_detect(struct drm_connector *connector, bool force)
-{
-	return __lt9611_detect(connector_to_lt9611(connector));
-}
-
 static int lt9611_read_edid(struct lt9611 *lt9611)
 {
 	unsigned int temp;
@@ -683,30 +673,6 @@ lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 	return 0;
 }
 
-static int lt9611_connector_get_modes(struct drm_connector *connector)
-{
-	struct lt9611 *lt9611 = connector_to_lt9611(connector);
-	unsigned int count;
-	struct edid *edid;
-
-	lt9611_power_on(lt9611);
-	edid = drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
-
-	return count;
-}
-
-static enum drm_mode_status
-lt9611_connector_mode_valid(struct drm_connector *connector,
-			    struct drm_display_mode *mode)
-{
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
-
-	return lt9611_mode ? MODE_OK : MODE_BAD;
-}
-
 /* bridge funcs */
 static void
 lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
@@ -784,21 +750,6 @@ lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
 	}
 }
 
-static struct
-drm_connector_helper_funcs lt9611_bridge_connector_helper_funcs = {
-	.get_modes = lt9611_connector_get_modes,
-	.mode_valid = lt9611_connector_mode_valid,
-};
-
-static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = lt9611_connector_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 						 struct device_node *dsi_node)
 {
@@ -834,44 +785,13 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	return dsi;
 }
 
-static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt9611)
-{
-	int ret;
-
-	ret = drm_connector_init(bridge->dev, &lt9611->connector,
-				 &lt9611_bridge_connector_funcs,
-				 DRM_MODE_CONNECTOR_HDMIA);
-	if (ret) {
-		DRM_ERROR("Failed to initialize connector with drm\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(&lt9611->connector,
-				 &lt9611_bridge_connector_helper_funcs);
-
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
-	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
-
-	return 0;
-}
-
 static int lt9611_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	int ret;
-
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		ret = lt9611_connector_init(bridge, lt9611);
-		if (ret < 0)
-			return ret;
-	}
 
-	return 0;
+	return drm_bridge_attach(bridge->encoder, lt9611->next_bridge,
+				 bridge, flags);
 }
 
 static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
@@ -918,11 +838,6 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	lt9611_sleep_setup(lt9611);
 }
 
-static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
-{
-	return __lt9611_detect(bridge_to_lt9611(bridge));
-}
-
 static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
@@ -995,7 +910,7 @@ static int lt9611_parse_dt(struct device *dev,
 
 	lt9611->ac_mode = of_property_read_bool(dev->of_node, "lt,ac-mode");
 
-	return 0;
+	return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611->next_bridge);
 }
 
 static int lt9611_gpio_init(struct lt9611 *lt9611)
-- 
2.39.0

