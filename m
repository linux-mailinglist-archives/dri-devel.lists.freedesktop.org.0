Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA885708B80
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C98210E575;
	Thu, 18 May 2023 22:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4010E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 22:22:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f3a166f8e9so232165e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 15:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684448563; x=1687040563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aATqP5Uzt0bmWsfDgHCPPM/tRvezESjMLLAKziKzACI=;
 b=zKdRLeNhqlnvjtAIJD6T5mE5dUDsmNL6CwtjDVYgVVfy3LKewaiCKSekWNGyI/BUHF
 LRGn9HSxTdioMFxj5S3gVDG1cFzWIhMoQXWYY2PX8TE0cMqG1/dRzW9xAwjQ3eQlzsx1
 hs+gfiIB3sH0h9kftypcgVFd5nj/a4csL9N5e4qOkcwXxYqF5g13x5I7VY7Le54bweaR
 JSqf3xznnXfUW9H4nDgAVsybKAZ6mGgh1KCN6Uj1RFA9y7oxZvvT7+TuPdSxLpp7Ny87
 hud1vPsV1QqRkimJPBnv+3+VPsISNF/3eMbXAputPVcMwpCSrvVZIuyEaO9PPCNPy0ik
 ErkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684448563; x=1687040563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aATqP5Uzt0bmWsfDgHCPPM/tRvezESjMLLAKziKzACI=;
 b=GaXLQBaLAYMpAlrTA31UK/8FuTVdrmZtIRc0XXoWWEVPZeI2keoyb9tV3sjU3c808O
 a6IdDvSRMpdtdeDhTeXz9tlUD7+HVo9AK14ef0Y7W7+i7boP4NXaVPkGxCS1KY/aLG6s
 ZgZ19NBuU9DUA2GU3zpJUA46hsq+u7j81mN9wre4Wl9v/lBwtXurFRSEiHvspSObWoYT
 oqL56cSD0q1UHUHj5KuaUWqPmaaFJ3mIsl6uEp6+ZuEzvgTm7bCqEYjxTNs9gS7bNJio
 pvRbQpFv9FRQzAN2EGPKm5L8VNTn1/K93tjUrbtk0jXffdkrGuGsUENvC4rvl03GODHz
 B6iQ==
X-Gm-Message-State: AC+VfDw4QXzLHpZn6twHnrofcSyZNmFmXwoVLLmhcBIEROIVwxr0WCJV
 DAvkTI5edGpJ5w5LsNs/DwuRKw==
X-Google-Smtp-Source: ACHHUZ7Tfvd/E2lKM83cy3VfJEV1qnnADfiKv6fCrcL2rFEZebaTh70TXb2eFnWxuX9TzpWrrnh1Rg==
X-Received: by 2002:a05:6512:489:b0:4ee:fdd8:a536 with SMTP id
 v9-20020a056512048900b004eefdd8a536mr173237lfq.8.1684448563033; 
 Thu, 18 May 2023 15:22:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 15:22:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 4/9] drm/msm/dpu: rearrange QoS setting code
Date: Fri, 19 May 2023 01:22:33 +0300
Message-Id: <20230518222238.3815293-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>,
 Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Slightly rearrainge code in dpu_plane_sspp_update_pipe() to group
QoS/LUT related functions.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b8ed7247a6af..586f089756fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1079,10 +1079,10 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 		pipe->sspp->ops.setup_sourceaddress(pipe, layout);
 	}
 
-	_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
+		_dpu_plane_set_qos_ctrl(plane, pipe, false, DPU_PLANE_QOS_PANIC_CTRL);
+
 		/* skip remaining processing on color fill */
 		return;
 	}
@@ -1125,12 +1125,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
+	_dpu_plane_set_qos_ctrl(plane, pipe,
+				pipe->sspp->idx != SSPP_CURSOR0 &&
+				pipe->sspp->idx != SSPP_CURSOR1,
+				DPU_PLANE_QOS_PANIC_CTRL);
 
 	if (pipe->sspp->idx != SSPP_CURSOR0 &&
-	    pipe->sspp->idx != SSPP_CURSOR1) {
-		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
+	    pipe->sspp->idx != SSPP_CURSOR1)
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
-	}
 
 	if (pstate->needs_qos_remap)
 		_dpu_plane_set_qos_remap(plane, pipe);
-- 
2.39.2

