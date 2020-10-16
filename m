Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB862291408
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A876E2A3;
	Sat, 17 Oct 2020 19:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA896E17D;
 Fri, 16 Oct 2020 14:11:08 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 16 Oct 2020 07:11:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 16 Oct 2020 07:11:07 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 16 Oct 2020 19:40:47 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id F2461213ED; Fri, 16 Oct 2020 19:40:45 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v3] drm/msm: Fix race condition in msm driver with async layer
 updates
Date: Fri, 16 Oct 2020 19:40:43 +0530
Message-Id: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 dianders@chromium.org, seanpaul@chromium.org, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When there are back to back commits with async cursor update,
there is a case where second commit can program the DPU hw
blocks while first didn't complete flushing config to HW.

Synchronize the compositions such that second commit waits
until first commit flushes the composition.

This change also introduces per crtc commit lock, such that
commits on different crtcs are not blocked by each other.

Changes in v2:
	- Use an array of mutexes in kms to handle commit
	  lock per crtc. (Rob Clark)

Changes in v3:
	- Add wrapper functions to handle lock and unlock of
	  commit_lock for each crtc. (Rob Clark)

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 37 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 561bfa4..575e9af 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
+static void lock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
+		mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
+}
+
+static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct drm_crtc *crtc;
+
+	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
+		mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
 
 	trace_msm_atomic_async_commit_start(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	lock_crtcs(kms, crtc_mask);
 
 	if (!(kms->pending_crtc_mask & crtc_mask)) {
-		mutex_unlock(&kms->commit_lock);
+		unlock_crtcs(kms, crtc_mask);
 		goto out;
 	}
 
@@ -79,7 +95,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 	 */
 	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
 
 	/*
 	 * Wait for flush to complete:
@@ -90,9 +105,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 
 	vblank_put(kms, crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
 	kms->funcs->complete_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	unlock_crtcs(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 out:
@@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 * Ensure any previous (potentially async) commit has
 	 * completed:
 	 */
+	lock_crtcs(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
-
 	/*
 	 * Now that there is no in-progress flush, prepare the
 	 * current update:
@@ -232,8 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 
 		kms->funcs->disable_commit(kms);
-		mutex_unlock(&kms->commit_lock);
-
+		unlock_crtcs(kms, crtc_mask);
 		/*
 		 * At this point, from drm core's perspective, we
 		 * are done with the atomic update, so we can just
@@ -260,8 +272,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
-
+	unlock_crtcs(kms, crtc_mask);
 	/*
 	 * Wait for flush to complete:
 	 */
@@ -271,9 +282,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	vblank_put(kms, crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	lock_crtcs(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	unlock_crtcs(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 	drm_atomic_helper_commit_hw_done(state);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b..2049847 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -155,7 +155,7 @@ struct msm_kms {
 	 * For async commit, where ->flush_commit() and later happens
 	 * from the crtc's pending_timer close to end of the frame:
 	 */
-	struct mutex commit_lock;
+	struct mutex commit_lock[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 };
@@ -165,7 +165,9 @@ static inline void msm_kms_init(struct msm_kms *kms,
 {
 	unsigned i;
 
-	mutex_init(&kms->commit_lock);
+	for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
+		mutex_init(&kms->commit_lock[i]);
+
 	kms->funcs = funcs;
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
