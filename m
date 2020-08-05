Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B023D78A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632FF6E884;
	Thu,  6 Aug 2020 07:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458E26E5D3;
 Wed,  5 Aug 2020 13:34:42 +0000 (UTC)
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 05 Aug 2020 06:34:41 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Aug 2020 06:34:38 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg02-blr.qualcomm.com with ESMTP; 05 Aug 2020 19:04:07 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id D31433EBB; Wed,  5 Aug 2020 19:04:07 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/dpu: Fix reservation failures in modeset
Date: Wed,  5 Aug 2020 19:04:06 +0530
Message-Id: <1596634446-1413-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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

1) Creation of a duplicate state in test_only commit (Rob)
2) Allow resource release only during crtc_active false.

For #2
In a modeset operation, swap state happens well before disable.
Hence clearing reservations in disable will cause failures
in modeset enable.

Sequence:
    Swap state --> old, new
    modeset disables --> virt disable
    modeset enable --> virt modeset

Allow reservations to be cleared only when crtc active is false
as in that case there wont be any modeset enable after disable.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 63976dc..b85a576 100644
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
@@ -1172,6 +1172,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
 	struct dpu_global_state *global_state;
+	struct drm_crtc_state *crtc_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1191,6 +1192,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	crtc_state = drm_enc->crtc->state;
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1220,7 +1222,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	dpu_rm_release(global_state, drm_enc);
+	if (crtc_state->active_changed && !crtc_state->active)
+		dpu_rm_release(global_state, drm_enc);
 
 	mutex_unlock(&dpu_enc->enc_lock);
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
