Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C4AD7A12
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75110E0FF;
	Thu, 12 Jun 2025 18:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="de58JhJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AB810E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754625; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Eq6D11DxLAntAQr02UMEuLrYmx7BlmU2oz5dYJFRNAvpvOEqP2Mtx3iUw5inY+zZ4arI0Yi4BJNpZBH4nVa7KFf6BGusYW5vfMJ66sfsjwhhWfcs+xlSekpVPQDh1yTiNnij4SgayQ7F8nt72I/sbLx7VlizGK6llQocaRWaVNE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754625;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=lXbvL+h2IoWMpyp646+wlvm85iJG007PO2FAhrIMERY=; 
 b=UdSNqGZRjJL5oH9gqN+PzlBlj/EZq6nuUjSsyahRiLZZdPVN2EyHL90Bn6C6jURO7SyF27DXFZXpA1OY/TRYx18TwDkEA7lv5GeIUZNlUrBPdp56UwlsCm8fm0CFNP8VTOzoyIOKPC63AFLAXw7Sw1c2fe1PjEqrNPxhPNZ+Zbw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754625; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=lXbvL+h2IoWMpyp646+wlvm85iJG007PO2FAhrIMERY=;
 b=de58JhJo8iXiXeTlRf88LEU+7V1qn/WSgk5UGGyx/9Vldjwp/17WxYFBvIN6urHy
 cbEELR1lvjcI0O3jHdtlafxBuq60PaInKI2RxsC+EsMT+3tQhoq8Xw64ulxtJ8AVwRO
 Yo+jKxkL9SHpUmUZF97LHA51Tr8T/60y2Z1kKCj4=
Received: by mx.zohomail.com with SMTPS id 1749754622914325.8461884591545;
 Thu, 12 Jun 2025 11:57:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:05 +0200
Subject: [PATCH 03/20] soc: rockchip: grf: switch to HWORD_UPDATE_CONST macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-3-f4afb8f6313f@collabora.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

Switch the rockchip grf driver to the HWORD_UPDATE_CONST macro, which
brings with it more error checking while still being able to be used in
initializers.

All HIWORD_UPDATE instances and its definition are removed from the
driver, as the conversion here is obvious, and static_asserts were used
during development to make sure the ones greater than one bit in width
were really equivalent.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/soc/rockchip/grf.c | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 1eab4bb0eacffe19a8f0af0b71bdaa5c0b506629..a4a075ec98309cfcf7fc0bbbd310678ffcbe45da 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -5,14 +5,13 @@
  * Copyright (c) 2016 Heiko Stuebner <heiko@sntech.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#define HIWORD_UPDATE(val, mask, shift) \
-		((val) << (shift) | (mask) << ((shift) + 16))
 
 struct rockchip_grf_value {
 	const char *desc;
@@ -32,7 +31,7 @@ static const struct rockchip_grf_value rk3036_defaults[] __initconst = {
 	 * Disable auto jtag/sdmmc switching that causes issues with the
 	 * clock-framework and the mmc controllers making them unreliable.
 	 */
-	{ "jtag switching", RK3036_GRF_SOC_CON0, HIWORD_UPDATE(0, 1, 11) },
+	{ "jtag switching", RK3036_GRF_SOC_CON0, HWORD_UPDATE_CONST(BIT(11), 0) },
 };
 
 static const struct rockchip_grf_info rk3036_grf __initconst = {
@@ -44,8 +43,8 @@ static const struct rockchip_grf_info rk3036_grf __initconst = {
 #define RK3128_GRF_SOC_CON1		0x144
 
 static const struct rockchip_grf_value rk3128_defaults[] __initconst = {
-	{ "jtag switching", RK3128_GRF_SOC_CON0, HIWORD_UPDATE(0, 1, 8) },
-	{ "vpu main clock", RK3128_GRF_SOC_CON1, HIWORD_UPDATE(0, 1, 10) },
+	{ "jtag switching", RK3128_GRF_SOC_CON0, HWORD_UPDATE_CONST(BIT(8), 0) },
+	{ "vpu main clock", RK3128_GRF_SOC_CON1, HWORD_UPDATE_CONST(BIT(10), 0) },
 };
 
 static const struct rockchip_grf_info rk3128_grf __initconst = {
@@ -56,7 +55,7 @@ static const struct rockchip_grf_info rk3128_grf __initconst = {
 #define RK3228_GRF_SOC_CON6		0x418
 
 static const struct rockchip_grf_value rk3228_defaults[] __initconst = {
-	{ "jtag switching", RK3228_GRF_SOC_CON6, HIWORD_UPDATE(0, 1, 8) },
+	{ "jtag switching", RK3228_GRF_SOC_CON6, HWORD_UPDATE_CONST(BIT(8), 0) },
 };
 
 static const struct rockchip_grf_info rk3228_grf __initconst = {
@@ -68,8 +67,8 @@ static const struct rockchip_grf_info rk3228_grf __initconst = {
 #define RK3288_GRF_SOC_CON2		0x24c
 
 static const struct rockchip_grf_value rk3288_defaults[] __initconst = {
-	{ "jtag switching", RK3288_GRF_SOC_CON0, HIWORD_UPDATE(0, 1, 12) },
-	{ "pwm select", RK3288_GRF_SOC_CON2, HIWORD_UPDATE(1, 1, 0) },
+	{ "jtag switching", RK3288_GRF_SOC_CON0, HWORD_UPDATE_CONST(BIT(12), 0) },
+	{ "pwm select", RK3288_GRF_SOC_CON2, HWORD_UPDATE_CONST(BIT(0), 1) },
 };
 
 static const struct rockchip_grf_info rk3288_grf __initconst = {
@@ -80,7 +79,7 @@ static const struct rockchip_grf_info rk3288_grf __initconst = {
 #define RK3328_GRF_SOC_CON4		0x410
 
 static const struct rockchip_grf_value rk3328_defaults[] __initconst = {
-	{ "jtag switching", RK3328_GRF_SOC_CON4, HIWORD_UPDATE(0, 1, 12) },
+	{ "jtag switching", RK3328_GRF_SOC_CON4, HWORD_UPDATE_CONST(BIT(12), 0) },
 };
 
 static const struct rockchip_grf_info rk3328_grf __initconst = {
@@ -91,7 +90,7 @@ static const struct rockchip_grf_info rk3328_grf __initconst = {
 #define RK3368_GRF_SOC_CON15		0x43c
 
 static const struct rockchip_grf_value rk3368_defaults[] __initconst = {
-	{ "jtag switching", RK3368_GRF_SOC_CON15, HIWORD_UPDATE(0, 1, 13) },
+	{ "jtag switching", RK3368_GRF_SOC_CON15, HWORD_UPDATE_CONST(BIT(13), 0) },
 };
 
 static const struct rockchip_grf_info rk3368_grf __initconst = {
@@ -102,7 +101,7 @@ static const struct rockchip_grf_info rk3368_grf __initconst = {
 #define RK3399_GRF_SOC_CON7		0xe21c
 
 static const struct rockchip_grf_value rk3399_defaults[] __initconst = {
-	{ "jtag switching", RK3399_GRF_SOC_CON7, HIWORD_UPDATE(0, 1, 12) },
+	{ "jtag switching", RK3399_GRF_SOC_CON7, HWORD_UPDATE_CONST(BIT(12), 0) },
 };
 
 static const struct rockchip_grf_info rk3399_grf __initconst = {
@@ -113,9 +112,9 @@ static const struct rockchip_grf_info rk3399_grf __initconst = {
 #define RK3566_GRF_USB3OTG0_CON1	0x0104
 
 static const struct rockchip_grf_value rk3566_defaults[] __initconst = {
-	{ "usb3otg port switch", RK3566_GRF_USB3OTG0_CON1, HIWORD_UPDATE(0, 1, 12) },
-	{ "usb3otg clock switch", RK3566_GRF_USB3OTG0_CON1, HIWORD_UPDATE(1, 1, 7) },
-	{ "usb3otg disable usb3", RK3566_GRF_USB3OTG0_CON1, HIWORD_UPDATE(1, 1, 0) },
+	{ "usb3otg port switch", RK3566_GRF_USB3OTG0_CON1, HWORD_UPDATE_CONST(BIT(12), 0) },
+	{ "usb3otg clock switch", RK3566_GRF_USB3OTG0_CON1, HWORD_UPDATE_CONST(BIT(7), 1) },
+	{ "usb3otg disable usb3", RK3566_GRF_USB3OTG0_CON1, HWORD_UPDATE_CONST(BIT(0), 1) },
 };
 
 static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
@@ -126,8 +125,8 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
 #define RK3576_SYSGRF_SOC_CON1		0x0004
 
 static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
-	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 6) },
-	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 8) },
+	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HWORD_UPDATE_CONST(GENMASK(7, 6), 3) },
+	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HWORD_UPDATE_CONST(GENMASK(9, 8), 3) },
 };
 
 static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
@@ -138,7 +137,7 @@ static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
 #define RK3576_IOCGRF_MISC_CON		0x04F0
 
 static const struct rockchip_grf_value rk3576_defaults_ioc_grf[] __initconst = {
-	{ "jtag switching", RK3576_IOCGRF_MISC_CON, HIWORD_UPDATE(0, 1, 1) },
+	{ "jtag switching", RK3576_IOCGRF_MISC_CON, HWORD_UPDATE_CONST(BIT(1), 0) },
 };
 
 static const struct rockchip_grf_info rk3576_iocgrf __initconst = {
@@ -149,7 +148,7 @@ static const struct rockchip_grf_info rk3576_iocgrf __initconst = {
 #define RK3588_GRF_SOC_CON6		0x0318
 
 static const struct rockchip_grf_value rk3588_defaults[] __initconst = {
-	{ "jtag switching", RK3588_GRF_SOC_CON6, HIWORD_UPDATE(0, 1, 14) },
+	{ "jtag switching", RK3588_GRF_SOC_CON6, HWORD_UPDATE_CONST(BIT(14), 0) },
 };
 
 static const struct rockchip_grf_info rk3588_sysgrf __initconst = {

-- 
2.49.0

