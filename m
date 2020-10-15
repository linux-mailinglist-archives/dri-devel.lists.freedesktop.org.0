Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524482913ED
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA966E118;
	Sat, 17 Oct 2020 19:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2B6E193
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 19:03:40 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a7so4806244lfk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 12:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVhjbsTSxgBooF0oDEk6fnL5KJWip8RsGYfRTsIW3/o=;
 b=Olv9UFBwkrn4JXZrqse3ThJk1WGrsOAVxih4wTIqFOeYNByqvtbKoyV+1NSE0jvXsQ
 f/68ALwjPZjXMoTOR3q3GE0uZKBMSeMnup4Fu38B/rtY2WqywGtMhJQraD7NmvIvsxgR
 3qEdyqGomnUvuaCmjQD0PJFFSEtGWj8PFJQz1+fSTPacAugUdoriLMbyvCHisKW/akZm
 rLIDV76NVuHEZsZ0DBCmEiD4olQeH0bahD9dbf7x0APQpx9r70IDdE/ciP5ZP2NsvIb5
 ulsXqUYfg5QeZAv/AqsZh1UP8ksKqt6MoEuGTkLfoUMQMSLvDes7Yuphyq39gNzG/Sym
 q68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVhjbsTSxgBooF0oDEk6fnL5KJWip8RsGYfRTsIW3/o=;
 b=Ef3MwR7OKXOXsDfIm8DQq86DEYA2KsNqDNTmxEYvVkghK4elQqgIndyMAuGsX7JTvo
 wbK3KU8+2cjZ8OQEPThErticTAvcDgulqWJhkscnERR2a5pmJb4H1+aOKE6HaI+N0w7S
 n+/8YT+gYC9AXbFMCzzrfJTE4IHJYQSLUAH4ZVjI7mUrKqlDAunHl0EvZwvAnb8eKn87
 O/WiJM8V3KrEqvTblRNPdTXAvjbNiXX+s+j/R9Jw5Yzz5T8P59tcBWB4OjJPCQ2edl7q
 vR/VcsQoW6Ig4LAfv7Jjmkca7yTxWfJ/ysR4aD+mIMZWXXa4ZKylFJCi2GFZWGO/VVe5
 nvOw==
X-Gm-Message-State: AOAM532jbABf3owwRhHG4po2Y0+cuEQWg5DtwZ3hP8xXJEfECqpni8LX
 6Uig9ux+uxhRtcgRFE5Rl12MDw==
X-Google-Smtp-Source: ABdhPJwcxEOb1Alb/QhRoycX2zuNQNTPP5yDNI0C/j7OgnEmDwKTrP1kcNDMpS+cHNm4QXZCokk//A==
X-Received: by 2002:a19:6d4:: with SMTP id 203mr8998lfg.391.1602788618497;
 Thu, 15 Oct 2020 12:03:38 -0700 (PDT)
Received: from eriador.lan ([94.25.229.2])
 by smtp.gmail.com with ESMTPSA id 71sm1309781lfm.78.2020.10.15.12.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 12:03:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 2/4] drm/msm/dsi_pll_10nm: restore VCO rate during
 restore_state
Date: Thu, 15 Oct 2020 22:03:30 +0300
Message-Id: <20201015190332.1182588-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
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
Fixes: c6659785dfb3 ("drm/msm/dsi/pll: call vco set rate explicitly")
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 6ac04fc303f5..e4e9bf04b736 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -559,6 +559,7 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	struct pll_10nm_cached_state *cached = &pll_10nm->cached_state;
 	void __iomem *phy_base = pll_10nm->phy_cmn_mmio;
 	u32 val;
+	int ret;
 
 	val = pll_read(pll_10nm->mmio + REG_DSI_10nm_PHY_PLL_PLL_OUTDIV_RATE);
 	val &= ~0x3;
@@ -573,6 +574,13 @@ static int dsi_pll_10nm_restore_state(struct msm_dsi_pll *pll)
 	val |= cached->pll_mux;
 	pll_write(phy_base + REG_DSI_10nm_PHY_CMN_CLK_CFG1, val);
 
+	ret = dsi_pll_10nm_vco_set_rate(&pll->clk_hw, pll_10nm->vco_current_rate, pll_10nm->vco_ref_clk_rate);
+	if (ret) {
+		DRM_DEV_ERROR(&pll_10nm->pdev->dev,
+			"restore vco rate failed. ret=%d\n", ret);
+		return ret;
+	}
+
 	DBG("DSI PLL%d", pll_10nm->id);
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
