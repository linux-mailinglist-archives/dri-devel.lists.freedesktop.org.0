Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F67C91831
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9F810E894;
	Fri, 28 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pDrePmfI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878610E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323332;
 bh=FQDmIpg4C+N0NG44N/WCue/wwDlw3LfTpVE/D2E2wU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pDrePmfIprL2xRIpYh96MpjRVX/lWtrknwSQesY7cXzDAMQNJSE0vKHOIibG3fV9E
 Cl35NhI3o8cIdu4PXNOA5ETDJh+ldvAx5cVSpxPIJSz/NQSCrrj38PsKT6BTLiALoO
 jq7QHYAk0EFkxu+4E4ISo+Mv92vkCGZ6KhRraYuihprHiaEDVNB36VC/48fW85N14u
 ed5NtSY4frS2YttFJxZNlxe3UJ6G892/rsV7Kls50LY1OVC1wY2l1PEYA9JaflvOGX
 B/xizX6nluOkI1rUDwR7lSQMX8mKBzY7wOnlI9fjkBibDTTxY5vzNJao5mRRMdGitH
 IHLvEShct0c0w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 277D117E13D5;
 Fri, 28 Nov 2025 10:48:52 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 4/8] drm/panthor: Fix the group priority rotation logic
Date: Fri, 28 Nov 2025 10:48:35 +0100
Message-ID: <20251128094839.3856402-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128094839.3856402-1-boris.brezillon@collabora.com>
References: <20251128094839.3856402-1-boris.brezillon@collabora.com>
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

When rotating group priorities, we want the group with the
highest priority to go back to the end of the queue, and all
other active groups to get their priority bumped, otherwise
some groups will never get a chance to run with the highest
priority. This implies moving the rotation itself to
tick_work(), and only dealing with old group ordering in
tick_ctx_insert_old_group().

v2:
- Add R-b
- Fix the commit message

v3:
- Drop the full_tick argument in tick_ctx_init()
- Collect R-b

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 52 +++++++++++++++----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5d280d9c8225..531b52ee3a92 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2050,31 +2050,22 @@ tick_ctx_pick_groups_from_list(const struct panthor_scheduler *sched,
 static void
 tick_ctx_insert_old_group(struct panthor_scheduler *sched,
 			  struct panthor_sched_tick_ctx *ctx,
-			  struct panthor_group *group,
-			  bool full_tick)
+			  struct panthor_group *group)
 {
 	struct panthor_csg_slot *csg_slot = &sched->csg_slots[group->csg_id];
 	struct panthor_group *other_group;
 
-	if (!full_tick) {
-		list_add_tail(&group->run_node, &ctx->old_groups[group->priority]);
-		return;
-	}
-
-	/* Rotate to make sure groups with lower CSG slot
-	 * priorities have a chance to get a higher CSG slot
-	 * priority next time they get picked. This priority
-	 * has an impact on resource request ordering, so it's
-	 * important to make sure we don't let one group starve
-	 * all other groups with the same group priority.
-	 */
+	/* Class groups in descending priority order so we can easily rotate. */
 	list_for_each_entry(other_group,
 			    &ctx->old_groups[csg_slot->group->priority],
 			    run_node) {
 		struct panthor_csg_slot *other_csg_slot = &sched->csg_slots[other_group->csg_id];
 
-		if (other_csg_slot->priority > csg_slot->priority) {
-			list_add_tail(&csg_slot->group->run_node, &other_group->run_node);
+		/* Our group has a higher prio than the one we're testing against,
+		 * place it just before.
+		 */
+		if (csg_slot->priority > other_csg_slot->priority) {
+			list_add_tail(&group->run_node, &other_group->run_node);
 			return;
 		}
 	}
@@ -2084,8 +2075,7 @@ tick_ctx_insert_old_group(struct panthor_scheduler *sched,
 
 static void
 tick_ctx_init(struct panthor_scheduler *sched,
-	      struct panthor_sched_tick_ctx *ctx,
-	      bool full_tick)
+	      struct panthor_sched_tick_ctx *ctx)
 {
 	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
@@ -2123,7 +2113,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
 				group->fatal_queues |= GENMASK(group->queue_count - 1, 0);
 		}
 
-		tick_ctx_insert_old_group(sched, ctx, group, full_tick);
+		tick_ctx_insert_old_group(sched, ctx, group);
 		csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, i,
 					csg_iface->output->ack ^ CSG_STATUS_UPDATE,
 					CSG_STATUS_UPDATE);
@@ -2466,7 +2456,7 @@ static void tick_work(struct work_struct *work)
 	if (panthor_device_reset_is_pending(sched->ptdev))
 		goto out_unlock;
 
-	tick_ctx_init(sched, &ctx, full_tick);
+	tick_ctx_init(sched, &ctx);
 	if (ctx.csg_upd_failed_mask)
 		goto out_cleanup_ctx;
 
@@ -2492,9 +2482,29 @@ static void tick_work(struct work_struct *work)
 	for (prio = PANTHOR_CSG_PRIORITY_COUNT - 1;
 	     prio >= 0 && !tick_ctx_is_full(sched, &ctx);
 	     prio--) {
+		struct panthor_group *old_highest_prio_group =
+			list_first_entry_or_null(&ctx.old_groups[prio],
+						 struct panthor_group, run_node);
+
+		/* Pull out the group with the highest prio for rotation. */
+		if (old_highest_prio_group)
+			list_del(&old_highest_prio_group->run_node);
+
+		/* Re-insert old active groups so they get a chance to run with higher prio. */
+		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], true, true);
+
+		/* Fill the remaining slots with runnable groups. */
 		tick_ctx_pick_groups_from_list(sched, &ctx, &sched->groups.runnable[prio],
 					       true, false);
-		tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio], true, true);
+
+		/* Re-insert the old group with the highest prio, and give it a chance to be
+		 * scheduled again (but with a lower prio) if there's room left.
+		 */
+		if (old_highest_prio_group) {
+			list_add_tail(&old_highest_prio_group->run_node, &ctx.old_groups[prio]);
+			tick_ctx_pick_groups_from_list(sched, &ctx, &ctx.old_groups[prio],
+						       true, true);
+		}
 	}
 
 	/* If we have free CSG slots left, pick idle groups */
-- 
2.51.1

