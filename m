Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D507241693
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7B6E103;
	Tue, 11 Aug 2020 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E4D6E40D;
 Mon, 10 Aug 2020 12:49:53 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 10 Aug 2020 05:49:52 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 10 Aug 2020 05:49:51 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 10 Aug 2020 18:19:21 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8338048E5; Mon, 10 Aug 2020 18:19:20 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v3] drm/msm/dpu: Fix reservation failures in modeset
Date: Mon, 10 Aug 2020 18:19:18 +0530
Message-Id: <1597063758-26238-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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

Changes in v2:
 - Handle dpu_kms_get_global_state API failure as it may
   return EDEADLK (swboyd).

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..39e0b32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -582,7 +582,10 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -617,12 +620,15 @@ static int dpu_encoder_virt_atomic_check(
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
 
@@ -1171,7 +1177,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_global_state *global_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1190,7 +1195,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1220,8 +1224,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
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
