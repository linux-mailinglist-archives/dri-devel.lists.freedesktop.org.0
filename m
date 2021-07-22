Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8D3D1BE5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 04:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA416EE9C;
	Thu, 22 Jul 2021 02:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884DB6EE97
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 02:44:13 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 b24-20020a9d60d80000b02904d14e47202cso4015767otk.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 19:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKV8hlv55ixpHr/xWlsCOYWKdqHbAXYcZUW9Pc8iaEA=;
 b=IzorDbfi4J0yK4IdHULCR9qAHRjagqRlo6FFdpjHS7e93tP4y2cMxhtOq10k2Q6UeG
 iKYKYCdOeywdHLcHZxMvShzyMfyfyQqGP3Sbz+p9+G9DdXGxhbaU/HrLQTx96yIkSv3J
 FCyf3M+5Pz9QjvPfcF1ty/BbOKehfRG5cqA4/8KISGEr1xVXTNUIt+1lAskvVEvH9rx/
 A83k/59flfuGg7xGbZtupKhEiYBu298i9zP6i/xhN1JDUpqh7F7tQ2kPuQlc9I6uaV9I
 i4lfLaUL5LRwClSPU52CW4ZfwQ5bVw9IMwbzfa7UG9rMyHbSw81rWdYbByjVixj7oq4D
 s4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKV8hlv55ixpHr/xWlsCOYWKdqHbAXYcZUW9Pc8iaEA=;
 b=TShStg2KxH9RcQsRguy2nuVpThHTte4ifnqfcQabErFJn307j0b5VJO2AiTipU2fn0
 FKLMAaJP3IFwsoEIANbVUt0MVL66RG/+SeY5hJD8qhCeOMwGMRwvZJxm3bXg3kHcKvuJ
 LvgkkeY2603eV8l2U6O28i0ts3mkPGNMaB/2T2FryTXzSfHUkS4pfXGhX9sOL/rzqwC0
 xyNJAacGjdaQhxWF7LDZMet9BThkWmp3wmkDIxiuG0k05ozS5p/QqOXfC7sRFsQ73i0U
 u0YNkCSgMVfKIHN5QS0B4qKwkw4bGeCnCOVah2X+nmEWMGRsrfS9kvNUll8ZgOtg1ATL
 tg+Q==
X-Gm-Message-State: AOAM531DUA4BhJLUSM8ynRc73NvOo+6LBJXNnsp/6WWwDpHxkIbzwiIa
 uhpQ9V6jpGaqCVzrGFfeddx3zA==
X-Google-Smtp-Source: ABdhPJzh1eqPt0fNok4t32PlvpdYBH5n9ebj7NHDBm2wEIBcrsZWeWlQRl5XwMN6ofEKXljlzL1Afw==
X-Received: by 2002:a05:6830:2786:: with SMTP id
 x6mr25286903otu.359.1626921852888; 
 Wed, 21 Jul 2021 19:44:12 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:44:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/5] drm/msm/dp: Use devres for ioremap()
Date: Wed, 21 Jul 2021 19:42:24 -0700
Message-Id: <20210722024227.3313096-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The non-devres version of ioremap is used, which requires manual
cleanup. But the code paths leading here is mixed with other devres
users, so rely on this for ioremap as well to simplify the code.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
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

