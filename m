Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6FBFB691
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF1110E0C8;
	Wed, 22 Oct 2025 10:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50B1210E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:30:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A11A1063;
 Wed, 22 Oct 2025 03:30:21 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com
 [10.40.16.110])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73E363F63F;
 Wed, 22 Oct 2025 03:30:26 -0700 (PDT)
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panthor: Fix UAF race between device unplug and FW
 event processing
Date: Wed, 22 Oct 2025 12:30:13 +0200
Message-ID: <20251022103014.1082629-1-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
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

The function panthor_fw_unplug() will free the FW memory sections.
The problem is that there could still be pending FW events which are yet
not handled at this point. process_fw_events_work() can in this case try
to access said freed memory.

This fix introduces a destroyed state for the panthor_scheduler object,
and we check for this before processing FW events.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")
---
v2:
- Followed Boris's advice and handle the race purely within the
  scheduler block (by adding a destroyed state)
---
 drivers/gpu/drm/panthor/panthor_sched.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee52..4996f987b8183 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -315,6 +315,13 @@ struct panthor_scheduler {
 		 */
 		struct list_head stopped_groups;
 	} reset;
+
+	/**
+	 * @destroyed: Scheduler object is (being) destroyed
+	 *
+	 * Normal scheduler operations should no longer take place.
+	 */
+	bool destroyed;
 };
 
 /**
@@ -1765,7 +1772,10 @@ static void process_fw_events_work(struct work_struct *work)
 	u32 events = atomic_xchg(&sched->fw_events, 0);
 	struct panthor_device *ptdev = sched->ptdev;
 
-	mutex_lock(&sched->lock);
+	guard(mutex)(&sched->lock);
+
+	if (sched->destroyed)
+		return;
 
 	if (events & JOB_INT_GLOBAL_IF) {
 		sched_process_global_irq_locked(ptdev);
@@ -1778,8 +1788,6 @@ static void process_fw_events_work(struct work_struct *work)
 		sched_process_csg_irq_locked(ptdev, csg_id);
 		events &= ~BIT(csg_id);
 	}
-
-	mutex_unlock(&sched->lock);
 }
 
 /**
@@ -3882,6 +3890,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
 	cancel_delayed_work_sync(&sched->tick_work);
 
 	mutex_lock(&sched->lock);
+	sched->destroyed = true;
 	if (sched->pm.has_ref) {
 		pm_runtime_put(ptdev->base.dev);
 		sched->pm.has_ref = false;
-- 
2.47.2

