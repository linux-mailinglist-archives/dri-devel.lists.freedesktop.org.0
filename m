Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C93222800F8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 16:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972856E8A4;
	Thu,  1 Oct 2020 14:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51246E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 14:13:06 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 67D1E29CD83;
 Thu,  1 Oct 2020 15:13:04 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sched: Avoid infinite waits in the
 drm_sched_entity_destroy() path
Date: Thu,  1 Oct 2020 16:12:53 +0200
Message-Id: <20201001141253.1066836-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Herring <robh+dt@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we don't initialize the entity to idle and the entity is never
scheduled before being destroyed we end up with an infinite wait in the
destroy path.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
This is something I noticed while debugging another issue on panfrost
causing the scheduler to be in a weird state where new entities were no
longer scheduled. This was causing all userspace threads trying to close
their DRM fd to be blocked in kernel space waiting for this "entity is
idle" event. I don't know if that fix is legitimate (now that we fixed
the other bug we don't seem to end up in that state anymore), but I
thought I'd share it anyway.
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 146380118962..f8ec277a6aa8 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -73,6 +73,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 
 	init_completion(&entity->entity_idle);
 
+	/* We start in an idle state. */
+	complete(&entity->entity_idle);
+
 	spin_lock_init(&entity->rq_lock);
 	spsc_queue_init(&entity->job_queue);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
