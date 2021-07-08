Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B73C1B43
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 23:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DB66E8FF;
	Thu,  8 Jul 2021 21:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478BF6E90C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 21:54:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i20so12291161ejw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1w93YeUX+1iq+sUD/eLjhVo09cAXuAFNyzb5+/PtX8=;
 b=AOaW9lRzd+A1i5+zCfXF2et/fkCG3+e1jzD9l6EGMpAMRCbDI2g8RtEEeELlakqjrQ
 FfjquAzlGIGCyPWOsaRi8yGmEtOWzfK9bXPwnT7LhcoiZ8ELHJPTBTdO5IfQv/Af1YN9
 UwQw9QVw5gOxh+dhd9y8DgPwAXAGq6nP32IYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1w93YeUX+1iq+sUD/eLjhVo09cAXuAFNyzb5+/PtX8=;
 b=D0H/CFUxaaCbxlzVy/aTzT7BCJbqAI6lWOST9KWaUS+g+GmY8iOQSfVnm+ETh9wxZV
 g6DxzBESE2Skr/mhuTiJh8enkQY2hj64nUtnfU7ndrsmS9IcC3IHyqzgI4b00yiEXmQE
 DfnMv02p8C+crnjm8fWsnF3Y4scTq4uIJScjWF7VucDo/OshDdz5OLPJPJnZzAaGcxja
 oHNqNfSUa1pxZCxbDUDtqleAjLDIFe3iUE96whGfsWAd7R9RirZXI5nkObW0iDo4tSkE
 thMrBT89dN6WK6eUVfoziMu3Fv+TRABMAxr+vyaKng1gw4D7nKSgEWpmCs6PJIJ23fDa
 LdfQ==
X-Gm-Message-State: AOAM531eFDAG216pn37thX5YkPQ2XIiaBkmzf70X8DBEl6KgPWvgjO4t
 6x28q9g+OKAU2qg4WxebAeunlC6HoOUVRA==
X-Google-Smtp-Source: ABdhPJytUe48vXWCnbKLcG9uXFEIys7ziaSlLcRL//xsMtv0kdYbzJ/NtS4SJACwnSrbDNJz2/+qSg==
X-Received: by 2002:a17:906:3919:: with SMTP id
 f25mr12129311eje.190.1625781284650; 
 Thu, 08 Jul 2021 14:54:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s26sm421243ejv.87.2021.07.08.14.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:54:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/sched: Barriers are needed for entity->last_scheduled
Date: Thu,  8 Jul 2021 23:54:39 +0200
Message-Id: <20210708215439.4093557-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
References: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
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

v2: Put smp_rmp() in the right place and fix up comment (Andrey)

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
index 64d398166644..6366006c0fcf 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
 
 	dma_fence_put(entity->last_scheduled);
+
 	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
 
+	/*
+	 * If the queue is empty we allow drm_sched_entity_select_rq() to
+	 * locklessly access ->last_scheduled. This only works if we set the
+	 * pointer before we dequeue and if we a write barrier here.
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
+	/*
+	 * Only when the queue is empty are we guaranteed that the scheduler
+	 * thread cannot change ->last_scheduled. To enforce ordering we need
+	 * a read barrier here. See drm_sched_entity_pop_job() for the other
+	 * side.
+	 */
+	smp_rmb();
+
+	fence = entity->last_scheduled;
+
+	/* stay on the same engine if the previous job hasn't finished */
 	if (fence && !dma_fence_is_signaled(fence))
 		return;
 
-- 
2.32.0

