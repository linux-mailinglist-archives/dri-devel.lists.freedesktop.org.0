Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EFC52192
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBFA10E6F4;
	Wed, 12 Nov 2025 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ASSE/+TQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CE110E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762948315;
 bh=PxVAOQpCeJdKODKWI0drd100TKS5mackr414xrwpVfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ASSE/+TQluc/P2GHRgwfwMTvGeQVzxZD+T5ls36YGjTJ+iC+ZOcnraHflRuHGmU6V
 iMLx5+bqWVo9RvdUPAzzt2d/pNjds8OFzJV1qnUjLgB+LwdjOoR+VgSj/txeWTw12U
 XqX865l6WKwZCGY4zCymMpB5094az/e64ymnqCeT8j5yxJVzuMp+zLOOuT2Gds6QuE
 O+p9THdDIMtPR49fWrnxvYiKemEaW8JP6iPIdFb1DIzu95l3kLURog4D7N4zXrILKn
 hDGCiqLt809CZ9edHvi0YmVlk0dwiZCBdrYkCH9LcaZHkpA0L+gi4LfOL2BQl+bTJY
 9kq59FUFGaQBQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CA93217E1340;
 Wed, 12 Nov 2025 12:51:54 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v2 2/8] drm/panthor: Don't try to enable extract events
Date: Wed, 12 Nov 2025 12:51:36 +0100
Message-ID: <20251112115142.1270931-3-boris.brezillon@collabora.com>
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

Not only this only works once, because of how extract events work
(event is enabled if the req and ack bit differ, and it's signalled
by the FW by setting identical req and ack, to re-enable the event,
we need to toggle the bit, which we never do). But more importantly,
we never do anything with this event, so we're better off dropping it
when programming the CS slot.

v2:
- Add R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 9931f4a6cd96..94514d464e64 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1069,12 +1069,10 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 	panthor_fw_update_reqs(cs_iface, req,
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
-			       CS_STATE_START |
-			       CS_EXTRACT_EVENT,
+			       CS_STATE_START,
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
-			       CS_STATE_MASK |
-			       CS_EXTRACT_EVENT);
+			       CS_STATE_MASK);
 	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
 		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
 		queue->timeout_suspended = false;
-- 
2.51.1

