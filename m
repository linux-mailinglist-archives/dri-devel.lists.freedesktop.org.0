Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D8441C73
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 15:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C5B6E873;
	Mon,  1 Nov 2021 14:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A076E86A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 14:15:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 262021FD77;
 Mon,  1 Nov 2021 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635776137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Us+JuarW7wj2bVLz71tBPMvL5zLwHFc1VCRBWlHHMk=;
 b=vS5d77OJnHdSprYUmUV8cVfYaKAW+EyrxYTJd2kOGagR2QdGaM9soVV0/PeRMv79JEzNBC
 Snux8KoffoWmgjmzGcOJixyRTTbvF+X7og8oSymcWpIWvX8FoR93O/XXNzPoDecSfnNz2N
 /dl7ZySPfWecity1gA2t2uOzijRWKPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635776137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Us+JuarW7wj2bVLz71tBPMvL5zLwHFc1VCRBWlHHMk=;
 b=OB5VMTCLWLL4QulrFXJAS64T8ICaZp7IA91808KWXO8XYXHaLbNORdixbF/QrdQSLFLN7p
 /8DmZ9XSxs4gt6AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B619A1342A;
 Mon,  1 Nov 2021 14:15:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6IdfK4j2f2GlHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 14:15:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Date: Mon,  1 Nov 2021 15:15:30 +0100
Message-Id: <20211101141532.26655-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101141532.26655-1-tzimmermann@suse.de>
References: <20211101141532.26655-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the FB_DAMAGE_CLIPS property to reduce display-update
overhead. Also fixes a warning in the kernel log.

  simple-framebuffer simple-framebuffer.0: [drm] drm_plane_enable_fb_damage_clips() not called

Fix the computation of the blit rectangle. This wasn't an issue so
far, as simpledrm always blitted the full framebuffer. The code now
supports damage clipping and virtual screen sizes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 571f716ff427..e872121e9fb0 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -642,7 +642,7 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
 	struct drm_device *dev = &sdev->dev;
 	void __iomem *dst = sdev->screen_base;
-	struct drm_rect clip;
+	struct drm_rect src_clip, dst_clip;
 	int idx;
 
 	if (!fb)
@@ -651,10 +651,14 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	drm_rect_init(&clip, 0, 0, fb->width, fb->height);
+	drm_rect_fp_to_int(&src_clip, &plane_state->src);
 
-	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
-	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
+		return;
+
+	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
+	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
 
 	drm_dev_exit(idx);
 }
@@ -686,20 +690,28 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = &sdev->dev;
 	void __iomem *dst = sdev->screen_base;
-	struct drm_rect clip;
+	struct drm_rect damage_clip, src_clip, dst_clip;
 	int idx;
 
 	if (!fb)
 		return;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage_clip))
+		return;
+
+	drm_rect_fp_to_int(&src_clip, &plane_state->src);
+	if (!drm_rect_intersect(&src_clip, &damage_clip))
+		return;
+
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
 		return;
 
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
-	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
+	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
+	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
 
 	drm_dev_exit(idx);
 }
@@ -794,6 +806,8 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 
+	drm_plane_enable_fb_damage_clips(&pipe->plane);
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.33.1

