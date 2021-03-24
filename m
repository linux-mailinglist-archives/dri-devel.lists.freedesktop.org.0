Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0566B347C1F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7BB6EC93;
	Wed, 24 Mar 2021 15:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B723A6EC91
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:19:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b14so19285302lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
 b=znoqwLJm7izb5lBmvfQwSvrc7kAZkwlBIOkIwe1r2FpSKUwHYcNd2RvOtQBv6rjHes
 idvTjUKowrFuKSzrhG6PTGe55Ftzt/KlSBbbsAYEhSNYfYL7DuGeV3Co1ak+2rlZtuGq
 u/53FicoWS8BniYtKaiPTNj1qvuO2hjzj5iNJVqxelDgGT7KwWMZWAP9biyyWEkjPYl1
 XsCOz0nQfNaBe3oN0/wI5tYgkyu/k0RO+07V4WOT3Dpa79QLxUG2cNuPIMpBSSfljBdQ
 7/doPKIxu+z//vNI/5vVkaYIi5RmBhggCZzSscdDEJ6pv3SXyHuxko/n4wuKffA2fePS
 t/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFHW0LdlrmaF7YDk0vokBt8XF/nut54+Ls9k+Au93LE=;
 b=FebGKTdixqpRhScBCYKvIU6mwHJ2Qcy7H/hGYe54fPKEtdQBxXwf81VnJL7i0tdGOV
 ZWRBRolhnmlk1242r2Ho+j5do0G/S0cyoO+spJTWku8D+1v54CHkWmqDN/Bt3kMp3v5C
 ZXyWC5sDf16q7PeKI5XmKreOlYtDw9pLFfrv21ekEh4I92azoej/col5DNjXXtRPDASm
 ZKlGWYiVenCBOr1st9P8RNU3QdX1PSeRU6DJGxVK8mBaXUw1FLwFbNYHKzm8ufaDK0Fd
 g8+8o1N5O1+k1x9Xcrs0MchEAtsLO9G8Kb0fGSMZ0kDljSRtY4pN14C9QdbcRuu5qOlS
 xspg==
X-Gm-Message-State: AOAM533cfjaPRMkzguWkCpDAm6cm4DybFTAmJqGC+vMgzds6IpxBg7NK
 i9aAlAB8EgvFs8nhJ99syUJeqvQfvGho3w==
X-Google-Smtp-Source: ABdhPJzWQcwJvCfTtwbapc57LbykfrinjAf0yupRWqNHinRXX5Af6AkUjr8v2aftNoYW6OjSTLrQ1w==
X-Received: by 2002:ac2:5146:: with SMTP id q6mr2347257lfd.441.1616599172213; 
 Wed, 24 Mar 2021 08:19:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d22sm255199lfm.267.2021.03.24.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:19:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 19/28] drm/msm/dpu: simplify vco_delay handling in
 dsi_phy_28nm driver
Date: Wed, 24 Mar 2021 18:18:37 +0300
Message-Id: <20210324151846.2774204-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of setting the variable and then using it just in the one place,
determine vco_delay directly at the PLL configuration time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 3e9b7949b038..87d1aa4114e4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -72,8 +72,6 @@ struct dsi_pll_28nm {
 	struct platform_device *pdev;
 	void __iomem *mmio;
 
-	int vco_delay;
-
 	struct pll_28nm_cached_state cached_state;
 };
 
@@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
 
 	/* Add hardware recommended delay for correct PLL configuration */
-	if (pll_28nm->vco_delay)
-		udelay(pll_28nm->vco_delay);
+	if (pll->cfg->type == MSM_DSI_PHY_28NM_HPM)
+		udelay(1);
+	else /* LP */
+		udelay(1000);
 
 	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
 	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
@@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy *phy)
 
 	pll = &pll_28nm->base;
 	pll->cfg = phy->cfg;
-	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
-		pll_28nm->vco_delay = 1000;
-	else
-		pll_28nm->vco_delay = 1;
 
 	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
 	if (ret) {
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
