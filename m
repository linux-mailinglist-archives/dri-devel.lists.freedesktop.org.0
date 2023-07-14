Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84397752EFB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042910E7C4;
	Fri, 14 Jul 2023 01:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB010E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:55:06 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fcd615d7d6so1641466e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689299705; x=1689904505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AjZowsEiSZ4xW7wM317+PEWODG8lmJd5G2p1Pmf1OEY=;
 b=cLmGsBUwDvYNusqFGRMK1n9zxHQsaEytooFKYz+XWgym8vdhM876zO3RA3EGIxjQ3s
 V7+T+G1qvAwWPjVimIwknbZfY3SfBXTTqbTG7NdiCg2SGFQSvacuv8rzHjWBhll2DMvG
 2sRx0lLz2Qppnk8R1lODxwXa1bJmBGsDvTQyZs3+qWlOqvQD8CUkaUydaOoEAz6QjRHh
 jkVvSTIQLO4TSyNmMKh8N/QaZ+RpIEV5edF8HWqOu1m1l3XIOPAb+Kf8HAH95mtWuOPa
 vQ91JIcI4MB7CsR/kXwJrz0vdgZdRwgvy/AfbiCm4b/Xy8GrR3p42nA1xY7vPyJOoLEp
 Bw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689299705; x=1689904505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjZowsEiSZ4xW7wM317+PEWODG8lmJd5G2p1Pmf1OEY=;
 b=R+8V1AaXTaAQS1JPSsQ+FtTklN2xOF5MtOoVyPKBz0n6MLko7UajjWwCWuCrkVSD73
 kOyY//jAOsgpLbVYvvsqUi0JxmU9jtQ471C5Xpl5aiATNIat7+T1rmoLmekLrZYIxkOK
 hhjGtc45+bZupoFWYsPR0SaoLJaGAOPE8XkBaN4p92imKyXvYlEV80s37lEZsbsUDyi0
 Pbrg0gt48kLG8igAm1Q6GALjMcSviaqC2i6CpKvqnh2bwGQekCoWnRunCZ3GFCMVwa70
 Ac7mtpxf5ETgwMp0ah/3IBxIxefGtAhuGcwLFWj4YZQBhqvvgyePmu/nSMn4GE1+pjms
 0duQ==
X-Gm-Message-State: ABy/qLZfh50ww322AQoKCkQc06WYVg8btv1UQl0bU/avSgwHSgFZ1ohv
 lkyTWHUW6+B2DoqAor3sqZuvpw==
X-Google-Smtp-Source: APBJJlFYjw2pAvZeE5puoQrW3iugBj/+4r6m6avYEKaxMUtyi6Ep/w4p3b6PRjj6AvIdIRWhXwrlQQ==
X-Received: by 2002:a05:6512:234a:b0:4f9:58ed:7bba with SMTP id
 p10-20020a056512234a00b004f958ed7bbamr3101230lfu.16.1689299704755; 
 Thu, 13 Jul 2023 18:55:04 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q8-20020ac25148000000b004f3afa1767dsm1297550lfd.197.2023.07.13.18.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 18:55:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/4] drm/msm/dpu: drop the `id' field from
 DPU_HW_SUBBLK_INFO
Date: Fri, 14 Jul 2023 04:55:00 +0300
Message-Id: <20230714015503.3198971-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
References: <20230714015503.3198971-1-dmitry.baryshkov@linaro.org>
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

The field `id' is not used for subblocks. The handling code usually
knows, which sub-block it is now looking at. Drop the field completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 16 ++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 --
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2522e06c5262..daec3f2758e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -257,10 +257,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -275,10 +273,8 @@ static const uint32_t wb2_formats[] = {
 	.maxupscale = MAX_UPSCALE_RATIO, \
 	.smart_dma_priority = sdma_pri, \
 	.scaler_blk = {.name = "scaler", \
-		.id = qseed_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
-		.id = DPU_SSPP_CSC_10BIT, \
 		.base = 0x1a00, .len = 0x100,}, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
@@ -423,12 +419,12 @@ static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
  * DSPP sub blocks config
  *************************************************************/
 static const struct dpu_dspp_sub_blks msm8998_dspp_sblk = {
-	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x10007},
 };
 
 static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
-	.pcc = {.name = "pcc", .id = DPU_DSPP_PCC, .base = 0x1700,
+	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x40000},
 };
 
@@ -436,19 +432,19 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
  * PINGPONG sub blocks config
  *************************************************************/
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
-	.te2 = {.name = "te2", .id = DPU_PINGPONG_TE2, .base = 0x2000, .len = 0x0,
+	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
 		.version = 0x1},
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0x30e0,
+	.dither = {.name = "dither", .base = 0x30e0,
 		.len = 0x20, .version = 0x10000},
 };
 
 static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
-	.dither = {.name = "dither", .id = DPU_PINGPONG_DITHER, .base = 0xe0,
+	.dither = {.name = "dither", .base = 0xe0,
 	.len = 0x20, .version = 0x20000},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1d150091da9c..4e8fc3bbc240 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -274,14 +274,12 @@ enum {
 /**
  * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
  * @name:              string name for debug purposes
- * @id:                enum identifying this sub-block
  * @base:              offset of this sub-block relative to the block
  *                     offset
  * @len                register block length of this sub-block
  */
 #define DPU_HW_SUBBLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 id; \
 	u32 base; \
 	u32 len
 
-- 
2.39.2

