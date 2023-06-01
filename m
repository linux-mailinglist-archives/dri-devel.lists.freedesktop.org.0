Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8E71F0AB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECB010E5A6;
	Thu,  1 Jun 2023 17:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B0D10E59B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:22:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f3bb395e69so1541620e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685640162; x=1688232162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uszklEUt7TcVwD9KcCnqW+XdFVglmQC2gN3N+u5zZiw=;
 b=MOIIbINfZofijQbnfqkhAvi0wvZ9VzFQldIkkGLku/RTct2zAZX9+1XeRNyqxvLmei
 AvuVdJ2818X4c4kPdEMTqKS/b7xHyLLaNIB4oXQMzNz0OEjoopR3iwoR+yzIRFZ+5wd5
 hYHERDZa+KRrg4Fee00/6ufkKd0QEI3EHs6M1rU6/01snrd6gicXPJcsm+ObPE72R+of
 vdYwWEoVQcpEVIDOlj9KUVacElOx3DmDqOQVf5Pegcwtj0nsSWpFBEcteQgj4iB0zNOe
 kO2liTng1GiHB7ZQ3vyLW2BKcFIlv7OEZkQnlrTPlPa1mcSaO9FlPNIFH8QY9SxwWNKu
 XTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685640162; x=1688232162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uszklEUt7TcVwD9KcCnqW+XdFVglmQC2gN3N+u5zZiw=;
 b=DwgE/MIZgilG03//SNe7RpdODZ9Fs4NChLeW7qSQzYgCvL1/8TbtiIiN2O+VYE3UVv
 MbcHcrH7vSqiWwNdvvGWCagmiJYhiyyqBZYB3VyAAwoYjsUu17dMOoQAj6luS4W4FNyK
 gZNdfgLKWpSU10lfA/v0Fta1cCzDyi9rN/5dX65dssmnWIrsCBnGbxZr3+7NFn18uCLZ
 +1HSlsZGxZrwGZuQn8sDy5aHBrLWgDGP25tnxtI/JWu7zdGs06vBzSSKn2ajiU4oZbNv
 73rdmHDp381A2+jej67Yfn8KFWDKuT/O3DmGmFVd38wDuBzgXFU/m1WWhKLwqnyQqJIS
 G+MQ==
X-Gm-Message-State: AC+VfDxzoYsC7nxU6DFxJfFfI+S4vmlFjpW1OUOgZmwcQfyW7qet8qmP
 iRIVU2lpFofu/Kq/z/jyzxi00A==
X-Google-Smtp-Source: ACHHUZ5ZacCiA/+9jxIKQm/6C3XAijP2X8lKjCIwg2bb3952XAuKJxdZ/8pny9phhJdB2Fff3s7hww==
X-Received: by 2002:ac2:5289:0:b0:4e9:bf52:7898 with SMTP id
 q9-20020ac25289000000b004e9bf527898mr361983lfm.37.1685640162113; 
 Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 5/7] drm/msm/dpu: call dpu_rm_get_intf() from
 dpu_encoder_get_intf()
Date: Thu,  1 Jun 2023 20:22:34 +0300
Message-Id: <20230601172236.564445-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

There is little sense to get intf index just to call dpu_rm_get_intf()
on it. Move dpu_rm_get_intf() call to dpu_encoder_get_intf() function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 94432451e175..c04b551c9d34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1270,22 +1270,23 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
+		struct dpu_rm *dpu_rm,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
 
 	if (type == INTF_WB)
-		return INTF_MAX;
+		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
 		if (catalog->intf[i].type == type
 		    && catalog->intf[i].controller_id == controller_id) {
-			return catalog->intf[i].id;
+			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
 	}
 
-	return INTF_MAX;
+	return NULL;
 }
 
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
@@ -2262,7 +2263,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 * h_tile_instance_ids[2] = {1, 0}; DSI1 = left, DSI0 = right
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
-		enum dpu_intf intf_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2276,12 +2276,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
-							    disp_info->intf_type,
-							    controller_id);
-
-		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
-			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
+		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
+							   disp_info->intf_type,
+							   controller_id);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
@@ -2305,7 +2302,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 			DPU_ERROR_ENC(dpu_enc, "failed to add phys encs\n");
 			break;
 		}
-
 	}
 
 	mutex_unlock(&dpu_enc->enc_lock);
-- 
2.39.2

