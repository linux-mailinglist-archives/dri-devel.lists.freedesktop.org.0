Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A110D8C1977
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 00:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF51710F7E6;
	Thu,  9 May 2024 22:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vh5MXAW1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ADD10ECEF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 22:37:40 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so1569657e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715294259; x=1715899059; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XPxTEl/rjN+bSOjCHxAgRV15YEB3RII6eshoI73E95Q=;
 b=vh5MXAW1dMuHdlaHDvAGGYHq/a0ByNjMUBVSDlGDDB7ZUms8rwSN0RssSZXeVZr4Xi
 8ZpDBVaDUSdngUQoqrIt3mVo79i7yOIZDEkSubvOKBe/XtL9TXbFzSP+DsX+7Nuc1e5Z
 i5Fn1UzcX8BUtCxT/hhy9cVkBd+bvhR3MvRMCF4a/+Sa/xs5LRs+4kc0i4HyQf1GBMiK
 pJg7VdOwqMnh7ydBvf6YAUX6Ojz7A4PjSvfNYAH7C1ZUf1SfDm5Q5zyRmduUDBn+7Cry
 3R3cCRaP2esr6LISL5GZbjcbWWK4hGOEPH3YhN+7R6GJzwJhdNL2P0yJ1qsYGJ7wRcWD
 m39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715294259; x=1715899059;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XPxTEl/rjN+bSOjCHxAgRV15YEB3RII6eshoI73E95Q=;
 b=oHbMDQoiKMI4chnRf+awwCSJCxSdaI2IPFJCN/s7I0I6HpX9lddt7UxGPJtVkDKkuk
 Yw+VEDG0TbnApiGGUuAAo2ca4b53/Wse191Nx10EXJKrk6j41DwHHkznvfdgZm0muxpV
 o9KUS8++GAkuG5fOiYscIe+f5srbyCMDm94im9BD3I4/lKmMmFanWcZLW12qYsqk1qK6
 HrdVz399hXXgjawj3xJzgfnVFpKINP+AtMpwNvubjwoAfLJuQo+HGuYyc88Wzvb6/wjz
 oJakbkBo+gdHTm4P4VxRYMjVcsLCbYF4L3fTfNxP8m5zUmhxhF4X3LwO1nB6RP2nVmGr
 lmQQ==
X-Gm-Message-State: AOJu0YxV1LxVPJJ6aE9ZG+G8/lRVOkYsknSLcZ0QW90WN+US4ZbWLTgc
 jfXqdwNALrTv2MRVulLPO/DU+rmS/gSF8mcPISPq1ryjsy6nuLM7KpRgp76fKLA=
X-Google-Smtp-Source: AGHT+IF3NNf3KZ9S9uBPtp2LgTHFubboDS0GgeBWPRxg1SvUZQS//fedQ5j2Q+2Ujoyni9I7AiK27g==
X-Received: by 2002:a05:6512:4012:b0:51a:b933:b297 with SMTP id
 2adb3069b0e04-5220fb6983emr569030e87.2.1715294258864; 
 Thu, 09 May 2024 15:37:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d32f1sm457974e87.181.2024.05.09.15.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 15:37:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 01:37:37 +0300
Subject: [PATCH RFC 4/7] drm/panel: innolux-p079zca: use
 mipi_dsi_dcs_nop_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-dsi-panels-upd-api-v1-4-317c78a0dcc8@linaro.org>
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
To: Douglas Anderson <dianders@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/ICGqi9rxo6d+dzzW1CgRoe58bcq3pT7pDZm1a8aL8Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmPVAv+hJcCRRz/1N4z/5nZnoSCFPmnaflwApji
 eYhLOpmvgCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj1QLwAKCRCLPIo+Aiko
 1QBmB/kBfZNnW8LsfL5YALIrGr1vlDsGY/TMulRiyB3ma/rYpTdqKUWu2IcP/mVYN5f8PoptNqR
 zmmQx3yamiNeQSO2YVPk8YA99zhDUhm+NFbaDQXYLqgjLyVesZZxyGO4/jB9oWLwMQ97S+WV+SI
 SNKHeE1Bry/mghLEjJE+r76Br3C019t5P57GDJ5aNZoREBMDi5WpR/4D9TS4ToMTsql0/nLAWMN
 OtX894c98lOz+uz6VHWIkaDRywhOKJUBIVDyMxSiYkxQOmr3n2aTrGV9/cnbbzUJVprWsCc0aKP
 LO3pRkNP3pg/29EV/4A+hsP44tCYINaYPPKK0K5vOEemn9NP
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove conditional code and use mipi_dsi_dcs_nop_multi() wrapper to
simplify driver code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index ade8bf7491ee..0691a27a0daa 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -224,21 +224,14 @@ static const struct drm_display_mode innolux_p097pfg_mode = {
 static void innolux_panel_write_multi(struct mipi_dsi_multi_context *ctx,
 				      const void *payload, size_t size)
 {
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	struct device *dev = &dsi->dev;
-
 	mipi_dsi_generic_write_multi(ctx, payload, size);
-	if (ctx->accum_err)
-		return;
 
 	/*
 	 * Included by random guessing, because without this
 	 * (or at least, some delay), the panel sometimes
 	 * didn't appear to pick up the command sequence.
 	 */
-	ctx->accum_err = mipi_dsi_dcs_nop(ctx->dsi);
-	if (ctx->accum_err)
-		dev_err(dev, "failed to send DCS nop: %d\n", ctx->accum_err);
+	mipi_dsi_dcs_nop_multi(ctx);
 }
 
 #define innolux_panel_init_cmd_multi(ctx, seq...)                 \

-- 
2.39.2

