Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3588452EF6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043A6E1B5;
	Tue, 16 Nov 2021 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09706E1B5;
 Tue, 16 Nov 2021 10:24:40 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o29so16434339wms.2;
 Tue, 16 Nov 2021 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Yvjc1coossNdhTK2oO9Fca5G2s5nGciyVwZQ1Y878tM=;
 b=LFLLXW935M50vLPFjT34+6ReA2hmr6HNS/Hn3hM9AVYVXMSBB/tEC+tmzgpBHRmoB5
 OGvlB+A7EzYowh3TIH8XK8Iigo1yg5vJG1zRA8IWyRlhw8qgBjqCaAoRi6YzywEjyusG
 KkIWYFeWPyGOGNCzs3rHu1EuZfaiMQxPX0+bfwFyuIwa6uWRKySQ9g3SfnlSqsMhf82k
 LmqYHSqYbSVouGgf6omoSqwMmFCBLEeoBZdryzIAzNneXMw5hyCRWyaqmhGlatdO4JvF
 Sd7+aZYgTpxif3RRdPkyRutGOBpb19oF9ji/YlOVT5VHSUWXw9cx2r8MGlwdbGHnMhjg
 bXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yvjc1coossNdhTK2oO9Fca5G2s5nGciyVwZQ1Y878tM=;
 b=mTpNNE5WqK0aEoWnq9x0O6S/yhir4OeUlUzHbO7Bf01EfxBFA/fy/7SoM9fwk8PzBW
 ljEvF3UDczB6DPz2hsdb99p94V2YAgcN2Qb3eVfOKkp/gxcUllQWxzeGJc+czScqKy53
 9y86VsFa/xZyIYOIccyXxHn/r7OF9vAM5LBnGtFDKq8g+hq2FxPEVEN5pVhywEy/U6qD
 OYBr6g8NiyEWXXTQ7sFD1Q4x79K5ppnPv03kklhuWFxl5LyDkDEl9b6D7JDLCC5Zsu0R
 m+aX8SxbJyJ9cA90kCVgj03CKVHQFaTbhemAILMNjpAl3dvkNgy6VLEYvB9qfMrf6Ztz
 qkyA==
X-Gm-Message-State: AOAM530/BETkX4m7EIKH14w4NIbmmMxWkDzOidus2C7SAtzGynyHMpDR
 9Ohn5Q07/d5rm4gXiYS8mdeM/t0UqkRsCA==
X-Google-Smtp-Source: ABdhPJzk5CGDuYi33Uf2z1TBRx528jNnRqlGsMxdAvBoYGBq9hdF+1XbdEewIOdEBTVc6cQWmAjcxg==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr69866612wmh.19.1637058279210; 
 Tue, 16 Nov 2021 02:24:39 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 4sm22119334wrz.90.2021.11.16.02.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:24:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915: Fix i915_request fence wait semantics
Date: Tue, 16 Nov 2021 11:24:30 +0100
Message-Id: <20211116102431.198905-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116102431.198905-1-christian.koenig@amd.com>
References: <20211116102431.198905-1-christian.koenig@amd.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The i915_request fence wait behaves differently for timeout = 0
compared to expected dma-fence behavior.

i915 behavior:
- Unsignaled: -ETIME
- Signaled: 0 (= timeout)

Expected:
- Unsignaled: 0
- Signaled: 1

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 57 ++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/i915_request.h |  5 +++
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 820a1f38b271..42cd17357771 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -96,9 +96,9 @@ static signed long i915_fence_wait(struct dma_fence *fence,
 				   bool interruptible,
 				   signed long timeout)
 {
-	return i915_request_wait(to_request(fence),
-				 interruptible | I915_WAIT_PRIORITY,
-				 timeout);
+	return i915_request_wait_timeout(to_request(fence),
+					 interruptible | I915_WAIT_PRIORITY,
+					 timeout);
 }
 
 struct kmem_cache *i915_request_slab_cache(void)
@@ -1857,23 +1857,27 @@ static void request_wait_wake(struct dma_fence *fence, struct dma_fence_cb *cb)
 }
 
 /**
- * i915_request_wait - wait until execution of request has finished
+ * i915_request_wait_timeout - wait until execution of request has finished
  * @rq: the request to wait upon
  * @flags: how to wait
  * @timeout: how long to wait in jiffies
  *
- * i915_request_wait() waits for the request to be completed, for a
+ * i915_request_wait_timeout() waits for the request to be completed, for a
  * maximum of @timeout jiffies (with MAX_SCHEDULE_TIMEOUT implying an
  * unbounded wait).
  *
  * Returns the remaining time (in jiffies) if the request completed, which may
- * be zero or -ETIME if the request is unfinished after the timeout expires.
+ * be zero if the request is unfinished after the timeout expires.
+ * If the timeout is 0, it will return 1 if the fence is signaled.
+ *
  * May return -EINTR is called with I915_WAIT_INTERRUPTIBLE and a signal is
  * pending before the request completes.
+ *
+ * NOTE: This function has the same wait semantics as dma-fence.
  */
-long i915_request_wait(struct i915_request *rq,
-		       unsigned int flags,
-		       long timeout)
+long i915_request_wait_timeout(struct i915_request *rq,
+			       unsigned int flags,
+			       long timeout)
 {
 	const int state = flags & I915_WAIT_INTERRUPTIBLE ?
 		TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
@@ -1883,7 +1887,7 @@ long i915_request_wait(struct i915_request *rq,
 	GEM_BUG_ON(timeout < 0);
 
 	if (dma_fence_is_signaled(&rq->fence))
-		return timeout;
+		return timeout ?: 1;
 
 	if (!timeout)
 		return -ETIME;
@@ -1992,6 +1996,39 @@ long i915_request_wait(struct i915_request *rq,
 	return timeout;
 }
 
+/**
+ * i915_request_wait - wait until execution of request has finished
+ * @rq: the request to wait upon
+ * @flags: how to wait
+ * @timeout: how long to wait in jiffies
+ *
+ * i915_request_wait() waits for the request to be completed, for a
+ * maximum of @timeout jiffies (with MAX_SCHEDULE_TIMEOUT implying an
+ * unbounded wait).
+ *
+ * Returns the remaining time (in jiffies) if the request completed, which may
+ * be zero or -ETIME if the request is unfinished after the timeout expires.
+ * May return -EINTR is called with I915_WAIT_INTERRUPTIBLE and a signal is
+ * pending before the request completes.
+ *
+ * NOTE: This function behaves differently from dma-fence wait semantics for
+ * timeout = 0. It returns 0 on success, and -ETIME if not signaled.
+ */
+long i915_request_wait(struct i915_request *rq,
+		       unsigned int flags,
+		       long timeout)
+{
+	long ret = i915_request_wait_timeout(rq, flags, timeout);
+
+	if (!ret)
+		return -ETIME;
+
+	if (ret > 0 && !timeout)
+		return 0;
+
+	return ret;
+}
+
 static int print_sched_attr(const struct i915_sched_attr *attr,
 			    char *buf, int x, int len)
 {
diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index dc359242d1ae..3c6e8acd1457 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -414,6 +414,11 @@ void i915_request_unsubmit(struct i915_request *request);
 
 void i915_request_cancel(struct i915_request *rq, int error);
 
+long i915_request_wait_timeout(struct i915_request *rq,
+			       unsigned int flags,
+			       long timeout)
+	__attribute__((nonnull(1)));
+
 long i915_request_wait(struct i915_request *rq,
 		       unsigned int flags,
 		       long timeout)
-- 
2.25.1

