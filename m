Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FB2801533
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A20810E97A;
	Fri,  1 Dec 2023 21:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7CF10E96A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:19:01 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c9b8aa4fc7so35666591fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465539; x=1702070339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCMvkvY8soAo2vXd/S8Bek2w5hd5WwclA/3CQcGY+Iw=;
 b=ixDRN9cj09asjGQVzlqpyIDftczK6eHC6ZLNLz9IMVhYo0UALOSVThTCwpK/GqGcNi
 NFk9lPbXHPk5EgFf68ULALURLAB6B0qm+JHXa6pKcjO6so7mc3ONyoxWSCZrktE1q7D3
 zEI9fgg63aow2K7a79y8GQfoIJXivZfDLru8tOtI/l//CboErzNaQKgIauN1Rq5xoyok
 IXYxqRQ4n4hploeZWEuatXia6/5zpEeNXebiIFscUICBZcyz3rL8Z6W5vUKoQRhyfR5g
 z1vdHjwSOrKwcfye/iJSz6ndo3UdVeZbzI2zq1GRlHQda0tDuizwLV6BG6gv+WbNlHjS
 P3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465539; x=1702070339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCMvkvY8soAo2vXd/S8Bek2w5hd5WwclA/3CQcGY+Iw=;
 b=gY1pvAf6P3clvH5GjduWRFP3vZfzDB4Yq0ntxESGiFSc/LNkWmDZ1erKHoUlgf/X1b
 PfNmnkdSFazRcv8agb89BXSTPmmgKeq4o/ajZEK3FJSgFCHWRK3O1ghSJxm5/SZ5LZAc
 0BkG5BqgyDlSQSP93LmHxrXtKNYlG8ldYhri7FlMExAM1XZKPCk6VBAW5+kiiv2OGMer
 q0zpJyMluPFFFa5WLhpmxP6GnpoxWYBqis1/6Gzfv8FwqBDSi5n+z9zg7HnPFrLeJwpw
 NPc9TkLEtoMq+jy+CCO8jghSENOal0BWUv/TnrMozqwxzSevlKGKP/IGkn5DCuNHXxRF
 WZvA==
X-Gm-Message-State: AOJu0Ywo4Ohn3JTtgCdNRcyxkgvKqS4l7F715t0x7oUX/n2FzLslVQzV
 toJOJNDp++lKRkVgZjc4uPdfpv5vYDkN0Cg/MMc=
X-Google-Smtp-Source: AGHT+IFro+SwRHo7Nn8XoqVBAdlF1asAkKLbl397/lSbMSfEFyf1tsXIISs/xqZJaALEmo5RqOKZVg==
X-Received: by 2002:a2e:700b:0:b0:2c9:bcb7:5e33 with SMTP id
 l11-20020a2e700b000000b002c9bcb75e33mr1296843ljc.44.1701465539368; 
 Fri, 01 Dec 2023 13:18:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
Date: Sat,  2 Dec 2023 00:18:42 +0300
Message-Id: <20231201211845.1026967-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
This removes the need to perform any actions on CRTC destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++-----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3c475f8042b0..a798c10036e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void dpu_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	if (!crtc)
-		return;
-
-	drm_crtc_cleanup(crtc);
-	kfree(dpu_crtc);
-}
-
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1435,7 +1424,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = dpu_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
@@ -1469,9 +1457,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct dpu_crtc *dpu_crtc;
 	int i, ret;
 
-	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
-	if (!dpu_crtc)
-		return ERR_PTR(-ENOMEM);
+	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
+					       plane, cursor,
+					       &dpu_crtc_funcs,
+					       NULL);
+
+	if (IS_ERR(dpu_crtc))
+		return ERR_CAST(dpu_crtc);
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
@@ -1491,9 +1483,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				dpu_crtc_frame_event_work);
 	}
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
-				NULL);
-
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
 	if (dpu_kms->catalog->dspp_count)
-- 
2.39.2

