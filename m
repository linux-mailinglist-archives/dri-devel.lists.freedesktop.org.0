Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A283D03F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 00:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029D810E902;
	Thu, 25 Jan 2024 23:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07210E92E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 23:03:39 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso2602741fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706223757; x=1706828557; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=ffF0ZJIFyc0mUtxvab57GDgTllMH8PidFFJIyjKMMKz0AcucFh98NxI5DLBHHCdYRT
 IObumb3L4pX6ccaUqZviX9k7RBPqU4dZQwsqTh4JS60w8UoxupgkefsZobmKiEMAS21X
 7LfnI4oR4Ttz+WRLWnlQUDSvWUMrqzWK4Qynwn8j3gCvZcgVU6XZJ4P9bRW/QR9JR2Sy
 +JkiOwb+SycUwP29Yu2jcjbuquRiAm+8CXDpiz3IquRQxWkpAGcnfx8QNPHmYn/6TCVc
 am2OLDh6xczka+WVkPNBpKnxAXiQMCn4XwlRRXfqOLvbxdwN4XI3Zq+FK76l7+zTwbtt
 kRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706223757; x=1706828557;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
 b=vTygaZbb2v2g9MsSP15WwOrwPMTepLT+P9T1bBtEa03kqf+zX6458tT8JN+Iq2bJxV
 LOnQkHpym+ZbynB6QgNK2y4DCG47HBnFCg6zpaEOF8htPRCHlXQj4uxFCqF3iubw2pu/
 PEygSoRhg1WJPGRId7ybET7ZK7ODtVq0PB5OtFobAw8ABz2CT1kxiTwQvQtSwxBJ/ksA
 Y8vthJoR6WP/sBpCQJLPzlePagfLBz4kD331eo3iOXv/NtlhNSd8TaAD9cIGHy6N7FcW
 5EVDUTXO8M2uTIwfbTB9UZoeNcXApw022ldUne+P6jlUPS18IuMZsaow+zunb0QLKLSp
 5/Kw==
X-Gm-Message-State: AOJu0Ywj4hiDErMmyy9MSQ5FvI1saO58loxYxJkghz9FbOMG0jetK+sq
 gRozQ/ewUQmcGCQeVjF+lXGuGBYiYvKFcrWSNdSjP0pff8Qs3bH1ZH4z/SfEwrY=
X-Google-Smtp-Source: AGHT+IHB48WYKzpRE4GTJJw+YbQXU/Co7BwmCHlTYFyQp4kpKN+GU3IuCHZ6JckmSDb0mwm9dGjpHQ==
X-Received: by 2002:a05:651c:1cd:b0:2cf:4761:7332 with SMTP id
 d13-20020a05651c01cd00b002cf47617332mr16004ljn.15.1706223757678; 
 Thu, 25 Jan 2024 15:02:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 15:02:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:32 +0200
Subject: [PATCH v3 03/15] drm/msm/dp: parse DT from dp_parser_get
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-3-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiH+3PoMEjAYxoRs1/Tvf4I20khu8T8B2f2R
 fTg+MllguWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohwAKCRCLPIo+Aiko
 1ZAPB/9nH3gUFknoSXApt9roO7iae+oXdO7krlDNRwN4GOaCd+IMU/s2xj8ZtckI6qglOXp7Foe
 THzlqGTbQ+m/7xi2hVDWCdvtvNzdMWHR6uPxyu+dzHBaiXTL1C6oziycHxpIa/lvEIhqjW7f0lf
 ZOLMPb6xLiSAJjdBMwkSgD2agsgPxdIzUNE7glVrpaVMnW8eZbxt9KTTMLcEjtC5AmrjHA5Ie8E
 ciBFgzxAAyxXH4U+xqauRDf9Cfsn7LVAkvdTbz2nUT3oKs/T7uJZUcwWK+PTXr+fEi1DtUZPwqW
 WUyDQhHLN2CB4s4J8Meu3xln+UZuGgdC7WvV3ga8dBFbnBoZ
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

