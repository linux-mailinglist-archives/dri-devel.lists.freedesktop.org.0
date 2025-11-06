Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004FC38CBF
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0C510E7E3;
	Thu,  6 Nov 2025 02:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="dbMNM1Wc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC4B10E7E3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394831;
 bh=hbx/QURwIjeUHxXbRkGU120xvy1OzyC8WzA8ZpLbBU8=;
 h=From:To:Subject:Date:Message-Id;
 b=dbMNM1WcveNPRCNa+XdBH4Mgf/F0VHbSBQyfSdVE803JWmgojptyukcQt1+nWaFX6
 3E1jAaXNr818MRUOQIQ8owxVyeDhlsi0Er56qHBGPlpFEdTOhuGvkcOzbgJNWLfQ80
 AsFro4FFyWDnb9V9IqX3s0ngIZ+ZXhxal1q4+sc4=
X-QQ-mid: esmtpgz15t1762394829t0f07c30b
X-QQ-Originating-IP: QZPMgX2USNKo5HEA2++y4wEpyHyL9QH/EATI2ze4C+o=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:07:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4356867921177031121
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Hongming Zou <hongming.zou@rock-chips.com>
Subject: [PATCH 7/9] drm/rockchip: dsi: Add support for rk3506
Date: Thu,  6 Nov 2025 10:06:30 +0800
Message-Id: <20251106020632.92-8-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M7OGOwGJ/FwKEJNhnwTmktqSTqpPSEiEb4tzm1v004AAuRZv2UE0hzKK
 urqskMQaMtrJaOUrzCVyyKtPM1P1KQ2lcfVqw0v5vF/Ete7BZdPONjh8vrGe22hTnJmcUJi
 89SSxFIv/dNwKAugT6ry3rzoJoRD2khwH9nPUL/mmEKzFkCw12W9GQJ1mPDQwMUXhyEoyrF
 u2i6Pa5wKCzmwHqwUCd2XCN97v6j1+n9ZYmQGBVyWumSGDQ7qZYVuOKVpsbA+V1RyNBvSId
 tDvZFP518ZLfb4HmGS2b7YqI22Np/32EmiI/9MnHgjAAl/Av5QS9U9Z5nVxp5wAZZU2mP3d
 RMNp5hkZ1RCZjsCHXz5fBs7Wj/JlBe0YkivmnwweYjEyI89TtVOn2Zd2zp+GhMnLyHCbv8A
 /ZrQObm2zvP5MMsx0/wGDA4YBzcy5WeKIHt1AjEIxXniZ3Rnl0AUEXUk4Vyj++1Hjg7tx+y
 RPK58lmJJLhlmVgYFPs1OgyL5mnaavHx4zx4XVdw1tfQbKvyT/nvZOOD/SSBvfqSDVrrdjV
 wJ6xf5ifG1p7+lP1L9p3n/zqSVbbtZ9AVrPJc0OsPQ8aVf8wfGk221PKXEiuhBTrgvwPVgD
 f2WBj6WIFn7mSC9gmEvpfdby/m0piJDz2qUyQu6qhI9nuewO/62M1Fc6f1Oy6DM798/n60E
 O/QrqkxsuZ9o6mRGHvsrED+3CA0SfwiS3+okq63DPFEc4c9QX0fDBdaCQUItaeyOdrDSg9X
 E/qmwRmJA7dBP6xtkznXEJJKXelxHLiEuUAgH+tEheikZzIuKCDfjVgWqC2d0Y/UndBhHGZ
 McUeElQFh0JC1ouWR+ycH9hXLGhyyxsR6zgkhxd9d4M4MK/1k7UMoAkEXhs10yXapblKnXu
 MSU6G8smsVywpb3t7rxkPMJdfxpgGYkriDArOPoLBQ2rqMryIVNOWsfIDmbBJOYhX7nRGIB
 gOLvjovBqLFV1BvLQAWGv8EJhdsCMH1TrPZHZH++nau1Oli19Uot9vXqbDB3vEytn8Wg=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The dsi controller found on RK3506 supports up to 2 lanes.

Signed-off-by: Hongming Zou <hongming.zou@rock-chips.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 5523911b990d..06e58cf287d3 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -192,6 +192,11 @@
 #define RK3568_DSI0_TURNDISABLE		BIT(2)
 #define RK3568_DSI0_FORCERXMODE		BIT(0)
 
+#define RK3506_SYS_GRF_SOC_CON6		0x0018
+#define RK3506_DSI_FORCETXSTOPMODE	(0xf << 4)
+#define RK3506_DSI_TURNDISABLE		BIT(2)
+#define RK3506_DSI_FORCERXMODE		BIT(0)
+
 /*
  * Note these registers do not appear in the datasheet, they are
  * however present in the BSP driver which is where these values
@@ -1643,6 +1648,18 @@ static const struct rockchip_dw_dsi_chip_data rk3399_chip_data[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dw_dsi_chip_data rk3506_chip_data[] = {
+	{
+		.reg = 0xff640000,
+		.lanecfg1_grf_reg = RK3506_SYS_GRF_SOC_CON6,
+		.lanecfg1 = (FIELD_PREP_WM16_CONST(RK3506_DSI_TURNDISABLE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCERXMODE, 0) |
+			     FIELD_PREP_WM16_CONST(RK3506_DSI_FORCETXSTOPMODE, 0)),
+		.max_data_lanes = 2,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_dw_dsi_chip_data rk3568_chip_data[] = {
 	{
 		.reg = 0xfe060000,
@@ -1690,6 +1707,9 @@ static const struct of_device_id dw_mipi_dsi_rockchip_dt_ids[] = {
 	}, {
 	 .compatible = "rockchip,rk3399-mipi-dsi",
 	 .data = &rk3399_chip_data,
+	}, {
+	 .compatible = "rockchip,rk3506-mipi-dsi",
+	 .data = &rk3506_chip_data,
 	}, {
 	 .compatible = "rockchip,rk3568-mipi-dsi",
 	 .data = &rk3568_chip_data,
-- 
2.51.1

