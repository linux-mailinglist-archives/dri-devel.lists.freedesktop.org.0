Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD069D4CB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F1A10E794;
	Mon, 20 Feb 2023 20:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA0C10E7AB;
 Mon, 20 Feb 2023 20:19:37 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q189so1107067pga.9;
 Mon, 20 Feb 2023 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=TG1L6nn0mxBlkKBusgwF9MyUCLhHqNTRGOpIiG1+g3+2tbfhq1+DgZUgf4V2KgyNra
 ENmsUIrjwSSr/A4fn2O9l0F3MUhpCSjJtle6DdruoB8wDezXrbM/gFxXxsBj+dKQf7wl
 t58P0IMFe+/PCrMmuzStSrS2BkDx3+ndckjxibW/670yzJO914kwBw1L36j4S6OBCdFX
 LMghJVaa4OPP2iw1qmcJ/x2VEoL4CshIZq34uHqcHASQqYllJCpFEUIWmu/aWIf191bB
 sXM4DUz8HMGVQHyxzvIsP3fnLQ6VDkpu2myvqfAULLrqWH82Ig+GhmOU3J7uGsCS1mde
 qLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=PecvO/iyLJQcAy+n/g68biUr6MThSz8uJxReTDXvho/DFWorDaexNr6EulsNZkmsWm
 Mey5Lo/8lKVNblnSY+OtcVZ+BQQ2/Tr2Kxiw4+0UqmUgfXVZd3REkZWcwLNEnriRyjSF
 41jItFPDZiUlR2S04nYFAXoX9IgmkbQgy9AWo7T8P9YcpIL3zssb64JOaETQm7wUElgd
 gq+k6OyvQK2rbEKBOwjyUyshNz5LECHBfIGvfPvk0poTROz+vS5nl2HnGI32RYgqXx2l
 bV+NSB+MWPNAmNwDzzy8L2zE/zA8iMCcESI6xvsbEvcRlcTddWRdpexQcito1R+8A83O
 FPXg==
X-Gm-Message-State: AO0yUKVXw3YpRZU+pDS80axo0tvAJs6NSLICyziPj37RC3c5XZfkG3OF
 VOO7eusIQrH94QyHkDZdu/I+1nZ8RDQ=
X-Google-Smtp-Source: AK7set+G+O+g8nCJJ/07wSAUrOEukE3ArmuOtJLackiUQfQRUGS/wMiklYbmz15njHhVBhjw7Qo33g==
X-Received: by 2002:a05:6a00:9b:b0:5a8:a263:7f4d with SMTP id
 c27-20020a056a00009b00b005a8a2637f4dmr2306138pfj.15.1676924376984; 
 Mon, 20 Feb 2023 12:19:36 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 c11-20020aa781cb000000b005a8bc154bf4sm2440630pfn.39.2023.02.20.12.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/14] drm/msm: Add wait-boost support
Date: Mon, 20 Feb 2023 12:19:00 -0800
Message-Id: <20230220201916.1822214-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way for various userspace waits to signal urgency.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_gem.c |  5 +++++
 include/uapi/drm/msm_drm.h    | 14 ++++++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index aca48c868c14..f6764a86b2da 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -46,6 +46,7 @@
  * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
  * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
  * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
+ * - 1.11.0 - Add wait boost (MSM_WAIT_FENCE_BOOST, MSM_PREP_BOOST)
  */
 #define MSM_VERSION_MAJOR	1
 #define MSM_VERSION_MINOR	10
@@ -899,7 +900,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 }
 
 static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
-		      ktime_t timeout)
+		      ktime_t timeout, uint32_t flags)
 {
 	struct dma_fence *fence;
 	int ret;
@@ -929,6 +930,9 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	if (!fence)
 		return 0;
 
+	if (flags & MSM_WAIT_FENCE_BOOST)
+		dma_fence_set_deadline(fence, ktime_get());
+
 	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
 	if (ret == 0) {
 		ret = -ETIMEDOUT;
@@ -949,8 +953,8 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	struct msm_gpu_submitqueue *queue;
 	int ret;
 
-	if (args->pad) {
-		DRM_ERROR("invalid pad: %08x\n", args->pad);
+	if (args->flags & ~MSM_WAIT_FENCE_FLAGS) {
+		DRM_ERROR("invalid flags: %08x\n", args->flags);
 		return -EINVAL;
 	}
 
@@ -961,7 +965,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ret = wait_fence(queue, args->fence, to_ktime(args->timeout));
+	ret = wait_fence(queue, args->fence, to_ktime(args->timeout), args->flags);
 
 	msm_submitqueue_put(queue);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 1dee0d18abbb..dd4a0d773f6e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -846,6 +846,11 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 		op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
 	long ret;
 
+	if (op & MSM_PREP_BOOST) {
+		dma_resv_set_deadline(obj->resv, dma_resv_usage_rw(write),
+				      ktime_get());
+	}
+
 	ret = dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(write),
 				    true,  remain);
 	if (ret == 0)
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 329100016e7c..dbf0d6f43fa9 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -151,8 +151,13 @@ struct drm_msm_gem_info {
 #define MSM_PREP_READ        0x01
 #define MSM_PREP_WRITE       0x02
 #define MSM_PREP_NOSYNC      0x04
+#define MSM_PREP_BOOST       0x08
 
-#define MSM_PREP_FLAGS       (MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC)
+#define MSM_PREP_FLAGS       (MSM_PREP_READ | \
+			      MSM_PREP_WRITE | \
+			      MSM_PREP_NOSYNC | \
+			      MSM_PREP_BOOST | \
+			      0)
 
 struct drm_msm_gem_cpu_prep {
 	__u32 handle;         /* in */
@@ -286,6 +291,11 @@ struct drm_msm_gem_submit {
 
 };
 
+#define MSM_WAIT_FENCE_BOOST	0x00000001
+#define MSM_WAIT_FENCE_FLAGS	( \
+		MSM_WAIT_FENCE_BOOST | \
+		0)
+
 /* The normal way to synchronize with the GPU is just to CPU_PREP on
  * a buffer if you need to access it from the CPU (other cmdstream
  * submission from same or other contexts, PAGE_FLIP ioctl, etc, all
@@ -295,7 +305,7 @@ struct drm_msm_gem_submit {
  */
 struct drm_msm_wait_fence {
 	__u32 fence;          /* in */
-	__u32 pad;
+	__u32 flags;          /* in, bitmask of MSM_WAIT_FENCE_x */
 	struct drm_msm_timespec timeout;   /* in */
 	__u32 queueid;         /* in, submitqueue id */
 };
-- 
2.39.1

