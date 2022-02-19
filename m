Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36014BCA7C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 20:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0070910E138;
	Sat, 19 Feb 2022 19:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2427D10E138;
 Sat, 19 Feb 2022 19:40:42 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id i10so9769744plr.2;
 Sat, 19 Feb 2022 11:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvoSYdvksvLQh8m0lHfHUG9sD/v3PFuNdrcMMlvHETU=;
 b=M0xLNGXEUvGObE2IUftk83+uM+bmCeJuQf/SlSHLTS3FS86jHHocVnGF7UufBO4ZvC
 0wB/02wpVeia9uBWtGMdM3bQ5hRCe+rw4akfdU/2sOUnTfIgHxtRu6rTXGBwlm/RccJa
 j/dOTu4PRsC+14vJMkht41IIzqovn2NADwQJ7YVTma9FYtWlnMMJaFaAK9jwHIpyntRf
 qG9ZFZI6oTrvID5yGqhXVfhZh2MeH5zJcgIQ4x/pytGeepd069z+b/HWT/tm+jPwdLgt
 CirHss8+g0cB+3DYa7qURkcZv264O6sBIfQX5PMHE0x9al8qdMghi82N9ykPOjqrP2y6
 lUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MvoSYdvksvLQh8m0lHfHUG9sD/v3PFuNdrcMMlvHETU=;
 b=1kws+r1m9VYm/uvqxL5pAi5YWk87SWp6cKjMoMmsaHntE8NYh1U1VLrI6yU56LagEp
 X1EQCLU1xuAF3TW7uR5W+VdnuFCJtplyvZ8QVX0Sud3yAd8f0O/40b9DjfYIzMqJ82P4
 hXA9xFVVeeI54uGHU5MnN6L5dK+kV7pxQ4IBprHz6uQcagLSc6MsGLo3+L9Igt+4Vpap
 VOPb010iQVAvM4CvfG91SYPXCJDfJe8I+OUDT/ssYWQLgGNFXXOcyUsMAryrKArtkMzm
 2glw49ucS0upGDuarZtrBFHCSLZXSOG7Ve0M4sM37IYbN5a/gJT5wp7njCRlcii2Dnmi
 gqpw==
X-Gm-Message-State: AOAM531r9yMM8+bg/3Xmg33z6nEjW0n1BE4voVoFsGclZWxHinOxa52c
 WMy40MMcPH2Gfcz/ZJK/VORIGR3PMCY=
X-Google-Smtp-Source: ABdhPJyR6YWfik/BcPtbvnLcX64bUfT/doHcLfyC6WWnkKAkA72I67SeNZQVjL9eeSfuztQjsTWDJQ==
X-Received: by 2002:a17:902:6b8b:b0:14d:66c4:f704 with SMTP id
 p11-20020a1709026b8b00b0014d66c4f704mr12845967plk.53.1645299640890; 
 Sat, 19 Feb 2022 11:40:40 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id q9sm7592868pfk.31.2022.02.19.11.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 11:40:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays
Date: Sat, 19 Feb 2022 11:39:43 -0800
Message-Id: <20220219193957.577054-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Yangtao Li <tiny.windzz@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Heidelberg <david@ixit.cz>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Xu Wang <vulab@iscas.ac.cn>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Someone on IRC once asked an innocent enough sounding question:  Why
with xf86-video-modesetting is es2gears limited at 120fps.

So I broke out the perfetto tracing mesa MR and took a look.  It turns
out the problem was drm_atomic_helper_dirtyfb(), which would end up
waiting for vblank.. es2gears would rapidly push two frames to Xorg,
which would blit them to screen and in idle hook (I assume) call the
DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
dirty rects, which would stall until the next vblank.  And then the
whole process would repeat.

But this is a bit silly, we only need dirtyfb for command mode DSI
panels.  So lets just skip it otherwise.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 13 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  9 ++++
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  8 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
 drivers/gpu/drm/msm/msm_fb.c              | 64 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_kms.h             |  2 +
 11 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7c9fe1a250f..3706053bc164 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -265,6 +265,19 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
+bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder_mask (encoder, crtc->dev, crtc->state->encoder_mask) {
+		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, struct dpu_format *format)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index b8785c394fcc..64f79b22aba7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -261,6 +261,15 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc);
  */
 void dpu_crtc_complete_commit(struct drm_crtc *crtc);
 
+/**
+ * dpu_crtc_needs_dirtyfb - do fb updates need to be flushed
+ * @crtc: Pointer to drm crtc object
+ *
+ * Return whether front-buffer updates need to be flushed, ie. is it
+ * a command-mode style of display
+ */
+bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc);
+
 /**
  * dpu_crtc_init - create a new crtc object
  * @dev: dpu device
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..84d9521e8013 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -949,6 +949,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.check_modified_format = dpu_format_check_modified_format,
 	.get_format      = dpu_get_msm_format,
 	.round_pixclk    = dpu_kms_round_pixclk,
+	.needs_dirtyfb   = dpu_crtc_needs_dirtyfb,
 	.destroy         = dpu_kms_destroy,
 	.snapshot        = dpu_kms_mdp_snapshot,
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index 169f9de4a12a..64ff21cfed03 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -19,6 +19,7 @@ struct mdp4_crtc {
 	int id;
 	int ovlp;
 	enum mdp4_dma dma;
+	enum mdp4_intf intf;
 	bool enabled;
 
 	/* which mixer/encoder we route output to: */
@@ -594,6 +595,7 @@ void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer)
 		intf_sel |= MDP4_DISP_INTF_SEL_DSI_CMD;
 	}
 
+	mdp4_crtc->intf = intf;
 	mdp4_crtc->mixer = mixer;
 
 	blend_setup(crtc);
@@ -612,6 +614,13 @@ void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc)
 	mdp4_crtc_wait_for_flush_done(crtc);
 }
 
+bool mdp4_crtc_needs_dirtyfb(struct drm_crtc *crtc)
+{
+	struct mdp4_crtc *mdp4_crtc = to_mdp4_crtc(crtc);
+
+	return mdp4_crtc->intf == INTF_DSI_CMD;
+}
+
 static const char *dma_names[] = {
 		"DMA_P", "DMA_S", "DMA_E",
 };
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 5a33bb148e9e..5e1d19df5c18 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -163,6 +163,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.complete_commit = mdp4_complete_commit,
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp4_round_pixclk,
+		.needs_dirtyfb   = mdp4_crtc_needs_dirtyfb,
 		.destroy         = mdp4_destroy,
 	},
 	.set_irqmask         = mdp4_set_irqmask,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..1633ec866b49 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -190,6 +190,7 @@ uint32_t mdp4_crtc_vblank(struct drm_crtc *crtc);
 void mdp4_crtc_set_config(struct drm_crtc *crtc, uint32_t config);
 void mdp4_crtc_set_intf(struct drm_crtc *crtc, enum mdp4_intf intf, int mixer);
 void mdp4_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+bool mdp4_crtc_needs_dirtyfb(struct drm_crtc *crtc);
 struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 		struct drm_plane *plane, int id, int ovlp_id,
 		enum mdp4_dma dma_id);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index bb7d066618e6..fac2cfd3ef7e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1300,6 +1300,14 @@ void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc)
 		mdp5_crtc_wait_for_flush_done(crtc);
 }
 
+bool mdp5_crtc_needs_dirtyfb(struct drm_crtc *crtc)
+{
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_interface *intf = mdp5_cstate->pipeline.intf;
+
+	return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
+}
+
 /* initialize crtc */
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 12a5f81e402b..25a474732e7f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -280,6 +280,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
+		.needs_dirtyfb   = mdp5_crtc_needs_dirtyfb,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index ac269a6802df..ae62f6778346 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -280,6 +280,7 @@ struct mdp5_hw_mixer *mdp5_crtc_get_mixer(struct drm_crtc *crtc);
 struct mdp5_pipeline *mdp5_crtc_get_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_set_pipeline(struct drm_crtc *crtc);
 void mdp5_crtc_wait_for_commit_done(struct drm_crtc *crtc);
+bool mdp5_crtc_needs_dirtyfb(struct drm_crtc *crtc);
 struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 				struct drm_plane *plane,
 				struct drm_plane *cursor_plane, int id);
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 4d34df5354e0..1b0648baeae2 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -24,10 +24,72 @@ struct msm_framebuffer {
 static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
 
+static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
+				   struct drm_file *file_priv, unsigned int flags,
+				   unsigned int color, struct drm_clip_rect *clips,
+				   unsigned int num_clips)
+{
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_plane *plane;
+	bool needs_flush = false;
+	int ret = 0;
+
+	/*
+	 * When called from ioctl, we are interruptible, but not when called
+	 * internally (ie. defio worker)
+	 */
+	drm_modeset_acquire_init(&ctx,
+		file_priv ? DRM_MODESET_ACQUIRE_INTERRUPTIBLE : 0);
+
+retry:
+	drm_for_each_plane(plane, fb->dev) {
+		struct drm_plane_state *plane_state;
+		struct drm_crtc *crtc;
+
+		ret = drm_modeset_lock(&plane->mutex, &ctx);
+		if (ret)
+			goto out;
+
+		if (plane->state->fb != fb) {
+			drm_modeset_unlock(&plane->mutex);
+			continue;
+		}
+
+		crtc = plane->state->crtc;
+
+		ret = drm_modeset_lock(&crtc->mutex, &ctx);
+		if (ret)
+			goto out;
+
+		if (priv->kms->funcs->needs_dirtyfb(crtc)) {
+			needs_flush = true;
+			break;
+		}
+	}
+
+out:
+	if (ret == -EDEADLK) {
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	if (needs_flush) {
+		ret = drm_atomic_helper_dirtyfb(fb, file_priv, flags,
+						color, clips, num_clips);
+	}
+
+	return ret;
+}
+
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 	.destroy = drm_gem_fb_destroy,
-	.dirty = drm_atomic_helper_dirtyfb,
+	.dirty = msm_framebuffer_dirtyfb,
 };
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 2a4f0526cb98..eb870d499d1e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -117,6 +117,8 @@ struct msm_kms_funcs {
 			struct drm_encoder *encoder,
 			struct drm_encoder *slave_encoder,
 			bool is_cmd_mode);
+	bool (*needs_dirtyfb)(struct drm_crtc *crtc);
+
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.34.1

