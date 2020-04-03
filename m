Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BB919D854
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ECD6EBA8;
	Fri,  3 Apr 2020 13:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E376EBD0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c7so8634472wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGpFhZaw7sq71BxbA7Oq7CHm/5D5Y/ZUzgT99phwRsU=;
 b=NEoE18t1B2kymF83R9A++jeRMuDFPbGrLI9qR40LXX9wre/abs8eRsUqSKYb2HhXkf
 sFiWC5tCE0ngw12Gxcy+hwfaCBwODEWzxrT3oSeLPQKuxPKHVhOD35w8i+1PjvOLwkA6
 ITCEs9b/O9raL7XwGqXAzesTOaess5pSznNsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGpFhZaw7sq71BxbA7Oq7CHm/5D5Y/ZUzgT99phwRsU=;
 b=UZfl1kjJBSzb8NHhaAf6BPMsUYwvuzFOCUsrnfyzj+s41huQhSRGUhlEcN+X9BsKft
 wty/NylW7/ZlbcXac+tRoYZrs2FPaYn4bikKEg0/tYon2Arg8UuQG5njH1RSCrFdlOT6
 GKDDvXTbYvEfbxQ8F/7H2QLPucuBO7XrZ+XShkMBNg+XBVRlc5+TFm9KWVyj4BxzWqFc
 15JoAG4VLLueqDRUFy5BwsbzKNUHXv1azf971Id9oR5tRzhv4dc7fD45Pa8cJXYDDe+z
 r/mBIe0GsuVEp96fj/YoUt0XtUO2bBc4TjCnNFfzXR/krCqpMxL8ulBy0aNsqDmoAtwS
 /nUw==
X-Gm-Message-State: AGi0PuY/yRBN2YovHBqZNAG4gStTGIEd2PjwnBIZX1cvu0BfYE2C7vur
 Sjhd50MT1VaCsC1d6Qgi4UboK2VWgCf6uw==
X-Google-Smtp-Source: APiQypIqNRbq1xht5I0TWYe6vrsrOTAxfAhxxWg/TFWyVYd8Wq8AolO2iMhvxXDNHOTzg/mHHkftJA==
X-Received: by 2002:a5d:6588:: with SMTP id q8mr6493781wru.189.1585922344474; 
 Fri, 03 Apr 2020 06:59:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/44] drm/gm12u320: Don't use drm_device->dev_private
Date: Fri,  3 Apr 2020 15:58:10 +0200
Message-Id: <20200403135828.2542770-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Upcasting using a container_of macro is more typesafe, faster and
easier for the compiler to optimize.

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
