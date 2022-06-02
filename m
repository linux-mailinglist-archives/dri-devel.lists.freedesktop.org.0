Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D8953BFC3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7A2113489;
	Thu,  2 Jun 2022 20:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F831134BB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:24:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j10so9505464lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J4jsE+4ksbYLmNXEvnVNpF4H74ViV6SigqADiLcUbIU=;
 b=qDKKsbrD3u7dzPjfYSh7wD7ROlW5Jx9PBMe495HCoV4hFYc+apCzR3BVgGI7rpB8+r
 J923oZefTXXRO/1VDN4p94GTKiYNQ76cFmKb4WlDWAwJbEJeRe+OveDk84DIE8HCtYsU
 MQVbWwcXk1BnRKMxIDMkQd2NopKLYpr8bBIzPaiEhvbaSyDqXqzcVlXIovVMxNqzbDAq
 ierRR0r1sQ+C2K4swzQYz3DoquQ4y6JlllePDeomx7Sjj8jd1zu3ZJnlpGCUSJ9FB4LR
 0AZwgy1f0lKv1M0xd2VIH+D4Qq5CnbXSwRy7JbGdrvT0DjKDkz0eLNYkb56GF93CQ+ya
 2BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J4jsE+4ksbYLmNXEvnVNpF4H74ViV6SigqADiLcUbIU=;
 b=eqqkCASNMABGRSCGjcxYq1UEUb3iaYIWTQhGxC2PcP6j889uiKpqhgPKcx8tJurYX5
 pb6yULKPYJHZwdozLBPn3/07k84ZdLX1GtTOP3tPiW1j6cftu2F3P8dqqTFPjLvNDvzf
 LwmcS5zJobVTVo79S7uyW0F6h/KHdLl8crmhl3Kt/8WaGSVAY/tGsXPz6UGAmfiDz7zL
 2oyY5EuWk2Ejcv2yZzkR6VM5K7NovcWgGylxIExreoCQpFnwipUPJvsoDiUk0qGTDP5G
 kiXs5o9odbl6XEqbIM7ca2E34qcOcG4obyehyLrW/ctZgrQZmICPBj8itD6GpY1VpIpa
 SyvA==
X-Gm-Message-State: AOAM5305aDqleSZ3/xAokpnZ5DvQWb1QBh1XyeY/xLjLnwkHAP01oNhA
 j1jgT4npbK7zoZj2xY5pKGFT2A==
X-Google-Smtp-Source: ABdhPJwcvwwUmrdWkWRMRCgYSHn6Ui1pFRddbCHuD1G5NgrygNEpATEGWhABGjba6aBv/yLjtX+L4A==
X-Received: by 2002:a05:6512:13a1:b0:448:887e:da38 with SMTP id
 p33-20020a05651213a100b00448887eda38mr4799622lfa.298.1654201496350; 
 Thu, 02 Jun 2022 13:24:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.241])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a056512369900b0047255d21114sm1205718lfs.67.2022.06.02.13.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const
 pointer
Date: Thu,  2 Jun 2022 23:24:45 +0300
Message-Id: <20220602202447.1755115-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
References: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change dpu_mdss_cfg::dma_cfg to be a const pointer rather than embedding
the dpu_reg_dma_cfg struct into the struct dpu_mdss_cfg.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 95b3ecc4db60..cca3b3a0c231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1780,7 +1780,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &sdm845_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
@@ -1811,7 +1811,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &sc7180_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
@@ -1844,7 +1844,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
+		.dma_cfg = &sm8150_regdma,
 		.perf = &sm8150_perf_data,
 		.mdss_irqs = IRQ_SDM845_MASK,
 	};
@@ -1875,7 +1875,7 @@ static void sc8180x_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8150_regdma,
+		.dma_cfg = &sm8150_regdma,
 		.perf = &sc8180x_perf_data,
 		.mdss_irqs = IRQ_SC8180X_MASK,
 	};
@@ -1910,7 +1910,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.wb_count = ARRAY_SIZE(sm8250_wb),
 		.wb = sm8250_wb,
 		.reg_dma_count = 1,
-		.dma_cfg = sm8250_regdma,
+		.dma_cfg = &sm8250_regdma,
 		.perf = &sm8250_perf_data,
 		.mdss_irqs = IRQ_SM8250_MASK,
 	};
@@ -1965,7 +1965,7 @@ static void qcm2290_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.vbif_count = ARRAY_SIZE(sdm845_vbif),
 		.vbif = sdm845_vbif,
 		.reg_dma_count = 1,
-		.dma_cfg = sdm845_regdma,
+		.dma_cfg = &sdm845_regdma,
 		.perf = &qcm2290_perf_data,
 		.mdss_irqs = IRQ_SC7180_MASK,
 	};
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 64ed96b2fa3d..60b403ac9f0f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -859,7 +859,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_wb_cfg *wb;
 
 	u32 reg_dma_count;
-	struct dpu_reg_dma_cfg dma_cfg;
+	const struct dpu_reg_dma_cfg *dma_cfg;
 
 	u32 ad_count;
 
-- 
2.35.1

