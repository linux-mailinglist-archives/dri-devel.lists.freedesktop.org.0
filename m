Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819984557E3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3B36EC6D;
	Thu, 18 Nov 2021 09:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7F86EC6D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227213; x=1668763213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yNZUM5l+dYJ1D2T3WexBrl09S2UyQ6CTHXDDKPUWb1Y=;
 b=C0gkAY4WXP8dK9c7jqKXL5mBprpa9iMVUNmzLQ1UFaKLRsGxMn5gWPf/
 QDqkGUQHzWQSi4gAmsMdKFQOCgwz2N/KhefDlHQNTSYZWFa7XrsHRoBbC
 qjXZ8QfFS0d0mn1aJmu2m32mYfpJT+heIStAxEBi6HEg8+a1fhaSNjL31
 Mfc0ld4lPESwKe4gp4dQhOuycShcKvF/Jm4Rv0SwSU65/rvpkZG+6g3rV
 9TjzrIqikdDjsdhJJmEpcy27XvhTV7hWprWw+4pcr1C28+qmVsGcD+Njn
 morSa5avsGZ3IVOhUstGd986+J4KSHAlmUQdpNRGq3phyX0mhPf825Z4V w==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534721"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 18 Nov 2021 10:20:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 18 Nov 2021 10:20:04 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 18 Nov 2021 10:20:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1637227204; x=1668763204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yNZUM5l+dYJ1D2T3WexBrl09S2UyQ6CTHXDDKPUWb1Y=;
 b=AqrEgKg7hCvJHtT/QAXdjmd551L79lkgSHtLU+xyv4Gp6IcfEJ7ElkhP
 qaYFOgWkLDomNBjzzGL/0aWYA0wJlGMla1sRDAJP/oA/NGPOWLZXtMd3X
 yZtuGUbIev1mAQOQlnZcOAcsz32tjMjq/IlG2fguZOUzLhZXPBChR4358
 9/d5ZQ9/m8uLpCDZWy1GUnNeUWIJIXwRwZaFM5XqqqUd6kSswo3Mho3nH
 2JJOkjEUjsW/Zt4u8nhOuctnj7vavdLkahhwaZo1/czJ8coU+SfZroW3P
 H6qSG3BM4fKFGccEDixcBIhwndK2KI9/MqA/hssrSIrwPtO7Q8920KipD A==;
X-IronPort-AV: E=Sophos;i="5.87,244,1631570400"; d="scan'208";a="20534715"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Nov 2021 10:20:03 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A9D7328007F;
 Thu, 18 Nov 2021 10:20:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v4 4/4] drm/bridge: ti-sn65dsi83: Add vcc supply regulator
 support
Date: Thu, 18 Nov 2021 10:19:55 +0100
Message-Id: <20211118091955.3009900-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
References: <20211118091955.3009900-1-alexander.stein@ew.tq-group.com>
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VCC needs to be enabled before releasing the enable GPIO.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 065610edc37a..54d18e82ed74 100644
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
+		dev_err(ctx->dev, "Failed to enable vcc\n");
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
+		dev_err(ctx->dev, "Failed to disable vcc: %i\n", ret);
+
 	regcache_mark_dirty(ctx->regmap);
 }
 
@@ -599,6 +612,12 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 
 	ctx->panel_bridge = panel_bridge;
 
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc),
+				     "Failed to get supply 'vcc': %pe\n",
+				     ERR_PTR(ret));
+
 	return 0;
 }
 
-- 
2.25.1

