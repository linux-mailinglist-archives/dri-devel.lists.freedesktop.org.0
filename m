Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ACB6BD514
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06E610ED5D;
	Thu, 16 Mar 2023 16:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADB510ED5C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:17 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l22so2245693ljc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TaRoPHAJb6uvqmc6bJaPKq4I2jrnswwYiczEXZzxng=;
 b=eWbgc8oOxsiMQAC5GjSTT3gnaLZMUbO/5qkGPRRKwkyeAYQNPya6Xbof5LaSA6hzr5
 RRULiAIrzcJFMNaxF32ex28QCo5CWDv9eduKnKu46oxGDNuxIWs+ejdEv3QGPBLrZgEa
 ndrQA7svMKE4GW9J83dRNaCmee/6v7CyBFadXS8Czq3URz+quPUMzI1W6dFeTsOcTg7c
 MUgqWcTsy7t+diW28u+jqsFYQetxw/TMQ3I2Ek+xLIYRgsNpaYmYOsTTEeqtQ8XoP5CO
 04YHt25OnyCz4pUQABNW95hbFjBGcv/vcFJ7AUg7kbgUmgAYVI3M9y7ZWKog7BM4Uucv
 rgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TaRoPHAJb6uvqmc6bJaPKq4I2jrnswwYiczEXZzxng=;
 b=iGT6gxy7OaVyErFIGTa26+L7A4o7lRnAoaCiyKJRvNDXZ8jIq/8rFmmLHnHlBK6hOT
 V5KeJ40XLG3E8L6N4AHKM1ZrjnzO/iNWYcET2KZ84FUYDveu+RnI3Xx+LTmpWJfFeAzK
 f78wNMnjSfJehiSBB0++X0weMyDnvfdleDOFF+qHRSd88NWFIcH8ext9kJ+42lJ3XXrI
 b8JpKB1V2PexXiBJGfHQubR4bCqzJvhwJ/v6Tp5qM/I9cfrnBiIK+j9sTRulwjFCFBDX
 HPOZcgQJu/0v9rY49jXga7HRoXGUAJVu+ptk1c74tZcylM5MpWd8bxmL1Q8zihlUd03i
 jHYg==
X-Gm-Message-State: AO0yUKXOFkfF/o75JHnPoNxB6gOrrmYmwUrHJpDaOWoi3iHUime4fyXS
 kBrFkCdoKNWK6LZsnyM7gJm2vA==
X-Google-Smtp-Source: AK7set/jBMJ6Qi9ftzqhlR+OG+TESmse1HtFpSDNstCXIfaCA2TlZKSaqWtcn4merzQOJqR/V9yQYA==
X-Received: by 2002:a05:651c:2120:b0:293:806:dd74 with SMTP id
 a32-20020a05651c212000b002930806dd74mr3142313ljq.46.1678983436598; 
 Thu, 16 Mar 2023 09:17:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 24/32] drm/msm/dpu: rework plane CSC setting
Date: Thu, 16 Mar 2023 19:16:45 +0300
Message-Id: <20230316161653.4106395-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 47 +++++++++++++----------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 61994d1fff36..6031d270992f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -576,29 +576,19 @@ static const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L = {
 	{ 0x00, 0x3ff, 0x00, 0x3ff, 0x00, 0x3ff,},
 };
 
-static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_plane *pdpu, const struct dpu_format *fmt)
+static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
+						    const struct dpu_format *fmt)
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
 
@@ -1051,6 +1041,28 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
+{
+	const struct dpu_format *format =
+		to_dpu_format(msm_framebuffer_format(pdpu->base.state->fb));
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
@@ -1074,13 +1086,8 @@ void dpu_plane_flush(struct drm_plane *plane)
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
2.30.2

