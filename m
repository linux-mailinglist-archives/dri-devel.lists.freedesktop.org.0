Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F24403C6472
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 22:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9839D89DBC;
	Mon, 12 Jul 2021 20:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424DF89DB2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 20:02:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so20148wmi.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSY9W1VxCdMpypdkbaup7CixlFsk0s/gKk3ObtLJVLg=;
 b=XrD3D9ja9dBSoDlgsVH+He3M/Qnc0g7g5V9iYxxuxX6OVy1Ym1kO5KoUk40/N1BN73
 23PWAIQLn4cpJJ9jvhn+wPxhgbHvmtvGhRn+nF/fMXvrF3HJu8+SgkN0eEO0TGvc3Qz4
 UUPaQKOpnGzWXy5tRBYl/sEyZTfWKZTVZ3wVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSY9W1VxCdMpypdkbaup7CixlFsk0s/gKk3ObtLJVLg=;
 b=VABP7sSCuPbuuLZlh+efCYCe+FJTUjyoP70XFFGVDrmowzE0+SeCGd7KC5K1FtpZTG
 Ia9FID6zRdLiTTbwAFL6Cl6FAgLTjT7U/nlswcEnVfgZdNwfRcttLLfzIdnzV+4NtESC
 xKbOc0RO4s/JKNDLAmrROB3Rg8703PGRQddYoyxBcazvrSIPSFVhCfiYDDMe2PORXe1m
 JVxa/xZU570mVCjopcr3LSFEmFGB1Ib2P06KUOtW/mmsRE/2+pMtVDNqKnNtB+GWRKfl
 gwAhjTIfT03EA+iCKLY/YVt/uM8r84MeWtJn14ljWnU9zApoQoReNHXVSdEn2we0SUBU
 dx1A==
X-Gm-Message-State: AOAM5322PYM+FcxL3shesbimSjh0GHUE5697eDOOEDfRIKGyoIdmYO5U
 x/sHr+sQruPgbd9fQmRb4Y6Pc/78sHof4w==
X-Google-Smtp-Source: ABdhPJxjeXPggqYsDGc4BnsH9bBPwkFEgfpctPnYSmhVAPacjN8G/a6BByHv1WYSDK7vT2aFCPkqAA==
X-Received: by 2002:a1c:9dd6:: with SMTP id g205mr959206wme.82.1626120119757; 
 Mon, 12 Jul 2021 13:01:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:01:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
Date: Mon, 12 Jul 2021 19:53:36 +0200
Message-Id: <20210712175352.802687-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
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
index f7347c284886..89e3f6eaf519 100644
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

