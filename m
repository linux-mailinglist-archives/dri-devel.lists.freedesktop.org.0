Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93B3C71B0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D136E0AF;
	Tue, 13 Jul 2021 13:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDC36E0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:59:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i94so30601825wri.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YydAG2DcMEmgxcLivuTtxWGeOd7fbFGRECd/sa24wQ=;
 b=F0ZCsLuvDZbH1NpL9Gr8BR4m7vPWuJoj2pxLHSMHE0jfMa7Z0qaez9/Mpy1mjvXBl9
 7Qz4+MaMVubEkwDD/Xn2dkGltVI/9wAMgZi0RASsIxWaRziwmfrOF9VuMTI/xtk1L0oK
 FE1lfIvEgStA04R+4uXa/RaoiNqOSNFUNBJ8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9YydAG2DcMEmgxcLivuTtxWGeOd7fbFGRECd/sa24wQ=;
 b=G9sZBc8pxJOXdRyUdqJ0C2ZABSyXVLKrb2Nq71cf/mhXI0u2KOSzEu82VnBE59T1W6
 zCI9EMmZT+i6flMONbsgm37pZFBOkbux5V62qL18HBz0ktsvwXwwxQsOyNisyE39afve
 KQgOdiVkBO3mLTrxTBI8zNlDBxMiBxHvkRwBwmtwgQ7OU/bLCVtR+0chTgYpq4QYfdj/
 zEbRdBCc6mJJpEr8aVj1KrxK6msWcJG8mbTvcVzQ2v7AIoGQkKteO+peWeKH7tpwvwZ5
 l5C+aOwryEBvkSDQVNs1OAW94GcIoyrtOkr5gk5laf0olBuNGfCakza2StoBzr1wu+D3
 gntA==
X-Gm-Message-State: AOAM53105DJuO8pM2J9pyrXNVdDtHqtmvg0YnA9yXF6qeqN1v7uoLsFR
 d1u6YQUZ9K9eTgP/vnROf5KYgy+U+CcHXg==
X-Google-Smtp-Source: ABdhPJzwXAzU2cpdYTqZ3JYfNKp8ntaA14B4FhpXI+wfK3KsiogYVTJfuXOFUIsZYWMn7szF8KW7jA==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr6084401wrt.251.1626184793688; 
 Tue, 13 Jul 2021 06:59:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u18sm15260452wmj.15.2021.07.13.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:59:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb-helper: Try to protect cleanup against delayed setup
Date: Tue, 13 Jul 2021 15:59:22 +0200
Message-Id: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
 drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 9d82fda274eb..8f11e5abb222 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -598,6 +598,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
  * A wrapper around unregister_framebuffer, to release the fb_info
  * framebuffer device. This must be called before releasing all resources for
  * @fb_helper by calling drm_fb_helper_fini().
+ *
+ * Note that this is fundamentally racy on hotunload because it doen't handle
+ * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
  */
 void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
 {
@@ -611,6 +614,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
  * @fb_helper: driver-allocated fbdev helper, can be NULL
  *
  * This cleans up all remaining resources associated with @fb_helper.
+ *
+ * Note that this is fundamentally racy on hotunload because it doen't handle
+ * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
  */
 void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 {
@@ -2382,6 +2388,10 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
+	mutex_lock(&fb_helper->lock);
+	fb_helper->deferred_setup = false;
+	mutex_unlock(&fb_helper->lock);
+
 	if (fb_helper->fbdev)
 		/* drm_fbdev_fb_destroy() takes care of cleanup */
 		drm_fb_helper_unregister_fbi(fb_helper);
-- 
2.32.0

