Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30146A25ECC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915C10E4EC;
	Mon,  3 Feb 2025 15:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dvE6ShCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD410E4EC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:32:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 485E95C5A3A;
 Mon,  3 Feb 2025 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC181C4CED2;
 Mon,  3 Feb 2025 15:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738596763;
 bh=YypXhtaA+5wzKpdJMi78IabyL/Rtl410xof+iU4VWxc=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=dvE6ShCIfXe3Bv7DIJAxwgdhgF1v73fM0n/taJSCVAq/FwfekOdNi85C7LgU99W36
 8vliMIJi5Sw9xxSVBW/Um0O/qyHdyJmmco3ul5S3XBAGwZw5hDHi/UYsTVv6hHcnQ6
 G/uKW7ROIaVpEvehKk4M1t/pK9BPVXVzzC2haNXEGE475cTDJq/YcbjrHorXCjA4aJ
 G42qZ5OPOHqgsZfpgd20iLDdZ3OO83cE4rlDjmSb7DW/2XXCJZvIyODFjRaN8/7hCw
 fUMhsvgB2UkRxLve9zIyVUv4OhhJK5ETQpsvvx0SK4gtthjBoXcxKwaIkabsNQs1jj
 N+LQVvVIoWAyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BE97EC02192;
 Mon,  3 Feb 2025 15:32:43 +0000 (UTC)
From: Brendan King via B4 Relay <devnull+Brendan.King.imgtec.com@kernel.org>
Date: Mon, 03 Feb 2025 15:32:34 +0000
Subject: [PATCH] drm/imagination: avoid deadlock on fence release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-fence-release-deadlock-v1-1-6e1de1260b38@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAJHhoGcC/x3MQQqDMBBG4avIrB0YIyL0KsVFzPzRoSGWBEohe
 PeGLr/Fe40qiqHSY2hU8LFqV+6YxoHC6fMBNu0mJ24RJzNH5AAuSPAVrPCarvBiL+syB1n3qEo
 9fhdE+/7Hz+2+f6QGOD1oAAAA
X-Change-ID: 20250203-fence-release-deadlock-a0753c07bfdd
To: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Brendan King <brendan.king@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738596758; l=3436;
 i=Brendan.King@imgtec.com; s=20250203; h=from:subject:message-id;
 bh=Imcb2s2055ggCSrAAAaIVMPc5WER7Wm2bjB9kmOerXA=;
 b=VbpFCDkjD7PI15JYLvdz+FUy7DwJzkrqlZ662VPb+A0ZrnuODcJCbScsFwXfBnEh1+vFT4U/r
 SvJ6YLtgcnPAVrsMn6YX8RF5nQ4kveh9KGUKOiY9vgeDCU9HsklRrsQ
X-Developer-Key: i=Brendan.King@imgtec.com; a=ed25519;
 pk=i3JvC3unEBLW+4r5s/aEWQZFsRCWaCBrWdFbMXIXCqg=
X-Endpoint-Received: by B4 Relay for Brendan.King@imgtec.com/20250203 with
 auth_id=335
X-Original-From: Brendan King <Brendan.King@imgtec.com>
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
Reply-To: Brendan.King@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Brendan King <Brendan.King@imgtec.com>

Do scheduler queue fence release processing on a workqueue, rather
than in the release function itself.

Fixes deadlock issues such as the following:

[  607.400437] ============================================
[  607.405755] WARNING: possible recursive locking detected
[  607.415500] --------------------------------------------
[  607.420817] weston:zfq0/24149 is trying to acquire lock:
[  607.426131] ffff000017d041a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: pvr_gem_object_vunmap+0x40/0xc0 [powervr]
[  607.436728]
               but task is already holding lock:
[  607.442554] ffff000017d105a0 (reservation_ww_class_mutex){+.+.}-{3:3}, at: dma_buf_ioctl+0x250/0x554
[  607.451727]
               other info that might help us debug this:
[  607.458245]  Possible unsafe locking scenario:

[  607.464155]        CPU0
[  607.466601]        ----
[  607.469044]   lock(reservation_ww_class_mutex);
[  607.473584]   lock(reservation_ww_class_mutex);
[  607.478114]
                *** DEADLOCK ***

Signed-off-by: Brendan King <brendan.king@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 13 +++++++++++--
 drivers/gpu/drm/imagination/pvr_queue.h |  4 ++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index c4f08432882b12f5cdfeb7fc991fd941f0946676..f3f1c5212df7432161919ddc510cececacbbe143 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -109,12 +109,20 @@ pvr_queue_fence_get_driver_name(struct dma_fence *f)
 	return PVR_DRIVER_NAME;
 }
 
+static void pvr_queue_fence_release_work(struct work_struct *w)
+{
+	struct pvr_queue_fence *fence = container_of(w, struct pvr_queue_fence, release_work);
+
+	pvr_context_put(fence->queue->ctx);
+	dma_fence_free(&fence->base);
+}
+
 static void pvr_queue_fence_release(struct dma_fence *f)
 {
 	struct pvr_queue_fence *fence = container_of(f, struct pvr_queue_fence, base);
+	struct pvr_device *pvr_dev = fence->queue->ctx->pvr_dev;
 
-	pvr_context_put(fence->queue->ctx);
-	dma_fence_free(f);
+	queue_work(pvr_dev->sched_wq, &fence->release_work);
 }
 
 static const char *
@@ -268,6 +276,7 @@ pvr_queue_fence_init(struct dma_fence *f,
 
 	pvr_context_get(queue->ctx);
 	fence->queue = queue;
+	INIT_WORK(&fence->release_work, pvr_queue_fence_release_work);
 	dma_fence_init(&fence->base, fence_ops,
 		       &fence_ctx->lock, fence_ctx->id,
 		       atomic_inc_return(&fence_ctx->seqno));
diff --git a/drivers/gpu/drm/imagination/pvr_queue.h b/drivers/gpu/drm/imagination/pvr_queue.h
index e06ced69302fca47fc26451dfb09ebbb24b57f52..93fe9ac9f58ccc020615485e86be438548dcee43 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.h
+++ b/drivers/gpu/drm/imagination/pvr_queue.h
@@ -5,6 +5,7 @@
 #define PVR_QUEUE_H
 
 #include <drm/gpu_scheduler.h>
+#include <linux/workqueue.h>
 
 #include "pvr_cccb.h"
 #include "pvr_device.h"
@@ -63,6 +64,9 @@ struct pvr_queue_fence {
 
 	/** @queue: Queue that created this fence. */
 	struct pvr_queue *queue;
+
+	/** @release_work: Fence release work structure. */
+	struct work_struct release_work;
 };
 
 /**

---
base-commit: 3ab334814dc7dff39075e055e12847d51878916e
change-id: 20250203-fence-release-deadlock-a0753c07bfdd

Best regards,
-- 
Brendan King <Brendan.King@imgtec.com>


