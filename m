Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EC6A980D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7410E62F;
	Fri,  3 Mar 2023 12:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269210E61E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:43 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id by8so2221040ljb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cIm/0z4uakYwk8DqVtGOalOBhV15uK0Kl6P7N2VAA4Y=;
 b=EfQMV8UUlz1E2nSIfNgelSa1jw/HU3iUNkS4R/La8ny0bRzoqxl7hESPxI4U1Ta+xb
 IrHbdNlt72JrNvKAyirnVIfogBIB2XR8Lcexz+XxiNAhICXWAOLBBNX26yW40bO65WC7
 cMww4K9KEN6BCiZjZRnA364bKrHpe5eQdQelw6UiqtYdreaQ9MJgFM7PrZ0LYOgAX+VG
 K4Pz4o0BRkPr7YNdudwVjSfbri+wihkqZumKqBa1Nktx2imrlg97euhyhk3BiYvXqrfW
 Pey+UPF02Ebn5r+I9kH9pd/TyQjXhNA8XIH3fhJrYJN9NPXCxdhx96/zslcv2TKq+ic1
 YtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cIm/0z4uakYwk8DqVtGOalOBhV15uK0Kl6P7N2VAA4Y=;
 b=uG2LXo5jH9gO53n7Gxi2eZAHGOP9eRGwDjc8STHwshrvN+YrU60gaV3oI8fbt+jOtq
 pRX60+P4JFZTiom9MHAK0p571nbDJ/0MOpDaYf9u5ae5sAOdZoYuVQx3CNA7/YDQZ3o6
 Dm9zHDjNYdOJzGJbZhKpGh1uZfZUCt0I6+8nSNJr3UldvCnqR5Q8urLxZc6xjki01dsD
 qd0Te8g+8JsJxC/DxeT/M/ZuYYKzPPng6NfnIh8jJ+02Pp1Rxj16E1wcS5+xX+Kf0+cA
 CexRij9SOklHqukw1sO32FNU5jnIua1rg7jairvZ715MykvMw9uzyw6AMQ8+Qo61slRC
 gizQ==
X-Gm-Message-State: AO0yUKVbs5qke+b4Qn3DwUNypT8wFuGt3LN2le786QBHw4yMUJKRopwG
 PaUXdceC5Yb5mLakPcoe2T0dkQ==
X-Google-Smtp-Source: AK7set9ew4DjYMX0P6KtCwLvAhN8q+sOj2yiIbyKHr1EmnI5FpEM4t0CC0Td6ijS2EyGCXDOpM1qFg==
X-Received: by 2002:a2e:b0e2:0:b0:295:d31b:59d1 with SMTP id
 h2-20020a2eb0e2000000b00295d31b59d1mr1345867ljl.13.1677848262213; 
 Fri, 03 Mar 2023 04:57:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 24/30] drm/msm/dpu: rework plane CSC setting
Date: Fri,  3 Mar 2023 14:57:19 +0200
Message-Id: <20230303125725.3695011-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 47 +++++++++++++----------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5f8c71a6093f..c637713e23c7 100644
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
 
@@ -1050,6 +1040,28 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1073,13 +1085,8 @@ void dpu_plane_flush(struct drm_plane *plane)
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
2.39.2

