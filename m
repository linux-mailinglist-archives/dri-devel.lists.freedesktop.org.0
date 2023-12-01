Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E580152B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F268810E974;
	Fri,  1 Dec 2023 21:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3485F10E968
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:19:00 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9d2ca9a96so26333481fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465538; x=1702070338; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D82rHnXTJ3M2XwFRTadUfTqBGG9AxaRbqkRHkJTO34w=;
 b=Lnh/r4t3nnPp7aMys4LkM7KV8UCzQQaHAR9XEf8DxTR+pIE2eQWJ5O8dnNMCHKHWnN
 gZM4FzeHfYaGhr9tO7Fey6mcN919aK5FV0ewBn+wHlLGHs/El4kQRoy6Y9XcL3XQvTJI
 drSYd3ErZ36a3CHKW2YF0IVjZGq4o4SHWKLK8iCLVHiFm2ntnuRrFI47Q3hGd3Fso93s
 0gRC5j9/5tkhCDPMyQ+05F576pZ0tfyFZ5cYS7bPSbdy4wZe/420DKPkh753wymWpjmr
 pY6z19wksnKzu/5xXsLAVtJJo00LjQPDBydNrvqaUbAB8SL4d4dF3FvdyIVnseVcXo28
 n5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465538; x=1702070338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D82rHnXTJ3M2XwFRTadUfTqBGG9AxaRbqkRHkJTO34w=;
 b=m2g4xdWWNvZdezChPh7GHgWfWPuBBPe7LfPLwf6p+DnCf/k2csT083KQl1RbWgsvAO
 h9ltLyQBoVlVxDMX6vLMGK9O25Gnp2bcfg4sPxrcDiTl9POLWNrpxExR5PGKoc5b3meg
 COrMUY8WbwxGKQ5KiSkfA+g9EYiUOjd0DcXI3LU6lYqw2WrjHg7G4M1lzHanbOCuJbu1
 a+G0AWynDjurqI8I2RDM02SUXtfHKNjBM8Uol3O2lvjuoWEIE34yWuvn5Z/Fh35lJOGH
 QW3gSx86xfzreT1On2To9uJErJlS/szHnKLZop8AhxFUdlb38aeDGel5GrCvByu6rUBl
 D2aw==
X-Gm-Message-State: AOJu0Yy+5dy1OCpTN9pFBTWJ45UpJOLxJNsTOqFwanuWm87jy8Y+zjus
 Y3Ukp4bdK3VxYpfrJo+DN2MSq8wqzjl+uGx3u2U=
X-Google-Smtp-Source: AGHT+IFe1EX60SYP6vv7JeHjkm7/WFOY7n0b/gZZ4Q9L3LbncmqdFZyBopGrWjLFW4bxA+415LJqHg==
X-Received: by 2002:a2e:530c:0:b0:2c9:bad0:9c0f with SMTP id
 h12-20020a2e530c000000b002c9bad09c0fmr1040169ljb.47.1701465538499; 
 Fri, 01 Dec 2023 13:18:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:18:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 09/13] drm/msm/dpu: use drmm-managed allocation for
 dpu_plane
Date: Sat,  2 Dec 2023 00:18:41 +0300
Message-Id: <20231201211845.1026967-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change struct dpu_plane allocation to use drmm_universal_plane_alloc().
This removes the need to perform any actions on plane destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 46 +++++------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ab9f93f15536..32b4b08ffe35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1211,20 +1211,6 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
-static void dpu_plane_destroy(struct drm_plane *plane)
-{
-	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-
-	DPU_DEBUG_PLANE(pdpu, "\n");
-
-	if (pdpu) {
-		/* this will destroy the states as well */
-		drm_plane_cleanup(plane);
-
-		kfree(pdpu);
-	}
-}
-
 static void dpu_plane_destroy_state(struct drm_plane *plane,
 		struct drm_plane_state *state)
 {
@@ -1394,7 +1380,6 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
 static const struct drm_plane_funcs dpu_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = dpu_plane_destroy,
 		.reset = dpu_plane_reset,
 		.atomic_duplicate_state = dpu_plane_duplicate_state,
 		.atomic_destroy_state = dpu_plane_destroy_state,
@@ -1422,35 +1407,28 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	struct dpu_hw_sspp *pipe_hw;
 	uint32_t num_formats;
 	uint32_t supported_rotations;
-	int ret = -EINVAL;
-
-	/* create and zero local structure */
-	pdpu = kzalloc(sizeof(*pdpu), GFP_KERNEL);
-	if (!pdpu) {
-		DPU_ERROR("[%u]failed to allocate local plane struct\n", pipe);
-		ret = -ENOMEM;
-		return ERR_PTR(ret);
-	}
-
-	/* cache local stuff for later */
-	plane = &pdpu->base;
-	pdpu->pipe = pipe;
+	int ret;
 
 	/* initialize underlying h/w driver */
 	pipe_hw = dpu_rm_get_sspp(&kms->rm, pipe);
 	if (!pipe_hw || !pipe_hw->cap || !pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP is invalid\n", pipe);
-		goto clean_plane;
+		return ERR_PTR(-EINVAL);
 	}
 
 	format_list = pipe_hw->cap->sblk->format_list;
 	num_formats = pipe_hw->cap->sblk->num_formats;
 
-	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
+	pdpu = drmm_universal_plane_alloc(dev, struct dpu_plane, base,
+				0xff, &dpu_plane_funcs,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
-	if (ret)
-		goto clean_plane;
+	if (IS_ERR(pdpu))
+		return ERR_CAST(pdpu);
+
+	/* cache local stuff for later */
+	plane = &pdpu->base;
+	pdpu->pipe = pipe;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1480,8 +1458,4 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-
-clean_plane:
-	kfree(pdpu);
-	return ERR_PTR(ret);
 }
-- 
2.39.2

