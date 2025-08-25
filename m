Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899CB33914
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 10:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EEF10E405;
	Mon, 25 Aug 2025 08:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="E+U7dpeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3ED10E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 08:33:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110792; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EU44jlkILiqWOjE8bvdHyOAn8HfLB/+AQYDejGMwt6KgUeD8qZf7x365hX++y/NHtHEpvXNGEp/953GKkiJKaqjrVoLGpz42GcG+e4yf1DVNKUYzMZXJzFlNhVmtfrgPhTVQv8BJJFbKZg+4NLfoFX7fyy+OINXuIvsJ9x1ImtY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110792;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UJ/V7c5zKcpeViQcTrsVDRQQrw2d8eF4oHVI/ko8H1I=; 
 b=X/+Sm5kFl0UbNCutifAkgWi3o98UpqJxWoJhUTTehWQ3V0u8QMunL4KjiNLJiD7OngdFgvksJHZxqOejUYPCqvXJSDIT1QCXs2YxnCdV33qiQlEtj0R1EwwtJtXheas/DWTlMeQRcgLuxd2ZkJ31h6Y1yWBDkm2JPRyH/bgdLq8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110792; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=UJ/V7c5zKcpeViQcTrsVDRQQrw2d8eF4oHVI/ko8H1I=;
 b=E+U7dpeEFJNVWTDCMvyWbfP9w5OsHT1QlIfYTwg2dKftuIPYhBy6KBylPNqt6pbW
 CFgf2ZI3R+zKxhef0sn/JIOP+WVSwaocUJOgLEVddQ49UHQq5hw9is1wl4smUT8Q0W7
 cURkRmrPC3dK9UY9ScG+G2ynZK/AnXNubD2NixpU=
Received: by mx.zohomail.com with SMTPS id 175611079096555.98698687328829;
 Mon, 25 Aug 2025 01:33:10 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:38 +0200
Subject: [PATCH v3 18/20] PM / devfreq: rockchip-dfi: switch to
 FIELD_PREP_WM16 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-byeword-update-v3-18-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
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

Like many other Rockchip drivers, rockchip-dfi brings with it its own
HIWORD_UPDATE macro. This variant doesn't shift the value (and like the
others, doesn't do any checking).

Remove it, and replace instances of it with hw_bitfield.h's
FIELD_PREP_WM16.  Since FIELD_PREP_WM16 requires contiguous masks and
shifts the value for us, some reshuffling of definitions needs to
happen.

This gives us better compile-time error checking, and in my opinion,
nicer code.

Tested on an RK3568 ODROID-M1 board, and an RK3588 ROCK 5B board.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0470d7c175f4f6bb3955e36c713f4c55538d1a87..19fc23dedb0af0dfe88dd418f6817a1b0bed10f2 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/bitfield.h>
+#include <linux/hw_bitfield.h>
 #include <linux/bits.h>
 #include <linux/perf_event.h>
 
@@ -30,8 +31,6 @@
 
 #define DMC_MAX_CHANNELS	4
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
-
 /* DDRMON_CTRL */
 #define DDRMON_CTRL	0x04
 #define DDRMON_CTRL_DDR4		BIT(5)
@@ -40,9 +39,6 @@
 #define DDRMON_CTRL_LPDDR23		BIT(2)
 #define DDRMON_CTRL_SOFTWARE_EN		BIT(1)
 #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
-#define DDRMON_CTRL_DDR_TYPE_MASK	(DDRMON_CTRL_DDR4 | \
-					 DDRMON_CTRL_LPDDR4 | \
-					 DDRMON_CTRL_LPDDR23)
 
 #define DDRMON_CH0_WR_NUM		0x20
 #define DDRMON_CH0_RD_NUM		0x24
@@ -142,29 +138,32 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 			continue;
 
 		/* clear DDRMON_CTRL setting */
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_TIMER_CNT_EN |
-			       DDRMON_CTRL_SOFTWARE_EN | DDRMON_CTRL_HARDWARE_EN),
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_TIMER_CNT_EN, 0) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 0) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_HARDWARE_EN, 0),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		/* set ddr type to dfi */
 		switch (dfi->ddr_type) {
 		case ROCKCHIP_DDRTYPE_LPDDR2:
 		case ROCKCHIP_DDRTYPE_LPDDR3:
-			ctrl = DDRMON_CTRL_LPDDR23;
+			ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 1) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 0);
 			break;
 		case ROCKCHIP_DDRTYPE_LPDDR4:
 		case ROCKCHIP_DDRTYPE_LPDDR4X:
-			ctrl = DDRMON_CTRL_LPDDR4;
+			ctrl = FIELD_PREP_WM16(DDRMON_CTRL_LPDDR23, 0) |
+			       FIELD_PREP_WM16(DDRMON_CTRL_LPDDR4, 1);
 			break;
 		default:
 			break;
 		}
 
-		writel_relaxed(HIWORD_UPDATE(ctrl, DDRMON_CTRL_DDR_TYPE_MASK),
-			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
+		writel_relaxed(ctrl, dfi_regs + i * dfi->ddrmon_stride +
+			       DDRMON_CTRL);
 
 		/* enable count, use software mode */
-		writel_relaxed(HIWORD_UPDATE(DDRMON_CTRL_SOFTWARE_EN, DDRMON_CTRL_SOFTWARE_EN),
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 1),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
@@ -194,8 +193,8 @@ static void rockchip_dfi_disable(struct rockchip_dfi *dfi)
 		if (!(dfi->channel_mask & BIT(i)))
 			continue;
 
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_SOFTWARE_EN),
-			      dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
+		writel_relaxed(FIELD_PREP_WM16(DDRMON_CTRL_SOFTWARE_EN, 0),
+			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
 			break;

-- 
2.51.0

