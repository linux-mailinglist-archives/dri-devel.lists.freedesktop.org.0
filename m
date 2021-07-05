Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C6C3BB4BC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573D89B06;
	Mon,  5 Jul 2021 01:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC2489AEE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:10 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a18so29464363lfs.10
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
 b=H40YMwnG9yvl+IaF7LJbiLiZYbSv1lgwmyZVv123DAdm9e2glx1fo77kcuLtUJxRUX
 B5o055pt1/okMiavLp8lyvu3t5rGzd4WDZ+zKvSSVSNGH/rexn/grDkjHVTzS995VrcK
 QmX5u7vbISmXHyJk8IvXmnh+Uc3qeN++wxGr3imuDcGZbHGHJyLDG9TKZWqHlmibfMdY
 bpnJr+lFNeDWEmrzIvpED8RRUGVKrltjOvkaELfyTnwL2uEh2DalUNjU0MXPKAgXLP6o
 pHlDXtexlA1dbEum4fpifvWg0gCz5gl2h0gJWOoFZAa0bsBb7MfsL23cowetZiECPSuC
 cIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdDMjhCpUMomtdmjludjL5DxnUY1JT83cC3CTovzo2Y=;
 b=HzDJ5efgXWMckoOQBJtFSTMt97deLoVhF2+Hc7NERtVDm6nw4nbOOA6c7S8iWH1qTt
 jHpVT5ibebqs6fkujcFALc5FOu+cSRwbHzl5Kd8J1qkBkMCQ4SCsjXbvpNImpx0hL5Bu
 wM0bSAxPVot+EZpIMBcawuI4yHyrAGh+FjDHugQzt5Zca9LUSHvROWOs6HB1Wq85F6q3
 AbWmiY2FFstV+AD16QOqiFoGxAx6sRqjsD5i2800tHUkILPEJw7QA7y3MzW9KiD8xQ/L
 /eSXzc83FexFEtPRBa6lHjaEHbFrDFGpZHlMt4h65cv2mpNFcIi/8/mkjoPm+Gvqbu3f
 pdeg==
X-Gm-Message-State: AOAM5325IhY4CSbzsXoVg1uFIH0mTn2a3yJLnyEumkWMD/6jQjPpvCLR
 YCOAd90U3hC1zijYZc5iLJsr3A==
X-Google-Smtp-Source: ABdhPJz6j+jbe+RM4gULFuaTO5I+5RKKIMHiK1GqnIycLILEJV/DCDCczpaagYsAo/MCW6hAFC7+dw==
X-Received: by 2002:ac2:4208:: with SMTP id y8mr8460788lfh.27.1625448308857;
 Sun, 04 Jul 2021 18:25:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 03/22] drm/msm/dpu: drop pipe_name from struct dpu_plane
Date: Mon,  5 Jul 2021 04:20:56 +0300
Message-Id: <20210705012115.4179824-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use plane->name instead of artificial pipe_name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 20ff1832c958..97507e25f4f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -115,7 +115,6 @@ struct dpu_plane {
 	struct dpu_csc_cfg *csc_ptr;
 
 	const struct dpu_sspp_sub_blks *pipe_sblk;
-	char pipe_name[DPU_NAME_SIZE];
 
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
@@ -1431,7 +1430,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 
 	/* create overall sub-directory for the pipe */
 	pdpu->debugfs_root =
-		debugfs_create_dir(pdpu->pipe_name,
+		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
@@ -1656,12 +1655,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	/* save user friendly pipe name for later */
-	snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u", plane->base.id);
-
 	mutex_init(&pdpu->lock);
 
-	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", pdpu->pipe_name,
+	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
 					pipe, plane->base.id, master_plane_id);
 	return plane;
 
-- 
2.30.2

