Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8361F732CF5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8094110E5CA;
	Fri, 16 Jun 2023 10:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B1C10E59C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 10:03:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f76b6db73fso2118973e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686909837; x=1689501837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=ER+1mSQoN+LrCoHIhIDwWOWDvhN4sKfYCGwbqa9BX5FNdOVf1yD0qdeGDrfLdpTr3n
 e7VAGjKpt25MbHuH7IhAZut6r+qZRgxcwsFyIaO9g5J5l6MlXGdC8RV1ctpxCsOEhh51
 rKzEbZYJ+O7YzTVTE8IcE9Dv7a+mly+EG4M6JtYk8VpsqqHTarpxGChTzwn2ogjErpA2
 vsVLr5V9Wi9U5BwOkUJribtg+fQmCPqeMOhoNOXnB56uRC0qcG8FdM0+VRvVqw9Lc29a
 95SERoJmN4lXTfCFFn/sTo1byTVjtd2h2w+GoMHf5P0Ph/xAtpDKd4vjSP6vHyJL4pgZ
 8CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686909837; x=1689501837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Z6dm2XLnqrBhq2Tt8Kc44vvonw+W/q8cr8K+n2c5Go=;
 b=P1ASlIYS6Nzr7Den5pu/qvZcdlOleC0AEbI00geCv4hNqu1w1O7GP5sc1CdcY4Pn2H
 GAiXWOWkkKRRnbpnS5Jn3lVGppyWOoLfHbqdZjgEBZqYGlr2iHoEbhL8x6pofAcv839Q
 wy6Vo6Tr+PSj4J6XlHpaCECSW1w6LlNvuzlglG4OaiUAUKPVcEY85Ag70pu0Uw35AUkC
 7SjDa1Dy3nGmV7mjkzPZ52j/D1ljyfjqBDylZWlrpYLJntyrm3Q8Okc2g+Z4s27SAOs/
 JYzRMKgPH0omoJXgmMCf0oh+E/xQIUm2gilWcCVEQXjcNH+Ljw8gSankzPxLF49GU/JN
 /02w==
X-Gm-Message-State: AC+VfDxWlVjLk6GoguYFQ7+sRWjDwlDt6FhONxecos0GZ3GHIMEdDhI2
 vb7YFMNOBxVh8OVcCaGOIHnlbw==
X-Google-Smtp-Source: ACHHUZ6da952EzINTP+fYB2k6K8jCZOEu52m6Dxh5mtwiNhlNZH+IAkQkxj5M1wAUmGERapImilFfw==
X-Received: by 2002:a05:6512:2247:b0:4f7:6350:6bee with SMTP id
 i7-20020a056512224700b004f763506beemr2915542lfu.16.1686909837209; 
 Fri, 16 Jun 2023 03:03:57 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
 by smtp.gmail.com with ESMTPSA id
 r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 03:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 08/19] drm/msm/dpu: drop zero features from dpu_ctl_cfg data
Date: Fri, 16 Jun 2023 13:03:06 +0300
Message-Id: <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

