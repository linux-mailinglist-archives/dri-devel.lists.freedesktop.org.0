Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B582565C06
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DF910FFB1;
	Mon,  4 Jul 2022 16:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401D10E1C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 16:11:53 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id i17so6836124ljj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 09:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FB+K+cb4f9fS6PvlJKAr+KfimzTAeQrUyeuMC2GkgBE=;
 b=qnHQkupyk1x/oq6nK9qO2WrA02Ohq8y3d9jjyNLlypjohyGZMyL2XN5Nz3X1UvRaZc
 bii0DjgQ10zeZWB9eEDKICbFn5YjggZ6LRfL3eOnDvd7TUXS7kYQhUGhzDL5LcjO4r9o
 fa4MHfr3x6tDVmkDVu5ER+omVEscP6u//DIKD/ZftSG8JXtxdDlBM+TW4yNw5RWm/rOP
 usSDTCN+a8gQGZH4ndzmT75cfnX14VbWq5OgJ2GyXJZl9YQUyq+d2XqTDczLGb40dKe4
 zX3KrjD9UBmole/rb51Hjr5TlhX990vmekb2IoEJCKD9cefKmwTsmhEslf+/uEbTY1Yi
 Y1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FB+K+cb4f9fS6PvlJKAr+KfimzTAeQrUyeuMC2GkgBE=;
 b=NozQQ8YTjXXcXaxOeV6oP1EE6TS5eXbV3U8V2BoasOe9q88X/r1LWf8OVy7WBZG9dZ
 oml91Y3u1jVWdjBb6JS5H6QeiwI3W0kAAJFuzfsrzJNWZwqgMsT69XMl8SeK36V7YjtR
 ppqwIsUQdEy/lP5N+np/s3D+/fjtrNeW2nTOrKquI7n1dLLa1dFjoocUk0pW3spem4kt
 mmvuhdc+x8Wc4H7hSxFBPSTNNxlo9b56v+QBqwxBGfayLyo0JuBteMCGb4WnoJS5jO+u
 vTTqDnpJcMShaFUbL9bAAlmgmwYdPouTdcj2D54qLthOcUnIqw7Cd6hB7njHFZjchBuL
 U/7g==
X-Gm-Message-State: AJIora+9idI1c42PBPrTChGGNhAcimzyVgj868vkBuZ+ZRuJwqKdo3u2
 aCLDhcM+QUTaIP4ZRcamyoP9Hg==
X-Google-Smtp-Source: AGRyM1v+ysGvZlgZlt6B/q+BV0o2A6rgkhQhJIT//BHmupu6q4pUqrhAZCjKNOsCKPz8O00P8lZhbw==
X-Received: by 2002:a2e:9808:0:b0:25a:a30c:e5cb with SMTP id
 a8-20020a2e9808000000b0025aa30ce5cbmr17458567ljj.312.1656951111916; 
 Mon, 04 Jul 2022 09:11:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:11:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
Date: Mon,  4 Jul 2022 19:11:47 +0300
Message-Id: <20220704161148.814510-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno@lists.freedesktop.org
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

