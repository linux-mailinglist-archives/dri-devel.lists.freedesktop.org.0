Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3211F22C
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1E6E3A0;
	Sat, 14 Dec 2019 14:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A3F6EBFC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:20:41 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 9C7DC3B39B9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:11:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 747D920000E;
 Fri, 13 Dec 2019 18:11:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 07/12] drm/rockchip: lvds: Helpers should return decent values
Date: Fri, 13 Dec 2019 19:10:46 +0100
Message-Id: <20191213181051.25983-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213181051.25983-1-miquel.raynal@bootlin.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return errors instead of returning void from internal helpers. When
these helpers are called, check the returned value and print an error
message in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 0d2902b0d990..6365a2c883c3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -215,8 +215,8 @@ struct drm_connector_helper_funcs rockchip_lvds_connector_helper_funcs = {
 	.get_modes = rockchip_lvds_connector_get_modes,
 };
 
-static void rk3288_lvds_grf_config(struct drm_encoder *encoder,
-				   struct drm_display_mode *mode)
+static int rk3288_lvds_grf_config(struct drm_encoder *encoder,
+				  struct drm_display_mode *mode)
 {
 	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
 	u8 pin_hsync = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 1 : 0;
@@ -241,10 +241,10 @@ static void rk3288_lvds_grf_config(struct drm_encoder *encoder,
 	val |= (pin_dclk << 8) | (pin_hsync << 9);
 	val |= (0xffff << 16);
 	ret = regmap_write(lvds->grf, RK3288_LVDS_GRF_SOC_CON7, val);
-	if (ret != 0) {
+	if (ret)
 		DRM_DEV_ERROR(lvds->dev, "Could not write to GRF: %d\n", ret);
-		return;
-	}
+
+	return ret;
 }
 
 static int rk3288_lvds_set_vop_source(struct rockchip_lvds *lvds,
@@ -288,13 +288,28 @@ static void rk3288_lvds_encoder_enable(struct drm_encoder *encoder)
 	int ret;
 
 	drm_panel_prepare(lvds->panel);
+
 	ret = rk3288_lvds_poweron(lvds);
 	if (ret < 0) {
-		DRM_DEV_ERROR(lvds->dev, "failed to power on lvds: %d\n", ret);
+		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
 		drm_panel_unprepare(lvds->panel);
+		return;
 	}
-	rk3288_lvds_grf_config(encoder, mode);
-	rk3288_lvds_set_vop_source(lvds, encoder);
+
+	ret = rk3288_lvds_grf_config(encoder, mode);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	ret = rk3288_lvds_set_vop_source(lvds, encoder);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to set VOP source: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
 	drm_panel_enable(lvds->panel);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
