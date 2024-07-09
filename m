Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA28692B6A5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 13:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE51010E235;
	Tue,  9 Jul 2024 11:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RUK1f48D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36A10E502
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 11:15:48 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso583691666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720523747; x=1721128547; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iTDIAYS1v3Pxz5bKo9e6sLviKWQ74Nbc4ACLHcw546c=;
 b=RUK1f48D5ZiODtTg60VcU0FbKUZGiUH5SP3UYc/x1oua6r3Q87AdR7/QzXa/xduPo5
 UxbzMUd5y7Amg1DuF8TZ7UOcCBb3P1gBhCa+WJNekzY7rJ+xxHOYez6gYR50yp1s9jvY
 bMCXLHRyNKr5L4JTwF5YwIxaekawbreEg42YLnhjyEbX+xKLUYYqC2SvC7dBaPesVAT8
 U7uMiIj0Bsqs9u1vShij5qQU8rv16e1COFm9nO2XW38CLHGFTlkMs1SeH56LSiP1MOYC
 wXxGcwzrB0k3Ej0Zk/M6TB7CZv5BCAkBQTCGnzWmSTy2NBqlQQUHAPgNYp7Hev86/Kwv
 da1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720523747; x=1721128547;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iTDIAYS1v3Pxz5bKo9e6sLviKWQ74Nbc4ACLHcw546c=;
 b=Vhew/08YNumOhcOF5lJQiN58VDZkKEMQ0k31hqiJOg98B8YTTpPHrHrJbAp3dXS9KT
 5MrBPXXTA9iWzV/WjmTlvTr7Jtrf6xjhq6RFm2Uh8a3kTgaFaQNekaQeLWB8d7o8dMEC
 Afp3ml0r76JzEuTmrQc20a3B1iQ+A0VqtH9F6RAHn64TH9GyYhKC7Opj5TgNr/Gv8xp7
 bl/d+S5cOXH9o93I1+gtE7KmVuOyfVMwtP8PIMEEgEd/F4q5kib3rmkyuBbK6ZTZZHtZ
 /wXrRs9nD6/qS5auayDSDyGcydIbJXr9ztnxTgMrcgmCuLACyV5DQGN8J2AQgsZObyjB
 qMUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTRTxzHX87bOLOJY3RkyD8/dIOySMLYifJmXf83nZ6WyaVHwUx3LeAdszb5+KgjmnkDxZDbJyteHQYy8p4HyhuX2kPUcqaiBTqtO0zewKT
X-Gm-Message-State: AOJu0YyH71EbR6naUGvZJIlNUukKtTYYG5iZQ+7vb/7KDCsT+oltvQlw
 sqFt6z5Ao96CqoNfbz/8GRs9iDm2SC8y7clDyIXR4odU+q/Fb3MGg94ABDegpio=
X-Google-Smtp-Source: AGHT+IGp7EnF0TAVZ53RSFXeZuljBz7nakYWgnGbm0LiXhT2qOt1dQ9BYqAobTD4Vt/4QduRJSwTAw==
X-Received: by 2002:a17:907:9692:b0:a77:eb34:3b45 with SMTP id
 a640c23a62f3a-a780b6fe39cmr173001866b.36.1720523746920; 
 Tue, 09 Jul 2024 04:15:46 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6e06dcsm69527166b.87.2024.07.09.04.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 04:15:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 09 Jul 2024 13:15:40 +0200
Subject: [PATCH] drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-adreno_crash2-v1-1-9def36c3337d@linaro.org>
X-B4-Tracking: v=1; b=H4sIANsbjWYC/x3MQQqAIBBA0avErBNMgrKrRISNY81GY4wIpLsnL
 d/i/wKZhCnD1BQQujlzihVd2wAeLu6k2FeD0abXg7bqSiejcl4ophXF5cOoDm0IwdsNaYRankK
 Bn/86L+/7AYLBTV5lAAAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720523745; l=2106;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XIKVXG2FP4V3pnbSVcYW2sWKp3wew12zsDIFhsiuxm4=;
 b=BJPl9NqE6dAMkeZJadvcNFtD34BG63QModN0kwcUfSZ8DfUDTiyzg7FeP6R0h+A0hXu4BVmHM
 ZmTc1qdvFWbBePAdEXeg5pbxfrQlBiauB4GANnGbOUW13+HrSV7x0hr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

There are some cases, such as the one uncovered by Commit 46d4efcccc68
("drm/msm/a6xx: Avoid a nullptr dereference when speedbin setting fails")
where

msm_gpu_cleanup() : platform_set_drvdata(gpu->pdev, NULL);

is called on gpu->pdev == NULL, as the GPU device has not been fully
initialized yet.

Turns out that there's more than just the aforementioned path that
causes this to happen (e.g. the case when there's speedbin data in the
catalog, but opp-supported-hw is missing in DT).

Assigning msm_gpu->pdev earlier seems like the least painful solution
to this, therefore do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
There's no fixes tag on purpose, as there doesn't seem to be a good
single commit to blame.
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 1 +
 drivers/gpu/drm/msm/msm_gpu.c           | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1c6626747b98..949d65437704 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1083,6 +1083,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->chip_id = config->chip_id;
 
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
+	gpu->pdev = pdev;
 
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd..a274b8466423 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -931,7 +931,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (IS_ERR(gpu->gpu_cx))
 		gpu->gpu_cx = NULL;
 
-	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
 	msm_devfreq_init(gpu);

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-topic-adreno_crash2-1c9fffd9bce8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

