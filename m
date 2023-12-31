Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BC820953
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 01:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919E10E0FA;
	Sun, 31 Dec 2023 00:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5B510E0E2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 00:44:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e7aed08f4so4590645e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 16:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703983447; x=1704588247; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bXNUAPUyws9nRp+7b+SgQf1i68d95gYxHEa6JErERqE=;
 b=kX8hpu92nuokQmNpmRb67LY+P7LjAIYVS6Dsw7Oqu05dJ/1o09C5Fz1QxbLfqStugy
 BI3Hu30XiY33MwVpeEh7Grmdbre4AAusDvrEacO93NWN91AsMsKLYDVKDXR4kkN42h2z
 Bzn2PU5doe9431djbnYionLKT3TtvqvZ+ci01+6rJftNFChlOg4DaY3OaDOlYYxRiruw
 Re/C7J26gO6TsXcdy+8aQy0UeuOTJtPJ6ZjZLL6ZHUxfpO3zHMctckI9rALuDqZ2sQVv
 2iTejjRF4IQkeHnkCb6jFgRL1Fde4hEnVhGSssB2HG+EKFAEsJr248Ao9BadNM7AJ/KQ
 7Zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703983447; x=1704588247;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXNUAPUyws9nRp+7b+SgQf1i68d95gYxHEa6JErERqE=;
 b=eM7bZiWANVh1L1IVHHGeG2qS3dDo4rLn44pN8sxMoxkd0UoPuA/pmXSaCKkwqKMRIp
 5RqDXyq0aIj7+9zmkZeOTx1PH6hAMYOV37PMM/OsO9yLj4jARHhhzmOSNsUzl3OZwyt8
 5aR5vgPLcKeENuhKqgBuFI74ETx/P1PjSKHdqtvYaF8DfrbkGw/VJArLIxrW9dihnWn/
 4FZixWOjqALrb9FX7mZsbLs5Wu5Sl6coHNpF3HHhJzZ5aEIAUHzLcxNpbDYWGSFrA03q
 +NrX2qD5ftQUL9q4yNbX6yV44oeTldDuPZxn0XF1YgQ1fAMiIXAYkRF+2GUd8fVeVufP
 j5tg==
X-Gm-Message-State: AOJu0YyinNlIPP+qQte3n2lyrYT2kHxVnW9PC9dV5s6tMebdnslZfu6r
 oJCyY2ulE+HE8O4U5uCJHDmvQku4585NAg==
X-Google-Smtp-Source: AGHT+IF3iJzT8BeiySgqwzDdIVv+O23SqQQaXFoEHjt878qwWaWYVWSdFrqdk9cXJN7a0NbACW7w7A==
X-Received: by 2002:a05:6512:3d1e:b0:50e:778e:d525 with SMTP id
 d30-20020a0565123d1e00b0050e778ed525mr7993261lfv.29.1703983447080; 
 Sat, 30 Dec 2023 16:44:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 16:44:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:44:01 +0200
Subject: [PATCH v2 14/15] drm/msm/dp: move next_bridge handling to dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-14-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Av5WVteP7ncWawE8RZ3W1B+eFtmDOi/cz6ZeobkOPuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlLmaGU3QPxUUVm4mCRDYiPBHshmXOC694rh
 ycUy/9jr4CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SwAKCRCLPIo+Aiko
 1Xr4B/9Al/MB7TRr66l3Vz3E2PofDpDX02FtxReaTE7CcUulRVxXPsANXlGUKfOuCHFR6m4Dqzg
 XJzDrdOpIcdP/TnrpWJ/XEywyBlzC+LzamMz9g/zd6JQi988nvY8hNUrE3QidjGdeYWDHxsC25i
 1eVk1UWZTx6whasg1t8A1natoRZpl0Gvb79CXxXK5OwzXrSZ09VL0O5pzVzbCpGZcLvbuQkelDo
 ysPd5F1Ocmy7GrdvWS+4o3DzYHgbmYkGbmRnFQg/Y5ooD1s0yCvFt6Q/2VdXWXw47FuJLUXPTUu
 nmUIimkS/WWv+h8+oiBvB1VrHbKRrT8kxdTP/TNF79AH0/4C
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove two levels of indirection and fetch next bridge directly in
dp_display_probe_tail().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 -------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 14 -------------
 3 files changed, 13 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f19cb8c7e8cb..03e9c5c3bd46 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1195,16 +1195,24 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp);
-
 static int dp_display_probe_tail(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dp_display_get_next_bridge(dp);
-	if (ret)
-		return ret;
+	/*
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
+	 *
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
+	 */
+	dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->dev.of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		if (dp->is_edp || ret != -ENODEV)
+			return ret;
+	}
 
 	ret = component_add(dev, &dp_display_comp_ops);
 	if (ret)
@@ -1397,30 +1405,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
 	}
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp)
-{
-	int rc;
-	struct dp_display_private *dp_priv;
-
-	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-
-	/*
-	 * External bridges are mandatory for eDP interfaces: one has to
-	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
-	 *
-	 * For DisplayPort interfaces external bridges are optional, so
-	 * silently ignore an error if one is not present (-ENODEV).
-	 */
-	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
-	if (!dp->is_edp && rc == -ENODEV)
-		return 0;
-
-	if (!rc)
-		dp->next_bridge = dp_priv->parser->next_bridge;
-
-	return rc;
-}
-
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index aa135d5cedbd..f95ab3c5c72c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,20 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
-{
-	struct platform_device *pdev = parser->pdev;
-	struct drm_bridge *bridge;
-
-	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
-	if (IS_ERR(bridge))
-		return PTR_ERR(bridge);
-
-	parser->next_bridge = bridge;
-
-	return 0;
-}
-
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index bc56e0e8c446..2b39b1c394ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -22,7 +22,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	struct drm_bridge *next_bridge;
 };
 
 /**
@@ -38,17 +37,4 @@ struct dp_parser {
  */
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
-/**
- * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
- *
- * @dev: device to tie bridge lifetime to
- * @parser: dp_parser data from client
- *
- * This function is used to find any additional bridge attached to
- * the DP controller. The eDP interface requires a panel bridge.
- *
- * Return: 0 if able to get the bridge, otherwise negative errno for failure.
- */
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
-
 #endif

-- 
2.39.2

