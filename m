Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E3244379
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F746EB0F;
	Fri, 14 Aug 2020 02:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8926EB0F;
 Fri, 14 Aug 2020 02:42:08 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id m34so3810232pgl.11;
 Thu, 13 Aug 2020 19:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gr+5+NDBCVmeiFJo1r00faHACbyaQmX75rYoMEjRwIg=;
 b=oDbPOGzEexe7SJDpbQQ6F8naxiLN1EUWNd0JWjWgsxTlvgZLnRIeAzNTEqge7kL5gj
 4SArYJV+gk/gNt1zY/0g8hL5gcr3NP+7YMvmkIUuHSHGIQLscc9XsFWaIsq7bq3+zH5S
 9zHmg8Jxg4vsiFmNjasbBIrkRDrogZqGhoDasUV4prR6SCpxf0go9p+pkbk9meHbsr6r
 zW3Nzd6ESFIsC3wT94uDuRXoAy9USdPyr0KdaxoVJVQcgrzdg7QzJDXz36fvilWLXTtW
 djl4Vq9a8+D5sXUrY38mu0lDhbiTQX+UIi071e7IxR4RtTi8rLIfkLDDWwHCfCF5WXn0
 wfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gr+5+NDBCVmeiFJo1r00faHACbyaQmX75rYoMEjRwIg=;
 b=FrlJ0dggGuTGnMNF/z/OMhyBZnkC6hTzdWm9Hw1gx2/iSedVssqByDCLCOxb5XRsMu
 sOU/8WrGFKepbZuqFNvJqFuMkVAbFkdFSja5DzI3kqe4IEm8aSUqcK0ikgBcJPuDC3eL
 mv5Ft1LvBvnuCMyyC7RFSNA/07Y1VUPRZypV/p0PIL2q7kX1Yb++2fG2rPkhiQNQkBKW
 FfHpLjopVZxskP/EZWRjBIkxtobw2nbt6FLn7vnQKWmOM3Pdr4CxTDBXMAyCHpvY2sy4
 qZwidVdV+3CRdBljjFAZ4IDEjzWJ3f5uRD9JlGDfjGzSi1XZdv9MbeXf/ccyQGNPPn7G
 vqbQ==
X-Gm-Message-State: AOAM532B8HcO6m0lKF2m8OwJPGDalse7rzTMFC5dXPtK7zZKGJ+6YKD+
 VhE9RpOnrbjBUQZTnUasLHuRIO8Q3UYylA==
X-Google-Smtp-Source: ABdhPJya1wzik8HNL+iqier1Suq9Z44qItIp0O0EoriWEzNVBa0AA0osvx93+cneOVRu0mkspY9abg==
X-Received: by 2002:a62:6186:: with SMTP id v128mr265713pfb.211.1597372926813; 
 Thu, 13 Aug 2020 19:42:06 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id s18sm6791831pgj.3.2020.08.13.19.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 19:42:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 16/19] drm/msm/a6xx: Add support for per-instance pagetables
Date: Thu, 13 Aug 2020 19:41:11 -0700
Message-Id: <20200814024114.1177553-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jordan Crouse <jcrouse@codeaurora.org>

Add support for using per-instance pagetables if all the dependencies are
available.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 70 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
 3 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5eabb0109577..9653ac9b3cb8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -81,6 +81,56 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 	OUT_RING(ring, upper_32_bits(iova));
 }
 
+static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
+		struct msm_ringbuffer *ring, struct msm_file_private *ctx)
+{
+	phys_addr_t ttbr;
+	u32 asid;
+	u64 memptr = rbmemptr(ring, ttbr0);
+
+	if (ctx == a6xx_gpu->cur_ctx)
+		return;
+
+	if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
+		return;
+
+	/* Execute the table update */
+	OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_0_TTBR0_LO(lower_32_bits(ttbr)));
+
+	/*
+	 * For now ignore the asid since the smmu driver uses a TLBIASID to
+	 * flush the TLB when we use iommu_flush_tlb_all() and the smmu driver
+	 * isn't aware that the asid changed.  Instead, keep the default asid
+	 * (0, same as the context bank) to make sure the TLB is properly
+	 * flushed.
+	 */
+	OUT_RING(ring,
+		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
+		CP_SMMU_TABLE_UPDATE_1_ASID(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+
+	/*
+	 * Write the new TTBR0 to the memstore. This is good for debugging.
+	 */
+	OUT_PKT7(ring, CP_MEM_WRITE, 4);
+	OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
+	OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
+	OUT_RING(ring, lower_32_bits(ttbr));
+	OUT_RING(ring, (0 << 16) | upper_32_bits(ttbr));
+
+	/*
+	 * And finally, trigger a uche flush to be sure there isn't anything
+	 * lingering in that part of the GPU
+	 */
+
+	OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+	OUT_RING(ring, 0x31);
+
+	a6xx_gpu->cur_ctx = ctx;
+}
+
 static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
@@ -90,6 +140,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
+	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
 		rbmemptr_stats(ring, index, cpcycles_start));
 
@@ -696,6 +748,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
+	a6xx_gpu->cur_ctx = NULL;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
@@ -1008,6 +1062,21 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_private_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace = NULL;
+	struct msm_mmu *mmu;
+
+	mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
+
+	if (!IS_ERR(mmu))
+		aspace = msm_gem_address_space_create(mmu,
+			"gpu", 0x100000000ULL, 0x1ffffffffULL);
+
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1031,6 +1100,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
 		.create_address_space = adreno_iommu_create_address_space,
+		.create_private_address_space = a6xx_create_private_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 03ba60d5b07f..da22d7549d9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -19,6 +19,7 @@ struct a6xx_gpu {
 	uint64_t sqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
+	struct msm_file_private *cur_ctx;
 
 	struct a6xx_gmu gmu;
 };
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 7764373d0ed2..0987d6bf848c 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -31,6 +31,7 @@ struct msm_rbmemptrs {
 	volatile uint32_t fence;
 
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
+	volatile u64 ttbr0;
 };
 
 struct msm_ringbuffer {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
