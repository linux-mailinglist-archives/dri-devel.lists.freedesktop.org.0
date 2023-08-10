Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBCF77705B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 08:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9B710E1D0;
	Thu, 10 Aug 2023 06:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD2110E1D0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 06:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691649155; x=1723185155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lZiWjziIwnG80z84cuSJnbncTC7iPuLOTVT3Y/Wiprc=;
 b=Z2u8oaWcTcid9sJrgzLlyqLkyvkBtIUNDCQEFZnJ90+SRoCw2sqb5tn2
 bgWTTrPiPl6LH61HZiTwx8yObU1w05thBASxAiv6nIgYzC5dhvse9/c+0
 qdjMS4gWOPz0aS02praYLbkaHfvI0/WFy1lbol0kLBCS1aiq7W8ByXxb7
 2OcLNYVuzhYO7BusmQOXO7eb++Z/3biHaxnDYWIo98/5NvVn0oeK8NHaB
 IZuOStOh8SuSlKLRdy7IZ/z9I7/kYRsoke3fqbX8z+VYXSmq7yees2R+6
 QM+iKGgNj7mBDcDW9XZ/Z0jB84+L4W9GWejFAOiTjgFQvgIQ1qDIovOcy w==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684792800"; d="scan'208";a="32382789"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 08:32:33 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 25E9328008D;
 Thu, 10 Aug 2023 08:32:33 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm/bridge: lvds-codec: Implement
 atomic_get_input_bus_fmts for LVDS encoder
Date: Thu, 10 Aug 2023 08:32:29 +0200
Message-Id: <20230810063229.597533-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atomic_get_input_bus_fmts is only implemented for LVDS decoders, resulting
that LVDS encoders only support bus format MEDIA_BUS_FMT_FIXED. This
results in warnings like:
mxsfb 21c8000.lcdif: Bridge does not provide bus format, assuming
 MEDIA_BUS_FMT_RGB888_1X24.
Please fix bridge driver by handling atomic_get_input_bus_fmts.

Fix this by reusing lvds_codec_atomic_get_input_bus_fmts currently used
for LVDS decoders. Use RGB888_1X24 for LVDS encoders. This also allows
removing the dedicated struct drm_bridge_funcs for decoders.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---

Notes:
    Currently all supported LVDS encoders (ti,ds90c185, ti,ds90c187 and
    ti,sn75lvds83) only support RGB888_1X24.

 drivers/gpu/drm/bridge/lvds-codec.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index 8c5668dca0c4b..991732c4b6298 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -71,12 +72,6 @@ static void lvds_codec_disable(struct drm_bridge *bridge)
 			"Failed to disable regulator \"vcc\": %d\n", ret);
 }
 
-static const struct drm_bridge_funcs funcs = {
-	.attach = lvds_codec_attach,
-	.enable = lvds_codec_enable,
-	.disable = lvds_codec_disable,
-};
-
 #define MAX_INPUT_SEL_FORMATS 1
 static u32 *
 lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
@@ -102,7 +97,7 @@ lvds_codec_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
-static const struct drm_bridge_funcs funcs_decoder = {
+static const struct drm_bridge_funcs funcs = {
 	.attach = lvds_codec_attach,
 	.enable = lvds_codec_enable,
 	.disable = lvds_codec_disable,
@@ -184,8 +179,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 			return ret;
 		} else {
 			lvds_codec->bus_format = ret;
-			lvds_codec->bridge.funcs = &funcs_decoder;
 		}
+	} else {
+		lvds_codec->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	}
 
 	/*
-- 
2.34.1

