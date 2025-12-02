Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD94C9AAB1
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E48210E5CD;
	Tue,  2 Dec 2025 08:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OcjLENBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22F10E5D1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 08:26:13 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5957f617ff0so5876917e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 00:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764663971; x=1765268771; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ehk/EozwE7/cxfYnvgp9ayPWLUem+ZdJVcEwqK4yNNQ=;
 b=OcjLENBKHryWr1ry8AyEd+b+5rzpIPMVuAVRrYbXcc3hNLY5SSNzm3X7UVClKoNnc1
 KnscEkHy1g8JnTo2AJfVtZbR162Doi/iIREhYb2VmZUzri26mqBVWvRx0NIk5uCzvw3V
 lS8v/zOyCn9P3cryLIE5vgfK69AcNg3dg7sn6GuNex3VBUCEKeMXkfA9zi2tZBwkYTNk
 TRuGBlBeAxpObs2ZsSpw4tVtmN+DyxkqVLNbiHfhXUJbX3CtNDH6ldxvjWGfGTAlYJs9
 K4KHAPexIiXKiwQumZqAGPwqQX3/aSlyez14t/G1TSzf7aQHlIhJzjTzcBTIlhStMDc+
 Yjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764663971; x=1765268771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ehk/EozwE7/cxfYnvgp9ayPWLUem+ZdJVcEwqK4yNNQ=;
 b=mxTk6DlAirS2yomLuO15jCkmdi5Zq3dXPbJRJXZPJhqVkd6n743EBAMwg/60rn+D6b
 WhvSIAgNMff10aCJvUgG7MYyJxTkH7Wo4UTy/YD1zhh+q3H64CGN+LnWdc4wnhrEo5Ww
 MRgB7ELoMl1qIJ7ojdgU2fEXYqupRi4mTtj2XPLwHWad7jU/MBFsrsPrTUvsoH0NMxz+
 2NN5Zp5/o8dvo6zJbjakQBcrilGMqw54B7jY9ovqgUK3/+cy3LPr4yXL3KEcCNMoW3ee
 u5GGLiLHRZdYXCY0MFxAUX+XCClOCQG0RX1ZRTDNY8HcHD/Mdop/efQ146Ih3wf4muug
 ++6A==
X-Gm-Message-State: AOJu0YwQyvQeczEo3k/uskHOvCCLlJSg03VKP7KnDn+XT9phh/rPgk55
 Xx1ELhvwSrHdL9mc8A5jJuu1N4WhSWQF/u5/Cs9KqtJts3Op297uiDCg
X-Gm-Gg: ASbGncus5z10HpxaR7TaXkYg7iOxda5FT73dktBr4GSHHWP1uhgnGgasWpYEvvTHPQp
 DuGeMnwsI2gMiZC829bcrlOPHdJtZM6WjREJS49rv9MY9Emxb/DU83W18b09JekeZAO9MVbRoUp
 Q/AJDCk8q85MO59OPFJ8nZQuK/D63B4oG+SITNWuFbqWfosyQEB+w2NYbQ0E2zAfa6L6IEemPJW
 1GDe0pnpo9rAblcE+gMan9PsO3zeHQbd6HXbB2zAyR1kjdnJjYxIjNDEUh9wMgj6FVqF97bd/QQ
 H22N2ZVIc5RPThl+Mb5BMp3c626wn8t9zxbzaoTvtJb+k6dWyw09bYiflJ7aO1CgmJdkUCi1GEf
 Lmf3SkNf2/mz3PPh8eeuv4FkyREnw60KDeXxDwajQteUGF5Q6kDhd0ti8bITJae71FVFsGPgNe0
 Yw8Z+Ib0jCmVuTOyQEpoV+6cDEV5pwV1WtWhc5ByH8I6A+AlyhZF4V9t5u
X-Google-Smtp-Source: AGHT+IGn2T85wokYidmksQDFSWwRuOXBrdA4VZkbxivgoRlutulXTcvFaDIsij4nNImXyquaI1JIEA==
X-Received: by 2002:a05:6512:2244:b0:594:25e6:8a3a with SMTP id
 2adb3069b0e04-596a3ebe2e3mr14705850e87.20.1764663971108; 
 Tue, 02 Dec 2025 00:26:11 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bf8b06bcsm4423727e87.25.2025.12.02.00.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 00:26:09 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:25:17 +0100
Subject: [PATCH RESEND v2 1/6] drm/sitronix/st7571-i2c: rename 'struct
 drm_device' in st7571_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-st7571-split-v2-1-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
In-Reply-To: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6974;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=pz5GhbAytN7MzkdHAjHi7UGCmM26Ce8ielPk5ZKAau4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLqKCjy/KEzcPiDjyL8MdZLNFm2fdUbSrHpZF1
 wdt0OlkpO2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6iggAKCRCIgE5vWV1S
 MutJD/wNJlCo3x33PsercGjfnIlt2DmZ5Xtj2KJ7l6xrQshjiqDURNUgX6Xd8iUr4Iw6ZAe2ytV
 25GKrpqn1xmGCdbEMeydzIKJ6cODiEsgvDKR21aqd5DepDPtd63/xUT/v+TG5ebOc/fQMXXb7nF
 9nC3m/f1zZ3dxm8JDkZ/pS5p0TBUQbMhtaFXw1kE/W7e9bkHjyK3Dd7kXf81AQscEQGonjq3Apo
 Xf14UMV7iZzvMd/hlempbkG5GZnSJoOR1UiZJbWeiZeAJIzEaotFH8+ttgYwNGbQiv6xTRDLotO
 RjcBfY35QK1NHvxDybn6igue0e58qA4A3WAS/q9708Lj14o+WJiv7AjmPE5/TuHqUOu92iCXe6/
 DgImFcARNBokmQ3sYRdOj+wsOTxFjqTJ9TvL5VYF9tsLhRhradeMd3y3L04VRiDhN4vTCCMdmqt
 NoOPwINGS/VGZ7G3f+19tmQ2pQPCudYIJzFKNLhG/C0iY/Nws4kgsSY8knMt7ZncxHwxQP29ASx
 hDx8gmKDGiOr55k/Bc3ULPtcGjVNjii2hVvMFI60P0u+b7vYOhqW5DcihgsTC1lIulbCUKgRnlQ
 LSyhIYMRaftbniagMXYVVOoA0ZV5BtWb8Oin69Jc7v+fdBGi2ndGtuapvVkvNnNQ3RqkURDJBwj
 94RqVahl3mktpUg==
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
index 4e73c8b415d6..71814a3eb93b 100644
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
2.51.2

