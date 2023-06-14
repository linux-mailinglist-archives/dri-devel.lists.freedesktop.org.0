Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84591730AE4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 00:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5998510E475;
	Wed, 14 Jun 2023 22:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DB310E476
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 22:44:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f764e92931so2150165e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686782645; x=1689374645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AC35kDbj6ySmemert7/iRfIceZyirU887BhY5EsoBY0=;
 b=hXG52HqnIpdkGQuwJp2XG/WhHpGSW2X8YJ7wRGzqSbvDi5DogyuX5DYcdP7KZIldr9
 DeU4ZRXJT+c8u0Z5DG3UEJMSU65yIOgCiTKuYdkY27vmolZPGHMjkoxWLUv/sdJeQ3uK
 btYHk+vZm4kQeDWGC83FMN0TtDm2jWZqlwJW7DuKgYb7aOeF9iiQgCfRWGmZka/P2FDz
 xC0eDuQgiz64HSNxquDOOynIKns/FJDzC/naJZPaZgpRQoxtjIjuxnBx9rB1vu6S86XR
 QtCh6eiOw07pMTxwmWAqoy8a0/tQsYjq6u3K/5HvCELbEzE0WwhpWae5nUOCC7hTEU1/
 oTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686782645; x=1689374645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AC35kDbj6ySmemert7/iRfIceZyirU887BhY5EsoBY0=;
 b=Y1fCW7T4QgvJU8hBgJAdR6hft6FTC6QqWAF51uqnWLdYmnL1PyHVcDucm5NcJuA10V
 pEWlaFf/yEM35WY0NirLsm0Qk54hCqGoEsglufIU5CtOZptvP79L5GNhicuA2vbVBZvY
 ZD9TG1NM5nGwfnLDg1uPodIG7H6CeqHGpLgkMOVpe9xuuGwnDEvKGMxBYmpjegt7zH7n
 kNaPDt4cI1sidTZ+hLmqWlG+E0d9ovXx23IA3CnrbkCLrcb/a6wNabguEqgPHyql+1uI
 6Rn4Ny2csdx+GsUn40vYolG/GaMyVSe5mnALJ1fEeCeOqI1Pk0F6LBMasFfK/tqMpAHS
 ly4g==
X-Gm-Message-State: AC+VfDyK8mEXV9Xit+672FbSmf6ibu3sioVk9eyG2qEG46X3V6OVZc5A
 qk/Jg3+3AZxNR9g/kB4yPFP4Ng==
X-Google-Smtp-Source: ACHHUZ4dw/+61k2ZzEwroW2qmQVzfEyETzh2vxioPG+C1jcksXinkjZ6FbgE76zzqP9NLubv6XahYQ==
X-Received: by 2002:a05:6512:68:b0:4f3:a99f:1ea7 with SMTP id
 i8-20020a056512006800b004f3a99f1ea7mr8129826lfo.55.1686782644756; 
 Wed, 14 Jun 2023 15:44:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac24a62000000b004edd2dc9a09sm2295866lfp.258.2023.06.14.15.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 15:44:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused clocks
Date: Thu, 15 Jun 2023 01:44:01 +0300
Message-Id: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several source clocks are not used anymore, so stop handling them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fb1d3a25765f..eaee621aa6c8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -118,8 +118,6 @@ struct msm_dsi_host {
 	struct clk *byte_clk;
 	struct clk *esc_clk;
 	struct clk *pixel_clk;
-	struct clk *byte_clk_src;
-	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
 	unsigned long byte_clk_rate;
@@ -129,8 +127,6 @@ struct msm_dsi_host {
 
 	/* DSI v2 specific clocks */
 	struct clk *src_clk;
-	struct clk *esc_clk_src;
-	struct clk *dsi_clk_src;
 
 	unsigned long src_clk_rate;
 
@@ -267,21 +263,6 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host)
 		return ret;
 	}
 
-	msm_host->esc_clk_src = clk_get_parent(msm_host->esc_clk);
-	if (!msm_host->esc_clk_src) {
-		ret = -ENODEV;
-		pr_err("%s: can't get esc clock parent. ret=%d\n",
-			__func__, ret);
-		return ret;
-	}
-
-	msm_host->dsi_clk_src = clk_get_parent(msm_host->src_clk);
-	if (!msm_host->dsi_clk_src) {
-		ret = -ENODEV;
-		pr_err("%s: can't get src clock parent. ret=%d\n",
-			__func__, ret);
-	}
-
 	return ret;
 }
 
@@ -346,20 +327,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		goto exit;
 	}
 
-	msm_host->byte_clk_src = clk_get_parent(msm_host->byte_clk);
-	if (IS_ERR(msm_host->byte_clk_src)) {
-		ret = PTR_ERR(msm_host->byte_clk_src);
-		pr_err("%s: can't find byte_clk clock. ret=%d\n", __func__, ret);
-		goto exit;
-	}
-
-	msm_host->pixel_clk_src = clk_get_parent(msm_host->pixel_clk);
-	if (IS_ERR(msm_host->pixel_clk_src)) {
-		ret = PTR_ERR(msm_host->pixel_clk_src);
-		pr_err("%s: can't find pixel_clk clock. ret=%d\n", __func__, ret);
-		goto exit;
-	}
-
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
 exit:
-- 
2.39.2

