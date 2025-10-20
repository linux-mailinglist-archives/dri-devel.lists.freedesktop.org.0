Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13CBEFEA7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048A910E31A;
	Mon, 20 Oct 2025 08:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="v2x/H7jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460AD10E316
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=Yj6MA66tzVBn+KRYXc/UT/sYW9ZjhkSRMZ8pqWy1J7g=; b=v2x/H7jjQM2bM50tAt6guxmne9
 3RK9T2Rp+ZjfBlQNhgis87jMVhX25x4gHOUTVHfePIjXqEfsS4SRzYGz3kYSzYzeSWbeGsPHmsbFE
 QQX60MsGnpDvBcgDf3SVjv8d1d5yQ2FCwsolFl5yNqZN6jgAbnJHJWJoeTdMmyLbUGWJMVaFd3u+A
 jG2bwh9VpTt3EMzFxgNOJgvXD08GuCM4wp64KueWM90+7WNMSQBOfeVXww+e+Rv676rupj8g+Y5jb
 fY8z6sE5jVmTwHDMIxRw/+5d7+kmZq1Kjfhgeciai5BRqCraZrA8yhQ1qAyfhC31+jLkbZ3AmAZ0z
 wJ1BOxAg==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vAlCy-00078O-Ha; Mon, 20 Oct 2025 10:25:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/9] drm/rockchip: hdmi: add RK3368 controller variant
Date: Mon, 20 Oct 2025 10:25:01 +0200
Message-ID: <20251020082508.3636511-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020082508.3636511-1-heiko@sntech.de>
References: <20251020082508.3636511-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The RK3368 has only one VOP, so there is no source selection happening
and the controller uses an internal phy for the HDMI output.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7b613997bb50..95ff3fce97a3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -467,6 +467,19 @@ static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
 	.use_drm_infoframe = true,
 };
 
+static struct rockchip_hdmi_chip_data rk3368_chip_data = {
+	.lcdsel_grf_reg = -1,
+};
+
+static const struct dw_hdmi_plat_data rk3368_hdmi_drv_data = {
+	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mpll_cfg   = rockchip_mpll_cfg,
+	.cur_ctr    = rockchip_cur_ctr,
+	.phy_config = rockchip_phy_config,
+	.phy_data = &rk3368_chip_data,
+	.use_drm_infoframe = true,
+};
+
 static struct rockchip_hdmi_chip_data rk3399_chip_data = {
 	.lcdsel_grf_reg = RK3399_GRF_SOC_CON20,
 	.lcdsel_big = FIELD_PREP_WM16_CONST(RK3399_HDMI_LCDC_SEL, 0),
@@ -507,6 +520,9 @@ static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
 	{ .compatible = "rockchip,rk3328-dw-hdmi",
 	  .data = &rk3328_hdmi_drv_data
 	},
+	{ .compatible = "rockchip,rk3368-dw-hdmi",
+	 .data = &rk3368_hdmi_drv_data
+	},
 	{ .compatible = "rockchip,rk3399-dw-hdmi",
 	  .data = &rk3399_hdmi_drv_data
 	},
-- 
2.47.2

