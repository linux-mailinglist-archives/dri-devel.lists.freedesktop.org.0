Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092DC9181F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1356C10E128;
	Fri, 28 Nov 2025 09:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DFIDR9ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B84010E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323331;
 bh=q/DPTpLVXGAJeDZco3L9Rcx9DtMqzQqijRwsBwdKcD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DFIDR9ge1OuIbDd1aJwtNgABCRcozBx2aW7MzPLLDj090jLsGjLxNOUw4600z9S0M
 a4hDaeccxbxGOQjc+ryinOIQklFUqsgmSPAjL18CfpROP4m/pYnznarwk7hCC6WQeb
 4TxWL1eQ5SFyOlolpIz0L5FO6W13pAUEd8GnCFUS/LAMLZJmSvnjCoE3T18255AHK4
 eXOc5aFurUISnj1hG3sZd7YdIiV1p4yxT3v5VTSxSdnm9/eeCZV2NkUsraaXAyg0Pr
 ev3vhNsXIjV/C9xwtYKNv3XR+ORHtCF8mlnd+7kJby4HWJ8+KtCX4E8HI1qxc52/Pq
 7RvDIe5Gc4Glw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A4AFA17E0ED5;
 Fri, 28 Nov 2025 10:48:50 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 1/8] drm/panthor: Simplify group idleness tracking
Date: Fri, 28 Nov 2025 10:48:32 +0100
Message-ID: <20251128094839.3856402-2-boris.brezillon@collabora.com>
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

csg_slot_sync_queues_state_locked() queries the queues state which can
then be used to determine if a group is idle or not. Let's base our
idleness detection logic solely on the {idle,blocked}_queues masks to
avoid inconsistencies between the group state and the state of its
subqueues.

v2:
- Add R-b

v3:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 31 ++-----------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 1beddc175722..5b2ab963ac99 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -108,15 +108,6 @@ struct panthor_csg_slot {
 
 	/** @priority: Group priority. */
 	u8 priority;
-
-	/**
-	 * @idle: True if the group bound to this slot is idle.
-	 *
-	 * A group is idle when it has nothing waiting for execution on
-	 * all its queues, or when queues are blocked waiting for something
-	 * to happen (synchronization object).
-	 */
-	bool idle;
 };
 
 /**
@@ -1056,13 +1047,8 @@ group_unbind_locked(struct panthor_group *group)
 static bool
 group_is_idle(struct panthor_group *group)
 {
-	struct panthor_device *ptdev = group->ptdev;
-	u32 inactive_queues;
+	u32 inactive_queues = group->idle_queues | group->blocked_queues;
 
-	if (group->csg_id >= 0)
-		return ptdev->scheduler->csg_slots[group->csg_id].idle;
-
-	inactive_queues = group->idle_queues | group->blocked_queues;
 	return hweight32(inactive_queues) == group->queue_count;
 }
 
@@ -1719,17 +1705,6 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
 	return (events & (CS_FAULT | CS_TILER_OOM)) != 0;
 }
 
-static void csg_slot_sync_idle_state_locked(struct panthor_device *ptdev, u32 csg_id)
-{
-	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
-	struct panthor_fw_csg_iface *csg_iface;
-
-	lockdep_assert_held(&ptdev->scheduler->lock);
-
-	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-	csg_slot->idle = csg_iface->output->status_state & CSG_STATUS_STATE_IS_IDLE;
-}
-
 static void csg_slot_process_idle_event_locked(struct panthor_device *ptdev, u32 csg_id)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
@@ -1991,10 +1966,8 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
 		if (acked & CSG_STATE_MASK)
 			csg_slot_sync_state_locked(ptdev, csg_id);
 
-		if (acked & CSG_STATUS_UPDATE) {
+		if (acked & CSG_STATUS_UPDATE)
 			csg_slot_sync_queues_state_locked(ptdev, csg_id);
-			csg_slot_sync_idle_state_locked(ptdev, csg_id);
-		}
 
 		if (ret && acked != req_mask &&
 		    ((csg_iface->input->req ^ csg_iface->output->ack) & req_mask) != 0) {
-- 
2.51.1

