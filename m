Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2EA98A9F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 18:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554EA10E54C;
	Mon, 30 Sep 2024 16:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qrUkw/Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF02410E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727714264;
 bh=DGTEqWT59b4xewI8tbF2K62XtAnt9luFRH8leH+xhAY=;
 h=From:To:Cc:Subject:Date:From;
 b=qrUkw/EeNToGGqEunZuQjU/k84z8qn8RM+FfQvwDMpkcfLszalEv4BPJbUGIc7hD7
 NxV4XptFAcodG3oHlDnR/LXvCOrGuwciBVUE2BgRg49OlXcR2B71trdxPj8anMWzhT
 TF66BrlQcAMv1FMM8mPzIguDsN2oZUcY+AK3uOQ4LEUw1Jp3X2ZTF02ugP+V5GoQv8
 MzOlmOfv8Tlt/mQ3pKH4qoz8xLjU12xdxmg9IQr/PaeXo54sEq/Ul/bJ7dMFajaO3X
 AjSSese99l4ONUbKsZOUVtQzIAlgwSQlJndGnrtptXDvvyAUhSRzpcd5jdvuhsyfkH
 740QKQrFdg7Jw==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CB5C17E360D;
 Mon, 30 Sep 2024 18:37:44 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@inria.fr>,
 kernel@collabora.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/panthor: Fix access to uninitialized variable in
 tick_ctx_cleanup()
Date: Mon, 30 Sep 2024 18:37:42 +0200
Message-ID: <20240930163742.87036-1-boris.brezillon@collabora.com>
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
because it points to the previously iterated list_head, not a valid
group. Get the ptdev object from the scheduler instead.

Cc: <stable@vger.kernel.org>
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

