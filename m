Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914CC671088
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 03:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE410E631;
	Wed, 18 Jan 2023 02:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587BC10E62F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 02:04:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id az20so60729592ejc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
 b=TzQ1sMwB1RC9DxUo+AdAxkjIchDRZWROV8NmIYXgAIIm8tGAc+WZF8v7f+SI7u8QZ0
 Fw5IC5+qfNsgpSfSztb5oRoMtmORO249BvgasoG1V2PrHf+OCl+LUGX5K7Cbt/1bmuGx
 qIkfQOTY/xHZFFiSE765QXxPbHXnNysp7kftsNWlsx1htxxk9pHxi7VFgT1U3AvjLidJ
 bziVaQlZSweEy4woXQ2c8gmJsvceZpBcpcPDyw+tVNjnXFnWR47AvYkFhVnCQFXMuHF+
 pmp0xi6vaiuM12lj4EgY3vfiwFAjH8K26Ak76Hf8KU/MOzt7e6ikMLPF2AKxsyppOfgO
 YTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GmFljcxneeNo8UiA4f7/Tuyz9l2ONU+PVcYO5MlNZtw=;
 b=ze1TZq3rwOz6//NCoihVdraCrDJAlYde03qogYUePWzl6XAuEG8gn+iJbSPD++N7PK
 4fcqHSQ9lKs2ZmSptdiwbFJpJvTEqDWiLzjh5etr36RwCKA1xd5QUeS2jAwbNSyVk8c4
 h+z8MDxLmXkYIxpt7Gvx85Jo1L2NZ46YXMb5rhuYmXiEunrOvb916WACFpvZSHiUg3cZ
 IgvlNpLOSwUnEk3MMDo608xQn0DI7Tv3kF0woIUOA/hC5rpXGD0MI5gFbAeqjN7oLZTo
 59Umqh+6juDraEdXDEJVPb4I35AhehD4KvnXxy66vcaCTSHG5a6ySX47St8ElLfPdsbN
 0Qjw==
X-Gm-Message-State: AFqh2kpkiVa/GxSg3KqRMMNyzlOilYBLb423uGhmHGcgB8VCdi5Cugp0
 2TK01+BuHdv0m01Fnmri90oN4w==
X-Google-Smtp-Source: AMrXdXtiEWdKiTBtULSL3zbwnQKxj2N+QGGIq/7/7UHhlqWC8yXA9vnF78LmQUIn8hmcExxnmd+/8A==
X-Received: by 2002:a17:907:9885:b0:870:7340:b770 with SMTP id
 ja5-20020a170907988500b008707340b770mr5118885ejc.54.1674007497848; 
 Tue, 17 Jan 2023 18:04:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx4-20020a170907774400b007c10d47e748sm13836459ejc.36.2023.01.17.18.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:04:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dpu: use sm8350_regdma on SM8350 platform
Date: Wed, 18 Jan 2023 04:04:55 +0200
Message-Id: <20230118020455.1689929-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
References: <20230118020455.1689929-1-dmitry.baryshkov@linaro.org>
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

Correct sm8350_dpu_cfg.dma_cfg to point to sm8350_regdma rather than
sm8250_regdma.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3d0fbc1746e2..e6618e678384 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -2737,7 +2737,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
 	.reg_dma_count = 1,
-	.dma_cfg = &sm8250_regdma,
+	.dma_cfg = &sm8350_regdma,
 	.perf = &sm8350_perf_data,
 	.mdss_irqs = IRQ_SM8350_MASK,
 };
-- 
2.39.0

