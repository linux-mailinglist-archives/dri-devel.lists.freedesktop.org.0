Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB826990D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1856E7F5;
	Mon, 14 Sep 2020 22:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF286E7EF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:40:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600123248; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7ecByI6SXnqe8zENVQW0SIp50PVYEiS7iVo98wrfseQ=;
 b=PWZ4CFguVvfcEnwLx17bpeaGXS8MIZ2i5anNApabVKSv6HowGfqpb3hKsCXi2nN6Yu5mi1Rf
 Q7stglBSCIUraYXeA6Idk2AfivDJKgx0ECPM9nYIBX1sI/daBl+8NZyTLid+hxfSh6LU2xf1
 GC1OfnCUzGFiHEUdbOiO2Mn0RH4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f5ff1669f3347551f878e25 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 22:40:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C690C433A1; Mon, 14 Sep 2020 22:40:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FCE4C433CA;
 Mon, 14 Sep 2020 22:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FCE4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] drm/msm: a6xx: Use WHERE_AM_I for eligible targets
Date: Mon, 14 Sep 2020 16:40:22 -0600
Message-Id: <20200914224023.1495082-3-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914224023.1495082-1-jcrouse@codeaurora.org>
References: <20200914224023.1495082-1-jcrouse@codeaurora.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support the WHERE_AM_I opcode for the A618, A630 and A640 GPUs if the
microcode supports it. The WHERE_AM_I opcode allows the RPTR shadow
to be updated in priviliged memory which protects the shadow from being
read or written from user submissions.

A650 already supports extended APRIV have built in hardware support for
to access privilged memory from the CP and can go back to using the
hardware RPTR shadow feature.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 87 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  9 +++
 2 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a3a8d6fd06bb..9cce2b01b1a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -51,9 +51,20 @@ bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	uint32_t wptr;
 	unsigned long flags;
 
+	/* Expanded APRIV doesn't need to issue the WHERE_AM_I opcode */
+	if (a6xx_gpu->has_whereami && !adreno_gpu->base.hw_apriv) {
+		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
+		OUT_RING(ring, lower_32_bits(shadowptr(a6xx_gpu, ring)));
+		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
+	}
+
 	spin_lock_irqsave(&ring->lock, flags);
 
 	/* Copy the shadow to the actual register */
@@ -508,6 +519,30 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static void a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
+		struct drm_gem_object *obj)
+{
+	u32 *buf = msm_gem_get_vaddr_active(obj);
+
+	if (IS_ERR(buf))
+		return;
+
+	/*
+	 * If the lowest nibble is 0xa that is an indication that this microcode
+	 * has been patched. The actual version is in dword [3] but we only care
+	 * about the patchlevel which is the lowest nibble of dword [3]
+	 *
+	 * Otherwise check that the firmware is greater than or equal to 1.90
+	 * which was the first version that had this fix built in
+	 */
+	if (((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1)
+		a6xx_gpu->has_whereami = true;
+	else if ((buf[0] & 0xfff) > 0x190)
+		a6xx_gpu->has_whereami = true;
+
+	msm_gem_put_vaddr(obj);
+}
+
 static int a6xx_ucode_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -528,6 +563,7 @@ static int a6xx_ucode_init(struct msm_gpu *gpu)
 		}
 
 		msm_gem_object_set_name(a6xx_gpu->sqe_bo, "sqefw");
+		a6xx_ucode_check_version(a6xx_gpu, a6xx_gpu->sqe_bo);
 	}
 
 	gpu_write64(gpu, REG_A6XX_CP_SQE_INSTR_BASE_LO,
@@ -743,8 +779,37 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, REG_A6XX_CP_RB_BASE_HI,
 		gpu->rb[0]->iova);
 
-	gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
-		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+	/* Targets that support extended APRIV can use the RPTR shadow from
+	 * hardware but all the other ones need to disable the feature. Targets
+	 * that support the WHERE_AM_I opcode can use that instead
+	 */
+	if (adreno_gpu->base.hw_apriv)
+		gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
+	else
+		gpu_write(gpu, REG_A6XX_CP_RB_CNTL,
+			MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
+
+	/*
+	 * Expanded APRIV and targets that support WHERE_AM_I both need a
+	 * privileged buffer to store the RPTR shadow
+	 */
+
+	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami) {
+		if (!a6xx_gpu->shadow_bo) {
+			a6xx_gpu->shadow = msm_gem_kernel_new_locked(gpu->dev,
+				sizeof(u32) * gpu->nr_rings,
+				MSM_BO_UNCACHED | MSM_BO_MAP_PRIV,
+				gpu->aspace, &a6xx_gpu->shadow_bo,
+				&a6xx_gpu->shadow_iova);
+
+			if (IS_ERR(a6xx_gpu->shadow))
+				return PTR_ERR(a6xx_gpu->shadow);
+		}
+
+		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
+			REG_A6XX_CP_RB_RPTR_ADDR_HI,
+			shadowptr(a6xx_gpu, gpu->rb[0]));
+	}
 
 	/* Always come up on rb 0 */
 	a6xx_gpu->cur_ring = gpu->rb[0];
@@ -1033,6 +1098,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a6xx_gpu->sqe_bo);
 	}
 
+	if (a6xx_gpu->shadow_bo) {
+		msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->aspace);
+		drm_gem_object_put(a6xx_gpu->shadow_bo);
+	}
+
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
@@ -1081,6 +1151,17 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
 		"gpu", 0x100000000ULL, 0x1ffffffffULL);
 }
 
+static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+		return a6xx_gpu->shadow[ring->id];
+
+	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1089,7 +1170,6 @@ static const struct adreno_gpu_funcs funcs = {
 		.pm_resume = a6xx_pm_resume,
 		.recover = a6xx_recover,
 		.submit = a6xx_submit,
-		.flush = a6xx_flush,
 		.active_ring = a6xx_active_ring,
 		.irq = a6xx_irq,
 		.destroy = a6xx_destroy,
@@ -1105,6 +1185,7 @@ static const struct adreno_gpu_funcs funcs = {
 #endif
 		.create_address_space = adreno_iommu_create_address_space,
 		.create_private_address_space = a6xx_create_private_address_space,
+		.get_rptr = a6xx_get_rptr,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index da22d7549d9b..3eeebf6a754b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -22,6 +22,12 @@ struct a6xx_gpu {
 	struct msm_file_private *cur_ctx;
 
 	struct a6xx_gmu gmu;
+
+	struct drm_gem_object *shadow_bo;
+	uint64_t shadow_iova;
+	uint32_t *shadow;
+
+	bool has_whereami;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
@@ -51,6 +57,9 @@ static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 	return true;
 }
 
+#define shadowptr(_a6xx_gpu, _ring) ((_a6xx_gpu)->shadow_iova + \
+		((_ring)->id * sizeof(uint32_t)))
+
 int a6xx_gmu_resume(struct a6xx_gpu *gpu);
 int a6xx_gmu_stop(struct a6xx_gpu *gpu);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
