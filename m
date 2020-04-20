Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FDB1B1F12
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01636E8B7;
	Tue, 21 Apr 2020 06:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429516E593
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:03:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i68so2759908qtb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jp8c/vByfKKqlYxQoHIH2aDBNiCrvKJ3GjxraMqpLdo=;
 b=Uirl2MPZVm8uIdFiMg+M2K0RVFyIBMrNs0G+kqcQoNrx7VXKAPYgMqJoP7oA4hKPlz
 SUKtYFnPwSLWOMHdj2fNYJjCc7XQZAxB6HaqNedJSKYFQcP7+ZiCE1wy/fYxem1gUXeM
 94xlBwHisk6UXKWPm0B0xyeiuTkE9LjF9PT3fGx2baqGst1D3BR1uoH+uQcsFIZ84bx1
 exy8iFhb1u/3stOZbH8scSYJCC3fe3rQH6kDP/sTT3rRjPsL9Z4vmgvQZPtVtOGTkFEz
 tVrMVI1OyzJ7OPQabhA/P7TqWHwWOva4UGi8tNq2jxMjbZQNmO202UPJVYaRsaKJcOw2
 LL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jp8c/vByfKKqlYxQoHIH2aDBNiCrvKJ3GjxraMqpLdo=;
 b=UcUno29fb/1dN6qUniPjwg2UElKuOlmQJ113qxEYe1bWkpauTRLBU9JoXa5EgVHwV8
 uo9LiS8NEBQbdGDPo6mRPOM53kIYUoUAgaf7Ftn4iB1awtNNwfjoQtxN+dDfTLT1aLrG
 7FQTCrj5/yR/rwZF+ILWUAIbHupX9SULHW6v7QlhT4/MfshVIY7P8xS11nwQgzkmxWoj
 M6RAKywQsIodEWeviTQsAuI0wy4iaMliPQmVORqzBwghc29wCtbXQ3a2Uq57vEV5q5vm
 oQ++le26wleAKu5pWqTpl4760s7RGhxMQhyINEcGy6yEVjaFdGCMNZ3BBYEa9kBpcEru
 G3Lg==
X-Gm-Message-State: AGi0PuZ8IXQdfwkt8boyE9RZRNP2/OOQw3lV9fiy+jTsOSUD2WyzqD1N
 hb75YVYOwr743ndysSdUYbVoXw==
X-Google-Smtp-Source: APiQypLfVVerLKQ5iFXxJG8CT9DO9FI3UfedE+T9G+wKpwpf5jCv3+jk163/ZH36BBIBSj8XjwgHWg==
X-Received: by 2002:ac8:4983:: with SMTP id f3mr16169700qtq.343.1587391430990; 
 Mon, 20 Apr 2020 07:03:50 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:03:50 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 4/9] drm/msm/a6xx: HFI v2 for A640 and A650
Date: Mon, 20 Apr 2020 10:03:08 -0400
Message-Id: <20200420140313.7263-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  68 ++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   7 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   6 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 117 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  50 ++++++++++-
 5 files changed, 224 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c6ecb3189ec5..dc2d69837110 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -126,8 +126,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
-	gmu->freq = gmu->gpu_freqs[index];
-
 	/*
 	 * Eventually we will want to scale the path vote with the frequency but
 	 * for now leave it at max so that the performance is nominal.
@@ -151,7 +149,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
 
 	gmu->current_perf_index = perf_index;
 
-	__a6xx_gmu_set_freq(gmu, perf_index);
+	if (gmu->legacy)
+		__a6xx_gmu_set_freq(gmu, perf_index);
+	else
+		a6xx_hfi_set_freq(gmu, perf_index);
+
+	gmu->freq = gmu->gpu_freqs[perf_index];
 }
 
 unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
@@ -231,19 +234,26 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 
 	switch (state) {
 	case GMU_OOB_GPU_SET:
-		request = GMU_OOB_GPU_SET_REQUEST;
-		ack = GMU_OOB_GPU_SET_ACK;
+		if (gmu->legacy) {
+			request = GMU_OOB_GPU_SET_REQUEST;
+			ack = GMU_OOB_GPU_SET_ACK;
+		} else {
+			request = GMU_OOB_GPU_SET_REQUEST_NEW;
+			ack = GMU_OOB_GPU_SET_ACK_NEW;
+		}
 		name = "GPU_SET";
 		break;
 	case GMU_OOB_BOOT_SLUMBER:
 		request = GMU_OOB_BOOT_SLUMBER_REQUEST;
 		ack = GMU_OOB_BOOT_SLUMBER_ACK;
 		name = "BOOT_SLUMBER";
+		WARN_ON(!gmu->legacy);
 		break;
 	case GMU_OOB_DCVS_SET:
 		request = GMU_OOB_DCVS_REQUEST;
 		ack = GMU_OOB_DCVS_ACK;
 		name = "GPU_DCVS";
+		WARN_ON(!gmu->legacy);
 		break;
 	default:
 		return -EINVAL;
@@ -271,6 +281,13 @@ int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 /* Clear a pending OOB state in the GMU */
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 {
+	if (!gmu->legacy) {
+		WARN_ON(state != GMU_OOB_GPU_SET);
+		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
+			1 << GMU_OOB_GPU_SET_CLEAR_NEW);
+		return;
+	}
+
 	switch (state) {
 	case GMU_OOB_GPU_SET:
 		gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET,
@@ -293,6 +310,9 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
+	if (!gmu->legacy)
+		return 0;
+
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS, val,
@@ -312,6 +332,9 @@ static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 	u32 val;
 	int ret;
 
+	if (!gmu->legacy)
+		return;
+
 	/* Make sure retention is on */
 	gmu_rmw(gmu, REG_A6XX_GPU_CC_GX_GDSCR, 0, (1 << 11));
 
@@ -355,6 +378,11 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 	if (gmu->idle_level < GMU_IDLE_STATE_SPTP)
 		a6xx_sptprac_disable(gmu);
 
+	if (!gmu->legacy) {
+		ret = a6xx_hfi_send_prep_slumber(gmu);
+		goto out;
+	}
+
 	/* Tell the GMU to get ready to slumber */
 	gmu_write(gmu, REG_A6XX_GMU_BOOT_SLUMBER_OPTION, 1);
 
@@ -370,6 +398,7 @@ static int a6xx_gmu_notify_slumber(struct a6xx_gmu *gmu)
 		}
 	}
 
+out:
 	/* Put fence into allow mode */
 	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 	return ret;
@@ -639,9 +668,11 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	if (ret)
 		return ret;
 
-	ret = a6xx_gmu_gfx_rail_on(gmu);
-	if (ret)
-		return ret;
+	if (gmu->legacy) {
+		ret = a6xx_gmu_gfx_rail_on(gmu);
+		if (ret)
+			return ret;
+	}
 
 	/* Enable SPTP_PC if the CPU is responsible for it */
 	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
@@ -760,7 +791,10 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	enable_irq(gmu->hfi_irq);
 
 	/* Set the GPU to the current freq */
-	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
+	if (gmu->legacy)
+		__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
+	else
+		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
 
 	/*
 	 * "enable" the GX power domain which won't actually do anything but it
@@ -1305,6 +1339,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = of_find_device_by_node(node);
 	int ret;
@@ -1331,16 +1366,21 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_put_device;
 
+	if (!adreno_is_a640(adreno_gpu) && !adreno_is_a650(adreno_gpu)) {
+		/* HFI v1, no sptprac */
+		gmu->legacy = true;
+
+		/* Allocate memory for the GMU debug region */
+		gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
+		if (IS_ERR(gmu->debug))
+			goto err_memory;
+	}
+
 	/* Allocate memory for for the HFI queues */
 	gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
 	if (IS_ERR(gmu->hfi))
 		goto err_memory;
 
-	/* Allocate memory for the GMU debug region */
-	gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K, 0);
-	if (IS_ERR(gmu->debug))
-		goto err_memory;
-
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio))
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 2af91ed7ed0c..781714ffaa91 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -80,6 +80,7 @@ struct a6xx_gmu {
 
 	bool initialized;
 	bool hung;
+	bool legacy; /* a618 or a630 */
 };
 
 static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
@@ -160,10 +161,16 @@ enum a6xx_gmu_oob_state {
 #define GMU_OOB_GPU_SET_ACK	24
 #define GMU_OOB_GPU_SET_CLEAR	24
 
+#define GMU_OOB_GPU_SET_REQUEST_NEW	30
+#define GMU_OOB_GPU_SET_ACK_NEW		31
+#define GMU_OOB_GPU_SET_CLEAR_NEW	31
+
 
 void a6xx_hfi_init(struct a6xx_gmu *gmu);
 int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
 void a6xx_hfi_stop(struct a6xx_gmu *gmu);
+int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 68af24150de5..a860d4970e10 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -566,8 +566,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-	/* Take the GMU out of its special boot mode */
-	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
+	if (a6xx_gpu->gmu.legacy) {
+		/* Take the GMU out of its special boot mode */
+		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
+	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index e450e0b97211..3d4b142d8fb3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -17,10 +17,14 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_BW_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_TEST),
+	HFI_MSG_ID(HFI_H2F_MSG_START),
+	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
+	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
+	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
 };
 
-static int a6xx_hfi_queue_read(struct a6xx_hfi_queue *queue, u32 *data,
-		u32 dwords)
+static int a6xx_hfi_queue_read(struct a6xx_gmu *gmu,
+	struct a6xx_hfi_queue *queue, u32 *data, u32 dwords)
 {
 	struct a6xx_hfi_queue_header *header = queue->header;
 	u32 i, hdr, index = header->read_index;
@@ -48,6 +52,9 @@ static int a6xx_hfi_queue_read(struct a6xx_hfi_queue *queue, u32 *data,
 		index = (index + 1) % header->size;
 	}
 
+	if (!gmu->legacy)
+		index = ALIGN(index, 4) % header->size;
+
 	header->read_index = index;
 	return HFI_HEADER_SIZE(hdr);
 }
@@ -73,6 +80,12 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 		index = (index + 1) % header->size;
 	}
 
+	/* Cookify any non used data at the end of the write buffer */
+	if (!gmu->legacy) {
+		for (; index % 4; index = (index + 1) % header->size)
+			queue->data[index] = 0xfafafafa;
+	}
+
 	header->write_index = index;
 	spin_unlock(&queue->lock);
 
@@ -106,7 +119,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 		struct a6xx_hfi_msg_response resp;
 
 		/* Get the next packet */
-		ret = a6xx_hfi_queue_read(queue, (u32 *) &resp,
+		ret = a6xx_hfi_queue_read(gmu, queue, (u32 *) &resp,
 			sizeof(resp) >> 2);
 
 		/* If the queue is empty our response never made it */
@@ -195,6 +208,28 @@ static int a6xx_hfi_get_fw_version(struct a6xx_gmu *gmu, u32 *version)
 		version, sizeof(*version));
 }
 
+static int a6xx_hfi_send_perf_table_v1(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_msg_perf_table_v1 msg = { 0 };
+	int i;
+
+	msg.num_gpu_levels = gmu->nr_gpu_freqs;
+	msg.num_gmu_levels = gmu->nr_gmu_freqs;
+
+	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
+		msg.gx_votes[i].vote = gmu->gx_arc_votes[i];
+		msg.gx_votes[i].freq = gmu->gpu_freqs[i] / 1000;
+	}
+
+	for (i = 0; i < gmu->nr_gmu_freqs; i++) {
+		msg.cx_votes[i].vote = gmu->cx_arc_votes[i];
+		msg.cx_votes[i].freq = gmu->gmu_freqs[i] / 1000;
+	}
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_PERF_TABLE, &msg, sizeof(msg),
+		NULL, 0);
+}
+
 static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_perf_table msg = { 0 };
@@ -205,6 +240,7 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 
 	for (i = 0; i < gmu->nr_gpu_freqs; i++) {
 		msg.gx_votes[i].vote = gmu->gx_arc_votes[i];
+		msg.gx_votes[i].acd = 0xffffffff;
 		msg.gx_votes[i].freq = gmu->gpu_freqs[i] / 1000;
 	}
 
@@ -306,7 +342,45 @@ static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
+int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_msg_start msg = { 0 };
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_START, &msg, sizeof(msg),
+		NULL, 0);
+}
+
+int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_msg_core_fw_start msg = { 0 };
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_CORE_FW_START, &msg,
+		sizeof(msg), NULL, 0);
+}
+
+int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
+{
+	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
+
+	msg.ack_type = 1; /* blocking */
+	msg.freq = index;
+	msg.bw = 0; /* TODO: bus scaling */
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
+		sizeof(msg), NULL, 0);
+}
+
+int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_prep_slumber_cmd msg = { 0 };
+
+	/* TODO: should freq and bw fields be non-zero ? */
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_PREPARE_SLUMBER, &msg,
+		sizeof(msg), NULL, 0);
+}
+
+static int a6xx_hfi_start_v1(struct a6xx_gmu *gmu, int boot_state)
 {
 	int ret;
 
@@ -324,7 +398,7 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	 * the GMU firmware
 	 */
 
-	ret = a6xx_hfi_send_perf_table(gmu);
+	ret = a6xx_hfi_send_perf_table_v1(gmu);
 	if (ret)
 		return ret;
 
@@ -341,6 +415,37 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	return 0;
 }
 
+int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
+{
+	int ret;
+
+	if (gmu->legacy)
+		return a6xx_hfi_start_v1(gmu, boot_state);
+
+
+	ret = a6xx_hfi_send_perf_table(gmu);
+	if (ret)
+		return ret;
+
+	ret = a6xx_hfi_send_bw_table(gmu);
+	if (ret)
+		return ret;
+
+	ret = a6xx_hfi_send_core_fw_start(gmu);
+	if (ret)
+		return ret;
+
+	/*
+	 * Downstream driver sends this in its "a6xx_hw_init" equivalent,
+	 * but seems to be no harm in sending it here
+	 */
+	ret = a6xx_hfi_send_start(gmu);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 void a6xx_hfi_stop(struct a6xx_gmu *gmu)
 {
 	int i;
@@ -415,5 +520,5 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
 	/* GMU response queue */
 	offset += SZ_4K;
 	a6xx_hfi_queue_init(&gmu->queues[1], &headers[1], hfi->virt + offset,
-		hfi->iova + offset, 4);
+		hfi->iova + offset, gmu->legacy ? 4 : 1);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 60d1319fa44f..2bd670ca42d6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -51,7 +51,8 @@ struct a6xx_hfi_queue {
 /* HFI message types */
 
 #define HFI_MSG_CMD 0
-#define HFI_MSG_ACK 2
+#define HFI_MSG_ACK 1
+#define HFI_MSG_ACK_V1 2
 
 #define HFI_F2H_MSG_ACK 126
 
@@ -94,7 +95,13 @@ struct perf_level {
 	u32 freq;
 };
 
-struct a6xx_hfi_msg_perf_table {
+struct perf_gx_level {
+	u32 vote;
+	u32 acd;
+	u32 freq;
+};
+
+struct a6xx_hfi_msg_perf_table_v1 {
 	u32 header;
 	u32 num_gpu_levels;
 	u32 num_gmu_levels;
@@ -103,6 +110,15 @@ struct a6xx_hfi_msg_perf_table {
 	struct perf_level cx_votes[4];
 };
 
+struct a6xx_hfi_msg_perf_table {
+	u32 header;
+	u32 num_gpu_levels;
+	u32 num_gmu_levels;
+
+	struct perf_gx_level gx_votes[16];
+	struct perf_level cx_votes[4];
+};
+
 #define HFI_H2F_MSG_BW_TABLE 3
 
 struct a6xx_hfi_msg_bw_table {
@@ -124,4 +140,34 @@ struct a6xx_hfi_msg_test {
 	u32 header;
 };
 
+#define HFI_H2F_MSG_START 10
+
+struct a6xx_hfi_msg_start {
+	u32 header;
+};
+
+#define HFI_H2F_MSG_CORE_FW_START 14
+
+struct a6xx_hfi_msg_core_fw_start {
+	u32 header;
+	u32 handle;
+};
+
+#define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
+
+struct a6xx_hfi_gx_bw_perf_vote_cmd {
+	u32 header;
+	u32 ack_type;
+	u32 freq;
+	u32 bw;
+};
+
+#define HFI_H2F_MSG_PREPARE_SLUMBER 33
+
+struct a6xx_hfi_prep_slumber_cmd {
+	u32 header;
+	u32 bw;
+	u32 freq;
+};
+
 #endif
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
