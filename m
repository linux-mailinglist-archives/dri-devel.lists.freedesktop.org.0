Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD53637632
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168D10E6D2;
	Thu, 24 Nov 2022 10:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5940410E262
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 10:21:33 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id q1so1196670pgl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 02:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSARwn2UnE9YTFUF2W3+HZEu0BpMDJn1tvX56Vn2aEc=;
 b=Ug9Id50cct6zOXOQoNNjH9g7+k3Y+GPROT/0at83jSeiIUZNvMxLUnWXIfKhQWwCqD
 BvLcx+EY9+QMbGcQ5JRGAFFNl5qvTOXxO0htrR5T7HhUAP4Z9WIyIPI3a2F/bEF3byyF
 wVpCmNKlejLHByIQdI99O8XbYNYoezW4RvB7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSARwn2UnE9YTFUF2W3+HZEu0BpMDJn1tvX56Vn2aEc=;
 b=NSfuYMlyMhQYeq5Ku54rD/XQUyAjGnQLy5cc2x297kgZQO4CLQHoSY/HXYt+DNwxNz
 tz/q51raJbyaE+HfVX530H9RayohU7GktTxVCpEjLZWXMaYMMpwxY/Psen2TXuQHpFy9
 Z/dCapb9N3LxNS2bQN4tK+rU8Q+4jGjuAEs/Ex/WdXH2IHetXD3mPxWZe6QfhBQoDVxX
 bbh7f7/1pssPgOskBTlEPvBgXehychkzMKm1mCFCGkNEZ4l16sFkXXYmp/+FpYIOaWqi
 Pn82GiZtv+U7mcQ7ms3HgN+GFYH0qdKXL9wsBUq3JpYkDXtLWzTz4SaK5VIGViiU9R1p
 WvbA==
X-Gm-Message-State: ANoB5pmjjd4Bpq/DZvaNVnqx/GwT6bJdC5FYd9bDdYIe/J0/Yy4tLqRP
 grdzxqmdHMtY0eob6YOS5tDqdA==
X-Google-Smtp-Source: AA0mqf7L3iC4gnmNoqCiVBZ9XwHWFS6fSLEjPGOepaa1BcV25Acbf6ifE5OqPVrzqGDBw0HCuMDfIQ==
X-Received: by 2002:a05:6a00:80f:b0:571:8794:e845 with SMTP id
 m15-20020a056a00080f00b005718794e845mr15217721pfk.18.1669285292953; 
 Thu, 24 Nov 2022 02:21:32 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d446:708:8556:dfee])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:21:32 -0800 (PST)
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
Subject: [PATCH v6 4/7] drm/bridge: anx7625: Check for Type-C during panel
 registration
Date: Thu, 24 Nov 2022 18:20:53 +0800
Message-Id: <20221124102056.393220-5-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221124102056.393220-1-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
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
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Allen Chen <allen.chen@ite.com.tw>,
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

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b0ff1ecb80a5..b9e3d6ad8846 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1650,7 +1650,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *sw;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1689,6 +1689,17 @@ static int anx7625_parse_dt(struct device *dev,
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
2.38.1.584.g0f3c55d4c2-goog

