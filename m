Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BAA8FB7DC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1208710E539;
	Tue,  4 Jun 2024 15:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DdKUXaNu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5D710E535;
 Tue,  4 Jun 2024 15:48:50 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-6818eea9c3aso3530345a12.1; 
 Tue, 04 Jun 2024 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717516130; x=1718120930; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Q70FeNK1/2wRB7vpNO0oOJ1GgfoQ2PpKwWEQ3Wdqpg=;
 b=DdKUXaNu6INXmAYJNQbGDxABn91oEhPfzeMyXaeelWr91d2mgXl7+BKCQdnvbl6A2M
 2L6+vsJ0uSbQ4lpnJnzaAkEhT6iSSZhwJ2knpcZnAPArKdK/v77C3vq1VxTLrRAVwNuk
 25S8wcBFTJB8bf1Ykv70UWa9B9xuydjR4UW59BTLs7sBOiuri2rxOx5jPO4rpdLz31xW
 waDOaeHC6CvnkUEWmyvoSVYk7D50YzawMM6phoHDFmdrhGTQ9vJ7n4Uz5Sld7koBWxJS
 wGG2UFv68LrfQ/lOWlTX1nDpOxcm0wUjtadIGuekpwDsVXsj8M8yXA4T6dGahhiKZ5QJ
 6VIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717516130; x=1718120930;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Q70FeNK1/2wRB7vpNO0oOJ1GgfoQ2PpKwWEQ3Wdqpg=;
 b=d59O19DgRXmRFKKRKWNkB9KokTYsgV6x2GFA7NuY16FJnWs0lzj7OMsX7rKtL0AnkJ
 ezhwZNuxxB5ey3au/N2qJTRsqEwS16kitbWh9xJUKB9U/dCO4azKollth71RhlHwxVra
 syGeNS45ioId8mb1UDR4e2FnYmjtwOxIJTRJmtUW3H+Na0mmeJLSgi07v681NZdPQbJa
 w0Rrajy1+f9hfD2qnQZCJQDcKCz6Xh8Hs9zNYmFounQHrc86mE86/XgtssFfRITnTVs/
 ZFTHCx5pRP4p+m/vXIrN8t1o1zoYwtkY6liwQx0o+mkbmr5zC9Y3w3C0MCdpSmHwaENm
 PH5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkenR3ce02Ar/MQCiJv88ufKdviKhxxhxsMA1Um2TazDE1HfjEWkZBGsdlZ4zhUbhppn8N/tWG9j6NAdm5nmE78N1T9fsnh3MG/Zs89txU
X-Gm-Message-State: AOJu0YwPV4VztnZXTkBeIw0ZA0Am6ipP73Etwk2mj2pHY/GG2nvLd8Vf
 Ck1BF1+pa5Hn4e/3tE9lvB5UtHA9PE5VBT7qEqtEUOW4wZdA3q5j/uOZ3g==
X-Google-Smtp-Source: AGHT+IETdb/v65fN1hSr8RwtXZ9wGqMKKKZp/iq5lA8SpMG6PGllSWGbwuTvA5+zM0FaJ/bEI1ZTMA==
X-Received: by 2002:a17:90b:889:b0:2bd:f713:800e with SMTP id
 98e67ed59e1d1-2c1dc575163mr11404129a91.14.1717516129658; 
 Tue, 04 Jun 2024 08:48:49 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a775d5c3sm10792383a91.5.2024.06.04.08.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 08:48:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Print SQE fw version
Date: Tue,  4 Jun 2024 08:48:45 -0700
Message-ID: <20240604154846.500357-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add the SQE fw version to dmesg and devcoredump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 32 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 ++
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56bfb228808d..5a2a005003c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -665,6 +665,32 @@ static int a7xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static uint32_t get_ucode_version(const uint32_t *data)
+{
+	uint32_t version;
+
+	/* NOTE: compared to kgsl, we've already stripped off the first dword: */
+	version = data[0];
+
+	if ((version & 0xf) != 0xa)
+		return version;
+
+	version &= ~0xfff;
+	return  version | ((data[2] & 0xfff000) >> 12);
+}
+
+uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	uint32_t *buf = msm_gem_get_vaddr(a6xx_gpu->sqe_bo);
+	uint32_t version = get_ucode_version(buf);
+
+	msm_gem_put_vaddr(a6xx_gpu->sqe_bo);
+
+	return version;
+}
+
 /*
  * Check that the microcode version is new enough to include several key
  * security fixes. Return true if the ucode is safe.
@@ -681,6 +707,8 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	if (IS_ERR(buf))
 		return false;
 
+	DRM_DEV_INFO(&gpu->pdev->dev, "Have SQE version %03x\n", get_ucode_version(buf));
+
 	/* A7xx is safe! */
 	if (adreno_is_a7xx(adreno_gpu) || adreno_is_a702(adreno_gpu))
 		return true;
@@ -714,7 +742,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		}
 
 		DRM_DEV_ERROR(&gpu->pdev->dev,
-			"a630 SQE ucode is too old. Have version %x need at least %x\n",
+			"a630 SQE ucode is too old. Have version %03x need at least %03x\n",
 			buf[0] & 0xfff, 0x190);
 	} else if (!strcmp(sqe_name, "a650_sqe.fw")) {
 		if ((buf[0] & 0xfff) >= 0x095) {
@@ -723,7 +751,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		}
 
 		DRM_DEV_ERROR(&gpu->pdev->dev,
-			"a650 SQE ucode is too old. Have version %x need at least %x\n",
+			"a650 SQE ucode is too old. Have version %03x need at least %03x\n",
 			buf[0] & 0xfff, 0x095);
 	} else if (!strcmp(sqe_name, "a660_sqe.fw")) {
 		ret = true;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 1c3cc6df70fe..c206dab8bc08 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -109,6 +109,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended);
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
 
+uint32_t a6xx_get_sqe_version(struct msm_gpu *gpu);
 void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		struct drm_printer *p);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 0a7717a4fc2f..1acfe39eb8e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1957,6 +1957,8 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	adreno_show(gpu, state, p);
 
+	drm_printf(p, "sqe-version: 0x%08x\n", a6xx_get_sqe_version(gpu));
+
 	drm_puts(p, "gmu-log:\n");
 	if (a6xx_state->gmu_log) {
 		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
-- 
2.45.1

