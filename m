Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F626990B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C092D6E7EF;
	Mon, 14 Sep 2020 22:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784A76E7F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:40:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600123248; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/fCw5entm9M6pmDtEexVARYNYQ6eMP+0Az68QpI3EQ0=;
 b=NkAjyjDxyt6IEX7OmcfYwL7qEzvLOn5z0i8BMmLDO7U4mdesz/kLXN8AMK5OSKGkPY7VPPBX
 0krGf34t/H4Fex4xy3yBl4mVL8UU5k5JQpCPz5IPMy/Y4a0Pe/ZDkKqImTN764XNOR5iCk9Q
 VcIbtrJ5JbuvnV4CEx2fk9jIpTQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f5ff16d32925f96e186f4fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 22:40:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 30222C43395; Mon, 14 Sep 2020 22:40:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D705C433C8;
 Mon, 14 Sep 2020 22:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D705C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] drm/msm: Get rid of the REG_ADRENO offsets
Date: Mon, 14 Sep 2020 16:40:23 -0600
Message-Id: <20200914224023.1495082-4-jcrouse@codeaurora.org>
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
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As newer GPU families are added it makes less sense to maintain a
"generic" version functions for older families. Move adreno_submit()
and get_rptr() into the target specific code for a2xx, a3xx and a4xx.
Add a parameter to adreno_flush to pass the target specific WPTR register
instead of relying on the generic register.

All of this gets rid of the last of the REG_ADRENO offsets so remove all
all the register definitions and infrastructure.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   | 65 +++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   | 77 ++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   | 82 ++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 ----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 13 ----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 82 +------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 81 +-----------------------
 7 files changed, 178 insertions(+), 234 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 48fa49f69d6d..7e82c41a85f1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -10,6 +10,48 @@ extern bool hang_debug;
 static void a2xx_dump(struct msm_gpu *gpu);
 static bool a2xx_idle(struct msm_gpu *gpu);
 
+static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_ringbuffer *ring = submit->ring;
+	unsigned int i;
+
+	for (i = 0; i < submit->nr_cmds; i++) {
+		switch (submit->cmd[i].type) {
+		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
+			/* ignore IB-targets */
+			break;
+		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
+			/* ignore if there has not been a ctx switch: */
+			if (priv->lastctx == submit->queue->ctx)
+				break;
+			fallthrough;
+		case MSM_SUBMIT_CMD_BUF:
+			OUT_PKT3(ring, CP_INDIRECT_BUFFER_PFD, 2);
+			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
+			OUT_RING(ring, submit->cmd[i].size);
+			OUT_PKT2(ring);
+			break;
+		}
+	}
+
+	OUT_PKT0(ring, REG_AXXX_CP_SCRATCH_REG2, 1);
+	OUT_RING(ring, submit->seqno);
+
+	/* wait for idle before cache flush/interrupt */
+	OUT_PKT3(ring, CP_WAIT_FOR_IDLE, 1);
+	OUT_RING(ring, 0x00000000);
+
+	OUT_PKT3(ring, CP_EVENT_WRITE, 3);
+	OUT_RING(ring, CACHE_FLUSH_TS);
+	OUT_RING(ring, rbmemptr(ring, fence));
+	OUT_RING(ring, submit->seqno);
+	OUT_PKT3(ring, CP_INTERRUPT, 1);
+	OUT_RING(ring, 0x80000000);
+
+	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
+}
+
 static bool a2xx_me_init(struct msm_gpu *gpu)
 {
 	struct msm_ringbuffer *ring = gpu->rb[0];
@@ -53,7 +95,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 	OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	gpu->funcs->flush(gpu, ring);
+	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
 	return a2xx_idle(gpu);
 }
 
@@ -421,16 +463,11 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	return aspace;
 }
 
-/* Register offset defines for A2XX - copy of A3XX */
-static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_BASE_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR, REG_AXXX_CP_RB_RPTR_ADDR),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_RPTR_ADDR_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR, REG_AXXX_CP_RB_RPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_WPTR, REG_AXXX_CP_RB_WPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_AXXX_CP_RB_CNTL),
-};
+static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
+	return ring->memptrs->rptr;
+}
 
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
@@ -439,8 +476,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.pm_suspend = msm_gpu_pm_suspend,
 		.pm_resume = msm_gpu_pm_resume,
 		.recover = a2xx_recover,
-		.submit = adreno_submit,
-		.flush = adreno_flush,
+		.submit = a2xx_submit,
 		.active_ring = adreno_active_ring,
 		.irq = a2xx_irq,
 		.destroy = a2xx_destroy,
@@ -450,6 +486,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a2xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = a2xx_create_address_space,
+		.get_rptr = a2xx_get_rptr,
 	},
 };
 
@@ -491,8 +528,6 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->registers = a220_registers;
 
-	adreno_gpu->reg_offsets = a2xx_register_offsets;
-
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret)
 		goto fail;
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index f6471145a7a6..f29c77d9cd42 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -28,6 +28,61 @@ extern bool hang_debug;
 static void a3xx_dump(struct msm_gpu *gpu);
 static bool a3xx_idle(struct msm_gpu *gpu);
 
+static void a3xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_ringbuffer *ring = submit->ring;
+	unsigned int i;
+
+	for (i = 0; i < submit->nr_cmds; i++) {
+		switch (submit->cmd[i].type) {
+		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
+			/* ignore IB-targets */
+			break;
+		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
+			/* ignore if there has not been a ctx switch: */
+			if (priv->lastctx == submit->queue->ctx)
+				break;
+			fallthrough;
+		case MSM_SUBMIT_CMD_BUF:
+			OUT_PKT3(ring, CP_INDIRECT_BUFFER_PFD, 2);
+			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
+			OUT_RING(ring, submit->cmd[i].size);
+			OUT_PKT2(ring);
+			break;
+		}
+	}
+
+	OUT_PKT0(ring, REG_AXXX_CP_SCRATCH_REG2, 1);
+	OUT_RING(ring, submit->seqno);
+
+	/* Flush HLSQ lazy updates to make sure there is nothing
+	 * pending for indirect loads after the timestamp has
+	 * passed:
+	 */
+	OUT_PKT3(ring, CP_EVENT_WRITE, 1);
+	OUT_RING(ring, HLSQ_FLUSH);
+
+	/* wait for idle before cache flush/interrupt */
+	OUT_PKT3(ring, CP_WAIT_FOR_IDLE, 1);
+	OUT_RING(ring, 0x00000000);
+
+	/* BIT(31) of CACHE_FLUSH_TS triggers CACHE_FLUSH_TS IRQ from GPU */
+	OUT_PKT3(ring, CP_EVENT_WRITE, 3);
+	OUT_RING(ring, CACHE_FLUSH_TS | BIT(31));
+	OUT_RING(ring, rbmemptr(ring, fence));
+	OUT_RING(ring, submit->seqno);
+
+#if 0
+	/* Dummy set-constant to trigger context rollover */
+	OUT_PKT3(ring, CP_SET_CONSTANT, 2);
+	OUT_RING(ring, CP_REG(REG_A3XX_HLSQ_CL_KERNEL_GROUP_X_REG));
+	OUT_RING(ring, 0x00000000);
+#endif
+
+	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
+}
+
 static bool a3xx_me_init(struct msm_gpu *gpu)
 {
 	struct msm_ringbuffer *ring = gpu->rb[0];
@@ -51,7 +106,7 @@ static bool a3xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 
-	gpu->funcs->flush(gpu, ring);
+	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
 	return a3xx_idle(gpu);
 }
 
@@ -423,16 +478,11 @@ static struct msm_gpu_state *a3xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
-/* Register offset defines for A3XX */
-static const unsigned int a3xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_BASE_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR, REG_AXXX_CP_RB_RPTR_ADDR),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_RPTR_ADDR_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR, REG_AXXX_CP_RB_RPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_WPTR, REG_AXXX_CP_RB_WPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_AXXX_CP_RB_CNTL),
-};
+static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
+	return ring->memptrs->rptr;
+}
 
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
@@ -441,8 +491,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.pm_suspend = msm_gpu_pm_suspend,
 		.pm_resume = msm_gpu_pm_resume,
 		.recover = a3xx_recover,
-		.submit = adreno_submit,
-		.flush = adreno_flush,
+		.submit = a3xx_submit,
 		.active_ring = adreno_active_ring,
 		.irq = a3xx_irq,
 		.destroy = a3xx_destroy,
@@ -452,6 +501,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a3xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_iommu_create_address_space,
+		.get_rptr = a3xx_get_rptr,
 	},
 };
 
@@ -490,7 +540,6 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
 
 	adreno_gpu->registers = a3xx_registers;
-	adreno_gpu->reg_offsets = a3xx_register_offsets;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 954753600625..2b93b33b05e4 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -22,6 +22,54 @@ extern bool hang_debug;
 static void a4xx_dump(struct msm_gpu *gpu);
 static bool a4xx_idle(struct msm_gpu *gpu);
 
+static void a4xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_ringbuffer *ring = submit->ring;
+	unsigned int i;
+
+	for (i = 0; i < submit->nr_cmds; i++) {
+		switch (submit->cmd[i].type) {
+		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
+			/* ignore IB-targets */
+			break;
+		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
+			/* ignore if there has not been a ctx switch: */
+			if (priv->lastctx == submit->queue->ctx)
+				break;
+			fallthrough;
+		case MSM_SUBMIT_CMD_BUF:
+			OUT_PKT3(ring, CP_INDIRECT_BUFFER_PFE, 2);
+			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
+			OUT_RING(ring, submit->cmd[i].size);
+			OUT_PKT2(ring);
+			break;
+		}
+	}
+
+	OUT_PKT0(ring, REG_AXXX_CP_SCRATCH_REG2, 1);
+	OUT_RING(ring, submit->seqno);
+
+	/* Flush HLSQ lazy updates to make sure there is nothing
+	 * pending for indirect loads after the timestamp has
+	 * passed:
+	 */
+	OUT_PKT3(ring, CP_EVENT_WRITE, 1);
+	OUT_RING(ring, HLSQ_FLUSH);
+
+	/* wait for idle before cache flush/interrupt */
+	OUT_PKT3(ring, CP_WAIT_FOR_IDLE, 1);
+	OUT_RING(ring, 0x00000000);
+
+	/* BIT(31) of CACHE_FLUSH_TS triggers CACHE_FLUSH_TS IRQ from GPU */
+	OUT_PKT3(ring, CP_EVENT_WRITE, 3);
+	OUT_RING(ring, CACHE_FLUSH_TS | BIT(31));
+	OUT_RING(ring, rbmemptr(ring, fence));
+	OUT_RING(ring, submit->seqno);
+
+	adreno_flush(gpu, ring, REG_A4XX_CP_RB_WPTR);
+}
+
 /*
  * a4xx_enable_hwcg() - Program the clock control registers
  * @device: The adreno device pointer
@@ -129,7 +177,7 @@ static bool a4xx_me_init(struct msm_gpu *gpu)
 	OUT_RING(ring, 0x00000000);
 	OUT_RING(ring, 0x00000000);
 
-	gpu->funcs->flush(gpu, ring);
+	adreno_flush(gpu, ring, REG_A4XX_CP_RB_WPTR);
 	return a4xx_idle(gpu);
 }
 
@@ -515,17 +563,6 @@ static struct msm_gpu_state *a4xx_gpu_state_get(struct msm_gpu *gpu)
 	return state;
 }
 
-/* Register offset defines for A4XX, in order of enum adreno_regs */
-static const unsigned int a4xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_A4XX_CP_RB_BASE),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_BASE_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR, REG_A4XX_CP_RB_RPTR_ADDR),
-	REG_ADRENO_SKIP(REG_ADRENO_CP_RB_RPTR_ADDR_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR, REG_A4XX_CP_RB_RPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_WPTR, REG_A4XX_CP_RB_WPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A4XX_CP_RB_CNTL),
-};
-
 static void a4xx_dump(struct msm_gpu *gpu)
 {
 	printk("status:   %08x\n",
@@ -576,6 +613,12 @@ static int a4xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
 	return 0;
 }
 
+static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	ring->memptrs->rptr = gpu_read(gpu, REG_A4XX_CP_RB_RPTR);
+	return ring->memptrs->rptr;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -583,8 +626,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.pm_suspend = a4xx_pm_suspend,
 		.pm_resume = a4xx_pm_resume,
 		.recover = a4xx_recover,
-		.submit = adreno_submit,
-		.flush = adreno_flush,
+		.submit = a4xx_submit,
 		.active_ring = adreno_active_ring,
 		.irq = a4xx_irq,
 		.destroy = a4xx_destroy,
@@ -594,6 +636,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a4xx_gpu_state_get,
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_address_space = adreno_iommu_create_address_space,
+		.get_rptr = a4xx_get_rptr,
 	},
 	.get_timestamp = a4xx_get_timestamp,
 };
@@ -631,15 +674,12 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = adreno_is_a405(adreno_gpu) ? a405_registers :
 							     a4xx_registers;
-	adreno_gpu->reg_offsets = a4xx_register_offsets;
 
 	/* if needed, allocate gmem: */
-	if (adreno_is_a4xx(adreno_gpu)) {
-		ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
-					    &a4xx_gpu->ocmem);
-		if (ret)
-			goto fail;
-	}
+	ret = adreno_gpu_ocmem_init(dev->dev, adreno_gpu,
+				    &a4xx_gpu->ocmem);
+	if (ret)
+		goto fail;
 
 	if (!gpu->aspace) {
 		/* TODO we think it is possible to configure the GPU to
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 835aaef72b00..c941c8138f25 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1121,17 +1121,6 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
 	return IRQ_HANDLED;
 }
 
-static const u32 a5xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_A5XX_CP_RB_BASE),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE_HI, REG_A5XX_CP_RB_BASE_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR, REG_A5XX_CP_RB_RPTR_ADDR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR_HI,
-		REG_A5XX_CP_RB_RPTR_ADDR_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR, REG_A5XX_CP_RB_RPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_WPTR, REG_A5XX_CP_RB_WPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A5XX_CP_RB_CNTL),
-};
-
 static const u32 a5xx_registers[] = {
 	0x0000, 0x0002, 0x0004, 0x0020, 0x0022, 0x0026, 0x0029, 0x002B,
 	0x002E, 0x0035, 0x0038, 0x0042, 0x0044, 0x0044, 0x0047, 0x0095,
@@ -1587,7 +1576,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	gpu = &adreno_gpu->base;
 
 	adreno_gpu->registers = a5xx_registers;
-	adreno_gpu->reg_offsets = a5xx_register_offsets;
 
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9cce2b01b1a7..3248c89aa001 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1022,18 +1022,6 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	return IRQ_HANDLED;
 }
 
-static const u32 a6xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_A6XX_CP_RB_BASE),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE_HI, REG_A6XX_CP_RB_BASE_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR,
-		REG_A6XX_CP_RB_RPTR_ADDR_LO),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR_ADDR_HI,
-		REG_A6XX_CP_RB_RPTR_ADDR_HI),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_RPTR, REG_A6XX_CP_RB_RPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_WPTR, REG_A6XX_CP_RB_WPTR),
-	REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_CNTL, REG_A6XX_CP_RB_CNTL),
-};
-
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -1208,7 +1196,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	gpu = &adreno_gpu->base;
 
 	adreno_gpu->registers = NULL;
-	adreno_gpu->reg_offsets = a6xx_register_offsets;
 
 	if (adreno_is_a650(adreno_gpu))
 		adreno_gpu->base.hw_apriv = true;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 11635e39ca19..fd8f491f2e48 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -424,11 +424,7 @@ static uint32_t get_rptr(struct adreno_gpu *adreno_gpu,
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
-	if (gpu->funcs->get_rptr)
-		return gpu->funcs->get_rptr(gpu, ring);
-
-	return ring->memptrs->rptr = adreno_gpu_read(
-		adreno_gpu, REG_ADRENO_CP_RB_RPTR);
+	return gpu->funcs->get_rptr(gpu, ring);
 }
 
 struct msm_ringbuffer *adreno_active_ring(struct msm_gpu *gpu)
@@ -454,80 +450,8 @@ void adreno_recover(struct msm_gpu *gpu)
 	}
 }
 
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
+void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, u32 reg)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct msm_drm_private *priv = gpu->dev->dev_private;
-	struct msm_ringbuffer *ring = submit->ring;
-	unsigned i;
-
-	for (i = 0; i < submit->nr_cmds; i++) {
-		switch (submit->cmd[i].type) {
-		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
-			/* ignore IB-targets */
-			break;
-		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == submit->queue->ctx)
-				break;
-			/* fall-thru */
-		case MSM_SUBMIT_CMD_BUF:
-			OUT_PKT3(ring, adreno_is_a4xx(adreno_gpu) ?
-				CP_INDIRECT_BUFFER_PFE : CP_INDIRECT_BUFFER_PFD, 2);
-			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
-			OUT_RING(ring, submit->cmd[i].size);
-			OUT_PKT2(ring);
-			break;
-		}
-	}
-
-	OUT_PKT0(ring, REG_AXXX_CP_SCRATCH_REG2, 1);
-	OUT_RING(ring, submit->seqno);
-
-	if (adreno_is_a3xx(adreno_gpu) || adreno_is_a4xx(adreno_gpu)) {
-		/* Flush HLSQ lazy updates to make sure there is nothing
-		 * pending for indirect loads after the timestamp has
-		 * passed:
-		 */
-		OUT_PKT3(ring, CP_EVENT_WRITE, 1);
-		OUT_RING(ring, HLSQ_FLUSH);
-	}
-
-	/* wait for idle before cache flush/interrupt */
-	OUT_PKT3(ring, CP_WAIT_FOR_IDLE, 1);
-	OUT_RING(ring, 0x00000000);
-
-	if (!adreno_is_a2xx(adreno_gpu)) {
-		/* BIT(31) of CACHE_FLUSH_TS triggers CACHE_FLUSH_TS IRQ from GPU */
-		OUT_PKT3(ring, CP_EVENT_WRITE, 3);
-		OUT_RING(ring, CACHE_FLUSH_TS | BIT(31));
-		OUT_RING(ring, rbmemptr(ring, fence));
-		OUT_RING(ring, submit->seqno);
-	} else {
-		/* BIT(31) means something else on a2xx */
-		OUT_PKT3(ring, CP_EVENT_WRITE, 3);
-		OUT_RING(ring, CACHE_FLUSH_TS);
-		OUT_RING(ring, rbmemptr(ring, fence));
-		OUT_RING(ring, submit->seqno);
-		OUT_PKT3(ring, CP_INTERRUPT, 1);
-		OUT_RING(ring, 0x80000000);
-	}
-
-#if 0
-	if (adreno_is_a3xx(adreno_gpu)) {
-		/* Dummy set-constant to trigger context rollover */
-		OUT_PKT3(ring, CP_SET_CONSTANT, 2);
-		OUT_RING(ring, CP_REG(REG_A3XX_HLSQ_CL_KERNEL_GROUP_X_REG));
-		OUT_RING(ring, 0x00000000);
-	}
-#endif
-
-	gpu->funcs->flush(gpu, ring);
-}
-
-void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
-{
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	uint32_t wptr;
 
 	/* Copy the shadow to the actual register */
@@ -543,7 +467,7 @@ void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* ensure writes to ringbuffer have hit system memory: */
 	mb();
 
-	adreno_gpu_write(adreno_gpu, REG_ADRENO_CP_RB_WPTR, wptr);
+	gpu_write(gpu, reg, wptr);
 }
 
 bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 848632758450..c3775f79525a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -17,29 +17,8 @@
 #include "adreno_common.xml.h"
 #include "adreno_pm4.xml.h"
 
-#define REG_ADRENO_DEFINE(_offset, _reg) [_offset] = (_reg) + 1
-#define REG_SKIP ~0
-#define REG_ADRENO_SKIP(_offset) [_offset] = REG_SKIP
-
 extern bool snapshot_debugbus;
 
-/**
- * adreno_regs: List of registers that are used in across all
- * 3D devices. Each device type has different offset value for the same
- * register, so an array of register offsets are declared for every device
- * and are indexed by the enumeration values defined in this enum
- */
-enum adreno_regs {
-	REG_ADRENO_CP_RB_BASE,
-	REG_ADRENO_CP_RB_BASE_HI,
-	REG_ADRENO_CP_RB_RPTR_ADDR,
-	REG_ADRENO_CP_RB_RPTR_ADDR_HI,
-	REG_ADRENO_CP_RB_RPTR,
-	REG_ADRENO_CP_RB_WPTR,
-	REG_ADRENO_CP_RB_CNTL,
-	REG_ADRENO_REGISTER_MAX,
-};
-
 enum {
 	ADRENO_FW_PM4 = 0,
 	ADRENO_FW_SQE = 0, /* a6xx */
@@ -176,11 +155,6 @@ static inline bool adreno_is_a225(struct adreno_gpu *gpu)
 	return gpu->revn == 225;
 }
 
-static inline bool adreno_is_a3xx(struct adreno_gpu *gpu)
-{
-	return (gpu->revn >= 300) && (gpu->revn < 400);
-}
-
 static inline bool adreno_is_a305(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 305;
@@ -207,11 +181,6 @@ static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
 	return adreno_is_a330(gpu) && (gpu->rev.patchid > 0);
 }
 
-static inline bool adreno_is_a4xx(struct adreno_gpu *gpu)
-{
-	return (gpu->revn >= 400) && (gpu->revn < 500);
-}
-
 static inline int adreno_is_a405(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 405;
@@ -269,8 +238,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 		const struct firmware *fw, u64 *iova);
 int adreno_hw_init(struct msm_gpu *gpu);
 void adreno_recover(struct msm_gpu *gpu);
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
-void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, u32 reg);
 bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
 void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
@@ -364,59 +332,12 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 		((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
 }
 
-/*
- * adreno_reg_check() - Checks the validity of a register enum
- * @gpu:		Pointer to struct adreno_gpu
- * @offset_name:	The register enum that is checked
- */
-static inline bool adreno_reg_check(struct adreno_gpu *gpu,
-		enum adreno_regs offset_name)
-{
-	BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
-
-	/*
-	 * REG_SKIP is a special value that tell us that the register in
-	 * question isn't implemented on target but don't trigger a BUG(). This
-	 * is used to cleanly implement adreno_gpu_write64() and
-	 * adreno_gpu_read64() in a generic fashion
-	 */
-	if (gpu->reg_offsets[offset_name] == REG_SKIP)
-		return false;
-
-	return true;
-}
-
-static inline u32 adreno_gpu_read(struct adreno_gpu *gpu,
-		enum adreno_regs offset_name)
-{
-	u32 reg = gpu->reg_offsets[offset_name];
-	u32 val = 0;
-	if(adreno_reg_check(gpu,offset_name))
-		val = gpu_read(&gpu->base, reg - 1);
-	return val;
-}
-
-static inline void adreno_gpu_write(struct adreno_gpu *gpu,
-		enum adreno_regs offset_name, u32 data)
-{
-	u32 reg = gpu->reg_offsets[offset_name];
-	if(adreno_reg_check(gpu, offset_name))
-		gpu_write(&gpu->base, reg - 1, data);
-}
-
 struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
 struct msm_gpu *a3xx_gpu_init(struct drm_device *dev);
 struct msm_gpu *a4xx_gpu_init(struct drm_device *dev);
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev);
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev);
 
-static inline void adreno_gpu_write64(struct adreno_gpu *gpu,
-		enum adreno_regs lo, enum adreno_regs hi, u64 data)
-{
-	adreno_gpu_write(gpu, lo, lower_32_bits(data));
-	adreno_gpu_write(gpu, hi, upper_32_bits(data));
-}
-
 static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 {
 	return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
