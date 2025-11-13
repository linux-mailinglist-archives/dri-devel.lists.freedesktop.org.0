Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E226CC580E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B7A10E846;
	Thu, 13 Nov 2025 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VSBSU6Tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E367810E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-640a3317b89so1462021a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045621; x=1763650421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PyPXU09MHf0sQOMw0xMzptL/19K/nBS/D4vJF5btR6A=;
 b=VSBSU6TvQNMPsCnoEz7/Wsjm1GjLiNINrVQNTs4Vx/gEKcwhxcWr4zv67rBxMQ7tps
 /UjuDw43APDk0TqcTihR3xBZn9KYdCSqXwrutiyLcs7C20duUFEAvudE/oZZJvCtCNDl
 ieDQIeFVOQohpPKBShsStz91v3bW74MVPJoQ3k7qX835PpeuLEKoxwE/Z3oUmNLoX/VC
 qf9lyxgP5/FFPocKc+aOiF7J+fHSSK3NWLqwsYk7vZpjyXQytECKuYfV8qIvod2MJTt7
 FxV4wbISX5oIYGiR6erFTSqsfPHGN25D1ov6g9nwo3Pf24Ja3eKTGNQcv1FS9IxzddD6
 o3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045621; x=1763650421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PyPXU09MHf0sQOMw0xMzptL/19K/nBS/D4vJF5btR6A=;
 b=KnACCnygUpXF0rrnrs2KrOfyE8uCTwJ94reU1/mqOO4bNBAdP0l4jU0H6ntAwfTA6g
 QTMsoiqx5Mklv6xFoQ5utmSGTU+diXvCH33xQMSQYxAu6TMeFZHLtqsmWJpcdSuydvAu
 FoxEloGyvcL56JXjj71/UnIrYivdB1BbS+6nxhsJz6pNL50xP6byzCn6lGKJUddCz9kK
 pz8w2ki1l9BSAWmNHQPp7VITizSyEhnvnHnHOkS1NTLr31D7af1ZqFUVoM9kC6Lcajjs
 tyjk1mNr6/FZMjoFPizQaYTyBwO0uYT2ZJ0vP1Xi3j+UpdrS+woPLEY5DYiGQOe9Myi/
 s00w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVirZCEYw4D0LWpEJhCo5/oeKIYh0+2Wz1Cvsw8GDimQz1NXclmLd/5+RIZc4+rFIUch86aV+lO6fQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVvKP3aK2HDttmfZ4FFIASCKigxYSUpG5afxZ3CBvhRtbxz4gf
 NDVfwq25rs6VMISNfrTvKabnb64/Eb6HaPxAO5IwVXICNQQKebpqysO3
X-Gm-Gg: ASbGncvr9loiNaznNx7xd3ivt6UR8IHd595SGB+0JRdIsno+CXWDzuye9V/HiJmLCTi
 /a7ZIBk9wtinNTgABTXgBkuABy3ySCyXZJEiqcIcSgohszfDiwbojuycXcvUxO76TM4KYQ/jx+p
 KfvaXKeuxOsPnHeG9sZmNzFoHK2ho5TWi0Riiv4UQg2cW37FlbmSFlV8o2WTjMjnM+cEhl+6nfD
 d/+94kyJ88x/N1P7wWsZ8+nJDRBTXHxIY9hEcMVGBcF1pxL+KnVhwcdQNhK99FbH0x+tRk5G0q3
 Sbd2jf/LsB8U9OgJOyMKFMoY3hO8nVq+/HQm+Wq+788WzKrOtGW+KNZBGR3m93lS0bLYgo7uxBU
 gnaRqToVZmmsPSqVMparlV+SD8f+XrVYxCjePZ/aXCBE7K32p6B4Dp546MKGU87xC4h2TegEEUn
 zrwcT7hk0RO4MnR3SFnGZOdA==
X-Google-Smtp-Source: AGHT+IGwF/OC+hr52+361MK7+mN4u8O29dW+FiL9JjV6JlzX+GGacshi6JqZmr/3Q1cXgUc/t7Hv0w==
X-Received: by 2002:a17:907:94ca:b0:b70:fede:1b58 with SMTP id
 a640c23a62f3a-b733195fe6dmr706242866b.2.1763045621257; 
 Thu, 13 Nov 2025 06:53:41 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 08/18] drm/sched: use inline locks for the drm-sched-fence
Date: Thu, 13 Nov 2025 15:51:45 +0100
Message-ID: <20251113145332.16805-9-christian.koenig@amd.com>
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

