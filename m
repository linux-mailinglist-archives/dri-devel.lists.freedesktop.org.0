Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC582B9D04
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 22:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407266E81D;
	Thu, 19 Nov 2020 21:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FAF6E81B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 21:41:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605822115; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=kPk4nTM8zepb2gQPfXk1gH4Gujonjr6EUNsnS47xwxo=;
 b=pmYwEGRWzHNhZCfx4mg7MpPoOR1oXeyUlBsjzuOEkPWVglQHIE+f2Mby0tmAHtXO91JYCFXB
 DXHjx+Rge3lCleTikdaFzaSzg4497lr82CQdkmCvp3XfM1nMgn7VplmxhVT+ZudFYSilj3dD
 vKTXBnFwFn9TK+/vpDo+58JB5Ss=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fb6e6a07f0cfa6a1691ceb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 21:41:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02543C433ED; Thu, 19 Nov 2020 21:41:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 68BD4C433C6;
 Thu, 19 Nov 2020 21:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68BD4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: update the qos remap only if the client type
 changes
Date: Thu, 19 Nov 2020 13:41:45 -0800
Message-Id: <20201119214145.10182-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the qos remap only if the client type changes for the plane.
This will avoid unnecessary register programming and also avoid log
spam from the dpu_vbif_set_qos_remap() function.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 12 ++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  5 +++++
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4662e8184cc..3867da47c683 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1037,6 +1037,23 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return rc;
 }
 
+void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc)
+{
+	struct drm_plane *plane;
+	struct drm_plane_state *state;
+	struct dpu_plane_state *pstate;
+
+	drm_atomic_crtc_for_each_plane(plane, crtc) {
+		state = plane->state;
+		if (!state)
+			continue;
+
+		pstate = to_dpu_plane_state(state);
+
+		pstate->dirty |= DPU_PLANE_DIRTY_QOS;
+	}
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474340e8..8ba11de605bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -231,6 +231,13 @@ static inline int dpu_crtc_frame_pending(struct drm_crtc *crtc)
  */
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en);
 
+/**
+ * dpu_crtc_set_qos_dirty - update plane dirty flag to include
+ * QoS reprogramming
+ * @crtc: Pointer to drm crtc structure
+ */
+void dpu_crtc_set_qos_dirty(struct drm_crtc *crtc);
+
 /**
  * dpu_crtc_vblank_callback - called on vblank irq, issues completion events
  * @crtc: Pointer to drm crtc object
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c258b553..c2db9dd6ec67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1001,6 +1001,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
+	dpu_crtc_set_qos_dirty(drm_enc->crtc);
+
 	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
 		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ea90d25a3b6..f91d31a31e14 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1066,6 +1066,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
+	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 
@@ -1075,7 +1076,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pstate->pending = true;
 
-	pdpu->is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
 	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
@@ -1181,8 +1182,15 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_ot_limit(plane, crtc);
 	}
 
-	_dpu_plane_set_qos_remap(plane);
+	if (is_rt_pipe != pdpu->is_rt_pipe) {
+		pdpu->is_rt_pipe = is_rt_pipe;
+		pstate->dirty |= DPU_PLANE_DIRTY_QOS;
+	}
 
+	if (pstate->dirty & DPU_PLANE_DIRTY_QOS) {
+		_dpu_plane_set_qos_remap(plane);
+		pstate->dirty = 0x0;
+	}
 	_dpu_plane_calc_bw(plane, fb);
 
 	_dpu_plane_calc_clk(plane);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index ca83b8753d59..47abd3686a86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -14,11 +14,15 @@
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_sspp.h"
 
+/* dirty bits to update QOS */
+#define DPU_PLANE_DIRTY_QOS 0x1
+
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
  * @stage:	assigned by crtc blender
+ * @dirty:	bitmask for which pipe h/w config functions need to be updated
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
@@ -32,6 +36,7 @@ struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
 	enum dpu_stage stage;
+	uint32_t dirty;
 	uint32_t multirect_index;
 	uint32_t multirect_mode;
 	bool pending;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
