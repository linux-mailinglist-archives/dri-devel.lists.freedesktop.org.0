Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55C7B30D8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 12:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6F710E108;
	Fri, 29 Sep 2023 10:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9279210E108
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 10:47:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5346b64f17aso8871859a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695984447; x=1696589247; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=LERo11J4O6+7RDEZVuSSk1wmWvMcLrHBMBsGzR3meS4=;
 b=OGWgIvEfypipi0zuIMqkxDWhp3qWRv2JZRUZpyoTTE5RrYjVBI3Q9xTGg0KhewR5FT
 /YOtFGPSR63i3ksZaG5fEsx8JjbceAxorQVNQkUiThFDyMGp7pIaGrU0wAAlqtZGqgKH
 oPeSUR32n4seSmLb6tquAxB+tRMu6ZeLH7rDj6oMeizL3xsYsJROuIDW/Siq/44NcXZR
 yAUNj8B0pa+WCgd3f2+a+qyymaa3CVey3yrtaUNNDEuRWRo0sMD/dsvGWl/9jaw2IGIo
 Cm5LtZM1su5EaNR4I38lvCIovX4ISg+ien7p8QZ3arNmLP+uj6VkKPBsgB/PlBZNBslV
 irvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695984447; x=1696589247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LERo11J4O6+7RDEZVuSSk1wmWvMcLrHBMBsGzR3meS4=;
 b=NFFm6ocW+CHbfsFjQXw1LT9strw3Y/5Z7NdhHm44nYLke3KqodWGfkFynubOmDtSO5
 dfczDeMXZypEHdu38Ytvir9lFgB8EIF74YU2fEAjJC5yB9ZUdVRGNVmfF9lYHj/31fGG
 A/vZ4FPEPb7LHPlHdH8q+jO3kKb81l2cmMNp3HDq/3T/mf8Mi028+88ZquB9mwQ0Wtm5
 I1PqvfQ+MaARL8jVqThzTFQ59Te5lRIO1clRJR3XLTeItrl+g0ss/1EPS+Kp0gWf/34O
 R7DJkeNy4h1sUnK3d/7JH8eBmMxngLML3U6N13gM+gRdqmIkSB63uPFCDUapN3MuKySl
 nkOA==
X-Gm-Message-State: AOJu0Yw2YADK3ZrEMizhgRPF2s/sLvqM5S6t0/m+jnQrdgP5geetxbQp
 7xJeWVr4wK9uCOklmLGXqUztkosbxRGqyg==
X-Google-Smtp-Source: AGHT+IGbt4TQLbp9kObpLUp0XR39p3urQCmx3MrwkydiXkxcEnWex5lOvK899mUbaicKFjWhkoFYPg==
X-Received: by 2002:a17:907:2cc9:b0:9b2:7b89:8199 with SMTP id
 hg9-20020a1709072cc900b009b27b898199mr3371291ejc.53.1695984446692; 
 Fri, 29 Sep 2023 03:47:26 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1555:4100:a363:4f74:7970:95eb])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a1709060e0600b009ae05f9eab3sm12258841eji.65.2023.09.29.03.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 03:47:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	Yunxiang.Li@amd.com
Subject: [PATCH] dma-buf: add dma_fence_timestamp helper
Date: Fri, 29 Sep 2023 12:47:25 +0200
Message-Id: <20230929104725.2358-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a fence signals there is a very small race window where the timestamp
isn't updated yet. sync_file solves this by busy waiting for the
timestamp to appear, but on other ocassions didn't handled this
correctly.

Provide a dma_fence_timestamp() helper function for this and use it in
all appropriate cases.

Another alternative would be to grab the spinlock when that happens.

v2 by teddy: add a wait parameter to wait for the timestamp to show up, in case
   the accurate timestamp is needed and/or the timestamp is not based on
   ktime (e.g. hw timestamp)
v3 chk: drop the parameter again for unified handling

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Fixes: 1774baa64f93 ("drm/scheduler: Change scheduled fence track v2")
---
 drivers/dma-buf/dma-fence-unwrap.c     | 13 ++++---------
 drivers/dma-buf/sync_file.c            |  9 +++------
 drivers/gpu/drm/scheduler/sched_main.c |  2 +-
 include/linux/dma-fence.h              | 19 +++++++++++++++++++
 4 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index c625bb2b5d56..628af51c81af 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -76,16 +76,11 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
 			if (!dma_fence_is_signaled(tmp)) {
 				++count;
-			} else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
-					    &tmp->flags)) {
-				if (ktime_after(tmp->timestamp, timestamp))
-					timestamp = tmp->timestamp;
 			} else {
-				/*
-				 * Use the current time if the fence is
-				 * currently signaling.
-				 */
-				timestamp = ktime_get();
+				ktime_t t = dma_fence_timestamp(tmp);
+
+				if (ktime_after(t, timestamp))
+					timestamp = t;
 			}
 		}
 	}
diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index af57799c86ce..2e9a316c596a 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -268,13 +268,10 @@ static int sync_fill_fence_info(struct dma_fence *fence,
 		sizeof(info->driver_name));
 
 	info->status = dma_fence_get_status(fence);
-	while (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
-	       !test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags))
-		cpu_relax();
 	info->timestamp_ns =
-		test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags) ?
-		ktime_to_ns(fence->timestamp) :
-		ktime_set(0, 0);
+		dma_fence_is_signaled(fence) ?
+			ktime_to_ns(dma_fence_timestamp(fence)) :
+			ktime_set(0, 0);
 
 	return info->status;
 }
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 506371c42745..5a3a622fc672 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -929,7 +929,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 
 		if (next) {
 			next->s_fence->scheduled.timestamp =
-				job->s_fence->finished.timestamp;
+				dma_fence_timestamp(&job->s_fence->finished);
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 0d678e9a7b24..ebe78bd3d121 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -568,6 +568,25 @@ static inline void dma_fence_set_error(struct dma_fence *fence,
 	fence->error = error;
 }
 
+/**
+ * dma_fence_timestamp - helper to get the completion timestamp of a fence
+ * @fence: fence to get the timestamp from.
+ *
+ * After a fence is signaled the timestamp is updated with the signaling time,
+ * but setting the timestamp can race with tasks waiting for the signaling. This
+ * helper busy waits for the correct timestamp to appear.
+ */
+static inline ktime_t dma_fence_timestamp(struct dma_fence *fence)
+{
+	if (WARN_ON(!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)))
+		return ktime_get();
+
+	while (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags))
+		cpu_relax();
+
+	return fence->timestamp;
+}
+
 signed long dma_fence_wait_timeout(struct dma_fence *,
 				   bool intr, signed long timeout);
 signed long dma_fence_wait_any_timeout(struct dma_fence **fences,
-- 
2.34.1

