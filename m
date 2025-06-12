Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48334AD7A40
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9174210E133;
	Thu, 12 Jun 2025 18:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="djpoFY4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4D110E133
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:59:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754744; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=W2Xd/MRETaSRWhXoaqi9hIgxR58OJXZ9/fr8OWlueEKqoMF3L2dNJyaabTILOnOSpx43bLsWBM/M57E/UbOIy5LzUit8rz0ekYYaqtn2tvlcGoIz/6KXXef9HkAfrn3qZnuVf8YmK2k6Qipt67j4Cp7qZ9V7l82W82PtruE6OMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754744;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=M6zK0OgGM/CnVtmZRXHUCPu/tj9ZRgyPTrSU5UVMDC0=; 
 b=kPvBLF1wV3wXD7+rQZd35kgxj+jmx9io2Qgo50ADZjzTBUqPXdWjFmG3BQijqclbVJvHpLo/lHF0uNukphKYu+PLnWBeeU+0vhe//9/6kumJhqj8bvMLIm8TAraxAReNvpKavGCK3wtjw5Dzzb3ezQcjAAkxzG6MuvelMUC9Zfg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754744; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=M6zK0OgGM/CnVtmZRXHUCPu/tj9ZRgyPTrSU5UVMDC0=;
 b=djpoFY4h7aflc431qIQDc6dxzn6q2Eot0jbtSeTYciE31RABj7ifal6I9wZ8i9E2
 /g5TL4RdzIx5JJWZC6oTZA7hn23Nljjr5yVEr3fApDck/s1QRbqVykfL+YhC/JkCjiA
 51EqjVpFKsb1S/ed3nnxtRYlPFh1xoVZKjTpTj6o=
Received: by mx.zohomail.com with SMTPS id 1749754741989226.8065694691487;
 Thu, 12 Jun 2025 11:59:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:14 +0200
Subject: [PATCH 12/20] phy: rockchip-usb: switch to HWORD_UPDATE macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-12-f4afb8f6313f@collabora.com>
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

Remove this driver's HIWORD_UPDATE macro, and replace all instances of
it with (hopefully) equivalent HWORD_UPDATE instances. To do this, a few
of the defines are being adjusted, as HWORD_UPDATE shifts up the value
for us. This gets rid of the icky update(mask, mask) shenanigans.

The benefit of using HWORD_UPDATE is that it does more checking of the
input, hopefully catching errors. In practice, a shared definition makes
code more readable than several different flavours of the same macro,
and the shifted value helps as well.

I do not have the hardware that uses this particular driver, so it's
compile-tested only as far as my own testing goes.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 51 +++++++++++++--------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index 666a896c8f0a08443228914a039b95974e15ba58..23c9885ec717ffeb6e4589dd0851b0307366738c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 ROCKCHIP, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
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
+#define UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC		1U
+#define UOC_CON3_UTMI_XCVRSEELCT_MASK			GENMASK(4, 3)
+#define UOC_CON3_UTMI_OPMODE_NODRIVING			1U
+#define UOC_CON3_UTMI_OPMODE_MASK			GENMASK(2, 1)
 #define UOC_CON3_UTMI_SUSPENDN				BIT(0)
 
 struct rockchip_usb_phys {
@@ -79,7 +77,7 @@ struct rockchip_usb_phy {
 static int rockchip_usb_phy_power(struct rockchip_usb_phy *phy,
 					   bool siddq)
 {
-	u32 val = HIWORD_UPDATE(siddq ? UOC_CON0_SIDDQ : 0, UOC_CON0_SIDDQ);
+	u32 val = HWORD_UPDATE(UOC_CON0_SIDDQ, siddq);
 
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
+	val = HWORD_UPDATE(UOC_CON0_COMMON_ON_N, 1) |
+	      HWORD_UPDATE(UOC_CON0_DISABLE, 1) |
+	      HWORD_UPDATE(UOC_CON0_SIDDQ, 1);
 	ret = regmap_write(grf, regoffs + UOC_CON0, val);
 	if (ret)
 		return ret;
 
-	val = HIWORD_UPDATE(UOC_CON2_SOFT_CON_SEL,
-			    UOC_CON2_SOFT_CON_SEL);
+	val = HWORD_UPDATE(UOC_CON2_SOFT_CON_SEL, 1);
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
+	val = HWORD_UPDATE(UOC_CON3_UTMI_SUSPENDN, 0) |
+	      HWORD_UPDATE(UOC_CON3_UTMI_OPMODE_MASK,
+			   UOC_CON3_UTMI_OPMODE_NODRIVING) |
+	      HWORD_UPDATE(UOC_CON3_UTMI_XCVRSEELCT_MASK,
+			   UOC_CON3_UTMI_XCVRSEELCT_FSTRANSC) |
+	      HWORD_UPDATE(UOC_CON3_UTMI_TERMSEL_FULLSPEED, 1);
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
+	val = HWORD_UPDATE(RK3188_UOC0_CON0_BYPASSSEL, 1) |
+	      HWORD_UPDATE(RK3188_UOC0_CON0_BYPASSDMEN, 1);
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
+	val = HWORD_UPDATE(RK3288_UOC0_CON3_BYPASSSEL, 1) |
+	      HWORD_UPDATE(RK3288_UOC0_CON3_BYPASSDMEN, 1);
 	ret = regmap_write(grf, RK3288_UOC0_CON3, val);
 	if (ret)
 		return ret;

-- 
2.49.0

