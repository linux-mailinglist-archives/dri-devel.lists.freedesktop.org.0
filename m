Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D83AAFABA2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 08:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0A510E414;
	Mon,  7 Jul 2025 06:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o+9jan/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512F10E413
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:54 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso1810755a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869134; x=1752473934; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N8kgit1BpE3d05xGdiuLr97hSDDiFgnmQxTTWKgwMvI=;
 b=o+9jan/Tq8HVx7CVowZd2gos+yjP38iIFW8GC+9ErrDdwP3JEFte5YLpWz0CgduciL
 DbuyUJ6KFDrQt+FyAjBqtSh32Aqq4yMSfTFDSmfBlJtfcVfYQpXBnqb/3x9o9qmPssFN
 2+UvwA/TGRmVUnP0dFEfC0ceuM1PcbuTbOkApfm5xB16A6VwXIqHyzCeduQ1c9aH/oUP
 ICuQ14Kpjy2+YezQTC06u0uZc4xYGqmxIt+Teptl7JD8QADKY7w2RIudNBlK6gk3yHxr
 2Wfdr2yTxoPVNuecFLaKeqk6BccBEF7O0RiNWFV7FsCpCTjn/KfzorjQs28hWtP9XaB6
 eHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869134; x=1752473934;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N8kgit1BpE3d05xGdiuLr97hSDDiFgnmQxTTWKgwMvI=;
 b=dsx5E6zvrDWXXH3eR6nkk1P3iUfUmC9U6cCXJmAQzBa//csa5Ys/ZGFy/lbUGDL/vW
 LoOGhsKdWoMlK3vKPTp7EIW4aqtsHpgXUCdDb3h4HyimDrjAlYuS7Zal4t/3TsjxOpya
 H8dWFqj/jwfPW8OhnhuFdSn8ba15dpCDehnyb7TBHPOvBpqVPRqH/inv01uY+6OXdE2E
 dCo9WTclYeTpqCw2pAsJPaTyl0KLP3D9dd3htXHw0FIMzD0MWCLjVn9GfEH6rZjr8BhW
 0eWJ/aiaZ0G95n9l2gfhCNQu2u4G/dwJacVNqN6cLHfiDLLVODUcN+f9QS9Wqm0cScDW
 Z7QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVEvVskMiWGJ/zKo0oy6M5wbztJiepBI8pShBD7K9r4YXnGWWD9OW6Lrs8KGTcfv3FbTeLPXyPiBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuko79SQp5O3cV0Ai7eDjRX8huWH1dHJAmRBdUIkdQ7Xdl3TjC
 jTYsJrrC5lfqsLEsPgf5+77YfLoKtsqYGzqmlp+9V+ERJ7Yt8nHPnTgzQh7tqQms2y8=
X-Gm-Gg: ASbGncs+v702EVEXdi4YkjKHIP2TG6o9ktcgafA+bkNeVKKhJb4X6ISrW6LS1fKyrrP
 UKgwg7uVb9xeg5F0zyn8F8HjW75Apf9HfPmRCbe+IWT+Z0EfbNXh2MuxPl3mm00bA4lz9i10dZx
 4ywUPEwR4A3uKEoUH+XASqwUXLOqV6cfrr9/9PJ7JJYBnLyaNMyXrb+JOR8AHul/gByb7Fu9am5
 +p64n5cOuYzT5KYBSG5+Fw3rs1JWir16aGiu1FqG6bFHOKvp+58efPLHbL5maVC+ciDZtctWXDL
 gkoX0tzFyy5j/xFgHRIEYkc3CNbWpBSS0bRIZcs/nCRQgtQRiWi/6Pyip4Y=
X-Google-Smtp-Source: AGHT+IGpQFGQTZ1sKiIn84Jo7HPHJex3oh+gpvZPOS+zdC7io1z+I327IdcvwKZG5ah8a76qX+0NzQ==
X-Received: by 2002:a05:6a20:7291:b0:1f5:6c7b:8920 with SMTP id
 adf61e73a8af0-225b754f67dmr16619222637.9.1751869134234; 
 Sun, 06 Jul 2025 23:18:54 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:02 +0800
Subject: [PATCH v12 07/12] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-7-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=6393;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=w6OvEIF3tSd/dBIIL4Coh3mB83jJ5FGZMgy+w60QLRM=;
 b=hcsJ+07a+QZqprMCWmQZ7kTOYhpuGJAul7bL8pPtmT7l+lsoHYFDyz9CelOrgwUJazstwouzJ
 9eaH43jnM/7BgaESrTVGS8WbqytgGsM+U1rOOC3BawpI87nS2QhsUM4
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 121bd0d304b308bcd7226784eda14d7c7f5a46f4..30fbd7565b82c6b6b13dc3ec0f4c91328a8e94c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -472,8 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
@@ -1305,7 +1304,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
-#define MAX_CHANNELS_PER_CRTC 2
+#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
@@ -1663,7 +1662,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			seq_printf(s, "\tsspp[%d]:%s\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6263d74e5cfa7acd5b4e2156b73b6fa26f5ddd77..149e7066480b07f9f6d422748d89ffd6f9416f33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -634,7 +634,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
@@ -1153,7 +1153,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1207,7 +1207,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1340,7 +1340,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1463,7 +1463,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1477,7 +1477,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1496,7 +1496,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1618,7 +1618,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1675,7 +1675,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 007f044499b99ac9c2e4b58e98e6add013a986de..1ef5a041b8acae270826f20ea9553cbfa35a9f82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,8 +31,8 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1

