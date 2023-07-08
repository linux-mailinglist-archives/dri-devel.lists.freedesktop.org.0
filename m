Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7774BD8A
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 15:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554A510E0E0;
	Sat,  8 Jul 2023 13:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3612210E0E0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 13:00:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so4353006e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2FuETwg9v1LoR16XCME90MtR0gPVnq5s2BUL60RtW8Y=;
 b=G7WaYC2KNGTyOWhNSSxh7DcXvPUNtbzA7NeuuvXTQe0Ueen6WuwCfLPfteKJCwoQvr
 qnXV20YQgA5+P5t+M9v6HclnVWB3RBDbqhUzsvwr1Ng3927sis/w3bpnFg3VPtL3/lRT
 adWdjS42p9AVIDgqkIno+1wYTQtyuODqBoaww7pChdEGZKH7MdSfsKu3mP72wIeTqO42
 RuRJ15NXR1DuYqE+5yCvYyGXuqrhNMB6ahQGvWuqfsCdAdUvAiELYixD/JJ+YcnUgSQO
 aQ5SK/RKdRytnr4OQ72woMD4KmQtfCQ1Zuh+SosdloMrOn/ZaljvEeqhSArw5H3layht
 QGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688821242; x=1691413242;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2FuETwg9v1LoR16XCME90MtR0gPVnq5s2BUL60RtW8Y=;
 b=ftCoJlAYUZCg2WmEZFSyu34p4MA1R+pxJjcih08lhyViGkXgwBF96wEzYtPOHJ4+pA
 tZWPBK+4ggX91PWw8GUONtdWXsxYiqcH/Tqz+PrWHo/NClDX6zw0bLWxvdf4rTZxrauQ
 b7SZMqrMUeYWR4PK+sWyPn+ZRk06E/SBUr96rJFWXirO7hjrGiSBuW1M6uBORcmEa+ki
 ctlOSxck+Txyqai8dAlRNZ7H3BJJtBa4p32UHVj7/b0H1EV+Ktjnh39PSEkZVNW0NvOO
 3rUcfqv2W60WXyZR6k+DEd1SNDQ2Utq75wNjQT2AL2fz2bUdALMbCoVZArYg1CtRwCSc
 mZsA==
X-Gm-Message-State: ABy/qLai9Ej6FH7ZICTC5LiiW2A8RPpTgFscLpkfbKNuXS4FhxW6JbaV
 yEgzt1TVgtz3/PNwjsACy3i25g==
X-Google-Smtp-Source: APBJJlGU/gACdAFSyuvrwZI0cEpRRVXdgFXaM9MVnE3YkLUJCH2wEXu+0JJom1k0Ouk2C1j+MyddiA==
X-Received: by 2002:a05:6512:a91:b0:4fb:76a5:2325 with SMTP id
 m17-20020a0565120a9100b004fb76a52325mr6185189lfu.24.1688821240997; 
 Sat, 08 Jul 2023 06:00:40 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l10-20020a19c20a000000b004fb96436ac7sm1003839lfc.250.2023.07.08.06.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 06:00:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Date: Sat,  8 Jul 2023 16:00:38 +0300
Message-Id: <20230708130039.1596599-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
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
Cc: freedreno@lists.freedesktop.org, Ryan McCann <quic_rmccann@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
This includes the common block itself, enc subblocks and some empty
space around. Change that to pass 0x4 instead, the length of common
register block itself.

Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
Reported-by: Ryan McCann <quic_rmccann@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2:
 - Added Reported-by tag.

---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 ++++----
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 8da424eaee6a..6edf323f381f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -159,10 +159,10 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8350_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8350_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 900fee410e11..5354003aa8be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -104,7 +104,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 
 /* NOTE: sc7280 only has one DSC hard slice encoder */
 static const struct dpu_dsc_cfg sc7280_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
 };
 
 static const struct dpu_wb_cfg sc7280_wb[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index f6ce6b090f71..1d374abec1fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -148,12 +148,12 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
-	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x4, 0, dsc_sblk_1),
 };
 
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 8d13c369213c..79447d8cab05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -167,10 +167,10 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8450_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8450_intf[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f17b9a7fee85..26e3c28003f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -171,10 +171,10 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
  * its own different sub block address.
  */
 static const struct dpu_dsc_cfg sm8550_dsc[] = {
-	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
-	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
-	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
-	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
+	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x4, 0, dsc_sblk_0),
+	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x4, 0, dsc_sblk_1),
+	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
+	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x4, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
 };
 
 static const struct dpu_intf_cfg sm8550_intf[] = {
-- 
2.40.1

