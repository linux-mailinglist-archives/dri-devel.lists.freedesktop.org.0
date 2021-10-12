Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449E429E31
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B6A6E5BE;
	Tue, 12 Oct 2021 06:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC01B89F49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021346; x=1665557346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRVemg1TCgZgqoh2zDWu0Su4fQCkOIKQ3XhFew+ehD8=;
 b=R+gcHYNPK6v5kCDMgMt3wKALrtha9jDRINJiggIp77niapB4YuiAwYxJ
 eiWEZqwFcQzAuOE9Qr8uGC3Tt2aNKJ0b+EcTLS2wlVNxJ53r8GDrnAzUi
 ZSr7MLWEr5g234MyaIICVTWcu8lj1fPxcEx/un4PythuTi14/7uiiQ/KR
 zaePDjyS3rbfaomoYEOc1zmwldOS2slRYSyPqz9woeyOcTh1nN5SsYQCG
 4yJteVjo3vwLUnjSXixajo4O2hEQXjEQp2Fdnf0OvaC9KnawzADaGKPP1
 fU1rnvphDJgl+0vUY1Bex3OjIXxlPpb1POTWq74zDqcGzeftNCbGhn0oG A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985098"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:49:02 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:49:02 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021342; x=1665557342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRVemg1TCgZgqoh2zDWu0Su4fQCkOIKQ3XhFew+ehD8=;
 b=kx3Z9JCGDK89LGpC+sHjVIDPofRGv5NGqipgpbJFW+YFIH58R87/lkb8
 tJHMLeGISZlBJ125b1XBPS4TXfXITxYHLoQ2fU6BesVKuflHRuWPPVLl8
 JE3CcM49YT7w0LjXbdfmW20PwGUvoFXvOmqCHV9LiZLHiVP/El1x1f/0K
 5cWCGuPz8UQVhl4n2bEHBbPBvmPlNqVP5CxtPA7NMl9OLWedg6xqjWD37
 ae3D7XWb2UuznVrMH3U1KM5roMCOrymmHw22EJYtMynaHQ0dPsPUNt9Oc
 OUvjrg46WUFZlJC+GvfPhnVH+5rOOhlcn9YLRVaZbdHGsp6KWG9vMHCcs A==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985097"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:49:02 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 30EA0280065;
 Tue, 12 Oct 2021 08:49:02 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
Date: Tue, 12 Oct 2021 08:48:43 +0200
Message-Id: <20211012064843.298104-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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

VCC needs to be enabled before releasing the enable GPIO.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 9072342566f3..a6b1fd71dfee 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -33,6 +33,7 @@
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -143,6 +144,7 @@ struct sn65dsi83 {
 	struct mipi_dsi_device		*dsi;
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
+	struct regulator		*vcc;
 	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
@@ -647,6 +649,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	ctx->panel_bridge = panel_bridge;
 
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to get supply 'vcc': %pe\n",
+				     ctx->vcc);
+
 	return 0;
 }
 
@@ -691,7 +699,11 @@ static int sn65dsi83_probe(struct i2c_client *client,
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
-	return 0;
+	ret = regulator_enable(ctx->vcc);
+	if (ret)
+		dev_err(dev, "Failed to enable vcc: %i\n", ret);
+
+	return ret;
 }
 
 static int sn65dsi83_remove(struct i2c_client *client)
@@ -702,6 +714,7 @@ static int sn65dsi83_remove(struct i2c_client *client)
 	mipi_dsi_device_unregister(ctx->dsi);
 	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
+	regulator_disable(ctx->vcc);
 
 	return 0;
 }
-- 
2.25.1

