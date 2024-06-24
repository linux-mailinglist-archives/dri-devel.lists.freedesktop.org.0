Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0399158A6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C3710E58C;
	Mon, 24 Jun 2024 21:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EPyLrVdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139F110E583
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:14:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52ce674da85so1512138e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263638; x=1719868438; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=EPyLrVdddpxwt1w4Ioas344x5dU1ub6eODlIlxgZyoB1MYSJwTejD1JWTFYLyJj8sN
 KYkPxdZop7vMSwOUjCw7kgPNa6jMl+Vp4Iq1S+av4vY1BdLJMaYL+s7vZVxIi0N8U8NG
 GAlYeecgU0NtEpfxKFxfgoZFJSnEDlXRpQy/ylHSiGHmz15CqYHcMxwLIFoRKeBvf0OG
 oADtM16ZgXKAsWc2BjBMcI3icZ9LZfEPjDe8amVXfdJTXM2CDij0heZz0ylbCcIHNmcB
 lF01uqN/+Hce0B3XSMQ44OcdnD1k/7Tr3TUCubV0pnMqrZWXF5lST93wfKe8mSZ9NJP/
 BITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263638; x=1719868438;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=WoyPc3j/AJm4gVR90xYPECqEv3ZHHMD5WkSQUj+tVjNLlznh8tAj0cXQDf+9AX4qg4
 69rzUz5xJqY9yU59KpGlrpy3HMuJ0jwTo00rm10rh2JwQhH3IUa2rsDjC4RhTboM62jU
 ntPbSWlBkR/fPTzHjUHB5v9X90kDzY+IGYq8hOtCTu/NBZqvXniowXnwH9v8sm4TFgRe
 P0jDgpz7VUjvX5bZuZpaWZGERi9vZUE5XyvYgnYiP9hTLFPSvxM28clzAjr2nmQELr3o
 /2DGY9xxJTiKqv7IGnDrk4wvOOKLxB+TXzIyg37OdAZ4L6TybtJV3nv7cbOJWDvMC5f0
 r5dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWR9z32nv9UGsNP5g2/ytXiGteeM6yti/176soI1DpCStrGDTc2sn26nXPRdvV96sM3MQXvEiqEwfpqTgMI6hPgDDee4cGNIz1PhKjn0Df
X-Gm-Message-State: AOJu0Yx634a+DgvI59s9rHpMzkBNDKB5l8Dx2JFq/SuRZI8njASPxVcC
 /Rp9IhugYNeYKYW6qQ5XpWckKeij3Wm3LCV6pa363KlV6uiiIBJUDDc68FNwbTg=
X-Google-Smtp-Source: AGHT+IEmY+P+wMqwNtmzmS+y3X/vc34LWCTNENhVeVAk/uMKzvKiYLYLXlBfXFsGoAgZ2rgw5dlvcA==
X-Received: by 2002:a05:6512:5d5:b0:52c:dd3d:85af with SMTP id
 2adb3069b0e04-52ce183531bmr3549457e87.25.1719263638303; 
 Mon, 24 Jun 2024 14:13:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:56 +0300
Subject: [PATCH v5 16/16] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-16-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJ3W6nxzLLrhDKnT+F7nbXuEjMtQWwODlOG
 daPmsQiNJOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1eJjB/45YnYDuHZnbUk62JBC3kcTUAeC2/V2+VDRd9jPMmDam6QGNdIyNx7Qi9slvsAXF1qNxbc
 oDiNVbKIjvzqnDzDarpLogMyBvnNbZdV0VaUhdtI2/46Yml0P/bzkzS+DegzFIFfvQTaQ22OsL2
 +L28OkDfO9/n5/8LqXeeq5u7jd5brGMMd0J6NXCXVPcjM2NYMGLkvhdu3pvK9qN+svFVyC0L1aD
 v2CqpRf/+lQSqKxgx7FEtAcGOaenQpuui5QE8XdL9cGJD3AuYPDCXF1tOiZCRPbGHJfpbVV0MQ1
 Su4SjvXVLVtbtWSGOyO6+SPKFAzrsT2scKxH1t9Dh+0CHjdo
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

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2a87dd7188b8..f4ec3df45536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1235,6 +1235,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is
+	 * is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1450,6 +1464,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 40e4b829b9da..1c86f22859fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1191,13 +1191,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2

