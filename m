Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 780393E1307
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7686E80B;
	Thu,  5 Aug 2021 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F224C89C96
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:47:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id e19so8783856ejs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vk90JgGb8fo71IctIWrWmaKFEp9mmVzEBcxFqwXTPis=;
 b=R8ENjC6zpXH4/pdpJHVYfz/G4epLWVKHywZeba8tr+KA25Zq7uDTHviqCX3yC2uxf/
 cN0pAm7nPlidmEull30353JwccsQjPYtuSsJikQuCGgJERCbH1BB9ovQDtQoeaX6KN5r
 mQB2uaDm4VWEz2Pfpk63aVeH+VX4MCpGS8sDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vk90JgGb8fo71IctIWrWmaKFEp9mmVzEBcxFqwXTPis=;
 b=n6SW1ns9Pkr7hHbhN/F/9h4XEPleHOt4/V1fl68IYtqlaeGk+DPsbndYk1+49fHbIa
 tOSvr/dtRN+w3WaHtfv6jhp05H2KBZ8FZHqqmcG5ELvto6kpxs+kjWhlwPusrrmTTGSr
 oJupsJSRh0j94ZGyYSdFbepkWcgs0++fTSpPc0iM9Z/2VwoIsMCiPA3riqv/qaMXthc7
 I28YzWRUJsUJpn30WVgCQdSzi3MJSFkgg5I462I1pPKI6bCm/Y03Pqqzyh00Mzo5YsCR
 gF8A/FebicvE7qx1t6yUb/9gmK5RE4thStN6wtFDjBd+hgNmguQ+C1qIoP+vIm1+zxQz
 AuEQ==
X-Gm-Message-State: AOAM5311uxDfi6qbPbMLTTbfzqhhkcEwgqMDgcxytLipGzul8xaofmno
 SnD+BLHLpIcd/qk9bVi1Kxc+Af/F0FcEFg==
X-Google-Smtp-Source: ABdhPJzQWlIJuekxnGW62C6E14BFG9DW8nzQUwW80y3fLAi9LCxvroE4ZSxyI8gjBo6fkzqzjpAegg==
X-Received: by 2002:a17:906:b794:: with SMTP id
 dt20mr4027358ejb.363.1628160433446; 
 Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p5sm1578809ejl.73.2021.08.05.03.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:47:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 03/20] drm/sched: Barriers are needed for
 entity->last_scheduled
Date: Thu,  5 Aug 2021 12:46:48 +0200
Message-Id: <20210805104705.862416-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
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

Acked-by: Melissa Wen <mwen@igalia.com>
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

