Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41430465937
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 23:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BEA6E5A1;
	Wed,  1 Dec 2021 22:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31776E5A1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 22:26:41 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z8so51100623ljz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 14:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPVLDgnWhiffGg+ltlm6jFDDP7VKjhpJAJFiDVdO8N0=;
 b=ffxswi7e6qVsGwiUetlg2L9vL1KHpzBwwSPSnXcaqR0F41NLuoj5+MLMxsYH137iwu
 3k8xqvbXPdWJQ8PFyzOYbJCJlYh7SowrTTwNYar2gKU0n6dAyms1UvLqmLhT3gmpx9iV
 gHqDa9L28bygXdk0YVphcmvvFrHgtVGRELM61CsjhwjaBu+Ht1AtJymz0E2Gyev57xgu
 romX3Q6yJu6sGu08xTeu4qDo1L4OfvS7bA5X3uSmfSlnJu0L4wNz814JQWpazv7mxM0J
 MsLCAp3/HB9+X86Jj4suguB9WlIS4zqZXFrpPWzvF5BwZBL4Z/tv3jGNcJSGZZ64bH5x
 uhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPVLDgnWhiffGg+ltlm6jFDDP7VKjhpJAJFiDVdO8N0=;
 b=g7LK2FM8ITe1ApydfralqzKgBLpdFSUQ4bbNavgG1xA3cotJYAthHPuNcVHOdEuqsk
 sjxF+nga02m0QufTLquiN38QGbtie3Q2vo9uJ9jsiZrvrO5a/bOpWMFlFQ5rv2363FQe
 +Ae3UAdbrXPBivpe5eH7RMDjTCzWCVoDjvAyIwf1PAvAgyt6/w9bV52DE8iamQF9OHn4
 7DesUoRHZt5Y0bO3lO4oRPxi4MH6mR6YILQWKP2a3uXX7yLtJgg2UTcy/3Rio3IjL0T4
 tK2DlhYn1iDerhqhPbA5Cj28k1DSdwC0WArZWN8pbOqhiXrtBaa0a6ZpwbThidGNsFdQ
 5KAg==
X-Gm-Message-State: AOAM532q6Ey2hakV3O56aHUyphYydilNfOSEfVtkHKGxq1YezWm0DbjZ
 EGil9oi1uZgeilMfqIiBQZHwYA==
X-Google-Smtp-Source: ABdhPJzBozT03glC0cSzbckwkIGAr0LRXKjsB6uYW6kKFalJ9YpUhJ4sE2AHDJXNYRvYE/eH5mFhqQ==
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr8225808ljp.364.1638397600114; 
 Wed, 01 Dec 2021 14:26:40 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v1 5/8] drm/msm/dpu: stop manually removing debugfs files for
 the DPU plane
Date: Thu,  2 Dec 2021 01:26:30 +0300
Message-Id: <20211201222633.2476780-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM code handles removing all debugfs recursively. Drop plane-specific
code to perform that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 28 ++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index f80ee3ba9a8a..d3176f58708e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -110,7 +110,6 @@ struct dpu_plane {
 	struct dpu_mdss_cfg *catalog;
 
 	/* debugfs related stuff */
-	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
 	struct dpu_debugfs_regset32 debugfs_scaler;
 	struct dpu_debugfs_regset32 debugfs_csc;
@@ -1368,15 +1367,16 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
 	const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
 	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
+	struct dentry *debugfs_root;
 
 	/* create overall sub-directory for the pipe */
-	pdpu->debugfs_root =
+	debugfs_root =
 		debugfs_create_dir(plane->name,
 				plane->dev->primary->debugfs_root);
 
 	/* don't error check these */
 	debugfs_create_xul("features", 0600,
-			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
+			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
 
 	/* add register dump support */
 	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
@@ -1384,7 +1384,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			sblk->src_blk.len,
 			kms);
 	dpu_debugfs_create_regset32("src_blk", 0400,
-			pdpu->debugfs_root, &pdpu->debugfs_src);
+			debugfs_root, &pdpu->debugfs_src);
 
 	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
 			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
@@ -1395,7 +1395,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				sblk->scaler_blk.len,
 				kms);
 		dpu_debugfs_create_regset32("scaler_blk", 0400,
-				pdpu->debugfs_root,
+				debugfs_root,
 				&pdpu->debugfs_scaler);
 	}
 
@@ -1406,24 +1406,24 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 				sblk->csc_blk.len,
 				kms);
 		dpu_debugfs_create_regset32("csc_blk", 0400,
-				pdpu->debugfs_root, &pdpu->debugfs_csc);
+				debugfs_root, &pdpu->debugfs_csc);
 	}
 
 	debugfs_create_u32("xin_id",
 			0400,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &cfg->xin_id);
 	debugfs_create_u32("clk_ctrl",
 			0400,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &cfg->clk_ctrl);
 	debugfs_create_x32("creq_vblank",
 			0600,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &sblk->creq_vblank);
 	debugfs_create_x32("danger_vblank",
 			0600,
-			pdpu->debugfs_root,
+			debugfs_root,
 			(u32 *) &sblk->danger_vblank);
 
 	return 0;
@@ -1440,13 +1440,6 @@ static int dpu_plane_late_register(struct drm_plane *plane)
 	return _dpu_plane_init_debugfs(plane);
 }
 
-static void dpu_plane_early_unregister(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-
-	debugfs_remove_recursive(pdpu->debugfs_root);
-}
-
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 		uint32_t format, uint64_t modifier)
 {
@@ -1472,7 +1465,6 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
 		.late_register = dpu_plane_late_register,
-		.early_unregister = dpu_plane_early_unregister,
 		.format_mod_supported = dpu_plane_format_mod_supported,
 };
 
-- 
2.33.0

