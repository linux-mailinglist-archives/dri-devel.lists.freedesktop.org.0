Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A9991508D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8528510E482;
	Mon, 24 Jun 2024 14:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GMYVu7p5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B5310E481
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:17 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce6c93103so1259752e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240435; x=1719845235; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
 b=GMYVu7p5ssfkhAmcsYTe8E2OJjGHm68wM2e+FBMGUl/X61J+aauNxqMXq8QEIKWW+Y
 j5f4lCOrGmeJuJhzVEvCVZVqX511S66vcuhFO+1KxSeT4RpiNfFsZE/hOWT8RRLlhNy3
 6s6IBUwF3syA68966bT3GYNfauLNR0zRhHvuPpqfxPM2hl1vn4FpfjFEaq/JKJuG8+Cl
 i2b30FpieJoWDkSEyIMgaYqY8gDw01VsF4Cz25mB5wmOg0SnZhm5XSjXftryHQ4RmXNS
 sya4eis7CGpA8hFgj/tOJ1DYNMNTL7oaiFkxddZDtaYQpPbP8JfG0hN+Phba0bphDl9r
 ghZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240435; x=1719845235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VRgd5asHo3we7JJsAH8XR2VQncsaeqG+/tWCDM9GWs=;
 b=miJhgkt304rFB+zuQtw6R8nI5GvBphrrsrBcVQmB9OEA5J/D7Bv9oJ+SQCV0VuZBXo
 Cca9A7sm46OyHtTlNkLCnZnilIyrFtowh/7fNmvTczN90RTatt8/9Oa9vGXPewQIySYS
 WXK2TZRhxjleyuVieoJMmhLH5x8gJHtNlrHy7Gr016EGuW3k2AklzS3K+LHee+M7KYsM
 yJ70a8n1F4mRNBcNG+CMiL9GY3buEWtuj5NdUDzk0DQywNXiTgF3ulAlA1DSmOft4GpZ
 E6mVtJqLMcTcn6abkC9tl9msi+hNnWxFGnjSQwl/d7g6SD+JVofupqVr1V69sxc2jAHI
 vuFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpokceMkdHDptSmM0hGOetumMgl9zasMBjBclhELJNnXUpq127s7IygSq+tLuN6qkeGcQKaeuP9VYMxvdNrWtQAQikZlZhZd1uFrXkEsPk
X-Gm-Message-State: AOJu0YzFQWjPBYY7Lfgh3oiD7Gw7PEg/iYtA5aa/R0lG6Ytqan7ul/tr
 9sZPEwd9EgxFxGx2JbVFfQNxejmEG/12ZwEP5JmCERgTmHWsFosIA1Ts8Mp+WlU=
X-Google-Smtp-Source: AGHT+IG9XQZH8vVq5U1wPy03/Dvvg6G4k8zrzQteJbpTunyDlaiRdE1Gt9CrbeLQb42jxx0g8S8k4g==
X-Received: by 2002:ac2:5323:0:b0:52b:c08d:2da4 with SMTP id
 2adb3069b0e04-52ce1832bb1mr3251520e87.25.1719240435499; 
 Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:08 +0300
Subject: [PATCH v4 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-2-1038c13da3a5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7vP7o0FochLbD0Xxzl9C2B538GRcwP3COb8crkPmUOU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbuJwKa24N4M3csWqmLjl/yvXWGrIS5Dbxc/
 fnHgz2KVlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7gAKCRCLPIo+Aiko
 1etuB/oC/397sgNrRpSvQW3fYMrq4rjPdn53SDAEGzYshP1DLO0GM7Axckw0GgwOGDG9SKNvfrF
 wA11CMfdcB1BCrgedxzmu25sDLHGQIoIB0H+a5X6fnLaQoqYt9H7jshYymwHugSNClQdSODpDJN
 VK0oUzbNSL8X2OwxmpVRuU2/KLdH8/BW3yc+AJL2lnFZGeGKGiSJXdjug/fz5DyVp8J/mXaa/Ek
 bReNuzxc5kPlv48WomDg9DjdoMUU/Lg5/FkX1scY8zojVeOsJO9J1h/u5sxuOS3zFxcTVVway4H
 u+f2MUbBxirh6ugA9Qyf+T/KheEQSaVndcrCZ3MJaw9EtRzC
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

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. Use indices check instead.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5d205e09cf45..7613005fbfea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1186,7 +1186,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		if (i >= num_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;

-- 
2.39.2

