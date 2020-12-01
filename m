Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC22CB0F6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 00:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291666E978;
	Tue,  1 Dec 2020 23:39:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-5.mailgun.net (m42-5.mailgun.net [69.72.42.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A484F6E978
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 23:39:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606865952; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=3rL7U0qdTsIIcXyxf1/RHzP8bXxg6fIWp4fpYRQmTZc=;
 b=raiW9f1zpJTXF9wsJAOyEUVlxhIBiELz2zBAK78wiSUO+UmWPsFULiLaavRdmgflUlkgwVos
 FtcefRWK8TtloncgwDctcPBpFIRqAdjYsEUeCJaAomi15nHuXhyzN+CeB4qMItpb3VgLG9JC
 nA/U0gfQ1eMkdYC2L0Dq8bJws04=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fc6d417f2eedd90842a7d05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 23:39:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5EF8EC43461; Tue,  1 Dec 2020 23:39:02 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E22B6C433C6;
 Tue,  1 Dec 2020 23:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E22B6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From: Abhinav Kumar <abhinavk@codeaurora.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: update the qos remap only if the client type
 changes
Date: Tue,  1 Dec 2020 15:38:55 -0800
Message-Id: <20201201233855.13624-1-abhinavk@codeaurora.org>
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

changes in v2:
 - get rid of the dirty flag and simplify the logic to call
   _dpu_plane_set_qos_remap()

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 17 +++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  2 ++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7ea90d25a3b6..8f9e9293969e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -937,6 +937,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 {
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
 	struct drm_rect src, dst, fb_rect = { 0 };
@@ -1009,6 +1010,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -E2BIG;
 	}
 
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
 	return 0;
 }
 
@@ -1066,6 +1069,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 	struct drm_crtc *crtc = state->crtc;
 	struct drm_framebuffer *fb = state->fb;
+	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
 
@@ -1075,7 +1079,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	pstate->pending = true;
 
-	pdpu->is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
+	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
 	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
@@ -1181,7 +1185,16 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_ot_limit(plane, crtc);
 	}
 
-	_dpu_plane_set_qos_remap(plane);
+	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
+			pstate->needs_qos_remap;
+
+	if (update_qos_remap) {
+		if (is_rt_pipe != pdpu->is_rt_pipe)
+			pdpu->is_rt_pipe = is_rt_pipe;
+		else if (pstate->needs_qos_remap)
+			pstate->needs_qos_remap = false;
+		_dpu_plane_set_qos_remap(plane);
+	}
 
 	_dpu_plane_calc_bw(plane, fb);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index ca83b8753d59..13a983fa8213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -19,6 +19,7 @@
  * @base:	base drm plane state object
  * @aspace:	pointer to address space for input/output buffers
  * @stage:	assigned by crtc blender
+ * @needs_qos_remap: qos remap settings need to be updated
  * @multirect_index: index of the rectangle of SSPP
  * @multirect_mode: parallel or time multiplex multirect mode
  * @pending:	whether the current update is still pending
@@ -32,6 +33,7 @@ struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
 	enum dpu_stage stage;
+	bool needs_qos_remap;
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
