Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA87790FDF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7910E27B;
	Mon,  4 Sep 2023 02:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF4B10E280
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:01 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcfd3220d3so12523621fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793099; x=1694397899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/rDp6IsMw91trU1zOp/Hjm/TPrfSTJ5k8RTiYBXbIA=;
 b=my6+o13XTmAe3Mb/i1IsvcFGJYbywYxFa9q3LgqvndnCqRsrg87pG6FGe0dgXldZ03
 tFolYJiOtaLJN6kLC8E7oEpGWSDlZeyKY76fg1EVdvESfQF+FudrOx9pZBQO2QOSturo
 JWhAyyr3qZkC3iv12jNlsqvAV1rFIhLOid8UoPQmafdtGImA+zcLEvOWtT/XED9th+4+
 mW+ZHZLYO5WGP2hhcUHmXgNB0kfqinKyM59Eeav0Qwogy7X09Rv3QhtC/wZtqKcacJ8w
 Go/IR2r5YSnqJJNPGbYz2ZIGpmm5KXdp9q7JcMTX8yLN5o/Ikl7vWlb41pBY/zTmOcda
 JB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793099; x=1694397899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/rDp6IsMw91trU1zOp/Hjm/TPrfSTJ5k8RTiYBXbIA=;
 b=EDxCh9IoD6Fm7QTKWcZH/exBOCqgWDGt5wWut8EjOjKMHqf4gp0rF1ABLzi49bMiWw
 GqEJuz9thRNl1hFqTnClK6FzjRLHN5xGqLBMGY3478TAMnoQ6oAjnFziCK+31khzjJIJ
 TZD00O5TlMp5B+f6EiDCVAA7PvdLkmo5pj6Go3s3dcoaFT/rfC/tn+4xP134OHRVpldS
 e56JFjJHRqxT3ZYkd1V+rQWUREjXWN8LbdVamUDMklopSNMx88BCxdmY2oV+8Vo1swqB
 Kxz6dL3LWM6BYZiovzAjcKk5USFg6mlP0zNZvoMOtY94xGkbnzrlID066ipGQo8rVYQy
 z8jQ==
X-Gm-Message-State: AOJu0YzevuPWY8vi8waddStwCkRN8cn0LlZTPQ1SwLbEwI2xh3fv4jel
 V0k3+HWhp6R0G2uKgDfNmYkSXw==
X-Google-Smtp-Source: AGHT+IGc6DjrSpswdTIrEcQhdnq2iRRuzXUIadPblyBTMgGfolFtfbD0pPK6ytUe2ccHrV35qZiVIg==
X-Received: by 2002:a2e:804e:0:b0:2bd:169e:3819 with SMTP id
 p14-20020a2e804e000000b002bd169e3819mr5684898ljg.17.1693793099632; 
 Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date: Mon,  4 Sep 2023 05:04:52 +0300
Message-Id: <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..e03b2075639d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	/* DPU before 5.0 use PINGPONG for TE handling */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d89bdd0dd27a..a1aada630780 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9aac937285b1..e5add4384830 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -158,7 +158,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -166,7 +165,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

