Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A727A867F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4D10E4CC;
	Wed, 20 Sep 2023 14:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4858E10E4C4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:25:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1D7021DB5;
 Wed, 20 Sep 2023 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695219938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGMN5q6rdUH1L5BLq6S4fdNwN0O/jl20KxXXKAMQIRM=;
 b=zlBxCVNR/tUiEy2+eGlwDERibp35feQhbFSZ1LlGs225a1XQkquGDhm9v6YTTCSbLugo/f
 6gwILj6ys42dyFAf+vpt/CC4pLYzQShqLnXBmzfEOGn+zUAfwQxZ0OGRV+xP78EoFZaDXX
 WPme0rA8/HPU6tEoKXK4JSGqGf5cROI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695219938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGMN5q6rdUH1L5BLq6S4fdNwN0O/jl20KxXXKAMQIRM=;
 b=fi5H4SjMuFWN1BA9yfn37eSujEe/aOz98NfeDdSrhCR9bBVBKkK7DDzYa0kyJckgdWfKAC
 ktGo+Lynf+zFtvDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8941913A64;
 Wed, 20 Sep 2023 14:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SHDMIOIAC2W+IQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 14:25:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v2 3/5] drm/simpledrm: Store xfrm buffer in device instance
Date: Wed, 20 Sep 2023 16:24:29 +0200
Message-ID: <20230920142535.19321-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920142535.19321-1-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store and instance of struct drm_xfrm_buf in struct simpledrm_device
and keep the allocated memory allocated across display updates. Avoid
possibly reallocating temporary memory on each display update. Instead
preallocate temporary memory during initialization. Releasing the DRM
device also releases the xfrm buffer.

v2:
	* reserve storage during probe

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 8aceb7d378dea..a3d8a956a4c4e 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -232,6 +232,7 @@ struct simpledrm_device {
 	struct drm_display_mode mode;
 	const struct drm_format_info *format;
 	unsigned int pitch;
+	struct drm_xfrm_buf xfrm;
 
 	/* memory management */
 	struct iosys_map screen_base;
@@ -486,7 +487,6 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = plane->dev;
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
-	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -508,13 +508,12 @@ static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip));
 		drm_fb_blit(&dst, &sdev->pitch, sdev->format->format, shadow_plane_state->data,
-			    fb, &damage, &xfrm);
+			    fb, &damage, &sdev->xfrm);
 	}
 
 	drm_dev_exit(idx);
 out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-	drm_xfrm_buf_release(&xfrm);
 }
 
 static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
@@ -637,6 +636,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_connector *connector;
 	unsigned long max_width, max_height;
 	size_t nformats;
+	void *buf;
 	int ret;
 
 	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
@@ -718,6 +718,13 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
 
+	ret = drmm_xfrm_buf_init(dev, &sdev->xfrm);
+	if (ret)
+		return ERR_PTR(ret);
+	buf = drm_xfrm_buf_reserve(&sdev->xfrm, sdev->pitch, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
 	/*
 	 * Memory management
 	 */
-- 
2.42.0

