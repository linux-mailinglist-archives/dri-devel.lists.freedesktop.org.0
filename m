Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD5801532
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D83710E975;
	Fri,  1 Dec 2023 21:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7710E82A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:18:57 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9d63d28b1so16930061fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465535; x=1702070335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1H+676xg8CDVHNjQH5/jgpk8ey6NbauW7LP0KObo83c=;
 b=kijgw7yeCOlwJBuSiAvOWB8m7iZ2saW09P+bCOGgsmo75kGZ9BPYZBY2huZWXohe9X
 EuodtY07HwaMDeQ4Ep/iV28T4AKIUgntClvDxoZQ6Nj979vfqLhsoB4eF+IJDKQ3IMkb
 4J++QQrVxJQrJuJ/7+lB38fL8xrgAAy6IUuEjDjf54nJYFtGNSOoiWB4ixDACrcXHNvt
 l3mV3wjZ1PAu6kP/EvL2/YEfdrT1RR0v0F4yqa2pktt84f8agfFViVPTtuvR1jxi+dkn
 i9mrokyv9Q/CZo4N6kdKsSABPymVfWYb0BPkl2XmMZYp72jYRIeNPOH7tYyAvW4J2NIg
 /E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465535; x=1702070335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1H+676xg8CDVHNjQH5/jgpk8ey6NbauW7LP0KObo83c=;
 b=hp0Qfp7aaM+OQCuWETIoO3c+X2bHJ1HIGPQpThVDmFhcPIooyfBZ0lk4ufHFs8R0xP
 OrvmwGT83iqaTRWlm3Fz5YNPF97PxwNYmHYgOzMqXLESAScX0loVkOUrd7UsPYNTsdR0
 7VqxzJZGcX3Be4KdbT0cnpT+EkT+SPJuU7Y9nfaC2GRN+b4kWcIA8oag4rjHOeAnZfXR
 0+/13ZcO+yImKsL3j0HOCyCd59mGEvn9WE+KEFT2APEpwczFw1z1il46qsLpN2vvtIjV
 FaDifKez/0L7byHly0oa6utoMjem23a4iXanuKrb3DJkChQg2wwo1lX2/3yS0SvQWkqm
 rqLQ==
X-Gm-Message-State: AOJu0YzUMH3fAYJASMOYc/V2bugu87saAEjjpCj+vXMK2Bb7P1yHeBw0
 953q4rRD/INVlYm/aXfeJ2yw3A==
X-Google-Smtp-Source: AGHT+IGGkNLkCVz41AmhhsapBXbFIcu0JAr3c6bUqYz1hD7m28Yg9UFmCiGwD/ZlhDF50JrpIcXkmA==
X-Received: by 2002:a2e:5358:0:b0:2c9:980f:3f5a with SMTP id
 t24-20020a2e5358000000b002c9980f3f5amr1121148ljd.3.1701465535618; 
 Fri, 01 Dec 2023 13:18:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date: Sat,  2 Dec 2023 00:18:39 +0300
Message-Id: <20231201211845.1026967-8-dmitry.baryshkov@linaro.org>
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3eef5e025e12..20908f3d8f81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1227,8 +1225,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1488,8 +1484,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

