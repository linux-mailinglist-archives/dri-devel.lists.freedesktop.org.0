Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04E4AEE98
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 10:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3410E6E6;
	Wed,  9 Feb 2022 09:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898C10E6BC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 09:54:09 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjfj-0002Oz-EP; Wed, 09 Feb 2022 10:53:59 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nHjfg-008qb0-39; Wed, 09 Feb 2022 10:53:56 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/23] drm/rockchip: dw_hdmi: drop mode_valid hook
Date: Wed,  9 Feb 2022 10:53:40 +0100
Message-Id: <20220209095350.2104049-14-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209095350.2104049-1-s.hauer@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver checks if the pixel clock of the given mode matches an entry
in the mpll config table. The frequencies in the mpll table are meant as
a frequency range up to which the entry works, not as a frequency that
must match the pixel clock. The downstream Kernel also does not have
this check, so drop it to allow for more display resolutions.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v3:
    - new patch

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 25 ---------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 160107b333ef..c44eb4d2e2d5 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -256,26 +256,6 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
 	return 0;
 }
 
-static enum drm_mode_status
-dw_hdmi_rockchip_mode_valid(struct dw_hdmi *hdmi, void *data,
-			    const struct drm_display_info *info,
-			    const struct drm_display_mode *mode)
-{
-	const struct dw_hdmi_mpll_config *mpll_cfg = rockchip_mpll_cfg;
-	int pclk = mode->clock * 1000;
-	bool valid = false;
-	int i;
-
-	for (i = 0; mpll_cfg[i].mpixelclock != (~0UL); i++) {
-		if (pclk == mpll_cfg[i].mpixelclock) {
-			valid = true;
-			break;
-		}
-	}
-
-	return (valid) ? MODE_OK : MODE_BAD;
-}
-
 static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
 {
 }
@@ -441,7 +421,6 @@ static struct rockchip_hdmi_chip_data rk3228_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg = rockchip_mpll_cfg,
 	.cur_ctr = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
@@ -458,7 +437,6 @@ static struct rockchip_hdmi_chip_data rk3288_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3288_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
@@ -478,7 +456,6 @@ static struct rockchip_hdmi_chip_data rk3328_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg = rockchip_mpll_cfg,
 	.cur_ctr = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
@@ -496,7 +473,6 @@ static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
@@ -509,7 +485,6 @@ static struct rockchip_hdmi_chip_data rk3568_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
 	.mpll_cfg   = rockchip_mpll_cfg,
 	.cur_ctr    = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
-- 
2.30.2

