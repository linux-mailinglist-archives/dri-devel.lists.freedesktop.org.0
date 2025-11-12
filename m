Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA746C52388
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34DE10E705;
	Wed, 12 Nov 2025 12:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Hx0vU5Do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0479D10E705
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762949875;
 bh=lV7XWA0k5bIWVdeBTevIIpNy0T1dCzReWWZWJ93Gp4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hx0vU5DoA1N8A8S7AHy9CCUIlEO3jTYegArN4Ap7sSghV8o8Wq+c21uVsohF74oec
 Ej+16PulQZW40PYDRejr8M8OUn7RCPk4QjSpKTzDS145Db8ijoCj6Qznf/2YOrDDpP
 c9x/+dMZlT1Qqp1FIL9qHZfQ/XOf40iKovD1CpMmDX6XJmcJ7kt/q/YvhbDlJDlw16
 KC3ikampV4lewyrP0Wb9wPGFiXzdWRek8lHj4w7rfSz3MJP8V0Pm3NAb8DaHYEguBU
 edRdgHN9wgxRTcz9x7Pbm/EfLo/jHL7R4/InG1t6c7SM5SBNbANnDmzDxZUmnt5RZp
 ebCxW5PAk7NHA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3880017E129C;
 Wed, 12 Nov 2025 13:17:55 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, kernel@collabora.com
Subject: [PATCH v7 2/2] drm/panthor: Reset queue slots if termination fails
Date: Wed, 12 Nov 2025 13:17:44 +0100
Message-ID: <20251112121744.1356882-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112121744.1356882-1-boris.brezillon@collabora.com>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
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

From: Ashley Smith <ashley.smith@collabora.com>

Make sure the queue slot is reset even if we failed termination so
we don't have garbage in the CS input interface after a reset. In
practice that's not a problem because we zero out all RW sections when
a hangs occurs, but it's safer to reset things manually, in case we
decide to not conditionally reload RW sections based on the type of
hang.

v4:
- Split the changes in two separate patches

v5:
- No changes

v6:
- Adjust the explanation in the commit message
- Drop the Fixes tag
- Put after the timeout changes and make the two patches independent
  so one can be backported, and the other not

v7:
- Use the local group variable instead of dereferencing csg_slot->group
- Add Steve's R-b

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b440187798dd..36c75c39e3e4 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2836,13 +2836,23 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 		while (slot_mask) {
 			u32 csg_id = ffs(slot_mask) - 1;
 			struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
+			struct panthor_group *group = csg_slot->group;
 
 			/* Terminate command timedout, but the soft-reset will
 			 * automatically terminate all active groups, so let's
 			 * force the state to halted here.
 			 */
-			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
-				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
+			if (group->state != PANTHOR_CS_GROUP_TERMINATED) {
+				group->state = PANTHOR_CS_GROUP_TERMINATED;
+
+				/* Reset the queue slots manually if the termination
+				 * request failed.
+				 */
+				for (i = 0; i < group->queue_count; i++) {
+					if (group->queues[i])
+						cs_slot_reset_locked(ptdev, csg_id, i);
+				}
+			}
 			slot_mask &= ~BIT(csg_id);
 		}
 	}
-- 
2.51.1

