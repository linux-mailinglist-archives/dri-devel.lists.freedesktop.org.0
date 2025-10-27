Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DDC0C3A2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A50310E346;
	Mon, 27 Oct 2025 08:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XhMuSA9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E68AC10E340
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:06:25 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-592f1988a2dso5002164e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761552384; x=1762157184; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3wUcuvxBU9o0BNgp3mGWY+OrsEhxOyvnPdUxXgFT92U=;
 b=XhMuSA9QoXDIf9hKV/qQooddrSyBxi5dN+AiCggu0bdD0+xZlhMTA7qqdL1eQueRi0
 KK2DJjEFKv0uLW6lssH0rdT90haapcw1IeUGjkL5bX2vdxh7hFXYQP54ibTTSUKF9U0N
 S83UEcZ/jY3kWXL7bOdPTZjtcB+ekaNJNc+hQv7DL+oGxG8+aGoNsXNLNH52BwtiISVN
 wBQu4DbVbDaIA4dqm00AZQRzHSCPk1s0zAFzXGHhRO40Y8+XgNVzFMao0xr+Xc8D95JY
 fJsLqd0H2x3W0YgB+3/is/dmnvs+/FmUKiFpTt3vwxga4EYVXXMPn4BDOA86+ZKmYw7M
 fhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761552384; x=1762157184;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wUcuvxBU9o0BNgp3mGWY+OrsEhxOyvnPdUxXgFT92U=;
 b=d9kTyl5S5axrpNKv+szIAP7NjjC+1oaWM6RkYDDdsYsYfXDz/z7ZvddWzxAJ/XyAa8
 i9f84yGYVCBdNkS8KHDYXjrjjjjpI4R6hqXYfooBHcRPvn0W84ad4sJIfKYO5ckLBhss
 xpN7Z73Cnx5IZ+3v16v+c+v2jPqot/hTt0dCE1x287J4ePfSMZUTk4pXPWKINZHn5Htv
 5G3QiQD8k12ssiu7T/UHalus77J/VQFNcJs1HkSuYSgIFO5DuphSN4PSxaFFbapjzhGY
 uPikfF9aXmW/Nw91KFPEuMyaLIEffNIsEbUsj0v04/v0JFhDbFDVmENEkljAO39GxyRy
 1ehA==
X-Gm-Message-State: AOJu0Yz0C+zsbM4SPAMyauJFwu96noYWilLdxld3tj8lS+JcFn4IalXa
 qMCT1L8CEfXSU8o/LIpeL+M8xOEt7bfkW8YxZm/QnTfEkMGINzQNZK2O
X-Gm-Gg: ASbGncvon54R9wnIUay3vt/vTKPVftzDBqQICPnlUWG4oUjqIKUfLq+9G6Ch3pTz4h4
 V+SWEOVMB9RUf6PDreXJaI7uP/ei14bzEKy/QiNQT4kvBZbpnAIBzJViKnCAoPV7ggWGUYAWqF9
 7gTLHg80HWFZnCo64jNeN2e42dA9YahLU33bK+3xUv9Dne9sZ5AgnPDASJDbB1wMKk1hnol2n+W
 3ManNhg910rTyxQ79u2RQlPnAoGAKgNSlwMHodLNTkWLdUvcaw+LwAmi4WvLC2ZqxpKoABJyF2o
 Eh5zkbjJ8w1SFuMsXuuNW9DxlJw7CCPus1oLyBmK5yMqS8Su91pWTSo4VEH6NNJ7z8NvBR0MWAy
 nUNKSH/9Txr+PROAG9YG0Ppxikz8lsVtIoRT/rD66TeGvT5bmIp1mSvvknTNCOHDNlptCSUlh3i
 NTFEqzZtxl5tyxBn7aJ83Di4IVn9gAoPIkiNbLUp6WNwANTuZxCt6wBfI=
X-Google-Smtp-Source: AGHT+IHQLiB9sMkcyROtmjEeaXbI24k2BrWqYqJNsE5MgNRn9Q3TM1orHUyAeTwZvuKdWojnragSdw==
X-Received: by 2002:a05:6512:6c8:b0:57a:8eb7:1ea2 with SMTP id
 2adb3069b0e04-592fc154dd4mr3156635e87.27.1761552383809; 
 Mon, 27 Oct 2025 01:06:23 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41ce8sm2210689e87.6.2025.10.27.01.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 01:06:22 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 27 Oct 2025 09:05:41 +0100
Subject: [PATCH v2 1/6] drm/sitronix/st7571-i2c: rename 'struct drm_device'
 in st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-st7571-split-v2-1-8352fb278d21@gmail.com>
References: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
In-Reply-To: <20251027-st7571-split-v2-0-8352fb278d21@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7030;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=uQbA0rKYunCTI3/XflhoFu8URyEuC+L2ECojxVblZ4c=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo/yfejWKPA2jbFMsz2tZ1j5znPFP13D1ywrh68
 efLU3i428mJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaP8n3gAKCRCIgE5vWV1S
 MtyyD/9Q0LjBzLqpbGdDWU7cVqRQIF7w1xCwikr04evge3uf2R+1vxMP0fT8DYs0102vuX98IYN
 pYSzurCQlzxounNsTVEoVODIlrZuLk0tNe1/dDFWeEeveRxWvkOLmiz2h/MIALWl9kCQ9ALNG7z
 A5LuLYYUs/JnVIV2kgjT3jskK63JLMcb70+CKSeMicL/cA8iWh8JTRwjO38s1uPZqzx+yQj9qiN
 WZ9TVrc1zUH7kw94jbubzPUlyNir/34D4mll08u3PnA3DonRHrZeWFDsfCj+SrtYgtsmI1kUKxr
 yQ6tFcZy7fTR0aSJIPBseamBKsUeRQLXKzuV/PvCxa4Z4okXsjZbMhKR1FxyyHEfIEYNUa7lsaN
 nxqPighXRaBGZ1gKrhS+dsrEGTnYrbrVryuSRtb2S6v41F7bH230CSGLJaEbhMcU2XdhfC+rx7H
 2hckFffe3S88uxU12iDPzL0JMikLSrSgN6HNzXJQQ/2Fpr626VSnxR3x48oQa7JQeaD5mPib1sx
 LzePCWdzyvaC3aZ6cvgP825zAgOXEVa0XyPLsgA8r3C4FkekFNQe3/MYGxSf42qfiDjgp03Ncd2
 61qhQLDRiOKcmgn0yTp2/+6W5R4fKkilIO0h0uYAVsnQ/Ld2AKJL8iIs0IO17wBYTleJ/IoN7nY
 9w4QpY7bAerivXQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Rename st7571_device.dev to st7571_device.drm in preparation to
introduce a 'struct device' member to this structure.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/gpu/drm/sitronix/st7571-i2c.c | 60 +++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 4e73c8b415d677dab5b421666b56f4bb3697b982..71814a3eb93b7adf554da082a0237da371e5f5b5 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -112,7 +112,7 @@ struct st7571_panel_format {
 };
 
 struct st7571_device {
-	struct drm_device dev;
+	struct drm_device drm;
 
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
@@ -166,9 +166,9 @@ struct st7571_device {
 	u8 *row;
 };
 
-static inline struct st7571_device *drm_to_st7571(struct drm_device *dev)
+static inline struct st7571_device *drm_to_st7571(struct drm_device *drm)
 {
-	return container_of(dev, struct st7571_device, dev);
+	return container_of(drm, struct st7571_device, drm);
 }
 
 static int st7571_regmap_write(void *context, const void *data, size_t count)
@@ -467,7 +467,7 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_atomic_helper_damage_iter iter;
-	struct drm_device *dev = plane->dev;
+	struct drm_device *drm = plane->dev;
 	struct drm_rect damage;
 	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
 	int ret, idx;
@@ -479,7 +479,7 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (ret)
 		return;
 
-	if (!drm_dev_enter(dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		goto out_drm_gem_fb_end_cpu_access;
 
 	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
@@ -501,11 +501,11 @@ static void st7571_primary_plane_helper_atomic_update(struct drm_plane *plane,
 static void st7571_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
-	struct drm_device *dev = plane->dev;
+	struct drm_device *drm = plane->dev;
 	struct st7571_device *st7571 = drm_to_st7571(plane->dev);
 	int idx;
 
-	if (!drm_dev_enter(dev, &idx))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
 	st7571_fb_clear_screen(st7571);
@@ -621,20 +621,20 @@ static struct drm_display_mode st7571_mode(struct st7571_device *st7571)
 
 static int st7571_mode_config_init(struct st7571_device *st7571)
 {
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	const struct st7571_panel_constraints *constraints = &st7571->pdata->constraints;
 	int ret;
 
-	ret = drmm_mode_config_init(dev);
+	ret = drmm_mode_config_init(drm);
 	if (ret)
 		return ret;
 
-	dev->mode_config.min_width = constraints->min_ncols;
-	dev->mode_config.min_height = constraints->min_nlines;
-	dev->mode_config.max_width = constraints->max_ncols;
-	dev->mode_config.max_height = constraints->max_nlines;
-	dev->mode_config.preferred_depth = 24;
-	dev->mode_config.funcs = &st7571_mode_config_funcs;
+	drm->mode_config.min_width = constraints->min_ncols;
+	drm->mode_config.min_height = constraints->min_nlines;
+	drm->mode_config.max_width = constraints->max_ncols;
+	drm->mode_config.max_height = constraints->max_nlines;
+	drm->mode_config.preferred_depth = 24;
+	drm->mode_config.funcs = &st7571_mode_config_funcs;
 
 	return 0;
 }
@@ -643,10 +643,10 @@ static int st7571_plane_init(struct st7571_device *st7571,
 			     const struct st7571_panel_format *pformat)
 {
 	struct drm_plane *primary_plane = &st7571->primary_plane;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_universal_plane_init(dev, primary_plane, 0,
+	ret = drm_universal_plane_init(drm, primary_plane, 0,
 				       &st7571_primary_plane_funcs,
 				       pformat->formats,
 				       pformat->nformats,
@@ -665,10 +665,10 @@ static int st7571_crtc_init(struct st7571_device *st7571)
 {
 	struct drm_plane *primary_plane = &st7571->primary_plane;
 	struct drm_crtc *crtc = &st7571->crtc;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+	ret = drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
 					&st7571_crtc_funcs, NULL);
 	if (ret)
 		return ret;
@@ -682,10 +682,10 @@ static int st7571_encoder_init(struct st7571_device *st7571)
 {
 	struct drm_encoder *encoder = &st7571->encoder;
 	struct drm_crtc *crtc = &st7571->crtc;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_encoder_init(dev, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
+	ret = drm_encoder_init(drm, encoder, &st7571_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ret;
 
@@ -700,10 +700,10 @@ static int st7571_connector_init(struct st7571_device *st7571)
 {
 	struct drm_connector *connector = &st7571->connector;
 	struct drm_encoder *encoder = &st7571->encoder;
-	struct drm_device *dev = &st7571->dev;
+	struct drm_device *drm = &st7571->drm;
 	int ret;
 
-	ret = drm_connector_init(dev, connector, &st7571_connector_funcs,
+	ret = drm_connector_init(drm, connector, &st7571_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret)
 		return ret;
@@ -934,15 +934,15 @@ static int st7571_lcd_init(struct st7571_device *st7571)
 static int st7571_probe(struct i2c_client *client)
 {
 	struct st7571_device *st7571;
-	struct drm_device *dev;
+	struct drm_device *drm;
 	int ret;
 
 	st7571 = devm_drm_dev_alloc(&client->dev, &st7571_driver,
-				    struct st7571_device, dev);
+				    struct st7571_device, drm);
 	if (IS_ERR(st7571))
 		return PTR_ERR(st7571);
 
-	dev = &st7571->dev;
+	drm = &st7571->drm;
 	st7571->client = client;
 	i2c_set_clientdata(client, st7571);
 	st7571->pdata = device_get_match_data(&client->dev);
@@ -1010,14 +1010,14 @@ static int st7571_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to initialize connector\n");
 
-	drm_mode_config_reset(dev);
+	drm_mode_config_reset(drm);
 
-	ret = drm_dev_register(dev, 0);
+	ret = drm_dev_register(drm, 0);
 	if (ret)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to register DRM device\n");
 
-	drm_client_setup(dev, NULL);
+	drm_client_setup(drm, NULL);
 	return 0;
 }
 
@@ -1025,7 +1025,7 @@ static void st7571_remove(struct i2c_client *client)
 {
 	struct st7571_device *st7571 = i2c_get_clientdata(client);
 
-	drm_dev_unplug(&st7571->dev);
+	drm_dev_unplug(&st7571->drm);
 }
 
 static const struct st7571_panel_data st7567_config = {

-- 
2.50.1

