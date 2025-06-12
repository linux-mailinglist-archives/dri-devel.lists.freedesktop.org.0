Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8CAD7A36
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F8310E12C;
	Thu, 12 Jun 2025 18:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DDgXrUPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8506C10E138
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754718; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RJd7X5goRKjGOBIxXW7c4uXAGgYWji2MQpJlwYEhjsbX4SPwuShIklRKeuXrLP27ZphxmHFjn7VXad1T+WwaDvw5Dm5EpcNRR83F01Xb5azFBf8lkf8tk5Mpe4FtSLcZURPnHi0kaBrS22LhRObDrBg3NpoSvvMuxTioZC3GXBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754718;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qsCK1y2xYwi6CMHQWDQJlReeyR6tuopiwgdQe+eq94s=; 
 b=cNxwzGHkmBFaWUJ2ZrtRoskNp0Y4sMRqUaQVsh8fyFTvG+8+KhZScIXjqHgzBjtSchH6lWBHfwl2rjhsYO3B/9VrqCtaO2rVkf/HJSszhZCrJ0UK1eRXLzDB4jzZT86377XUHRlzWJLB0ctlC0trkgFYaH6bnW73R5DF/Y6dhFQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754718; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=qsCK1y2xYwi6CMHQWDQJlReeyR6tuopiwgdQe+eq94s=;
 b=DDgXrUPKFJUPsoV1F7Qz1OH+cpY2/l4a4otcfQb/4j/3sO38/5RISWjl9SBGITRa
 mX/7hJDoXpqhRnCw6CLZIvn5u5ziADVYK410WgDKp6X1Y7esf7ONqeV1oHfoQrVbjf1
 xoVipAl8JpW2CUejNnW3lqMp7zB5SgCwygVdHALY=
Received: by mx.zohomail.com with SMTPS id 1749754715941996.4656178955362;
 Thu, 12 Jun 2025 11:58:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:12 +0200
Subject: [PATCH 10/20] drm/rockchip: dw_hdmi_qp: switch to HWORD_UPDATE macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-10-f4afb8f6313f@collabora.com>
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

Replace this driver's HIWORD_UPDATE with the HWORD_UPDATE from
bitfield.h. While at it, disambiguate the write GRF write to SOC_CON7 by
splitting the definition into the individual bitflags. This is done
because HWORD_UPDATE shifts the value for us according to the mask, so
writing the mask to itself to enable two bits is no longer something
that can be done. It should also not be done, because it hides the true
meaning of those two individual bit flags.

HDMI output with this patch has been tested on both RK3588 and RK3576.
On the former, with both present HDMI connectors.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 68 +++++++++++++-------------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7d531b6f4c098c6c548788dad487ce4613a2f32b..0431913c2f71893638d1824d52836cc095e04551 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -7,6 +7,7 @@
  * Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
@@ -66,7 +67,8 @@
 #define RK3588_HDMI1_HPD_INT_MSK	BIT(15)
 #define RK3588_HDMI1_HPD_INT_CLR	BIT(14)
 #define RK3588_GRF_SOC_CON7		0x031c
-#define RK3588_SET_HPD_PATH_MASK	GENMASK(13, 12)
+#define RK3588_HPD_HDMI0_IO_EN_MASK	BIT(12)
+#define RK3588_HPD_HDMI1_IO_EN_MASK	BIT(13)
 #define RK3588_GRF_SOC_STATUS1		0x0384
 #define RK3588_HDMI0_LEVEL_INT		BIT(16)
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
@@ -80,7 +82,6 @@
 #define RK3588_HDMI0_GRANT_SEL		BIT(10)
 #define RK3588_HDMI1_GRANT_SEL		BIT(12)
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
 #define HOTPLUG_DEBOUNCE_MS		150
 #define MAX_HDMI_PORT_NUM		2
 
@@ -185,11 +186,11 @@ static void dw_hdmi_qp_rk3588_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	u32 val;
 
 	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR,
-				    RK3588_HDMI1_HPD_INT_CLR | RK3588_HDMI1_HPD_INT_MSK);
+		val = (HWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR, 1) |
+		       HWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, 0));
 	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
-				    RK3588_HDMI0_HPD_INT_CLR | RK3588_HDMI0_HPD_INT_MSK);
+		val = (HWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR, 1) |
+		       HWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, 0));
 
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
@@ -218,8 +219,8 @@ static void dw_hdmi_qp_rk3576_setup_hpd(struct dw_hdmi_qp *dw_hdmi, void *data)
 	struct rockchip_hdmi_qp *hdmi = (struct rockchip_hdmi_qp *)data;
 	u32 val;
 
-	val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR,
-			    RK3576_HDMI_HPD_INT_CLR | RK3576_HDMI_HPD_INT_MSK);
+	val = (HWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR, 1) |
+	       HWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK, 0));
 
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 	regmap_write(hdmi->regmap, 0xa404, 0xffff0102);
@@ -254,7 +255,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 
 	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
 	if (intr_stat) {
-		val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK, RK3576_HDMI_HPD_INT_MSK);
+		val = HWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK, 1);
 
 		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 		return IRQ_WAKE_THREAD;
@@ -273,12 +274,12 @@ static irqreturn_t dw_hdmi_qp_rk3576_irq(int irq, void *dev_id)
 	if (!intr_stat)
 		return IRQ_NONE;
 
-	val = HIWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR, RK3576_HDMI_HPD_INT_CLR);
+	val = HWORD_UPDATE(RK3576_HDMI_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 	mod_delayed_work(system_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
-	val = HIWORD_UPDATE(0, RK3576_HDMI_HPD_INT_MSK);
+	val = HWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK, 0);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 
 	return IRQ_HANDLED;
@@ -293,11 +294,9 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 
 	if (intr_stat) {
 		if (hdmi->port_id)
-			val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK,
-					    RK3588_HDMI1_HPD_INT_MSK);
+			val = HWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, 1);
 		else
-			val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK,
-					    RK3588_HDMI0_HPD_INT_MSK);
+			val = HWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, 1);
 		regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 		return IRQ_WAKE_THREAD;
 	}
@@ -315,20 +314,18 @@ static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR,
-				    RK3588_HDMI1_HPD_INT_CLR);
+		val = HWORD_UPDATE(RK3588_HDMI1_HPD_INT_CLR, 1);
 	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
-				    RK3588_HDMI0_HPD_INT_CLR);
+		val = HWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR, 1);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	mod_delayed_work(system_wq, &hdmi->hpd_work,
 			 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 
 	if (hdmi->port_id)
-		val |= HIWORD_UPDATE(0, RK3588_HDMI1_HPD_INT_MSK);
+		val |= HWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, 0);
 	else
-		val |= HIWORD_UPDATE(0, RK3588_HDMI0_HPD_INT_MSK);
+		val |= HWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, 0);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 
 	return IRQ_HANDLED;
@@ -338,14 +335,14 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
 {
 	u32 val;
 
-	val = HIWORD_UPDATE(RK3576_SCLIN_MASK, RK3576_SCLIN_MASK) |
-	      HIWORD_UPDATE(RK3576_SDAIN_MASK, RK3576_SDAIN_MASK) |
-	      HIWORD_UPDATE(RK3576_HDMI_GRANT_SEL, RK3576_HDMI_GRANT_SEL) |
-	      HIWORD_UPDATE(RK3576_I2S_SEL_MASK, RK3576_I2S_SEL_MASK);
+	val = HWORD_UPDATE(RK3576_SCLIN_MASK, 1) |
+	      HWORD_UPDATE(RK3576_SDAIN_MASK, 1) |
+	      HWORD_UPDATE(RK3576_HDMI_GRANT_SEL, 1) |
+	      HWORD_UPDATE(RK3576_I2S_SEL_MASK, 1);
 
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
 
-	val = HIWORD_UPDATE(0, RK3576_HDMI_HPD_INT_MSK);
+	val = HWORD_UPDATE(RK3576_HDMI_HPD_INT_MSK, 0);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 }
 
@@ -353,27 +350,28 @@ static void dw_hdmi_qp_rk3588_io_init(struct rockchip_hdmi_qp *hdmi)
 {
 	u32 val;
 
-	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
-	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
-	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
-	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
+	val = HWORD_UPDATE(RK3588_SCLIN_MASK, 1) |
+	      HWORD_UPDATE(RK3588_SDAIN_MASK, 1) |
+	      HWORD_UPDATE(RK3588_MODE_MASK, 1) |
+	      HWORD_UPDATE(RK3588_I2S_SEL_MASK, 1);
 	regmap_write(hdmi->vo_regmap,
 		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
 		     val);
 
-	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK, RK3588_SET_HPD_PATH_MASK);
+	val = HWORD_UPDATE(RK3588_HPD_HDMI0_IO_EN_MASK, 1) |
+	      HWORD_UPDATE(RK3588_HPD_HDMI1_IO_EN_MASK, 1);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
 
 	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL, RK3588_HDMI1_GRANT_SEL);
+		val = HWORD_UPDATE(RK3588_HDMI1_GRANT_SEL, 1);
 	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL, RK3588_HDMI0_GRANT_SEL);
+		val = HWORD_UPDATE(RK3588_HDMI0_GRANT_SEL, 1);
 	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
 
 	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, RK3588_HDMI1_HPD_INT_MSK);
+		val = HWORD_UPDATE(RK3588_HDMI1_HPD_INT_MSK, 1);
 	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, RK3588_HDMI0_HPD_INT_MSK);
+		val = HWORD_UPDATE(RK3588_HDMI0_HPD_INT_MSK, 1);
 	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
 }
 

-- 
2.49.0

