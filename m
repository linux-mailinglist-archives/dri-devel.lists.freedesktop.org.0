Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8035659102
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC7010E228;
	Thu, 29 Dec 2022 19:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B7B10E228
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id cf42so28761007lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnhtYL/XQh1nJXsu1H+29shic9ChUEXdN4d56587xoI=;
 b=uZixQRHjio2ZX/MBXwsmrkxJ5DwGGs5wUZvqGRD3tqRgf259XGJV06+jm76MVyJFOG
 uusaget1p0Ne715SC0af6+oyVaET1fXrV8gtjFaYO8ROvb9Say8vrj4FiOoIJ489hoT9
 tReVP+RIbBZKaJb4V+RokJ7Tsx4Gqqk1s6Z++NADOOgn+blh4fklQbFc0L4TiTuT88Y8
 U5AkYLnho15vkblWMVAK4JfE3HbUswLi96n2eSHAW5xpCjKy9YtzRDGbgS9dJ0d3qeys
 aIh1zNYcrLfaubJaEtpp1yZtbo3+SSpheZzEr0a71G3Mtb5xuNS4WOdK7EB/H5NgqSyy
 6Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VnhtYL/XQh1nJXsu1H+29shic9ChUEXdN4d56587xoI=;
 b=IjSvmHC8VWoV4z87oaHyzZ61THq5pk6PQfwVT9pPAAkyDGxNZ0pfkp6i+I/oXiRfaz
 ub/K9G3HOFtsQAJYzI+Hww9QxXL7mJ2AbxIwjm5L0bho46UA0xn/8YK/E+GZlfPAkRUF
 rQBaZXtj/Z/NMFnyCopVQmIg1ncsu3lJHrbk1i0gdI9ew46JsfltSdRo2xSinoRGjsEh
 2VGM+59qnz3i1BZfSdVHz9/vWC/ZX5BU2bdkixPdKcZeVEJABv5QNuTlSeHhSHvDetPV
 xAwt6XzdrlWL5spb/Vj0UMR1n+gapZNvOeBVHSSdwQHAhOW/4151lOCO9d3/Do5zEQn5
 s9/A==
X-Gm-Message-State: AFqh2kpzvtI7udBK7tGjN7qAe6r9jkjQEoYQg6Q2XGEX0ZY6RIk8mYhr
 XyEFe5QqykFKLdiEgzxPj//WDQ==
X-Google-Smtp-Source: AMrXdXsR1Gzb7o6x/qwidho1/o4YPb4ORhhJl/mCiEE8vPpBpKe1hK+YyEcCT/Xp0K2cI6kkraw1dA==
X-Received: by 2002:a05:6512:74:b0:4ca:fe23:7677 with SMTP id
 i20-20020a056512007400b004cafe237677mr5275661lfo.43.1672341544047; 
 Thu, 29 Dec 2022 11:19:04 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Date: Thu, 29 Dec 2022 21:18:34 +0200
Message-Id: <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
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

The pipe's layout is not cached, corresponding data structure is zeroed
out each time in the dpu_plane_sspp_atomic_update(), right before the
call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().

Drop plane_addr comparison against previous layout and corresponding
EAGAIN handling.

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
index cdde7b9ec882..43fb8e00ada6 100644
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
2.39.0

