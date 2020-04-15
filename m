Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F091A9490
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F023F6E889;
	Wed, 15 Apr 2020 07:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E346E890
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y24so17672954wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReCJUU6IY7CCpcoS3QvJR3O00W4B094Kofms6/olSkg=;
 b=CRpQlEYCYUAzHis5hjYpcF5162+u13MNocW4mOQkBFRfM+Y/HInV+bVUSRr1e5YyeV
 DVqH7sV9RCSVnHug6poOm2u95MbnYoIR7zd/4c1uRfBSlBmiDoosAkGFFGVxGJ5gvA6t
 88ENCoyy3aALvBTCISk4EGoZT8ReBe0N9z+8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReCJUU6IY7CCpcoS3QvJR3O00W4B094Kofms6/olSkg=;
 b=igDIYkoYxq6QsP/8FSTNc4o60/sj+kjgkqzBgmuLO7NZUOdYtMjlx+iNHb7NicTa55
 zafK41BCzIPFDCTv2jMANx4jYKdWz4o3WwSnjy93wWS9CwtwYHNLhB/7oO6yLfYXLxxt
 M2kI3lzSZEsCobAD9hziXU7HyoPl4TYwQ2zc+sQ8aDsQwZrOUNA+xIBKSaqVDiA50K1v
 n8cBuiBp2f9wMMjok7hndKIDiVOs3bxpfpQPR7szLQ2BiXw9lKOFw2EJ906IINXIRN+o
 O/ZlF/fbYSvmZK5ZCJMXM8XZApOkFcabY/suk5orX/+dbuBkHedntZd3MOwOWucRyh/L
 Q0AQ==
X-Gm-Message-State: AGi0PubPyllM9X/J2ZMDhXpJWActI2/OKJE/5hLUZ56OsUqwZkj5MQRp
 H1FAZjhZ1UDhKq/q4uaSRso9EDkSx+8=
X-Google-Smtp-Source: APiQypJJ3jikxWudwRuvSUirNX+5BDh7qw2Bm1grAfWpwNpj8YInrmX8RdIPYiPkPEkxL2s+iAfw0Q==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr3786213wmj.139.1586936463893; 
 Wed, 15 Apr 2020 00:41:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 22/59] drm/gm12u320: Don't use drm_device->dev_private
Date: Wed, 15 Apr 2020 09:39:57 +0200
Message-Id: <20200415074034.175360-23-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/tiny/gm12u320.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index 907739a67bf6..cc397671f689 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -98,6 +98,8 @@ struct gm12u320_device {
 	} fb_update;
 };
 
+#define to_gm12u320(__dev) container_of(__dev, struct gm12u320_device, dev)
+
 static const char cmd_data[CMD_SIZE] = {
 	0x55, 0x53, 0x42, 0x43, 0x00, 0x00, 0x00, 0x00,
 	0x68, 0xfc, 0x00, 0x00, 0x00, 0x00, 0x10, 0xff,
@@ -408,7 +410,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 static void gm12u320_fb_mark_dirty(struct drm_framebuffer *fb,
 				   struct drm_rect *dirty)
 {
-	struct gm12u320_device *gm12u320 = fb->dev->dev_private;
+	struct gm12u320_device *gm12u320 = to_gm12u320(fb->dev);
 	struct drm_framebuffer *old_fb = NULL;
 	bool wakeup = false;
 
@@ -558,7 +560,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 				 struct drm_plane_state *plane_state)
 {
 	struct drm_rect rect = { 0, 0, GM12U320_USER_WIDTH, GM12U320_HEIGHT };
-	struct gm12u320_device *gm12u320 = pipe->crtc.dev->dev_private;
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
 
 	gm12u320->fb_update.draw_status_timeout = FIRST_FRAME_TIMEOUT;
 	gm12u320_fb_mark_dirty(plane_state->fb, &rect);
@@ -566,7 +568,7 @@ static void gm12u320_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 static void gm12u320_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct gm12u320_device *gm12u320 = pipe->crtc.dev->dev_private;
+	struct gm12u320_device *gm12u320 = to_gm12u320(pipe->crtc.dev);
 
 	gm12u320_stop_fb_update(gm12u320);
 }
@@ -641,7 +643,6 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	mutex_init(&gm12u320->fb_update.lock);
 
 	dev = &gm12u320->dev;
-	dev->dev_private = gm12u320;
 
 	ret = drmm_mode_config_init(dev);
 	if (ret)
@@ -706,7 +707,7 @@ static __maybe_unused int gm12u320_suspend(struct usb_interface *interface,
 static __maybe_unused int gm12u320_resume(struct usb_interface *interface)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
-	struct gm12u320_device *gm12u320 = dev->dev_private;
+	struct gm12u320_device *gm12u320 = to_gm12u320(dev);
 
 	gm12u320_set_ecomode(gm12u320);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
