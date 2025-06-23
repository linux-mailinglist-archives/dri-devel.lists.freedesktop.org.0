Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCFAE49BC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919C710E3F7;
	Mon, 23 Jun 2025 16:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DrNzhYPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7C010E3F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750694871; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nQFwrAmDTRE2uQfnwlZKMnlAEi+inZk07WlTtcxlyDuuWQUoU9scRve7sJPRTFlSjLQk52Eud3owCGXtNnrpXE+PPBkKQd0xXRCpo5R6j1UcGZ1D6f50L2z2DfyBRgTfRlgrU7ti3KrS/2R/tc7cTz22h2srOHEMl1bgVrIqgY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750694871;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7qeu209avxF0OpWa6sxALT6m2kEZIO42KKuVUIgEmSk=; 
 b=fW2k1Yszjx+BGnyz/mDccYnHp0YpNB7b4ukG3pfFEeNsyuW8CZBbnBrsyxCybAmjIIoTjI7WHFbDqELe4oBjqngmOE3t7BzW73Uwu9Rmw6HOmbIY+jJY6JfJ8pPTDTk7CeS1Q7Hx5nkOxatKOQRDupO1K3vJokL26MSfsrOkmEM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750694871; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=7qeu209avxF0OpWa6sxALT6m2kEZIO42KKuVUIgEmSk=;
 b=DrNzhYPahgxjYqQahY9ySUlPIzH3m8vyIuSAZ21nd4NR6SHIATlXOsB43LsptFsi
 QCcUSmHZEwN4aIXTDVBzJuIU5NQLOvnxc4xT2SKXhmalF2ZgSRUF6kX632vreQB3zHH
 8ijohyu48xNTrVPl7YnX9J8I8G+UwhrXQGNZLL1k=
Received: by mx.zohomail.com with SMTPS id 1750694868495967.9784952167641;
 Mon, 23 Jun 2025 09:07:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 23 Jun 2025 18:05:37 +0200
Subject: [PATCH v2 09/20] phy: rockchip-samsung-dcphy: switch to
 FIELD_PREP_WM16 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-byeword-update-v2-9-cf1fc08a2e1f@collabora.com>
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

phy-rockchip-samsung-dcphy is actually an exemplary example, where the
similarities to FIELD_PREP were spotted and the driver local macro has
the same semantics as the new FIELD_PREP_WM16 hw_bitfield.h macro.

Still, get rid of FIELD_PREP_HIWORD now that a shared implementation
exists, replacing the two instances of it with FIELD_PREP_WM16. This
gives us slightly better error checking; the value is now checked to fit
in 16 bits.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 28a052e17366516d5a99988bec9a52e3f0f09101..4508a314727232473e90fd1649ec0f2829b65c49 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/hw_bitfield.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -20,12 +21,6 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#define FIELD_PREP_HIWORD(_mask, _val)		\
-	(					\
-		FIELD_PREP((_mask), (_val)) |	\
-		((_mask) << 16)			\
-	)
-
 #define BIAS_CON0		0x0000
 #define I_RES_CNTL_MASK		GENMASK(6, 4)
 #define I_RES_CNTL(x)		FIELD_PREP(I_RES_CNTL_MASK, x)
@@ -252,8 +247,8 @@
 
 /* MIPI_CDPHY_GRF registers */
 #define MIPI_DCPHY_GRF_CON0		0x0000
-#define S_CPHY_MODE			FIELD_PREP_HIWORD(BIT(3), 1)
-#define M_CPHY_MODE			FIELD_PREP_HIWORD(BIT(0), 1)
+#define S_CPHY_MODE			FIELD_PREP_WM16(BIT(3), 1)
+#define M_CPHY_MODE			FIELD_PREP_WM16(BIT(0), 1)
 
 enum hs_drv_res_ohm {
 	STRENGTH_30_OHM = 0x8,

-- 
2.50.0

