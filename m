Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EE291405
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9069F6E245;
	Sat, 17 Oct 2020 19:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5636E192
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:38 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j30so4853819lfp.4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
 b=R6AIOc5WJ33f0BpBRKWYPfmzPqDTmiRJK6HbByTEodetAfGJmFjYidA1TNiqjvR4Fi
 +z1TNNeyEyau6GtusqefeTQnKj5EcAJpmjSyGJsRm4kY0+nEU/tuqZaM645x9d52EkfJ
 XlL9lbev6DTnB4JsfiHTcsinc3sEuY5IWeieKnPKFav7EuFVVDRflL68jIvC95bn0frl
 ORFaopwANTwpTD6Yiy8F9m+79timzuVAvJkC66NNbUskf8Zvx8F7rJhZzbzksEu1tGPC
 TnNB5kTXKRU103n6pq7CvDUmOa/QkY1XLAknl7zyYtDYikwQOcsZTXxzyVWNSIv/3QC6
 4zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7YS0cP3DNPcvbNXRWVhMLK0IxI1d+qLuJ8TulIiLDZ0=;
 b=qJyVBUH3NwDCwAhVTgjJVPVsAXPMfnnniztkv9pCjp9ynWXystE7gAIZerRrqZBulx
 5OKaC9DBomA1pfaqhsZSKid2b0y9IrSUzHogZZ3g5Elwc4jsr0Hfkm/yfdsOz6SMoM4V
 hx39Vaw+jKVj1oZcm+8a59KudN9jlcvvLKgCCwHI1nas/rhvOHHGaCmuciY8Pvz6mKeu
 s4+Jig/8JUB7U701d6RVpSY6u51oEDUGAX8Sh6v3cmBN3QOQ6ns2Dj2li8evt78mhWSp
 RCC4L+qHIXF6HWXSU4c2ZhCRUDDcHA6SJgK/cVKu9iRQMTeVbHpjH0p35h9F8dLLTcx+
 ilKQ==
X-Gm-Message-State: AOAM533FjKeu4iEToZcbUKZtpN4guy1i32DaihNzxIq7OPNTgczDdWzr
 xQxle3yYPR5N0g6eIICLWHCefA==
X-Google-Smtp-Source: ABdhPJyrLs7S6IIec/2X2Mr3xlDlbDJAbGZIbUGS6+Evt+QFdDtmpf67+WxUOYXCG2lMLvxRifri5g==
X-Received: by 2002:a19:c3d6:: with SMTP id t205mr21117lff.84.1602788616297;
 Thu, 15 Oct 2020 12:03:36 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 1/4] drm/msm/dsi_pll_7nm: restore VCO rate during restore_state
Date: Thu, 15 Oct 2020 22:03:29 +0300
Message-Id: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PHY disable/enable resets PLL registers to default values. Thus in
addition to restoring several registers we also need to restore VCO rate
settings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index de0dfb815125..93bf142e4a4e 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -585,6 +585,7 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	struct pll_7nm_cached_state *cached = &pll_7nm->cached_state;
 	void __iomem *phy_base = pll_7nm->phy_cmn_mmio;
 	u32 val;
+	int ret;
 
 	val = pll_read(pll_7nm->mmio + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
@@ -599,6 +600,13 @@ static int dsi_pll_7nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1, val);
 
+	ret = dsi_pll_7nm_vco_set_rate(&pll->clk_hw, pll_7nm->vco_current_rate, pll_7nm->vco_ref_clk_rate);
+	if (ret) {
+		DRM_DEV_ERROR(&pll_7nm->pdev->dev,
+			"restore vco rate failed. ret=%d\n", ret);
+		return ret;
+	}
+
 	DBG("DSI PLL%d", pll_7nm->id);
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
