Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0616C634B8C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 01:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC81410E1E0;
	Wed, 23 Nov 2022 00:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F6910E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 00:14:15 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F6476602A9F;
 Wed, 23 Nov 2022 00:14:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669162453;
 bh=CjfoupBANitx/AKoGxyh1s9D/gZeN1CU4qbRETlE+4k=;
 h=From:To:Cc:Subject:Date:From;
 b=bhGlGP4QmVJocJpVlT6d0e2EYlzQqO/gsofScbdgqWtPDF2iNG4Uixj2pqveUT30I
 JzwkZS6f/BDgfPUpCTh7G/MuMvUwjkZOyjmBgCl3sn1vlM3xc7MkvHB1SgPB4AFXNU
 4h4Zl3+2BsaLdnxuG3UGBiFcm0Czjd2DIyeSqLCQz1BrQYQ3+IwxtSz4fT3WD2Jqi5
 VdaEhEEZz16wMZkkuiNySwo9KmSByjNzSg8DyJJZpLBXwY1UEO+UDDMAPcLKydSqxa
 vjGNj9lkh5YdzNydlQloq5Ti3ho3Kh5uqh3hU/vEauyhDm5wGYEAIxgKnoVe6HSyv5
 VEGTqZnRH7Kkg==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1] drm/scheduler: Fix lockup in drm_sched_entity_kill()
Date: Wed, 23 Nov 2022 03:13:03 +0300
Message-Id: <20221123001303.533968-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_sched_entity_kill() is invoked twice by drm_sched_entity_destroy()
while userspace process is exiting or being killed. First time it's invoked
when sched entity is flushed and second time when entity is released. This
causes a lockup within wait_for_completion(entity_idle) due to how completion
API works.

Calling wait_for_completion() more times than complete() was invoked is a
error condition that causes lockup because completion internally uses
counter for complete/wait calls. The complete_all() must be used instead
in such cases.

This patch fixes lockup of Panfrost driver that is reproducible by killing
any application in a middle of 3d drawing operation.

Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index fe09e5be79bd..15d04a0ec623 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -81,7 +81,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	init_completion(&entity->entity_idle);
 
 	/* We start in an idle state. */
-	complete(&entity->entity_idle);
+	complete_all(&entity->entity_idle);
 
 	spin_lock_init(&entity->rq_lock);
 	spsc_queue_init(&entity->job_queue);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6ce04c2e90c0..857ec20be9e8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1026,7 +1026,7 @@ static int drm_sched_main(void *param)
 		sched_job = drm_sched_entity_pop_job(entity);
 
 		if (!sched_job) {
-			complete(&entity->entity_idle);
+			complete_all(&entity->entity_idle);
 			continue;
 		}
 
@@ -1037,7 +1037,7 @@ static int drm_sched_main(void *param)
 
 		trace_drm_run_job(sched_job, entity);
 		fence = sched->ops->run_job(sched_job);
-		complete(&entity->entity_idle);
+		complete_all(&entity->entity_idle);
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-- 
2.38.1

