Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56A8044F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6BB10E467;
	Tue,  5 Dec 2023 02:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081AB10E465
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:31:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so2199510e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743513; x=1702348313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBAqK5na52vzzJw+TiPu+r/BK0W0RfVpJwm0wSsQoZ8=;
 b=JId9VuO257SpUvi3xhQvQt4dWJmVXBxFYoc8NkEOGBMSA6pwZz9dYKjkChJUM0IWYa
 WmlA5ppXTBLQ3uJ8p/cawCGq7s3GruuBcshTukjrnhRR3gtWBsXymWsH45+yBdq6Gq+1
 M21P4JQihjwYOVBhupVF2iFOFxTneEVozuMnVpyAP3QWkew7xx50bQ1HtvFDEAf45Pwj
 9tZ0CNnh/Bjqi0rO2hrd995Ol7IJ8l20ZXXRqojOBqeDQ/brAO7sim/drL0PGrx26XRi
 I2TR0wM32PRnCB4eic4F/ceKnKGWfcX4g1mK8Ag1aq6UWc14kZsO0AUiEWzGBzpWIlg6
 ybhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743513; x=1702348313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HBAqK5na52vzzJw+TiPu+r/BK0W0RfVpJwm0wSsQoZ8=;
 b=jYvElbO1SOI5KQflUhr1ANjGwXhpOSs4CpSf/Ayn04gshgJ5diVv6xNUEuSznAYJU3
 3FFetP4DoEfycIK2vSG0JAPULmvZRNEBsLElWLRRS2WXNReD23OaLAczQLwhnh84Hu67
 GwJ8i4zvVsl8tp8HCDN1HNCHixEAM4YIdkknf47jfj9p2ec9G7uks7LyPDtKQtKjt/RP
 +6NvqVUFg4OZvUnum8P0gZlXCgu2mwUiUS3jDh26oEYTnBRB97snKw7Rb9UIwSlngrl9
 Wtz7FvYRWtjvQeEl4ico3doUDe+clIfb0G4TuDI/fQZ7RUtTKdsUSzSPcZCii1hGbf/D
 h1xg==
X-Gm-Message-State: AOJu0YxZ/VT7E9gRaRteHQYKiGk4uf5VskTZLn1XlYXSVjRCSlT7ikso
 SFrSVct+gyIH2WrFYi8AjIx5tQ==
X-Google-Smtp-Source: AGHT+IH9UwgeVuMspv8xoiJVwYH/BlCXJM8XenBUUZc2vkOvNjr6cbHX1Q2lc9ZOjhV/+YkEGhyYkA==
X-Received: by 2002:ac2:4a81:0:b0:50b:e6e4:c6c9 with SMTP id
 l1-20020ac24a81000000b0050be6e4c6c9mr2128004lfp.85.1701743513266; 
 Mon, 04 Dec 2023 18:31:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:31:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v2 2/2] drm/vkms: move wb's atomic_check from encoder to
 connector
Date: Tue,  5 Dec 2023 05:31:50 +0300
Message-Id: <20231205023150.1581875-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
References: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the renamed drm_atomic_helper_check_wb_connector_state() now accepts
drm_writeback_connector as the first argument (instead of drm_encoder),
move the VKMS writeback atomic_check from drm_encoder_helper_funcs to
drm_connector_helper_funcs. Also drop the vkms_wb_encoder_helper_funcs,
which have become empty now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 23c4f7b61cb6..ebb5183794db 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,20 +30,27 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static int vkms_wb_atomic_check(struct drm_connector *connector,
+				struct drm_atomic_state *state)
 {
-	struct drm_connector *connector = conn_state->connector;
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_writeback_connector *wb_conn =
 		drm_connector_to_writeback(connector);
+	struct drm_crtc_state *crtc_state;
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode = &crtc_state->mode;
+	const struct drm_display_mode *mode;
 	int ret;
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
 
+	if (!conn_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	mode = &crtc_state->mode;
+
 	fb = conn_state->writeback_job->fb;
 	if (fb->width != mode->hdisplay || fb->height != mode->vdisplay) {
 		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
@@ -51,17 +58,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, state);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_funcs = {
-	.atomic_check = vkms_wb_encoder_atomic_check,
-};
-
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
@@ -164,6 +167,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -174,7 +178,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2

