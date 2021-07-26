Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A811D3D5C6E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A2E6FCD1;
	Mon, 26 Jul 2021 14:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CDD6EA93;
 Mon, 26 Jul 2021 14:56:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so20115625pjm.4; 
 Mon, 26 Jul 2021 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2d8Oi66unu57TRBB1+7vLe4XfWK1Fq+Xj8a4TbgOWJ0=;
 b=Y29gHe+aiKGj0W2qApAfTlHWVBxpId/RC/OAxrGtwoZvcHCyxCfVyRi1JS6fEg2alZ
 m4FX5gWvfNPyaei/I7I9GSM50egr5Ub6Hh5AP8O9TatcjkFCV6KpJXLDtRGZYIsI41+A
 /4ipmyT/wF8iArdGCp/QEEEUNIFivPj9kKbXIM9qzWnVPd6vg5WlMbzB+zrbDKOd4dc7
 JBHiPsARy9hcHB41INS+kZyVvaQ4d0FjPdnEvjCNlzymgL7LrD65z5ahB95DZoFdBN+j
 me3c/TH3+ZwjWsgCqCHOIqKIQW7LnuEW562kx6mpzxDwS0i6+iLYKrrxzuNZJX9vB7xs
 JfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2d8Oi66unu57TRBB1+7vLe4XfWK1Fq+Xj8a4TbgOWJ0=;
 b=qbORKVD+1zEUp78IL3z3gEWj8ZvhgtKQuaB2Ri4QUMOLefj3ID2X/YAOGWdvaAZ1qi
 TxpnngX+P0tWJHW81d9jN0vJaCRdiQD9fuQbMZ9Gmtud8X2GBrJ9HatcddZO4kej0Lg8
 6Gezd3Kj1SG0WG79LaP7qr18lIaZiI60uW3oiKtOX1Ku6JF2GEZs4SRzbnWr51z+/+Sc
 BvFWVg9GDdsFWFcxy67joS81pLrrhEoSlesr4s77vcFJ48qE8dXljml65rQ9/BQv8A3h
 fhIildoHIbpI8jCD34Yxo0UkgFiO8GlTujxk7Ul953/igBDINIY1vvBqBB85xt1oTdkL
 GFzg==
X-Gm-Message-State: AOAM533IA4VH3miget7uatXxsaGogfAZyhlyLrZyh6RVMXY/phRXb9EF
 GAaq2ypsqahRbiH5Q1nRhzkRyqS9+0ua8A==
X-Google-Smtp-Source: ABdhPJzPr+m6yPmPszh4iugd10dO2+P3pRLaGUKfaDM9RSxm7qoPo3OzUGgmGaD4ra4XrRVQPUHefQ==
X-Received: by 2002:a62:e90b:0:b029:30e:4530:8dca with SMTP id
 j11-20020a62e90b0000b029030e45308dcamr18509085pfh.17.1627311417941; 
 Mon, 26 Jul 2021 07:56:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id s19sm5670862pju.21.2021.07.26.07.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/12] drm/msm: Drop struct_mutex in submit path
Date: Mon, 26 Jul 2021 08:00:24 -0700
Message-Id: <20210726150038.2187631-11-robdclark@gmail.com>
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
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is sufficient to serialize on the submit queue now.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2b158433a6e5..affceccf145d 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -711,7 +711,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -755,7 +755,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
@@ -876,10 +876,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
 	 * to the underlying fence.
 	 */
-	mutex_lock(&queue->lock);
 	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
 			submit->user_fence, 0, INT_MAX, GFP_KERNEL);
-	mutex_unlock(&queue->lock);
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id = 0;
 		submit->fence_id = 0;
@@ -914,12 +912,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	submit_cleanup(submit, !!ret);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-	msm_gem_submit_put(submit);
 out_unlock:
 	if (ret && (out_fence_fd >= 0))
 		put_unused_fd(out_fence_fd);
-	mutex_unlock(&dev->struct_mutex);
-
+	mutex_unlock(&queue->lock);
+	if (submit)
+		msm_gem_submit_put(submit);
 out_post_unlock:
 	if (!IS_ERR_OR_NULL(post_deps)) {
 		for (i = 0; i < args->nr_out_syncobjs; ++i) {
-- 
2.31.1

