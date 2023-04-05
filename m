Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB66D83D2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BC710EA13;
	Wed,  5 Apr 2023 16:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9A10EA13
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DF52541F7F;
 Wed,  5 Apr 2023 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1680712669;
 bh=sTrFnCJhBZN7oYDaKAxjFUzN6p2aBL4GuRgTde2utLA=;
 h=From:Date:Subject:To:Cc;
 b=K9G7MJzLSnQvQdH338vkTkWCLk/wuK+dbCnW6BiykK1txyyK5y49heffh9Jy/ORMy
 ItfAF2UNyA/hadH73iE5JxMzzV63FPIeo+cOvW0TQFYhbMbtdsfeeYHwiwaBx6LoH2
 0MU4CDaO6Wz0wV6EH6bKRrjacw5By/XWK1MuBVS6sXocUdWSzpUi2peUiPC7ly5qd6
 uLcKyxO0+aeAKCaGzlvoTFkn/dfHLMpCfKPrWQ7YfhsO9OeEANVIQsREQg1pqY/TOR
 zN8QDe7quVjG7m7CoBTJ7ofkkW9WBlkZLSCOKpK8MD0KXPP37aM9hBDCaXn5uhgzXZ
 kZuTTeTPISmGA==
From: Asahi Lina <lina@asahilina.net>
Date: Thu, 06 Apr 2023 01:37:39 +0900
Subject: [PATCH] drm/scheduler: Fix UAF race in drm_sched_entity_push_job()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230406-scheduler-uaf-2-v1-1-972531cf0a81@asahilina.net>
X-B4-Tracking: v=1; b=H4sIANKjLWQC/x2N0QrCMAxFf2Xk2UjX1SH+iviQtakNSJWEDWHs3
 219POdyuDsYq7DBbdhBeROTd20wngaIheqTUVJj8M5PLrgZLRZO64sVV8roMYSYr5k4+XCBVi1
 kjItSjaV323yeUOOI3ff9o5zl+3+8P47jB294TdCBAAAA
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680712667; l=1875;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=sTrFnCJhBZN7oYDaKAxjFUzN6p2aBL4GuRgTde2utLA=;
 b=5gNq7s+ZmeJPRhxbAegKKsazjg3FHd+yC9o0mB8mFPifI+IwCjdiBXH8s5F46HIaJ5/Abi83s
 w0mJnLrKf5YBO3ujbqgVFlDaQlZ9eA0oCS9LBP5n5tFbCpZij99Sgfl
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After a job is pushed into the queue, it is owned by the scheduler core
and may be freed at any time, so we can't write nor read the submit
timestamp after that point.

Fixes oopses observed with the drm/asahi driver, found with kASAN.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 15d04a0ec623..e0a8890a62e2 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -507,12 +507,19 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
+	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
+
+	/*
+	 * After the sched_job is pushed into the entity queue, it may be
+	 * completed and freed up at any time. We can no longer access it.
+	 * Make sure to set the submit_ts first, to avoid a race.
+	 */
+	sched_job->submit_ts = submit_ts = ktime_get();
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
-	sched_job->submit_ts = ktime_get();
 
 	/* first job wakes up scheduler */
 	if (first) {
@@ -529,7 +536,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		spin_unlock(&entity->rq_lock);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
+			drm_sched_rq_update_fifo(entity, submit_ts);
 
 		drm_sched_wakeup(entity->rq->sched);
 	}

---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230406-scheduler-uaf-2-44cf8faed245

Thank you,
~~ Lina

