Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F5B3391C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 10:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53610E40A;
	Mon, 25 Aug 2025 08:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="a1xxl0IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97210E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 08:33:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110806; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=NEnkm7bkildYSMORz5VwRAsdvB5/k4YKVucjn5aVKdFlLqYZdaQCueHih7rXYrAr6uM5pyqBS/M61FXajgGNYN1B2SdcC0qxLdQVZj+OUy/BWUlttrwNJsMVBSqBFvAMBg0I8JI97vlL99zg0i0ZJZSmjlJuReTpRZjvdsB/V4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110806;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=F2wW2nSCfNA+ZzeNk/9bZzgPwpwE6OmmcsyR8TE5mz4=; 
 b=V7OGdpc871O3sg0OliotP2xsf5buy3R43toSM5lkFjRBBU3kQ9ckhZIhZtQrgouXIJ1KF7RLT/KuLPH4V/thq4PfO/oNa2Wxdv5gUpwnu0PNOCZYj8qtoKi6/x+fWBZdXkw+lyYfAuKQdZO9AIllFwWKTKLlVrhB4hLrfqt4HLY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110806; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=F2wW2nSCfNA+ZzeNk/9bZzgPwpwE6OmmcsyR8TE5mz4=;
 b=a1xxl0ICrtBlZFNVvhybNm7kmnuOD/0w74LewtUIcp6X+nq/JAqpl1Rq/Qs6ojft
 GYGlVu5oL3M/TENJAf4wgIazVAyWEbmSzjwE4eSTISei8Yjwc2ZCqvh/Ffv62f4UICA
 0AHYTFXpyJQllaUGFk63rWh6S3KCledb0oYDHvSw=
Received: by mx.zohomail.com with SMTPS id 1756110805059495.54620359289174;
 Mon, 25 Aug 2025 01:33:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:39 +0200
Subject: [PATCH v3 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-byeword-update-v3-19-947b841cdb29@collabora.com>
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

The sp7021 clock driver has its own shifted high word mask macro,
similar to the ones many Rockchip drivers have.

Remove it, and replace instances of it with hw_bitfield.h's
FIELD_PREP_WM16 macro, which does the same thing except in a common
macro that also does compile-time error checking.

This was compile-tested with 32-bit ARM with Clang, no runtime tests
were performed as I lack the hardware. However, I verified that fix
commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
is not regressed. No warning is produced.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/clk-sp7021.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 95d66191df4bdb3609128ea097be896ef3a1038a..e902ba75e00656688441b938938f3fc4afc46974 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/bitfield.h>
+#include <linux/hw_bitfield.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/err.h>
@@ -38,13 +39,6 @@ enum {
 #define MASK_DIVN	GENMASK(7, 0)
 #define MASK_DIVM	GENMASK(14, 8)
 
-/* HIWORD_MASK FIELD_PREP */
-#define HWM_FIELD_PREP(mask, value)		\
-({						\
-	u64 _m = mask;				\
-	(_m << 16) | FIELD_PREP(_m, value);	\
-})
-
 struct sp_pll {
 	struct clk_hw hw;
 	void __iomem *reg;
@@ -313,15 +307,15 @@ static int plltv_set_rate(struct sp_pll *clk)
 	u32 r0, r1, r2;
 
 	r0  = BIT(clk->bp_bit + 16);
-	r0 |= HWM_FIELD_PREP(MASK_SEL_FRA, clk->p[SEL_FRA]);
-	r0 |= HWM_FIELD_PREP(MASK_SDM_MOD, clk->p[SDM_MOD]);
-	r0 |= HWM_FIELD_PREP(MASK_PH_SEL, clk->p[PH_SEL]);
-	r0 |= HWM_FIELD_PREP(MASK_NFRA, clk->p[NFRA]);
+	r0 |= FIELD_PREP_WM16(MASK_SEL_FRA, clk->p[SEL_FRA]);
+	r0 |= FIELD_PREP_WM16(MASK_SDM_MOD, clk->p[SDM_MOD]);
+	r0 |= FIELD_PREP_WM16(MASK_PH_SEL, clk->p[PH_SEL]);
+	r0 |= FIELD_PREP_WM16(MASK_NFRA, clk->p[NFRA]);
 
-	r1  = HWM_FIELD_PREP(MASK_DIVR, clk->p[DIVR]);
+	r1  = FIELD_PREP_WM16(MASK_DIVR, clk->p[DIVR]);
 
-	r2  = HWM_FIELD_PREP(MASK_DIVN, clk->p[DIVN] - 1);
-	r2 |= HWM_FIELD_PREP(MASK_DIVM, clk->p[DIVM] - 1);
+	r2  = FIELD_PREP_WM16(MASK_DIVN, clk->p[DIVN] - 1);
+	r2 |= FIELD_PREP_WM16(MASK_DIVM, clk->p[DIVM] - 1);
 
 	spin_lock_irqsave(&clk->lock, flags);
 	writel(r0, clk->reg);

-- 
2.51.0

