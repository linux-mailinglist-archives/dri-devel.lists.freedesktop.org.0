Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5E40BC27
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 01:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C166E84A;
	Tue, 14 Sep 2021 23:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534416E84E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 23:28:55 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q68so799714pga.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TG0v/NMBTHKCottWQ8zE4nJL5wLp1OcBA8MYjwcUsTI=;
 b=KNKA161asUi9rxrD3VuFSO9UYwtO3CgqRVbbKrQR8HcOm7Tf+NbLo71JIMFvri83x6
 oqjt/TA1UOe9Z5SX/LB26gPBrSx1Bwd8i8gGl3uutXcFHacpAtSP0k7nmglwcGNSqsKy
 TvyJ+3NhYEK77GJntVcEt2+rapN3N8bC+sZNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TG0v/NMBTHKCottWQ8zE4nJL5wLp1OcBA8MYjwcUsTI=;
 b=MNhBuLwxAGP6RVDDO5vFl+jezZKc0008+cIL5Dy6DNiuB7ghJUV2vbbrVuRfBHuIb5
 D1pqgjisX1U18CsSDMgPV0ax6lImHhyN87La/k7X82+HBZ18ewU4OAcyDwpQHiqG1i0q
 rBdplDBMH33erBLBjOuXQRg/XZEKxERqfpHdqEjcVDEJWc+MXXNL9j/OmhIvEIFlpdsf
 TYkrcUFCIcG8ZRH5QLC7rZQc1lqv4IZpxb0uUQEdhzhjTQFj2lmu17emjNuaSkVu8Kzs
 ICHIqiJcihn5t93s4vUCr/3Er+bKa33dojrCuWCTDDHoFlpGgEo6ZWEb41p0qwiLLnY7
 32wg==
X-Gm-Message-State: AOAM5313jYAwFQkRiT6veWfbD0i0YglzDAfLk1LISvb6XtF9UwayYC0q
 xFEfr3AD7eJ62wZNOW5hPOaRDg==
X-Google-Smtp-Source: ABdhPJyXHKTHdRaVtt0luMlddR2sqiPa9p5cTluIuo5Rfd9LbTcw1xqRSsvXPGmg2Rm6TeSREMIrrA==
X-Received: by 2002:a63:3503:: with SMTP id c3mr17293809pga.393.1631662135011; 
 Tue, 14 Sep 2021 16:28:55 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:6213:6a82:3731:1220])
 by smtp.gmail.com with ESMTPSA id x64sm11395360pfd.194.2021.09.14.16.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 16:28:54 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm/bridge: parade-ps8640: Improve logging at probing
Date: Tue, 14 Sep 2021 16:28:43 -0700
Message-Id: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dev_err_probe() to add logs for error cases at probing time.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/parade-ps8640.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 685e9c38b2db..e340af381e05 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -332,8 +332,10 @@ static int ps8640_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ps_bridge->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(ps_bridge->panel_bridge))
-		return PTR_ERR(ps_bridge->panel_bridge);
+	if (IS_ERR(ps_bridge->panel_bridge)) {
+		return dev_err_probe(dev, PTR_ERR(ps_bridge->panel_bridge),
+				     "Error creating bridge device\n");
+	}
 
 	ps_bridge->supplies[0].supply = "vdd33";
 	ps_bridge->supplies[1].supply = "vdd12";
@@ -344,16 +346,20 @@ static int ps8640_probe(struct i2c_client *client)
 
 	ps_bridge->gpio_powerdown = devm_gpiod_get(&client->dev, "powerdown",
 						   GPIOD_OUT_HIGH);
-	if (IS_ERR(ps_bridge->gpio_powerdown))
-		return PTR_ERR(ps_bridge->gpio_powerdown);
+	if (IS_ERR(ps_bridge->gpio_powerdown)) {
+		return dev_err_probe(dev, PTR_ERR(ps_bridge->gpio_powerdown),
+				     "Error getting gpio_powerdown\n");
+	}
 
 	/*
 	 * Assert the reset to avoid the bridge being initialized prematurely
 	 */
 	ps_bridge->gpio_reset = devm_gpiod_get(&client->dev, "reset",
 					       GPIOD_OUT_HIGH);
-	if (IS_ERR(ps_bridge->gpio_reset))
-		return PTR_ERR(ps_bridge->gpio_reset);
+	if (IS_ERR(ps_bridge->gpio_reset)) {
+		return dev_err_probe(dev, PTR_ERR(ps_bridge->gpio_reset),
+				     "Error getting gpio_reset\n");
+	}
 
 	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
 	ps_bridge->bridge.of_node = dev->of_node;
@@ -367,9 +373,9 @@ static int ps8640_probe(struct i2c_client *client)
 							     client->adapter,
 							     client->addr + i);
 		if (IS_ERR(ps_bridge->page[i])) {
-			dev_err(dev, "failed i2c dummy device, address %02x\n",
+			return dev_err_probe(dev, PTR_ERR(ps_bridge->page[i]),
+				"Error initting i2c dummy dev, address %02x\n",
 				client->addr + i);
-			return PTR_ERR(ps_bridge->page[i]);
 		}
 	}
 
-- 
2.33.0.309.g3052b89438-goog

