Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7E3B3205
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961056EC21;
	Thu, 24 Jun 2021 14:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C0C6EC1C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id p7so10825402lfg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9riuerPahbGrv0+etuSxf5QM+cT8r/JYRQInCd02eGY=;
 b=YIeXhsB12wZDp2cvcU6j+Zq155b9vkHoCv2V3JO3wY5DfpAW4CcwiL+sIda58j1CR8
 jT/dfBa8SBm5aSo6HxN7kGsEwo8jfKtJa71s5vSY9sPSVsWnXS6oYmyJn6qtTWooW58J
 zJGfbQR3IGGS8FBmD+6rj71zgZnhTgUZZP5pQ6Ceewk9qWmegCb5tXiVLUmwEI1H2OxB
 qjc4s71azXTtexNK4qrFPO4poy07iVs4JPRno+V/vA9Z/gYMM0f8sgDwysbyB8/if1ks
 8Mt9meN4oGatVqbz1/9A8PWQjjFh4XxUtjcErBdIhVYtmdohk+JoOjhNbqNcUeweJtVl
 tpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9riuerPahbGrv0+etuSxf5QM+cT8r/JYRQInCd02eGY=;
 b=QHUdk4FgW+npOMcjzkMWCap4/aweV7Ay3eftrYAjdJbqg1bDbStwr0loJAXN4MNNSO
 sKprGNeEqY7+i7aEmZI1GsqnhAiJ672LHQ7IG4lhN10rbDnuJMv2If4FFB0P7BZJLUfg
 2/T6tL0gpoX01TuY84xozE3gfb8RBwyLoxFNk53l3FV78AbbQE566lGNazbn5dHla3kZ
 Mpz8tUZngkcepmjsheUqQd0Gq/uhvywHxaeJKLCyf71bUIq8bvhoNczIIM6uVkscKfPF
 HdVr+in63SMVROr9L1lXIFrwDZYFza9I31jJw7jcKuaBNhlWQ8pb+JLyemRjZQ0smxON
 pruA==
X-Gm-Message-State: AOAM533jnHx+48y4K0rFgWIoXntkZlioeqURXoxbgkvzNIBlyNDqfw6Z
 j+lHumOQYej0jDaIEs9YHIIaNw==
X-Google-Smtp-Source: ABdhPJxxDrRElj62ByC7cNuVA6CLsAsotD5NdqJgVCvKB5e+ithBiq7+S1+buhl3ZyCCfnxWqcASlA==
X-Received: by 2002:a05:6512:b26:: with SMTP id
 w38mr4341932lfu.227.1624546664431; 
 Thu, 24 Jun 2021 07:57:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 08/17] drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
Date: Thu, 24 Jun 2021 17:57:24 +0300
Message-Id: <20210624145733.2561992-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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

Do not cache hw_pipe's sblk in dpu_plane. Use
pdpu->pipe_hw->cap->sblk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cf45a86877e2..c5b221ecfa05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -109,8 +109,6 @@ struct dpu_plane {
 
 	struct dpu_csc_cfg *csc_ptr;
 
-	const struct dpu_sspp_sub_blks *pipe_sblk;
-
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
@@ -410,9 +408,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_sblk->danger_vblank;
+				pdpu->pipe_hw->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -942,10 +940,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
+	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_sblk->maxdwnscale << 16,
+						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -1570,15 +1568,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	/* cache features mask for later */
-	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
-	if (!pdpu->pipe_sblk) {
-		DPU_ERROR("[%u]invalid sblk\n", pipe);
-		goto clean_sspp;
-	}
-
-	format_list = pdpu->pipe_sblk->format_list;
-	num_formats = pdpu->pipe_sblk->num_formats;
+	format_list = pdpu->pipe_hw->cap->sblk->format_list;
+	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
-- 
2.30.2

