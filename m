Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52034DA30
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 00:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF7989F1B;
	Mon, 29 Mar 2021 22:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F80989468;
 Mon, 29 Mar 2021 22:22:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E729619A7;
 Mon, 29 Mar 2021 22:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617056558;
 bh=LRLTHDoyxZtUu4x9R9wdOxcA34G7xck2pkv/y/zF9LU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dFYv+xHLrYmXXNszH9Mj19ruqTBAeiiE2IAgxKPuUwb7ll1aysGX2FxRqT2zW2KQO
 VugA3Swzaq078R4fZJ8wgZyuiOugGGMg04Buq4mmuvR0M09wpcI276IJ5VEwSJBeSp
 Eyg6mzf0u4/n+iADFZNOOufNFVqLgMzL4WXm/YM9q2873Rl0lJt4f7kmj27yycRLEH
 /iSZj3zc/C8bTS0jJKAtTuk6ckdIzwaV7oBLdweYrhThA149wnJxZAdWzVQAwlrEVt
 Ubq98QVq+8uZpnjK05z9zVD43zynd++Ee7UWPJBNeepsP2ezIV+RHsBSMvFW2Z2nEY
 9lFpU3rrKN/lA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/33] drm/msm/dsi_pll_7nm: Fix variable usage
 for pll_lockdet_rate
Date: Mon, 29 Mar 2021 18:22:01 -0400
Message-Id: <20210329222222.2382987-13-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210329222222.2382987-1-sashal@kernel.org>
References: <20210329222222.2382987-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

[ Upstream commit 9daaf31307856defb1070685418ce5a484ecda3a ]

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
pll_lockdet_rate")

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index 93bf142e4a4e..901e8b8819d3 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -325,7 +325,7 @@ static void dsi_pll_commit(struct dsi_pll_7nm *pll)
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_LOW_1, reg->frac_div_start_low);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_MID_1, reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_FRAC_DIV_START_HIGH_1, reg->frac_div_start_high);
-	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCKDET_RATE_1, reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CMODE_1, 0x10); /* TODO: 0x00 for CPHY */
 	pll_write(base + REG_DSI_7nm_PHY_PLL_CLOCK_INVERTERS, reg->pll_clock_inverters);
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
