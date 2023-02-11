Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5896934BB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 00:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36E810E3C2;
	Sat, 11 Feb 2023 23:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C14510E3BD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so23984757ejc.4
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
 b=jWKuQ8GMbk3Vj84PFPIlV8S0d8syG4d1X2kNZpL/LCS9jlWsM4rRMf72B959nPQnC+
 ngBaCegLGXtJEt8UgYkCtHT8Cs9VRuJMdz0x95fwP0yMvhDeLDKZC/L7uIGaHfjoMcLq
 jFDyDkJwZlFQE8GaNVn+rhT2PcGR0nrIkSaIdNIk+fIMrCuki9sHwH9h+hXRoJ3fYuRy
 O4foa34Zr1gCD7lmlFF/WTkJtV5jUKPECQOlTBllRcA0OP/2HDNmRPeTx9oec4V5d64k
 ceZHXn1XOhcSFw21zawYhUpoZw7/l/bqq21c9KGC2WgIMq67wMzbOiXfLEezIuVDBEdF
 47YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J31CAkEbeSgGqmOFWMgrhqaSYaHyMz8nFGUoMcYydwo=;
 b=5+nneMf0POPLNHF/Z6TGSU3OaJ4t74h5iH4OSp8Ek2D3S0+78RcPoaJ1cvk1WByl2F
 /qnj9dnBvxQFqkb31fm1q7oPUO+dX1b4m1p2I+phxuqsFrdm5isY9N8pEe0HMXYShw+8
 zcqR8wuN+j+lOAGmgAQvdALaF24mxaGQgrpTHNa4WvjS/hdcxLmZ/pU3h/9PpwUlNyj2
 3OudN8ut6Yek6/aBBiyYMwKq40GUDT+0s06CQITycJ9c/Fs625yBMAd9pcCyjOEqUdqy
 OWjjPEKWrsVUJqRCF8O1bCWLBWe++DjcADkrXeQ4KcILK4eadaXPRvb72j4P07bE4lxm
 WNPQ==
X-Gm-Message-State: AO0yUKXp/6koi+Zd9SJP9ZOKHoAUM9+VR6/2DCE4dnDE0mWykXC/ko8a
 P8t2m/Siyv3g4HsWcJjHWBiB6Q==
X-Google-Smtp-Source: AK7set9cqu2tXMqI/X5iLt9VzGRkElq3axtjm92kB97HjZi4gbsdCHY7Fj4VQofmFJbxPCqJbvNygw==
X-Received: by 2002:a17:906:3792:b0:88d:5081:e9f8 with SMTP id
 n18-20020a170906379200b0088d5081e9f8mr19468357ejc.15.1676157187817; 
 Sat, 11 Feb 2023 15:13:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 05/50] drm/msm/dpu: fix sm6115 and qcm2290 mixer width
 limits
Date: Sun, 12 Feb 2023 01:12:14 +0200
Message-Id: <20230211231259.1308718-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

According to vendor DTS files both sm6116 and qcm2290 should have
max_mixer_width set to 2048 (DEFAULT_DPU_LINE_WIDTH). Correct it.

Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 47de609e2279..192fff9238f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -318,7 +318,7 @@ static const struct dpu_caps msm8998_dpu_caps = {
 };
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.has_dim_layer = true,
@@ -356,7 +356,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 };
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
@@ -1520,7 +1520,7 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
-- 
2.39.1

