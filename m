Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CB23C184F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 19:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF906E94C;
	Thu,  8 Jul 2021 17:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DFA6E94C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 17:38:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i8so8486447wrp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4V6pxp76MaEudx/IEK54W+rky4iXy/miG07jgmRH7DY=;
 b=BrRyknKgZV88ecMd94XiTUvwrdcF0uLLV6KBOjYoFXh1VuGj/8QahnhkFG4boL11gc
 GbkImyM9EaNR/hFZVGGQMl4i8i9ZpHHQE92NlVugO0ICg1P/HA3rEOAIq3bIO1y0+Gv+
 2TrCxbD4EOn129DwOalT6Q4Z6kfQ1/gn4e+8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4V6pxp76MaEudx/IEK54W+rky4iXy/miG07jgmRH7DY=;
 b=jbffVzZfH4/wVwTOi4JX3LjbObP4+/pK4Rn30I12DXn2vSK4adZkbqTUFSIKNb2xpG
 USvc033ddIftmlrDEwU5FOVKYfaA7Sg2znm2vVNZYHRsNLdp1vE5CmE3+BDf1fvg08+t
 9gLCbKH9+k4QkkExqvI4/g+lrgZxdskmHFZ/07H7VP//hSlf85p444uMcfBpQQAPM72n
 2o4FZAUy0STpDz4Czyi4QhKxGH3lRHkd3gi+sDsSJSE6EQw2YSimI0Y3hEeajmUe4LY4
 2Y215V8ITGq59cNThNnpIfwiOqAfx7p0RDogwZveg/QfSIT8ADJblwo2ZJV8Cm2HP1s5
 85uA==
X-Gm-Message-State: AOAM530PUmmQvfxPFt5mhSlZaiYV1jRuvyohrx/pbT/x3NVlVU8FXI4V
 PjFMR4qaKrmCc+08iSYChHTySSgkb7W2Jg==
X-Google-Smtp-Source: ABdhPJxHYVh0KxReMYig08Pr0SYBUWnkEnvrgb57hPZUNr7/myKklgUeEQiVEXOTmXmKCBxKM8EriQ==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr35294595wrw.96.1625765889739; 
 Thu, 08 Jul 2021 10:38:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l4sm2521853wme.26.2021.07.08.10.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:38:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 03/20] drm/sched: Barriers are needed for
 entity->last_scheduled
Date: Thu,  8 Jul 2021 19:37:37 +0200
Message-Id: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It might be good enough on x86 with just READ_ONCE, but the write side
should then at least be WRITE_ONCE because x86 has total store order.

It's definitely not enough on arm.

Fix this proplery, which means
- explain the need for the barrier in both places
- point at the other side in each comment

Also pull out the !sched_list case as the first check, so that the
code flow is clearer.

While at it sprinkle some comments around because it was very
non-obvious to me what's actually going on here and why.

Note that we really need full barriers here, at first I thought
store-release and load-acquire on ->last_scheduled would be enough,
but we actually requiring ordering between that and the queue state.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 64d398166644..4e1124ed80e0 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
 	dma_fence_put(entity->last_scheduled);
+
 	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
 
+	/*
+	 * if the queue is empty we allow drm_sched_job_arm() to locklessly
+	 * access ->last_scheduled. This only works if we set the pointer before
+	 * we dequeue and if we a write barrier here.
+	 */
+	smp_wmb();
+
 	spsc_queue_pop(&entity->job_queue);
 	return sched_job;
 }
@@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
-	if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
+	/* single possible engine and already selected */
+	if (!entity->sched_list)
+		return;
+
+	/* queue non-empty, stay on the same engine */
+	if (spsc_queue_count(&entity->job_queue))
 		return;
 
-	fence = READ_ONCE(entity->last_scheduled);
+	fence = entity->last_scheduled;
+
+	/*
+	 * Only when the queue is empty are we guaranteed the the scheduler
+	 * thread cannot change ->last_scheduled. To enforce ordering we need
+	 * a read barrier here. See drm_sched_entity_pop_job() for the other
+	 * side.
+	 */
+	smp_rmb();
+
+	/* stay on the same engine if the previous job hasn't finished */
 	if (fence && !dma_fence_is_signaled(fence))
 		return;
 
-- 
2.32.0

