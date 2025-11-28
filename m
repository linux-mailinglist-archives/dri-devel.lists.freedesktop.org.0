Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E51C91828
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231B510E83F;
	Fri, 28 Nov 2025 09:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LqB48QNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D075910E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323333;
 bh=oqsi2tDq8SRZw32qQ9tcdFjCtzNT9meJlsw62t4XsD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LqB48QNhuvp+G5w7eVZ2iriYFBW4YIbsQnXeD3OehlEEsIbXRYVJMkfrA2v1yV32I
 Ffg/EFv6+5J/GFWdfilaWOX3IWjAgCv4cZVXudUeQOTAvhdWx58Ov6obzpJ5Fivagw
 Fn6XbCoU2tHXWYPztQ28GAzH1kXRMSoS87Ib/72AJEHE/WXz/iFXe4pr/1XJsMxuaP
 AU7maH4i/FbPNDme3PegDkCYpCqLx+KBGIGvpG7eu66P1VAGVMe52ThSxSyUw7gNHf
 jj6dtOcSb409IL8OLv0zkBOa9jb2WnVJve9fsyktQVftsXnFwqEi5Ds7wNoSHAht6G
 nYMMmASTkPi6Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 25AAE17E0ED5;
 Fri, 28 Nov 2025 10:48:53 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 6/8] drm/panthor: Fix the logic that decides when to stop
 ticking
Date: Fri, 28 Nov 2025 10:48:37 +0100
Message-ID: <20251128094839.3856402-7-boris.brezillon@collabora.com>
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

When we have multiple active groups with the same priority, we need to
keep ticking for the priority rotation to take place. If we don't do
that, we might starve slots with lower priorities.

It's annoying to deal with that in tick_ctx_update_resched_target(),
so let's add a ::stop_tick field to the tick context which is
initialized to true, and downgraded to false as soon as we detect
something that requires to tick to happen. This way we can complement
the current logic with extra conditions if needed.

v2:
- Add R-b

v3:
- Drop panthor_sched_tick_ctx::min_priority (no longer relevant)
- Collect R-b

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 46 ++++++++++---------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 1efeabc4b0ac..8846608dd127 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1985,10 +1985,10 @@ struct panthor_sched_tick_ctx {
 	struct list_head groups[PANTHOR_CSG_PRIORITY_COUNT];
 	u32 idle_group_count;
 	u32 group_count;
-	enum panthor_csg_priority min_priority;
 	struct panthor_vm *vms[MAX_CS_PER_CSG];
 	u32 as_count;
 	bool immediate_tick;
+	bool stop_tick;
 	u32 csg_upd_failed_mask;
 };
 
@@ -2031,17 +2031,21 @@ tick_ctx_pick_groups_from_list(const struct panthor_scheduler *sched,
 		if (!owned_by_tick_ctx)
 			group_get(group);
 
-		list_move_tail(&group->run_node, &ctx->groups[group->priority]);
 		ctx->group_count++;
+
+		/* If we have more than one active group with the same priority,
+		 * we need to keep ticking to rotate the CSG priority.
+		 */
 		if (group_is_idle(group))
 			ctx->idle_group_count++;
+		else if (!list_empty(&ctx->groups[group->priority]))
+			ctx->stop_tick = false;
+
+		list_move_tail(&group->run_node, &ctx->groups[group->priority]);
 
 		if (i == ctx->as_count)
 			ctx->vms[ctx->as_count++] = group->vm;
 
-		if (ctx->min_priority > group->priority)
-			ctx->min_priority = group->priority;
-
 		if (tick_ctx_is_full(sched, ctx))
 			return;
 	}
@@ -2085,7 +2089,7 @@ tick_ctx_init(struct panthor_scheduler *sched,
 	memset(ctx, 0, sizeof(*ctx));
 	csgs_upd_ctx_init(&upd_ctx);
 
-	ctx->min_priority = PANTHOR_CSG_PRIORITY_COUNT;
+	ctx->stop_tick = true;
 	for (i = 0; i < ARRAY_SIZE(ctx->groups); i++) {
 		INIT_LIST_HEAD(&ctx->groups[i]);
 		INIT_LIST_HEAD(&ctx->old_groups[i]);
@@ -2397,32 +2401,18 @@ static u64
 tick_ctx_update_resched_target(struct panthor_scheduler *sched,
 			       const struct panthor_sched_tick_ctx *ctx)
 {
-	/* We had space left, no need to reschedule until some external event happens. */
-	if (!tick_ctx_is_full(sched, ctx))
+	u64 resched_target;
+
+	if (ctx->stop_tick)
 		goto no_tick;
 
-	/* If idle groups were scheduled, no need to wake up until some external
-	 * event happens (group unblocked, new job submitted, ...).
-	 */
-	if (ctx->idle_group_count)
-		goto no_tick;
+	resched_target = sched->last_tick + sched->tick_period;
 
-	if (drm_WARN_ON(&sched->ptdev->base, ctx->min_priority >= PANTHOR_CSG_PRIORITY_COUNT))
-		goto no_tick;
+	if (time_before64(sched->resched_target, sched->last_tick) ||
+	    time_before64(resched_target, sched->resched_target))
+		sched->resched_target = resched_target;
 
-	/* If there are groups of the same priority waiting, we need to
-	 * keep the scheduler ticking, otherwise, we'll just wait for
-	 * new groups with higher priority to be queued.
-	 */
-	if (!list_empty(&sched->groups.runnable[ctx->min_priority])) {
-		u64 resched_target = sched->last_tick + sched->tick_period;
-
-		if (time_before64(sched->resched_target, sched->last_tick) ||
-		    time_before64(resched_target, sched->resched_target))
-			sched->resched_target = resched_target;
-
-		return sched->resched_target - sched->last_tick;
-	}
+	return sched->resched_target - sched->last_tick;
 
 no_tick:
 	sched->resched_target = U64_MAX;
-- 
2.51.1

