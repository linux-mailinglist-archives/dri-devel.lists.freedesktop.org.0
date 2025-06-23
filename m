Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6ECAE49CA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6C89294;
	Mon, 23 Jun 2025 16:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="F+vMrfL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11ED9891B4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750694909; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FQt25voEUf6a64VpVOYH69tO9hvovb1LROQxb96CVMtCglkvMQ6X4uSX337u/mguo0PkhcFmLolBzUw7gZti18uP5/Fd6LgQm6A864m/RbOM6wSpBj+J1VJAyIWJV8YcyqDTMb0pWNXU08MVJGnhw+VETz+i0efAMMNzK6vwCng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750694909;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zuVo8vgB1ef4V7M0hGsWAx9T/frKBJPEGt3iEwr9U/s=; 
 b=mqVhBRMtFMVpl0XLJPC2g49yFidhmlvKWL61VAFl5svB+JM58NceVXlXEI/RGOd4lVY1V7Yd+R6APhWCkUituCRtPgXyBRQDRSMY/uhfl6DodZAPSi0gkFffLybFqFbbTsCyCsii6uWhlJDTUitvb+oi3IAK0Nn7SWyC1JqvSfY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750694909; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=zuVo8vgB1ef4V7M0hGsWAx9T/frKBJPEGt3iEwr9U/s=;
 b=F+vMrfL+PLU1UD7yCvdbDUuj1TDsZPIu3FdX3HyXQMRRrJEsBAsCrnjQu60CEbyc
 RxTYfynopuwRvuQQXTO7SHmBEYqcY2vz2woT/ozIOzn4eDkMvZiSU2rYANbp061QEEy
 vI28G8y9C1ZuhNZbBIIcIDz94/3ut1C3eJHFhxzI=
Received: by mx.zohomail.com with SMTPS id 1750694908344500.7905131067188;
 Mon, 23 Jun 2025 09:08:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 23 Jun 2025 18:05:40 +0200
Subject: [PATCH v2 12/20] phy: rockchip-usb: switch to FIELD_PREP_WM16
 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-byeword-update-v2-12-cf1fc08a2e1f@collabora.com>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
In-Reply-To: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
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

Remove this driver's HIWORD_UPDATE macro, and replace all instances of
it with (hopefully) equivalent FIELD_PREP_WM16 instances. To do this, a
few of the defines are being adjusted, as FIELD_PREP_WM16 shifts up the
value for us. This gets rid of the icky update(mask, mask) shenanigans.

The benefit of using FIELD_PREP_WM16 is that it does more checking of
the input, hopefully catching errors. In practice, a shared definition
makes code more readable than several different flavours of the same
macro, and the shifted value helps as well.

I do not have the hardware that uses this particular driver, so it's
compile-tested only as far as my own testing goes.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 51 +++++++++++++--------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index 666a896c8f0a08443228914a039b95974e15ba58..c3c30df29c3ea1a25f7b6100afac36506ec83601 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/hw_bitfield.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -24,9 +25,6 @@
 
 static int enable_usb_uart;
 
-#define HIWORD_UPDATE(val, mask) \
-		((val) | (mask) << 16)
-
 #define UOC_CON0					0x00
 #define UOC_CON0_SIDDQ					BIT(13)
 #define UOC_CON0_DISABLE				BIT(4)
@@ -38,10 +36,10 @@ static int enable_usb_uart;
 #define UOC_CON3					0x0c
 /* bits present on rk3188 and rk3288 phys */
 #define UOC_CON3_UTMI_TERMSEL_FULLSPEED			BIT(5)
-#define UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC		(1 << 3)
-#define UOC_CON3_UTMI_XCVRSEELCT_MASK			(3 << 3)
-#define UOC_CON3_UTMI_OPMODE_NODRIVING			(1 << 1)
-#define UOC_CON3_UTMI_OPMODE_MASK			(3 << 1)
+#define UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC		1UL
+#define UOC_CON3_UTMI_XCVRSEELCT_MASK			GENMASK(4, 3)
+#define UOC_CON3_UTMI_OPMODE_NODRIVING			1UL
+#define UOC_CON3_UTMI_OPMODE_MASK			GENMASK(2, 1)
 #define UOC_CON3_UTMI_SUSPENDN				BIT(0)
 
 struct rockchip_usb_phys {
@@ -79,7 +77,7 @@ struct rockchip_usb_phy {
 static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
 					   bool siddq)
 {
-	u32 val = HIWORD_UPDATE(siddq ? UOC_CON0_SIDDQ : 0, UOC_CON0_SIDDQ);
+	u32 val = FIELD_PREP_WM16(UOC_CON0_SIDDQ, siddq);
 
 	return regmap_write(phy->base->reg_base, phy->reg_offset, val);
 }
@@ -332,29 +330,24 @@ static int __init rockchip_init_usb_uart_common(struct regmap *grf,
 	 * but were not present in the original code.
 	 * Also disable the analog phy components to save power.
 	 */
-	val = HIWORD_UPDATE(UOC_CON0_COMMON_ON_N
-				| UOC_CON0_DISABLE
-				| UOC_CON0_SIDDQ,
-			    UOC_CON0_COMMON_ON_N
-				| UOC_CON0_DISABLE
-				| UOC_CON0_SIDDQ);
+	val = FIELD_PREP_WM16(UOC_CON0_COMMON_ON_N, 1) |
+	      FIELD_PREP_WM16(UOC_CON0_DISABLE, 1) |
+	      FIELD_PREP_WM16(UOC_CON0_SIDDQ, 1);
 	ret = regmap_write(grf, regoffs + UOC_CON0, val);
 	if (ret)
 		return ret;
 
-	val = HIWORD_UPDATE(UOC_CON2_SOFT_CON_SEL,
-			    UOC_CON2_SOFT_CON_SEL);
+	val = FIELD_PREP_WM16(UOC_CON2_SOFT_CON_SEL, 1);
 	ret = regmap_write(grf, regoffs + UOC_CON2, val);
 	if (ret)
 		return ret;
 
-	val = HIWORD_UPDATE(UOC_CON3_UTMI_OPMODE_NODRIVING
-				| UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC
-				| UOC_CON3_UTMI_TERMSEL_FULLSPEED,
-			    UOC_CON3_UTMI_SUSPENDN
-				| UOC_CON3_UTMI_OPMODE_MASK
-				| UOC_CON3_UTMI_XCVRSEELCT_MASK
-				| UOC_CON3_UTMI_TERMSEL_FULLSPEED);
+	val = FIELD_PREP_WM16(UOC_CON3_UTMI_SUSPENDN, 0) |
+	      FIELD_PREP_WM16(UOC_CON3_UTMI_OPMODE_MASK,
+			   UOC_CON3_UTMI_OPMODE_NODRIVING) |
+	      FIELD_PREP_WM16(UOC_CON3_UTMI_XCVRSEELCT_MASK,
+			   UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC) |
+	      FIELD_PREP_WM16(UOC_CON3_UTMI_TERMSEL_FULLSPEED, 1);
 	ret = regmap_write(grf, UOC_CON3, val);
 	if (ret)
 		return ret;
@@ -380,10 +373,8 @@ static int __init rk3188_init_usb_uart(struct regmap *grf,
 	if (ret)
 		return ret;
 
-	val = HIWORD_UPDATE(RK3188_UOC0_CON0_BYPASSSEL
-				| RK3188_UOC0_CON0_BYPASSDMEN,
-			    RK3188_UOC0_CON0_BYPASSSEL
-				| RK3188_UOC0_CON0_BYPASSDMEN);
+	val = FIELD_PREP_WM16(RK3188_UOC0_CON0_BYPASSSEL, 1) |
+	      FIELD_PREP_WM16(RK3188_UOC0_CON0_BYPASSDMEN, 1);
 	ret = regmap_write(grf, RK3188_UOC0_CON0, val);
 	if (ret)
 		return ret;
@@ -430,10 +421,8 @@ static int __init rk3288_init_usb_uart(struct regmap *grf,
 	if (ret)
 		return ret;
 
-	val = HIWORD_UPDATE(RK3288_UOC0_CON3_BYPASSSEL
-				| RK3288_UOC0_CON3_BYPASSDMEN,
-			    RK3288_UOC0_CON3_BYPASSSEL
-				| RK3288_UOC0_CON3_BYPASSDMEN);
+	val = FIELD_PREP_WM16(RK3288_UOC0_CON3_BYPASSSEL, 1) |
+	      FIELD_PREP_WM16(RK3288_UOC0_CON3_BYPASSDMEN, 1);
 	ret = regmap_write(grf, RK3288_UOC0_CON3, val);
 	if (ret)
 		return ret;

-- 
2.50.0

