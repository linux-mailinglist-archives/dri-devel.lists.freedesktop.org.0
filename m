Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB4AD7A5B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B59010E15F;
	Thu, 12 Jun 2025 19:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="O15lOD6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4CE10E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754821; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=afASkY17K44xJEqOtwoZRi2Rj7NU7XGHd4FRsaUcqjDdsxzAJJPtIiTemtpvH6l/NG65TT05z2EkQLZdosFRQryXP6i+RGhx7dBneuvXXeZUqTxa8Qh+DYKsDDweJzC0PjzGah1CDwp1GfdI7h3XUf65IW3CbLigXt4s9uWuqKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754821;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=m1382RaA7e8zsKGURaU10Bm2BofcjNhspv3I/bEDj7A=; 
 b=IdI2iMjWyIsfW6J4Z3uk5DJ+r4e0XnhOfEhn3553kdGunkhO5w///zqauhzf/g4fCNCJVbDN5baWezVSY5RiUyuzhUPpEHHjgKh0pKKpdm8+s8Lu353UV0bOh8fZpcYB1Z/fkz5E0jOtOjDq9n5UP/I4yUSUebHRI1M260F8slg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754821; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=m1382RaA7e8zsKGURaU10Bm2BofcjNhspv3I/bEDj7A=;
 b=O15lOD6MI/pO9h9f2kP7I1AWRDMPsoJW29DoDvaV7h+Bx2ZViNauk5I/7iA7EDEB
 kV9coVsP3dI4A0XNr1l4oIuYa7usUkDGTnB7hX4y5BpR2JhsVqr2f6lPdGo8GUXnatZ
 9NHA0fRNgfDpIWUdNhnEchVHqaTTsGazuupwfMuY=
Received: by mx.zohomail.com with SMTPS id 1749754820267222.12581105394042;
 Thu, 12 Jun 2025 12:00:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:20 +0200
Subject: [PATCH 18/20] PM / devfreq: rockchip-dfi: switch to HWORD_UPDATE macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-18-f4afb8f6313f@collabora.com>
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

Like many other Rockchip drivers, rockchip-dfi brings with it its own
HIWORD_UPDATE macro. This variant doesn't shift the value (and like the
others, doesn't do any checking).

Remove it, and replace instances of it with bitfield.h's HWORD_UPDATE.
Since HWORD_UPDATE requires contiguous masks and shifts the value for
us, some reshuffling of definitions needs to happen.

This gives us better compile-time error checking, and in my opinion,
nicer code.

Tested on an RK3568 ODROID-M1 board, and an RK3588 ROCK 5B board.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/devfreq/event/rockchip-dfi.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0470d7c175f4f6bb3955e36c713f4c55538d1a87..634e935ab821de23a296af5fedf22341bc4217bb 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -30,8 +30,6 @@
 
 #define DMC_MAX_CHANNELS	4
 
-#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
-
 /* DDRMON_CTRL */
 #define DDRMON_CTRL	0x04
 #define DDRMON_CTRL_DDR4		BIT(5)
@@ -40,9 +38,6 @@
 #define DDRMON_CTRL_LPDDR23		BIT(2)
 #define DDRMON_CTRL_SOFTWARE_EN		BIT(1)
 #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
-#define DDRMON_CTRL_DDR_TYPE_MASK	(DDRMON_CTRL_DDR4 | \
-					 DDRMON_CTRL_LPDDR4 | \
-					 DDRMON_CTRL_LPDDR23)
 
 #define DDRMON_CH0_WR_NUM		0x20
 #define DDRMON_CH0_RD_NUM		0x24
@@ -142,29 +137,32 @@ static int rockchip_dfi_enable(struct rockchip_dfi *dfi)
 			continue;
 
 		/* clear DDRMON_CTRL setting */
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_TIMER_CNT_EN |
-			       DDRMON_CTRL_SOFTWARE_EN | DDRMON_CTRL_HARDWARE_EN),
+		writel_relaxed(HWORD_UPDATE(DDRMON_CTRL_TIMER_CNT_EN, 0) |
+			       HWORD_UPDATE(DDRMON_CTRL_SOFTWARE_EN, 0) |
+			       HWORD_UPDATE(DDRMON_CTRL_HARDWARE_EN, 0),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		/* set ddr type to dfi */
 		switch (dfi->ddr_type) {
 		case ROCKCHIP_DDRTYPE_LPDDR2:
 		case ROCKCHIP_DDRTYPE_LPDDR3:
-			ctrl = DDRMON_CTRL_LPDDR23;
+			ctrl = HWORD_UPDATE(DDRMON_CTRL_LPDDR23, 1) |
+			       HWORD_UPDATE(DDRMON_CTRL_LPDDR4, 0);
 			break;
 		case ROCKCHIP_DDRTYPE_LPDDR4:
 		case ROCKCHIP_DDRTYPE_LPDDR4X:
-			ctrl = DDRMON_CTRL_LPDDR4;
+			ctrl = HWORD_UPDATE(DDRMON_CTRL_LPDDR23, 0) |
+			       HWORD_UPDATE(DDRMON_CTRL_LPDDR4, 1);
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
+		writel_relaxed(HWORD_UPDATE(DDRMON_CTRL_SOFTWARE_EN, 1),
 			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
@@ -194,8 +192,8 @@ static void rockchip_dfi_disable(struct rockchip_dfi *dfi)
 		if (!(dfi->channel_mask & BIT(i)))
 			continue;
 
-		writel_relaxed(HIWORD_UPDATE(0, DDRMON_CTRL_SOFTWARE_EN),
-			      dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
+		writel_relaxed(HWORD_UPDATE(DDRMON_CTRL_SOFTWARE_EN, 0),
+			       dfi_regs + i * dfi->ddrmon_stride + DDRMON_CTRL);
 
 		if (dfi->ddrmon_ctrl_single)
 			break;

-- 
2.49.0

