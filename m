Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C722217AE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 00:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92796EB46;
	Wed, 15 Jul 2020 22:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF8386EB46;
 Wed, 15 Jul 2020 22:19:24 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s26so2721648pfm.4;
 Wed, 15 Jul 2020 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMjYphEfEAV7tSz+LCOdD9vQZvr3WacRlabwazm568=;
 b=tUbTUWR3dxj56+YyBKIZgJW/7OA2iUxxr4thXULbGaCVs/FCj2qxgmftDdCgQcDfAj
 P5pg8iyiIjQnURraFdk4xxB9TYVuanQxxhvUUAqFJKFeXquE3grQoz4CcppAAy4p5B5E
 R+/cmzvRIj8wFAXTYPyl3DfbeeARc8bZzK9LkaPYajrSDztZTrdukZcz/XpD4YeBH+Se
 vYEXBRqGTZ/F2Fuv9aMgg/pO+40ZN4ejTFs7IzCFduxAh5ykbHu13lc1dBt0YzCg57dZ
 p4UV4ANTI/ixautCIS60xQkouahgl9VBwr1QkJCepyM0WYVBoR1dvQklHkzhUAmNDkU/
 NR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qxMjYphEfEAV7tSz+LCOdD9vQZvr3WacRlabwazm568=;
 b=tdcSKsmbFIEt8Y875s4O4Dy9NUHBb920UMfw+qbdo9cSHyrXQ+O6VGa1O+lHS0035w
 JsK8qBgLOVoaOub7I30Jec0/+1xFvMBJqkivm7MhHMYe+y6GvfTvGlwgZFZHujGTY9Em
 cU3RS6uC8vAdrNQZKouKV23NN55MyWLTwROYUWcQtXtSR/h0cGgR8FmkCtDEOnq3V2Ta
 IbYLey9AWCp7cLJKlS7urWXRuEEWKhkJzcnuModb0RtifR82Q3RWURmhoxlm4mCIwI4H
 fZD5C8Hn1k5p+0EeGdbeVKPVwsTOSDCl/DS+CderGMykKJplLBnaSzd7eQtqJpG1XeYz
 jgjQ==
X-Gm-Message-State: AOAM533PoGtXakejWrd/3Wn3VystJQrOmesYIQ5WNi+B5LlfzR60jXn1
 GtsKbqUs9GMfXgOb5/VGAe51zQ2akiU=
X-Google-Smtp-Source: ABdhPJztQ4b1Z0Z4rUFJQFEEF4msB+mPG53K5SjClbyNecECZ4BF9AnbVoPPw+8lwtj9Zq1DN6QehQ==
X-Received: by 2002:a63:135b:: with SMTP id 27mr1656329pgt.37.1594851563677;
 Wed, 15 Jul 2020 15:19:23 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 p9sm1445997pgc.77.2020.07.15.15.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:19:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: fix/enable 6bpc dither with split-lm
Date: Wed, 15 Jul 2020 15:19:51 -0700
Message-Id: <20200715221955.3209856-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Steev Klimaszewski <steev@gentoo.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

If split-lm is used (for ex, on sdm845), we can have multiple ping-
pongs, but only a single phys encoder.  We need to configure dithering
on each of them.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  3 +--
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 46df0ff75b85..9b98b63c77fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -212,14 +212,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
-static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
+static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
 
-	if (!phys->hw_pp || !phys->hw_pp->ops.setup_dither)
+	if (!hw_pp->ops.setup_dither)
 		return;
 
-	switch (phys->connector->display_info.bpc) {
+	switch (bpc) {
 	case 6:
 		dither_cfg.c0_bitdepth = 6;
 		dither_cfg.c1_bitdepth = 6;
@@ -228,14 +228,14 @@ static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
 		dither_cfg.temporal_en = 0;
 		break;
 	default:
-		phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
+		hw_pp->ops.setup_dither(hw_pp, NULL);
 		return;
 	}
 
 	memcpy(&dither_cfg.matrix, dither_matrix,
 			sizeof(u32) * DITHER_MATRIX_SZ);
 
-	phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
+	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
 }
 
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
@@ -1132,11 +1132,13 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-			_dpu_encoder_setup_dither(phys);
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
+			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
+		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
+		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+			if (!dpu_enc->hw_pp[i])
+				continue;
+			_dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 7411ab6bf6af..bea4ab5c58c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -231,8 +231,7 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
 
-	if (test_bit(DPU_PINGPONG_DITHER, &features) &&
-		IS_SC7180_TARGET(c->hw.hwversion))
+	if (test_bit(DPU_PINGPONG_DITHER, &features))
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
