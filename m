Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C509141F357
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1E46EE7A;
	Fri,  1 Oct 2021 17:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AA76EE79
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:42:17 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so12493631otb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59j+ppAnA3GClcXblCq4bc27uTFd0Elka2ulfgZ16K8=;
 b=u5XSprnyphaZ98shNU0AoIBqdCI1ygik1nxlbMerLiJIsEVY11mKu96UI+E1IOBzR7
 j+UJ8Z9zJ3xW4GJ65NOAKnPIgoqTfkBC5hjEshfh7HRybbwkasu+Cy0KmQ/TfUtqiz5w
 U6D+z/5AOFRPkg5zZvlFV9rJ8JCNio+Lv6odBMisd3hbzMf5icTI4dc+OXTRTl50LMm4
 C+7v2NBNanKQS4tqi+vZbZnHs3tNQGYmmKjbcrcIecn/aNTB07lvs80vBtBNBPBQ/UlF
 yjKJN7/6ga40co2OOOpIbJxrkO2dnhdvcy6aCAh+fv3T4z0/38RtmMneHMjnxr7LV16u
 Z3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59j+ppAnA3GClcXblCq4bc27uTFd0Elka2ulfgZ16K8=;
 b=HOr9mkzItS1Poy9mSqFY999xSfjJGuO9Gf3WAyhL15VyQR4+quHr6tS43v3fA30jOI
 ZSKXSbrf065FdOgBXM9ccLPmNuFfuJus+/HFU8SeQ291AEjSxlUxQnhd3gtaeVtCriLF
 invwNaaHATxc7/lSyNS6Iv5YMCLEGQXFxPbEZQilX5NBEJ84DrJXPhb9gcXVuleUZc09
 XeUDI3U/zvpZ49MlJPVYfRpskAIxsrYV4YpOsH0DUVjLHhGCplMBJf97hNlNz4M97X4D
 OS0VyH+vP20LuJr4Qs16pU8r0im/F9Ho25Z+/LBXyox/Ml6WZWhoXr5KH7YDaUaUGBjd
 N8Fg==
X-Gm-Message-State: AOAM533n+jaaV84zrHfpyVc80hDjd4FoKAaf62EcDVs+CavvVP08B8hz
 y/gbAfJL5tEc8CtvjlgfjFCiLQ==
X-Google-Smtp-Source: ABdhPJyuD9dTkDpl1caAxTajSERBBi4xtihxbClz3LCfV4+vrp8RPWUmh7M1riNl7I06YKIlHrESTA==
X-Received: by 2002:a9d:411e:: with SMTP id o30mr11481720ote.97.1633110136352; 
 Fri, 01 Oct 2021 10:42:16 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u15sm1369264oon.35.2021.10.01.10.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:42:16 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] drm/msm/dp: Use devres for ioremap()
Date: Fri,  1 Oct 2021 10:43:57 -0700
Message-Id: <20211001174400.981707-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001174400.981707-1-bjorn.andersson@linaro.org>
References: <20211001174400.981707-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The non-devres version of ioremap is used, which requires manual
cleanup. But the code paths leading here is mixed with other devres
users, so rely on this for ioremap as well to simplify the code.

Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 0519dd3ac3c3..c064ced78278 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	}
 
 	io_data->len = (u32)resource_size(res);
-	io_data->base = ioremap(res->start, io_data->len);
+	io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
 	if (!io_data->base) {
 		DRM_ERROR("%pS->%s: ioremap failed\n",
 			__builtin_return_address(0), __func__);
@@ -42,22 +42,6 @@ static int msm_dss_ioremap(struct platform_device *pdev,
 	return 0;
 }
 
-static void msm_dss_iounmap(struct dss_io_data *io_data)
-{
-	if (io_data->base) {
-		iounmap(io_data->base);
-		io_data->base = NULL;
-	}
-	io_data->len = 0;
-}
-
-static void dp_parser_unmap_io_resources(struct dp_parser *parser)
-{
-	struct dp_io *io = &parser->io;
-
-	msm_dss_iounmap(&io->dp_controller);
-}
-
 static int dp_parser_ctrl_res(struct dp_parser *parser)
 {
 	int rc = 0;
@@ -67,19 +51,14 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	rc = msm_dss_ioremap(pdev, &io->dp_controller);
 	if (rc) {
 		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
-		goto err;
+		return rc;
 	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
-	if (IS_ERR(io->phy)) {
-		rc = PTR_ERR(io->phy);
-		goto err;
-	}
+	if (IS_ERR(io->phy))
+		return PTR_ERR(io->phy);
 
 	return 0;
-err:
-	dp_parser_unmap_io_resources(parser);
-	return rc;
 }
 
 static int dp_parser_misc(struct dp_parser *parser)
-- 
2.29.2

