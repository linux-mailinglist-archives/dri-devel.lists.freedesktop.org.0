Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1523D5C72
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9056FE1E;
	Mon, 26 Jul 2021 14:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721EF6EC26;
 Mon, 26 Jul 2021 14:57:02 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id b6so13220641pji.4;
 Mon, 26 Jul 2021 07:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eAbVS7+Uu/1X6NeIZyuRGoclICaD7vp4GnwPOP23H0c=;
 b=rx2N4wyXxA4d+eXz6UYWrdAQ8mQnmOsk1yz7cXGqOmQMJiFDvrv7c44gfO0Pl+LRJ2
 ZXEsnhWN5lrkQYIW29YC44CyGlAg+hkA6+wni/WuUeMW2T8U+17abn8lpc8U+c8JuhKd
 Sn7ICu6T2Ue6GiyfUrSxmWxf65Yg1lcofTirU803W8OGp1n37oj0K5T5/zkW25LcfifW
 53eUehm+5HM0NsrZ1WnP2j7zT/EboU82V+wgIZZPp3xVsxl/Q9qQ+b0lW4ugQNGCJbWK
 EAl2YwaadBQPIDdqyPmrcqajamEt68XXl8eDmbbR8DZXOpTCXMt1NvwQOgSJI/pFRHOf
 xXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eAbVS7+Uu/1X6NeIZyuRGoclICaD7vp4GnwPOP23H0c=;
 b=t7FmuVeVruMEYtu1CueJtQrM0b1w+vy58UcqFOCsoe9zpH7bV9zXVoRWBg1x69oBji
 XSGkwkJ0nRbDn4Cfvb6NnvzP2J/6s8EC4ZQ67q39NkCVc9A8TqdRvE2n79trEgeswWHd
 MHdbRGdk/ScrDLA56sz1Mqc4oNBTXdK49qHhh+UILirajgi3Ma2+DAy3vZJiJJwUqtbP
 4ETRQCugKzA385O5Rtq8+WJ0sBbnyfzxNsYYSPi/4Ao065KVjEqq2z9UNEuTBJ1u9oIA
 uDU0v0Eov6iHJQRxBAqljq6ji5RdUDK7qfmKiKLYOwLWQdqucsXZ2ipp4pW6PGgEu45z
 qCxw==
X-Gm-Message-State: AOAM53285ERiwzmGFR+9c1JJULQzv2K2DywWNLNl3HI9UZahlqxC8lNW
 OjraQHTxoyrilmY+3TuKDlSZUUEiCgA+bA==
X-Google-Smtp-Source: ABdhPJwG3v9x3MxvXt2mC02prcZ2KRfEuzg1OYnfzGlvPQ/54dBFZchUn2iZ8cmdDWIovEO61j3HbA==
X-Received: by 2002:aa7:98c6:0:b029:32e:608b:7e86 with SMTP id
 e6-20020aa798c60000b029032e608b7e86mr18329237pfm.68.1627311421334; 
 Mon, 26 Jul 2021 07:57:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id x40sm255087pfu.176.2021.07.26.07.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:57:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/msm: Utilize gpu scheduler priorities
Date: Mon, 26 Jul 2021 08:00:25 -0700
Message-Id: <20210726150038.2187631-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The drm/scheduler provides additional prioritization on top of that
provided by however many number of ringbuffers (each with their own
priority level) is supported on a given generation.  Expose the
additional levels of priority to userspace and map the userspace
priority back to ring (first level of priority) and schedular priority
(additional priority levels within the ring).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
 drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
 include/uapi/drm/msm_drm.h              | 14 +++++-
 5 files changed, 88 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index bad4809b68ef..748665232d29 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
 			return ret;
 		}
 		return -EINVAL;
-	case MSM_PARAM_NR_RINGS:
-		*value = gpu->nr_rings;
+	case MSM_PARAM_PRIORITIES:
+		*value = gpu->nr_rings * NR_SCHED_PRIORITIES;
 		return 0;
 	case MSM_PARAM_PP_PGTABLE:
 		*value = 0;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index affceccf145d..b60c3f7ed551 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 	submit->gpu = gpu;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
-	submit->ring = gpu->rb[queue->prio];
+	submit->ring = gpu->rb[queue->ring_nr];
 	submit->fault_dumped = false;
 
 	INIT_LIST_HEAD(&submit->node);
@@ -751,7 +751,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	/* Get a unique identifier for the submission for logging purposes */
 	submitid = atomic_inc_return(&ident) - 1;
 
-	ring = gpu->rb[queue->prio];
+	ring = gpu->rb[queue->ring_nr];
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b912cacaecc0..0e4b45bff2e6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/*
+ * The number of priority levels provided by drm gpu scheduler.  The
+ * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
+ * cases, so we don't use it (no need for kernel generated jobs).
+ */
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+
+/**
+ * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
+ *
+ * @gpu:        the gpu instance
+ * @prio:       the userspace priority level
+ * @ring_nr:    [out] the ringbuffer the userspace priority maps to
+ * @sched_prio: [out] the gpu scheduler priority level which the userspace
+ *              priority maps to
+ *
+ * With drm/scheduler providing it's own level of prioritization, our total
+ * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
+ * Each ring is associated with it's own scheduler instance.  However, our
+ * UABI is that lower numerical values are higher priority.  So mapping the
+ * single userspace priority level into ring_nr and sched_prio takes some
+ * care.  The userspace provided priority (when a submitqueue is created)
+ * is mapped to ring nr and scheduler priority as such:
+ *
+ *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
+ *   sched_prio = NR_SCHED_PRIORITIES -
+ *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
+ *
+ * This allows generations without preemption (nr_rings==1) to have some
+ * amount of prioritization, and provides more priority levels for gens
+ * that do have preemption.
+ */
+static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
+		unsigned *ring_nr, enum drm_sched_priority *sched_prio)
+{
+	unsigned rn, sp;
+
+	rn = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
+
+	/* invert sched priority to map to higher-numeric-is-higher-
+	 * priority convention
+	 */
+	sp = NR_SCHED_PRIORITIES - sp - 1;
+
+	if (rn >= gpu->nr_rings)
+		return -EINVAL;
+
+	*ring_nr = rn;
+	*sched_prio = sp;
+
+	return 0;
+}
+
 /**
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
@@ -257,7 +310,8 @@ struct msm_gpu_perfcntr {
  * @id:        userspace id for the submitqueue, unique within the drm_file
  * @flags:     userspace flags for the submitqueue, specified at creation
  *             (currently unusued)
- * @prio:      the submitqueue priority
+ * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
+ *             by the submitqueue's priority
  * @faults:    the number of GPU hangs associated with this submitqueue
  * @ctx:       the per-drm_file context associated with the submitqueue (ie.
  *             which set of pgtables do submits jobs associated with the
@@ -272,7 +326,7 @@ struct msm_gpu_perfcntr {
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
-	u32 prio;
+	u32 ring_nr;
 	int faults;
 	struct msm_file_private *ctx;
 	struct list_head node;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 682ba2a7c0ec..32a55d81b58b 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -68,6 +68,8 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct drm_gpu_scheduler *sched;
+	enum drm_sched_priority sched_prio;
+	unsigned ring_nr;
 	int ret;
 
 	if (!ctx)
@@ -76,8 +78,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	if (prio >= priv->gpu->nr_rings)
-		return -EINVAL;
+	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
+	if (ret)
+		return ret;
 
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
@@ -86,24 +89,13 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-	queue->prio = prio;
+	queue->ring_nr = ring_nr;
 
-	ring = priv->gpu->rb[prio];
+	ring = priv->gpu->rb[ring_nr];
 	sched = &ring->sched;
 
-	/*
-	 * TODO we can allow more priorities than we have ringbuffers by
-	 * mapping:
-	 *
-	 *    ring = prio / 3;
-	 *    ent_prio = DRM_SCHED_PRIORITY_MIN + (prio % 3);
-	 *
-	 * Probably avoid using DRM_SCHED_PRIORITY_KERNEL as that is
-	 * treated specially in places.
-	 */
 	ret = drm_sched_entity_init(&queue->entity,
-			DRM_SCHED_PRIORITY_NORMAL,
-			&sched, 1, NULL);
+			sched_prio, &sched, 1, NULL);
 	if (ret) {
 		kfree(queue);
 		return ret;
@@ -134,16 +126,19 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
-	int default_prio;
+	int default_prio, max_priority;
 
 	if (!priv->gpu)
 		return -ENODEV;
 
+	max_priority = (priv->gpu->nr_rings * NR_SCHED_PRIORITIES) - 1;
+
 	/*
-	 * Select priority 2 as the "default priority" unless nr_rings is less
-	 * than 2 and then pick the lowest priority
+	 * Pick a medium priority level as default.  Lower numeric value is
+	 * higher priority, so round-up to pick a priority that is not higher
+	 * than the middle priority level.
 	 */
-	default_prio = clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1);
+	default_prio = DIV_ROUND_UP(max_priority, 2);
 
 	INIT_LIST_HEAD(&ctx->submitqueues);
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f075851021c3..6b8fffc28a50 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -73,11 +73,19 @@ struct drm_msm_timespec {
 #define MSM_PARAM_MAX_FREQ   0x04
 #define MSM_PARAM_TIMESTAMP  0x05
 #define MSM_PARAM_GMEM_BASE  0x06
-#define MSM_PARAM_NR_RINGS   0x07
+#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
 #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
 #define MSM_PARAM_FAULTS     0x09
 #define MSM_PARAM_SUSPENDS   0x0a
 
+/* For backwards compat.  The original support for preemption was based on
+ * a single ring per priority level so # of priority levels equals the #
+ * of rings.  With drm/scheduler providing additional levels of priority,
+ * the number of priorities is greater than the # of rings.  The param is
+ * renamed to better reflect this.
+ */
+#define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
+
 struct drm_msm_param {
 	__u32 pipe;           /* in, MSM_PIPE_x */
 	__u32 param;          /* in, MSM_PARAM_x */
@@ -304,6 +312,10 @@ struct drm_msm_gem_madvise {
 
 #define MSM_SUBMITQUEUE_FLAGS (0)
 
+/*
+ * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
+ * a lower numeric value is higher priority.
+ */
 struct drm_msm_submitqueue {
 	__u32 flags;   /* in, MSM_SUBMITQUEUE_x */
 	__u32 prio;    /* in, Priority level */
-- 
2.31.1

