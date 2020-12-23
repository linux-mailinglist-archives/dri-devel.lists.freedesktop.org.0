Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A62E11DE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB46E8B1;
	Wed, 23 Dec 2020 02:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13686E8B1;
 Wed, 23 Dec 2020 02:18:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF66022D73;
 Wed, 23 Dec 2020 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689902;
 bh=v0oZvUtokxvo39/NdM+fLn468wX5yHrFHPEcQw3Zl2U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ERMGB+INolDH0LFM6an/mDK7Qc2PnpkcEYUzHJY79GUWN/BX/ofcuQOPSmlnItunH
 Pa5PeOWgvqWLoRBMurNv15VQV7uKy4P1e8h+7nGVPZWUjnKBfJG3OuxKrsLZg3J8i7
 ZNW80s6wlAJUGp7m/3QPI5B57FDR4QnMnCYpi0u7F7fGPfxMAGU2ewyCQsr/H/yklk
 w4ckRUt/DFba+7w0QNg/mE59Jz1iFQD1Vqz2+JQpEg+NLOSlpkPD6GgONMPetdTw13
 +eqKlSDAF4efgKx7L0d3jroAG1PvxlPeLsogrrUFJ7nhSSpE1GFUOl9pjzpK9n2aoo
 6MVOXOH5Q3kgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 007/130] drm/msm: Fix race condition in msm driver
 with async layer updates
Date: Tue, 22 Dec 2020 21:16:10 -0500
Message-Id: <20201223021813.2791612-7-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krishna Manikandan <mkrishn@codeaurora.org>

[ Upstream commit b3d91800d9ac35014e0349292273a6fa7938d402 ]

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
Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 37 +++++++++++++++++++++-----------
 drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 561bfa48841c3..575e9af9b6fc9 100644
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
index 1cbef6b200b70..2049847b66428 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
