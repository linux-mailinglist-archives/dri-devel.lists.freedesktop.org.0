Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 950B9AE49AA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D4410E3F1;
	Mon, 23 Jun 2025 16:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Bkdfab8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519710E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:07:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750694816; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nLrO5oQeF65RNK+YOmn5Pt8mfbVivHcu5CLMl7sUgLMKyzGEZyY0JpYE68XdGcVRZyBZGq6c+0HWCvPfHmSvBMou4BR+xhw4GZ3ylk662LQWxIU4pXT4xjg6dGYEhiXqwS3AVEN56jfETB/z8BBVBZ3lgtrxkTHhWIi32LzYgGk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750694816;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Qhjp8jVplNYCiKKq7znetwOB1awnMxI4TCcb8mGA9aY=; 
 b=YxsSBvVVgc0SDA/3g+v8slJEZcUJZnN81NO81dHnfuwox7gDklhSeoHUn172Tj70RyHkAATsEa0t2lB5YDzyjP69ul676NoTpJOKjR8GppfpJJADbebGhOZ/3e93XNL0jd53nELp3u1aMMDVwToDd6ELyP3LBG/MmtyKxdBNh28=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750694816; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Qhjp8jVplNYCiKKq7znetwOB1awnMxI4TCcb8mGA9aY=;
 b=Bkdfab8Lxq8HYeWCEuafXa3iN7d7R2E/BxpJGUPGYSUT/9KP0Ex4Xks4tIpn5G2M
 /IZS0hHtOiYVrcbb7csqzZn7KtMmVuqKh6mPOrPjmucYhaIpXzFgCf2gCX42I5vdJss
 DwRGEflJQKvRYrxAwGdYNFx/U83jgFjGswXihCDg=
Received: by mx.zohomail.com with SMTPS id 1750694815522294.98488541831125;
 Mon, 23 Jun 2025 09:06:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 23 Jun 2025 18:05:33 +0200
Subject: [PATCH v2 05/20] drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-byeword-update-v2-5-cf1fc08a2e1f@collabora.com>
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

Remove rockchip_lvds.h's own HIWORD_UPDATE macro, and replace all
instances of it with hw_bitfield.h's FIELD_PREP_WM16 macro, which gives
us more error checking.

For the slightly-less-trivial case of the 2-bit width instance, the
results were checked during development to match all possible input
values (0 to 3, inclusive).

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.h | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
index ca83d7b6bea733588849d3ff379cf8540405462b..2d92447d819bed18adc99f84664c93c639c86a19 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -9,6 +9,9 @@
 #ifndef _ROCKCHIP_LVDS_
 #define _ROCKCHIP_LVDS_
 
+#include <linux/bits.h>
+#include <linux/hw_bitfield.h>
+
 #define RK3288_LVDS_CH0_REG0			0x00
 #define RK3288_LVDS_CH0_REG0_LVDS_EN		BIT(7)
 #define RK3288_LVDS_CH0_REG0_TTL_EN		BIT(6)
@@ -106,18 +109,16 @@
 #define LVDS_VESA_18				2
 #define LVDS_JEIDA_18				3
 
-#define HIWORD_UPDATE(v, h, l)  ((GENMASK(h, l) << 16) | ((v) << (l)))
-
 #define PX30_LVDS_GRF_PD_VO_CON0		0x434
-#define   PX30_LVDS_TIE_CLKS(val)		HIWORD_UPDATE(val,  8,  8)
-#define   PX30_LVDS_INVERT_CLKS(val)		HIWORD_UPDATE(val,  9,  9)
-#define   PX30_LVDS_INVERT_DCLK(val)		HIWORD_UPDATE(val,  5,  5)
+#define   PX30_LVDS_TIE_CLKS(val)		FIELD_PREP_WM16(BIT(8), (val))
+#define   PX30_LVDS_INVERT_CLKS(val)		FIELD_PREP_WM16(BIT(9), (val))
+#define   PX30_LVDS_INVERT_DCLK(val)		FIELD_PREP_WM16(BIT(5), (val))
 
 #define PX30_LVDS_GRF_PD_VO_CON1		0x438
-#define   PX30_LVDS_FORMAT(val)			HIWORD_UPDATE(val, 14, 13)
-#define   PX30_LVDS_MODE_EN(val)		HIWORD_UPDATE(val, 12, 12)
-#define   PX30_LVDS_MSBSEL(val)			HIWORD_UPDATE(val, 11, 11)
-#define   PX30_LVDS_P2S_EN(val)			HIWORD_UPDATE(val,  6,  6)
-#define   PX30_LVDS_VOP_SEL(val)		HIWORD_UPDATE(val,  1,  1)
+#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
+#define   PX30_LVDS_MODE_EN(val)		FIELD_PREP_WM16(BIT(12), (val))
+#define   PX30_LVDS_MSBSEL(val)			FIELD_PREP_WM16(BIT(11), (val))
+#define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
+#define   PX30_LVDS_VOP_SEL(val)		FIELD_PREP_WM16(BIT(1), (val))
 
 #endif /* _ROCKCHIP_LVDS_ */

-- 
2.50.0

