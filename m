Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85866F2AD6
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 22:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52910E0F7;
	Sun, 30 Apr 2023 20:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E430E10E093
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a7ac89b82dso17908301fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888234; x=1685480234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAkR23zkkyf9Wkl6Khyv3JylzpjSXO4fS055r2qRS9Q=;
 b=mIxHzte1vX3IypxGpIbigX6LuADOteUZqYNQSJs0qCH96Tv0Cz6EvyRepuinnBqPqI
 9SHrHBXCmE+ElDzV72a6G902mvzSbwooHRipEKxthm3yay4NNsyYVJN0GKfPHKXnLW+G
 VaH987enQo1v0f9vFab1Il808JCCSk11VZ1PBkPjk20RLpV1n0X9YXoYqElomMNUUtEM
 nwvvXhz0iEebx1CVZNsw1nH3OCM/+mENrbaT5nH3kC1fFw9AVzikjb8/orxv2XX1lB2X
 1Di0En3EAAbQwQCeywSfq1tfD5rtumoyzWgtAebzfunFmRYlA3bNC2bpQlqIpzEdZMW6
 empQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888234; x=1685480234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAkR23zkkyf9Wkl6Khyv3JylzpjSXO4fS055r2qRS9Q=;
 b=SvW5AgmnS+cVEr5EVcbO6z2+m9Koxc7g1BHOTLedQyxFK9ETLBVXV4u7h+DwkDp9Ww
 gHkAB2y61nqc2K3Qy2gOWmA5GJIjlJA7KiVlauGAfVytg3TLepK+aRomEtYgWrRh7M4s
 uYdrjgiGCJLxnXuqiOvwaU4t1QafLCHgSt66T2qbnSFgvM3b9mHbhagwIObY2HgAUTON
 3ioZ+xgVfRXydrO8VmAdOgXuYQQjLf77pAeV817z+E0lDeO0wpQ1SVZklNqlSfD3UX7b
 5ivsgpo3ag7C84maX1UmvKN20FxFV7AAj0c8uJf3CbmbZFyqCCrVjBKKHl/7x6cwamV5
 9DxA==
X-Gm-Message-State: AC+VfDyX5IvetvFppuqbVffuAZWW2gHRPAgDXg2vDuqauGoiV+j270MM
 fEm1HjCO9KVbSRXJeqyb/PPzwg==
X-Google-Smtp-Source: ACHHUZ6vAyR+ERcPrTCegKpt1HG5wG2/iVK6IvYwk5jxNlhDYBKOnYEoffn1m4OjIkRsFAfnrBPP4Q==
X-Received: by 2002:a2e:80c8:0:b0:2a8:ac5c:d8f1 with SMTP id
 r8-20020a2e80c8000000b002a8ac5cd8f1mr2829002ljg.1.1682888234207; 
 Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/9] drm/msm/dpu: fix the condition for (not) applying QoS to
 CURSOR SSPP
Date: Sun, 30 Apr 2023 23:57:04 +0300
Message-Id: <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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
index 43d9fbc0c687..36f6eb71fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1124,7 +1124,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+	if (pipe->sspp->idx == SSPP_CURSOR0 ||
+	    pipe->sspp->idx == SSPP_CURSOR1) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
-- 
2.39.2

