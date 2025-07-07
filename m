Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FF8AFB8F1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36E10E4E8;
	Mon,  7 Jul 2025 16:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rNXX5d1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD8610E4EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 16:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=58erMwoxBaQAKtl014X0pCQs9xXgy2ZbGkCMSXmUpbI=; b=rNXX5d1ukA1xbpvXU3rwD2i/6k
 R9uWibvpvUbZ/AglO1KOIH02VeJWvrWsUfa7di7XPVJOn5WyolKx17r3Ssb6Hb++Ik476zksJeS91
 PQmqBlDVRq//zRNVcltwajqqlxGCKMRiYV4/TFui7b/a+Wt7ywycIey0VGW1cSOlZx2yihLxzAeih
 SC0HI79+QmgiXfb+vx/tBAS/JW4BqAOv6U2MDhhmSOZC/2funCEIADqlbH3ZfXn/TOtQlL63lQ1LD
 8opC/6wBye9qFSa1ByrkTiz5yzbLuqNiSfXJllq0upwjk8Aqh5MGloiSbSpxzbErtekkUU8GqoNTN
 h3OiLYQg==;
Received: from i53875bf5.versanet.de ([83.135.91.245]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uYp1v-0004yl-Fu; Mon, 07 Jul 2025 18:49:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 hjc@rock-chips.com, andy.yan@rock-chips.com, andyshrk@163.com,
 nicolas.frattaroli@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Guochun Huang <hero.huang@rock-chips.com>
Subject: [PATCH 09/13] drm/rockchip: dsi2: add support rk3576
Date: Mon,  7 Jul 2025 18:49:02 +0200
Message-ID: <20250707164906.1445288-10-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
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

From: Guochun Huang <hero.huang@rock-chips.com>

Add the necessary specific bits to support the rk3576-variant of the
DW-DSI2 controller.

Signed-off-by: Guochun Huang <hero.huang@rock-chips.com>
[adapted from the vendor-kernel for mainline]
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
index cdd490778756..0aea764e29b2 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
@@ -437,6 +437,15 @@ static void dw_mipi_dsi2_rockchip_remove(struct platform_device *pdev)
 	dw_mipi_dsi2_remove(dsi2->dmd);
 }
 
+static const struct dsigrf_reg rk3576_dsi_grf_reg_fields[MAX_FIELDS] = {
+	[TXREQCLKHS_EN]		= { 0x0028, 1,  1 },
+	[GATING_EN]		= { 0x0028, 0,  0 },
+	[IPI_SHUTDN]		= { 0x0028, 3,  3 },
+	[IPI_COLORM]		= { 0x0028, 2,  2 },
+	[IPI_COLOR_DEPTH]	= { 0x0028, 8, 11 },
+	[IPI_FORMAT]		= { 0x0028, 4,  7 },
+};
+
 static const struct dsigrf_reg rk3588_dsi0_grf_reg_fields[MAX_FIELDS] = {
 	[TXREQCLKHS_EN]		= { 0x0000, 11, 11 },
 	[GATING_EN]		= { 0x0000, 10, 10 },
@@ -455,6 +464,15 @@ static const struct dsigrf_reg rk3588_dsi1_grf_reg_fields[MAX_FIELDS] = {
 	[IPI_FORMAT]		= { 0x0004,  0,  3 },
 };
 
+static const struct rockchip_dw_dsi2_chip_data rk3576_chip_data[] = {
+	{
+		.reg = 0x27d80000,
+		.grf_regs = rk3576_dsi_grf_reg_fields,
+		.max_bit_rate_per_lane = 2500000ULL,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dw_dsi2_chip_data rk3588_chip_data[] = {
 	{
 		.reg = 0xfde20000,
@@ -470,6 +488,9 @@ static const struct rockchip_dw_dsi2_chip_data rk3588_chip_data[] = {
 
 static const struct of_device_id dw_mipi_dsi2_rockchip_dt_ids[] = {
 	{
+		.compatible = "rockchip,rk3576-mipi-dsi2",
+		.data = &rk3576_chip_data,
+	}, {
 		.compatible = "rockchip,rk3588-mipi-dsi2",
 		.data = &rk3588_chip_data,
 	},
-- 
2.47.2

