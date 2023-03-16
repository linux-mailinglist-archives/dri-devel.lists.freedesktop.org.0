Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446496BD53E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBB010E109;
	Thu, 16 Mar 2023 16:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621510ED5D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:17:23 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by8so1051045ljb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=jNU/xGV9uFB/izDACusfDEwcNAs//JOmcKkU+1XUa/tJ9JSfBqcNSM54kembMZQt9J
 O0lxUthyLlkmc6ph4a6/k1ixxasfKAWhdFMQcPnxxCmkPowETYZJ7Y8lVOrQ8CzSYU/y
 nLNPS9e1E62uVKFhN3D7YySqdfG3gwSBLezJiTE7FB5Xc6qdJJ1agpg7eRLTvYdrYV91
 e9tydZynNfYdmZIlAINmfrPMQJAtFBzpKRoHjhfV9lVwFAH0lh3QcYLC03NRvJRTUgI1
 5zvJ1BgSbtNo1+ZDG+3X53+8REedDSlGxEZl/kmmxBooD9pUxleAkbaAAp4UoAyWP/iV
 4WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=AzkzIJdQAAwWNr/uy1GnNx1nTiZ9qjgh4EjnxUWlGlZT2bUUnYY9Yg82O5Au237B8r
 IDKfIo8TzViT81Uusoq4sNYTjlly0Sl5gBukRjl5bhn3Dz0Y6neuPKICI1z7pmSqAxZQ
 bTr8sE4KZEMxG5jrecLUXAAsmb1df9EOOLd81OBURQuul2sh1+Sle6UJ0vz3kEDa4V5E
 M5XHif8l0oKQ9FLmSUPP5MEh6VU2bgRsg1SH3rTy0ETAgUVooc0z6UxHQRf9owyLa4q/
 LR9K0RVTDDI/QcS0h3PW+vQ0fl31W3dZMFiQ/+RYfv87cjZCxSZLq4Q4Ab7iS+z6y3o8
 wbsg==
X-Gm-Message-State: AO0yUKVQ5iPToWptaTyli+mItWriX1ipRiYALJEXu73Za8LOm/cQQwRf
 FtBUUlsmLATpPc+/EV9FedQ4IQ==
X-Google-Smtp-Source: AK7set+Z9ralPl6qxNa5CnY/JfCfIOiHvv3XY/6IXx5joRaQH3Lp0PfDadsn8VO3PrpLeZSJI6PUwQ==
X-Received: by 2002:a05:651c:b10:b0:298:9c6c:eca7 with SMTP id
 b16-20020a05651c0b1000b002989c6ceca7mr3059751ljr.8.1678983443015; 
 Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:17:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 31/32] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Date: Thu, 16 Mar 2023 19:16:52 +0300
Message-Id: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
as it will give the complete information of the sw_pipe as well.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90b406e409d3..508e5b950e52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				   format->base.pixel_format,
 				   modifier);
 
-	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
 			 crtc->base.id,
 			 stage,
 			 plane->base.id,
 			 sspp_idx - SSPP_NONE,
-			 state->fb ? state->fb->base.id : -1);
+			 state->fb ? state->fb->base.id : -1,
+			 pipe->multirect_index);
 
 	stage_cfg->stage[stage][stage_idx] = sspp_idx;
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
-- 
2.30.2

