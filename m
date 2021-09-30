Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F841DBBB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE616EB9C;
	Thu, 30 Sep 2021 14:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B3C6E406
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:00:27 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u18so25785022lfd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vEzZd6kTNEmnufTy+4QbAx47CPquDMV7Sy4Yf1gMqxg=;
 b=MqWGt0lI9U9428rE7LzEDu2dpOGFzNx6GOrs/1KbbgrhuZgr81vZO19pT75YmJYWc3
 Cm3Jbj9STX5mcnEQpVUo/s51cC3v4jutJgIvBBfSif0TTVpWFAJ2lKwwCfbVsn4kSOI8
 83wOzLHOdykxYPOGMnI4zAvet91Dv3H3pk2JKyJ0A17ghMATsuHOoSKGtWSKosMwm2tq
 pJRFGmGCYeNeGt8flK0fiMVK+fCWhPY2RqvFDwI5VaZcTpHF03ugdC/NRYYfur/8I3p2
 RyzEvFM9GmtCmmLsieOogvcGEm0GRzNaox275thIrn9Fy6TIuberrufFIjMWLDid+w8X
 BqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEzZd6kTNEmnufTy+4QbAx47CPquDMV7Sy4Yf1gMqxg=;
 b=O8mP+RjNTaKScSq0u0wEOQ/qGscZzm1u644wepGoDR0hRRPZalQXHjwXxPL7MGV5+H
 chR1o74R0xxqEDc4OZDBJ9rDJgBaA9hQQQMTTM+TbeNjvTexiD8+WXzATjYrniQ7u30k
 BMfjNh3ZIZO9X6aRsZjR2Yx3/uKo1SvIz/Se1qr+D+8HLB2fSh6xxoUAd8yxriSG+1Rd
 QD0ZgNTB7DddSmnMKMVKBgQXc83GhOmoBQkfXl7rDQ0KLgYlsEFOVBGkR8OQqC0y8Hl1
 IBrv+b03mX8cdmJyYKUqUkEJLuoVTtGe+syylpWAESo6Wf7gwvsrgbH/eJ5dhfWTLIAW
 59Mg==
X-Gm-Message-State: AOAM533hmauJODyRdtx3p9Ct/y0ATtAdYipfncjr1bMTA1n99nNPecFz
 4HsZURPJS6hYCUs8gBiiaOzZZw==
X-Google-Smtp-Source: ABdhPJzaYmZxxYmZmsdVlKece8sDHI8DSmeZukk/G1EBf6ckN+LqvTin/zfRhthTqprjhRb+m9Vvyw==
X-Received: by 2002:a2e:5111:: with SMTP id f17mr6219859ljb.409.1633010423281; 
 Thu, 30 Sep 2021 07:00:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:00:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 04/11] drm/msm/dpu: remove stage_cfg from struct dpu_crtc
Date: Thu, 30 Sep 2021 16:59:55 +0300
Message-Id: <20210930140002.308628-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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
index 768012243b44..19f0715a4089 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -207,7 +207,8 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 }
 
 static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
-	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer)
+	struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
+	struct dpu_hw_stage_cfg *stage_cfg)
 {
 	struct drm_plane *plane;
 	struct drm_framebuffer *fb;
@@ -216,7 +217,6 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	struct dpu_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-	struct dpu_hw_stage_cfg *stage_cfg = &dpu_crtc->stage_cfg;
 
 	u32 flush_mask;
 	uint32_t stage_idx, lm_idx;
@@ -292,6 +292,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
+	struct dpu_hw_stage_cfg stage_cfg;
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -305,9 +306,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&dpu_crtc->stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -328,7 +329,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
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
2.33.0

