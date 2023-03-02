Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4986A8D94
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466C010E5B6;
	Thu,  2 Mar 2023 23:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9624810E5C0;
 Thu,  2 Mar 2023 23:54:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so1091030pjb.0; 
 Thu, 02 Mar 2023 15:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=QNPGt0cS0eHxTh5Yv+kp+BO9sEP4RdqcBgxUsoJl+iRJcLx+mI0/I8QHq0ZJFrstr7
 TwA4hjn46PkGp9BgB9zmWgC0A2N+lpaZoSdv4W+trRXnY8UT1dqlgZs8NAq7ps+6NeIj
 eu57DseXB6kUVVNLKyQxYrZH8Gfme7iKsNQA92ZCljqVOIAHHG06KHT0CXIy2cq6xA/X
 aM3BXk7XYo8c9+cYLvBIH+KEg55+S9L1L2gsNnEVtsRcK8uD+WmvUhwEUYp5x474qP/y
 8961PBKk75Mny+cx2rK2Ii/hzUCX6PCcsS9eBnlrcZy7f40nsSStgrM6kPK7ckaAaoFb
 qkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0EqwRq/t+KHhVrbIAD1sooBDZlG3nzxQWus7/my7j0s=;
 b=DaNTv755koxwCZg4E/XUnAAnqLyMyEts4Q9OP1fqyjjqbP8XNpCPb1v1tmYsORWhdb
 yybWIjhjbMA7Z8J0JRyoQ+Dr6gDXPvDmHNRhotkTVUuDShgHOnFGSKLlM0nnrhBzbwPw
 1trapwa1dLJimd+LFeVKVSbUIpflg6019INjA92ILSBnZPSAQ+D/AwcORAdbHi2to5jg
 SuzXG61Y5ha/npjReAd+TyvRoPmTRtM1XM8zaONVEOsZy6T6Pv2f1oFgKfmRqzqBXF1H
 YcCgjywE79bU2PuAwcVAr3e4kbeWUh8WriprUfnP+aa0up5qn7eEYAgCAZGnbYbVwPvh
 VmHg==
X-Gm-Message-State: AO0yUKWiLUZPKj/J0UtHuP2EEYQz6BiXCTgfeBQw5xzYuvM3eZs08zpR
 ivu5qny94vs42/97RAnndJfyEX2Qy3g=
X-Google-Smtp-Source: AK7set+RejwYztM7cfK4NcWw6e7ND7KBLTfv0gmBCZndMuNPdCM6TLkblR1uYEE3Ly7Py1cCoDVmkA==
X-Received: by 2002:a17:903:2312:b0:19a:96f9:f55b with SMTP id
 d18-20020a170903231200b0019a96f9f55bmr56464plh.27.1677801265923; 
 Thu, 02 Mar 2023 15:54:25 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 jz7-20020a170903430700b0019926c77577sm221033plb.90.2023.03.02.15.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:25 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 13/15] drm/msm: Add wait-boost support
Date: Thu,  2 Mar 2023 15:53:35 -0800
Message-Id: <20230302235356.3148279-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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

