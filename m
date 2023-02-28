Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BE6A6324
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986210E0E8;
	Tue, 28 Feb 2023 22:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B45B10E187;
 Tue, 28 Feb 2023 22:59:08 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so15324018pjb.1; 
 Tue, 28 Feb 2023 14:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=UnSWdr16aXMzHwaqQUKdJgtIvnecRl8JsRO8gPCIfkQYXAP59se8TeJSGnJXX2XLyu
 6iqpzR+1mM3f94dS4hB3xZAXTzW+pqf7C/G4uoYyifViaf7k4HFgnJosezvupc61Kc2n
 m7JuXjCKHoMsOK0DDOnedc74+vMB2PVRt5T1q5Lt+dPUeolQ9upyny8zvNk/QcmxyTja
 lk/vmHO5vQ4jV3IpTL4RRuBNKAX2brnppUH49X88ucSBvbhrJ1DW21KXGd56FBiavuzC
 2Gsy34b6+z6AXIMB+Fdjzk7/jFKJM7K1h0QEcEzVuwt8YGkGC2NGLn5eo6RJZ1rZy/F3
 j59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=X/KVVpsrRhy4n84/Lvj/ZMhzXPzgVzupI/qtH3ooTRlSV4KTi4jG9E5cY81OLtWgbE
 14YTllEu9XN+NXWIrA6mvNmTUJQ+2238TJb3sQ0sw1qV6rz/jg6JNRBU1Ql/KDkJGYNe
 EW5WUjYtrfRqLMxsXnNLdbTKjmu7GXJ7j+2UmVPywv1g89E5m8VCMU/aE4ooO9wCQSOt
 x83ouu57NXmChfolS9xmtqcLq71SichV/gLKgQEWqm8+p4oHqi6VT6w2MK4dYjWL/RWi
 DjA2XOTWFgctJNa2mSRbhP8mZ6ezyV0h2ah77KkZbkpyKx5FD07POYOOklgiZfJkh9oV
 84dg==
X-Gm-Message-State: AO0yUKUN2eUGJx0IXAbHi+jXSRl7M8ECmV/QTwdDmB6iWFJkrq+XTH3H
 WmZ/whi6DxTKPTWhrcLz3vdAtKWvoqxb7Q==
X-Google-Smtp-Source: AK7set/lxf665SE+fbWY+vw55kx/il3KZuxEgDbaGxK3vmEgoEegpAqbb0xmU9nWCxh3ZfSSJJYPjQ==
X-Received: by 2002:a05:6a20:4f08:b0:c7:6cb7:cfbf with SMTP id
 gi8-20020a056a204f0800b000c76cb7cfbfmr4376896pzb.10.1677625147658; 
 Tue, 28 Feb 2023 14:59:07 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 m6-20020aa79006000000b005a8c16fcb78sm6582972pfo.56.2023.02.28.14.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:59:07 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 14/16] drm/msm: Add wait-boost support
Date: Tue, 28 Feb 2023 14:58:18 -0800
Message-Id: <20230228225833.2920879-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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

