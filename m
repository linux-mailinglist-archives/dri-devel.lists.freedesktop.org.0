Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9173CC637
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5983D6EADA;
	Sat, 17 Jul 2021 20:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9356EADA;
 Sat, 17 Jul 2021 20:25:52 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c15so7360780pls.13;
 Sat, 17 Jul 2021 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4a2grAOsVjuhllfpu4HTzJ9+Qgoc8I8WpHYGD1psl3E=;
 b=pPbIODB84agCW9NZxCYSpLdpYK0pycpT1A0XallsIV+qOf/fIIghLwgAsTCsgLSTh4
 yMy/7/w9CVeCmjgxyb+2mBQmzobZe1XHHJr/xKdRarig+R05iOJzlk94kfrf7su/d2qR
 mMX9xRv8i+jaTIhADE6mnwMcQAqAs+6zhklWOwQh2CIBhjEpAoYxe3sun7KVpKVyvmLJ
 G2IAABnOuTVM6AkzJ8mZVmEjyDK4Z1B5JrXSUevixh0bKzBeY93OUUuwQJBawYNeCehS
 qg/5/6p10qmM6TS1qpcIEctiAgB9dLWwWA/SjZbdtUYgIo5oQjN7X9pedETpgpImcoG4
 d1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4a2grAOsVjuhllfpu4HTzJ9+Qgoc8I8WpHYGD1psl3E=;
 b=pH0vpfSvhnFYxtiqmWg3rMoWmNXPuwIgmGgrak5LIdHeqp2NVk6ZlUZdbqIQAalK+N
 dras9Di2SYlmR239CEXYAb9iFg+cK5v+G0zZFrCIQ4P7t68EAbXkFfn39gqhsiCemPmQ
 VRmWmk7r7dwncKFIfjIathsgkH1m6WQCMT6zWm8AaiyC1igjZ9NgnfTtYYwlVnhsP3G7
 Xulz5kN/Q0eLGuqw5q3Dg0wGAR7HFWMhnEv5qxlkWJGUrVUrCGFewgianF5AaqGSX6F3
 rTO5e04vKIen1ge+WdYBFgbXNd+eaWwURWKcYKye5xjF13Cm2ePHZF1C8IUrUIGvrycM
 IGgA==
X-Gm-Message-State: AOAM530EchcSth84SRI4Dhd32LjGEyDNni2x1awes2Gr7y9q7iGOOWY9
 gBWHXmoGRXljgKjS5eFFxZRcnYOPkm0CWw==
X-Google-Smtp-Source: ABdhPJy2N95CmO+YLshSSS5ExE0jjwnIStHFnKkvSOBoi+8+6rt6YtweF6GnYi6tV8+Bpyt3wJMeTA==
X-Received: by 2002:a17:90b:1109:: with SMTP id
 gi9mr21819539pjb.61.1626553551434; 
 Sat, 17 Jul 2021 13:25:51 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 v31sm8502744pgl.49.2021.07.17.13.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/msm: Utilize gpu scheduler priorities
Date: Sat, 17 Jul 2021 13:29:13 -0700
Message-Id: <20210717202924.987514-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
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
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
 drivers/gpu/drm/msm/msm_gem_submit.c    |  4 ++--
 drivers/gpu/drm/msm/msm_gpu.h           | 21 ++++++++++++++++--
 drivers/gpu/drm/msm/msm_submitqueue.c   | 29 ++++++++++++-------------
 include/uapi/drm/msm_drm.h              | 10 ++++++++-
 5 files changed, 46 insertions(+), 22 deletions(-)

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
index 73bdea43e1ab..ef5f2c894543 100644
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
index e1e65b452c17..9302ad1dc83c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -208,6 +208,22 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/**
+ * With drm/scheduler providing it's own level of prioritization, our total
+ * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
+ * Each ring is associated with it's own scheduler instance.  The userspace
+ * provided priority (when a submitqueue is created) is mapped to ring nr
+ * and scheduler priority as such:
+ *
+ *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
+ *   sched_prio = userspace_prio % NR_SCHED_PRIORITIES
+ *
+ * This allows generations without preemption (nr_rings==1) to have some
+ * amount of prioritization, and provides more priority levels for gens
+ * that do have preemption.
+ */
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+
 /**
  * A submitqueue is associated with a gl context or vk queue (or equiv)
  * in userspace.
@@ -215,7 +231,8 @@ struct msm_gpu_perfcntr {
  * @id:        userspace id for the submitqueue, unique within the drm_file
  * @flags:     userspace flags for the submitqueue, specified at creation
  *             (currently unusued)
- * @prio:      the submitqueue priority
+ * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
+ *             by the submitqueue's priority
  * @faults:    the number of GPU hangs associated with this submitqueue
  * @ctx:       the per-drm_file context associated with the submitqueue (ie.
  *             which set of pgtables do submits jobs associated with the
@@ -230,7 +247,7 @@ struct msm_gpu_perfcntr {
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
-	u32 prio;
+	u32 ring_nr;
 	int faults;
 	struct msm_file_private *ctx;
 	struct list_head node;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 5c486fa6176b..cdaf71d3fe15 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -68,6 +68,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
 	struct drm_gpu_scheduler *sched;
+	u32 sched_prio, ring_nr;
 	int ret;
 
 	if (!ctx)
@@ -76,7 +77,16 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
-	if (prio >= priv->gpu->nr_rings)
+	/*
+	 * Map the userspace provided priority to the internal ringbuffer
+	 * (queue->prio) and drm/scheduler priority:
+	 *
+	 *    ring_nr    = prio / NR_SCHED_PRIORITIES
+	 *    sched_prio = prio % NR_SCHED_PRIORITIES
+	 */
+	ring_nr = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sched_prio);
+
+	if (ring_nr >= priv->gpu->nr_rings)
 		return -EINVAL;
 
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
@@ -86,24 +96,13 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
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
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f075851021c3..e5e073954856 100644
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
-- 
2.31.1

