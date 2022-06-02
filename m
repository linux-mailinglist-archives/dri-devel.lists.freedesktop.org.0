Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3A53B9BC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319E510FE4B;
	Thu,  2 Jun 2022 13:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499A10FE31
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:30:43 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id be31so7817512lfb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8oBV/eQaih6GGUVnsD5E6MW8vdCzytG3mGlclQPGb0M=;
 b=rQluE7+f69qgQk/0G/oAOgXJGVOKZOYYlBhwsYOa6O7FFG1Ex6KhQJtoaRhBznx2OI
 ZipuQrvUf0j6oXjHy2J2+fU2Y05NX5HY+3ilFKssNOIFrYL2Hh3BnhJ7rbNhvDFCCDBL
 hl3rzqU15KsvAIrhLnVzdxyr/rPJgPJOrAsRVWmUC9BTk2HtNSiMJhd4CzfR3wU9gIdr
 dAz3BCr9ALhVxgzroglBRa+g6RnGJJy3bI8aF3ucF9QvI93OgqxsmiAOLo/OOlGK+zND
 jhAARGYy76gOAzDHSfFsexe5PqojXvadhl8nqgp07qqBLOCPumRKmtGTE+OZHxni+JKD
 KZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oBV/eQaih6GGUVnsD5E6MW8vdCzytG3mGlclQPGb0M=;
 b=xUoE/uajwa8NeT0uqPJtAhlPU8L7CxSYFUdHqg3RvAZS9hhClaqfbOxGALJHvKiO4T
 XMySX5QVRVKft31jjyP4yb1z0dUsS9aFAqfyZ8ZPTIkEEcDMX2ZLlkzdJXNIKs6ETOU/
 4rqW1LBC3xATjFdPthgaWOCJ5/81b8Nc7s+pyPGN4rlU7wG/0EG5BtkkQsDyL0Noq6fK
 m/l63KEsq2kFEXjd1HDonUe1RzaOgMLyYTOVC2dhK8aNND4208HL6rDLiZnLgRUT446K
 en1KvUg4+kIM9bXePVkifPx7lfzQIjOR7eBA81HTpuT8qQRxBQsyKpMHIZQIOXRy6rlm
 KzgQ==
X-Gm-Message-State: AOAM532wqGbRDaNAcVVgoSKf1JM4f/SjlllnlhmSJjfGCDZ3UtLqmAER
 mwVjwTVtcYJTksMO2GP0yo9rJw==
X-Google-Smtp-Source: ABdhPJzJVjCzbOKluzDKT+1n/apS8hh4gkLnbAJuhSojFOwEqYhOVOg6YSPZxtReYmcqF9vayBuvpA==
X-Received: by 2002:a05:6512:3f13:b0:464:f55f:7806 with SMTP id
 y19-20020a0565123f1300b00464f55f7806mr3640478lfa.598.1654176641197; 
 Thu, 02 Jun 2022 06:30:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:30:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/7] drm/msm/dpu: use feature bit for LM combined alpha
 check
Date: Thu,  2 Jun 2022 16:30:33 +0300
Message-Id: <20220602133039.1739490-2-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than checking hwversion, follow the usual patter and add special
bit to the lm->features to check whether the LM has combined or separate
alpha registers. While we are at it, rename
dpu_hw_lm_setup_blend_config_sdm845() to
dpu_hw_lm_setup_blend_config_combined_alpha().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 17 ++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      |  6 +++---
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 400ebceb56bb..78c7d987c2ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -50,9 +50,12 @@
 #define DMA_CURSOR_MSM8998_MASK \
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define MIXER_SDM845_MASK \
+#define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
+#define MIXER_SDM845_MASK \
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+
 #define MIXER_SC7180_MASK \
 	(BIT(DPU_DIM_LAYER))
 
@@ -936,17 +939,17 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 };
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
-	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
-	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
+	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
-	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
-	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
+	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
-	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
+	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8cb6d1f25bf9..80bc09b1f1b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,6 +145,7 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
+ * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -152,6 +153,7 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
+	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 462f5082099e..25d2eba28e71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -148,7 +148,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 	return 0;
 }
 
-static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
+static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -204,8 +204,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (m->hwversion >= DPU_HW_VER_400)
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
+		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-- 
2.35.1

