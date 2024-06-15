Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6790993C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 19:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5A10E0CC;
	Sat, 15 Jun 2024 17:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="vECgJMBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D5210E24A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 17:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1718471748; bh=BeNUhMeywog7bd6GhDGutHucpUbeatl4//PsQAMTER0=;
 b=vECgJMBlOZxC97dN4yeuYOKp4wucUJb6GIEx7o7W4YNNa07YGAVt4BtQQqYCTEh0+jPv2Fagw
 JYrq6o8KUKOUQOVSGTLZD0Hp/nf9VJpQekN9PUfjnPk3SVt8+dqOP1deCJ6CRFC2GZLxnnMggAC
 kuDZvvp74IZBECq8z1hNys9+3wJCdbgzSG3ebnqu39PKNqH4WlqxvoElzQT9JrpoI0rsqZSBRSN
 up6p5WRwZO/V8+yUXed+vhq0AuFR9CyTKeCfew+T2KtlVO/3IjMdZB1kQPaImgpHGpfDNeFAWNZ
 VENQHoYKIxENoWrB/UAAzVvmADs/rOsiHO8uagtKXAag==
From: Jonas Karlman <jonas@kwiboo.se>
To: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas
 Karlman <jonas@kwiboo.se>
Subject: [PATCH 06/13] drm/rockchip: dw_hdmi: Add max_tmds_clock validation
Date: Sat, 15 Jun 2024 17:03:57 +0000
Message-ID: <20240615170417.3134517-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615170417.3134517-1-jonas@kwiboo.se>
References: <20240615170417.3134517-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 666dc9b324e0254b3980403f
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

Add max_tmds_clock validation to prepare for additions and changes to
the MPLL config table. Use the same rate restrictions that is currently
applied.

The rate limit for RK3288, RK3399 and RK3568 is based on current mpll
table. The rate limit for RK3228 and RK3228 is based on the
inno-hdmi-phy pre-pll table.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 5df9c9a0d369..75b5d63ec570 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -61,11 +61,13 @@
  * @lcdsel_grf_reg: grf register offset of lcdc select
  * @lcdsel_big: reg value of selecting vop big for HDMI
  * @lcdsel_lit: reg value of selecting vop little for HDMI
+ * @max_tmds_clock: maximum TMDS clock rate supported
  */
 struct rockchip_hdmi_chip_data {
 	int	lcdsel_grf_reg;
 	u32	lcdsel_big;
 	u32	lcdsel_lit;
+	int	max_tmds_clock;
 };
 
 struct rockchip_hdmi {
@@ -259,6 +261,10 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	bool exact_match = hdmi->plat_data->phy_force_vendor;
 	int i;
 
+	if (hdmi->chip_data->max_tmds_clock &&
+	    mode->clock > hdmi->chip_data->max_tmds_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (hdmi->ref_clk) {
 		int rpclk = clk_round_rate(hdmi->ref_clk, pclk);
 
@@ -450,6 +456,7 @@ static const struct dw_hdmi_phy_ops rk3228_hdmi_phy_ops = {
 
 static struct rockchip_hdmi_chip_data rk3228_chip_data = {
 	.lcdsel_grf_reg = -1,
+	.max_tmds_clock = 594000,
 };
 
 static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
@@ -467,6 +474,7 @@ static struct rockchip_hdmi_chip_data rk3288_chip_data = {
 	.lcdsel_grf_reg = RK3288_GRF_SOC_CON6,
 	.lcdsel_big = HIWORD_UPDATE(0, RK3288_HDMI_LCDC_SEL),
 	.lcdsel_lit = HIWORD_UPDATE(RK3288_HDMI_LCDC_SEL, RK3288_HDMI_LCDC_SEL),
+	.max_tmds_clock = 340000,
 };
 
 static const struct dw_hdmi_plat_data rk3288_hdmi_drv_data = {
@@ -487,6 +495,7 @@ static const struct dw_hdmi_phy_ops rk3328_hdmi_phy_ops = {
 
 static struct rockchip_hdmi_chip_data rk3328_chip_data = {
 	.lcdsel_grf_reg = -1,
+	.max_tmds_clock = 594000,
 };
 
 static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
@@ -505,6 +514,7 @@ static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
 	.lcdsel_big = HIWORD_UPDATE(0, RK3399_HDMI_LCDC_SEL),
 	.lcdsel_lit = HIWORD_UPDATE(RK3399_HDMI_LCDC_SEL, RK3399_HDMI_LCDC_SEL),
+	.max_tmds_clock = 340000,
 };
 
 static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
@@ -518,6 +528,7 @@ static const struct dw_hdmi_plat_data rk3399_hdmi_drv_data = {
 
 static struct rockchip_hdmi_chip_data rk3568_chip_data = {
 	.lcdsel_grf_reg = -1,
+	.max_tmds_clock = 340000,
 };
 
 static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
-- 
2.45.2

