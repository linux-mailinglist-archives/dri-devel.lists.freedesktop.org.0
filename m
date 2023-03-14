Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF86B9992
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06110EA9B;
	Tue, 14 Mar 2023 15:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CBE10E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id i20so16423399lja.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=demNi9tY5y1rcHkWi3Rdcd6GdqUqaXSgbS47QqrmYDw=;
 b=nUvr0P7d/LVi575KjvQnzMqgnxYrsKxdbM4uVBEFiUSVUJzncfEzNYA3T68qc3zFx0
 zBylrxHHGqrkbkhHnCByNUED9QdbqNBePUbms9N5HUayDDlXqdnQC8rdwSPqTuCxziiq
 hHyGY+UV5jburwc4eVeMXg/1QvOfr+1xw+FLVLqyhsUGXE9x5WVgX+45Hd/C3ypdwidk
 4PT9D6g2mO1ddyKIUIEuHXZ1xHTAaJLTSlDYtBkJQBo4+XF/yAHseKCsinCLUkrAy8+e
 4wfqU4+ZjXEExtRCwMHzSFqLMrISZMez1wPCAAvXWg01wjGlt0Aj1qlgzN1XPJRonFAf
 i+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=demNi9tY5y1rcHkWi3Rdcd6GdqUqaXSgbS47QqrmYDw=;
 b=e0icIDE3kboy+msELjmXgWLiee7eiKhZC2Tdm6/GzAj7k2IiUAbQNNDLD+DTY2FapX
 W/t6s7zLgY7smVFxudLCUZ3I/QPOm9diz24+4p/ephirv4YSOSyjqbnd4wb+RFPr7UmM
 P3fB7GLnmViXg7dtCuv77yPLKQtPaF8pPZl9RGHE8M5BRSJT23RgORUnRriKv+yuquIO
 XE5lnBBCVc5JO9lTIFsE+R0wzKtk4glLevSCHs2BlfLpdgocUJghOeQu5UCwuU5qxXc1
 tDEtO/ORE47n+DhjekHEANDpN8/stVON2+jmDYLpoyIsm/3fMz2ZYxEgsNQXR5RsSlK/
 reiw==
X-Gm-Message-State: AO0yUKWoIR+d3BOuSiFx7UXmT4xbI65FjmNmoDPpSmXPi+q4kZmBHo05
 sQOIKI2APfYvwTqvInUboVJh2Q==
X-Google-Smtp-Source: AK7set+y/LQFDBwhtv1fMYkhSiPbToBHbFyzweRpHLfqV7qRT2hCubGz9Ag7usJPySn7h5SWnbdb7A==
X-Received: by 2002:a05:651c:301:b0:295:9d32:a195 with SMTP id
 a1-20020a05651c030100b002959d32a195mr10165678ljp.32.1678808149178; 
 Tue, 14 Mar 2023 08:35:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 04/32] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Date: Tue, 14 Mar 2023 18:35:17 +0300
Message-Id: <20230314153545.3442879-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

