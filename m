Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3A4413BF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 07:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78A8945A;
	Mon,  1 Nov 2021 06:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECA18845B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 06:27:26 +0000 (UTC)
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HjNNz6Fjtz90fs;
 Mon,  1 Nov 2021 14:27:15 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 1
 Nov 2021 14:27:23 +0800
From: He Ying <heying24@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <jernej.skrabec@gmail.com>
Subject: [PATCH] drm: Grab reference of connector before return connector from
 sun4i_tcon_get_connector
Date: Mon, 1 Nov 2021 02:29:06 -0400
Message-ID: <20211101062906.231518-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From the comments of drm_for_each_connector_iter(), we know
that "connector is only valid within the list body, if you
want to use connector after calling drm_connector_list_iter_end()
then you need to grab your own reference first using
drm_connector_get()". So fix the wrong use of connector
according to the comments and then call drm_connector_put()
after using connector finishes.

Signed-off-by: He Ying <heying24@huawei.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 9f06dec0fc61..24fa6784ee5f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -47,12 +47,12 @@ static struct drm_connector *sun4i_tcon_get_connector(const struct drm_encoder *
 	drm_connector_list_iter_begin(encoder->dev, &iter);
 	drm_for_each_connector_iter(connector, &iter)
 		if (connector->encoder == encoder) {
-			drm_connector_list_iter_end(&iter);
-			return connector;
+			drm_connector_get(connector);
+			break;
 		}
 	drm_connector_list_iter_end(&iter);
 
-	return NULL;
+	return connector;
 }
 
 static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
@@ -65,6 +65,7 @@ static int sun4i_tcon_get_pixel_depth(const struct drm_encoder *encoder)
 		return -EINVAL;
 
 	info = &connector->display_info;
+	drm_connector_put(connector);
 	if (info->num_bus_formats != 1)
 		return -EINVAL;
 
@@ -361,6 +362,7 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	/* TODO support normal CPU interface modes */
 	struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
 	struct mipi_dsi_device *device = dsi->device;
+	struct drm_connector *connector;
 	u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
 	u8 lanes = device->lanes;
 	u32 block_space, start_delay;
@@ -372,7 +374,9 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tcon *tcon,
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
 	/* Set dithering if needed */
-	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+	connector = sun4i_tcon_get_connector(encoder);
+	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_CTL_REG,
 			   SUN4I_TCON0_CTL_IF_MASK,
@@ -430,6 +434,7 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 				      const struct drm_display_mode *mode)
 {
 	unsigned int bp;
+	struct drm_connector *connector;
 	u8 clk_delay;
 	u32 reg, val = 0;
 
@@ -440,7 +445,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 	sun4i_tcon0_mode_set_common(tcon, mode);
 
 	/* Set dithering if needed */
-	sun4i_tcon0_mode_set_dithering(tcon, sun4i_tcon_get_connector(encoder));
+	connector = sun4i_tcon_get_connector(encoder);
+	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
@@ -518,6 +525,7 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 
 	/* Set dithering if needed */
 	sun4i_tcon0_mode_set_dithering(tcon, connector);
+	drm_connector_put(connector);
 
 	/* Adjust clock delay */
 	clk_delay = sun4i_tcon_get_clk_delay(mode, 0);
-- 
2.17.1

