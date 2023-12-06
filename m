Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0385806BA5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5BE10E0DD;
	Wed,  6 Dec 2023 10:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75A410E0DD
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:14:58 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ca208940b3so7230471fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701857697; x=1702462497; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=70HOTD/cQ7LFZtK322MA1C1lmqh4uEFtx7g2XW2sKm8=;
 b=QZ4lYssmOy0AByv5rpXiO7LVK1suXATMiE/QeInEGTKA5AU2DTSy1Zb3RFkKd7Jzdm
 u09DlkNmN2qDJZw49RshRMEXfQ4OzxE53hph5IlSL3iHkbWMp0a/buMIbWkbX9PE20RY
 shdUJku3rXM0kjEdNjW2guFAKte9L5Vx+6teFhIZFBJVQijjsRlx9mzLAYAi3b7Zwcso
 Yji6tKvkm4A4r8voAelclJUtycyegAW6AckFsgIlciZI3rFLkR/URwAQOSznuSFwDNcN
 HpjpOEx1Yckpg7ixYOVjc60wQu1Ekf8dOE4jqmJLXmCaPpydXUef0ikghovHFTnbBFrI
 RB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701857697; x=1702462497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=70HOTD/cQ7LFZtK322MA1C1lmqh4uEFtx7g2XW2sKm8=;
 b=cCNK6qFLEF3UW3acpyuXQxfHbpvNxC/jupYt1hSkMapeBffhqGFeGoeFNizmR2UkAD
 kmE2Wim+zx5UoSXwPEmE9Ab5dHHh/bkIOrmFtvzPG9s9Hug4QoYabatLhBbM5GrQtc3K
 rv8FuauR+pCx9JhgMQIQsD2Thxx+rcdmD+1VrCjNonm2wKqBxbEFEZ83vA/yilUEqNZo
 Ww03+J4AROkTCkqxqLL8+LjsnWJtiUQlLxuoTrvzReIis8rTL9n3i9cxI+3vYnxs+MyR
 bN2snvceXgYJZ45gRQgczS43SqkUajvs9M1YtMx35PmC+m2SI+LjUgovMpa+Hs96HTDZ
 PLHw==
X-Gm-Message-State: AOJu0Yw6YejI5+HRP13pW6436telxvIz4RKU5IrsDMR64R52dddUtbGr
 ui1ozIdXiOstTFT+2FMGPpxpGg==
X-Google-Smtp-Source: AGHT+IG5lnaNCOrVzAPY7gQ6lp3lGWfEendm5wcELXyB0ij2XYr5rj9vMGUe4uWkEY58YD3XbDmdiw==
X-Received: by 2002:a2e:87d4:0:b0:2c9:f46d:dbbb with SMTP id
 v20-20020a2e87d4000000b002c9f46ddbbbmr457953ljj.23.1701857697093; 
 Wed, 06 Dec 2023 02:14:57 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 02:14:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v3 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Date: Wed,  6 Dec 2023 13:14:54 +0300
Message-Id: <20231206101455.1664463-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
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

The drm_atomic_helper_check_wb_encoder_state() function doesn't use
encoder for anything other than getting the drm_device instance. The
function's description talks about checking the writeback connector
state, not the encoder state. Moreover, there is no such thing as an
encoder state, encoders generally do not have a state on their own.

Rename the function to drm_atomic_helper_check_wb_connector_state()
and change arguments to drm_writeback_connector and drm_atomic_state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 ++++-
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c3f677130def..c98a766ca3bd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
 
 /**
- * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
- * @encoder: encoder state to check
- * @conn_state: connector state to check
+ * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
+ * @connector: corresponding connector
+ * @state: the driver state object
  *
  * Checks if the writeback connector state is valid, and returns an error if it
  * isn't.
@@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
  * Zero for success or -errno
  */
 int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state)
+drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
 {
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
 	struct drm_writeback_job *wb_job = conn_state->writeback_job;
 	struct drm_property_blob *pixel_format_blob;
 	struct drm_framebuffer *fb;
@@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 		if (fb->format->format == formats[i])
 			return 0;
 
-	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
+	drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
+EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
 
 /**
  * drm_atomic_helper_check_plane_state() - Check plane state for validity
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d7e63aa14663..23c4f7b61cb6 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -34,6 +34,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 					struct drm_crtc_state *crtc_state,
 					struct drm_connector_state *conn_state)
 {
+	struct drm_connector *connector = conn_state->connector;
+	struct drm_writeback_connector *wb_conn =
+		drm_connector_to_writeback(connector);
 	struct drm_framebuffer *fb;
 	const struct drm_display_mode *mode = &crtc_state->mode;
 	int ret;
@@ -48,7 +51,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
+	ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..fea528aacfe2 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -49,9 +49,8 @@ struct drm_private_state;
 
 int drm_atomic_helper_check_modeset(struct drm_device *dev,
 				struct drm_atomic_state *state);
-int
-drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
-					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
+					       struct drm_atomic_state *state);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.39.2

