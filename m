Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6DD7A7A5D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F5F10E48A;
	Wed, 20 Sep 2023 11:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975CA10E485
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25DA71FF94;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmewoM+IvqmWJAqXE98iA1NortEl+mck/PZYuZVanjs=;
 b=g0wIeQ586/2quvgOnHbpQrmymWY06+2VMiOViaKtvl7Kt6UgCZYQ+SJk0v6YUtLlnb901/
 praOP9l9Uq9lYeKduA5xvHe/zIgCg+cPKLLSr+FhQ7U12ZPzkQHDcK8dU5513k8aoBkFQO
 dAM7RskXjHA9UHcgfyeYhe+gbYscuZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jmewoM+IvqmWJAqXE98iA1NortEl+mck/PZYuZVanjs=;
 b=d3LdfXxUBi9VBUdcLJuEUi4n4r+MVqP+cTw6axBVQTZ+tCKinfqh5nS4dfwxO60SyTIrMk
 yp0lVIukF/wtxZDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2A2613A64;
 Wed, 20 Sep 2023 11:25:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8G+CNpbWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 3/8] drm/simpledrm: Store xfrm buffer in device instance
Date: Wed, 20 Sep 2023 13:10:15 +0200
Message-ID: <20230920112508.11770-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
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
possibly reallocating temporary memory on each display update. Unloading
the DRM device also releases the xfrm buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 8aceb7d378dea..31fc32a00d0a5 100644
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
@@ -714,6 +713,10 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	sdev->format = format;
 	sdev->pitch = stride;
 
+	ret = drmm_xfrm_buf_init(dev, &sdev->xfrm);
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
 		&format->format, width, height, stride);
-- 
2.42.0

