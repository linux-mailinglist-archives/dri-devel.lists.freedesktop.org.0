Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD183D04E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5694410EEC0;
	Thu, 25 Jan 2024 23:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEFA10E949
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2cddb2c2b54so75339501fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223771; x=1706828571; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
 b=Y4zTv1dv5Pu9YBrswP0CLOtA778EwkISXIjhw2QjYALuWcRCbpoSivXOOBEk4Ul7Q9
 R4tWfYG2fe4EUX/NYSnEw5nkOsG/emZGPYaSD7BqdwIpUcjxHfye9NmSLRLx+6xK3rAr
 x4IsvIgTIz7nFr5FIKMBhFfq7DYf2puGkdLevnk3bgeAarJkbRBSRSJOKYE/aaai1d6J
 OdviNP2FyfyuBkXIeAcnMGMto72/2h6GRwozGqrNcWFCezRFXxM0eY18EXoNVHUAhdBR
 co2Rclw0Wan7RZ3GO6M4CWrWOFAqeUNx+WfQ+MsuYd3lm310Hi98jSkro8WJvaxrp+x1
 TbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223771; x=1706828571;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
 b=iVuTs/jRAeuYHVLuM2axTDpBgK8nSVc8Y8iaaZUK98wdL06ifdU+AAZR635Dnuyc9A
 asIFYzz/lIJ6eaKCUMHqzJ9So73C/+zexw1jpfh3HrSVYXkUoEcjiDxshvIQajLSDbXP
 ooOjtCD3fHFDOdGBn2Tn6w+9I63zRL23LjsAfQWANauM7NYWKF/4xgp53ltQ3vIHZWLj
 seOedTt/f6tClucYBJWbbUL24mwtLAWJrDLzfn8szIEHoHlGbIt9V2Pg2gUMPRbN3XBj
 NpSzrFPjR/W/Ad+4az8V3IUwil8EVprIfZ5ASOc/Fe+FFm320Eb1EF28ubpHaK234mMp
 a9lw==
X-Gm-Message-State: AOJu0YySrUVzNN5jWST2RBqtzXQ2tqzo7Z4dXMS9QAlwx4EXG09lwidJ
 Qj1sV/HTOkzhGYZUhT3RZMb7ISyd8chvDuVEckNI/JPc/OJIk9vLEbDjSm4gU1Q=
X-Google-Smtp-Source: AGHT+IGmKDAD6qyrs3VsY+PMKdgn762Ve45U47peU+ILGBqeOgk3OAiQe9OTP8o2IBeVJq1T7kLfow==
X-Received: by 2002:a2e:720a:0:b0:2cf:e95:57fd with SMTP id
 n10-20020a2e720a000000b002cf0e9557fdmr340214ljc.28.1706223771105; 
 Thu, 25 Jan 2024 15:02:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:43 +0200
Subject: [PATCH v3 14/15] drm/msm/dp: move next_bridge handling to dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-14-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+QSUGzw12ZOJpwShyYqXjiKmNZgVat/nLLyxEBSUwK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiIZbEIG6ePUeSHmo6HDNTzKgQyiEKUf3Es1
 wJXEGJQewyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1bzQCACxglS1CC9uFRPcEEUr7UJHoj3htMkE/XUO1B6U0tpdECepiP7U/8VkKgoQ/uVjURl9sjQ
 l/yTW4fygsWgHES/UmpQ8KuHaHtkXVetxr4kDZYaIn8NTFyvFNF5p9FyQO/BNPeGxjY8vx/zEcF
 Le7MgKt+FWiMzVfj62+8xK1Kh1WNMTO/QhwIa8MWqRXdT4/JzRwibEa5IhQSs9b7eDtE5Sf6dYa
 WiEn9Cv9e6admnfSZaVEg5emvaHL02F9Z/UfHGas8yLBbFQz7MvS9HoNMuwxaUpRob8DbR57fvL
 YtLERakxJf+jY0z2UWWjhCYWMvhZRWqkYsaCxnB1O+RIe2xz
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
 drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ------------
 3 files changed, 14 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f19cb8c7e8cb..de1306a88748 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1195,16 +1195,25 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
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
+		dp->next_bridge = NULL;
+		if (dp->is_edp || ret != -ENODEV)
+			return ret;
+	}
 
 	ret = component_add(dev, &dp_display_comp_ops);
 	if (ret)
@@ -1397,30 +1406,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
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
index 21a66932e35e..38fd335d5950 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -21,7 +21,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	struct drm_bridge *next_bridge;
 };
 
 /**
@@ -37,17 +36,4 @@ struct dp_parser {
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

