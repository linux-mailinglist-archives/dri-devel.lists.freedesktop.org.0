Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808428ED71
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAC06EC25;
	Thu, 15 Oct 2020 07:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 14 Oct 2020 13:04:47 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE10A6EA78;
 Wed, 14 Oct 2020 13:04:47 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 14 Oct 2020 05:58:42 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Oct 2020 05:58:41 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg01-blr.qualcomm.com with ESMTP; 14 Oct 2020 18:28:21 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 5D0242141F; Wed, 14 Oct 2020 18:28:20 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm: Fix race condition in msm driver with async layer
 updates
Date: Wed, 14 Oct 2020 18:28:16 +0530
Message-Id: <1602680296-8965-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 26 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c         | 35 ++++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_kms.h            |  5 +++++
 5 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c2729f7..9024719 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1383,6 +1383,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 
 	/* initialize event handling */
 	spin_lock_init(&dpu_crtc->event_lock);
+	mutex_init(&dpu_crtc->commit_lock);
 
 	DPU_DEBUG("%s: successfully initialized crtc\n", dpu_crtc->name);
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474..1eeb73d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -169,6 +169,7 @@ struct dpu_crtc {
 
 	/* for handling internal event thread */
 	spinlock_t event_lock;
+	struct mutex commit_lock;
 
 	struct dpu_core_perf_params cur_perf;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e..f99ae7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -445,6 +445,30 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+static void dpu_kms_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+	struct dpu_crtc *dpu_crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
+		dpu_crtc = to_dpu_crtc(crtc);
+		mutex_lock(&dpu_crtc->commit_lock);
+	}
+}
+
+static void dpu_kms_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	struct drm_crtc *crtc;
+	struct dpu_crtc *dpu_crtc;
+
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
+		dpu_crtc = to_dpu_crtc(crtc);
+		mutex_unlock(&dpu_crtc->commit_lock);
+	}
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -738,6 +762,8 @@ static const struct msm_kms_funcs kms_funcs = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init    = dpu_kms_debugfs_init,
 #endif
+	.commit_lock     = dpu_kms_commit_lock,
+	.commit_unlock   = dpu_kms_commit_unlock,
 };
 
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 561bfa4..d33253f 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
 	}
 }
 
+static void msm_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	if (kms->funcs->commit_lock)
+		kms->funcs->commit_lock(kms, crtc_mask);
+	else
+		mutex_lock(&kms->commit_lock);
+}
+
+static void msm_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
+{
+	if (kms->funcs->commit_unlock)
+		kms->funcs->commit_unlock(kms, crtc_mask);
+	else
+		mutex_unlock(&kms->commit_lock);
+}
+
 static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
 {
 	unsigned crtc_mask = BIT(crtc_idx);
 
 	trace_msm_atomic_async_commit_start(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	msm_commit_lock(kms, crtc_mask);
 
 	if (!(kms->pending_crtc_mask & crtc_mask)) {
-		mutex_unlock(&kms->commit_lock);
+		msm_commit_unlock(kms, crtc_mask);
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
+	msm_commit_unlock(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 out:
@@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 * Ensure any previous (potentially async) commit has
 	 * completed:
 	 */
+	msm_commit_lock(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_start(crtc_mask);
 	kms->funcs->wait_flush(kms, crtc_mask);
 	trace_msm_atomic_wait_flush_finish(crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
-
 	/*
 	 * Now that there is no in-progress flush, prepare the
 	 * current update:
@@ -232,7 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 		}
 
 		kms->funcs->disable_commit(kms);
-		mutex_unlock(&kms->commit_lock);
+		msm_commit_unlock(kms, crtc_mask);
 
 		/*
 		 * At this point, from drm core's perspective, we
@@ -260,7 +273,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	trace_msm_atomic_flush_commit(crtc_mask);
 	kms->funcs->flush_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	msm_commit_unlock(kms, crtc_mask);
 
 	/*
 	 * Wait for flush to complete:
@@ -271,9 +284,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	vblank_put(kms, crtc_mask);
 
-	mutex_lock(&kms->commit_lock);
+	msm_commit_lock(kms, crtc_mask);
 	kms->funcs->complete_commit(kms, crtc_mask);
-	mutex_unlock(&kms->commit_lock);
+	msm_commit_unlock(kms, crtc_mask);
 	kms->funcs->disable_commit(kms);
 
 	drm_atomic_helper_commit_hw_done(state);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 1cbef6b..f02e73e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -126,6 +126,11 @@ struct msm_kms_funcs {
 	/* debugfs: */
 	int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
 #endif
+	/* commit lock for crtc */
+	void (*commit_lock)(struct msm_kms *kms, unsigned int crtc_mask);
+
+	/* commit unlock for crtc */
+	void (*commit_unlock)(struct msm_kms *kms, unsigned int crtc_mask);
 };
 
 struct msm_kms;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
