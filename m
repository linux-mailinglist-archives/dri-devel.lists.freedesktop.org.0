Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF96A9982
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:34:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357910E627;
	Fri,  3 Mar 2023 14:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E410E627
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:34:28 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id p20so2802201plw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677854067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1mSCOEOZwzSe4923gv/lNmAI3ycw4GWSqU0gMJqiLLo=;
 b=AGaD40dojqpatUV6OK0VH7EFEQ2f8L7gm8KFO7t1tKybUfhbjsuAeBpCTIh0g8dX1C
 Vb8448kxRNXXDZ/M9E1FYhYlT7cdc5iKzb7INg3gHb9eEioavVt1NiNfi+h5YhGX7qMg
 no6zYPiori0O301ujrZ9lB+Fk/LUreDTAFyHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1mSCOEOZwzSe4923gv/lNmAI3ycw4GWSqU0gMJqiLLo=;
 b=vVA+rfoyX/ubBQTZEQgdpeGlgd5B/SydTj9QfK+X/8iVoR08F0Qktob8FOeDg2lXZE
 SVKHisdL+aVU78y1ltzRb3peCeWXkDrG44i9zyKY5Hj0TOTKXckNnO4cx0KsctHhHy7M
 AbHqAGzB7TVKXyYZsiDon5ql70W2ws1HRLVxHok7rtg151c5HmUZjn3FC4tu4UOFJWpu
 m9yao/SwjqH3Sjbjc990MB13J/uzCtJPrUSUrgXRNGGCTRi9+QCQ0bxKC41C/9d8Iklq
 39H3A5BaZMkvWGMSlxH0KPygQRb/d4lc39izWaEyZYhFgP0fl/K7yi0p2+JdQ+ndFMaA
 HDlQ==
X-Gm-Message-State: AO0yUKViMaFbUfeM0sfVhAmj7bzcDRK4kIf501JLhNuYvXPUYrzD7hEn
 oiVn9Lfolr/00WHP9BzHvMAamg==
X-Google-Smtp-Source: AK7set+pyUWzedW/NgMwm/VObu1a/KNPG+Slpi+Dwb1JCgHod2AcrWpNOV6WLtxyHsksdq3I4V1eXg==
X-Received: by 2002:a05:6a20:8f04:b0:cc:f27d:eb83 with SMTP id
 b4-20020a056a208f0400b000ccf27deb83mr2609226pzk.53.1677854067699; 
 Fri, 03 Mar 2023 06:34:27 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:55e5:8423:31ee:83dd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b005a8b4dcd21asm1767214pfn.15.2023.03.03.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:34:27 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
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
Subject: [PATCH v13 05/10] drm/bridge: anx7625: Check for Type-C during panel
 registration
Date: Fri,  3 Mar 2023 22:33:45 +0800
Message-Id: <20230303143350.815623-6-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230303143350.815623-1-treapking@chromium.org>
References: <20230303143350.815623-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
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

Changes in v13:
- Use the new typec_mode_switch_node_count helper

Changes in v12:
- Updated to use fwnode_for_each_typec_mode_switch macro
- Dropped collected tags

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v6:
- New in v6

 drivers/gpu/drm/bridge/analogix/anx7625.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 6846199a2ee1..3f6bf7674d32 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1648,7 +1648,8 @@ static int anx7625_get_swing_setting(struct device *dev,
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node, *ep0;
+	struct device_node *np = dev->of_node, *ep0, *port_node;
+	unsigned int count;
 	int bus_type, mipi_lanes;
 
 	anx7625_get_swing_setting(dev, pdata);
@@ -1687,6 +1688,15 @@ static int anx7625_parse_dt(struct device *dev,
 	if (of_property_read_bool(np, "analogix,audio-enable"))
 		pdata->audio_en = 1;
 
+	/*
+	 * Don't bother finding a panel if a Type-C `mode-switch` property is
+	 * present in one of the endpoints in the output port.
+	 */
+	port_node = of_graph_get_port_by_id(np, 1);
+	count = typec_mode_switch_node_count(&port_node->fwnode);
+	if (count)
+		return 0;
+
 	pdata->panel_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
 	if (IS_ERR(pdata->panel_bridge)) {
 		if (PTR_ERR(pdata->panel_bridge) == -ENODEV) {
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

