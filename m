Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765177217ED
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 16:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C2410E154;
	Sun,  4 Jun 2023 14:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ACD10E141
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 14:45:18 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso4904326e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685889917; x=1688481917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XGGSdfCbsBNbwyef8Nb7m7BC2wJ4z01Pzv4/SUxCqbY=;
 b=bzH+C7i2fsbFxAVG4fGz+L2gJ4FKtrc9BSXQ4ZMmiy/SaQp6GUgCJpL+PUbf1YPCbG
 cBSrnjPUwWnoMbFXZpLJKNFnRayNuxfUrZ9BsEGv1uTWuau0VHNkxhSfaA2Tx/2uwWij
 tWVKfgOoHKS3PTtox3l+RAC654T9TflyjGhNj919jLK3Y8WLrP8lDQ5Cn7Bcdowr/vlB
 SxMZ0INqxkoGfVMqEohbPwffNcrliIvqDqQBspIro6qdvnyrCJXRYOCkdE7OWfIYKe7a
 XS1yG/QKrc8qjW+yjyX7uGCLtEDQK9FY9wx975Bbb6dqX+y0s2lq5CPK+V7BhS0viIxz
 2Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685889917; x=1688481917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XGGSdfCbsBNbwyef8Nb7m7BC2wJ4z01Pzv4/SUxCqbY=;
 b=ZNCoJoYQ/Nrd0/BVxW8WuD/veT/B4WI8p/WS3YFQFBUfIkXoNQzYLP6aQpCbM2YFjM
 gxrkp9dBmNkBPwT+hAKJj9TLnRDgWM/hPt2/UBth5W5pKn7Ww4S6c97Sf+2Bp2u/3O3V
 Z1/se2auVruRDoqJ/eY8bzdlxknHxqBlS9UvihLUfbdM/Aw8GWJBVVnAc+OOj/S2pgg0
 w1nhPDjxwe6pNL/Yhl8SvsRBbGQpQ1GkCvLuGiUD1ek1lsbzfnCMMBjDMVxeJKwAVV+p
 JD8erXuPLHl8qEIbyxa/W3iQHY9nwBUbDB+gRULx5pGz1k6QSf5OmHQqhbbkEHjGgt3R
 VG1A==
X-Gm-Message-State: AC+VfDzC9iayAqpcqQm9J3crtt8porVmlROEw4MUviVgcP3ngAHPh9I9
 2JjYaxQzEHFqUW5o+/nEs9vWwQ==
X-Google-Smtp-Source: ACHHUZ4j5C8xL6XAiCpH3QdTXg72QJnx7Ts7fWE2BB/RDyis3nO7+z8f875nzGQpJnh2MTEVInzhRA==
X-Received: by 2002:ac2:5143:0:b0:4f4:c973:c97d with SMTP id
 q3-20020ac25143000000b004f4c973c97dmr3694773lfd.25.1685889916913; 
 Sun, 04 Jun 2023 07:45:16 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 07:45:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/3] drm/msm/dpu: split _dpu_encoder_resource_control_helper()
Date: Sun,  4 Jun 2023 17:45:13 +0300
Message-Id: <20230604144514.949628-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
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

Follow the _dpu_encoder_irq_control() change and split the
_dpu_encoder_resource_control_helper() into enable and disable parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++--------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7c131c5cbe71..cc61f0cf059d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -757,8 +757,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -768,28 +767,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
-	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
+	trace_dpu_enc_rc_helper(DRMID(drm_enc), true);
 
 	if (!dpu_enc->cur_master) {
 		DPU_ERROR("encoder master not set\n");
 		return;
 	}
 
-	if (enable) {
-		/* enable DPU core clks */
-		pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	/* enable DPU core clks */
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-		/* enable all the irq */
-		_dpu_encoder_irq_enable(drm_enc);
+	/* enable all the irq */
+	_dpu_encoder_irq_enable(drm_enc);
+}
 
-	} else {
-		/* disable all the irq */
-		_dpu_encoder_irq_disable(drm_enc);
+static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_encoder_virt *dpu_enc;
 
-		/* disable DPU core clks */
-		pm_runtime_put_sync(&dpu_kms->pdev->dev);
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	priv = drm_enc->dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	trace_dpu_enc_rc_helper(DRMID(drm_enc), false);
+
+	if (!dpu_enc->cur_master) {
+		DPU_ERROR("encoder master not set\n");
+		return;
 	}
 
+	/* disable all the irq */
+	_dpu_encoder_irq_disable(drm_enc);
+
+	/* disable DPU core clks */
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
 static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
@@ -847,7 +860,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -942,7 +955,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -977,7 +990,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode)
 			_dpu_encoder_irq_disable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
 
-- 
2.39.2

