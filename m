Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE6A70AAD1
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 22:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77810E1A3;
	Sat, 20 May 2023 20:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345D310E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 20:01:09 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so4944330e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 13:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684612865; x=1687204865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kL5WC4XfsCjBMRG17TRvwYrcpAIhfVj8rtH9i+qu5n8=;
 b=T8EEuoaH9hcVaP0ope0+Ib4TJAIQYcW4nlwT3SIP2Josx4is7qBtx/WUQy+tCC/ohi
 nG/ycc+0hCWrHEUA2ccL0JWlgr+eP6TjkV5XzyqjHkl7Nc0HuEq+rNzcYCjpyNDcVF57
 LXkUCSnby0SbyGIMOVlZc+vh1anQuQoRuKuRo6TfaerN4LufY8ugHt+evoT9Dz/3BKBS
 LqCBjJTRpYxqLYShqSXFrWSAPfCA/u1Aef/IOoLRA4N8tMOeM6oE5DzZLNr2bD5WYdln
 wwENCEJKUKcG8/YrIGweH7MUmJKK+FMdbHwFkyRqgnvXAeOOE/S3XviK3wrSNq6fvKLM
 QY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684612865; x=1687204865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kL5WC4XfsCjBMRG17TRvwYrcpAIhfVj8rtH9i+qu5n8=;
 b=feNEfDiplJsOr5TLOXIpoXW4oJh21vQXeYw8zE1gjvXKX8oL/1S1alzdteGDNvZ5XV
 n9Drz8TZfdCn4rKA+EiUkxYDeuwIiNuS/xAIaMp0xK7A0x6eBaQX7/75YLDhObVQTP/n
 o1wLuTJeyviqriCufBpNMsd4lSmeqX33TM60a5iOUFnP84IOk2cBB73Pusrk8NJ7cD+k
 plyKE5+W1VhDzApmLW+V6l8Cvvbse7tISo9mM5RmAWqLunawwwF+cFEsf+/JUEGah1r2
 qtlqexJuof5lGjrS+wBZZ52uDRDvVg4Us4YhVFXCU6iTrpKXbRP6tXqZq1FhjjMk2x2d
 W8hw==
X-Gm-Message-State: AC+VfDyyNPE3/SlpeG7LOyFkUlatwM31/BrtTkSGacydYTbiQXM0IOor
 xiK6/1xuR8hKyl3FhUncWtEdHQ==
X-Google-Smtp-Source: ACHHUZ7iwo3hKsXxSciKJSuSMB9lTFMkik0lRJvgifMQz5iT7xHTeS9p9+1YlAcL/3t2i71b8+eoYw==
X-Received: by 2002:a2e:a169:0:b0:2af:1761:8f23 with SMTP id
 u9-20020a2ea169000000b002af17618f23mr2601350ljl.46.1684612865159; 
 Sat, 20 May 2023 13:01:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a05651c014400b002ad9b741959sm418061ljd.76.2023.05.20.13.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 13:01:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/2] drm/msm/dsi: use mult_frac for pclk_bpp calculation
Date: Sat, 20 May 2023 23:01:03 +0300
Message-Id: <20230520200103.4019607-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
References: <20230520200103.4019607-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify calculations around pixel_clk_rate division. Replace common
pattern of doing 64-bit multiplication and then a do_div() call with
simpler mult_frac() invocation.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 2b257b459974..744f2398a6d6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -585,7 +585,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
 	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
-	u64 pclk_bpp = (u64)pclk_rate * bpp;
+	unsigned long pclk_bpp;
 
 	if (lanes == 0) {
 		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
@@ -594,9 +594,9 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 
 	/* CPHY "byte_clk" is in units of 16 bits */
 	if (msm_host->cphy_mode)
-		do_div(pclk_bpp, (16 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 16 * lanes);
 	else
-		do_div(pclk_bpp, (8 * lanes));
+		pclk_bpp = mult_frac(pclk_rate, bpp, 8 * lanes);
 
 	return pclk_bpp;
 }
@@ -627,15 +627,12 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	u64 pclk_bpp;
 	unsigned int esc_mhz, esc_div;
 	unsigned long byte_mhz;
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)msm_host->pixel_clk_rate * bpp;
-	do_div(pclk_bpp, 8);
-	msm_host->src_clk_rate = pclk_bpp;
+	msm_host->src_clk_rate = mult_frac(msm_host->pixel_clk_rate, bpp, 8);
 
 	/*
 	 * esc clock is byte clock followed by a 4 bit divider,
-- 
2.39.2

