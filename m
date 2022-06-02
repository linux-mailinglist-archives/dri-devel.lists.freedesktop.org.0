Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8853B9C0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810701120DD;
	Thu,  2 Jun 2022 13:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70B710FF33
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:30:46 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t25so7814186lfg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/XTMTD0LVXEOoIu5AuQp8qLO/Sbc1QaXul+C52u7gg=;
 b=jsDI4b/haxFCsoBrn7dU9i9An8wnGAlZcjnVw1sQDt3wotIeISdk6zv+6P129DCcm4
 dEYQz07HA1QMiH5iZ9jmk/zxyRpN+LbewTF1ZhbrTxyV7VmkRDMZvVZHMYkyBjTO1eJ1
 U1R8W1uhevxtfmLYNFpCqRsleGste5FqJl5s9F4kS+WQWjSN2JrBb06YtaTu2ckyAXGL
 MZHrwfWwXzFizDdTEODQYvGGHBOQGrNQX6PsG3PiMosj3+eWhAN/v7ji4y4jw1TlcIys
 tZdRtiplpRQWYBAsPCL28gdb6VY6E/j9wVh2beL/yPZ80OHvImMYCi+qzHA85z1d+Ks1
 vxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/XTMTD0LVXEOoIu5AuQp8qLO/Sbc1QaXul+C52u7gg=;
 b=rJwdOlaoZof+xcWJQG+nyAFJGqWV46htorPhpeIS6+5ZnZErSx4Sc7U0QlQiFNWahO
 b93oDcfafGcGVG3+lcNAlq8igxR0qDc8scDxIi6/OHWFOkeMdgn7AUZCaZNTFP3WRoDa
 XDOLsVw9iL7NcwdXSXmnR7ZN8Kcx3bfxKe8b6nLnfBH1gdqhlEEiPG8qmW/eTUeRf8VU
 6m3+ForLI4n4IsCe8l8WiChD3grz4CkCnPQzJ7FiNIyuIc0C0aXvxfA83bdw+f2cfUVY
 6BlUd6LUgImnVeoIf0E/2tAoHwv0UqUvgJlDXOzW84j+/1YqMlJZiTjYY2u2ftaXFHXu
 GogA==
X-Gm-Message-State: AOAM530hAkz3BLlXQdwTr+3VCzejYh0ivVFchDG05ryYPEMVwD6NpZ1F
 Dqntge9j8tPBSX4eYva8Wa2bdg==
X-Google-Smtp-Source: ABdhPJwDvB2WPgi2ZWzPXce68IAWarleZiNlSvM41A9N4oB2UdItmsjg+xBBt0Kxk5yBuiNN2p1OCg==
X-Received: by 2002:a05:6512:3dab:b0:478:f3ba:ac74 with SMTP id
 k43-20020a0565123dab00b00478f3baac74mr3614580lfv.506.1654176644908; 
 Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 5/7] drm/msm/dpu: change catalog->dma_cfg to be a const
 pointer
Date: Thu,  2 Jun 2022 16:30:37 +0300
Message-Id: <20220602133039.1739490-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a7040ca5da72..5470b8b14b0a 100644
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

