Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3322F605
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F1689D81;
	Mon, 27 Jul 2020 17:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0134D89BB0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:29 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q7so18069644ljm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eeNBvnuGiJvgbEsntactqrsBwv2uMyBt7NotfDVzVd4=;
 b=R0yY0Vaz10UPeHgH3k5HwptclmWpk4wSjMzPc4QjnO1on6bGkA7FGhfaSTOKKgW3m1
 Knhe4pVWhfNc3u1SlG0BoTEOVNRp60vCselEMBYQIeXpZpImjQmO8PIzsA6UIyFY9rIE
 INx2e8k6WbrW9DGI66AWBuQijvUf4Y5pARMls+AAvzi8WSo2yV8lpAfZZXJgQiM1XsRN
 kALKyegbUBY8MAlKF58G8yKjOA7qMrK2a8Q+yTn4G7+hd5TeNA1VbWbBoE54duEd/nhv
 ytLgdBUgJqxUm9Ro4wYNuQiab9eDV7YfRQ8dfMeo7wh69FO+ODfvSqkGh1Z1JcLSo+Be
 I9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eeNBvnuGiJvgbEsntactqrsBwv2uMyBt7NotfDVzVd4=;
 b=A1LhFXxGRd3VkuUf+eyiQkV30NVZAAQ9/HfQfBxJPrbNQ4PXbQc75xhlV6MJsXqss8
 TshkySIGNKE5+2xunxZ4zVxGzFEMUDpDLfi//yrz88U+Utxx+CQE6WJ2ZGGm4RI8gwyf
 +nNiDUZIeM+g3ARldK2OyQNVb4VBm2Vg7A5Qz/D34aHP7niNO7zn9OmcoelJXfI8rtT1
 Dtjiz0Jf1Jp/F/1MBXyTjHV3SLZqA+LB249QagLhxfTMtdHcJPxMN43Qrc5pVblCj2AS
 +uqKiFz9rQn1HEM3PMmoIUdQTS7t2k4EXhq86GbVt5vUWtnvK1uGpvx/JsV9tHvQmIaZ
 dQaA==
X-Gm-Message-State: AOAM5336vmhQTF7vat5RJVLcBF7g0H8vJiwVtlJmydXkCxyGKnJs9/ch
 +majt8ByDspKIP0pHj3ioT1kfbndLv0=
X-Google-Smtp-Source: ABdhPJyQuuEyjOi+J3GMAEFRUPBPjIM7CW2CdwoxXGb8+BLTPT+WgJBZwvGsU97N8rwEE4FuDoL/ow==
X-Received: by 2002:a2e:8707:: with SMTP id m7mr10045329lji.350.1595869408166; 
 Mon, 27 Jul 2020 10:03:28 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:a56d:c972:788a:ba53])
 by smtp.gmail.com with ESMTPSA id l3sm1417470lji.115.2020.07.27.10.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 10:03:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 1/5] drm/bridge: tc358767: add detect bridge operation
Date: Mon, 27 Jul 2020 19:03:16 +0200
Message-Id: <20200727170320.959777-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727170320.959777-1-sam@ravnborg.org>
References: <20200727170320.959777-1-sam@ravnborg.org>
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare the bridge driver for chained operation by adding
support for the detect operation.

v3:
  - Fix code to make it readable (Laurent)

v2:
  - Do not announce detect operation if there is no hpd pin (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/bridge/tc358767.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c2777b226c75..bde89e213882 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1369,21 +1369,13 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 	.get_modes = tc_connector_get_modes,
 };
 
-static enum drm_connector_status tc_connector_detect(struct drm_connector *connector,
-						     bool force)
+static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
 {
-	struct tc_data *tc = connector_to_tc(connector);
+	struct tc_data *tc = bridge_to_tc(bridge);
 	bool conn;
 	u32 val;
 	int ret;
 
-	if (tc->hpd_pin < 0) {
-		if (tc->panel)
-			return connector_status_connected;
-		else
-			return connector_status_unknown;
-	}
-
 	ret = regmap_read(tc->regmap, GPIOI, &val);
 	if (ret)
 		return connector_status_unknown;
@@ -1396,6 +1388,20 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
 		return connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct tc_data *tc = connector_to_tc(connector);
+
+	if (tc->hpd_pin >= 0)
+		return tc_bridge_detect(&tc->bridge);
+
+	if (tc->panel)
+		return connector_status_connected;
+	else
+		return connector_status_unknown;
+}
+
 static const struct drm_connector_funcs tc_connector_funcs = {
 	.detect = tc_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -1458,6 +1464,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
 	.disable = tc_bridge_disable,
 	.post_disable = tc_bridge_post_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
+	.detect = tc_bridge_detect,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
@@ -1680,6 +1687,9 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return ret;
 
 	tc->bridge.funcs = &tc_bridge_funcs;
+	if (tc->hpd_pin >= 0)
+		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
