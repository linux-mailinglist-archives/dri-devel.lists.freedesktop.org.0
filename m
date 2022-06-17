Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D60954F586
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D5E11A9D0;
	Fri, 17 Jun 2022 10:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606911A97C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:36:20 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a29so6318807lfk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ehJ1FDrt934m71egzidi3dn4Z02wK65douizV/opsWo=;
 b=z79ORX0B2DG0WrKHIrtYGnr8wOwlKxv4xsaBo4JFTQc4qQmfeSf2gVd1WkwwxDSOQa
 qQvEuLg36Hlv6KRFC7PyW2qJzglgB5PqFHd9VxY+IrzwcqOVzt/fBkVaum8YNytMOJ75
 egZEaoWAnBwzyQtbegQ0u+OuekCffMbqGTCTLb7BDFmbtb4NJehNKGhMw4VzV4SMOZPi
 IxMkR7A7GcVQpx5zpRU+SyKCfCjki2cbs2gnIWJz+vg3+vyuKLepD38aBh/N18CEZVAK
 u+1DXxI42JAy4mu4jiSHhtv+IQvJ5juK1+r/dv+xHFe7nUD7wk/zy07+MOBJ6ly1kE+G
 /ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ehJ1FDrt934m71egzidi3dn4Z02wK65douizV/opsWo=;
 b=tFrP92bORh8Y16w97WWvgJZHjSiQzIjSOcQPDHmZD1GXNPHenfOVzGthIc8buZaDCv
 I/Xflo7xJ+hg64JyF5tfK+ZhuK5aLxxRYDnX9rs8XE3lM5VXRBfSjVbl7L7xOuC7Fu6q
 k1O6V6mtrc85m0YZ9Xz/UA3YAgw8ifbMEYp5zJAEOLRbgSY40fFlasa05trlHyf7NFOe
 0/ta4INsJhZ5oimnHBgNPSYp9F9dJVFIdcopO1ExsY6bjtohLfNx7+xZMo58PDjBH0Je
 F3su/+yTiaYRUXAAvXR5PyDTMo4p9Cm5pHtc9vZYIUkXkims0uePGij2BRp0aG8CjHu8
 YSLQ==
X-Gm-Message-State: AJIora/mwaDJz2YKaczLTHXODRNk+mpOeyxH9xs+EeHmAXvGchMOFg2U
 S5LE5w87lIZqtUp5LZu0klof4g==
X-Google-Smtp-Source: AGRyM1tolUPsyooXC8CKG0Qb9ywl2kd818tLY9kYd7mx7VhHgEdlvr9dZjbttKc3d4gGijpPelmF5Q==
X-Received: by 2002:a05:6512:281:b0:478:f324:6c0c with SMTP id
 j1-20020a056512028100b00478f3246c0cmr5236328lfp.287.1655462178370; 
 Fri, 17 Jun 2022 03:36:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00478ff020832sm591803lfs.106.2022.06.17.03.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 03:36:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/3] drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
Date: Fri, 17 Jun 2022 13:36:07 +0300
Message-Id: <20220617103608.605898-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MSM8996 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8996 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index b06d9d25a189..cfb83e9dd810 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -707,8 +707,7 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8996 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
@@ -735,10 +734,16 @@ int msm_hdmi_pll_8996_init(struct platform_device *pdev)
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

