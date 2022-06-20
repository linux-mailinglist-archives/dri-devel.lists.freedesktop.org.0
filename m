Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EA5550E46
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 03:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FAE113096;
	Mon, 20 Jun 2022 01:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC4A113090
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:03:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a13so4989938lfr.10
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 18:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FB+K+cb4f9fS6PvlJKAr+KfimzTAeQrUyeuMC2GkgBE=;
 b=zRPf96lvRNy85R9m6l0+/rizmlEMhGwIVx3yO5JkGAx0G2bgd7HGfWlOjuGCqc3CP0
 RxZSaLBf/MS7bJT1AFk1CTONMgwctOlMIS6miRW6bIEx7in8HGlJkR+50Lun7MaXVbHz
 YhPCWkWXlo1fDSg4dj8475amenQa7NTx9y82LHsAIvzgY2VHUYTZ6OJnjHzJXgz72zSs
 WaC2qyUmBmR9ZL/jqK2bPZP3i0Ii5zHWwgjYEHmRt4XOyVfsgo1OfBaqZFcm9ku4xgnC
 +ps9E6Ex1NYysJUDmbb+G17ckSMUmSSnzOHOTD7r/9Pbl4Ap4kiHaKWE5IalVmEo0uaj
 pc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FB+K+cb4f9fS6PvlJKAr+KfimzTAeQrUyeuMC2GkgBE=;
 b=NV86dp9vNh7zHbmbJmv5V+nrKVSacA3UlmaXoGX78+Ysk/aUoSdTkNi952GaS/KMYc
 agJ63f3BVj+OEk6k8b7yWlToXwKB4Ud/n+0Rs8meZ+Qe/RL8j3Xpkbtci4NsZmyB0KtN
 UvQSrNzcyqsk9NRBs8qtin3vY/6LZmTWTu5uE3tZWNWSxWa27R+OfqtFY1ORy7uHC+fu
 RrmbPx+oEKEavyEkKWhD277/lmiOtUVBApMAkOgJ3sLIfb9qmcghtXxM7sUQYwyme62L
 f8lhR6AHKO13R7l3zat9hFC1mLTk0V2dVY+Rnelvksje7By2LvVzJG9/g3RFm/vZ7Pfp
 nthQ==
X-Gm-Message-State: AJIora+TOC25/Eh4UiSabCFIviYa9z+R7SFydFx7ecAfIpGAP5vGoGff
 bzGBWcnU74oiGTamic9QRTTlVw==
X-Google-Smtp-Source: AGRyM1vzPvxQHU989bV5UWrBpxqy1l9JNUnlNVceFtTb0zZ05oPPkI4KRtT1XHdbMLO3CtbYGOKJeA==
X-Received: by 2002:a05:6512:3053:b0:479:3219:887a with SMTP id
 b19-20020a056512305300b004793219887amr12139460lfb.578.1655686985189; 
 Sun, 19 Jun 2022 18:03:05 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 18:03:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
Date: Mon, 20 Jun 2022 04:02:59 +0300
Message-Id: <20220620010300.1532713-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
References: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8996 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

While we are at it, also change the driver to use clk_parent_data rather
parent_names to setup a link to the XO clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 25 +++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index b06d9d25a189..4dd055416620 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -691,15 +691,13 @@ static const struct clk_ops hdmi_8996_pll_ops = {
 	.is_enabled = hdmi_8996_pll_is_enabled,
 };
 
-static const char * const hdmi_pll_parents[] = {
-	"xo",
-};
-
 static const struct clk_init_data pll_init = {
 	.name = "hdmipll",
 	.ops = &hdmi_8996_pll_ops,
-	.parent_names = hdmi_pll_parents,
-	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
+	.parent_data = (const struct clk_parent_data[]){
+		{ .fw_name = "xo", .name = "xo_board" },
+	},
+	.num_parents = 1,
 	.flags = CLK_IGNORE_UNUSED,
 };
 
@@ -707,8 +705,7 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8996 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
@@ -735,10 +732,16 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 	}
 	pll->clk_hw.init = &pll_init;
 
-	clk = devm_clk_register(dev, &pll->clk_hw);
-	if (IS_ERR(clk)) {
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret) {
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
2.35.1

