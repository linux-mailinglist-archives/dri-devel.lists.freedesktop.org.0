Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC64C9B9E0
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901A10E647;
	Tue,  2 Dec 2025 13:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YssGDPTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001F10E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764682566;
 bh=OaYI6ngV1bKSwKm+Y+YSLmbWulc5zVlwmX1TskUyzmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YssGDPTb59r/9BV0/J6iQiax51XKQKg2Chx/Fh5K19Y7lIJQboKBUH6G+fPnj+4Hx
 Oq26L86TAmvUZzCtSIUlDvj2t4ywJHr5zWb3r45OqIXWLjHpV3NlbBxpiLAbn8Gq6A
 eGe2JYOYiYOpyJ8rmj9q7icZx37Kw8ze13p/JaTcaC6VQ0kYwG9RhZi2AuFltH7vxn
 aItiepZANwzb4oXup+b+mNc9Em1zhUyN6MacVj3Suap/tGHumNf+XGCrY8ype9yRmT
 sSN5Po5P2CpjfmDExQmj99y+/slyUUGRE5RGJPXmSLWRIGDwZb9QEoiVYncOJ1etyl
 SHET9jAfIqKVA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 31BA617E1341;
 Tue,  2 Dec 2025 14:36:06 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 1/3] drm/panthor: Drop a WARN_ON() in group_free_queue()
Date: Tue,  2 Dec 2025 14:35:36 +0100
Message-ID: <20251202133538.83078-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251202133538.83078-1-boris.brezillon@collabora.com>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It appears the timeout can still be enabled when we reach that point,
because of the asynchronous progress check done on queues that resets
the timer when jobs are still in-flight, but progress was made.
We could add more checks to make sure the timer is not re-enabled when
a group can't run anymore, but we don't have a group to pass to
queue_check_job_completion() in some context.

It's just as safe (we just want to be sure the timer is stopped before
we destroy the queue) and simpler to drop the WARN_ON() in
group_free_queue().

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 389d508b3848..203f6a0a6b9a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -893,9 +893,8 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
-	/* This should have been disabled before that point. */
-	drm_WARN_ON(&group->ptdev->base,
-		    disable_delayed_work_sync(&queue->timeout.work));
+	/* Disable the timeout before tearing down drm_sched components. */
+	disable_delayed_work_sync(&queue->timeout.work);
 
 	if (queue->entity.fence_context)
 		drm_sched_entity_destroy(&queue->entity);
-- 
2.51.1

