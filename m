Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8BC580F3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D269210E84C;
	Thu, 13 Nov 2025 14:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bIHNDqG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988AC10E832
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:38 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-640b0639dabso1549675a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045617; x=1763650417; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TKX9weevS+NcJ407xi5DYySlL9DlXey2iX34pOiJQdM=;
 b=bIHNDqG/iIE67Sc3qtVVeTos4ALCaOEoK82Ipdd3K1DpEUFnnnqMu0p5t2FJMgwSJS
 y3QvUpzzkB/Cj0PEkfyg1jDlkdYC5PEtP3P6a4fXRu4R4xqFYItiwVqMckUY8R7X4pFT
 8ygq/tlv90RkFDYfcymdPilZryLPsKQaRf1ZcS0mrmRW31XrMSqkF7XphQurTFf7NzMH
 j1utl569YVCLWlo5LnOTX8tqW6U6gZKO+M8WoB27d3b6snqVW+Y1OROzDa0hIyz3rKR7
 C/hQzzjFl6J78p3AGb9YkVyRCT7EWX1XxSw8bG/2YyPozxQcTjFpQ7/0ymxpL1yw3HrR
 b8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045617; x=1763650417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TKX9weevS+NcJ407xi5DYySlL9DlXey2iX34pOiJQdM=;
 b=nLvxJumjFaV4Bjhkder25OPI1QAiR0okQp+FpJHcaCXuYrs27ZU3XG+0GGaL7ndvGV
 k9GhBAgFJnZw1R+pIDfBrGD1DPFhxU+du8PGYG/6VpgP4HoUE4vKMd1EVcu/vELysjv/
 D0YAEx307WQ5UYTilySfs3Crfwxt1NWGHTTyoHOIyk8NtSUqYh3B411ySQgFZo8JnFwJ
 GYXcEWb/xmtxfMiwCJVl0PFVrOxNQAokK7cCUyCCxI/6yvEd2ZLHovZodqVvlTXby4wr
 c/4KqwvWWQwXqo6W9d2IN1VqlwMNhIHTN7ofeI4Mh9aaexplKCDeR+lBzjMiD6gz46XR
 xikA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtQfw9Nbrlc63wNGPa5JdGvR00euhlUFMCXnuI0+oo2C5nFzE8D20L8uqencjqHIuZ9Da5YNBhvcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSMgJwXhmGQZJ983xDtYTG0HkiFgKfOmWqjMKlDbmvEKr/FXsd
 zhVIcqsWQiviw2lOicS231RAeMmeWSzM2KEX/NAtTl5kLp/M/YxcKP+i
X-Gm-Gg: ASbGncvEXNMc9mpp4B1x1MSvoFNk1rdVmBaK11sSXMv9SaW5HhQP0+t6MXoMJh1/fbZ
 aMYtG8866x47O0E83OTUNsqPEL6hCEvGQgyJ8aUV0kp1UL/OH2375rNPHWFSLm1CnyOYYzbJXty
 HeyMZj4gaiOHI/sPHBeVrB1Nba/3h3TEis6nQZzrp0A2Mor2e1Xlha/e7E7hRAciXVjvXyFGa9H
 20fcepRycMS8c6WCGQMcSv7NAW4y1/cmIzsqNW/bY6MseBTi1tglqfOFMA2dnaXlFIUsK5kG4uB
 0wr0ktYJIoh4ow/Z/KA1Z4o4kfExiQ+eLHmZ83XvZ0WHosk9iKf5cxdNXkB5SGuqIbuMHW5TAC9
 yeApoDkO4y1IzcPFDGEh/wQv0Q6dA0zwhb+gsYPxwAhtVeLzBNkFO81M8v5olG4Oe3/4Baxlkad
 +EsChgbPPFTzOOBPU3HQpu0A==
X-Google-Smtp-Source: AGHT+IGXKsqirjAlMp585gkAkiQJO7pFlXJ2rNvLaF2oiytnabvZYB83EV9YYgjEuGG19e6QmbGeaQ==
X-Received: by 2002:a17:906:a207:b0:b73:39c3:b4f with SMTP id
 a640c23a62f3a-b7339c30d46mr374756366b.50.1763045617052; 
 Thu, 13 Nov 2025 06:53:37 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 03/18] dma-buf: detach fence ops on signal v2
Date: Thu, 13 Nov 2025 15:51:40 +0100
Message-ID: <20251113145332.16805-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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
---
 drivers/dma-buf/dma-fence.c | 16 ++++++++++++----
 include/linux/dma-fence.h   |  4 ++--
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ec21be9b089a..7074347f506d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -374,6 +374,14 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
 				      &fence->flags)))
 		return -EINVAL;
 
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
 
@@ -513,7 +521,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
 	trace_dma_fence_wait_start(fence);
-	if (ops->wait) {
+	if (ops && ops->wait) {
 		/*
 		 * Implementing the wait ops is deprecated and not supported for
 		 * issuer independent fences, so it is ok to use the ops outside
@@ -578,7 +586,7 @@ void dma_fence_release(struct kref *kref)
 	}
 
 	ops = rcu_dereference(fence->ops);
-	if (ops->release)
+	if (ops && ops->release)
 		ops->release(fence);
 	else
 		dma_fence_free(fence);
@@ -614,7 +622,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (!was_set && ops->enable_signaling) {
+	if (!was_set && ops && ops->enable_signaling) {
 		trace_dma_fence_enable_signal(fence);
 
 		if (!ops->enable_signaling(fence)) {
@@ -1000,7 +1008,7 @@ void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->set_deadline && !dma_fence_is_signaled(fence))
+	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
 		ops->set_deadline(fence, deadline);
 	rcu_read_unlock();
 }
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 77f07735f556..eb57bcc8712f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -436,7 +436,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal_locked(fence);
 		return true;
@@ -472,7 +472,7 @@ dma_fence_is_signaled(struct dma_fence *fence)
 
 	rcu_read_lock();
 	ops = rcu_dereference(fence->ops);
-	if (ops->signaled && ops->signaled(fence)) {
+	if (ops && ops->signaled && ops->signaled(fence)) {
 		rcu_read_unlock();
 		dma_fence_signal(fence);
 		return true;
-- 
2.43.0

