Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F806F46BC
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F6610E59D;
	Tue,  2 May 2023 15:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D304410E598
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 15:05:41 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8baeac4d1so39551011fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 08:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039940; x=1685631940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWho3vDBlAyOte9RhNJbwdifZh0HWETRUs9xv+x2glc=;
 b=feteKQydGTacUl6nWs7yJZTVYJeGKpN4v6mOOMqw2v4JQtCDZ4rYBvtDB6rquaaTzN
 pwOYM7GXHCquzF7PhOhXkc8fhlhgpfBl9QesSvtoTBa8dCh/4gaauAa/oMYjmOra+nRx
 IoAMrfqygYAqGtI/0hoJ8r4XLwDFYnmpBDGLobelHMAnnfEq7S0g7qn8T9sliWrWcIHA
 0EShytP+XJTplHJvMFkYMB0pFc2EnLIIEsFtJonVfc05b8cUql3lv55r1xrxMKXXdS1Z
 aOGcff5oO9gUjz5lWD9wTuGjDuwI8d3J9ZiR7Le8fcWBzcw5b97McqZb4IIKcLxZkuAp
 04eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039940; x=1685631940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWho3vDBlAyOte9RhNJbwdifZh0HWETRUs9xv+x2glc=;
 b=TI3aa0Cz7dYWFCvAL8I0PPIhkXuvEmaIEkzvsUZhfbhHJ6MmpgeRgNJOdBRCjjmrOf
 kNIRwbZ4tI196cZasLvHJFdEhoNrhvbLw33EhkTrvBiAwg9runMi8LYFKmtkkAKONI2y
 sG+fgjFb0CD5Tqt/n4B5To4g7uJZyZwNwvcRp7jumpDw0Bnz2r6WEKIJ4ciW4rnWtzmN
 loX6xA0HXiEv3aTHGaAnKk1L8Po9SaS/Oin1x0R6+vTO2HSpih/1Fc/pTNFJvaUZMk9/
 Fa181+MLYQK0Yu3A1tJhvPYFyjuO+WSwO6hhMUTJDdOucUsBF2yRlS7E7iaDUADlLa2i
 un4Q==
X-Gm-Message-State: AC+VfDyCaapQ2DYBHdrwtUcTpCuHu72DK6Cj5rj9JA6A3GIY77pVfbKn
 GzJF/Z34KUaaCjuzGQYGjCrJvA==
X-Google-Smtp-Source: ACHHUZ40BQlWFBVBclg6qpM51dHxNnllTgeO5HZJb1ozBv0BWGimhPWyRqvb25gRNDmrpLZCu/90Hg==
X-Received: by 2002:a2e:80cc:0:b0:2a8:ca1c:12b with SMTP id
 r12-20020a2e80cc000000b002a8ca1c012bmr4568869ljg.17.1683039939152; 
 Tue, 02 May 2023 08:05:39 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
Date: Tue,  2 May 2023 18:05:29 +0300
Message-Id: <20230502150533.3672840-6-dmitry.baryshkov@linaro.org>
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

Drop support for DPU_PLANE_QOS_VBLANK_CTRL flag. It is not used both
in upstream driver and in vendor SDE driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 10 ----------
 3 files changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b2831b45ac64..d47e7061a36b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -371,8 +371,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @creq_vblank: creq priority during vertical blanking
- * @danger_vblank: danger priority during vertical blanking
  * @maxdwnscale: max downscale ratio supported(without DECIMATION)
  * @maxupscale:  maxupscale ratio supported
  * @smart_dma_priority: hw priority of rect1 of multirect pipe
@@ -387,8 +385,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 creq_vblank;
-	u32 danger_vblank;
 	u32 maxdwnscale;
 	u32 maxupscale;
 	u32 smart_dma_priority;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 731199030336..b198def5534b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -697,14 +697,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			0400,
 			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
-	debugfs_create_x32("creq_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->creq_vblank);
-	debugfs_create_x32("danger_vblank",
-			0600,
-			debugfs_root,
-			(u32 *) &sblk->danger_vblank);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 586f089756fa..3cb891917b65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,13 +73,11 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_CTRL: Setup VBLANK qos for the pipe.
  * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
  *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_CTRL = BIT(0),
 	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
@@ -361,15 +359,7 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pipe->sspp->cap->sblk->creq_vblank;
-		pipe_qos_cfg.danger_vblank =
-				pipe->sspp->cap->sblk->danger_vblank;
-		pipe_qos_cfg.vblank_en = enable;
-	}
-
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		/* this feature overrules previous VBLANK_CTRL */
 		pipe_qos_cfg.vblank_en = false;
 		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
-- 
2.39.2

