Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E6A3D7BCA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DB96EC14;
	Tue, 27 Jul 2021 17:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F806EBA4;
 Tue, 27 Jul 2021 17:08:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so5256602pja.5; 
 Tue, 27 Jul 2021 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=aQmQKagbmnZ+BHethyxgK75k8Tv9Hm8vBues9pvulMioSMv8z4qG9zvXALbyG8a7vF
 /8P59Pd01G5S+JStEv4uqVUggPgkn3ejzJM/X3P7jISOqU/N84HupaSz7VjleB84bw+V
 GPgE6YL6CWSN0/RC+qn3L0+wD5M6aWE6YGxZyGjYcCNWWZiE3LVZ5pcsEVI67JB1KOrP
 0E+jPh5p4tPMfVxzEk2wpdx3oDtUDNeHp2si4k1uuXj32QHmzgWM8tdRFCIfrM71rsHd
 x7vTve1rBNqAwMmizhAQSOCx9V1WTUeBEm2cUn3mhtWcmnjNLesT79K7uEt3/UrMpl+s
 Zdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=AJiRWLqgdPTIousiM2gHN90hxgwA3spqCbVIiNS9vWU4XiCl9z1H+umJtro7EXpP3T
 +LwKbPLYo32F6oDrV5ZNgw2tEYQk/Cw5Tx02OoauQSOx/UPZ/Sr9ZBqk6Trw7of8OtRk
 nHy1d5ubnWwfcgrRrGlAeRuPC++H9B2DS2nIvUi4khYKg61WEALyppUntBTRRHY/TBcu
 /+e5erDSkQgAjvMU4ddVOUsQ+yh8QNera4W9kZV6tS0eWkg/PcYkULyUUC17j4kBbExg
 FvzMbCYD5e0mY0maZ12+Xjm/Nda2eu7GdH7z6JyUq9pKW8enuQ/p1PCWdrF8y4YKhc6U
 0SlA==
X-Gm-Message-State: AOAM532PK4qLzHjZ2q+WOPoxMrmmIFA4taW3VA5LaziLwbi0GgAIHCqA
 zDBQXnshaOjbFAwY3TaR3DDS5+KImvCmTg==
X-Google-Smtp-Source: ABdhPJy5R/8jkP0MbJEF2Oq7xrFn4gXezJ7NHToxQwoOC3cQr6uYgKiWLKQCRw6L8WJMbjv+NgTcCw==
X-Received: by 2002:a17:902:76cc:b029:12b:ecc5:c176 with SMTP id
 j12-20020a17090276ccb029012becc5c176mr15537321plt.42.1627405687324; 
 Tue, 27 Jul 2021 10:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id n14sm3334052pjv.34.2021.07.27.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:08:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/13] drm/msm: Drop struct_mutex in submit path
Date: Tue, 27 Jul 2021 10:11:27 -0700
Message-Id: <20210727171143.2549475-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
index e11e4bb63695..450efe59abb5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -709,7 +709,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_msm_gem_submit *args = data;
 	struct msm_file_private *ctx = file->driver_priv;
-	struct msm_gem_submit *submit;
+	struct msm_gem_submit *submit = NULL;
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
@@ -753,7 +753,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
 		args->nr_bos, args->nr_cmds);
 
-	ret = mutex_lock_interruptible(&dev->struct_mutex);
+	ret = mutex_lock_interruptible(&queue->lock);
 	if (ret)
 		goto out_post_unlock;
 
@@ -874,10 +874,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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
@@ -912,12 +910,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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

