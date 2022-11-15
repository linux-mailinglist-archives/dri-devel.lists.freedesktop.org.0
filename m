Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF5629E2D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 16:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307810E41D;
	Tue, 15 Nov 2022 15:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC9110E41B;
 Tue, 15 Nov 2022 15:55:09 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id o13so13628101pgu.7;
 Tue, 15 Nov 2022 07:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C2pdDGcHzEOrC/CxVz6JXzn+8ROQCVIB4tco+V8khKI=;
 b=lmxiKTwU9EufjzjCqWK+4zeLsUn2z1+RhlDqnBGWCUbHSaVqWEsuteZADyBl0p5Jc1
 WS9Z28Ldft+0gHcHHNZo06DlJlxmD/EMdyHuIqgK0sKGn8mjn30raRGlh4kLzc6XvX0O
 WTUpPQfBNSOCuy8NeIZwUmXr8MO0JpTz4RR71M/U8parEak+4kx83OnhITFwli8nDzsL
 dZ0F5lnDFvo2Xw3CG7x8jG0turoh91KDLgHzCtpU3hBYfIA2jOcfyX1LivQl7Wsl38Fi
 gZcrBjAgiuMo+zjVeVbvuUW713bauncKWonnGhRFhD6L825P5jovH2qcszZgfSlMXhNc
 A/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C2pdDGcHzEOrC/CxVz6JXzn+8ROQCVIB4tco+V8khKI=;
 b=q0CVi1cA4XoGJRqLeO1QhRjoI8imVfANv7rytUMfvGDFOmpd/aKf+rxhPgc7LmWC0x
 jJtd6CDTr3DUpbiKiVkrtvcioWw5AH2sT6RviVXJWyE6hrxy9bAWiRMXozI2KlfYboWP
 VWmcKquK8UfQEwUsmgHwNxmPqr2ExSsEE4F4o9QDQdM9yQGY9y4OGmWKux0hGqc5p7Xb
 6WzLW9E5sHpU+yddWZ7WY4yTnzzDt2hMwzHmR5D6uASun6Ub8Zi/VPCzLzjQmOfUu1od
 fCMmZpbzr1/TF8dfGo51sJbt+JKB6pgkeLubSieOz7fQmG4OzbLDCK9SpEF016V/1Fjw
 ksvA==
X-Gm-Message-State: ANoB5pn+1yPpdoE+Zqd/ZCEeLrEdvEekDFOiJoom5NjJ4YIG94rH7Pkd
 tGGNbJ+XSBl0Te/C98Qv13tsf65VjrI=
X-Google-Smtp-Source: AA0mqf7v++J8wJlYIvd1JnXUJ2bJZVcaeIiHA7I/qToy2tlaCkZ7E0JMANpQu1t9KdE4xkibKJLdaA==
X-Received: by 2002:a63:6742:0:b0:46f:59af:c1f4 with SMTP id
 b63-20020a636742000000b0046f59afc1f4mr15728710pgc.344.1668527708582; 
 Tue, 15 Nov 2022 07:55:08 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b00176ab6a0d5fsm10014905plw.54.2022.11.15.07.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 07:55:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Enable clamp_to_idle for 7c3
Date: Tue, 15 Nov 2022 07:55:33 -0800
Message-Id: <20221115155535.1615278-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was overlooked.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ebe9599a8316..e495d8e192db 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2029,13 +2029,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 			adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
 		adreno_gpu->base.hw_apriv = true;
 
-	/*
-	 * For now only clamp to idle freq for devices where this is known not
-	 * to cause power supply issues:
-	 */
-	if (info && (info->revn == 618))
-		gpu->clamp_to_idle = true;
-
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
 	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
@@ -2050,6 +2043,13 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * For now only clamp to idle freq for devices where this is known not
+	 * to cause power supply issues:
+	 */
+	if (adreno_is_a618(adreno_gpu) || adreno_is_7c3(adreno_gpu))
+		gpu->clamp_to_idle = true;
+
 	/* Check if there is a GMU phandle and set it up */
 	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 
-- 
2.38.1

