Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A886FCB5CDD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9ED10E7F1;
	Thu, 11 Dec 2025 12:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j4rHKXo4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693A410E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:19 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so279325e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455858; x=1766060658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyPXU09MHf0sQOMw0xMzptL/19K/nBS/D4vJF5btR6A=;
 b=j4rHKXo4h5HkiP41u664LzOmevNEax1Ej+PmapeA8WlDMW322iY1lXSVIu1a8/LhP+
 XKevvAJJ617/hlpBzLHwogsZ1y9d6Qu+coW+j5n/zdzCzVpHr0h01pOtwRJMXsXoRkV3
 eu8wbZx28xlqYSZ0wFrw6Lya/tUUImECjTc3H54Do/+gTzlpts/VClyEMUf8vVk8v15w
 KVMZeaGccQco69oYCgTZvekUR2f5hIh5oLM/p8tKJqH4XCJsA00vk+8DqmEQLsY8/y2U
 WyWxt2owysiM9y3TwxKBKahPsq0ckhre7+HSPH5wKfntWh2TTdcoz9jXUy1TMZoWK+US
 3d+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455858; x=1766060658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PyPXU09MHf0sQOMw0xMzptL/19K/nBS/D4vJF5btR6A=;
 b=rq3VXVNJIabDuQmWRB0lkkI0KFUhzpAxE9x0b7NbsX1YBxYi6WO/+0l2KQwUE3Kh1K
 xIK9h6Www0dxcncg5j9lxsBwR7RWKeLXtZl+m56OC+S2X04X/YtE4zzWEmEB0AJ1x9hT
 rZ4yfLdge+x++bF103EN60NQ7TaQob3GG1XJRUTsDHDfASeZ42CARq1gMSyf/a57XL5r
 JVS7qQ557GdgK598vYZmASkzv0qwLzmoQdXcaC/qZRcHVKDKyUqtoqsM5NjS4IY9XJUt
 lz6qY/Uc13XDYF8Tu9F39kWOTUxP79pGqKiURBV2zCKwwQWBsb7/LhTgBSyf+CBuHsbA
 ytwg==
X-Gm-Message-State: AOJu0YyrF4Bdh/bqvlQq6GuezwD1twZTk4RcJAVxalLQVY7M7r1OEWzc
 ElokgLFTwxqN4xGT5dwIJJCj0eAgckqpc5TeJNouriPDmL3hv/ixwJkZ
X-Gm-Gg: AY/fxX4Db2EaeywDlnKMNAyT5JR4XjSQGD87q67kr9K6QYnfxtLUHMuQ54UeuzdGOcN
 gAVqbtiJSWR2MO5GrLXjmZXP2QHR0oDq4XYPuV2G9zPfOlWRpz/xyXBUUWE0vBB4/9kh90e42lR
 AIIaHabBoV985lETBGhJ4WOkjGrmeZ7cuV9csxc7UCspQaE8P16HklKn8ONzRtccxjT+UzkTo9K
 /ieqO+s6A5oCE6PUVPV5gX2DyO7MxLj7UlDDsgIGskN7jfot1sczFBOyUZyv0bH+MLHmDoOV8Kg
 AQjwLTKU+qNxfk6ZTtPmZkFxxl8aYldxMXB8XOjCziye3G0kolXH65Q7KfR1QwzmeJw4UdyfMVA
 qzvY/KbaQfRcDhp29dBe+1z4sZJDtTkJyJ5iA4XHdnubgRQ5tB8IVBt53Z8Lw+NaAwX206SNpdy
 77Q30fuL1hIP/rdZ3ZGf9irt3r
X-Google-Smtp-Source: AGHT+IE3/mwwbZ/cKhn5lnPFOEc9dlpZzvgMg5X0IrfmoCvzdKuewBjuPU21bkVlBSzYEAgPEMitsg==
X-Received: by 2002:a05:600c:630c:b0:477:9392:8557 with SMTP id
 5b1f17b1804b1-47a83790ca0mr60631865e9.18.1765455857859; 
 Thu, 11 Dec 2025 04:24:17 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:17 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
Date: Thu, 11 Dec 2025 13:16:40 +0100
Message-ID: <20251211122407.1709-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence implementations.

So use this approach for the scheduler fences as well just in case if
anybody uses this as blueprint for its own implementation.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
 include/drm/gpu_scheduler.h             | 4 ----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 08ccbde8b2f5..47471b9e43f9 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 	/* If we already have an earlier deadline, keep it: */
 	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
 	    ktime_before(fence->deadline, deadline)) {
-		spin_unlock_irqrestore(&fence->lock, flags);
+		dma_fence_unlock_irqrestore(f, flags);
 		return;
 	}
 
@@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 
 	fence->owner = owner;
 	fence->drm_client_id = drm_client_id;
-	spin_lock_init(&fence->lock);
 
 	return fence;
 }
@@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
-		       &fence->lock, entity->fence_context, seq);
+		       NULL, entity->fence_context, seq);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
-		       &fence->lock, entity->fence_context + 1, seq);
+		       NULL, entity->fence_context + 1, seq);
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..b77f24a783e3 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,10 +297,6 @@ struct drm_sched_fence {
          * belongs to.
          */
 	struct drm_gpu_scheduler	*sched;
-        /**
-         * @lock: the lock used by the scheduled and the finished fences.
-         */
-	spinlock_t			lock;
         /**
          * @owner: job owner for debugging
          */
-- 
2.43.0

