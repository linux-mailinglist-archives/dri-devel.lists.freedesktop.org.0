Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DC97B9A0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 10:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFCA10E238;
	Wed, 18 Sep 2024 08:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="Mm8uHSi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7912D10E18A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 08:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726649645; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RUrYgcd7PD+TuAaomlFOcCCP3Q6Cl1q6+a2quiqOJ8LtS+OoMGy7I7J18AxB4U++QK0dS+CJ6J+krrU2f0kzrO0ZA+laPVQhdNJ95CPGHJKYUSeYEyHxAjf4JkCIhrPZqEhGhGHGCwdcahHW45M4gOCGdQDuC5MzUH91rI66Z2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726649645;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=V4Q6bjiiwoxxooBzGyx0yM63Xs5VG7E0q48VV9hRoE4=; 
 b=h42FYfJ2fjjivP/IHJa2n1fyEV1PDv398RVVTH3rfU9kaz2m+Y4OL0+yeaCD/GYrJOYXQ8/lMD/LGcWcZ8uWjgwrasom91tk2XQ5UEttoTGepl3dlErPvUylE2By8CVHb/6wgZfFsSvTEVkkrFMdV18OfLi2wMxDBmR1EX2DPXs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726649645; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=V4Q6bjiiwoxxooBzGyx0yM63Xs5VG7E0q48VV9hRoE4=;
 b=Mm8uHSi6ddkmePCdsJEj5Hq7JHMKRh2WFWHQyN7+7o5wradSxsjrbG4FvKMMTjBd
 Z0nwSt5wILHhPaUoGVbbGsWyxSh2Kf/AAB9jTQi++EABLrtgk4lSPcT/4r2JSxaDWY6
 PrjxQwhLhYBvaIbAxwd61/mSsWBrNe8DVMvTCjjM=
Received: by mx.zohomail.com with SMTPS id 1726649643043342.89420907457327;
 Wed, 18 Sep 2024 01:54:03 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/panthor: Add csg_priority to panthor_group
Date: Wed, 18 Sep 2024 10:50:55 +0200
Message-ID: <20240918085056.24422-3-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918085056.24422-2-mary.guillemard@collabora.com>
References: <20240918085056.24422-2-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Keep track of the csg priority in panthor_group when the group is
scheduled/active.

This is useful to know the actual priority in use in the firmware
group slot.

Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 86908ada7335..f15abeef4ece 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -574,6 +574,13 @@ struct panthor_group {
 	 */
 	int csg_id;
 
+	/**
+	 * @csg_id: Priority of the FW group slot.
+	 *
+	 * -1 when the group is not scheduled/active.
+	 */
+	int csg_priority;
+
 	/**
 	 * @destroyed: True when the group has been destroyed.
 	 *
@@ -894,11 +901,12 @@ group_get(struct panthor_group *group)
  * group_bind_locked() - Bind a group to a group slot
  * @group: Group.
  * @csg_id: Slot.
+ * @csg_priority: Priority of the slot.
  *
  * Return: 0 on success, a negative error code otherwise.
  */
 static int
-group_bind_locked(struct panthor_group *group, u32 csg_id)
+group_bind_locked(struct panthor_group *group, u32 csg_id, u32 csg_priority)
 {
 	struct panthor_device *ptdev = group->ptdev;
 	struct panthor_csg_slot *csg_slot;
@@ -917,6 +925,7 @@ group_bind_locked(struct panthor_group *group, u32 csg_id)
 	csg_slot = &ptdev->scheduler->csg_slots[csg_id];
 	group_get(group);
 	group->csg_id = csg_id;
+	group->csg_priority = csg_priority;
 
 	/* Dummy doorbell allocation: doorbell is assigned to the group and
 	 * all queues use the same doorbell.
@@ -956,6 +965,7 @@ group_unbind_locked(struct panthor_group *group)
 	slot = &ptdev->scheduler->csg_slots[group->csg_id];
 	panthor_vm_idle(group->vm);
 	group->csg_id = -1;
+	group->csg_priority = -1;
 
 	/* Tiler OOM events will be re-issued next time the group is scheduled. */
 	atomic_set(&group->tiler_oom, 0);
@@ -2193,8 +2203,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 
 			csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
 			csg_slot = &sched->csg_slots[csg_id];
-			group_bind_locked(group, csg_id);
-			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio--);
+			group_bind_locked(group, csg_id, new_csg_prio);
+			csg_slot_prog_locked(ptdev, csg_id, new_csg_prio);
+			new_csg_prio--;
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						group->state == PANTHOR_CS_GROUP_SUSPENDED ?
 						CSG_STATE_RESUME : CSG_STATE_START,
@@ -3111,6 +3122,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	kref_init(&group->refcount);
 	group->state = PANTHOR_CS_GROUP_CREATED;
 	group->csg_id = -1;
+	group->csg_priority = -1;
 
 	group->ptdev = ptdev;
 	group->max_compute_cores = group_args->max_compute_cores;
-- 
2.46.0

