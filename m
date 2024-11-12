Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC909C58D4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 14:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32110E01F;
	Tue, 12 Nov 2024 13:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dL8qCvPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115210E01F;
 Tue, 12 Nov 2024 13:20:07 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so49833115e9.1; 
 Tue, 12 Nov 2024 05:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731417606; x=1732022406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RJ1NMa1jB4YevqeHSrW28hy579MbHP2ndXxmXrQdAk=;
 b=dL8qCvPyLE2FxY9pgZkw3obNDOzTNDN3GWBICZ5XuPBFvSuAidVEqY43+2/Gs8Qlj1
 FZLy6PTv1A91c2oRu5vxAGceSLVBSqzg5MFhf1Ol788gLarMvhO1/I8GRH6mJvp8vE16
 9LSC0hYcR4tA1tIKrgFqZk0Wz9U1eXmm260xSSNWCZmqrMhOEBZiIFqxpkmWRiDx03/F
 Sw3JAkPjFI3KboNZ0NZ75YDxga7Itc2gDzR2BJQnHpKy/t2tiZzcNEQpJiWt1GQpUxl3
 3A3r92H3DNol+VZspMTgfqRO3emM8VYMC9z9QhZj2rjwg01zOVRF9tEfoOVJl9/SiCiB
 74rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731417606; x=1732022406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RJ1NMa1jB4YevqeHSrW28hy579MbHP2ndXxmXrQdAk=;
 b=NSFkD5SWsHOX1XYYh1ZJeUvP0SNJCr3Zj+H869IooCYxD5rHeX8Uq4WsiFsxJjThnB
 nQ49hXeXWAMdYKVgYPGm1+KY3KvmWnXBdXeFZJOhEfn+thWPiC9BcbJ6Srw0dRR1KuQv
 xLEAYpackJlf203NDuBSblnXKVZ6rVkloKY8QmgbvG9WNwQCBXfYL9QNzDBJ/RktvaF9
 jg5F2stA1DW/a87p0eJs55v+4BVx5hod9gSNKhVZlJePCtzVvfcJ8jkywgPxJXpRKg2S
 LoHlEXLybJsWzVze9dpzhFtUJZl253yBLIiWgzX9cw+MVWuLMJn0t7h3jMhHNzl4heUb
 yPYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVsigXbhiD2kKOaYEktRzdzc4WHhDj2zfLuEO93g7ESeu93iiZIo5QLn2dicdZ4dyKw40Qh8W2eAg=@lists.freedesktop.org,
 AJvYcCXmzVcQUjumjAjQt8WFTvMCF4Cs0cwwvhfMJPzYxXak/DdOPIwnMEAqNGtBE+rXJDAyaj7IDfjI6zBk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFrhjDLYxKgobyQn4CNpT2f043Q+xNF48LixOjHOKE2qhN8tLU
 XyKKqmpvl17H2LO1bVRCWOLcSD+SAuPUx6oRLt/obtbOOxtaLEHQ
X-Google-Smtp-Source: AGHT+IFcy+h3FVW2hUep37o/iKMxNs6TxUByEJOBaG0afG7vcce/Vvw2QMhVc2yIJKrMe/bSSHTQzA==
X-Received: by 2002:a05:6000:1a85:b0:37d:518f:995d with SMTP id
 ffacd0b85a97d-381f1835ba8mr15355680f8f.56.1731417605643; 
 Tue, 12 Nov 2024 05:20:05 -0800 (PST)
Received: from localhost ([194.120.133.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381fc0f5f91sm6940911f8f.62.2024.11.12.05.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 05:20:05 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a5xx: Fix dereference of pointer pdev before null
 check on pdev
Date: Tue, 12 Nov 2024 13:20:05 +0000
Message-Id: <20241112132005.469357-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pointer config is dereferencing pointer pdev before pdev is null
checked, this could lead to a potential null pointer dereference on pdev.
Fix this by only assinging config after pdev has been null checked.

Fixes: 736a93273656 ("drm/msm/a5xx: really check for A510 in a5xx_gpu_init")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..e83081346059 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1753,7 +1753,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
-	struct adreno_platform_config *config = pdev->dev.platform_data;
+	struct adreno_platform_config *config;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1764,6 +1764,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
 		return ERR_PTR(-ENXIO);
 	}
+	config = pdev->dev.platform_data;
 
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
-- 
2.39.5

