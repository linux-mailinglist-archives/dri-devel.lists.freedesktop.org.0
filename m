Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864FC19F06
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 12:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D66010E7A1;
	Wed, 29 Oct 2025 11:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EAAD10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 11:14:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8CE01655;
 Wed, 29 Oct 2025 04:14:15 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com
 [10.40.16.110])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E4323F673;
 Wed, 29 Oct 2025 04:14:21 -0700 (PDT)
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: disable async work during unplug
Date: Wed, 29 Oct 2025 12:14:10 +0100
Message-ID: <20251029111412.924104-1-ketil.johnsen@arm.com>
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

A previous change, "drm/panthor: Fix UAF race between device unplug and
FW event processing", fixes a real issue where new work was unexpectedly
queued after cancellation. This was fixed by a disable instead.

Apply the same disable logic to other device level async work on device
unplug as a precaution.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 2 +-
 drivers/gpu/drm/panthor/panthor_fw.c     | 2 +-
 drivers/gpu/drm/panthor/panthor_sched.c  | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 962a10e00848e..c4ae78545ef03 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -120,7 +120,7 @@ static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
 {
 	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
 
-	cancel_work_sync(&ptdev->reset.work);
+	disable_work_sync(&ptdev->reset.work);
 	destroy_workqueue(ptdev->reset.wq);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaeea..ceb249da8b336 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1162,7 +1162,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 {
 	struct panthor_fw_section *section;
 
-	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
+	disable_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
 
 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev)) {
 		/* Make sure the IRQ handler cannot be called after that point. */
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b7595beaa0205..278434da8926d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3879,8 +3879,9 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
 
-	cancel_delayed_work_sync(&sched->tick_work);
+	disable_delayed_work_sync(&sched->tick_work);
 	disable_work_sync(&sched->fw_events_work);
+	disable_work_sync(&sched->sync_upd_work);
 
 	mutex_lock(&sched->lock);
 	if (sched->pm.has_ref) {
@@ -3898,8 +3899,6 @@ static void panthor_sched_fini(struct drm_device *ddev, void *res)
 	if (!sched || !sched->csg_slot_count)
 		return;
 
-	cancel_delayed_work_sync(&sched->tick_work);
-
 	if (sched->wq)
 		destroy_workqueue(sched->wq);
 
-- 
2.47.2

