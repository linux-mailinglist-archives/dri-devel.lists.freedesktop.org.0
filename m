Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2404D3C64A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A67910E100;
	Tue, 20 Jan 2026 10:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A8sawhgS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90E410E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:02 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso48868325e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906621; x=1769511421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8nRTUzBqIniXHXD/lr6vPf/DvzOtKigaEyKOe5wdMs=;
 b=A8sawhgSDyhdQOxHgJqVTP7K6AzmHzv8PWs1Mj1B7NcpjhaCiaHxyYnvXhFNVbnDKx
 JemjCPEFIQ/99ssdc7AgTuYCmkP/lKcHaAdlKFrEr4K/OBF/ZIMBh9FJ2Qi2DV4r5ZU8
 x+uSqdl/JQLFgXvUlCI/g6pgTFV+y1Dk1xXKtxX7uyV1wIQLuBWK4ur5dpkQnASXbxPn
 8l0gibAojdEChbxiqElYB+Sa0rQCpQh4D42eZdcOvb1tY2I9/IuAEoEikvBI+vusnPKH
 nNm7YDTdXK18fHrcH6dl6HU+I1FqOoXKrKJGp3ULL4K0TVtfpuyKMT1H5YPAHxFQeqSO
 9GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906621; x=1769511421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W8nRTUzBqIniXHXD/lr6vPf/DvzOtKigaEyKOe5wdMs=;
 b=pAMJmpic6umxfKIxIXHkqIrxaC6nA8B8Xx/K6THrJIQrqvAlAblHsd1gzYTKEqOMGi
 h1hQtb2K0SGdwWduNvfw8bvYSL3kkPsEKnPGiRbO1Dwag7CI6QZvmUFpzgLD7452tuTB
 Y3qzRQgvG+3Hqshd/9/sP5ONba+eWrEQkekUVIGwKfSED4Oc3Hsak1P2WxJI76blb9lO
 0EGjuhCJIHDfDgj+y21T7fqRCFC6Wxpz6CjjCO6/pXsr3tX2lNP+ztxJBzNkXuB9gSJ4
 0nvA1Lny+FSnAwU0f5CcRQ+TZ6PRuWSo25tKHhBrhXhsarU6jpex+yccu2EWCXrJ5Ecy
 ebzA==
X-Gm-Message-State: AOJu0YyPET4xL56VlDEAF8NpqO1dj3ShhTlWecNdGXJrHvmfOiZEhMGl
 nLOSw+ArN8eFYoCLKjZiFvsGBNWtnqaPucdyam2hzrJHbIMR2MUqK17j
X-Gm-Gg: AY/fxX6NDScpGyKUXX/1gEVmyCxuauibycZyspHg7KV2o5gkGULe4lLbD7yC9gotS12
 GKcYn/Ld6yLH0pQl5EBtaz137iX/71bvWNEDArDE2aGqhrs9oQmbH/q/MauXJxE10o6GKof/YG4
 sdkhgSqPqNFmFbumW8tdqKKXsv/TESOxu5ScFqZyLbDbZkLnDV7Mefz428GVWgtMsqHapSs6Vbb
 6yfDG7BbIkxwl6r6tJg3q7wjA6lrVw9pQKVxA9z6y1Q2n+ewODvcdSY+EHmcdBBM3OvDxCFcVJf
 /vIy3NKdTGNfku9lDSaGCcc5aT6hp2T/VGOnZ49oxXKCQDkdPWBvxpVaik5YH9tzfHRYQjN5Z7R
 dY9gSC3uHu4j5E2n8H+HB/InM4zhkY49qdXQHAV6i6eeVxDW6c6LuVIQgPb1e3sfEpoTLKWuXht
 pLa8jHRobBDNEjVpA3RNiF8Cla
X-Received: by 2002:a05:600c:474a:b0:477:9b4a:a82 with SMTP id
 5b1f17b1804b1-4801eb14b36mr189888745e9.35.1768906621068; 
 Tue, 20 Jan 2026 02:57:01 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:57:00 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/9] dma-buf: detach fence ops on signal v2
Date: Tue, 20 Jan 2026 11:54:42 +0100
Message-ID: <20260120105655.7134-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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
 include/linux/dma-fence.h   |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index d52f30e1a289..c3249da1b136 100644
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
index 6bf4feb0e01f..e1afbb5909f9 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -472,7 +472,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -508,7 +508,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.43.0

