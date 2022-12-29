Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D44659121
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA07310E21B;
	Thu, 29 Dec 2022 19:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76BF10E27E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:21 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p36so28727361lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7+ye+NFJZe0KDTdmSEjWd232bLjzOA6QxoZpECE5vE=;
 b=uwojrxweP+zXINoLEh8Vz8zqaYKnHHNTILI0AMsxOKjH2mI1g7xvfTH/iZaVa5oMVp
 3WlyQu0bcgwMaR7+sekPUCDJbD+lhBSq81DcUGsVL6RWS8H/wtJDpbQL9whnNSGlJhIt
 ruxf0Pm5DsK1Bp2FsNDECkGIb29hZyVRaOFsKzaaUX32mhaRyaB92eKbhZ7QBova7hL1
 /NnriLxEr2vq+xK3WUetih9O4nj79tzyEcpggtzD4+CPVbxruXkG146GPU8dxFNBGWa6
 IJv7XK4AP8Yt4jA3/3krVpIyE975Smedha69Kltz3qpWai5L4npgrO2M0mQOG7xz9EoI
 rKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w7+ye+NFJZe0KDTdmSEjWd232bLjzOA6QxoZpECE5vE=;
 b=2xumSDld6ZgPEk/IzP5R77HYtZ/kYppd44qpgKqyOGfibpNbDMO9qYW4EzCYyBu8SQ
 32imK1wlNtdzj1jyrYi9x4DuzLh4+ZysGetUy5UTJMjUopfswhmR9003XgV3NsANjOMu
 MbvrATzdD8ZJt8RlNKruU+ry0Jz6WtffqY5g81Xj8RJ9XTdXJqW+6wXf2ROz8OY9FaP7
 NZTr3Fz1eA3QWAKrZ97QNprEssxz4lZcBLl5XbR9UDqFXYb8RUXanTqE4gDa2c7HWCvF
 RYH8gC98dxbaYqfzMbDCWJucdUp4KaByjK91WkX1FOdlx3IkK/wLqqCJwjzTIP2F2ZzF
 hXQw==
X-Gm-Message-State: AFqh2kqwEnRMfMcVM/3rUTLlp/Ew89CrxTdOk+rE+4vz0eb0Qx1imekS
 Epwh+6+pibfTsB5DFjoqLwxmbw==
X-Google-Smtp-Source: AMrXdXuJjq5PMyTu9iqoFWihoyYgYyZFAkcj6zfEKVn5d4rAK9OofrKrfAjiW7Q7Rtw9xS9wHTIWdg==
X-Received: by 2002:ac2:5f7b:0:b0:4cb:1dc5:deb1 with SMTP id
 c27-20020ac25f7b000000b004cb1dc5deb1mr1156029lfc.41.1672341561397; 
 Thu, 29 Dec 2022 11:19:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 24/27] drm/msm/dpu: rework plane CSC setting
Date: Thu, 29 Dec 2022 21:18:53 +0200
Message-Id: <20221229191856.3508092-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rework the code flushing CSC settings for the plane. Separate out the
pipe and pipe_cfg as a preparation for r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 45 +++++++++++++----------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c20e0d9fe0ca..fa59ae007de1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -576,29 +576,18 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
 };
 
-static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe, const struct dpu_format *fmt)
 {
-	struct dpu_plane_state *pstate = to_dpu_plane_state(pdpu->base.state);
 	const struct dpu_csc_cfg *csc_ptr;
 
-	if (!pdpu) {
-		DPU_ERROR("invalid plane\n");
-		return NULL;
-	}
-
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		return NULL;
 
-	if (BIT(DPU_SSPP_CSC_10BIT) & pstate->pipe.sspp->cap->features)
+	if (BIT(DPU_SSPP_CSC_10BIT) & pipe->sspp->cap->features)
 		csc_ptr = &dpu_csc10_YUV2RGB_601L;
 	else
 		csc_ptr = &dpu_csc_YUV2RGB_601L;
 
-	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
-			csc_ptr->csc_mv[0],
-			csc_ptr->csc_mv[1],
-			csc_ptr->csc_mv[2]);
-
 	return csc_ptr;
 }
 
@@ -1046,6 +1035,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
+{
+	const struct dpu_format *format = to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
+	const struct dpu_csc_cfg *csc_ptr;
+
+	if (!pipe->sspp || !pipe->sspp->ops.setup_csc)
+		return;
+
+	csc_ptr = _dpu_plane_get_csc(pipe, format);
+	if (!csc_ptr)
+		return;
+
+	DPU_DEBUG_PLANE(pdpu, "using 0x%X 0x%X 0x%X...\n",
+			csc_ptr->csc_mv[0],
+			csc_ptr->csc_mv[1],
+			csc_ptr->csc_mv[2]);
+
+	pipe->sspp->ops.setup_csc(pipe->sspp, csc_ptr);
+
+}
+
 void dpu_plane_flush(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu;
@@ -1069,13 +1079,8 @@ void dpu_plane_flush(struct drm_plane *plane)
 	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
-	else if (pstate->pipe.sspp && pstate->pipe.sspp->ops.setup_csc) {
-		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
-		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
-
-		if (csc_ptr)
-			pstate->pipe.sspp->ops.setup_csc(pstate->pipe.sspp, csc_ptr);
-	}
+	else
+		dpu_plane_flush_csc(pdpu, &pstate->pipe);
 
 	/* flag h/w flush complete */
 	if (plane->state)
-- 
2.39.0

