Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E724619B08
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 16:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F3389A94;
	Fri,  4 Nov 2022 15:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB61C10E866;
 Fri,  4 Nov 2022 15:08:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so8484897pjk.2; 
 Fri, 04 Nov 2022 08:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l67drlOMjlbuXUK5so1ZjMU1uw6TeoDS8wjlIGiLg9o=;
 b=BuiGbfwr4O7X4q4peKVTr4G2GpMdkPIraxMN5KWO5IPTFBoXHk4X3mFnER9UE9vNRU
 nsqEUHjKdujfuZ6OzGKoOhwpoLamqmY7SzDi9VNJDH5j3gIA/eWH+A3L/O7apTd2zqwk
 j1YW+bn2KmWlvWzrRWMeN6rNZwRyn5xlvc35U4xcHqeFYM4joYIxboIub/vM0AIyvFZm
 VTCJjUzEcUD9Q/gYe4X20jy+8e2yyH/g9YJE300BGHj3ZoaPrXmMMJnd4yQhHlBcf1La
 BCXnoYyvVxPD1EgJtNfvwf1wNlDE6q9h/MVUUsSWkVdmTj7Px0YbCvrm2nEk+Xz7A7gv
 ygAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l67drlOMjlbuXUK5so1ZjMU1uw6TeoDS8wjlIGiLg9o=;
 b=7szj7Q4AFStxho4HBPHIASzd4eap0V+8z+WG9cvGi/1vC6U8BEOnV06IheOD9evmwB
 MGzk8sl1m4bmYz3SwS8TF+lucWSLO+gQ2GKqHesJHLmodSMQbHLUQqFvAU8b1MrFb0Ek
 yzDjsfEO99NPlR/4gwzj1OCYWPWfZKt0D7w6/JIZEVdltKm2akuL5y45HonZXmv/yFIc
 ncxjB8UQD+074A5k0RSaNI8tGf0lor1Ig0lwHDRLXWERc/LNWZ10j8mHrOSnBoyjaNdE
 aH8RxqtOLLAYmfjhykdN292jUsESVLDO24sub3sj+6SLI5ey9kqgi0rIMep4Njw5oEoL
 rBuQ==
X-Gm-Message-State: ACrzQf1gngxOV3NlnbwqeMZJjsi2lQV/NFCHJ/uf80URWeuIQuuDLv9L
 C/94Ki865ixRgTDwJkEmiUNGkehx9LQ=
X-Google-Smtp-Source: AMsMyM7i2KfCKkrRZkbPJTyvzkQhPO06OakZRaNuM5x9fX2ilWrmGoXSinbI475LHb8sR8ypNJhpCg==
X-Received: by 2002:a17:90b:1a81:b0:213:f71d:4895 with SMTP id
 ng1-20020a17090b1a8100b00213f71d4895mr24507040pjb.213.1667574510934; 
 Fri, 04 Nov 2022 08:08:30 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a63d60d000000b0046ae5cfc3d5sm2475505pgg.61.2022.11.04.08.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 08:08:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/2] drm/msm/adreno: Simplify read64/write64 helpers
Date: Fri,  4 Nov 2022 08:08:38 -0700
Message-Id: <20221104150847.525173-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104150847.525173-1-robdclark@gmail.com>
References: <20221104150847.525173-1-robdclark@gmail.com>
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
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The _HI reg is always following the _LO reg, so no need to pass these
offsets seprately.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++++++-------------
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 24 ++++++------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +--
 drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++-----
 6 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 7cb8d9849c07..a10feb8a4194 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -606,8 +606,7 @@ static int a4xx_pm_suspend(struct msm_gpu *gpu) {
 
 static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
-	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO,
-		REG_A4XX_RBBM_PERFCTR_CP_0_HI);
+	*value = gpu_read64(gpu, REG_A4XX_RBBM_PERFCTR_CP_0_LO);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 3dcec7acb384..ba22d3c918bc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -605,11 +605,9 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
 		a5xx_ucode_check_version(a5xx_gpu, a5xx_gpu->pfp_bo);
 	}
 
-	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO,
-		REG_A5XX_CP_ME_INSTR_BASE_HI, a5xx_gpu->pm4_iova);
+	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO, a5xx_gpu->pm4_iova);
 
-	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO,
-		REG_A5XX_CP_PFP_INSTR_BASE_HI, a5xx_gpu->pfp_iova);
+	gpu_write64(gpu, REG_A5XX_CP_PFP_INSTR_BASE_LO, a5xx_gpu->pfp_iova);
 
 	return 0;
 }
@@ -868,8 +866,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	 * memory rendering at this point in time and we don't want to block off
 	 * part of the virtual memory space.
 	 */
-	gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
-		REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
+	gpu_write64(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
 	/* Put the GPU into 64 bit by default */
@@ -908,8 +905,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		return ret;
 
 	/* Set the ringbuffer address */
-	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
-		gpu->rb[0]->iova);
+	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, gpu->rb[0]->iova);
 
 	/*
 	 * If the microcode supports the WHERE_AM_I opcode then we can use that
@@ -936,7 +932,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		}
 
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
-			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
+			    shadowptr(a5xx_gpu, gpu->rb[0]));
 	} else if (gpu->nr_rings > 1) {
 		/* Disable preemption if WHERE_AM_I isn't available */
 		a5xx_preempt_fini(gpu);
@@ -1239,9 +1235,9 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A5XX_RBBM_STATUS),
 		gpu_read(gpu, REG_A5XX_CP_RB_RPTR),
 		gpu_read(gpu, REG_A5XX_CP_RB_WPTR),
-		gpu_read64(gpu, REG_A5XX_CP_IB1_BASE, REG_A5XX_CP_IB1_BASE_HI),
+		gpu_read64(gpu, REG_A5XX_CP_IB1_BASE),
 		gpu_read(gpu, REG_A5XX_CP_IB1_BUFSZ),
-		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE, REG_A5XX_CP_IB2_BASE_HI),
+		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
 		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
 
 	/* Turn off the hangcheck timer to keep it from bothering us */
@@ -1427,8 +1423,7 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 {
-	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO,
-		REG_A5XX_RBBM_ALWAYSON_COUNTER_HI);
+	*value = gpu_read64(gpu, REG_A5XX_RBBM_ALWAYSON_COUNTER_LO);
 
 	return 0;
 }
@@ -1465,8 +1460,7 @@ static int a5xx_crashdumper_run(struct msm_gpu *gpu,
 	if (IS_ERR_OR_NULL(dumper->ptr))
 		return -EINVAL;
 
-	gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO,
-		REG_A5XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
+	gpu_write64(gpu, REG_A5XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
 
 	gpu_write(gpu, REG_A5XX_CP_CRASH_DUMP_CNTL, 1);
 
@@ -1666,8 +1660,7 @@ static u64 a5xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 {
 	u64 busy_cycles;
 
-	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO,
-			REG_A5XX_RBBM_PERFCTR_RBBM_0_HI);
+	busy_cycles = gpu_read64(gpu, REG_A5XX_RBBM_PERFCTR_RBBM_0_LO);
 	*out_sample_rate = clk_get_rate(gpu->core_clk);
 
 	return busy_cycles;
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 8abc9a2b114a..7658e89844b4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -137,7 +137,6 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu)
 
 	/* Set the address of the incoming preemption record */
 	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_LO,
-		REG_A5XX_CP_CONTEXT_SWITCH_RESTORE_ADDR_HI,
 		a5xx_gpu->preempt_iova[ring->id]);
 
 	a5xx_gpu->next_ring = ring;
@@ -211,8 +210,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Write a 0 to signal that we aren't switching pagetables */
-	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO,
-		REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_HI, 0);
+	gpu_write64(gpu, REG_A5XX_CP_CONTEXT_SWITCH_SMMU_INFO_LO, 0);
 
 	/* Reset the preemption state */
 	set_preempt_state(a5xx_gpu, PREEMPT_NONE);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fdc578016e0b..1ff605c18ee6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,8 +247,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_RING(ring, submit->seqno);
 
 	trace_msm_gpu_submit_flush(submit,
-		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
-			REG_A6XX_CP_ALWAYS_ON_COUNTER_HI));
+		gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO));
 
 	a6xx_flush(gpu, ring);
 }
@@ -947,8 +946,7 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
 		}
 	}
 
-	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE,
-		REG_A6XX_CP_SQE_INSTR_BASE+1, a6xx_gpu->sqe_iova);
+	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
 
 	return 0;
 }
@@ -999,8 +997,7 @@ static int hw_init(struct msm_gpu *gpu)
 	 * memory rendering at this point in time and we don't want to block off
 	 * part of the virtual memory space.
 	 */
-	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO,
-		REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
+	gpu_write64(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_BASE_LO, 0x00000000);
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
 
 	/* Turn on 64 bit addressing for all blocks */
@@ -1049,11 +1046,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	if (!adreno_is_a650_family(adreno_gpu)) {
 		/* Set the GMEM VA range [0x100000:0x100000 + gpu->gmem - 1] */
-		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO,
-			REG_A6XX_UCHE_GMEM_RANGE_MIN_HI, 0x00100000);
+		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
 
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX_LO,
-			REG_A6XX_UCHE_GMEM_RANGE_MAX_HI,
 			0x00100000 + adreno_gpu->gmem - 1);
 	}
 
@@ -1145,8 +1140,7 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	/* Set the ringbuffer address */
-	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
-		gpu->rb[0]->iova);
+	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 
 	/* Targets that support extended APRIV can use the RPTR shadow from
 	 * hardware but all the other ones need to disable the feature. Targets
@@ -1178,7 +1172,6 @@ static int hw_init(struct msm_gpu *gpu)
 		}
 
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
-			REG_A6XX_CP_RB_RPTR_ADDR_HI,
 			shadowptr(a6xx_gpu, gpu->rb[0]));
 	}
 
@@ -1499,9 +1492,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 		gpu_read(gpu, REG_A6XX_RBBM_STATUS),
 		gpu_read(gpu, REG_A6XX_CP_RB_RPTR),
 		gpu_read(gpu, REG_A6XX_CP_RB_WPTR),
-		gpu_read64(gpu, REG_A6XX_CP_IB1_BASE, REG_A6XX_CP_IB1_BASE_HI),
+		gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
-		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE, REG_A6XX_CP_IB2_BASE_HI),
+		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
 
 	/* Turn off the hangcheck timer to keep it from bothering us */
@@ -1712,8 +1705,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	/* Force the GPU power on so we can read this register */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 
-	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO,
-			    REG_A6XX_CP_ALWAYS_ON_COUNTER_HI);
+	*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER_LO);
 
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a5c3d1ed255a..a023d5f962dc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -147,8 +147,7 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 	/* Make sure all pending memory writes are posted */
 	wmb();
 
-	gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO,
-		REG_A6XX_CP_CRASH_SCRIPT_BASE_HI, dumper->iova);
+	gpu_write64(gpu, REG_A6XX_CP_CRASH_SCRIPT_BASE_LO, dumper->iova);
 
 	gpu_write(gpu, REG_A6XX_CP_CRASH_DUMP_CNTL, 1);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 58a72e6b1400..585fd9c8d45a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -540,7 +540,7 @@ static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
-static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
+static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 {
 	u64 val;
 
@@ -558,17 +558,17 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 lo, u32 hi)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
-	val = (u64) msm_readl(gpu->mmio + (lo << 2));
-	val |= ((u64) msm_readl(gpu->mmio + (hi << 2)) << 32);
+	val = (u64) msm_readl(gpu->mmio + (reg << 2));
+	val |= ((u64) msm_readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
 }
 
-static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
+static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
 	/* Why not a writeq here? Read the screed above */
-	msm_writel(lower_32_bits(val), gpu->mmio + (lo << 2));
-	msm_writel(upper_32_bits(val), gpu->mmio + (hi << 2));
+	msm_writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	msm_writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
 int msm_gpu_pm_suspend(struct msm_gpu *gpu);
-- 
2.38.1

