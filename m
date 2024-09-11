Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D6974DB9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E101410E87B;
	Wed, 11 Sep 2024 08:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fPLGnulF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDE10E816
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:17 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-374c84dcc90so3821043f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045156; x=1726649956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/VAcYiktjAOJPpzJiYbjfEF7dkzgGfOdawVE+zsgY2o=;
 b=fPLGnulFn5qjZGu93KYflEsqQ8Qk881HcecBEvj9WWxtRNteEh+6QgEJozCosKkAM2
 FDcuYX2jqloLnicG1WBSQQzRlmcYj+HTpn46eKGUqG0FzIDZ5PlGXaTunLncEq64wBiQ
 aZ8dpb3TajGveRh0hHPwvjkh5Lem09TIqcy76K3zeLSxEDTxHlLA3M8LKMwf/JE+kC/5
 psR6uYA/A/aLB5yJHS1r8djYFIU7im3mHaflN70DKUBYKve/83chn+ZIUdIy0Cdiv9uW
 mzDUqEyFQ/9XaHbTJnp0GNuwdtFV1n+kNa2rrATyKmiMSoGQtk3mEgXLkraRdR1L8XwY
 Gm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045156; x=1726649956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VAcYiktjAOJPpzJiYbjfEF7dkzgGfOdawVE+zsgY2o=;
 b=eNTiHgNRQ27VrFNcY+vP2fNishSDrU1O4LbeNv8pFsbQt4CaGiBegUcOX4IVzVv8el
 lHBR5Y8Eow8v+xvBWzBjEWzVg3lBc9Kg11SGBfvxbeZNbCZ12RbIDRC/jNSyJ6FcASe5
 5Eer2Z5GLos94eGyhkW72Yit9yVm7ZE23uS51RMo5fHuvhgArTo3FE81h8zxAY26n2cJ
 IqSq44Tz4UQW1/cdLNH3sArgCmeWK/NQjIo06LYyb6pQB5XbYsyER/JjQPKgcaF2I1xG
 bUGI6UNylIFtEhmwSFx6vqTiVrNiF+R4fJcMaaN0xHnSIJKfkbquNnj6xR3XpC4Aofx4
 e5vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqJU9UtUm3SJxTpix3fZHlzQuG9FTzMtaeF3Y0tpusPWJhHqHB1bGVhHdJp3TGuX5mhMUmkq/OUXo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbjX8djgqsaLkmnm2L6SqgmjtzceKU6YOEAWALLcrkQ2rQ5aLl
 tx34hT2XNTO8+sA8qlRrIlPNh2XtdZcwbkBg7OE7bUHRI1sbPjne
X-Google-Smtp-Source: AGHT+IHyOX3jsbfFC+Dh1o1p4iVLlXZsZZqdmyY4VwjkGUyzjSCa+KK/hx6hWYQeCJ+QNMQ4bHmJ1Q==
X-Received: by 2002:a5d:4a88:0:b0:374:baeb:2ec with SMTP id
 ffacd0b85a97d-378895ca351mr11595408f8f.19.1726045155801; 
 Wed, 11 Sep 2024 01:59:15 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/amdgpu: rework fallback timer handling
Date: Wed, 11 Sep 2024 10:59:02 +0200
Message-Id: <20240911085903.1496-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
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

Arm the fallback timer directly while submitting fences, it should only
be used on broken hardware anyway.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 64 ++++++-----------------
 1 file changed, 16 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2f24a6aa13bf..a5256ba2b03f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -125,6 +125,19 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
 	return seq;
 }
 
+/**
+ * amdgpu_fence_schedule_fallback - schedule fallback check
+ *
+ * @ring: pointer to struct amdgpu_ring
+ *
+ * Start a timer as fallback to our interrupts.
+ */
+static void amdgpu_fence_schedule_fallback(struct amdgpu_ring *ring)
+{
+	mod_timer(&ring->fence_drv.fallback_timer,
+		  jiffies + AMDGPU_FENCE_JIFFIES_TIMEOUT);
+}
+
 /**
  * amdgpu_fence_emit - emit a fence on the requested ring
  *
@@ -206,6 +219,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 
 	*f = fence;
 
+	if (!timer_pending(&ring->fence_drv.fallback_timer))
+		amdgpu_fence_schedule_fallback(ring);
+
 	return 0;
 }
 
@@ -244,19 +260,6 @@ int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,
 	return 0;
 }
 
-/**
- * amdgpu_fence_schedule_fallback - schedule fallback check
- *
- * @ring: pointer to struct amdgpu_ring
- *
- * Start a timer as fallback to our interrupts.
- */
-static void amdgpu_fence_schedule_fallback(struct amdgpu_ring *ring)
-{
-	mod_timer(&ring->fence_drv.fallback_timer,
-		  jiffies + AMDGPU_FENCE_JIFFIES_TIMEOUT);
-}
-
 /**
  * amdgpu_fence_process - check for fence activity
  *
@@ -785,39 +788,6 @@ static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
 	return (const char *)to_amdgpu_ring(job->base.sched)->name;
 }
 
-/**
- * amdgpu_fence_enable_signaling - enable signalling on fence
- * @f: fence
- *
- * This function is called with fence_queue lock held, and adds a callback
- * to fence_queue that checks if this fence is signaled, and if so it
- * signals the fence and removes itself.
- */
-static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
-{
-	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
-		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
-
-	return true;
-}
-
-/**
- * amdgpu_job_fence_enable_signaling - enable signalling on job fence
- * @f: fence
- *
- * This is the simliar function with amdgpu_fence_enable_signaling above, it
- * only handles the job embedded fence.
- */
-static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
-{
-	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
-
-	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
-		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
-
-	return true;
-}
-
 /**
  * amdgpu_fence_free - free up the fence memory
  *
@@ -877,14 +847,12 @@ static void amdgpu_job_fence_release(struct dma_fence *f)
 static const struct dma_fence_ops amdgpu_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_fence_get_timeline_name,
-	.enable_signaling = amdgpu_fence_enable_signaling,
 	.release = amdgpu_fence_release,
 };
 
 static const struct dma_fence_ops amdgpu_job_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
-	.enable_signaling = amdgpu_job_fence_enable_signaling,
 	.release = amdgpu_job_fence_release,
 };
 
-- 
2.34.1

