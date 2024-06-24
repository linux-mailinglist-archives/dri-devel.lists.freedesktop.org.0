Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8F9150AC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1F610E4AA;
	Mon, 24 Jun 2024 14:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rdpP0T0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A9E10E49E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:26 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so2527535e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240445; x=1719845245; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=rdpP0T0h7UzIekVImvkzWl6DpXrn3srS1B7fnE1B0np6vUEKivEgpcgm7kchMA7p49
 rvSFwwr2WCMCcoLpZmx58T0BAfb8xDyC4j+u69fqTaU8UwGVao7KVPZPYJbzcrYABmQU
 1cOUAoDXmzPJOGJbxe33uL0jjJxYOlXnIFZh2lDqEDVtsM3btZfKTatu0rw2v3f7KqOL
 qUsmZH683g4Sji4cy9q8EIezfaYdDgXEpn2LUrGCjg02p/jo7yGA8ffbELtL6lPU2/Tb
 tULNMEolEs0O8QTKmGgzSbIKOh0LUmlMXuTjJxAPdqoqQv3SQa/ORDBEbfIN+dgF/NOF
 W5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240445; x=1719845245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=e6V3+DsaBJDUHKtUS2ITe4TuviD4zTYnHi0QDkUscKufn9ukZTsIp8Y5eA2OUNjD+D
 NiNYfgBkvHnlm/ZYukk+qMpWgdgvkO4+kNNaits97L2DKUktb20urp6EyfVH+H2upFwg
 e0tUe5E5HHiqDYw1h4p9lAvbiWCvrRK4n/m40/NoufQ5GZYAsOKvLzQ8GkCpHySON1OQ
 kBU7DqLl2NMj0uRk5twUuZ+tY6tvWAMEHupxMUqtnTnn1lF80BPRKZBToRFMYBpbLZGK
 fq4ebRv5d6TmVWdV4Y4B+1wp7jVvbnDOnSMWpa0g2SsnEC42Ecs6DkFKxtAOmj7hMVoZ
 ZtgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0FyCGIWdy5MbR63eX/DuF3Qw3rEGKKTccCUbjJZ+n4VqEQoqaSeWFv21BQMcf1qKilW1LzxWua60WdysHNsxZwLLV8Qt7w+ADWGRFpoZE
X-Gm-Message-State: AOJu0Yyl/ifZ66lyPALQgHuFMB3JCIzTVz5+jmfE/AJAJD2a/dz2sr7A
 djfZ6dzVJ8R8BML+sKgc+MGr2Z0guQUgGhhQEeTbv1kHvUZSDfKv6zVm+nuqlz4=
X-Google-Smtp-Source: AGHT+IE2tq5O6bSrI55XWg6dyvThtBg2EX196a2jkj5KUfUF2VK4A2DrFZtJeJOGcRqTct6QoQtMVg==
X-Received: by 2002:a05:6512:3da5:b0:52c:e3bd:c70b with SMTP id
 2adb3069b0e04-52ce3bdc788mr2974341e87.1.1719240444851; 
 Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:22 +0300
Subject: [PATCH v4 16/16] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-16-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbxG1j08vEex/AL+/BKNEehGKP1/V7s07UNY
 2qFA6lUUwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8QAKCRCLPIo+Aiko
 1cesB/9YdDl3hmZOd1LdElWwNw3tnumm7aoxG3qajMAgQoVZG9l5Af7/QSMFT5rJeg24+eT2xRR
 KwiOITmSJtgIX08d/mALiMq1UPSBaWRGRpT8Y+Lmtwd+lHH7HuDJbpLpQIkPjVswji7eNhr6Gyc
 f9qNh7lnuE+QWuockHzCMI3jGHfE7/TwlUq/G0gFzkREVIk6zILia3bs+obsGcVGsb+zogmvigQ
 JL5Ejw7z4DpQaBrXacCmVTY0UuFLgxxZzxTe61tuxhCuK1vZhs/d4/4KTGoU217byGDcQrKxxWQ
 f3WpUuRAT69uS7x/Z7Bs7Gvq78qbrbHJ2PTeeehDjzxL/aNw
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

