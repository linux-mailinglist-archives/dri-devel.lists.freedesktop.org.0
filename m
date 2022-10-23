Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06C76094AE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 18:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729710E02B;
	Sun, 23 Oct 2022 16:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 587 seconds by postgrey-1.36 at gabe;
 Sun, 23 Oct 2022 16:17:48 UTC
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C7810E02B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1666541278; bh=Xqe11Ibqu1NMh5rur/Ihh+EKSfXa12WMvQt557WAbbY=;
 h=From:To:Cc:Subject:Date:From;
 b=C7R1LepSst+u0rs2BWjVoU/OgTNul4lRGyCMQgdXH/iuYd1xPpgj29NwV5AT2T95A
 dDivamyUv51VfefpUpwDdaxiIax1TAPHjawjkw1u42EItsmM0RkZua5xlASwThYL0f
 7KSk+LpLgTkW3HY7EBBPHufiphKpFKK+cv/wSD1c=
From: Ondrej Jirman <megi@xff.cz>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: dsi: Fix VOP selection on SoCs that support it
Date: Sun, 23 Oct 2022 18:07:47 +0200
Message-Id: <20221023160747.607943-1-megi@xff.cz>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 "open list:DRM DRIVERS FOR ROCKCHIP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Ondrej Jirman <megi@xff.cz>,
 Chris Morgan <macromorgan@hotmail.com>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lcdsel_grf_reg is defined as u32, so "< 0" comaprison is always false,
which breaks VOP selection on eg. RK3399. Compare against 0.

Fixes: f3aaa6125b6f ("drm/rockchip: dsi: add rk3568 support")
Signed-off-by: Ondrej Jirman <megi@xff.cz>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 7d50a4f463d9..2982a4e9a6ed 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -760,7 +760,7 @@ static void dw_mipi_dsi_rockchip_config(struct dw_mipi_dsi_rockchip *dsi)
 static void dw_mipi_dsi_rockchip_set_lcdsel(struct dw_mipi_dsi_rockchip *dsi,
 					    int mux)
 {
-	if (dsi->cdata->lcdsel_grf_reg < 0)
+	if (dsi->cdata->lcdsel_grf_reg)
 		regmap_write(dsi->grf_regmap, dsi->cdata->lcdsel_grf_reg,
 			mux ? dsi->cdata->lcdsel_lit : dsi->cdata->lcdsel_big);
 }
@@ -1643,7 +1643,6 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	{
 		.reg = 0xfe060000,
-		.lcdsel_grf_reg = -1,
 		.lanecfg1_grf_reg = RK3568_GRF_VO_CON2,
 		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI0_SKEWCALHS |
 					  RK3568_DSI0_FORCETXSTOPMODE |
@@ -1653,7 +1652,6 @@ static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	},
 	{
 		.reg = 0xfe070000,
-		.lcdsel_grf_reg = -1,
 		.lanecfg1_grf_reg = RK3568_GRF_VO_CON3,
 		.lanecfg1 = HIWORD_UPDATE(0, RK3568_DSI1_SKEWCALHS |
 					  RK3568_DSI1_FORCETXSTOPMODE |
-- 
2.38.1

