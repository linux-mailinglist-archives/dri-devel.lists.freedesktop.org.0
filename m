Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75B9E2B1A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E6710EB1A;
	Tue,  3 Dec 2024 18:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ME9FIBXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B7210E480;
 Tue,  3 Dec 2024 17:40:16 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53ddd4705f8so34572e87.0; 
 Tue, 03 Dec 2024 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733247614; x=1733852414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZLoDQcpgOLaU1lTyglYhkfpr6ByPhvEjXW697nSqBw=;
 b=ME9FIBXY9PAQDdP4kcgYbojRxtzdZbyEM2M3sd9HFVuEnFhRx2OCfN/BkOuH4hqINY
 5RlQaJcPMrw1OECE6HZurJMbZAuWv2FuuDu+NZ7sNRewrf/oTFTHUhTGztYqZRR7WxTm
 Z+tMpR/16fNVtZlXURuKJoitGgEyv1NbrXuHWtPYJ1RVQDr2p9OQaJW9Pzo9a34KwAcU
 NXbIo+4cGBZMK+0+YXWAJYDg5B1dtKu4riu9G0XtOEzceuv8tcOqJcxHQAtKqYT+NX+1
 rwSjvV8KpRAa3dNvzwTlbhksteb3JlAuMZVR3aU0Ppih9Tfrtfel0BVZM8EXG4YbQJo2
 MWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733247614; x=1733852414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZLoDQcpgOLaU1lTyglYhkfpr6ByPhvEjXW697nSqBw=;
 b=skr0wFKWqtMAPX8OSJSNFB6AwD5T9POWk70gqNWO/U7uwC+ymok4vnkxU/X9H5N6e3
 L4c0kS9mOd2pTkB7omCqQgYaxgPlOsgYMXzT3KtYdlEfiF5VKvnxBQrKhQruc66DcaI/
 2wCmgWEPCENKHjs3KouHBJi9Ff9hJUKGrZo1n68x5WjNjz/FpPnhwmbDK8G/RRH6Rnus
 qB1W4o10e4qM45YemOGRCPQ9NrzQsPyUOY7+Uoo69P8VuPyQAxtTTsEJ+wUMHwa6ZQPp
 MTZ0WFmFuBJaZrTMet/4kZV8mGqy/fSnZ57K357NN1N1kRITWihcld0CEa60W4dXPc+w
 rh8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpXaQiZlbpgOB1cJID0I58LHzUyIncbvB+77jt8mMr51quAnLNXUqMR7kUpPCQkUvWl9JCDTw+nbsm@lists.freedesktop.org,
 AJvYcCUqfSGeJO0DyRkSfdYT05gFdPj8iAA5qGRmD0Qs+8k185BDGLTPfllJtUGfrJfYQQ8/+Yw/IsMK8og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyA/JRS2Ple5dohFgvywyaozYOs1hOTO6oyOyAUH0eQFCc23Kh8
 6iufrGGXemw8yP8YrO0g77TisuIJmgisJG716D6Weq27N4x1NWyJ
X-Gm-Gg: ASbGncsK8SvymQ8M4gPWEhs5J+WXN0H0gxe/9vFmcXz8PsGfHw1+87Swp0IUV2Tdyn0
 t40Msbe4NXPkMyrquke9fFtTLmdQfRWn0hdxg6VtZbXIIptZIrm6vu4ybmzBTXhJ8RgBeBsAUbv
 4V7ZP5tjCQmQqAHYGbUJgCssr0EyCt8dglYVNaTfVijUpMDce1hMRATxpfzSl63kEaym9qI4cJb
 cu3cFhjbh7dAHy+6y4hYGOb6vCZKbCrnxO2QJHn+qp6mJplP80Ja8f7/LiE/nX1COyKQA==
X-Google-Smtp-Source: AGHT+IFBeguOEs/5r8tFomlRKvXO/Ie/OibumYMOZDeYaNma/fUtVKdR67ULZbcLJfWAkVYlemVSVg==
X-Received: by 2002:a05:6512:3f0b:b0:53d:f63a:e428 with SMTP id
 2adb3069b0e04-53df63ae481mr8296012e87.27.1733247613984; 
 Tue, 03 Dec 2024 09:40:13 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df644aab7sm1912115e87.106.2024.12.03.09.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:40:13 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, danylo.piliaiev@gmail.com
Subject: [PATCH v2 1/1] drm/msm: Expose uche trap base via uapi
Date: Tue,  3 Dec 2024 18:40:11 +0100
Message-ID: <20241203174011.731980-2-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203174011.731980-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203174011.731980-1-dpiliaiev@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:39:38 +0000
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

On at least a6xx+, shader could read 64b ALWAYSON counter
from UCHE_TRAP_BASE+0 address. In Mesa it will be used
to implement VK_KHR_shader_clock and GL_ARB_shader_clock.
These extensions provide shader functions to query a real-time or
monotonically incrementing counter at the subgroup level or
across the device level.

On a4xx and a5xx it was not tested what is at UCHE_TRAP_BASE
address, there uche trap base is exposed just for completeness.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
---
Changes in v2:
- Rebased on top of https://patchwork.freedesktop.org/series/141667/
  in order to return error via UERR when there is no uche trap base.
- Updated commit message to explain why we need to expose the value.

---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 50c490b492f0..f1b18a6663f7 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
 
 	/* Disable L2 bypass to avoid UCHE out of bounds errors */
-	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
-	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
+	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
 
 	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
 			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
@@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
+	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
+
 	if (!gpu->aspace) {
 		/* TODO we think it is possible to configure the GPU to
 		 * restrict access to VRAM carveout.  But the required
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..caf2c0a7a29f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
 
 	/* Disable L2 bypass in the UCHE */
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
+	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
 
 	/* Set the GMEM VA range (0 to gpu->gmem) */
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
@@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->ubwc_config.macrotile_mode = 0;
 	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
 
+	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..0ae29a7c8a4d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Disable L2 bypass in the UCHE */
 	if (adreno_is_a7xx(adreno_gpu)) {
-		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
+		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
 	} else {
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
+		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
 	}
 
 	if (!(adreno_is_a650_family(adreno_gpu) ||
@@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		}
 	}
 
+	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
+
 	if (gpu->aspace)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9649c0bd0a38..422b5b8b1197 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -386,6 +386,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = adreno_gpu->ubwc_config.macrotile_mode;
 		return 0;
+	case MSM_PARAM_UCHE_TRAP_BASE:
+		if (adreno_gpu->uche_trap_base == 0)
+			return UERR(EINVAL, drm, "no uche trap base");
+		*value = adreno_gpu->uche_trap_base;
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..9bd38dda4308 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -253,6 +253,8 @@ struct adreno_gpu {
 	bool gmu_is_wrapper;
 
 	bool has_ray_tracing;
+
+	u64 uche_trap_base;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b916aab80dde..2342cb90857e 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -90,6 +90,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
+#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.46.2

