Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B969D4A6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BC810E78E;
	Mon, 20 Feb 2023 20:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE18310E78D;
 Mon, 20 Feb 2023 20:19:21 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id f11so1227665pfe.2;
 Mon, 20 Feb 2023 12:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAzgDJUXjy9h0b3wWSJvQgc6EH9SI72PAik2xEzTc0A=;
 b=L3pLkaDHvEbV43iHZrzlIEV7OhTotYtHn/7GtNIJgutWGMGrnnN9lu6JzkyGk2eqtv
 gAeYOrSjmSd5R+JzfsJrDASD1KvwFIfmh+OtnGd/4B0aAFgLP4f01sK+arwiDDVngZNU
 b6tajlB2k+l07TTmVMJYoyWmqQhWwklrEhVKAsPnnpsrwWDRdG2JZjZPCcJLCDvCE1ZV
 zNvNGA0mww53jE5+oTomy4ePhhb1a7HPVS6NLi50cYWoZAduiH314mQnGHROPJfKIr/+
 /CUxe1TvUq5paX+fqp7V/6REycY2S73V2owLVjcOyM/c5leU7xy/oiEJ5QpSbktFbQZH
 0/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAzgDJUXjy9h0b3wWSJvQgc6EH9SI72PAik2xEzTc0A=;
 b=nFeaMtNBK/rTv0TgmUJhZzMXWLVQFnSCDgqMyIQv8bBuOdRpTpz4n12jTGCZbPvHWq
 d21LCLKSb3wbufdJPv56z6uV7CmPbn7lYpIfYMjKwv75NAWmQW6O5IRBwOPAiUNCvyfZ
 ByLSBdKbFqapkBfqh6oNugTMqjBoyD0OHOYaXDgaEKvJIYFHWlwkxvMpkbDCctICAY6G
 QWEKEHihs1GWZ2KTG+oS4ndMLlLN6jYWj9bYA2juWTLJKh4TajwSRzR0WioTGni0vocg
 jUvqhrkET3usTfQpyZ77pcTi3F0XdWHWDpINFjFwQ5aolBznG/VIX2Mln6qbURLHR246
 kI8g==
X-Gm-Message-State: AO0yUKUuwHDF6p0PQ14QK/sPD2ywKoVAQGPjWiA13iu3z+fsYqAyVDjv
 MD5fBRm2bcDdFZAhQBd1/0VlqozTrsk=
X-Google-Smtp-Source: AK7set+T1ETLgiEQvfF2x6OGFtWpU1Whd0FMuM7my/yGNBBYPdgyZrdMLMOhVxHrUvhUAs/zc+udAA==
X-Received: by 2002:a05:6a00:13a5:b0:5a8:c699:3eaa with SMTP id
 t37-20020a056a0013a500b005a8c6993eaamr3307609pfg.9.1676924361040; 
 Mon, 20 Feb 2023 12:19:21 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 v24-20020aa78518000000b005a9ea5d43ddsm6634377pfn.174.2023.02.20.12.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:20 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 01/14] dma-buf/dma-fence: Add deadline awareness
Date: Mon, 20 Feb 2023 12:18:48 -0800
Message-Id: <20230220201916.1822214-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a way to hint to the fence signaler of an upcoming deadline, such as
vblank, which the fence waiter would prefer not to miss.  This is to aid
the fence signaler in making power management decisions, like boosting
frequency as the deadline approaches and awareness of missing deadlines
so that can be factored in to the frequency scaling.

v2: Drop dma_fence::deadline and related logic to filter duplicate
    deadlines, to avoid increasing dma_fence size.  The fence-context
    implementation will need similar logic to track deadlines of all
    the fences on the same timeline.  [ckoenig]
v3: Clarify locking wrt. set_deadline callback
v4: Clarify in docs comment that this is a hint

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 21 +++++++++++++++++++++
 include/linux/dma-fence.h   | 20 ++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 0de0482cd36e..e3331761384c 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -912,6 +912,27 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+
+/**
+ * dma_fence_set_deadline - set desired fence-wait deadline
+ * @fence:    the fence that is to be waited on
+ * @deadline: the time by which the waiter hopes for the fence to be
+ *            signaled
+ *
+ * Give the fence signaler a hint about an upcoming deadline, such as
+ * vblank, by which point the waiter would prefer the fence to be
+ * signaled by.  This is intended to give feedback to the fence signaler
+ * to aid in power management decisions, such as boosting GPU frequency
+ * if a periodic vblank deadline is approaching but the fence is not
+ * yet signaled..
+ */
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
+		fence->ops->set_deadline(fence, deadline);
+}
+EXPORT_SYMBOL(dma_fence_set_deadline);
+
 /**
  * dma_fence_describe - Dump fence describtion into seq_file
  * @fence: the 6fence to describe
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..d77f6591c453 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -257,6 +258,23 @@ struct dma_fence_ops {
 	 */
 	void (*timeline_value_str)(struct dma_fence *fence,
 				   char *str, int size);
+
+	/**
+	 * @set_deadline:
+	 *
+	 * Callback to allow a fence waiter to inform the fence signaler of
+	 * an upcoming deadline, such as vblank, by which point the waiter
+	 * would prefer the fence to be signaled by.  This is intended to
+	 * give feedback to the fence signaler to aid in power management
+	 * decisions, such as boosting GPU frequency.
+	 *
+	 * This is called without &dma_fence.lock held, it can be called
+	 * multiple times and from any context.  Locking is up to the callee
+	 * if it has some state to manage.
+	 *
+	 * This callback is optional.
+	 */
+	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
@@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
+
 struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
-- 
2.39.1

