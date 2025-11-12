Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F36DC52171
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A095910E09E;
	Wed, 12 Nov 2025 11:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LkEQmawS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9C410E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762948314;
 bh=3hs2se6gaxh2ksc/6pzWWO3t/ApamSqNkRxnU2Yyvhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LkEQmawSL6qPq8iMq1Rh615HCy1TF/Z99qoZX2+Y7W/FtcWU1g0m8N2M/gF3LqJvz
 jvohDrTGQbKCLxHCUGv2SYIyOIfAyXQWKVZ1OFVodpqWw7Lcqlg1j+5oHitflCZHpn
 mx+HKM9h1zsEL1ITEr/LOP+jnBFRn4dQ0Fmnr8N5/zuh1z6NffWlEJ0gRQW8+opIqD
 /c/kt5wSSjaqqLDRv4m0G5f1COJtnX/ToVzUrUc+o6rkZsds09M7cCpCeg4jVKnH/g
 9j6pXU5nn6jAryOWaDCTpvIn/l1mV0E6wMCc6Bf+J05bMmdrMp7dkxQf6r2v/yNFNy
 Kxf0QGUSxTs9w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D63A17E12E5;
 Wed, 12 Nov 2025 12:51:54 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v2 1/8] drm/panthor: Simplify group idleness tracking
Date: Wed, 12 Nov 2025 12:51:35 +0100
Message-ID: <20251112115142.1270931-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112115142.1270931-1-boris.brezillon@collabora.com>
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
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

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 31 ++-----------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e74ca071159d..9931f4a6cd96 100644
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
@@ -1607,17 +1598,6 @@ static bool cs_slot_process_irq_locked(struct panthor_device *ptdev,
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
@@ -1879,10 +1859,8 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
 		if (acked & CSG_STATE_MASK)
 			csg_slot_sync_state_locked(ptdev, csg_id);
 
-		if (acked & CSG_STATUS_UPDATE) {
+		if (acked & CSG_STATUS_UPDATE)
 			csg_slot_sync_queues_state_locked(ptdev, csg_id);
-			csg_slot_sync_idle_state_locked(ptdev, csg_id);
-		}
 
 		if (ret && acked != req_mask &&
 		    ((csg_iface->input->req ^ csg_iface->output->ack) & req_mask) != 0) {
@@ -1919,13 +1897,8 @@ tick_ctx_is_full(const struct panthor_scheduler *sched,
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
 
-- 
2.51.1

