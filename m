Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFC491508F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 16:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3710E48A;
	Mon, 24 Jun 2024 14:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X5Ht5zzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD94310E480
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52ce6a9fd5cso976118e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240438; x=1719845238; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
 b=X5Ht5zzpsxshtjpvfJyfBWJPC0L9/5eiTx8F3b7TALa274RATOiupEwFBIkW6D6CVc
 mPsu0zjSGO+InErbvp7Xp4qRm4tctV/xYYx7P5N2/rIap+XUCCba+tsdAMvAQ0mtC+ii
 kPBbH7KUQiYQqw/zuDwPWcdxwXwAvDhRFTzoUgPXEPholGsyWzy0mxluu2HmJK56GbLa
 1mQfVLy/jk8RmH/zBN1fXig0uRUbN6GvD+D/1+gqSFU3y62pd6g5QKPhP3nIAAYMQAc8
 Gfl51xu5nt/XONWP3E25kNz8aZ8ep/VbdqdkIm8DGEqL+dAcLYM70AFTaFBfFmDJF/Np
 U4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240438; x=1719845238;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIsQ9jyOskAThgejEXOc+20Ndgc1zU0T9DxoSge/dGM=;
 b=cRNsPKvZIyUwtn4GPVXZCozdOapcOTPbaZZUY/gUcmmCk1wUa24c2k+DtDkrOOx7bW
 aIVRlxNbyCkpIGHJXI6VKVztq0z+mRTz5Pr/XUOozNY91iquGhaLs8B08DfcH0xOWAy4
 q7WB9iY4ApIg69TcM4uIg2CKGC2hZ9Yyh5ykjbAex3YNDhWRUwVcypHudUeN2oV32m8K
 vGQdknzwLHfjesDDZG3qUlJs+0ujo1qintrSJFdPz6Mz/AtRz2jhxqKWE3oxb60y7KWJ
 tNxH9Rem2feSO9lPdStSBGx7GvJuIRbdSecuN68pvFVRZkLVAUYpDUwomBMyazq+8c6M
 lo1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVprSX4DxvtrH4LcwbdvHLgv2uP+iNNjKkrGYngvi/CuGGysbS1r74rYfdrnEajKW5CBesPSZR4i57757D1rng/KAqtCprIVEIQluwKEW0
X-Gm-Message-State: AOJu0Yxbot+JbPrAV3431xP4j/0Gsqc1AW025eUlPGR+NHovepTnXVhq
 0uLhf9AKWZj4Y0mVBzgEoiI/gVFLVmp57iF2MNYjaB8/fO0Jrg66SxFa5v9HNHs=
X-Google-Smtp-Source: AGHT+IHwn4mRcNgV5Qui2ZZtG9U+fDFH4wKxNBRIQDXWFZ5liYEi6+aF7gwp9ETB6Ys9QB5FWdWudw==
X-Received: by 2002:ac2:4c41:0:b0:52c:db28:4d92 with SMTP id
 2adb3069b0e04-52ce1832653mr3384526e87.11.1719240437910; 
 Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:12 +0300
Subject: [PATCH v4 06/16] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-6-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EolmHRhwGXXQUzrkytdeQx4Mh8dKlNx5sMNxyMkQHl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv72B9V3iefGPWeIHr1+B/BabWUEjMIFcJC
 wUzvrn/t0uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1RknB/9bSdIVf5ZCOI+Rzc50netnzopJnWbRMkvL6CV+axROugiqdEMHL416YrhuSaZhYrubJbP
 LVOnd43VVOo4BJJfAkZhDCv8CSXUfWO5zj/RWee7YLy4m8bKqNpGxb4dMPXz3/Ni7k4EQnYsAjQ
 tkUcPMimbrPCTaE3zrk8bHG57NQkX4vZAuI+/sJxzeJboPLlz4c9WW1rdNwfSwVu2H3EhK5U6Du
 c0m+YcfQRum8gH/JjIMxe5ei44+XFIx2wBRNs62JRUtLPN8Zvqkrua6q6SpzHZVldaHgMcVQxsU
 HgQgFiKDqLk6DUncpBpKrKyYv4YpwLgyQWHLcnt0GId/511W
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layout in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index eabc4813c649..241c2d7a218a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		if (pstate->aspace)
@@ -1103,17 +1103,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1128,12 +1117,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

