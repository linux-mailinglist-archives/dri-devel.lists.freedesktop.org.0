Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA968A1E2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5B10E88C;
	Fri,  3 Feb 2023 18:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B187110E87E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:22:02 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cw4so5964030edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+V2EMdQof4v88Y5JoApKZdGRN1B/DjsLARxj9HabJ8=;
 b=MvTqtYfa0jq65VfUIxj1Lh58GxuCI5ONsBiG13KgDZlV4Lize482DEoamwn4P7dUXw
 bnJP3JKcpvwNgJGkryRnZBFNMlEyHmiKdlsTQIntPb0fOZJWRmCoIiG6Wq/ouzU0leJs
 OC/iMLu5QEEWqF+IRPcobmTtA6pZpnnDw2YapyQozpJExWNslsJdIy2WQgbNhX7GM/o2
 U0RMKjkFw8k0IaT/lju2ZgS4ON8QgOqVEeXkcNDm3cbT7YkUM2NuSlnvyMV6m1vVJEZo
 omM/gbdwrwsLta5AxBScwjFk8CPyeGK0kSnxPPE1rpEoAenYlfevby7B92Sla7X74F4p
 7adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+V2EMdQof4v88Y5JoApKZdGRN1B/DjsLARxj9HabJ8=;
 b=zJ1K4LXfAdPvwcDNPnZrLT+v4sFluFBuBPdh//Uvm6ZnFgVgSHrx/8fkHcWi0utUka
 n3HHP/K647C8S3D72ebrzRkJQZXrcQmomHriJNljSUe1oiZ6+nMQ1PpN6j7EeNI7Lz8w
 SadM+/D8Nv5XU4w6HA9yE0d9E+DpWrgvZiNpNbWa8hjWamgniLG+e/1hr2HAEJhXNEC1
 ey/FQfhTmTETnGL/FkTB0rlOEy0cJuXbWMh2+JiQ7rysaA9QSoGJR05o7AlPFWT/VTMb
 mufJL0ff8ODCJ29z/RxoOM4/ATN+cHeVQFfzUO8/FMSyWjbkSGUt0gk9io2u1Z7cW+tE
 fsWA==
X-Gm-Message-State: AO0yUKWewTcTnLkNyTe1CmElJkZeMi1otCdHEeEiV6pwf+Io7y7UWRHJ
 MlPfbSKVJgGXV7BnBNabEfaGvA==
X-Google-Smtp-Source: AK7set/zAk0nyiZTnY0vHfM3dFWOlhAYzGNo1pOCPZFColvcJs6TDsOhu8JS4mzPo2XpI1WBEg+qMA==
X-Received: by 2002:a05:6402:448c:b0:4a0:e31a:434 with SMTP id
 er12-20020a056402448c00b004a0e31a0434mr11328895edb.27.1675448521219; 
 Fri, 03 Feb 2023 10:22:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:22:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 24/27] drm/msm/dpu: rework plane CSC setting
Date: Fri,  3 Feb 2023 20:21:29 +0200
Message-Id: <20230203182132.1307834-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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
index e69499490d39..05047192cb37 100644
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
 
@@ -1049,6 +1038,27 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1072,13 +1082,8 @@ void dpu_plane_flush(struct drm_plane *plane)
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
2.39.1

