Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1A93409A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 18:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D9B10E2EA;
	Wed, 17 Jul 2024 16:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ijgM0ftF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6983E10E2EA;
 Wed, 17 Jul 2024 16:36:49 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-78512d44a17so4903380a12.3; 
 Wed, 17 Jul 2024 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721234208; x=1721839008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6Tzu3jqDnrHHZ5FSIBBjtL4u5IM8MddfjcNgRKO5h4=;
 b=ijgM0ftFFI+aH1ruBid7Zv/HtnAjthPgt/5LFOsshYa3jfTc9nSxvhhsaSus+e5eCi
 HofjwOlj3UpUdLl57c7e90QPYVAMjMueLE1D91KAQnU3jSTYqO5EENJQZH5oF7IGA23u
 QKGdsoVjmZx/gPexKHDI1OWZdH1+k7HhSfUlzWE8ZZrShWmVT+kTHw90elD3OrTsZqX3
 /h53882HQHbJx/s0ZhoCIJZooOukkKokOLXQNdkZ8iOTBuF+LYAI/mKc5YbhzvcLWeRO
 hYzSfptNu1/aCqAj9pIatJT5mrZqGOdnuYDsGSIGyUIGdZM4gBCSCBGPYkSONQUXcyKj
 HNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721234208; x=1721839008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k6Tzu3jqDnrHHZ5FSIBBjtL4u5IM8MddfjcNgRKO5h4=;
 b=nH30BDUmANgAmdrmUQxLzzNGzhmJv68HjJNmNxdIetJCBxWmFtfsK5qMaMIfU1+MHq
 L7oMQyBpgooEFsS7djKL3dkc7KATvP49slVyujyN+ITeffzvlhPgGzBlaO3Xi6UWkqsQ
 6sl/Kl6Z1C4YzhRefTLMB39yyw1BvhOSSw55khmlv2MoCnvWvlwKdx8yY5dK+VRzMVIu
 ccashOJzZ3hY/jD/N9dqdohoe8p+7BLTrerKh96KYFaj+WVFcGbK5WXAPr6adlztyMa1
 KWgWj5cxxiUzRQ/XZBd3HNdJL/6t3TCX/I8Mzn7lg4YbjWar089ZkWQXw/qtWXzziqY/
 QDkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2b9ycU1l4XlDc5RephfGJxJ2huTdgONzUOVXWrfV+3/f0b/yCXgk4SlW4AgtqnQ5ubZb76/XxOv3dTRbP6QpS/R+NQVaD8txjpXTFqvH6
X-Gm-Message-State: AOJu0Yxft4sGlC06P3tFkDr4CdnOajk0nDaLXo+jRbRx5qFJBqQK9Rf0
 mTZ3jgo4ifDMjraPAfz54iV1UvmOa/UMAhXsMYd1Gr3+rwdx1XQF7Sy5cA==
X-Google-Smtp-Source: AGHT+IGIVLKct6v1Oci+VuGJ7UT7SE6hP+ygLz1F90SRFxG4sJMTvo9g2QIVO0csBQ8iVqkgrRwXeA==
X-Received: by 2002:a05:6a20:b603:b0:1c3:b61c:57cb with SMTP id
 adf61e73a8af0-1c3fdddac55mr2602613637.53.1721234208143; 
 Wed, 17 Jul 2024 09:36:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ebd0a8bsm8646251b3a.90.2024.07.17.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:36:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/2] drm/msm: Extend gpu devcore dumps with pgtbl info
Date: Wed, 17 Jul 2024 09:36:22 -0700
Message-ID: <20240717163627.43423-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717163627.43423-1-robdclark@gmail.com>
References: <20240717163627.43423-1-robdclark@gmail.com>
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

In the case of iova fault triggered devcore dumps, include additional
debug information based on what we think is the current page tables,
including the TTBR0 value (which should match what we have in
adreno_smmu_fault_info unless things have gone horribly wrong), and
the pagetable entries traversed in the process of resolving the
faulting iova.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c           |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c         | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h           |  3 ++-
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 99661af8d941..422dae873b6b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -861,6 +861,16 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 		drm_printf(p, "  - dir=%s\n", info->flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ");
 		drm_printf(p, "  - type=%s\n", info->type);
 		drm_printf(p, "  - source=%s\n", info->block);
+
+		/* Information extracted from what we think are the current
+		 * pgtables.  Hopefully the TTBR0 matches what we've extracted
+		 * from the SMMU registers in smmu_info!
+		 */
+		drm_puts(p, "pgtable-fault-info:\n");
+		drm_printf(p, "  - ttbr0: %.16llx\n", (u64)info->pgtbl_ttbr0);
+		drm_printf(p, "  - asid: %d\n", info->asid);
+		drm_printf(p, "  - ptes: %.16llx %.16llx %.16llx %.16llx\n",
+			   info->ptes[0], info->ptes[1], info->ptes[2], info->ptes[3]);
 	}
 
 	drm_printf(p, "rbbm-status: 0x%08x\n", state->rbbm_status);
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 3666b42b4ecd..bf2f8b2a7ccc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -281,6 +281,15 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (submit) {
 		int i;
 
+		if (state->fault_info.ttbr0) {
+			struct msm_gpu_fault_info *info = &state->fault_info;
+			struct msm_mmu *mmu = submit->aspace->mmu;
+
+			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+						   &info->asid);
+			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
+		}
+
 		state->bos = kcalloc(submit->nr_bos,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 1f02bb9956be..82e838ba8c80 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -101,6 +101,14 @@ struct msm_gpu_fault_info {
 	int flags;
 	const char *type;
 	const char *block;
+
+	/* Information about what we think/expect is the current SMMU state,
+	 * for example expected_ttbr0 should match smmu_info.ttbr0 which
+	 * was read back from SMMU registers.
+	 */
+	phys_addr_t pgtbl_ttbr0;
+	u64 ptes[4];
+	int asid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d5512037c38b..0c35a5b597f3 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -195,6 +195,28 @@ struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
 	return &iommu->domain->geometry;
 }
 
+int
+msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4])
+{
+	struct msm_iommu_pagetable *pagetable;
+	struct arm_lpae_io_pgtable_walk_data wd = {};
+
+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
+		return -EINVAL;
+
+	pagetable = to_pagetable(mmu);
+
+	if (!pagetable->pgtbl_ops->pgtable_walk)
+		return -EINVAL;
+
+	pagetable->pgtbl_ops->pgtable_walk(pagetable->pgtbl_ops, iova, &wd);
+
+	for (int i = 0; i < ARRAY_SIZE(wd.ptes); i++)
+		ptes[i] = wd.ptes[i];
+
+	return 0;
+}
+
 static const struct msm_mmu_funcs pagetable_funcs = {
 		.map = msm_iommu_pagetable_map,
 		.unmap = msm_iommu_pagetable_unmap,
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..96e509bd96a6 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -53,7 +53,8 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
-		int *asid);
+			       int *asid);
+int msm_iommu_pagetable_walk(struct msm_mmu *mmu, unsigned long iova, uint64_t ptes[4]);
 struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
 
 #endif /* __MSM_MMU_H__ */
-- 
2.45.2

