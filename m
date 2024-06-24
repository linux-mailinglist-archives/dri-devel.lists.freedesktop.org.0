Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42CF9150A6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFD310E4A5;
	Mon, 24 Jun 2024 14:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UM1JLjkV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90210E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:25 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52cdebf9f6fso2605410e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240443; x=1719845243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
 b=UM1JLjkVjTanncnBHPWySOudmTrV9us4d7bkEWTm1pI+klgP1xFm6DrlaygY5HKxkQ
 PdFwjvDl/qJuUMzYAJd4ZJICWrDsvdCDaIOJ/9GY9C06Go5j8d8SiN5JfoskqwGdeXDC
 d4XjEWFjAlH/xDgSn5LuIQmEB+OwkSwO9gDCXYQMShF9sdAzrlVKFIJ4xTD11XSt2sym
 0HCIYpA5hoiY9XqIp/5oQmQ22zSSakcsg+8Gkn20482U+tHiI/hchHD2BAfHg1nf5KMR
 WoZT8KNp2RA0pae36Z/APdvQrYzP80d7hh7pRYeY1C1iE2ABOWauqGu+Ae3+yQ8rBaTZ
 biXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240443; x=1719845243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLeNak1YIohIAUEGI7HbWPLoyZnkDUw0ZR1m0kfOocM=;
 b=i7BuxfzsZm+BOGU1cukT3X5jaXnrUU07Evm1g6K/lynXbLGuyNuRtbJLPZMklznT5h
 vbIUzLhWrTCrKPboITGoTYqkBQuUREBRzsUVDqtHTZE2gftJdrEpbphWmfVcYgq+b9Fo
 ebUqkNzMOqnSxaz6WvlwmEL6ZPVZ4ZM/aorsFXABFiow+kkSDd/iE6p9lm1vlLSaur6n
 wvWC55qRXt14gznWTjp8biXHbf83QD+Gc9IBcy/N1If0iO2DbxBumtBjKwuwDXAOvznj
 sVgRc1zAHeSEJY2dT00LwOYgh16CW9FS+StWFdl3tKmuq0FxwNd5rNe4cX85oDDY1axF
 lMUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmXEOgWN7Wz1YBOlqZl+r41+dk8gmcr0zwM9ZpUwjUpRo2/IcPSrlh9sxtyJcH6r/tCClgial0s2yEB5sMNcWGXFpOc6oPPYOLrRIm7b92
X-Gm-Message-State: AOJu0YzG4g3VGAnyHAqYctkDl4oXb+QzpYAmQ+5EsDGH1LVLzcIxdPst
 /FEOSgq8JmXzEVZh/b6Z4PXb7AFXbaqhWwAn3p3cHNjFpF4fNIClM3VTIM2q58g=
X-Google-Smtp-Source: AGHT+IGV2jXTmAq5MqKAg19g+k6KP+0JooI2IY873ixMRNSqDGlFusMrG+d7Dz2rksdlMT0CLSzUMA==
X-Received: by 2002:ac2:5f4c:0:b0:52c:84a2:d848 with SMTP id
 2adb3069b0e04-52ce186272dmr3454109e87.65.1719240443604; 
 Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:20 +0300
Subject: [PATCH v4 14/16] drm/msm/dpu: check for the plane pitch overflow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-14-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+RF/P7K64SGg/tQu4deWbHOf+YbNZCIL5VEgg9w8tfc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbwypWamkbFYHq9xCHZcfNfWOlbHlrnsCxGg
 bTNoVOgA+iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8AAKCRCLPIo+Aiko
 1Xz0B/9Z9dIa7gvw1tz29gjmfw9mynEEq6c75eE8Dl0jOAaIhdd8r3QXg4E4UWFWzxN/fhoglZR
 795Au+mAhB/wRq4ARHBsaMjO+WTy4/ct5d9viewJWN699MF3NAmaTCDe7UQTYu6jHdmT49CEJ50
 ebg5FcWkDU7LwibB/zomy9M2ZetfyXaCjHCBSvRDbW8uWZRMCwIK5zYnbOHpKP+dIlK4m6CN8ET
 +MoZMA6BuJBhpV9j2Xdnq3pOD9Lg+xfzjF0EJlskA8r1L063Fg/8Eoydk13Rcklc4MMxcNI1Sv8
 LaZMXZRy9IwxdldlYXdU6okAgekN04HAmLheULbvg3JIXHDL
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

Check that the plane pitch doesn't overflow the maximum pitch size
allowed by the hardware.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 4a910b808687..8998d1862e16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -12,6 +12,8 @@
 
 struct dpu_hw_sspp;
 
+#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
+
 /**
  * Flags
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index a309b06b0992..a629eb3a6436 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -782,7 +782,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int i, ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -856,6 +856,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 	}
 
+	for (i = 0; i < pstate->layout.num_planes; i++)
+		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
+			return -E2BIG;
+
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;

-- 
2.39.2

