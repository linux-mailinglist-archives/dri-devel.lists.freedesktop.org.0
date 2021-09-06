Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D244020B0
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 22:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974389C55;
	Mon,  6 Sep 2021 20:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF7A89C54
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Sep 2021 20:25:57 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8B8533E7F1;
 Mon,  6 Sep 2021 22:25:54 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in
 poll_for_ready
Date: Mon,  6 Sep 2021 22:25:51 +0200
Message-Id: <20210906202552.824598-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
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

The downstream driver models this PLL lock check as an if-elseif-else.
The only way to reach the else case where pll_locked=true [1] is by
succeeding both readl_poll_timeout_atomic calls (which return zero on
success) in the if _and_ elseif condition.  Hence both the "lock" and
"ready" bit need to be tested in the SM_READY_STATUS register before
considering the PLL locked and ready to go.

Tested on the Sony Xperia XA2 Ultra (nile-discovery, sdm630).

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/clk/qcom/mdss/mdss-dsi-pll-14nm-util.c?h=LA.UM.9.2.1.r1-08000-sdm660.0#n302

Fixes: f079f6d999cb ("drm/msm/dsi: Add PHY/PLL for 8x96")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 8905f365c932..789b08c24d25 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -110,14 +110,13 @@ static struct dsi_pll_14nm *pll_14nm_list[DSI_MAX];
 static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 				    u32 nb_tries, u32 timeout_us)
 {
-	bool pll_locked = false;
+	bool pll_locked = false, pll_ready = false;
 	void __iomem *base = pll_14nm->phy->pll_base;
 	u32 tries, val;
 
 	tries = nb_tries;
 	while (tries--) {
-		val = dsi_phy_read(base +
-			       REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
 		pll_locked = !!(val & BIT(5));
 
 		if (pll_locked)
@@ -126,23 +125,24 @@ static bool pll_14nm_poll_for_ready(struct dsi_pll_14nm *pll_14nm,
 		udelay(timeout_us);
 	}
 
-	if (!pll_locked) {
-		tries = nb_tries;
-		while (tries--) {
-			val = dsi_phy_read(base +
-				REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
-			pll_locked = !!(val & BIT(0));
+	if (!pll_locked)
+		goto out;
 
-			if (pll_locked)
-				break;
+	tries = nb_tries;
+	while (tries--) {
+		val = dsi_phy_read(base + REG_DSI_14nm_PHY_PLL_RESET_SM_READY_STATUS);
+		pll_ready = !!(val & BIT(0));
 
-			udelay(timeout_us);
-		}
+		if (pll_ready)
+			break;
+
+		udelay(timeout_us);
 	}
 
-	DBG("DSI PLL is %slocked", pll_locked ? "" : "*not* ");
+out:
+	DBG("DSI PLL is %slocked, %sready", pll_locked ? "" : "*not* ", pll_ready ? "" : "*not* ");
 
-	return pll_locked;
+	return pll_locked && pll_ready;
 }
 
 static void dsi_pll_14nm_config_init(struct dsi_pll_config *pconf)
-- 
2.33.0

