Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB368A1A6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186C110E866;
	Fri,  3 Feb 2023 18:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4144610E856
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qw12so17740048ejc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rQoUxlZIKrNqSYA6V01oRtFvOVcUv2n8owGbLqkJwk=;
 b=k5IPQ9k2Cp43Zzxjp5pwQ6Zl5eU9uE6o+W9d9g8vmcbiFutMdNnhME+CTK0GsqckmZ
 uyZMtVdN8MvhPWMgwNkRUGysmkoCmSyGIYJBLiMg8RFJ6FT3HeMJ4nKYNHfwPLCnSBTS
 vfsCBdVxq0gCJPXHqOFKi4tGQR0KZyXcjTe5VnrPopoOpIAUgaRKp6x+faRXoPviOnVX
 +ltRvrF4UcTXSNqar+7LBvj3lUp4/VUPBibSAD4wa+NoZoVDwH6d9IbIQxEx76ag/rHn
 bLEgUOg0KeoO3PxSR5fTGewyYWLjET9C9qcvxdQpXAqbWDCJbwEarFaQ/OQm1LSzYtT5
 o3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rQoUxlZIKrNqSYA6V01oRtFvOVcUv2n8owGbLqkJwk=;
 b=XNODG8GP1141TszSztK/QlU530RDsyqEEFn02XsFfbT1GaVecxAEtnheMCRBftyG19
 uC1U12IXgdDyr4jZYL4W5yx6mWf3uKz8tnZbNXQaayRVQZVffjDjmOJ8Y7+z4X4mf3ZX
 iTHmhViJmJrn4sz5eUMh4NJlJPpIOSkzagbfpaTPqv+dGKzLHVVgHy5oy6R5IgZzVhb3
 aITz++hiJ/g+ws5HkX73qiHHkuOLTZnBEYs8EXecn4/cR+m3DL+YzUk/X+HdiLj5DADL
 bZ9XJwxszfXSdeG7hxPshB+R7+KRZQXj+MOuXmbH1tYWC2eWGZBkuXk5/xYFfxzMncJk
 dQuA==
X-Gm-Message-State: AO0yUKUsSwA2sx10wUPgO54HnpYtyk5T4xOTzxa+51Pbdw4xZO/DcxOi
 Nmk+9m66eoXmgzh4IfNcQi1zfg==
X-Google-Smtp-Source: AK7set8pdr/WJa4ZLscC+iBKaY0wtJ9G/d9us4V308/r3G84Kj9x7ytE5QsTVOeoawFJEZOilwXDgA==
X-Received: by 2002:a17:906:cccc:b0:886:fcbf:a1e5 with SMTP id
 ot12-20020a170906cccc00b00886fcbfa1e5mr11110581ejb.59.1675448498829; 
 Fri, 03 Feb 2023 10:21:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 04/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Date: Fri,  3 Feb 2023 20:21:09 +0200
Message-Id: <20230203182132.1307834-5-dmitry.baryshkov@linaro.org>
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
2.39.1

