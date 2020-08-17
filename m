Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935072479B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 00:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594D6E12D;
	Mon, 17 Aug 2020 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BC06E12D;
 Mon, 17 Aug 2020 22:03:27 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id c10so8459737pjn.1;
 Mon, 17 Aug 2020 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mhVxmk78dJR4vnPeISGu06X6c6GEFikue9DCAq2G7yQ=;
 b=lQcqBhcOzHwlP9KrdDjxTyQ5MAdTL/u8c/rJc99Cu+2D148/DBsH0/sL84REhssabk
 rzqH+ALBKx0dybY7sirz6d/54EjgsEpmOaDqoBttXWT3yyw1cGQQMJuHqOeYNn+66W9m
 lihA38jgb/mGjSMlvDo43NPuXOuXeijM4be274MFHkKcnpv7RXjaVU0z9Gy2PHMPiL3Q
 ONUeiSMV58Uh3oFjc7E1C+dB1Nk+6zUinK4pltY9cGk691+zuhs1JiZ3O1Pv9MLpd059
 5+r2Ub2oGp94r9mWx1dL6EVxhLqnkG7gyrLE8MJpPsp8l168kuWsIuQddUSf8N+2K201
 Ftww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mhVxmk78dJR4vnPeISGu06X6c6GEFikue9DCAq2G7yQ=;
 b=rJ1VsHvzIhg4weVYINUPx9ahon7QigtWp1wHQBBfvLb/YRsuxCQl9LGFZyiGTLgWLD
 N4e44GNdgJQZH/3yO1pV4tfdQgpXdyz2jKXef6lhO+EXLHOU5zVw0Xncaaq2uNDVQIQD
 LGuVdFj8Y7JEpC+T2DtXd0WOiI/sD3QL/nlZeWVj1Luq6S1KcEkdPMlIU2pxbQzU2itk
 gDng/Cd3fjSlFhTqpnUDrjMvWazd2bImAT/nH8wye+T99AfXsSv2t2TUK0JJ0vTB7axW
 3E6OSXsQoHoqC3zBC2Ogdm1zN/42h3JqqZ9RTGdT3FxFd1tt9htxdU43LovxCzMaUqB3
 s4tw==
X-Gm-Message-State: AOAM532SXlr6w8E8IVH86NpkspAEkHtS7+mT/nJZRGCk7ZgT43ocfGVR
 0p+8t7yz8hCRiGOv5urkU/E+1OAIMUiK75JA
X-Google-Smtp-Source: ABdhPJyWnsIdl5ToxuDPggCW3IxLbAjxVwuVw6iEhmNSp2uOmvjd0yrF0IM0/7tcXWVR7bzG7CM+og==
X-Received: by 2002:a17:902:8646:: with SMTP id
 y6mr12621584plt.19.1597701806368; 
 Mon, 17 Aug 2020 15:03:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b15sm18503354pgk.14.2020.08.17.15.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:03:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 16/20] drm/msm/a6xx: Add support for per-instance pagetables
Date: Mon, 17 Aug 2020 15:01:41 -0700
Message-Id: <20200817220238.603465-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>
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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
 3 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5eabb0109577..d7ad6c78d787 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -81,6 +81,49 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
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
+	OUT_RING(ring,
+		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
+		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
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
+	OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
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
@@ -90,6 +133,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct msm_ringbuffer *ring = submit->ring;
 	unsigned int i;
 
+	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
+
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
 		rbmemptr_stats(ring, index, cpcycles_start));
 
@@ -696,6 +741,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
+	a6xx_gpu->cur_ctx = NULL;
+
 	/* Enable the SQE_to start the CP engine */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
 
@@ -1008,6 +1055,21 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
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
@@ -1031,6 +1093,7 @@ static const struct adreno_gpu_funcs funcs = {
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
