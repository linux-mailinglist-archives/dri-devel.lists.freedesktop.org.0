Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A024998A967
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ECD10E543;
	Mon, 30 Sep 2024 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b5jH0pak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CE210E543
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727712663;
 bh=36dE3cHFf97hG8KO7zo4QUgSXF6V47Q/7KbXwXQaiws=;
 h=From:To:Cc:Subject:Date:From;
 b=b5jH0pakykKnst5TC4qxF0CdB7GkSmGA6Gwx62C2EfA/KkFTP19MOpvG8OLquEg1r
 gC8nShMIBk180Xe5OwdBqKZPt6Ynqdpyn5iD/g1uETLmOhVEc2CR8tBgWUIdD6cygF
 v6jhKAJ5eadQNZLAlvSbvkKCEdmlOh5zfxHYfdcxpMTmIIgLnbwawsT+nliXySbmSs
 fsOUFF9fCqslCLrSLk9fV4pi8x1fO5jRDiRk8qTs7PG3fz68LgjUu6OInvTvXfN2N4
 mSiEkSsc2JDbQmkMA6fr0GLyEtn6cr/hKGApo6QzXvTLnSjFGdpOBlF+Y4Isc6sRNP
 ZzUR/IpBFRVLg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 221D717E3609;
 Mon, 30 Sep 2024 18:11:03 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@inria.fr>,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/panthor: Fix access to uninitialized variable in
 tick_ctx_cleanup()
Date: Mon, 30 Sep 2024 18:11:01 +0200
Message-ID: <20240930161101.67366-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.0
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

The group variable can't be used to retrieve ptdev in our second loop,
because it might be uninitialized or point to a group that's already
gone. Get the ptdev object from the scheduler instead.

Fixes: d72f049087d4 ("drm/panthor: Allow driver compilation")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202409302306.UDikqa03-lkp@intel.com/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 201d5e7a921e..24ff91c084e4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2052,6 +2052,7 @@ static void
 tick_ctx_cleanup(struct panthor_scheduler *sched,
 		 struct panthor_sched_tick_ctx *ctx)
 {
+	struct panthor_device *ptdev = sched->ptdev;
 	struct panthor_group *group, *tmp;
 	u32 i;
 
@@ -2060,7 +2061,7 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
 			/* If everything went fine, we should only have groups
 			 * to be terminated in the old_groups lists.
 			 */
-			drm_WARN_ON(&group->ptdev->base, !ctx->csg_upd_failed_mask &&
+			drm_WARN_ON(&ptdev->base, !ctx->csg_upd_failed_mask &&
 				    group_can_run(group));
 
 			if (!group_can_run(group)) {
@@ -2083,7 +2084,7 @@ tick_ctx_cleanup(struct panthor_scheduler *sched,
 		/* If everything went fine, the groups to schedule lists should
 		 * be empty.
 		 */
-		drm_WARN_ON(&group->ptdev->base,
+		drm_WARN_ON(&ptdev->base,
 			    !ctx->csg_upd_failed_mask && !list_empty(&ctx->groups[i]));
 
 		list_for_each_entry_safe(group, tmp, &ctx->groups[i], run_node) {
-- 
2.46.0

