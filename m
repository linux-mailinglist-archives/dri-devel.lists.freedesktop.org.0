Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2CC2C89C
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B543A10E414;
	Mon,  3 Nov 2025 15:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l/PUqFvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94AA610E1FF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762182123;
 bh=197KYqhY4EsH/4eM5kcDjAlGeV9CrcTdRD/T6/X4lVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l/PUqFvU4dmhTAquN0h9Nq1HiEahdlfXeUOCg94O58taoutoyE47JixBoVqpAVPEZ
 k7rZHG8Z2QVgonu1XzPDgvAV4wWoUkLhzmEV7sxo0z0xHcnkfe3f2HMM+rPW3ff6ka
 beDL4qvrK6MCOm7Ric1TqUJJIy5VM9IjCOHx+vVgXrlq+fNqPovrmMHQqJ96LgfgHy
 Ahm3LHkQIwUpJyGplMrU4ff54ftCQgLyTdn0TdziedOzU1Dnpiosm2uubSA/o2M8r2
 6XnOW59AwSzxQmZLeYo5KlCLz4tfK0gEpwLTl8r4GgXmWHtWBI15v4oFp+ZfMbd+AX
 l1zLiSQO54VEQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BF32217E13DE;
 Mon,  3 Nov 2025 16:02:02 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, kernel@collabora.com
Subject: [PATCH v6 2/2] drm/panthor: Reset queue slots if termination fails
Date: Mon,  3 Nov 2025 16:01:54 +0100
Message-ID: <20251103150154.31056-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251103150154.31056-1-boris.brezillon@collabora.com>
References: <20251103150154.31056-1-boris.brezillon@collabora.com>
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

v4: Split the changes in two separate patches

v5:
- No changes

v6:
- Adjust the explanation in the commit message
- Drop the Fixes tag
- Put after the timeout changes and make the two patches independent
  so one can be backported, and the other not

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b440187798dd..f9a52252b268 100644
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
+				for (i = 0; i < csg_slot->group->queue_count; i++) {
+					if (csg_slot->group->queues[i])
+						cs_slot_reset_locked(ptdev, csg_id, i);
+				}
+			}
 			slot_mask &= ~BIT(csg_id);
 		}
 	}
-- 
2.51.1

