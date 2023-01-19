Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5166739F8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E7310E92A;
	Thu, 19 Jan 2023 13:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D01C10E92C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y19so2857116edc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjnaFfzoum4fVFwQpjzSWANLBAr3dGbDb/tk9McUQSA=;
 b=YlgmdXuKzt+ckoVJ2QvbtV/qEbLLYPA836G//AouOx+X8ghWzymUrdLJ++BIgmkBxX
 eQrZk1rriEh1eHMy6fJs0R5agF5csQygs10/kCEP/5/UDiAtpDckiRPH1kr0zV5jhjCw
 KAmUF7Di7RSMAXRnCOUvCZuhYJkcOa+Nto4//ahihqNlajYw5Rc+daX0CPCup58HPIwj
 fAebC1juX2rGtbqHT2DliJAqnaSl9qlm7q4IGnfTsWoQ5udUGjO1Xa9lWvqJbxD5KCGa
 rZ+Chv00u8CyII9kX6FkCJUUD4duKhSRbO6/KsHGMrglFNfD6GnNyyxUjHT9VT8x/A0w
 x6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HjnaFfzoum4fVFwQpjzSWANLBAr3dGbDb/tk9McUQSA=;
 b=JQXaL0DSrBp4TrkS9OSh4pfEsBT5MDoWX9VCuajY3PpnuCVrIeIT7HNUgaCYf7l3dt
 8Ft9dwhLJtJ1IeSg7F/KQ6b1JVteU1G7MhIkFUqarYgm5B/asMolBJ2vBjGhje+wKvdx
 aC/NnMXny/dzgn88Y4CSZMLLiM9OoJQo0hUe9PJMIrcmAWKgDn6gSB1UzLM15mHrtFav
 7w95piOy8lE9dZVkuooLVpPIschiQqYyRRJjDaCi4cAwsH5mUkF1T8Q1tqBIfZr1WH1V
 XxBaMhJBjGuNyXix3bWsCvf6rTSTRizE6uy826lIXGMKqKwPHp+5wmdb6iSCxu+Ck6mz
 BZUA==
X-Gm-Message-State: AFqh2krQoO5BxiDdjqXbWX30RcY1JbYHCjAk1LPWVGNMepHidV74xtDa
 LFfWPcXRTLkuce/kKXi7aTtUmQ==
X-Google-Smtp-Source: AMrXdXvSIlyDrGDKQikZpyVd9/i+iDGugeWBGGsAZB7YwtSrGuqX4pZucEnoR94/4rLHjugp9AZAhg==
X-Received: by 2002:aa7:d7d5:0:b0:498:dec8:f41e with SMTP id
 e21-20020aa7d7d5000000b00498dec8f41emr10740056eds.3.1674134545739; 
 Thu, 19 Jan 2023 05:22:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
Date: Thu, 19 Jan 2023 15:22:17 +0200
Message-Id: <20230119132219.2479775-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8960 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index c3e7ff45e52a..cb35a297afbd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8960 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	/* sanity check: */
 	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
@@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 	pll->pdev = pdev;
 	pll->clk_hw.init = &pll_init;
 
-	clk = devm_clk_register(dev, &pll->clk_hw);
-	if (IS_ERR(clk)) {
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return -EINVAL;
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		return ret;
 	}
 
 	return 0;
-- 
2.39.0

