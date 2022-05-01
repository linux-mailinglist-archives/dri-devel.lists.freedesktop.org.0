Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0851679A
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 21:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B690010E2C6;
	Sun,  1 May 2022 19:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E9910E2C6
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 19:56:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id m23so16379464ljc.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DlnFpstvVMz8ogimO7x7gnGg9U0guhBg0Tjc/KXhlQ=;
 b=b7jWpei29YU5OfV5sSEGuU3Lr3PRYKjuI+fR0O/yy8nmUmSq2gX+O3I6GcLmfKpjiM
 Ou9HAly9xpOn3meBlDcW9Jp56KR01IEPWRX+mHDVUW55eS0v+znn+ixCjyow/aifjPO1
 8va8Mxg7HXRvjQAjmkrCbVNfGriyhbNrVPYmiKUYccQCrO+hHsWOFYAqXTfCIfaYE10T
 zZEbyLyYfkIYNkoajMJWTBt/Gx9MP82Rp6mCnjOcyX8mnHm9X7VFBGo+KJt7JRixj1kT
 6nfNfL28U+N0pgTbJBDQ6VFmjfe1ooUqd794GES90X5she3pVOQE7BtniwVldTOYu8/T
 FCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DlnFpstvVMz8ogimO7x7gnGg9U0guhBg0Tjc/KXhlQ=;
 b=xYTxCIIQRP2OC2KUFtzddwgUD8rU46dkhPh5SA+pybdGW48JsqQRaC5MFMcLzBElSE
 Bo+igeH5XRyPJEHH/qLzr67cxKfcMeVrWewjx92lHkA5QxrStmg/2/3wR185nWkBHbaM
 u9aNIJmu6n8wJlS3ArCEYzPAWZcVU00cMiBmEjXY+To98QP9XClY2S6C966ZxPgrqlev
 Q25W5u6QO4w1a5eY2JdCdEDK4pjTU3QlplJpKSBAWBZuj/OdID9Gzf29c00hMY1CsVgI
 MKZNbOCNrtd1Pf76Xc20neRC7NqaDOfWIAIeclkvNHv2YieBmppltnMptpsHtQU0nITn
 QcnQ==
X-Gm-Message-State: AOAM5304qkDcgCIIleta2hzAvfgFSiH5QODX64eBBFmM1V6GaCqH95F7
 hVX2YoaUCxUUoWfU0ykGd10WqA==
X-Google-Smtp-Source: ABdhPJxTR22A6LrOaxFBr0FK9ToieYi7wenTTj8MjU1NRUjDGzWYFvz2eYLWRTSLSXUg6hgIi9XVgA==
X-Received: by 2002:a05:651c:890:b0:248:5819:b949 with SMTP id
 d16-20020a05651c089000b002485819b949mr6188460ljq.476.1651434981563; 
 Sun, 01 May 2022 12:56:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 p3-20020a19f003000000b0047255d211b7sm517580lfc.230.2022.05.01.12.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:56:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for DSI
 pixel clock
Date: Sun,  1 May 2022 22:56:20 +0300
Message-Id: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove dividers that are not recommended for DSI DPHY mode when setting
up the clock tree for the DSI pixel clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6e506feb111f..66ed1919a1db 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -586,7 +586,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32], parent3[32], parent4[32];
+	char parent2[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
@@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
 		snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 		snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
-		snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
-		snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
 
 		hw = devm_clk_hw_register_mux(dev, clk_name,
 					((const char *[]){
-					parent, parent2, parent3, parent4
-					}), 4, 0, pll_7nm->phy->base +
+					parent, parent2,
+					}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-					0, 2, 0, NULL);
+					0, 1, 0, NULL);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
-- 
2.35.1

