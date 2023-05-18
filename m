Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6710708B76
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 00:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413DA10E56D;
	Thu, 18 May 2023 22:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD0D10E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 22:22:44 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ac733b813fso28356251fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684448562; x=1687040562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCDBbfuVfyjLnfdqtNrtN3KwOosZ5Z2MXstejskIVng=;
 b=EXWmr7jLSo0sV6iqQv0/C9RUF5QntbsyQUkAvyMQ6n5Ki6k1HYgNGskcWRW5SjRmHI
 hE7KCEc7BLP2gCAKhmloBsI4pLPKefbNYzF4yLTJXGvRzc8tO43ckcaRyZGeoda5pPXa
 iXdeBZ61D2Q//fZ2bDwrF8TT040bvzRy0Amc03/kLRXnLz7FnOziCSo7IAg4Y+VAwnMi
 TDykxSjXwAHR1RtQNTgXbQd7XsurSgC/OUQNYnSjpFG35nkMQ3HRxdomOhBh2bOx2OFw
 m2F23OgE2LKt/hD4M/kwxYLlyE1XQSAVpj3eUtbQ8wtHUyGpP8LZOJIKZyMRMu+9u1Si
 fJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684448562; x=1687040562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCDBbfuVfyjLnfdqtNrtN3KwOosZ5Z2MXstejskIVng=;
 b=KI1biQ9pV4NC8ZkmPCTCCbgNebeuLHKnzWcWa3qxhB4V6p8ktqVySAGxoz59Kt44XP
 HV02tTPNmoHbiXmkd69xqhagoFyzBxLdB4+ECCLvQT3iS+qh1UwgRGiIzZNfdakWNei9
 PbRuw780FpUunfHR3Pjw7NPIU3oBHJ6HXo/TU7HfvJ2qDFz61vrhYsI5he0i/Ztg8G6D
 6eKFZEYvvY6uSIWhMuFlkQtdUg5EljUFFCYwAzaEjSttUiG3etOIeAMvgbPN0ttfSsCR
 wDN4pkCygWZDn+HZz9tVw3YECgWYaaEoZvjNf36gaXVFOTk/LxyCI/894U6qJCrKleN5
 nMqA==
X-Gm-Message-State: AC+VfDyv8mhyN3wJHvs+7Of8ZSISWGVWECi0vlJaVza6BlS0tqXBqpF5
 2+REETz/ocm6Ws+kDUY+wbWC+A==
X-Google-Smtp-Source: ACHHUZ6Es/yTu4PhbWR8drVKV/Oxhw7otV/VCtEmyoNd+P+6td+zlL5DJnL6LrMR2a5G2+b9D9PiZA==
X-Received: by 2002:ac2:5636:0:b0:4eb:1527:e29d with SMTP id
 b22-20020ac25636000000b004eb1527e29dmr144181lff.52.1684448562242; 
 Thu, 18 May 2023 15:22:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 15:22:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 3/9] drm/msm/dpu: fix the condition for (not) applying QoS
 to CURSOR SSPP
Date: Fri, 19 May 2023 01:22:32 +0300
Message-Id: <20230518222238.3815293-4-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_update_pipe() contains code to skip enabling
the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
repurpose DMA SSPP for the cursor planes because they lack the real
CURSOR SSPP. Fix the condition to actually check that the plane is
CURSOR or not.

Reviewed-by: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
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

