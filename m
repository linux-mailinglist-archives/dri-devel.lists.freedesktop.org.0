Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD92263FA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C6B89C80;
	Mon, 20 Jul 2020 15:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C74B89C1F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 15:41:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595259704; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8CLzcJHbBsfbAWL6g+uKa54bEkvfO270xTZtQNI44WY=;
 b=cHmhvkAwlyQraEhroCkH5KRY0EOmcXP2gcduF+6uAz2kGEUhqULwxPXqfJ2AXHGmIDrmm4Ez
 smloRPA8aEYxvg82L0uDjc4n3RfgLiNUCms79GAGZa4FNt3jKIQiWWKQhukdpMUKBQTQ0Syj
 /i/do6aa3mwg9RgSPnsbpCbAb4w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f15bb29c7a053446a4c45ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 15:41:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4FA6C43450; Mon, 20 Jul 2020 15:41:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F9B6C433C9;
 Mon, 20 Jul 2020 15:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F9B6C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 08/13] drm/msm: Add a context pointer to the submitqueue
Date: Mon, 20 Jul 2020 09:40:42 -0600
Message-Id: <20200720154047.3611092-9-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720154047.3611092-1-jcrouse@codeaurora.org>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, iommu@lists.linux-foundation.org,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Sharat Masetty <smasetty@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each submitqueue is attached to a context. Add a pointer to the
context to the submitqueue at create time and refcount it so
that it stays around through the life of the queue.

GPU submissions can access the active context via the submitqueue
instead of requiring it to be passed around from function to
function.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
 drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
 drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem.h           |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
 drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
 drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
 11 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 9e63a190642c..eff2439ea57b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -43,8 +43,7 @@ static void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 		gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
 }
 
-static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
 	struct msm_ringbuffer *ring = submit->ring;
@@ -57,7 +56,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
@@ -103,8 +102,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
 	msm_gpu_retire(gpu);
 }
 
-static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
@@ -114,7 +112,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 
 	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
 		priv->lastctx = NULL;
-		a5xx_submit_in_rb(gpu, submit, ctx);
+		a5xx_submit_in_rb(gpu, submit);
 		return;
 	}
 
@@ -148,7 +146,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5a3e4d4c007..5eabb0109577 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -81,8 +81,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 	OUT_RING(ring, upper_32_bits(iova));
 }
 
-static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-	struct msm_file_private *ctx)
+static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -115,7 +114,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e23641a5ec84..b38a8126541a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -457,8 +457,7 @@ void adreno_recover(struct msm_gpu *gpu)
 	}
 }
 
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx)
+void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -472,7 +471,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 			break;
 		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
 			/* ignore if there has not been a ctx switch: */
-			if (priv->lastctx == ctx)
+			if (priv->lastctx == submit->queue->ctx)
 				break;
 			/* fall-thru */
 		case MSM_SUBMIT_CMD_BUF:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 99bb468f5f24..0ae8b373c428 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -267,8 +267,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 		const struct firmware *fw, u64 *iova);
 int adreno_hw_init(struct msm_gpu *gpu);
 void adreno_recover(struct msm_gpu *gpu);
-void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx);
+void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ff379ed40469..556198d4ba5f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -600,6 +600,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
+	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
 	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
@@ -621,7 +622,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 static void context_close(struct msm_file_private *ctx)
 {
 	msm_submitqueue_close(ctx);
-	kfree(ctx);
+	kref_put(&ctx->ref, msm_file_private_destroy);
 }
 
 static void msm_postclose(struct drm_device *dev, struct drm_file *file)
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2687f7a42c15..ab5f77261816 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -57,6 +57,7 @@ struct msm_file_private {
 	struct list_head submitqueues;
 	int queueid;
 	struct msm_gem_address_space *aspace;
+	struct kref ref;
 };
 
 enum msm_mdp_plane_property {
@@ -429,6 +430,13 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+static inline void msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	kfree(ctx);
+}
 
 #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
 #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 972490b14ba5..9c573c4269cb 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -142,6 +142,7 @@ struct msm_gem_submit {
 	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
+	struct msm_file_private *ctx;
 	unsigned int nr_cmds;
 	unsigned int nr_bos;
 	u32 ident;	   /* A "identifier" for the submit for logging */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8cb9aa15ff90..aa5c60a7132d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -27,7 +27,7 @@
 #define BO_PINNED   0x2000
 
 static struct msm_gem_submit *submit_create(struct drm_device *dev,
-		struct msm_gpu *gpu, struct msm_gem_address_space *aspace,
+		struct msm_gpu *gpu,
 		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
 		uint32_t nr_cmds)
 {
@@ -43,7 +43,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		return NULL;
 
 	submit->dev = dev;
-	submit->aspace = aspace;
+	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
 	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
@@ -677,7 +677,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	submit = submit_create(dev, gpu, ctx->aspace, queue, args->nr_bos,
+	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
 	if (!submit) {
 		ret = -ENOMEM;
@@ -785,7 +785,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		}
 	}
 
-	msm_gpu_submit(gpu, submit, ctx);
+	msm_gpu_submit(gpu, submit);
 
 	args->fence = submit->fence->seqno;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d5645472b25d..a1f3da6550e5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -520,7 +520,7 @@ static void recover_worker(struct work_struct *work)
 			struct msm_ringbuffer *ring = gpu->rb[i];
 
 			list_for_each_entry(submit, &ring->submits, node)
-				gpu->funcs->submit(gpu, submit, NULL);
+				gpu->funcs->submit(gpu, submit);
 		}
 	}
 
@@ -747,8 +747,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
 }
 
 /* add bo's to gpu's ring, and kick gpu: */
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx)
+void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 {
 	struct drm_device *dev = gpu->dev;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -788,8 +787,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
 			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
 	}
 
-	gpu->funcs->submit(gpu, submit, ctx);
-	priv->lastctx = ctx;
+	gpu->funcs->submit(gpu, submit);
+	priv->lastctx = submit->queue->ctx;
 
 	hangcheck_timer_reset(gpu);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 0db117a7339b..d496d488222c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -44,8 +44,7 @@ struct msm_gpu_funcs {
 	int (*hw_init)(struct msm_gpu *gpu);
 	int (*pm_suspend)(struct msm_gpu *gpu);
 	int (*pm_resume)(struct msm_gpu *gpu);
-	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-			struct msm_file_private *ctx);
+	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 	void (*flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	irqreturn_t (*irq)(struct msm_gpu *irq);
 	struct msm_ringbuffer *(*active_ring)(struct msm_gpu *gpu);
@@ -181,6 +180,7 @@ struct msm_gpu_submitqueue {
 	u32 flags;
 	u32 prio;
 	int faults;
+	struct msm_file_private *ctx;
 	struct list_head node;
 	struct kref ref;
 };
@@ -280,8 +280,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
 		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
 
 void msm_gpu_retire(struct msm_gpu *gpu);
-void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
-		struct msm_file_private *ctx);
+void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
 
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a1d94be7883a..10f557225a3e 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
+	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
+		kref_put(&ctx->ref, msm_file_private_destroy);
 		msm_submitqueue_put(entry);
+	}
 }
 
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
@@ -81,6 +83,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	write_lock(&ctx->queuelock);
 
+	kref_get(&ctx->ref);
+
+	queue->ctx = ctx;
 	queue->id = ctx->queueid++;
 
 	if (id)
@@ -177,6 +182,7 @@ int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id)
 			list_del(&entry->node);
 			write_unlock(&ctx->queuelock);
 
+			kref_put(&ctx->ref, msm_file_private_destroy);
 			msm_submitqueue_put(entry);
 			return 0;
 		}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
