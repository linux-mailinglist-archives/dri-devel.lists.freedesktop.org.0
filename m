Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7159B5FA
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 20:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B838FAE1;
	Sun, 21 Aug 2022 18:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B848FAB9;
 Sun, 21 Aug 2022 18:19:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id x15so7523106pfp.4;
 Sun, 21 Aug 2022 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rJPJHp4WUC+k2ZugmXMrEl/gry6ReB2YgyAezAf1/ks=;
 b=igd3L5C0F/igLnISA3+VP7PELE0Tt3GXUb3snhvjwtOdEzx9eRDgu/de4iZ4v8ZByJ
 9p8GsGJC4YZ5AIL7Baq8coyhYhSJlmsz8t61OWkgsoxBiRA8UjJdLUtJv4e6Wd82LuYq
 YPnSx1vQV1elOuCFKu6lsmXcy3XvF8MvBudyOhK2cf/4X3p7aBLcbyFVpmtyxOsyUNfv
 jsL1sPaOcZ9p3pub/xX3MxRTnbjyQzn6Q+NgQbFeH5HB4NBRdr2kp9DMEtkJiBh0HnBm
 CJYGRjFHNaxi6TooTGYKT8+O5Ime+KG9p/MJMa/Gzco2Vc2UKU4rcnUTtcNJsndoT2K3
 XALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rJPJHp4WUC+k2ZugmXMrEl/gry6ReB2YgyAezAf1/ks=;
 b=y0RToaLgbHkYG1uV58Dc0/9zuWXdybXlbYdA7+Jwr0ts5tR0Hwzo0xveV32YUksEBS
 cwGECXcrlQ1kDIGCVLRE/ypCKni+6IPifz53/Xe+TBH4IxET+7jfua3xVYs0LoYvmSBt
 sIdYxWKQ+n3sq5dEDhTNQsmuOi59BS0miszcBwM/6comJ37CEjIrJL3Qdqm2oRNkMdgo
 mMArez5kEbNdq/VwebQndHXtiPcQiiBVj63yFgZyiYHDlQg3XguQ43Bg1zTvlImu913l
 LXNnMGu5tRo0tW3zPweqS4Rk5iVSQrP+xyfkPFaYwxhBizMbzeuVEgZ5k3AGjAfYQlhP
 zEKQ==
X-Gm-Message-State: ACgBeo1jFMdVl0OXhGZq9cqOKNZpu7GPtWCls0F36ybdQDO0EMWUlWda
 gXLfeKMEr2yz4ScWhnQBYE1A6ji7ubo=
X-Google-Smtp-Source: AA6agR7grPVWv0p0d5feTVXYX0q0iIO3i4jluQbDa7BvmI7ly44pt5otEGUi/E8EyZ4IvklYGtFK9A==
X-Received: by 2002:a05:6a00:27a0:b0:52f:8947:4cc5 with SMTP id
 bd32-20020a056a0027a000b0052f89474cc5mr17505693pfb.16.1661105947769; 
 Sun, 21 Aug 2022 11:19:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 nt22-20020a17090b249600b001f55dda84b3sm6602422pjb.22.2022.08.21.11.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 11:19:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm: Skip tlbinv on unmap from non-current pgtables
Date: Sun, 21 Aug 2022 11:19:06 -0700
Message-Id: <20220821181917.1188021-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821181917.1188021-1-robdclark@gmail.com>
References: <20220821181917.1188021-1-robdclark@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We can rely on the tlbinv done by CP_SMMU_TABLE_UPDATE in this case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 ++++++
 drivers/gpu/drm/msm/msm_iommu.c       | 29 +++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c8ad8aeca777..1ba0ed629549 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1180,6 +1180,12 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
 
+	/*
+	 * Note, we cannot assume anything about the state of the SMMU when
+	 * coming back from power collapse, so force a CP_SMMU_TABLE_UPDATE
+	 * on the first submit.  Also, msm_iommu_pagetable_unmap() relies on
+	 * this behavior.
+	 */
 	gpu->cur_ctx_seqno = 0;
 
 	/* Enable the SQE_to start the CP engine */
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 94c8c09980d1..218074a58081 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -45,8 +45,37 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 		size -= 4096;
 	}
 
+	/*
+	 * A CP_SMMU_TABLE_UPDATE is always sent for the first
+	 * submit after resume, and that does a TLB invalidate.
+	 * So we can skip that if the device is not currently
+	 * powered.
+	 */
+	if (!pm_runtime_get_if_in_use(pagetable->parent->dev))
+		goto out;
+
+	/*
+	 * If we are not the current pgtables, we can rely on the
+	 * TLB invalidate done by CP_SMMU_TABLE_UPDATE.
+	 *
+	 * We'll always be racing with the GPU updating ttbr0,
+	 * but there are only two cases:
+	 *
+	 *  + either we are not the the current pgtables and there
+	 *    will be a tlbinv done by the GPU before we are again
+	 *
+	 *  + or we are.. there might have already been a tblinv
+	 *    if we raced with the GPU, but we have to assume the
+	 *    worse and do the tlbinv
+	 */
+	if (adreno_smmu->get_ttbr0(adreno_smmu->cookie) != pagetable->ttbr)
+		goto out_put;
+
 	adreno_smmu->tlb_inv_by_id(adreno_smmu->cookie, pagetable->asid);
 
+out_put:
+	pm_runtime_put(pagetable->parent->dev);
+out:
 	return (unmapped == size) ? 0 : -EINVAL;
 }
 
-- 
2.37.2

