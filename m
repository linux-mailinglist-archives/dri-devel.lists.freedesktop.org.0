Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B86B99BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2888D10EAC6;
	Tue, 14 Mar 2023 15:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837B10EAB6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:36:08 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id g18so16472752ljl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=etSSu2orcHYcj00YrL1N1JUxBF+cUdBAhFMPMt1pKkhVy5EFWJVLYuxQeQ7EIIE2A1
 Q0kxgLHduENRm0SAo5mL0YK/yPzzfaL4czehJpZUdPi9oHI8d2EkrMRWJkj0Dvq9BDfu
 IJGDZ6wB2Y6stUCL0hlVy5KP+nrlnIx6QT3rnTtpCfZwWfXOlqydKgJP7otgiZwaNOwI
 vwXGCScDoh9PFWwRAQP20K/HlJ05KoshchjdoqKTbjnk8bZqzygFsaBSntfMruuk2L5k
 2Hu/GehfqTSlWn8AcyBndSnDL4W0kyGVUWU/2x1yCmHecIx4asXjBp3gWQvN4Nipj4gb
 yUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
 b=cHo8YWnKO9G7kPsGOKdgyB9tKiXjtgp77E0djQ2lPzi+SaBIe8V9QkwNaQ6hRCM8Xr
 T4zqUw3FmRU2O70fjXEmlVDL/AarOnq/VY4TmYEK0mbtA/s9zOSImbXHBvbGJNPCGvgO
 h+1fClHPKsQ7qwU44MndlFotIF7Rst7P1eawUqG2lSkef13U1HpEZial8Tgd52deB/yU
 dOWg1g435ZEYFczqhs9pVK4LP6TWre7+8Sj2uqc4l8eahZYefnz7S3aqW3umq81h0oG6
 svqqwD0RjdPVNPU+iUvtDisheNy6W+il7q44mPHjKGtSXDMfp/WvEn0UevPwgTSuPo+L
 lzeA==
X-Gm-Message-State: AO0yUKWPppFJ8NnfKGi4RTxgQ6D3IIbdoNhc5Z/mWylTRuE0ZMUgHket
 SI5jCsiFHC6F466qlwKb/ZWmSw==
X-Google-Smtp-Source: AK7set9hINwwmK44/ShtL9sE5Oy8+rdHptMNXVBob1NItm8gVzDrNmHOD9bZjvEBlG60rnvbjfUuWg==
X-Received: by 2002:a2e:a443:0:b0:295:9517:b98f with SMTP id
 v3-20020a2ea443000000b002959517b98fmr3993358ljn.15.1678808168458; 
 Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 31/32] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Date: Tue, 14 Mar 2023 18:35:44 +0300
Message-Id: <20230314153545.3442879-32-dmitry.baryshkov@linaro.org>
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

