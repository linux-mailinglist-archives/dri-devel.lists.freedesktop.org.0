Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4693FBC5C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F85589C3F;
	Mon, 30 Aug 2021 18:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C6889E65
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 18:24:59 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8115B3E83E;
 Mon, 30 Aug 2021 20:24:56 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Matthias Kaehlcke <mka@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global "xo"
 clock
Date: Mon, 30 Aug 2021 20:24:45 +0200
Message-Id: <20210830182445.167527-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830182445.167527-1-marijn.suijten@somainline.org>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The DSI PHY/PLL was relying on a global "xo" clock to be found, but the
real clock is named "xo_board" in the DT.  The standard nowadays is to
never use global clock names anymore but require the firmware (DT) to
provide every clock binding explicitly with .fw_name.  The DSI PLLs have
since been converted to this mechanism (specifically 14nm for SDM660)
and this transient clock can now be removed.

This issue was originally discovered in:
https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
and prevented the removal of "xo" at that time.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 9b97425008ce..16fd16351f95 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -37,19 +37,6 @@ enum {
 	P_GPLL1_EARLY_DIV,
 };
 
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_data = &(const struct clk_parent_data) {
-			.fw_name = "xo"
-		},
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct clk_alpha_pll gpll0_early = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -2281,7 +2268,6 @@ static struct gdsc pcie_0_gdsc = {
 };
 
 static struct clk_hw *gcc_sdm660_hws[] = {
-	&xo.hw,
 	&gpll0_early_div.hw,
 	&gpll1_early_div.hw,
 };
-- 
2.33.0

