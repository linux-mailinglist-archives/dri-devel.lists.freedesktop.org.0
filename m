Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4703CFCDB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2EB89C1B;
	Tue, 20 Jul 2021 15:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5589C1B;
 Tue, 20 Jul 2021 15:03:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so2631235pjb.0; 
 Tue, 20 Jul 2021 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjsQqg/cyLrvH6AHlxUB+OYVHKKVa13wNGyeIOclLuU=;
 b=Bwya6iL1RBmmeGnDLmxE++cJ04phd36pitzI5Fg/6+79njD2oyBhzaQONWmikFuB3v
 sWOWXVU3XANaWQj6Mi6PD79h7wIzAVu1HT5fHWRFBtYKzK/VsiyBK8irALWIFOIiPfxe
 SumHHYYFE/6VlsrVL32MklAzmYQxlvTV8x+UX/RKxN55gzSmbxS8xlL4D7T69pZKCxbR
 3hYVNceHlNyb9ju3HO0FaWK5vUkOa2sK4hDRDzVTPA6C74H9YQRSKcZpzQ6vKkwD7Vc1
 wKRMpVzAniHaoAw89XEZFEc1YserHm/AzRtW2TvB5ztJbmXl6LqeWx5XcSyxPYcY6teZ
 VvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YjsQqg/cyLrvH6AHlxUB+OYVHKKVa13wNGyeIOclLuU=;
 b=Gm6WTdLOfNKuIgQp03gabICJ+rY9bAPUTZJUWC9Dpz7aYpajCLd3xoitnMIZWO/m++
 3E91BHnioni8hUTSwf47fd0wh4lr4pLAhkI/FBF6YylqGcKVCs2o5I2/S2wA+TCaOMJK
 poVlggqbtUlkWy954bNvDVeiMEGvJCAzJiRzCFopUmIIFX9xxg5xg/JGqFZRh8h5ozrh
 yQ5qt3N3G/VvJG7l9xdPAmslSjTHEjkJwg2ScFiCiCJEp5tdjacFo+Ih8uuUl9y2j5x9
 OQdRQSNV2ERdMpAgCxttcTLzeQFDQMRZoaazRnCHyLoQ99CqquSzZHFwv+WJahwlUNdC
 vK5Q==
X-Gm-Message-State: AOAM533VBSuxFJgEDp8PN1KdMYhQtDK6e68cf5mLod06FE05QtriRVLH
 fp65iz+/77RGQJYFh7sT57kIeBLQKu+/ww==
X-Google-Smtp-Source: ABdhPJwocdDotiRQoMrd8AmM4D5t8eT0K3LGBIo2EKCjfzv73zaEHoy2PrNocwn0na8156wCs4B80g==
X-Received: by 2002:a17:903:2309:b029:12a:965b:333 with SMTP id
 d9-20020a1709032309b029012a965b0333mr23822909plh.31.1626793388619; 
 Tue, 20 Jul 2021 08:03:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id k19sm20330779pji.32.2021.07.20.08.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:03:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add fence->wait() op
Date: Tue, 20 Jul 2021 08:07:15 -0700
Message-Id: <20210720150716.1213775-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
one noticed.  Oops.

Note that this removes the !timeout case, which has not been used in
a long time.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index cd59a5918038..8ee96b90ded6 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
 	return (int32_t)(fctx->completed_fence - fence) >= 0;
 }
 
-/* legacy path for WAIT_FENCE ioctl: */
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible)
+static signed long wait_fence(struct msm_fence_context *fctx, uint32_t fence,
+		signed long remaining_jiffies, bool interruptible)
 {
-	int ret;
+	signed long ret;
 
 	if (fence > fctx->last_fence) {
 		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
@@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
 		return -EINVAL;
 	}
 
-	if (!timeout) {
-		/* no-wait: */
-		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
+	if (interruptible) {
+		ret = wait_event_interruptible_timeout(fctx->event,
+			fence_completed(fctx, fence),
+			remaining_jiffies);
 	} else {
-		unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
-
-		if (interruptible)
-			ret = wait_event_interruptible_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-		else
-			ret = wait_event_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-
-		if (ret == 0) {
-			DBG("timeout waiting for fence: %u (completed: %u)",
-					fence, fctx->completed_fence);
-			ret = -ETIMEDOUT;
-		} else if (ret != -ERESTARTSYS) {
-			ret = 0;
-		}
+		ret = wait_event_timeout(fctx->event,
+			fence_completed(fctx, fence),
+			remaining_jiffies);
+	}
+
+	if (ret == 0) {
+		DBG("timeout waiting for fence: %u (completed: %u)",
+				fence, fctx->completed_fence);
+		ret = -ETIMEDOUT;
+	} else if (ret != -ERESTARTSYS) {
+		ret = 0;
 	}
 
 	return ret;
 }
 
+/* legacy path for WAIT_FENCE ioctl: */
+int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
+		ktime_t *timeout, bool interruptible)
+{
+	return wait_fence(fctx, fence, timeout_to_jiffies(timeout), interruptible);
+}
+
 /* called from workqueue */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
@@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
 	return fence_completed(f->fctx, f->base.seqno);
 }
 
+static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
+		signed long timeout)
+{
+	struct msm_fence *f = to_msm_fence(fence);
+
+	return wait_fence(f->fctx, fence->seqno, timeout, intr);
+}
+
 static const struct dma_fence_ops msm_fence_ops = {
 	.get_driver_name = msm_fence_get_driver_name,
 	.get_timeline_name = msm_fence_get_timeline_name,
 	.signaled = msm_fence_signaled,
+	.wait = msm_fence_wait,
 };
 
 struct dma_fence *
-- 
2.31.1

