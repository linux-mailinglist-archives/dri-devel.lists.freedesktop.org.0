Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B5474B9F4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9107810E629;
	Fri,  7 Jul 2023 23:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4416210E61F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:13:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso3813789e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771578; x=1691363578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=ds616ByPYtKnHjCWMMUBNDEWOUeYZK4aGfrF/YufqwbAkGs7+bDBd+U3dyk5DFb/dK
 pdEuto/fBq53Ak7RjSdwvoA1p/aVwQxjZ3mUv+XlQ+azpBcFuELXcipGNLBegmQFjqnV
 K1WmS1Z30vauiIUovIcUWq1lmtqZi8BUeXqHU1ZhM0fRI/iXq/dlDOrx0HzojS4ziw+m
 oS4RNy/IR1hUAILZUzj56IB3Kdycod8F99/f6xK+vZyru7iDqe+9i9j2gCkO8engqx65
 30rLr2Evr25Tpjv6uB5A8eq2v/gp8gJyHr2MDJfc5mFKXSgCXC9HugQwTMflCvWdlWIW
 Unzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771578; x=1691363578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yioIe+uTAjNaWqFB/KksKTj56LTjkm6FaSe/0rqQ0vE=;
 b=XDP1HC2JYuESvRQe0ZzMLzpvBzsJ3XR2kXZPsDTXgSuQT25amhxayrzn6e9LttOexY
 OqOnBHeLPg5r/lfu8of0gK1b9RkKifOX/LacARrBpCU+ZAP1Ez2DHLZmx10+cNBXWB7J
 gd8eznK72U0jpPFtGEc9Gs4NUa+GlKhu3vfeYy80n8ylvYS+p7NjU3Xk+kmnTASrvM6H
 ZCToNoYnwl1V2oKiaLRXlTMJmrVyIMRbgDx7VXu8ekSXruzjxge1oHtpNyXN3q306m8n
 A9R/yjoMojNAA2IdAfz8AQj32Qk7Fiyb/532lYthvvXpWHs4N3+wy7JMVMpbU7dENAri
 J5QQ==
X-Gm-Message-State: ABy/qLZxYAWNAoQw6uIGV3YmTqvNNuxBUs9/OiZoHq8zBl/6tIUJj44u
 L5mW1NYO79+XJXglErY6tGiQ5CzqVWP5b6tPRuQ=
X-Google-Smtp-Source: APBJJlEJ7qmgow2NSUc4iela6lVkpDGnn1Pno1NXC3MOU+/RUas42zLNbdlMacZTQUbN5aQW1ETqdg==
X-Received: by 2002:a19:ca5b:0:b0:4f9:5ca5:af23 with SMTP id
 h27-20020a19ca5b000000b004f95ca5af23mr4391916lfj.9.1688771578422; 
 Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date: Sat,  8 Jul 2023 02:12:46 +0300
Message-Id: <20230707231251.3849701-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
References: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

There is little point in disabling QoS on plane destruction: it happens
during DPU device destruction process, after which there will be no
running planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index aba5185e1d66..f114efee1b57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1173,17 +1173,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
-
-		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-- 
2.39.2

