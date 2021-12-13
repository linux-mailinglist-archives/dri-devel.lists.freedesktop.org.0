Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2D472D7F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65CF10E83F;
	Mon, 13 Dec 2021 13:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CE310E7C7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402599; x=1670938599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0TcSdjQnv9GI4VZ9011XTyB+4bRaVnjqp87fSW/zWM=;
 b=cGQNy9dkxhUuKEOwMaVweihhWdC+HABEQUu9Mu01pzohhpeJONjsUQf0
 pOvuErltYjkeMqXI5TNQ7fpoLRNNOjSYJeHD2efpdgN58Qp4DSIKlyWhk
 Je3wXg/HTl+lzIUowGU8dTcIZhnsCaB0RjH85Hi5ichKNt1PZmeN4w8Ov
 00FoAs3Tn5VkoxBfs4dDdqc1zREvST1TclTgfq42U6v9w0uoHVE+wK17A
 9JvDBZoxu+rGBp12pPAsSHacPrWn/ICRvTnTl8hBB0E8XQYckfrbJuJAc
 e6payg6wwbDD04eVPHSPxK8A6ZSZD/daNc7Yo6hLpPuR1Q+OWbCZcwYpv A==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012628"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2021 14:36:35 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 13 Dec 2021 14:36:35 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 13 Dec 2021 14:36:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1639402595; x=1670938595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f0TcSdjQnv9GI4VZ9011XTyB+4bRaVnjqp87fSW/zWM=;
 b=Dr2nCVGHANHuCzg4rh82qa6e9mJy9cG4zCKYc2jc+Gl3AwcoxnWERun6
 tLF+Ot7f9p2/pT2HAP8RrIrSJwor7mWBsKKDIkBpJy7YrofJpeTdr756V
 +IgxycZt29aTyf2NWe4jo/r5nsPPyk2Jwnap2W9L4+5X4hTHbw0q42ac/
 UdfoWf4yrM5zC+M0Czix8o5GH9/gMoMBlzxehRzw+6JHHqvPJ4oFGOSG7
 /G2ccplRJznAOlK8IcjIXAw5FXyMIif4xxJHkdTi9Y5bTscunAGcv1TdW
 NyFJHEhBclNJ6JumDk+12eSXOdqpuuVfNpqG3+HvEdEGTAi6Mfko3j7fT w==;
X-IronPort-AV: E=Sophos;i="5.88,202,1635199200"; d="scan'208";a="21012627"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 13 Dec 2021 14:36:35 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id EEFF8280065;
 Mon, 13 Dec 2021 14:36:34 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v5 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
Date: Mon, 13 Dec 2021 14:36:26 +0100
Message-Id: <20211213133626.2498056-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
References: <20211213133626.2498056-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VCC needs to be enabled before releasing the enable GPIO.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 065610edc37a..5650a793db81 100644
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
@@ -337,6 +339,12 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	u16 val;
 	int ret;
 
+	ret = regulator_enable(ctx->vcc);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to enable vcc: %d\n", ret);
+		return;
+	}
+
 	/* Deassert reset */
 	gpiod_set_value(ctx->enable_gpio, 1);
 	usleep_range(1000, 1100);
@@ -486,11 +494,16 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	int ret;
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	gpiod_set_value(ctx->enable_gpio, 0);
 	usleep_range(10000, 11000);
 
+	ret = regulator_disable(ctx->vcc);
+	if (ret)
+		dev_err(ctx->dev, "Failed to disable vcc: %d\n", ret);
+
 	regcache_mark_dirty(ctx->regmap);
 }
 
@@ -599,6 +612,11 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	ctx->panel_bridge = panel_bridge;
 
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to get supply 'vcc'\n");
+
 	return 0;
 }
 
-- 
2.25.1

