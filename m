Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5413D6A3C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822696EA42;
	Mon, 26 Jul 2021 23:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2160D6EA55
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:34:48 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e5so11641799pld.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr8TbT0NY8bhwRPFfOulQoFlLUKAkASJhK+Ly3YzODY=;
 b=j8LlgSPw1RFIs8exl6aXPn3feuweS/2CJIHKyHEB7xVGXTNTC85mtEg/Uq+42kAlt2
 3QjXHcRqxRY2YLBc/jRGnCj71ESXb3kYFw4vm/zBJUYQ8kIHhxPNUw8U5SBxXsPeo0++
 +0KYr1u29WW/FfVUqJJhz1n67eMRUY2pPWVlZ2NKZJ4YtMbcgkyjTi++nbRozr3VyCpB
 /Def4VylyfYnxhrjrlupA1NQ22I3TDfVPJqR6eoJLDGBYyvFR7ANRtd5Gu4fX47qDI8U
 T6fC5hASr8PoHrvYYtUpfai0fxI/yp8YrtOmOrPcSJnWieo53lWJRaIQyIskGWwapfcy
 PvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr8TbT0NY8bhwRPFfOulQoFlLUKAkASJhK+Ly3YzODY=;
 b=iwgLbaOgUNdBvHuJooH5K5Xxkvxb0NgBVXH2sY15Sel64mAAGcx8aaqP2w04w60wlV
 QUHtfHJdjZ/eLMm1U4X5R5p9SsQ5TADLz1cr3/f/Ml6PwAC05v+IJt3jEl4Y1MX7p+mn
 AuZxBb9kjmhzhIs9ACbM5rCxV1cA+OakG7/7w2rJxfQvMYSMQheXsY1oMH6MZ5J4jYiw
 GuMM3spqtgkZq7D0iP3YOWxu18Y6ZRm8PPV7mvtrlXI/Pm2I37BRxixKFr8xXiMbCHb6
 qSkgelaroCC1jHi0pFY5WmuW9ooag7+cRZnGg2pXo3w9kWuiOD5ap4vW/kdMdYeof8Z1
 slkQ==
X-Gm-Message-State: AOAM533Vn+1aLuqEJgUr7D+XMc19TfGBE1YoPrAFRXoazwS6ouzFDPGN
 IQd00BfW2L2+urigvBl5xv9SUzQ6zhU++Q==
X-Google-Smtp-Source: ABdhPJzCJR1KRrhEUmpZNBEL+HoO6bZ9tT6NUdNFHH+pky+Hz4zM8T717wtK0Zidl77XkVjEvdhVFw==
X-Received: by 2002:a17:90a:940e:: with SMTP id
 r14mr1342648pjo.41.1627342487091; 
 Mon, 26 Jul 2021 16:34:47 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u190sm1212457pfb.95.2021.07.26.16.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:34:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 1/4] dma-fence: Add deadline awareness
Date: Mon, 26 Jul 2021 16:38:48 -0700
Message-Id: <20210726233854.2453899-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to hint to the fence signaler of an upcoming deadline, such as
vblank, which the fence waiter would prefer not to miss.  This is to aid
the fence signaler in making power management decisions, like boosting
frequency as the deadline approaches and awareness of missing deadlines
so that can be factored in to the frequency scaling.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence.c | 39 +++++++++++++++++++++++++++++++++++++
 include/linux/dma-fence.h   | 17 ++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..2e0d25ab457e 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -910,6 +910,45 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+
+/**
+ * dma_fence_set_deadline - set desired fence-wait deadline
+ * @fence:    the fence that is to be waited on
+ * @deadline: the time by which the waiter hopes for the fence to be
+ *            signaled
+ *
+ * Inform the fence signaler of an upcoming deadline, such as vblank, by
+ * which point the waiter would prefer the fence to be signaled by.  This
+ * is intended to give feedback to the fence signaler to aid in power
+ * management decisions, such as boosting GPU frequency if a periodic
+ * vblank deadline is approaching.
+ */
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	unsigned long flags;
+
+	if (dma_fence_is_signaled(fence))
+		return;
+
+	spin_lock_irqsave(fence->lock, flags);
+
+	/* If we already have an earlier deadline, keep it: */
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags) &&
+	    ktime_before(fence->deadline, deadline)) {
+		spin_unlock_irqrestore(fence->lock, flags);
+		return;
+	}
+
+	fence->deadline = deadline;
+	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &fence->flags);
+
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	if (fence->ops->set_deadline)
+		fence->ops->set_deadline(fence, deadline);
+}
+EXPORT_SYMBOL(dma_fence_set_deadline);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..4e6cfe4e6fbc 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -88,6 +88,7 @@ struct dma_fence {
 		/* @timestamp replaced by @rcu on dma_fence_release() */
 		struct rcu_head rcu;
 	};
+	ktime_t deadline;
 	u64 context;
 	u64 seqno;
 	unsigned long flags;
@@ -99,6 +100,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -261,6 +263,19 @@ struct dma_fence_ops {
 	 */
 	void (*timeline_value_str)(struct dma_fence *fence,
 				   char *str, int size);
+
+	/**
+	 * @set_deadline:
+	 *
+	 * Callback to allow a fence waiter to inform the fence signaler of an
+	 * upcoming deadline, such as vblank, by which point the waiter would
+	 * prefer the fence to be signaled by.  This is intended to give feedback
+	 * to the fence signaler to aid in power management decisions, such as
+	 * boosting GPU frequency.
+	 *
+	 * This callback is optional.
+	 */
+	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
@@ -586,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
+
 struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
-- 
2.31.1

