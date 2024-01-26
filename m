Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403083E179
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D200B10FD5C;
	Fri, 26 Jan 2024 18:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0910FD51
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:38 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2cf4696b90fso6664191fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293596; x=1706898396; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
 b=p8O5SeqFv/w+DypJs3HwyQSQaOCovC2Gm2fCoeoOdw6CMZmUWbtjsrC4XE0vfOye+N
 W48Yrm6LDDVAVMJpU0TCefAtayU2Afnhb7o9xMxorrjScnvTK0l+QgnCMK2b6EaMKwUF
 O4fZ+IpzrHW94wcxpdNd/Np1MvDJZN8V0NE0c8j40SaBjTuk8zZNUQBMLREsdjbJnXd7
 jMP8IWql6111dkheCRUW6SmUcIz64M35ym6PoHP11SNcbiuDHR2UeMsDZvsIOiE0N6Gs
 nRLe6uwvus1Ftu1KgKWqN6g4le0dldH6vLLiJRpgrw3iU84n0LvobcE6uIzhx4532H5V
 WCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293596; x=1706898396;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
 b=upJ1tR/HRQOMdfgspJdenxOcO2/70w4EMos4dkKTYrzvVtCIto0ozkwulj8fRr9pZM
 TV2H1tlEr9z7vraBsldYQczDzPx4N9Kgwz908se4C4vG658BJXv2FAygyUPsnKm4Nt5y
 x6Q8PJa0ttrBOWYO5wglioc5Z7fpyX+U4ilV/U/yTeHAfgSsAXVxaDMkqtXipcMy1Z0I
 nWr47tLdXMEJrLa6P7+/3ITLzE0JY6eP4XGMMA91ndFxdA876T0ymTKQ6lMYJe/PbMk3
 XUz/6FvhF7fHYPgbRTil9VuBPQ4frd+kRiemX8DV3TNq5ckpmrhEWMNWHDJvPRZguaoL
 DH9A==
X-Gm-Message-State: AOJu0Yxu08wAJJBWSdP13iolETvAIsI22sSb2/mlSoW6rq7DcU4X80jF
 uPD/dZ4yBmuqxjiPwt+HSEZ9e9v6katGevKLoHKKhFuCqm/igEXyP6EI4LYva9w=
X-Google-Smtp-Source: AGHT+IFF+Hle16o5QzHW7CU+gllINLx0kVwbIrsaVVQfWsqs8kBOAPqi/6szTgjP+pbDLmJp6xCG/w==
X-Received: by 2002:a05:651c:1507:b0:2cf:131e:41ec with SMTP id
 e7-20020a05651c150700b002cf131e41ecmr161481ljf.43.1706293596532; 
 Fri, 26 Jan 2024 10:26:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:33 +0200
Subject: [PATCH RESEND v3 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-14-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lR1JlWhP5Os+8twqg9foVlfni3Z0FMxujy8
 xF+P7iglBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UQAKCRCLPIo+Aiko
 1W6JCACDV6kLdRkLqo+MxDqheXoMpgdAYwwDkXJ5Apb12fvSbVFu8ijEZNfc9vpr5qVfsOh3H5M
 iumjDr4jobpBFDkRPJ8skEe8thrgCwJY/e5cLJKwhjnYjYBVpc+a9KhVDj8VFFpyNFnWrdZsoXP
 hjGIsliWcBBPrgieEhc1dYeSC3Fb3sSI8BmVd329mY0yLgiS35vqM+Y8cRoQoWqy50DyoSicrVf
 znestzgb0euX7dbZQnzbsNg0OTW1lP0tf0veeTR43v10e72a1SUzpNQgGtmKlbojDpeX9GF6hMO
 fvunosd/ceC0W74n+14fHsNu02chCRrXKkmCDp8bUY5n7abj
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

