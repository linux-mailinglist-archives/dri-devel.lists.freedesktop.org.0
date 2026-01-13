Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE8D19D4D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775AC10E4FC;
	Tue, 13 Jan 2026 15:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y1y+YSa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037510E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:32 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so77360795e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317691; x=1768922491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KflEZErmXVKJhiftCCKJkIp0qiachwlYSLe5CM6mkvw=;
 b=Y1y+YSa3omyN8mZg/NJEfd4lJlDolTiatYRzNuvLj/JbZ+qC97UbwkZQuMxF5+fE7P
 6WBZVFfN7WcmZ+5s1NgfitTxx7iF+rlZfyLWay8qxVPhKq6xixiXDXxtYNrWyr1p17hd
 aJVtHz0CIaMAeTGc31JCYFJS2lZFUYS5MItHOHr212I6NvkD0w5zHxR84ITRMXPUJ+qi
 0m93gjpS+79Vpv6hg0NltPIP/TNrZRs9kqddKXXTZDDY5qYLazeZnIZZfhTIUJdXc18B
 VpjTb2Qne/G5RSxkmZtiC1MUUdpJmkWYAsAaipsbb9AyfvT5SO/XgGXPlpriOfH9XLJs
 2nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317691; x=1768922491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KflEZErmXVKJhiftCCKJkIp0qiachwlYSLe5CM6mkvw=;
 b=tmUIkGtKhUKi73oovPyD5HVDGPJrjOp2ni5l5zis4cPFMtxej344DZ8dUWUHJLCUcr
 b+LbpdodmWZLh/iEWPqccg5ixHZRGziTyk0QeU8kTsIR7OzIwhbPCud8+QBzQ4PkP+Lh
 2gausVSeFNMVqfLG6+20km125td7btWiZ3ThUVoWkdyiefeGLJ+psFm5EcbtD4VOdW1A
 upDUUIVj3lnKYQrAOam8SaoxKsbq+Tf0FqQJ9M1Fk8U7TFW0zb8+Lv+AD1dmgLJD0PmZ
 otYBl6+Zj5hs1x0Yc5Z4lQ4rmmnmbCU4eW5b8eaWZ/8xDZei6tO67MecJ9BRWxdUjiha
 QV7A==
X-Gm-Message-State: AOJu0YwDi8a0MTHryuKMAcergrusmhSbrpEpJoLjMn/xVi6yrBfdgoaU
 7AcaAhL+yEM/sgQ0Y3+I5ELm2HiVoSq/d9dBqzeqG/1Eg16KHG35BiAF
X-Gm-Gg: AY/fxX6DiuCREQPZgki+t2EGmjlRHfpMV4O8DTmMPalg7UUUoyACEAO/LFsAYybD5wF
 sGX44mzJqBhZsOP/zLHUdJUZJa13g6Kbd+d92mSvB69MuhlbLTzICxTbugFggXS3qA9ZO9T1GI3
 wwSek1cPzm1Gcp8uU1+LKbFRzko5tuCxAN0rTebHi7QO2esneNNoVMnXl5M0jHG85mROQr5aBQ0
 mssuublZLzSZ1dO6+imcZkkZu4/s6tgmAxN3XKP2mqN/CcpW9TgPNpZgvsjoLG3WMqjL4iTz+iq
 X9k8DX7roLVMv8PC7CWz/3nU5EqytwumHQirJ7+NysJWJ8/Z9lc2FXDLgSGXQY6n1BPxKkhAqbL
 7cOffvjJ52g/rb91RM4BIJcaZl7exc+WyeGBlGRO/SZqlpL3injgZR8wBMOaeMx4DAoJI/9EFPN
 V4X10gpjwHBn3yvqoOQATq9R4=
X-Google-Smtp-Source: AGHT+IHy6M4rDen6wr7M5Q+J7ZXIwjMQbjJv0orU89FCqAGv8/poQkXr3SDLeMMHCmP6CmMIPC72wQ==
X-Received: by 2002:a05:600c:a119:b0:479:3a87:2093 with SMTP id
 5b1f17b1804b1-47d8c5f5facmr161281335e9.37.1768317690837; 
 Tue, 13 Jan 2026 07:21:30 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/10] dma-buf: detach fence ops on signal v2
Date: Tue, 13 Jan 2026 16:16:10 +0100
Message-ID: <20260113152125.47380-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

When neither a release nor a wait backend ops is specified it is possible
to let the dma_fence live on independently of the module who issued it.

This makes it possible to unload drivers and only wait for all their
fences to signal.

v2: fix typo in comment

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
 include/linux/dma-fence.h   | 10 +++++++---
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index e3e74f98f58d..481f1cd9aae2 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -371,6 +371,14 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return;
 
+	/*
+	 * When neither a release nor a wait operation is specified set the ops
+	 * pointer to NULL to allow the fence structure to become independent
+	 * from who originally issued it.
+	 */
+	if (!fence->ops->release && !fence->ops->wait)
+		RCU_INIT_POINTER(fence->ops, NULL);
+
 	/* Stash the cb_list before replacing it with the timestamp */
 	list_replace(&fence->cb_list, &cb_list);
 
@@ -537,7 +545,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	trace_dma_fence_wait_start(fence);
-	if (ops->wait) {
+	if (ops && ops->wait) {
 		/*
 		 * Implementing the wait ops is deprecated and not supported for
 		 * issuer independent fences, so it is ok to use the ops outside
@@ -602,7 +610,7 @@ void dma_fence_release(struct kref *kref)
 	}
 
 	ops = rcu_dereference(fence->ops);
-	if (ops->release)
+	if (ops && ops->release)
 		ops->release(fence);
 	else
 		dma_fence_free(fence);
@@ -638,7 +646,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (!was_set && ops->enable_signaling) {
+	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
 		if (!ops->enable_signaling(fence)) {
@@ -1024,7 +1032,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 371aa8ecf18e..9bacf8855380 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -283,7 +283,11 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
  */
 static inline bool dma_fence_is_initialized(struct dma_fence *fence)
 {
-	return fence && !!fence->ops;
+	/*
+	 * fence->ops might be set to NULL during signaling, but that will also
+	 * set the signaled flag.
+	 */
+	return fence && (!!fence->ops || !!fence->flags);
 }
 
 /**
@@ -469,7 +473,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -505,7 +509,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.43.0

