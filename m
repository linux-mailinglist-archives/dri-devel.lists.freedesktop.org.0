Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5108B9EC67F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8B210EA82;
	Wed, 11 Dec 2024 08:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mjzzZAsX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE26510EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733904303;
 bh=QMoIOy9vDXe5etlSH1Y4W5mESOg6a2Xpwj1GncMyUVc=;
 h=From:To:Cc:Subject:Date:From;
 b=mjzzZAsXMeeBXsq39cpMLhFOTF2i6MJyThdXi7r9qJ06Vv7cSC0zdI6dbtV3926N1
 o6fR1AxXNUxvDGXSl4GWlpw9yCXaAYvhK3y5X6pvQBz9Fae/M9aWmjOTxZMGYW2osG
 n9P+BHJ76bzHxNEqEw0k5uf/+/FnGcBYNtPH2h+fbkNAkaf2mkYaJC4CKqNQZ8CmdV
 g6AQTOJ5sYybE/Ucd9iDPrxemJuHn5TJC6OEVCrPzUvA2du32ZsEBSydSLviorKxvr
 c0htmyNxWsbyBfW/v0ZOfp0w4X2ZSPsMi7bOJEW4PO0S+feTbvgyPrN/pLRUBZxlOM
 NSsdsCXB0ymgQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E18417E1437;
 Wed, 11 Dec 2024 09:05:03 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v4] drm/panthor: Report innocent group kill
Date: Wed, 11 Dec 2024 09:05:00 +0100
Message-ID: <20241211080500.2349505-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.47.0
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

Groups can be killed during a reset even though they did nothing wrong.
That usually happens when the FW is put in a bad state by other groups,
resulting in group suspension failures when the reset happens.

If we end up in that situation, flag the group innocent and report
innocence through a new DRM_PANTHOR_GROUP_STATE flag.

Bump the minor driver version to reflect the uAPI change.

Changes in v4:
- Add an entry to the driver version changelog
- Add R-bs

Changes in v3:
- Actually report innocence to userspace

Changes in v2:
- New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c   |  3 ++-
 drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++++++++++
 include/uapi/drm/panthor_drm.h          |  9 +++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ac7e53f6e3f0..1498c97b4b85 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1493,6 +1493,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
+ * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1507,7 +1508,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.desc = "Panthor DRM driver",
 	.date = "20230801",
 	.major = 1,
-	.minor = 2,
+	.minor = 3,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index ef4bec7ff9c7..97ed5fe5a191 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -610,6 +610,16 @@ struct panthor_group {
 	 */
 	bool timedout;
 
+	/**
+	 * @innocent: True when the group becomes unusable because the group suspension
+	 * failed during a reset.
+	 *
+	 * Sometimes the FW was put in a bad state by other groups, causing the group
+	 * suspension happening in the reset path to fail. In that case, we consider the
+	 * group innocent.
+	 */
+	bool innocent;
+
 	/**
 	 * @syncobjs: Pool of per-queue synchronization objects.
 	 *
@@ -2690,6 +2700,12 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 			u32 csg_id = ffs(slot_mask) - 1;
 			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
 
+			/* If the group was still usable before that point, we consider
+			 * it innocent.
+			 */
+			if (group_can_run(csg_slot->group))
+				csg_slot->group->innocent = true;
+
 			/* We consider group suspension failures as fatal and flag the
 			 * group as unusable by setting timedout=true.
 			 */
@@ -3570,6 +3586,8 @@ int panthor_group_get_state(struct panthor_file *pfile,
 		get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
 		get_state->fatal_queues = group->fatal_queues;
 	}
+	if (group->innocent)
+		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
 	mutex_unlock(&sched->lock);
 
 	group_put(group);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 87c9cb555dd1..b99763cbae48 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -923,6 +923,15 @@ enum drm_panthor_group_state_flags {
 	 * When a group ends up with this flag set, no jobs can be submitted to its queues.
 	 */
 	DRM_PANTHOR_GROUP_STATE_FATAL_FAULT = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_GROUP_STATE_INNOCENT: Group was killed during a reset caused by other
+	 * groups.
+	 *
+	 * This flag can only be set if DRM_PANTHOR_GROUP_STATE_TIMEDOUT is set and
+	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
+	 */
+	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
 };
 
 /**
-- 
2.47.0

