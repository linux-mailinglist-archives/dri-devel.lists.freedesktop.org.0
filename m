Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF87F8C9CFE
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE38410E65F;
	Mon, 20 May 2024 12:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X5bZSj5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D21110E615
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:12:51 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso5192390e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716207170; x=1716811970; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=keee18vyiohjBfgyo9UKfbBA5sVKxKV1c/ETLbjaR9s=;
 b=X5bZSj5b3VBzoqv6C+vU853uk57tLejdSsIeN21S80GTEZFaLSBma7uoMA6xK2DnNo
 l6f6OXXr77fz71LwdJo4Hl/41zYCJ2+ybK+WY406X9MQBLz4NT8Fc9Ah9oHuMPfqOGHT
 E0OPAl6rqfGNWSrB5wz8xEB4KGLXLlRn/lmLL/E+p6B4GcnghVqZmFIyHo/dod0S7A2J
 JBe1wW+GNKAuDyHFIOHaD4xD+n99cq7aSauvBt5A8GSa9of13pYHav/rE89Qw4JnME4k
 BmUpd2leku1T6z+e5A/zq0Ujc3MOzUeGSZnUYyhgTkdKb1JNserfxiBEvjqCU4+YCcqT
 u3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716207170; x=1716811970;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=keee18vyiohjBfgyo9UKfbBA5sVKxKV1c/ETLbjaR9s=;
 b=XhF9UAPbMnC7t7VzTrRoccMl4HpaBBII6DVqahLfaRSI5+hxOHfvOlQ0xSEm8SQEDt
 S+REBPDyYosog4B2HKbGq3C3K9sbCWHfYC2hqTqzpV1I3MUUIHOpgiig1y3xEfmYhydg
 J+0i8ZDvivkMx+25IA3oykKZSY8QG3BBDwgqLE+RG0ZJ5UHhTQ69S7gZjeCGpOXT15zn
 bkMMWn4mEdzrYwHc/AtTOe0Lg9+W7/fPL22k0nCcBiYFl9+AyCOlabS4jbrW+d/8jLRO
 QUpk3PLVGGUpjI4CZ/mm3wKQ5mc66DkjtuDT3XKJb8OgM5mOv8xR9YUtMeRvMp+JQeoS
 1sGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGWCokmDq9gL5SvRBIx/0zIX9CQYSfvMIGHxqNmmxxpFPLEav7cCHwRULSjVj1zgeQZiXFeBMUlcUlvw1xt6wZip0A8JHOi7o0fdg0bGik
X-Gm-Message-State: AOJu0Yzvchug2r6mvs862M9h0vycY6aDMLBD88oRhaFHoBpbHXRRB0oT
 OyptueNUVgf467+A+eopnaT3w/sN3zjAH8tFL5D+LYoG3tFRLkkuO/fy0zdt1a8=
X-Google-Smtp-Source: AGHT+IF6Mhvh250bABHjRxzDkj9uIsdB07MYJYgfIjq5uVOdCEnVKqMLdxmE8efNSAAbbYwjqx1KMg==
X-Received: by 2002:ac2:58d6:0:b0:523:b371:7b78 with SMTP id
 2adb3069b0e04-523b371837dmr8066261e87.13.1716207169840; 
 Mon, 20 May 2024 05:12:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 05:12:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:46 +0300
Subject: [PATCH 4/7] drm/msm/dpu: pull the is_cmd_mode out of
 _dpu_encoder_update_vsync_source()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-4-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bDRD6hyOiwSp4TuqfrUKy12qF1U6aueui3oZOXjqlN4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48rPmBSdBCPNcr0Nq4uZbzKAxnCAn9+N3ua
 l3iyx2kyeWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1SnOB/9b97fXE/ctQDf+BNb0r8haZVhTOA9gVVSIuS/CxtjyFcBl0xqbfoyy7HDqcYGQUXf96D5
 DiVsXnnEdODCvHMy9wyBO8lfpq5DapeRB+XmkZ6X424lZGw3XPze2Fu8kwq9J9WyiMRf46decbk
 MByl5kttundXLDlIiXnJvr3XpYT9GyKK/zVxBQhlpJk5ufKWpedVWI5eAd0Oaw67u1aGBImeHDq
 u4Y9eUtxdvLUcP+jdog4B301ApzKvbYCHHEVtSe56Cen301dQL1pm7evN95Gwu5XWpNapC6bDHL
 Letok6pJO2uU40lXqYVjUWjzZkFOdepwnVMcAoYHantl5j75
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting vsync source makes sense only for DSI CMD panels. Pull the
is_cmd_mode condition out of the function into the calling code, so that
it becomes more explicit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4988a1029431..bd37a56b4d03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -736,8 +736,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
-	if (hw_mdptop->ops.setup_vsync_source &&
-			disp_info->is_cmd_mode) {
+	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
@@ -1226,7 +1225,8 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
 			dpu_enc->cur_master->hw_mdptop);
 
-	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
+	if (dpu_enc->disp_info.is_cmd_mode)
+		_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {

-- 
2.39.2

