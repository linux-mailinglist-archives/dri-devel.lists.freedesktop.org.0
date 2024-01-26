Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC783E15A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF78310FD3F;
	Fri, 26 Jan 2024 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78810FD36
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 18:27:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5100c4aa08cso709088e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706293588; x=1706898388; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=kKHf5zNcAxe2bvac0rKccz7yRahWWideUQ5UYmK+TOhMIK+B1sFBnI+eSH7bLpcwQY
 UevHgh46XjRbjRg01fazL8Gf+T/43f8mO03R4z/Ojlj5t+OYYIFrKq3CIx2c3q79gREG
 7BSWfyEOnCroMg4xWJpJuRTWBXuKWznQ7vjLhhBTBjFWkRSxeXjXMnKWrvo+lvfowg6T
 s2d2dUsDqKifY53QacuWoFbWg/D+BJ+fujE3sl90oOncCTyQBLWnZGeJs92uqChunv2h
 YMC/YKaF+z9CFJ+9vwNtenZ13259cZPvC1ucg4ztU04fCQ03DkW8qrIpnEZT7EeI4Pd+
 /v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706293588; x=1706898388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=oO2IDheY6fNQp+O/JqIymReqe+caUTEwW5cr2NIcYxYN4ztY0IMX9seHfeQs0gYbBe
 hwo3ZWiqaSOvxdBfxobi14dcY/ShKXSORhNQJY6CjbNmvIBiRFXbNrh0KIz0K1tVG6YQ
 8r+EXLdJvpBsgSzBMERqGI2qcOlfKoAXU8JyHu04EVp2ZsJwnWsbxKMjfTnuUHhzNgws
 bOygOOqow2LTu+L5dZm7abGGZ+t1c0TZc63mSmfibYlDIXuv0odilI7v2hE/2BbYLIxp
 nkcdH16l6NlToayqSTN+DTieTSXea3O4EtmtWE78ufTps2+3BTdZaq0K2ICUhm0pZ4Lg
 JQOA==
X-Gm-Message-State: AOJu0YyUJ5+uwJfJnrTJy3znNWA/XyS7BW7IMtq9LWtpdWLijOLs9Wae
 rSnfHCFtrjcCsRZjq5B2yv7RLX3svMgpZaEAw5UMLbhGidmH1r2is5/tShVU8D7aWhVMK2pCdBO
 h
X-Google-Smtp-Source: AGHT+IH6v7IJZWpMt5uHQPOcrEe2FO/dTFAzytBW5kDe0i1xJOiATlSJIdisAZmyxcLrz24mpwvMxg==
X-Received: by 2002:a2e:b81a:0:b0:2cc:89f4:15a3 with SMTP id
 u26-20020a2eb81a000000b002cc89f415a3mr150252ljo.49.1706293588648; 
 Fri, 26 Jan 2024 10:26:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 10:26:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:22 +0200
Subject: [PATCH RESEND v3 03/15] drm/msm/dp: parse DT from dp_parser_get
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPIQiz99mijPv7APhc0aOtQpr7FSxP7uUf6
 fQtUhmCq5eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1UoxB/0Xr3DzXz0QRZ6P4cU4vQAkaAzak1HsYyIMPeIWORcxjTRJZdejUp4k5LjJlXskB/FTwrN
 3RELHh+696DgAwUIDJyYZp+iFlySlD3Dxm0oKX9jT1uLu2jve8drSLZTc6FPMIELkZqBEDwY8ZP
 fIjvHKGl71esRnwe/dL+8e9Vpj+8A8FyxNtVKo1Mz8S3n5kRG+V18ihrwQvDIbxqTx6ptAblDRx
 dxbifiE4iii1N3vJTq6KOGSnk2lagyfkNQUL6ieh6BqO6UZKxX1bIlnQjfzR9xDd1ilJTQYoBAg
 gVK/BMQ1Mtp6U2FlZa0uIQdAsHzATmc6UZoYgTi+KfjM5ywn
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

It makes little sense to split the submodule get and actual DT parsing.
Call dp_parser_parse() directly from dp_parser_get(), so that the parser
data is fully initialised once it is returned to the caller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..67b48f0a6c83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto err;
-	}
-
 	rc = dp_power_client_init(dp->power);
 	if (rc) {
 		DRM_ERROR("Power client create failed\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b..2d9d126c119b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
 struct dp_parser *dp_parser_get(struct platform_device *pdev)
 {
 	struct dp_parser *parser;
+	int ret;
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return ERR_PTR(-ENOMEM);
 
-	parser->parse = dp_parser_parse;
 	parser->pdev = pdev;
 
+	ret = dp_parser_parse(parser);
+	if (ret) {
+		dev_err(&pdev->dev, "device tree parsing failed\n");
+		return ERR_PTR(ret);
+	}
+
 	return parser;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 90a2cdbbe344..4ccc432b4142 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -67,7 +67,6 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
@@ -76,8 +75,6 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
-
-	int (*parse)(struct dp_parser *parser);
 };
 
 /**

-- 
2.39.2

