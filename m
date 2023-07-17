Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCCF756927
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 18:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A31210E282;
	Mon, 17 Jul 2023 16:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AC910E282
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689611436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8nAP8i+/RlYWCgICvMKs8Kk9RCBuGSDJRHbL6yq/h/0=;
 b=a5F2e7gxu4NhCde1WDFhwRCeiWevaZBMRmUqOzCv02ek0jbIwu95JdpOLsL00mRViksRaX
 hHU+jrwVKliZO/CFa16NRViMAHLa2nTR9Mg3puqU5bWtKVBiwGBbsUtMtYveSH2Rizq87F
 NXs5kF/Ki8vLSzCVKh71kp8wNlGq7Q4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-WPSUheI-M7OyZPw7hQCjPg-1; Mon, 17 Jul 2023 12:30:34 -0400
X-MC-Unique: WPSUheI-M7OyZPw7hQCjPg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4fb7ea6652bso3906215e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689611433; x=1692203433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nAP8i+/RlYWCgICvMKs8Kk9RCBuGSDJRHbL6yq/h/0=;
 b=bv15zTNa/ValTzlX7e/2LUoJwtjNI9JoTI8gKSgn/Y3ulQMcCR9mrZsswPpGUGAC8e
 DOaQgNj/IwP/eoj5ZgjBSuBg7NayVH4HqBWa/WzNN43ONz8tQNPu7F4CKB+CpCErqst/
 9M7GqKUwWEnEbF8oVWwzlDBOYJY9Bt0xCAYodAVkTvsKmf4iAPVVfzpg1mW/1spdoGJG
 wVFlCYiGuL7hSoqyfPjw35l0d6n3zf1B84zPL2bynjNt9tdyRD+rDDhWwl4qLD40DqaU
 Vg1ZM2sc18uStYNujKflZroB1AXnOp8dP47HRZiZtQkIPKTB4obAEvWSz6gyk/AY+edl
 tqKw==
X-Gm-Message-State: ABy/qLaENLNGWZgTKEf4STix/EhPGFfMm8xPkMSl5ysWrjyCJHQWMoo8
 aIrw+FH5Sg34DjuO5ikKnYXcl6Ui/5Ku/vG3fhuw+gvwtkUaZKXdggtOo98kCB7Arzrr8uBIdXi
 mMgVQD7WHPcRKUwzOeKi6zuaUYlSD
X-Received: by 2002:a05:6512:3142:b0:4fd:bd94:e6cb with SMTP id
 s2-20020a056512314200b004fdbd94e6cbmr1909325lfi.35.1689611433130; 
 Mon, 17 Jul 2023 09:30:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH9Ed5A6amQ9D0r7nUm2FKGzLSvk1RceJdPhhJmLN1TXt0QY5li3ng3K5dGB8E6mM1n3FNdUA==
X-Received: by 2002:a05:6512:3142:b0:4fd:bd94:e6cb with SMTP id
 s2-20020a056512314200b004fdbd94e6cbmr1909305lfi.35.1689611432704; 
 Mon, 17 Jul 2023 09:30:32 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y25-20020a7bcd99000000b003fc04eb92cbsm140379wmj.44.2023.07.17.09.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 09:30:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
Date: Mon, 17 Jul 2023 18:30:22 +0200
Message-ID: <20230717163027.480918-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert reports that the following NULL pointer dereference happens for him
after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
plane update"):

    [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
    ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
    and format(R1   little-endian (0x20203152))
    Unable to handle kernel NULL pointer dereference at virtual address 00000000
    Oops [#1]
    CPU: 0 PID: 1 Comm: swapper Not tainted
    6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
    epc : ssd130x_update_rect.isra.0+0x13c/0x340
     ra : ssd130x_update_rect.isra.0+0x2bc/0x340
    ...
    status: 00000120 badaddr: 00000000 cause: 0000000f
    [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
    [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
    [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
    [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
    [<c02f94fc>] commit_tail+0x190/0x1b8
    [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
    [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
    [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
    [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
    [<c02cd064>] drm_client_modeset_commit+0x34/0x64
    [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
    [<c0303424>] drm_fb_helper_set_par+0x38/0x58
    [<c027c410>] fbcon_init+0x294/0x534
    ...

The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
and this leads to drm_atomic_helper_commit_planes() attempting to commit
the atomic state for all planes, even the ones whose CRTC is not enabled.

Since the primary plane buffer is allocated in the encoder .atomic_enable
callback, this happens after that initial modeset commit and leads to the
mentioned NULL pointer dereference.

Fix this by allocating the buffers in the struct drm_plane_helper_funcs
.begin_fb_access callback and free them in to .end_fb_access callback,
instead of doing it when the encoder is enabled.

Fixes: 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each plane update")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v3:
- Move the buffers allocation to the plane helper funcs .begin_fb_access
  and the free to .end_fb_access callbacks.
- Always allocate intermediate buffer because is use in ssd130x_clear_screen().
- Don't allocate the buffers as device managed resources.

Changes in v2:
- Move the buffers allocation to .fb_create instead of preventing atomic
  updates for disable planes.
- Don't allocate the intermediate buffer when using the native R1 format.
- Allocate buffers as device managed resources.

 drivers/gpu/drm/solomon/ssd130x.c | 33 ++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index afb08a8aa9fc..be68b63200a0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -612,6 +612,30 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 	return ret;
 }
 
+static int ssd130x_primary_plane_helper_begin_fb_access(struct drm_plane *plane,
+							struct drm_plane_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	int ret = ssd130x_buf_alloc(ssd130x);
+
+	if (ret)
+		return ret;
+
+	return drm_gem_begin_shadow_fb_access(plane, state);
+}
+
+static void ssd130x_primary_plane_helper_end_fb_access(struct drm_plane *plane,
+						       struct drm_plane_state *state)
+{
+	struct drm_device *drm = plane->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+
+	ssd130x_buf_free(ssd130x);
+
+	return drm_gem_end_shadow_fb_access(plane, state);
+}
+
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
@@ -656,7 +680,8 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.begin_fb_access = ssd130x_primary_plane_helper_begin_fb_access,
+	.end_fb_access = ssd130x_primary_plane_helper_end_fb_access,
 	.atomic_check = drm_plane_helper_atomic_check,
 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
@@ -719,10 +744,6 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	if (ret)
 		goto power_off;
 
-	ret = ssd130x_buf_alloc(ssd130x);
-	if (ret)
-		goto power_off;
-
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_ON);
 
 	backlight_enable(ssd130x->bl_dev);
@@ -744,8 +765,6 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 
 	ssd130x_write_cmd(ssd130x, 1, SSD130X_DISPLAY_OFF);
 
-	ssd130x_buf_free(ssd130x);
-
 	ssd130x_power_off(ssd130x);
 }
 
-- 
2.41.0

