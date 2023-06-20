Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE514737332
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 19:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BA410E316;
	Tue, 20 Jun 2023 17:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790A10E30B;
 Tue, 20 Jun 2023 17:49:33 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b466305a7cso229226a34.0; 
 Tue, 20 Jun 2023 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687283372; x=1689875372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSIrQQ/RAIvwJvQNHy8+RLPlTtOHjfI9O1iuZkDZSv8=;
 b=M23cIlfHc2cWLrSZnqh1a6jAvzyxWCqU2OWymvDwDja39orDoZpcmOsG3NlMtVsxab
 t+8sMf1NDcNr7vVRrapkztZa8N5Nq6OqmW12ZJUHAF7kNuT7N4wNflGOUjjgWCKT7f4K
 C6yJ8tmxZlzFBkeY5gngk2RY6JMrATzMCh7QiaelGnBY4P6ikVhCreSoUsar7/DNjPBO
 DlB3w58AT1z6iJDgEuvfFYyYiQhoa4+fmJZYQZlngY6ILo2KC3ppT4FU74bg//27gUIa
 FT30fZuThRKTv+i7UghzSvWk7LQ5gYF6F4sLiynWlJJYo5CfLqGCwPzcfpMAMLfsL5jF
 YVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687283372; x=1689875372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSIrQQ/RAIvwJvQNHy8+RLPlTtOHjfI9O1iuZkDZSv8=;
 b=H4IdqMtlXgeSCJZCbn3trORMyB0/tGpuPgIOZ05SGgL4cLP+RG9xr6OWrqpbzwe+Zu
 IHdDfbj95o4Sj4vqVTZtps+cZoZRcbHanHxHFRTh/3nsla3q6gbNRpYyKr/8Dff4utYI
 QV1WUZrFbA5xOjVnTZFAdZ1fJK4HufEYz/XDyCM2o2+8E3GIFACXPevuoXwSJh888W05
 Lim/+Jpw3tk9p6KGTtDJRQw3l1UkFnCPMmedyWqkaLM+KtyZX3tJ4+8oclVG4OBIgK4D
 rhY7OgbH0KQKZJIBVEoC+ttui9AYiWMgB9atHc5a2IHYcGHBx7zc1DGAAvRbU2ZHxhv6
 i42g==
X-Gm-Message-State: AC+VfDwDOk+SQDIb5HQ0lP/0etoJRUqfHWSnVFDcFbz4k7SBrNqgjrx4
 GPi+XXF94BYzb9zRELgjyVg=
X-Google-Smtp-Source: ACHHUZ5v8ABMn9UdnlOi2nNJDH3HIEWaqObC3fr1PQ25fiJPBQ+Kr6HCcWoCdsMo9v2qyBOh8yQGRA==
X-Received: by 2002:a05:6830:620d:b0:6b4:6145:dfb2 with SMTP id
 cd13-20020a056830620d00b006b46145dfb2mr7655649otb.1.1687283372387; 
 Tue, 20 Jun 2023 10:49:32 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1e46:4f71:3f19:a267])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a9d7cd5000000b006a44338c8efsm1154892otn.44.2023.06.20.10.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:49:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 3/4] drm/msm/a4xx: Pass the revision information
Date: Tue, 20 Jun 2023 14:49:20 -0300
Message-Id: <20230620174921.898275-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620174921.898275-1-festevam@gmail.com>
References: <20230620174921.898275-1-festevam@gmail.com>
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
Cc: dmitry.baryshkov@linaro.org, Fabio Estevam <festevam@denx.de>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Commit cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified
before being set") exposes the need of setting the GPU revision fields
prior to using the adreno_is_xxx() functions.

Pass the GPU revision information to avoid run-time warning.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Build-tested only.

Changes since v1:
- None

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 715436cb3996..2ae072b4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -658,6 +658,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -684,6 +686,25 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
+	/*
+	 * We need to know the platform type before calling into adreno_gpu_init
+	 * so that the hw_apriv flag can be correctly set. Snoop into the info
+	 * and grab the revision number
+	 */
+	info = adreno_info(config->rev);
+	if (!info) {
+		ret = -EINVAL;
+		goto fail;
+	}
+
+	/* Assign these early so that we can use the is_aXYZ helpers */
+	/* Numeric revision IDs (e.g. 630) */
+	adreno_gpu->revn = info->revn;
+	/* New-style ADRENO_REV()-only */
+	adreno_gpu->rev = info->rev;
+	/* Quirk data */
+	adreno_gpu->info = info;
+
 	adreno_gpu->registers = adreno_is_a405(adreno_gpu) ? a405_registers :
 							     a4xx_registers;
 
-- 
2.34.1

