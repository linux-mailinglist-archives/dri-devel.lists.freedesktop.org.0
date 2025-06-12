Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B982FAD7A60
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F7410E15B;
	Thu, 12 Jun 2025 19:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="fu5lzhx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FA110E160
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754835; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Iw4lh31zL3z3vD4l4xecCrI7P32xZo18/XnWLSbT+0eTjO8AWIJ+cpqks4s0BYoN9xlYeef1j2egzjwr6MmP242NVMt//uQiPxgKLyzoNTH4hU3jXrdsmZirqu/Ue7iru8typnlh6/GgxJJa3X1fE49YengG5j96Ugpj76FUWzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754835;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=A3pFEOOb6EOrxgekJ/E7bblmTlxsE0jgmWgpDuqVGPI=; 
 b=l3U8SXUOPY1cFZ6FfLwBTFMZqMXPT4oGoyfyIaDbxLbWbmdL58lG2nR+SztDNwooTh0adAGz2h9vpOvOODttWauvs36n5sq9mmxO1Y26JMmhGclvz9wlEP/ktsgkYfzqRWGT3VpIQSde8ouA3yx2aRn1kQE9KM+URDXK4Pu3wZ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754835; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=A3pFEOOb6EOrxgekJ/E7bblmTlxsE0jgmWgpDuqVGPI=;
 b=fu5lzhx6cwwOCtOY33CFP1xl/7xxfxNMI12CKuai1Aw50ZX3m4vX9GQ+GHa8gkyy
 tjP3stEhr5lch37RCITLb9C7G6w3oPtG17AvoZ39Uazn47g4KXiuzCWG2ydoS+PKnm6
 0QxRTMRWkR6Oel4nmpTjlFejoX07IM+z0gAl4Qy8=
Received: by mx.zohomail.com with SMTPS id 1749754833329406.383279922641;
 Thu, 12 Jun 2025 12:00:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:21 +0200
Subject: [PATCH 19/20] clk: sp7021: switch to HWORD_UPDATE macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-byeword-update-v1-19-f4afb8f6313f@collabora.com>
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

The sp7021 clock driver has its own shifted high word mask macro,
similar to the ones many Rockchip drivers have.

Remove it, and replace instances of it with bitfield.h's HWORD_UPDATE
macro, which does the same thing except in a common macro that also does
compile-time error checking.

This was compile-tested with 32-bit ARM with Clang, no runtime tests
were performed as I lack the hardware. However, I verified that fix
commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()")
is not regressed. No warning is produced.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/clk-sp7021.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 7cb7d501d7a6ebffe002f80dfa937365e04d356a..f408109f866c6ee65398d549e76994e54c1421ea 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -38,13 +38,6 @@ enum {
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
@@ -313,15 +306,15 @@ static int plltv_set_rate(struct sp_pll *clk)
 	u32 r0, r1, r2;
 
 	r0  = BIT(clk->bp_bit + 16);
-	r0 |= HWM_FIELD_PREP(MASK_SEL_FRA, clk->p[SEL_FRA]);
-	r0 |= HWM_FIELD_PREP(MASK_SDM_MOD, clk->p[SDM_MOD]);
-	r0 |= HWM_FIELD_PREP(MASK_PH_SEL, clk->p[PH_SEL]);
-	r0 |= HWM_FIELD_PREP(MASK_NFRA, clk->p[NFRA]);
+	r0 |= HWORD_UPDATE(MASK_SEL_FRA, clk->p[SEL_FRA]);
+	r0 |= HWORD_UPDATE(MASK_SDM_MOD, clk->p[SDM_MOD]);
+	r0 |= HWORD_UPDATE(MASK_PH_SEL, clk->p[PH_SEL]);
+	r0 |= HWORD_UPDATE(MASK_NFRA, clk->p[NFRA]);
 
-	r1  = HWM_FIELD_PREP(MASK_DIVR, clk->p[DIVR]);
+	r1  = HWORD_UPDATE(MASK_DIVR, clk->p[DIVR]);
 
-	r2  = HWM_FIELD_PREP(MASK_DIVN, clk->p[DIVN] - 1);
-	r2 |= HWM_FIELD_PREP(MASK_DIVM, clk->p[DIVM] - 1);
+	r2  = HWORD_UPDATE(MASK_DIVN, clk->p[DIVN] - 1);
+	r2 |= HWORD_UPDATE(MASK_DIVM, clk->p[DIVM] - 1);
 
 	spin_lock_irqsave(&clk->lock, flags);
 	writel(r0, clk->reg);

-- 
2.49.0

