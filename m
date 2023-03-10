Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537F6B3332
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276810E923;
	Fri, 10 Mar 2023 00:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458310E904
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i9so4609471lfc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lC959/HwMpiS2uwIlrKavXLY4c7ReN699YonwKpSQeo=;
 b=RRQ1/se19TWT/QVlfHViJmrRMiSBgQZfhTgaY/+8duKkHI2Z6OItz6NqLC5Fo13/ZW
 Qe5byzp4hHYrno4/ox2Pp9Jfebvfquv/zeI6F5djZ+U3tAd6cciquunVjZ/8s5uFZxp0
 /6gjhp1nuVR2q23tw7LNln3nfVkIoQ3S+PVQnVtcSOY/RltRJPn+S85RLw+hH9oymrwl
 ayehTBvASYW6K0+KsDiEObpOrHBGaL2w8ms49wqkrTE0kebUeFhSL23TiMglB971dVFB
 HtvBlBe4nwu+B+JGCmHGoCuyE/kleqPJ8Pow/RQi2WOIaJGPtZ85ZJYu6Mk7rGhOxEci
 YeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lC959/HwMpiS2uwIlrKavXLY4c7ReN699YonwKpSQeo=;
 b=Eb1V3lnv1w4QXLjHz0SVy+Wcnyzg5BjLi4C4ltj/lSH9Ocuu4zhx0IZ3amqQRvJ+Ty
 erxqBDugDzgGbryVnfTlgWBiuq8bdZkZoilbQw5CxqUslQVS6wMWQu4IcSOUBH4Rb+IL
 iHyCwipqzhbjr65PSBrtXYPnCzzd2g1o2c3JTNQZ8T77E2LdGvdDuS19libGkOnt1OdU
 wp6Ikz+HQfsT/bCmOnOUIzstoBj+Xcs19k+JikuxHqWiSL06jwuJ497ckbM9zpwF7kU3
 52ic/kizaLHnkqe243/gP2+TdQHcp1gY+t6Qpm5PTlECGBjV+aDB81p1JsctNARO0qQP
 kqUg==
X-Gm-Message-State: AO0yUKUZ5xtzkVrBFv1QlbfTYPS19RtoCGdlcGT4/g1pxSLQe40SRa++
 yuyUbugKrJkd1Sl9lhKjyy2N7SEFQDIsD475Shc=
X-Google-Smtp-Source: AK7set8rN3zX/reeJEW5k8lVcxs9JRC4tcWA2DXPIP3IUrD8iILatxcQQXysZOo8ST0I0iPfxv9lDw==
X-Received: by 2002:ac2:4473:0:b0:4e1:36a:eda5 with SMTP id
 y19-20020ac24473000000b004e1036aeda5mr6416876lfl.30.1678409829402; 
 Thu, 09 Mar 2023 16:57:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 04/32] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Date: Fri, 10 Mar 2023 02:56:36 +0200
Message-Id: <20230310005704.1332368-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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
2.39.2

