Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0F69B34D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 20:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED00610E3F7;
	Fri, 17 Feb 2023 19:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088E210E3F5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 19:48:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 4-20020a05600c22c400b003dc4fd6e61dso1727134wmg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xaBw08urxKUo5JSmpDDfS1lNSPeAgpHzFtsTJuJDAIU=;
 b=AAj5Xb2R7/HgeEnH29CMXNJGQwDcUBraK0G1eul+l9W1vDVVakswU+cgtlO77AkGuG
 /ZZaSCN/rdLVUpfreTYc0wmj0oLwRK9AsFDVjM1Pbut3rbk/4GyPJyKQ6W2IqGQUMi59
 TOLkpvN1/8hVKLjQAGSb/fKGYB4PZUfctnEmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xaBw08urxKUo5JSmpDDfS1lNSPeAgpHzFtsTJuJDAIU=;
 b=kFoRQamawXDfnoSLIqB50ID9NMdh94bChMO1IPtaul5cIx+yUUtk9+g+nPecsNTQ7k
 RscKt1BLDfhq5IG6a1YNgSUPENcdUwLuDtnXJ7tjgah3lfD5DoxEQmafPpwz38hCbsvv
 o32kdI8RTekRqXeC1SxLX+6EjO1xLhZIqQGBIBwJXvdW3SPIi5Lo6ZTqLyJvdumJZldD
 scY+KeSJIPCtcSqiDeXUXrvfswkuJalyG95qODrpW82/8BWVfD5BSuMZWeuETtzO5E+I
 jzBpliH/g6D1YkTGDq2ub0pqrLbD0l67ePLf2snK58nitP7Kg7r2HDl418zVvZakizFP
 Izug==
X-Gm-Message-State: AO0yUKU+2lAi7WFJoe5p6G0iiZc6WRhtlExubSU8iusFT/nF/Jms+TNC
 diff1RWFru4Ubirw7+AsOytlNKid7FyLoduw
X-Google-Smtp-Source: AK7set9jof6vUirFVufcodoWEDp/+cLVvh+GimMB8GunWeKY8iszaGOEwBeM1lIk3TpRYbGy28hpZA==
X-Received: by 2002:a05:600c:3b24:b0:3dc:5ae4:c13d with SMTP id
 m36-20020a05600c3b2400b003dc5ae4c13dmr2834935wms.4.1676663310497; 
 Fri, 17 Feb 2023 11:48:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056000118200b002c54fb024b2sm4985966wrx.61.2023.02.17.11.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 11:48:30 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb-helper: Try to protect cleanup against delayed setup
Date: Fri, 17 Feb 2023 20:47:57 +0100
Message-Id: <20230217194757.5991-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some vague evidences suggests this can go wrong. Try to prevent it by
holding the right mutex and clearing ->deferred_setup to make sure we
later on don't accidentally try to re-register the fbdev when the
driver thought it had it all cleaned up already.

v2: I realized that this is fundamentally butchered, and CI complained
about lockdep splats. So limit the critical section again and just add
a few notes what the proper fix is.

References: https://intel-gfx-ci.01.org/tree/linux-next/next-20201215/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c     | 6 ++++++
 drivers/gpu/drm/drm_fbdev_generic.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3e17261a12b6..2415a2c7ca44 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -545,6 +545,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_info);
  * A wrapper around unregister_framebuffer, to release the fb_info
  * framebuffer device. This must be called before releasing all resources for
  * @fb_helper by calling drm_fb_helper_fini().
+ *
+ * Note that this is fundamentally racy on hotunload because it doen't handle
+ * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
  */
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
@@ -558,6 +561,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_info);
  * @fb_helper: driver-allocated fbdev helper, can be NULL
  *
  * This cleans up all remaining resources associated with @fb_helper.
+ *
+ * Note that this is fundamentally racy on hotunload because it doen't handle
+ * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
  */
 void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 {
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 365f80717fa1..1618109592ce 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -347,7 +347,12 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
+	mutex_lock(&fb_helper->lock);
+	fb_helper->deferred_setup = false;
+	mutex_unlock(&fb_helper->lock);
+
 	if (fb_helper->info) {
+		/* drm_fbdev_fb_destroy() takes care of cleanup */
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
 		drm_client_release(&fb_helper->client);
-- 
2.39.0

