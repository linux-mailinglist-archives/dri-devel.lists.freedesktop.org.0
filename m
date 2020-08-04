Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A22223C6C8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CE76E50C;
	Wed,  5 Aug 2020 07:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8389E9E;
 Tue,  4 Aug 2020 11:32:58 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 04 Aug 2020 04:32:58 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 Aug 2020 04:32:56 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 04 Aug 2020 17:02:29 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id F05E44BA0; Tue,  4 Aug 2020 17:02:26 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/dpu: update reservations in commit path
Date: Tue,  4 Aug 2020 17:02:24 +0530
Message-Id: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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

DPU resources reserved in the atomic_check path gets unwinded
during modeset operation before commit happens in a non seamless
transition.

Update the reservations in the commit path to avoid resource
failures. Secondly have dummy reservations in atomic_check path
so that we can gracefully fail the composition if resources are
not available.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..c6b8254 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -565,7 +565,7 @@ static int dpu_encoder_virt_atomic_check(
 	const struct drm_display_mode *mode;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct dpu_global_state *global_state;
+	struct dpu_global_state tmp_resv_state;
 	int i = 0;
 	int ret = 0;
 
@@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
-	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	memset(&tmp_resv_state, 0, sizeof(tmp_resv_state));
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -621,7 +621,7 @@ static int dpu_encoder_virt_atomic_check(
 		 * info may not be available to complete reservation.
 		 */
 		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+			ret = dpu_rm_reserve(&dpu_kms->rm, &tmp_resv_state,
 					drm_enc, crtc_state, topology);
 		}
 	}
@@ -966,7 +966,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp, num_dspp;
-	int i, j;
+	int i, j, rc;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1006,6 +1006,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
 
+	rc = dpu_rm_reserve(&dpu_kms->rm, global_state, drm_enc,
+		drm_crtc->state, topology);
+	if (rc) {
+		DPU_ERROR_ENC(dpu_enc, "Failed to reserve resources\n");
+		return;
+	}
+
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
