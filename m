Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109559E2B17
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8359310EB0A;
	Tue,  3 Dec 2024 18:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TIbj15zB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9E010E9C6;
 Tue,  3 Dec 2024 09:59:25 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5d0bf6ac35aso2508990a12.1; 
 Tue, 03 Dec 2024 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733219964; x=1733824764; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAdT/AkYZrS/JPMTUkdta47w083O08CKaY0xULIptt0=;
 b=TIbj15zBw6rSCdwHL6NH+aU5jE2Ae+0UE9s7bxWnJjz+9wHpLUau1A/Img+R5/OmpD
 Ck89V2BST1aFGuh4MFSzUNW9YaRaX+7dze9ZQz42HWX8KJ/+hUX0TW/LEwy7WB4ggZcn
 6ZeZtYYpVjsL1+R5gJjXumGEp6BxWgC83eoAkWKGF6FEtXn6Gl1KAuw/r6CkKuw5M0Xi
 SqurOS3jy2gFJIzt2l1ddbMPMDAlg4cGPis84kwVR8R2YNWea+rRU7WHBNQPS9aSWy+R
 o8On6M6mt4SHGX/zaJVu6qdiaejf3rBQkI91o4Op9MUr+pVtb20t72c1CnR9ZFDWaiH2
 iGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733219964; x=1733824764;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAdT/AkYZrS/JPMTUkdta47w083O08CKaY0xULIptt0=;
 b=uGBLyARUiOx6odrp8MywufWUxRbZAwRscEhiK6MdnciGRTqSaG7TbYJiYpkBQCMxVc
 7q13O/rLVWCgy0k5uvK8g+DUoNSLd+oWkvKQKbcmK79ZglpsI8ICi9awTS0VZppVDXt/
 oSt8Kj+pqCELjuV5tcE3onisD53wfVP4LlskmOnaiao15IVss5WCowuflCG0URbSKIxk
 KHnpkcoXQdCI0kqjXnlIvYgPdVNWCy4xPfzs6luMrPEMg+b3adifYclCqRfm72GSy+8M
 Gr+RWcSn44ZrVyFkC9+RmqTot8+kUNke6iHUaIS99LdkSUo8mT9o6zwZrsObQjH6qRpM
 3XSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVERXKRNIF6PuRoAu/8T8gwm+glxYfr3KpsBdmw7xCyRBDIl8BBHJkZ77TpX9SE6mEJ6pgDcuTw9fY=@lists.freedesktop.org,
 AJvYcCXzZ6lESqVLLJwXw5xQYP1fLlVlryxCC2tFmYAHhabTZmpHDA3SI63qGR6tHhDk4bHiV/zv9rGed1om@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyByL/NSdHDpWxuQmBLZX7lvzS7uWnP3bbyaaAHTRgYQDbQhK4v
 Ev/RzzcpJH4/XUNcl0H413DGz795yvhZuI9Ss3yU5HFnK04KU4A8kcneaydW
X-Gm-Gg: ASbGncuphrvvpihfZbqEHAholAaARCDFnv3/g/bCyLive+OaNeioNVrQxsrrYTJzGje
 f9+jU/XbR0zqh/QifGU9v4Dn1gt3duVhPw/DWdql2CxWGV37FJ8aMRsLXIlBnufP5biMl9bIXJa
 jHfUIiq7MHwID+hk4n1G02S+48ZiNInmn35zQIMm7yxiQ38kI1qSi9EXwReHij7aLD4wJQwdVLR
 PrIGf466iVz/6QtAVOCTvktOR6g3DsStqq0KW12iEn68oDHZnbymN7xeOT9xXAKaRXeNA==
X-Google-Smtp-Source: AGHT+IE+nKQiODkBKKztGbX5w++24oO3vwTU2xi/fRQzXUC8Vxl/wFOnwoz/+JerkyLYsF28728AGg==
X-Received: by 2002:a05:6402:35d1:b0:5d0:d786:b894 with SMTP id
 4fb4d7f45d1cf-5d10cb80107mr1823931a12.26.1733219963450; 
 Tue, 03 Dec 2024 01:59:23 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097d9f6b6sm5867365a12.2.2024.12.03.01.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:59:22 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, danylo.piliaiev@gmail.com
Subject: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Date: Tue,  3 Dec 2024 10:59:20 +0100
Message-ID: <20241203095920.505018-2-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203095920.505018-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
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

This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 23 insertions(+), 11 deletions(-)

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
index 076be0473eb5..774ff6eacb9f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = adreno_gpu->ubwc_config.macrotile_mode;
 		return 0;
+	case MSM_PARAM_UCHE_TRAP_BASE:
+		*value = adreno_gpu->uche_trap_base;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
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

