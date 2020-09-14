Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91884269915
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D889C2A;
	Mon, 14 Sep 2020 22:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF6289C2A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:41:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600123274; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vAqZuoJJYBV62K9GWWp0Esg+GtLJl3AHKszDdXGA5sA=;
 b=mWd4Mi0Hm1SkGWSjfbWpcuuf+YARlCjQ97exjU/MFgtL5H9bNqacjxFncYQsZLs0qXdAIR7o
 3Phwv83y7tFh3/1kkzs2EFtobpiNmDjy2zJbC2/IMvnSrkCX7A6eIDBBCKtR1PPAgczRLULC
 WuOWpF/Gbofl4me542jtc6puVKc=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f5ff1669f3347551f878cb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 22:40:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3001CC43391; Mon, 14 Sep 2020 22:40:37 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75E39C433F1;
 Mon, 14 Sep 2020 22:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75E39C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: Allow a5xx to mark the RPTR shadow as privileged
Date: Mon, 14 Sep 2020 16:40:21 -0600
Message-Id: <20200914224023.1495082-2-jcrouse@codeaurora.org>
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
Cc: Wambui Karuga <wambui.karugax@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer microcode versions have support for the CP_WHERE_AM_I opcode which
allows the RPTR shadow memory to be marked as privileged to protect it
from corruption. Move the RPTR shadow into its own buffer and protect it
it if the current microcode version supports the new feature.

We can also re-enable preemption for those targets that support
CP_WHERE_AM_I. Start out by preemptively assuming that we can enable
preemption and disable it in a5xx_hw_init if the microcode version comes
back as too old.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 96 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h       | 12 +++
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  5 ++
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h |  1 +
 drivers/gpu/drm/msm/msm_gpu.h               |  1 +
 7 files changed, 109 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 616d9e798058..835aaef72b00 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -18,13 +18,24 @@ static void a5xx_dump(struct msm_gpu *gpu);
 
 #define GPU_PAS_ID 13
 
-static void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		bool sync)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	uint32_t wptr;
 	unsigned long flags;
 
+	/*
+	 * Most flush operations need to issue a WHERE_AM_I opcode to sync up
+	 * the rptr shadow
+	 */
+	if (a5xx_gpu->has_whereami && sync) {
+		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
+		OUT_RING(ring, lower_32_bits(shadowptr(a5xx_gpu, ring)));
+		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
+	}
+
 	spin_lock_irqsave(&ring->lock, flags);
 
 	/* Copy the shadow to the actual register */
@@ -90,7 +101,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		}
 	}
 
-	a5xx_flush(gpu, ring);
+	a5xx_flush(gpu, ring, true);
 	a5xx_preempt_trigger(gpu);
 
 	/* we might not necessarily have a cmd from userspace to
@@ -204,7 +215,8 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	/* Set bit 0 to trigger an interrupt on preempt complete */
 	OUT_RING(ring, 0x01);
 
-	a5xx_flush(gpu, ring);
+	/* A WHERE_AM_I packet is not needed after a YIELD */
+	a5xx_flush(gpu, ring, false);
 
 	/* Check to see if we need to start preemption */
 	a5xx_preempt_trigger(gpu);
@@ -363,7 +375,7 @@ static int a5xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 
-	gpu->funcs->flush(gpu, ring);
+	a5xx_flush(gpu, ring, true);
 	return a5xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
@@ -405,11 +417,31 @@ static int a5xx_preempt_start(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x01);
 	OUT_RING(ring, 0x01);
 
-	gpu->funcs->flush(gpu, ring);
+	/* The WHERE_AMI_I packet is not needed after a YIELD is issued */
+	a5xx_flush(gpu, ring, false);
 
 	return a5xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
 
+static void a5xx_ucode_check_version(struct a5xx_gpu *a5xx_gpu,
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
+	 */
+	if (((buf[0] & 0xf) == 0xa) && (buf[2] & 0xf) >= 1)
+		a5xx_gpu->has_whereami = true;
+
+	msm_gem_put_vaddr(obj);
+}
+
 static int a5xx_ucode_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -445,6 +477,7 @@ static int a5xx_ucode_init(struct msm_gpu *gpu)
 		}
 
 		msm_gem_object_set_name(a5xx_gpu->pfp_bo, "pfpfw");
+		a5xx_ucode_check_version(a5xx_gpu, a5xx_gpu->pfp_bo);
 	}
 
 	gpu_write64(gpu, REG_A5XX_CP_ME_INSTR_BASE_LO,
@@ -504,6 +537,7 @@ static int a5xx_zap_shader_init(struct msm_gpu *gpu)
 static int a5xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	int ret;
 
 	gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
@@ -712,9 +746,36 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write64(gpu, REG_A5XX_CP_RB_BASE, REG_A5XX_CP_RB_BASE_HI,
 		gpu->rb[0]->iova);
 
+	/*
+	 * If the microcode supports the WHERE_AM_I opcode then we can use that
+	 * in lieu of the RPTR shadow and enable preemption. Otherwise, we
+	 * can't safely use the RPTR shadow or preemption. In either case, the
+	 * RPTR shadow should be disabled in hardware.
+	 */
 	gpu_write(gpu, REG_A5XX_CP_RB_CNTL,
 		MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE);
 
+	/* Disable preemption if WHERE_AM_I isn't available */
+	if (!a5xx_gpu->has_whereami && gpu->nr_rings > 1) {
+		a5xx_preempt_fini(gpu);
+		gpu->nr_rings = 1;
+	} else {
+		/* Create a privileged buffer for the RPTR shadow */
+		if (!a5xx_gpu->shadow_bo) {
+			a5xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
+				sizeof(u32) * gpu->nr_rings,
+				MSM_BO_UNCACHED | MSM_BO_MAP_PRIV,
+				gpu->aspace, &a5xx_gpu->shadow_bo,
+				&a5xx_gpu->shadow_iova);
+
+			if (IS_ERR(a5xx_gpu->shadow))
+				return PTR_ERR(a5xx_gpu->shadow);
+		}
+
+		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
+			REG_A5XX_CP_RB_RPTR_ADDR_HI, shadowptr(a5xx_gpu, gpu->rb[0]));
+	}
+
 	a5xx_preempt_hw_init(gpu);
 
 	/* Disable the interrupts through the initial bringup stage */
@@ -738,7 +799,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		OUT_PKT7(gpu->rb[0], CP_EVENT_WRITE, 1);
 		OUT_RING(gpu->rb[0], CP_EVENT_WRITE_0_EVENT(STAT_EVENT));
 
-		gpu->funcs->flush(gpu, gpu->rb[0]);
+		a5xx_flush(gpu, gpu->rb[0], true);
 		if (!a5xx_idle(gpu, gpu->rb[0]))
 			return -EINVAL;
 	}
@@ -756,7 +817,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
 		OUT_RING(gpu->rb[0], 0x00000000);
 
-		gpu->funcs->flush(gpu, gpu->rb[0]);
+		a5xx_flush(gpu, gpu->rb[0], true);
 		if (!a5xx_idle(gpu, gpu->rb[0]))
 			return -EINVAL;
 	} else if (ret == -ENODEV) {
@@ -823,6 +884,11 @@ static void a5xx_destroy(struct msm_gpu *gpu)
 		drm_gem_object_put(a5xx_gpu->gpmu_bo);
 	}
 
+	if (a5xx_gpu->shadow_bo) {
+		msm_gem_unpin_iova(a5xx_gpu->shadow_bo, gpu->aspace);
+		drm_gem_object_put(a5xx_gpu->shadow_bo);
+	}
+
 	adreno_gpu_cleanup(adreno_gpu);
 	kfree(a5xx_gpu);
 }
@@ -1430,6 +1496,17 @@ static unsigned long a5xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
+
+	if (a5xx_gpu->has_whereami)
+		return a5xx_gpu->shadow[ring->id];
+
+	return ring->memptrs->rptr = gpu_read(gpu, REG_A5XX_CP_RB_RPTR);
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1438,7 +1515,6 @@ static const struct adreno_gpu_funcs funcs = {
 		.pm_resume = a5xx_pm_resume,
 		.recover = a5xx_recover,
 		.submit = a5xx_submit,
-		.flush = a5xx_flush,
 		.active_ring = a5xx_active_ring,
 		.irq = a5xx_irq,
 		.destroy = a5xx_destroy,
@@ -1452,6 +1528,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a5xx_gpu_state_get,
 		.gpu_state_put = a5xx_gpu_state_put,
 		.create_address_space = adreno_iommu_create_address_space,
+		.get_rptr = a5xx_get_rptr,
 	},
 	.get_timestamp = a5xx_get_timestamp,
 };
@@ -1516,8 +1593,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	check_speed_bin(&pdev->dev);
 
-	/* Restricting nr_rings to 1 to temporarily disable preemption */
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4);
 	if (ret) {
 		a5xx_destroy(&(a5xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 1e5b1a15a70f..c7187bcc5e90 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -37,6 +37,13 @@ struct a5xx_gpu {
 
 	atomic_t preempt_state;
 	struct timer_list preempt_timer;
+
+	struct drm_gem_object *shadow_bo;
+	uint64_t shadow_iova;
+	uint32_t *shadow;
+
+	/* True if the microcode supports the WHERE_AM_I opcode */
+	bool has_whereami;
 };
 
 #define to_a5xx_gpu(x) container_of(x, struct a5xx_gpu, base)
@@ -141,6 +148,9 @@ static inline int spin_usecs(struct msm_gpu *gpu, uint32_t usecs,
 	return -ETIMEDOUT;
 }
 
+#define shadowptr(a5xx_gpu, ring) ((a5xx_gpu)->shadow_iova + \
+		((ring)->id * sizeof(uint32_t)))
+
 bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a5xx_set_hwcg(struct msm_gpu *gpu, bool state);
 
@@ -150,6 +160,8 @@ void a5xx_preempt_trigger(struct msm_gpu *gpu);
 void a5xx_preempt_irq(struct msm_gpu *gpu);
 void a5xx_preempt_fini(struct msm_gpu *gpu);
 
+void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, bool sync);
+
 /* Return true if we are in a preempt state */
 static inline bool a5xx_in_preempt(struct a5xx_gpu *a5xx_gpu)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index 321a8061fd32..f176a6f3eff6 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -240,7 +240,7 @@ static int a5xx_gpmu_init(struct msm_gpu *gpu)
 	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	gpu->funcs->flush(gpu, ring);
+	a5xx_flush(gpu, ring, true);
 
 	if (!a5xx_idle(gpu, ring)) {
 		DRM_ERROR("%s: Unable to load GPMU firmware. GPMU will not be active\n",
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 9f3fe177b00e..7e04509c4e1f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -259,8 +259,9 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 	ptr->magic = A5XX_PREEMPT_RECORD_MAGIC;
 	ptr->info = 0;
 	ptr->data = 0;
-	ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT;
-	ptr->rptr_addr = rbmemptr(ring, rptr);
+	ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
+
+	ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
 	ptr->counter = counters_iova;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a833dd0ab751..11635e39ca19 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -422,6 +422,11 @@ int adreno_hw_init(struct msm_gpu *gpu)
 static uint32_t get_rptr(struct adreno_gpu *adreno_gpu,
 		struct msm_ringbuffer *ring)
 {
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if (gpu->funcs->get_rptr)
+		return gpu->funcs->get_rptr(gpu, ring);
+
 	return ring->memptrs->rptr = adreno_gpu_read(
 		adreno_gpu, REG_ADRENO_CP_RB_RPTR);
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
index 3931eecadaff..59bb8c1ffce6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h
@@ -298,6 +298,7 @@ enum adreno_pm4_type3_packets {
 	CP_SET_BIN_DATA5_OFFSET = 46,
 	CP_SET_CTXSWITCH_IB = 85,
 	CP_REG_WRITE = 109,
+	CP_WHERE_AM_I = 98,
 };
 
 enum adreno_state_block {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5ee358b480e6..6c9e1fdc1a76 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -68,6 +68,7 @@ struct msm_gpu_funcs {
 		(struct msm_gpu *gpu, struct platform_device *pdev);
 	struct msm_gem_address_space *(*create_private_address_space)
 		(struct msm_gpu *gpu);
+	uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 struct msm_gpu {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
