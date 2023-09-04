Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78251790FDA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5500B10E27F;
	Mon,  4 Sep 2023 02:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622A310E285
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so14814451fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793101; x=1694397901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ND9TWls6WljGZ9WIziWPWxaNspuAqLv4XdjEfOK8lUI=;
 b=tXPqHQzu366K1ZgguB+79Evf9eAwFRHStoLhVAZzy4x2MeyfMLzafRpbzLmfovy7d7
 GC3S2BJU9Xs+C60HmnV95l/LsY1tBl9wC/3QijevUoQCWkTotHJeRCHaLW6DUs9WXyrQ
 tRWj5nwdct6Cjye2Uacih1KbRvYMEG1EZDn9Ig4y16W8CcJr2o9wXJGmZk/P9sc+eG2O
 6Lm2Y1UmlCXGNAbFWnADRR/candtJEZ0Naj4Ip4c/T1Jy01+byqxJfWkZJF/EP4qBN++
 7ZI7Y0DcgcUE8TneLRSH1xlk190nQD2Yup89mx1/ap/XzcSl0sbHyoGjSfZFQIn7aNMk
 NuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793101; x=1694397901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ND9TWls6WljGZ9WIziWPWxaNspuAqLv4XdjEfOK8lUI=;
 b=g+12poE532r9xrMPH8Wygk/1oegVO7x10loWDUSQtb9zfYxXEAgOEZQO4WQb6HayJN
 KEPipT6SEPrP1K1q5xxJNRlnKzlh5PDuBu3FeXMaFkNgaueFHDVOxWPfcW6Rpm9ux55i
 AuC6NZjPrE8KJcPMtTJ64EXSl7qGjJ9Fgtki+hbzIyLmy5Wpa9nw3GDbQb21ZbX2HCMk
 mRiz2vcGRtFf0ik8rptR36psyiVoR6vrwgIihz7/vkBl6sdMQDNIFt1+FEYkx8MdguT1
 chIhRH3y6evfadQ7zT1V4arTyPM1Z2SHYR6yxyU1IUFAn8NBAA7Pg0ZWUnPwg6iverkM
 sa4A==
X-Gm-Message-State: AOJu0YwedKVSyAMDTUkBLe9J47W0wmWeZeGakVdx4zesEWPUuidPZDlz
 Kr+4MT9VqQtZtOqCiIhp8fPEpQ==
X-Google-Smtp-Source: AGHT+IFWbfGA5SPwQb9KAW491TGzx4BsLhxrFJCHwvDlY00nbTmmGEYFV+xN3Jn9gSryCqTk/mI8/A==
X-Received: by 2002:a2e:8608:0:b0:2bc:dada:dbe0 with SMTP id
 a8-20020a2e8608000000b002bcdadadbe0mr6270880lji.10.1693793101188; 
 Sun, 03 Sep 2023 19:05:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
Date: Mon,  4 Sep 2023 05:04:54 +0300
Message-Id: <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
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

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d18236bd98e6..ca1296379c4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf ||
-		    !phys_enc->hw_intf->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "");
-	} else {
-		if (!phys_enc->hw_pp ||
-		    !phys_enc->hw_pp->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+	/*
+	 * TODO: if/when resource allocation is refactored, move this to a
+	 * place where the driver can actually return an error.
+	 */
+	if (!phys_enc->has_intf_te &&
+	    (!phys_enc->hw_pp ||
+	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
+		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return;
 	}
 
+	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
+			 phys_enc->hw_intf ? phys_enc->hw_intf->idx - INTF_0 : -1,
+			 phys_enc->hw_pp ? phys_enc->hw_pp->idx - PINGPONG_0 : -1);
+
 	mode = &phys_enc->cached_mode;
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -768,10 +765,20 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* DPU before 5.0 use PINGPONG for TE handling */
 	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		phys_enc->has_intf_te = true;
 
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
+		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
-- 
2.39.2

