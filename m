Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED5662039
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 09:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AEB10E375;
	Mon,  9 Jan 2023 08:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B0810E375
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 08:41:40 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso8673954pjf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C65HbTqm4aoCrwDl2BLz1roa80SXzNKa5x0ufot4CrI=;
 b=kwl6+6yNvmPlViyGA6MWyvEgFFpOn9l6Nlq4UwNmIoOAW/tQ1PUl3kldt28HENt/hv
 K8LSxwF+YxZ+5qLVbgwM7KPc0xLVNZotnK6YLa2G8XMn7DseLbTmvOAdJrBWIllrPZP8
 P2bdx7qO8wYfxT4hoCXs/0pUlVRoM1vyLOEO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C65HbTqm4aoCrwDl2BLz1roa80SXzNKa5x0ufot4CrI=;
 b=UhQxt18ucKxSOo9F6DxE8u5yH+LcVRHgC2/BfPjeQ1qEAO4I/yjmeS+eDX9Zg3kWhB
 cHESZUvbfc/SCxh2XVdJLXG26yG9a00OIzx9x1HWf8Y87s9jFbVKyK0mPMaHxPHnMYpA
 ORh7JHKbgjcIZIFM+OdI9LiZYQq7rRFoZeUXRu/tTxQ8tsHSV0TuwlvN5Ccb+L4eXNz5
 UOfPKcM5LiImxuMloBiDMiMeti51Xmhg1/aXNxxMIIwSJRxuyItpOLLCV9h2akW98cTI
 iL5PL3SqZ4T2dvu5XZUz0G0BjmFMpnGg0QVmkBSEvyNhhbYhCCz9ZXz6JUQd6mb4O/be
 wuHg==
X-Gm-Message-State: AFqh2kq1niu0cTChNPnG7fvB8AtN7IY2bCw0HRsze1GSWuexJGeC2Tn5
 AnvPQHzVaeNY6nHv7AvQj/umeQ==
X-Google-Smtp-Source: AMrXdXsOBwkHzA3WLtCmaPkcLxG15WmOP32JJT8RVkSGYFpuHvZMUWrKZfx4+BQl2tWsHH3Qve5ieA==
X-Received: by 2002:a17:902:7c07:b0:193:bec:2122 with SMTP id
 x7-20020a1709027c0700b001930bec2122mr10562741pll.32.1673253700000; 
 Mon, 09 Jan 2023 00:41:40 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:801:a736:715:9a15])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a170902d48e00b00186acb14c4asm5568119plg.67.2023.01.09.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 00:41:39 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v9 5/9] drm/bridge: anx7625: Check for Type-C during panel
 registration
Date: Mon,  9 Jan 2023 16:40:57 +0800
Message-Id: <20230109084101.265664-6-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230109084101.265664-1-treapking@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-acpi@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 chrome-platform@lists.linux.dev, Xin Ji <xji@analogixsemi.com>,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The output port endpoints can be connected to USB-C connectors.
Running drm_of_find_panel_or_bridge() with such endpoints leads to
a continuous return value of -EPROBE_DEFER, even though there is
no panel present.

To avoid this, check for the existence of a "mode-switch" property in
the port endpoint, and skip panel registration completely if so.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v6)

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b375887e655d..1cf242130b91 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1649,7 +1649,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *sw;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1688,6 +1688,17 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	/*
+	 * Don't bother finding a panel if a Type-C `mode-switch` property is
+	 * present in one of the endpoints.
+	 */
+	for_each_endpoint_of_node(np, sw) {
+		if (of_property_read_bool(sw, "mode-switch")) {
+			of_node_put(sw);
+			return 0;
+		}
+	}
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
-- 
2.39.0.314.g84b9a713c41-goog

