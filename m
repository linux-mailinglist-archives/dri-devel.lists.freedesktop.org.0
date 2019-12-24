Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0112A72E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3BF89E1A;
	Wed, 25 Dec 2019 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402C26E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:39:27 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7EF70E000E;
 Tue, 24 Dec 2019 14:39:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH v2 08/11] drm/rockchip: lvds: Pack functions together
Date: Tue, 24 Dec 2019 15:38:57 +0100
Message-Id: <20191224143900.23567-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224143900.23567-1-miquel.raynal@bootlin.com>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorganize a bit the functions order to clarify the driver. This
change only moves functions around, there is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 90 ++++++++++++------------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 40fa49fe9fa5..f2ece09e4e24 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -97,6 +97,40 @@ static inline int rockchip_lvds_name_to_output(const char *s)
 	return -EINVAL;
 }
 
+static const struct drm_connector_funcs rockchip_lvds_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int rockchip_lvds_connector_get_modes(struct drm_connector *connector)
+{
+	struct rockchip_lvds *lvds = connector_to_lvds(connector);
+	struct drm_panel *panel = lvds->panel;
+
+	return drm_panel_get_modes(panel);
+}
+
+static const
+struct drm_connector_helper_funcs rockchip_lvds_connector_helper_funcs = {
+	.get_modes = rockchip_lvds_connector_get_modes,
+};
+
+static int
+rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
+
+	s->output_mode = ROCKCHIP_OUT_MODE_P888;
+	s->output_type = DRM_MODE_CONNECTOR_LVDS;
+
+	return 0;
+}
+
 static int rk3288_lvds_poweron(struct rockchip_lvds *lvds)
 {
 	int ret;
@@ -193,27 +227,6 @@ static void rk3288_lvds_poweroff(struct rockchip_lvds *lvds)
 	clk_disable(lvds->pclk);
 }
 
-static const struct drm_connector_funcs rockchip_lvds_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int rockchip_lvds_connector_get_modes(struct drm_connector *connector)
-{
-	struct rockchip_lvds *lvds = connector_to_lvds(connector);
-	struct drm_panel *panel = lvds->panel;
-
-	return drm_panel_get_modes(panel);
-}
-
-static const
-struct drm_connector_helper_funcs rockchip_lvds_connector_helper_funcs = {
-	.get_modes = rockchip_lvds_connector_get_modes,
-};
-
 static int rk3288_lvds_grf_config(struct drm_encoder *encoder,
 				  struct drm_display_mode *mode)
 {
@@ -267,19 +280,6 @@ static int rk3288_lvds_set_vop_source(struct rockchip_lvds *lvds,
 	return 0;
 }
 
-static int
-rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,
-				   struct drm_crtc_state *crtc_state,
-				   struct drm_connector_state *conn_state)
-{
-	struct rockchip_crtc_state *s = to_rockchip_crtc_state(crtc_state);
-
-	s->output_mode = ROCKCHIP_OUT_MODE_P888;
-	s->output_type = DRM_MODE_CONNECTOR_LVDS;
-
-	return 0;
-}
-
 static void rk3288_lvds_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
@@ -321,6 +321,17 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
 	drm_panel_unprepare(lvds->panel);
 }
 
+static const
+struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
+	.enable = rk3288_lvds_encoder_enable,
+	.disable = rk3288_lvds_encoder_disable,
+	.atomic_check = rockchip_lvds_encoder_atomic_check,
+};
+
+static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int rk3288_lvds_probe(struct platform_device *pdev,
 			     struct rockchip_lvds *lvds)
 {
@@ -367,17 +378,6 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 	return 0;
 }
 
-static const
-struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
-	.enable = rk3288_lvds_encoder_enable,
-	.disable = rk3288_lvds_encoder_disable,
-	.atomic_check = rockchip_lvds_encoder_atomic_check,
-};
-
-static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
 	.probe = rk3288_lvds_probe,
 	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
