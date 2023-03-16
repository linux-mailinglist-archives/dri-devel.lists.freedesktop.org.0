Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B496BD4F9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0010ED49;
	Thu, 16 Mar 2023 16:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D5310E22E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:16:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h9so2276165ljq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WP9F8WZEa+lu+2gswY1sKFv2ZSgjOdHWDAbj8Hk/k3w=;
 b=M/tU81q5ARE2JsnQhnYxNwgQjp079RtwKnJKR32+ZZXwntyCwcoR65HJqM4j0VkIF7
 AtXOU+LbotqSt2ZJQq9H0Jug9o/Pe5dHDFcoE1mBeauxBDDiAaZxaL0bza21LEl7yu5J
 3ek35Ia60rCF/mbVEQYDdQH+sDkViyEVpNlfkuNdfVoXsh317JkrcmU1/f8Sc+k4x1aG
 xLEZXrxQ9Rm5ft4SsA/3Y7QTfmxsMEpLEqGyTCdJ5BzabYm6vDcM6gWLk2/emo1axHBT
 7Iegs/OrcWsxdLv5YHZw0CHc1slF1gUBAv/xj330OtWWW7qfyTdhc1LCTlpsksp0hYtb
 fo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WP9F8WZEa+lu+2gswY1sKFv2ZSgjOdHWDAbj8Hk/k3w=;
 b=NoFyuVslMuubO52FSUw35q8uMoDJ+mBJC8KFNsWz+8M2d8cI5Mb0HjsJOfAIIKiyO2
 8aDO1izYGabr+Opa9SY/unq5dXB0H3Yfl6dsc1TJfNwBJtc/yJGQpdN3tllxL5fJMEU2
 Eu48X34kivkJxGEFbBF5aSUmyv9SHfImZwmyHECnblcKSiEICeNEe4mpXM5U/QOXHc2I
 a8DQt8wIvkEFyEOaWKP1luG++X68djTBU9Frr63qkfsNQDSGJ5og9ByIM9MrqeXvw3am
 QEp/t0v9TICBSDZtJEvt22VgtKPaYn+6kalLDQ5Kd3KcCuEG9wA39w3Qb2F0qzQt7MQJ
 QXIQ==
X-Gm-Message-State: AO0yUKWX47n8k1TNu2QVq0dVtEPD5ld3RKcbxNmT1qO4SbN2fHgx8LAX
 513L13PGOiHfH+Xcjo2EdSNs2Q==
X-Google-Smtp-Source: AK7set81Iv+nZeLyclIuoyhsGMc+NIB+d9F5/MOHdXCfeZG9t4VNUvHy27Y+7NltZoQknLYYc86d+Q==
X-Received: by 2002:a05:651c:30e:b0:295:9bb9:18c2 with SMTP id
 a14-20020a05651c030e00b002959bb918c2mr2383200ljp.18.1678983418303; 
 Thu, 16 Mar 2023 09:16:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:16:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 04/32] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Date: Thu, 16 Mar 2023 19:16:25 +0300
Message-Id: <20230316161653.4106395-5-dmitry.baryshkov@linaro.org>
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

The pipe's layout is not cached, corresponding data structure is zeroed
out each time in the dpu_plane_sspp_atomic_update(), right before the
call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().

Drop plane_addr comparison against previous layout and corresponding
EAGAIN handling.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 10 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +---
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d95540309d4d..ec1001e10f4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -918,8 +918,7 @@ int dpu_format_populate_layout(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	uint32_t plane_addr[DPU_MAX_PLANES];
-	int i, ret;
+	int ret;
 
 	if (!fb || !layout) {
 		DRM_ERROR("invalid arguments\n");
@@ -940,9 +939,6 @@ int dpu_format_populate_layout(
 	if (ret)
 		return ret;
 
-	for (i = 0; i < DPU_MAX_PLANES; ++i)
-		plane_addr[i] = layout->plane_addr[i];
-
 	/* Populate the addresses given the fb */
 	if (DPU_FORMAT_IS_UBWC(layout->format) ||
 			DPU_FORMAT_IS_TILE(layout->format))
@@ -950,10 +946,6 @@ int dpu_format_populate_layout(
 	else
 		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
 
-	/* check if anything changed */
-	if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
-		ret = -EAGAIN;
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2b0ebdd4c207..d6518ef1beb2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -476,9 +476,7 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
 	int ret;
 
 	ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
-	if (ret == -EAGAIN)
-		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
-	else if (ret)
+	if (ret)
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 	else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
 		trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
-- 
2.30.2

