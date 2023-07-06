Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F174A59A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A154A10E4CA;
	Thu,  6 Jul 2023 21:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF6210E4C7;
 Thu,  6 Jul 2023 21:11:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b852785a65so8352265ad.0; 
 Thu, 06 Jul 2023 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677867; x=1691269867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lKfLr7XNPcJCQHURijcwAJxgI3TYjsU4oBWrQCb/FYQ=;
 b=ZUyPvibXyrTK4yboKfw06nbZ/LmYtbb+1MRK24yQqG7nKWPq4elV8C7TFUGLO8Yf6/
 7EtZNN4EkKDx/qHNlphI7MvSBY6MFm3Urp9Ufh2qXTgHDhICJdSw92ztSO6VnvHMd7JT
 k+rODgxwzRd4XqzTimw2ec64KTQ031WJjb0koEQwRsW6g92FBIau9CT80yDJy0ncQmMx
 SyJ+vlB0kHBIuPsE6kLit5wx6fjZ6xv5vxgjJkAjyDntkdqg7+1g7OtvDY7vbuwlcks2
 ufb8slxnrB3ybDU0MdFuPR+DtoU2xW5bT38is5C9PAAVMRcpd7htmKb+TkiJiRXi4Imy
 KXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677867; x=1691269867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lKfLr7XNPcJCQHURijcwAJxgI3TYjsU4oBWrQCb/FYQ=;
 b=ijaY7l7TO6goMEKayvkaeWUXObN35WIcgtvEngtXpV1UT/KThmqYpOeYFrdrAI6/w1
 +mc6OeSiy8P+ipy3TtF3oifQMOMfaJz++ikSZz3AJmb/nY2Irn04OYjZdD1zavHDpYIQ
 yDF4I+wGebvMl6kCqpo85R+sEiIWZSfspf60T7B0zAVtbFjBjBAUSRlvMu3977gzSXM+
 zMqy+lUsnJuT7yamfZqJO0xN58HgwYj0p9a7QzYuNnWum/u5B/STKMwht9h9sa4Ngu7k
 WJq7wQlMi4VhQ8+fdudtsYVpmisYwI/Vy6cknmdf38L3YNNTTCIQ/QnKKr1zSzfvOcZl
 g48A==
X-Gm-Message-State: ABy/qLbgaBMzHgqNQUkmRybEoFH3zwIbzdwKP4wCTxYLADO7abopLR1M
 nokdgm4FP0LNxXbNreSGQcUW9hb/qMs=
X-Google-Smtp-Source: APBJJlFKRQd31xkQDFA2a/mt8aPnhXSwslY/Tkvda/80a3DIf7C8PmSgUeqKciAQaWvdS2mR3c7chw==
X-Received: by 2002:a17:902:d4d2:b0:1b8:656f:76e7 with SMTP id
 o18-20020a170902d4d200b001b8656f76e7mr5162178plg.23.1688677867036; 
 Thu, 06 Jul 2023 14:11:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a170902c38900b001b876d5b23esm1824936plg.144.2023.07.06.14.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/msm/adreno: Use quirk identify hw_apriv
Date: Thu,  6 Jul 2023 14:10:37 -0700
Message-ID: <20230706211045.204925-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Rather than just open coding a list of gpu-id matches.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5ba8b5aca502..6f8c4381fa4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2489,8 +2489,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* Quirk data */
 	adreno_gpu->info = info;
 
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
-		adreno_gpu->base.hw_apriv = true;
+	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 326912284a95..f469f951a907 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
@@ -315,6 +316,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
@@ -327,6 +329,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
@@ -350,6 +353,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index d31e2d37c61b..a7c4a2c536e3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -32,6 +32,7 @@ enum {
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
+#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 
 struct adreno_rev {
 	uint8_t  core;
-- 
2.41.0

