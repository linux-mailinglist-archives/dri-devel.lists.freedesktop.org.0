Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB68B8A9FF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 18:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA6810EA51;
	Fri, 19 Sep 2025 16:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="dJ8WGonn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BAB10EA51
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 16:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1758300298; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HQZjaYV32yBRAhVULxJX2VoCyAQF0YmxGq9Iz+VpE5PUHBwY+jhERUiEZkUoju3nwmeuGcVOzP/3tY6O9NNSQ8BG6eehlq81P7b+7Ga4VyfF8viMqlUsmQvzr2UObQ0lo1wsye7GHOi5SxHpnopl0bQTmqZ5laPtUhTq+p3WOi8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1758300298;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=rkbul+5GmuUcM0b/MWyFiAkpc0VDM1F5kI2ZnfPs5a8=; 
 b=lj7ACw438mqV9CQe8+DsiAN171JgVIz/OLTnJ0tpO5tKCkRnEvLtcRNOjV4oqc41WGA1kBJ8T3GAigV3aHvpr6BHrubCasYmLMgpPco7mEphUdzoOUBc2uH6yJqv3P31u/Wz8RibSyMLm2rzeFBQhxpg3VBBYwPio7+RsBOpce4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758300298; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=rkbul+5GmuUcM0b/MWyFiAkpc0VDM1F5kI2ZnfPs5a8=;
 b=dJ8WGonnv4HMqDd2D3N1MShnahK34JQ4+CVLVM1yRp7UXEhSxug61YtnhkULyfTN
 goXJm/Jf7YpkYYgEhB6fH3Sl80PVcXOzQmCExLkmqDQ9kZRkPB0j6cLFB2C2jFFzfI7
 25k7PBhltZ31xc2iL1ggPJrqC3Vp6NEHA74wiLn8=
Received: by mx.zohomail.com with SMTPS id 1758300297314473.47222430101465;
 Fri, 19 Sep 2025 09:44:57 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/panthor: Defer scheduler entitiy destruction to queue
 release
Date: Fri, 19 Sep 2025 17:43:48 +0100
Message-ID: <20250919164436.531930-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
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

Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
handled destruction of a group's queues' drm scheduler entities early
into the group destruction procedure.

However, that races with the group submit ioctl, because by the time
entities are destroyed (through the group destroy ioctl), the submission
procedure might've already obtained a group handle, and therefore the
ability to push jobs into entities. This is met with a DRM error message
within the drm scheduler core as a situation that should never occur.

Fix by deferring drm scheduler entity destruction to queue release time.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee5..f5e01cb16cfc 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -898,8 +898,7 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (IS_ERR_OR_NULL(queue))
 		return;
 
-	if (queue->entity.fence_context)
-		drm_sched_entity_destroy(&queue->entity);
+	drm_sched_entity_destroy(&queue->entity);
 
 	if (queue->scheduler.ops)
 		drm_sched_fini(&queue->scheduler);
@@ -3609,11 +3608,6 @@ int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
 	if (!group)
 		return -EINVAL;
 
-	for (u32 i = 0; i < group->queue_count; i++) {
-		if (group->queues[i])
-			drm_sched_entity_destroy(&group->queues[i]->entity);
-	}
-
 	mutex_lock(&sched->reset.lock);
 	mutex_lock(&sched->lock);
 	group->destroyed = true;
-- 
2.51.0

