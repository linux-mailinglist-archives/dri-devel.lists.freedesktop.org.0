Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FA2402C9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDA66E356;
	Mon, 10 Aug 2020 07:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC466E137;
 Fri,  7 Aug 2020 13:10:02 +0000 (UTC)
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 07 Aug 2020 06:10:01 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 07 Aug 2020 06:09:59 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 07 Aug 2020 18:39:30 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 1689349FA; Fri,  7 Aug 2020 18:39:29 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] drm/msm/dpu: Fix reservation failures in modeset
Date: Fri,  7 Aug 2020 18:39:27 +0530
Message-Id: <1596805767-29339-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: mkrishn@codeaurora.org, travitej@codeaurora.org, dianders@chromium.org,
 abhinavk@codeaurora.org, linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, ddavenport@chromium.org,
 hoegsberg@chromium.org, swboyd@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In TEST_ONLY commit, rm global_state will duplicate the
object and request for new reservations, once they pass
then the new state will be swapped with the old and will
be available for the Atomic Commit.

This patch fixes some of missing links in the resource
reservation sequence mentioned above.

1) Creation of duplicate state in test_only commit (Rob)
2) Allocate and release the resources on every modeset.
3) Avoid allocation only when active is false.

In a modeset operation, swap state happens well before
disable. Hence clearing reservations in disable will
cause failures in modeset enable.

Allow reservations to be cleared/allocated before swap,
such that only newly committed resources are pushed to HW.

Changes in v1:
 - Move the rm release to atomic_check.
 - Ensure resource allocation and free happens when active
   is not changed i.e only when mode is changed.(Rob)

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..50a98d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	global_state = dpu_kms_get_global_state(crtc_state->state);
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -617,12 +617,15 @@ static int dpu_encoder_virt_atomic_check(
 	/* Reserve dynamic resources now. */
 	if (!ret) {
 		/*
-		 * Avoid reserving resources when mode set is pending. Topology
-		 * info may not be available to complete reservation.
+		 * Release and Allocate resources on every modeset
+		 * Dont allocate when active is false.
 		 */
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+			dpu_rm_release(global_state, drm_enc);
+
+			if (!crtc_state->active_changed || crtc_state->active)
+				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+						drm_enc, crtc_state, topology);
 		}
 	}
 
@@ -1171,7 +1174,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_global_state *global_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1190,7 +1192,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1220,8 +1221,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	dpu_rm_release(global_state, drm_enc);
-
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
