Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83A6F46AB
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05E710E593;
	Tue,  2 May 2023 15:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8DF10E58D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 15:05:39 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2a8b62cfaceso39460861fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 08:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039937; x=1685631937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbDxCYhJmFFSMUEu1mJ+7YqN8UK0VH1yWSuHzujdSQ0=;
 b=dHLXF6BI7TxUfgEiL2W2yLAHWUN690x5s8xpYLCgGo/vddLsBQlRvVpcpycCEwqCfv
 EeW1rQoPc0HLlzS22oiZsYN1CDTTsYfrp9iAIOJYaIfbyOSZ60qxZAjtYkqOfV9agNxo
 Iye6FPHiupKXpoyiFDQE2EjlnFQEq23G2d/cHOv4xbkzXg8cS73bMPF7u7LzHZ0/3PM9
 94ykglw/fissRvPNLl+mFup1JhqjLydweTIfynFET8fYo3ze6UinbD5c3KZjSoWXi5kG
 daauQdDewTW2KLxXuUSMDN5FT2N/N+J4rLa+jU5e0qs5hEzBru9caOZJXTUCTDRFe9oC
 qKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039937; x=1685631937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbDxCYhJmFFSMUEu1mJ+7YqN8UK0VH1yWSuHzujdSQ0=;
 b=K7KKff6rekSr3cbVmR9DRNMDO0pMOYiAoF396rQiPJsImY0cTjn/N4lopFM0/RaA/K
 MRPCgCbk6Cu0tgM+NrInB+Pj/1zPLnfchQmKOJJ7qofPCvlsxV8WSMYdexbYHkt66KJV
 ap+MxBgEsN1iHMW515C954jx4L261lWWxmCycnkIrb0hnmAYTuaslULESRDpxJJ9LEAV
 Rt1PRiNciHsUTyW8iTZa32cz2acI3g65r1w9pJ5LOWDMF6DbeoY8DKnD7Z6ZJgkZcJG9
 ZuvAgh8fpvujvw2b5V3+B38Z070BInPlCV134XZHdE1gasLO1qR2E7pw0iNPlzDpie3E
 ZSOA==
X-Gm-Message-State: AC+VfDzYRvyc7gkVpatdUHH7KNdulnLl98TarqW0vk9o5p+dHm+0ODyR
 576Sc+eDHtI/G8SSJnto6EB+rg==
X-Google-Smtp-Source: ACHHUZ7Om4FznqkWK9yUOG3yRHNlfrVnJEcE9TVriAyOZBUkrGycW30H5eYJs+BhnCKtCl2w8FTuIw==
X-Received: by 2002:a2e:7003:0:b0:2ab:24f:c3c1 with SMTP id
 l3-20020a2e7003000000b002ab024fc3c1mr4651071ljc.46.1683039937329; 
 Tue, 02 May 2023 08:05:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 3/9] drm/msm/dpu: fix the condition for (not) applying QoS
 to CURSOR SSPP
Date: Tue,  2 May 2023 18:05:27 +0300
Message-Id: <20230502150533.3672840-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
References: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_update_pipe() contains code to skip enabling
the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
repurpose DMA SSPP for the cursor planes because they lack the real
CURSOR SSPP. Fix the condition to actually check that the plane is
CURSOR or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3b210320ea62..b8ed7247a6af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1126,7 +1126,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+	if (pipe->sspp->idx != SSPP_CURSOR0 &&
+	    pipe->sspp->idx != SSPP_CURSOR1) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
-- 
2.39.2

