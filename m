Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4360BB22A9F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A0C10E167;
	Tue, 12 Aug 2025 14:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RAFC8R1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B22D10E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:34:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-459ddb41539so17929475e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755009245; x=1755614045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0ie8ytEuLla3veFaeUidif5HtgJBgoIaiWwWBtQdYgU=;
 b=RAFC8R1MfY7I/JeMfwjjMWQKWoQVHiTNTaJ5RAN6k4sZGpEROoQsW2yzv3PWbEECvk
 04LWUQ/XE05uZdFLWHl4ZBvBJx6/en1YXd8dxPvDEv0NMCMy7lRxP2auylx2UaasYSgE
 KlIeNdL79/PWOIRMwDhlTrJDDOMT8QJ7CLSocTzq1+8qKl9JIuYaVr0G/RGgiLQYrNR5
 uHVDiqPtILuh1hDLYXecj9EPWopU+lx+DXr4AdXOy/uZi4Yd0AlP1TssHc+ABsazB7fn
 ehY7lxUTQ6Pllruou5eIUOGOrAA4BzOVNBu2FyetH4X7D9M66As+skRSAPY2FZR8z6Iq
 +RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755009245; x=1755614045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ie8ytEuLla3veFaeUidif5HtgJBgoIaiWwWBtQdYgU=;
 b=tYKnSIATavS2INADkGpfeiedgEFFx0XE4X0XQL5ypZqSeNSu33+hXVQ5/REJAFGMBU
 Mv060qwxWpi/bzAvJ24Xw7oWwFUA8geikggvkUQcvx0eioryTMKqaI2hz1YYR9xcAFZz
 DRBMFX6MIKa/+x5PxVkZ3oxnZ4QGbNMn7TUa46m5nE8JzOY6EtiJTNpjQjnFcyrzYwns
 wI1a4vrQSNiUVAiIte6GS+gPdIZ1yuw2Dl6L9TeUAgWJAlZBXewBLGFOJktRPiXNUhNy
 gKQRAVgGYGqeNrMLlvn3OXB+QTG1gFmtC1EY9SdF/dj6tOON1h0KZy/q0hVbbEL9ag8C
 8w2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMnpQOoZjYXnPJQj3wuPM5afg+VQBS/O9lAmwCnfaFLpSdVvVKXEkBrGjE+m93zS4oDLVrQ3uZNXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGJhPKcznh8YIbmKIlqnJZJnvljpbQMe4cT59ohleYTZLDKucs
 Cju1vO20wl8j5L2AR2L86eoTGjjsSAeOAFFZ7vGH6JPUl5amC2ysNcml
X-Gm-Gg: ASbGncuj8ylQhbrYuWnmea7g80Vr0rEcFYZRzZTVrqCoZUCqPkbFtpcvXrJXKLQRfJO
 j5deO4YS95DIddc0u2scaYhnb8TLJpaKCWLjnXJ6XFR3qNdPsJ7QxSaK/QaOWEGcVjyZRqpocjJ
 jBQJBxwOwSFQN1LyowSGOC05hPC0GCwbDc4sgo9RRTDCv6js5jnFCAmAaVenAY10onjBpvwhA6E
 Bict9D3PX+IyqODzhra7h/VHa5YIS585uoP0nxrW5lDy8eQZySsAritiF05MJ4feNwebInTTurf
 Uyhhe0PNO+lu/c2YMF7Uu9hAUjxDnMni7Hes/shnsFDWJHzYJB/RqO8EKjnejhcPdqHJ4G4gJ4B
 hHpI/SGmvUtULfAf91lq/WUTn+lP5c85Rft57dXvg7feJ
X-Google-Smtp-Source: AGHT+IGXgbHfN3vs+VEYkOYnhLRddATAsfEDJ3pDVnW6g65mrXY1sdPZRJj0cMV4GaSK86Pzkfo4yQ==
X-Received: by 2002:a05:600c:4744:b0:458:bc58:850c with SMTP id
 5b1f17b1804b1-45a15b05dafmr605185e9.1.1755009244569; 
 Tue, 12 Aug 2025 07:34:04 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a5:9b00:5e00:c21:21a:c15b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5d7deaasm23714363f8f.65.2025.08.12.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 07:34:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch, tvrtko.ursulin@igalia.com, phasta@mailbox.org,
 airlied@gmail.com, dakr@kernel.org, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL
Date: Tue, 12 Aug 2025 16:34:02 +0200
Message-ID: <20250812143402.8619-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812143402.8619-1-christian.koenig@amd.com>
References: <20250812143402.8619-1-christian.koenig@amd.com>
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

From: Christian König <ckoenig@able.fritz.box>

We have the re-occurring problem that people try to invent a
DMA-fences implementation which signals fences based on an userspace
IOCTL.

This is well known as source of hard to track down crashes and is
documented to be an invalid approach. The problem is that it seems
to work during initial testing and only long term tests points out
why this can never work correctly.

So give at least a warning when people try to signal a fence from
task context and not from interrupts or a work item. This check is
certainly not perfect but better than nothing.

Signed-off-by: Christian König <ckoenig@able.fritz.box>
---
 drivers/dma-buf/dma-fence.c | 59 +++++++++++++++++++++++++++----------
 include/linux/dma-fence.h   |  9 ++++--
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 3f78c56b58dc..2bce620eacac 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -345,33 +345,23 @@ void __dma_fence_might_wait(void)
 }
 #endif
 
-
 /**
- * dma_fence_signal_timestamp_locked - signal completion of a fence
+ * dma_fence_signal_internal - internal signal completion of a fence
  * @fence: the fence to signal
  * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
  *
- * Signal completion for software callbacks on a fence, this will unblock
- * dma_fence_wait() calls and run all the callbacks added with
- * dma_fence_add_callback(). Can be called multiple times, but since a fence
- * can only go from the unsignaled to the signaled state and not back, it will
- * only be effective the first time. Set the timestamp provided as the fence
- * signal timestamp.
- *
- * Unlike dma_fence_signal_timestamp(), this function must be called with
- * &dma_fence.lock held.
+ * Internal signal the dma_fence without error checking. Should *NEVER* be used
+ * by drivers or external code directly.
  *
  * Returns 0 on success and a negative error value when @fence has been
  * signalled already.
  */
-int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
-				      ktime_t timestamp)
+int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp)
 {
 	struct dma_fence_cb *cur, *tmp;
 	struct list_head cb_list;
 
 	lockdep_assert_held(fence->lock);
-
 	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				      &fence->flags)))
 		return -EINVAL;
@@ -390,7 +380,46 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 
 	return 0;
 }
-EXPORT_SYMBOL(dma_fence_signal_timestamp_locked);
+EXPORT_SYMBOL(dma_fence_signal_internal);
+
+/**
+ * dma_fence_signal_timestamp_locked - signal completion of a fence
+ * @fence: the fence to signal
+ * @timestamp: fence signal timestamp in kernel's CLOCK_MONOTONIC time domain
+ *
+ * Signal completion for software callbacks on a fence, this will unblock
+ * dma_fence_wait() calls and run all the callbacks added with
+ * dma_fence_add_callback(). Can be called multiple times, but since a fence
+ * can only go from the unsignaled to the signaled state and not back, it will
+ * only be effective the first time. Set the timestamp provided as the fence
+ * signal timestamp.
+ *
+ * Unlike dma_fence_signal_timestamp(), this function must be called with
+ * &dma_fence.lock held.
+ *
+ * Returns 0 on success and a negative error value when @fence has been
+ * signalled already.
+ */
+int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
+				      ktime_t timestamp)
+{
+	/*
+	 * We have the re-occurring problem that people try to invent a
+	 * DMA-fences implementation which signals fences based on an userspace
+	 * IOCTL.
+	 *
+	 * This is well known as source of hard to track down crashes and is
+	 * documented to be an invalid approach. The problem is that it seems
+	 * to work during initial testing and only long term tests points out
+	 * why this can never work correctly.
+	 *
+	 * So give at least a warning when people try to signal a fence from
+	 * task context and not from interrupts or a work item. This check is
+	 * certainly not perfect but better than nothing.
+	 */
+	WARN_ON_ONCE(!in_interrupt() && !current_work());
+	return dma_fence_signal_internal(fence, timestamp);
+}
 
 /**
  * dma_fence_signal_timestamp - signal completion of a fence
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 64639e104110..8dbcd66989b8 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -369,6 +369,7 @@ int dma_fence_signal_locked(struct dma_fence *fence);
 int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
 int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      ktime_t timestamp);
+int dma_fence_signal_internal(struct dma_fence *fence, ktime_t timestamp);
 signed long dma_fence_default_wait(struct dma_fence *fence,
 				   bool intr, signed long timeout);
 int dma_fence_add_callback(struct dma_fence *fence,
@@ -422,7 +423,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-		dma_fence_signal_locked(fence);
+		dma_fence_signal_internal(fence, ktime_get());
 		return true;
 	}
 
@@ -448,11 +449,15 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 static inline bool
 dma_fence_is_signaled(struct dma_fence *fence)
 {
+	unsigned long flags;
+
 	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 		return true;
 
 	if (fence->ops->signaled && fence->ops->signaled(fence)) {
-		dma_fence_signal(fence);
+		spin_lock_irqsave(fence->lock, flags);
+		dma_fence_signal_internal(fence, ktime_get());
+		spin_unlock_irqrestore(fence->lock, flags);
 		return true;
 	}
 
-- 
2.43.0

