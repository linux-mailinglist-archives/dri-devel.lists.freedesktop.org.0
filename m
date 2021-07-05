Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880863BB4CA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65D789AEE;
	Mon,  5 Jul 2021 01:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD8389B01
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bu19so29487390lfb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKeS2D6NI+nwzdlSN/CbA1/E6G9yn+fxXMAvAL8n5i8=;
 b=kbEqMc75qhYjbWdGft33GVhlyKhK9/+bCcBo03ADmlFC12a8qngXv5n1ggZiinROX4
 6Um0s8Trw8RMLVpTTn6Lv4KRsC2PYb0ra77vxcCNopE0lgzotwK3ytqCAFn1hgJ4DVmL
 Zzf43ilzAP3KXlsGW8g3PX34n7K02N2wuNSdR/DvamDd4zeR8WeBLluLugA7E+dDnzzR
 xxmhseQV41BKkruW9hFW5URxrmZj6AET3wANfx4L6e4Gs+Lz6XTpOfkKabQrBQ2qIK1x
 dvG5L6d1zZPxVjL4vzf7rc9t6kSMUsIo21+3bK/N7Q/drs8ciejp0hrpzsVTunIlTWSG
 qKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKeS2D6NI+nwzdlSN/CbA1/E6G9yn+fxXMAvAL8n5i8=;
 b=SPuYnMBhOQe+IIKo4+baawqtmXxvdVJA1Lma7enllZdt6/ZvgMqwxtU1HjB8Ddig8W
 8XhX71gvYYCt6XLVwE7zOCsxVaB/OKvLKLw1ss/gxVB3alsllSUohRsVdfvcjmkXVgJ/
 6zNk3JSDD/1K+q9TxyrfDRF/iE83eVqISiHmbdDW6m/QDxanXpLuMfpP3Qkg+tRK/UvU
 IFt9H51hT73GWn2vuG5rishWJeDL/kdJLH2fTxi4W8m+dYjm6mQXSfNFsJpZ3oyIyaYs
 nLIumhv6wEj4qiFH0aKVMf37NNo0UnRtCR867OK02CoUiVSp9tF2nLrQUnVDl7nwcuiD
 qL5g==
X-Gm-Message-State: AOAM5338VJRleLNbIrWLY5k4rl1240Whd58f4skLVvcost2EbCee86NB
 miklf3PLBsYp04INgWmatYrKpg==
X-Google-Smtp-Source: ABdhPJzbVCrquF22LIdSurJI93qTcg2lzn7pEUpAP0OhYeY6n/YsuZQCZQ9nbeDj48sISAeg/HJQxg==
X-Received: by 2002:ac2:54ae:: with SMTP id w14mr1363691lfk.97.1625448309711; 
 Sun, 04 Jul 2021 18:25:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 04/22] drm/msm/dpu: remove stage_cfg from struct dpu_crtc
Date: Mon,  5 Jul 2021 04:20:57 +0300
Message-Id: <20210705012115.4179824-5-dmitry.baryshkov@linaro.org>
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

The stage_cfg is not used outside of _dpu_crtc_blend_setup(), so remove
the temporary config from global struct.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9a5c70c87cc8..ea678ddd4589 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -190,7 +190,8 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 }
 
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
-	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer)
+	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
+	struct dpu_hw_stage_cfg *stage_cfg)
 {
 	struct drm_plane *plane;
 	struct drm_framebuffer *fb;
@@ -199,7 +200,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	struct dpu_hw_stage_cfg *stage_cfg = &dpu_crtc->stage_cfg;
 
 	u32 flush_mask;
 	uint32_t stage_idx, lm_idx;
@@ -275,6 +275,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
+	struct dpu_hw_stage_cfg stage_cfg;
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -288,9 +289,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&dpu_crtc->stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -311,7 +312,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].flush_mask);
 
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&dpu_crtc->stage_cfg);
+			&stage_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474340e8..30535acec670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -116,7 +116,6 @@ struct dpu_crtc_frame_event {
  * @drm_requested_vblank : Whether vblanks have been enabled in the encoder
  * @property_info : Opaque structure for generic property support
  * @property_defaults : Array of default values for generic property support
- * @stage_cfg     : H/w mixer stage configuration
  * @debugfs_root  : Parent of debugfs node
  * @vblank_cb_count : count of vblank callback since last reset
  * @play_count    : frame count between crtc enable and disable
@@ -147,7 +146,6 @@ struct dpu_crtc {
 	struct drm_pending_vblank_event *event;
 	u32 vsync_count;
 
-	struct dpu_hw_stage_cfg stage_cfg;
 	struct dentry *debugfs_root;
 
 	u32 vblank_cb_count;
-- 
2.30.2

