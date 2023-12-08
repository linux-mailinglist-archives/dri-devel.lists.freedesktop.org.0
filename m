Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC496809857
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5842010E9C2;
	Fri,  8 Dec 2023 01:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F1010E9C0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 01:03:21 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so1420627e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 17:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997400; x=1702602200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KH74X69CknSJEAqKADUYJy0tIjkWf/mm9wfbBS4QRQA=;
 b=xjY1WzIKpYLyJCC0bUzGv64dFa3RdhB6VCWJv2KE6E6bTl4BhaIYahgvOoBZ7T1mjw
 IHtksouFAiNq+wFKsQvan1wcfPQnEWpM6cxAG13brSHH8DWR9Nfct5gCubMYlTFAlcQ3
 gFZWy91lzDSrI7X9rnT3Pr76O3dmz1FTNYot9kuc4vbVXDE0KgQHZNYin5hGTrzpl2+u
 nc7q5ZGfDsIPWgoSm+xffrR10ktItWfE0R0QlXw7VKy3iH1zNq4aRug8yF8+4RR8mzqd
 dOgAPTucZ3BzgPBoseD4Ssp3lxLz8HVy95qnILbROd6oTtQHIXcm7ibIrWYMLXUtQ8El
 btLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997400; x=1702602200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KH74X69CknSJEAqKADUYJy0tIjkWf/mm9wfbBS4QRQA=;
 b=wDmedY6C5VQQPundMCkfSENg4jhxzgs+V2HyuhMnnKAYdXPHTkmsqRE3tA4E2FKXq0
 39pUlfN1cJoTIDjfJRzj8tl1TCqVAlI6bqK2+A4XfKfTrPp8d5WecixUyrgik4jQ1drH
 y8mz8+EJrGymlO+AzO8m+TTbtl/+IiRQuVL4BB+7YtUzHjuJw517XqfEG6CE5JqulMIo
 wJhve0DF3WRNNMM0u2zBSnUxJ9o9cYFG/9c0EE7wxQWHzBxnnVdBlD5YY5iJrdqDzkRA
 zO0Z05qZRTWFZQniXXNtPH83BLlZshkcOjwD6qxAF9IQsoUgHPb+hy6XprZElw/NPdg1
 X4xQ==
X-Gm-Message-State: AOJu0YwAUU4OndWWVknB3RqFoUo90KPFweqQhGj6rHxy9/17rJabZpc7
 nsbk1an7cJzeAoleJFgs1RzXJg==
X-Google-Smtp-Source: AGHT+IGp18wUjpiOvhYgSK2UicMqSaBn8WCyD/Y+QwBeT3gAg85czosN3/RcOwKmUieKQg9qE+WKWA==
X-Received: by 2002:a05:6512:10d2:b0:50b:efbc:185d with SMTP id
 k18-20020a05651210d200b0050befbc185dmr50714lfg.18.1701997400242; 
 Thu, 07 Dec 2023 17:03:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 17:03:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: [PATCH v4 2/2] drm/vkms: move wb's atomic_check from encoder to
 connector
Date: Fri,  8 Dec 2023 04:03:14 +0300
Message-Id: <20231208010314.3395904-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
References: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
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
index fef7f3daf2c9..bc724cbd5e3a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -30,18 +30,25 @@ static const struct drm_connector_funcs vkms_wb_connector_funcs = {
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
@@ -49,17 +56,13 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
 		return -EINVAL;
 	}
 
-	ret = drm_atomic_helper_check_wb_connector_state(connector, conn_state->state);
+	ret = drm_atomic_helper_check_wb_connector_state(connector, state);
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
@@ -162,6 +165,7 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.prepare_writeback_job = vkms_wb_prepare_job,
 	.cleanup_writeback_job = vkms_wb_cleanup_job,
 	.atomic_commit = vkms_wb_atomic_commit,
+	.atomic_check = vkms_wb_atomic_check,
 };
 
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
@@ -172,7 +176,7 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 
 	return drm_writeback_connector_init(&vkmsdev->drm, wb,
 					    &vkms_wb_connector_funcs,
-					    &vkms_wb_encoder_helper_funcs,
+					    NULL,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
 					    1);
-- 
2.39.2

