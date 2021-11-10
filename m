Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91A44BEE6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B806EC5F;
	Wed, 10 Nov 2021 10:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301626E9CD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 10:37:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB8D11FD74;
 Wed, 10 Nov 2021 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636540626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4vUWBZxdqpwrdMFvztzjFWu33XEMeIjKvF6p3F68ko=;
 b=PXRc/+jR/BpRJ2gjWjjT51cThj+CLEDJ6OtRptURPn381jJ9S3hDDW/BoFfZN2uvqkz+YS
 9vH67QCNE804kujDuj/2ecnMlXbVe1Eehx1eRgkYlEkVJ7gyAAt6AgZDhTpexNJJctF9qY
 KVanQ2aJMslDYEl7yY/pFq1k60bXFok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636540626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4vUWBZxdqpwrdMFvztzjFWu33XEMeIjKvF6p3F68ko=;
 b=7rI2BNbDGnFxZ7FvRs81yC0uYD9WxPH6dT6fUNCau7JrTlPrxZdKRqX1LQzhGaQMH1WYJC
 zNT+tgnfgYR6RUCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6375713E72;
 Wed, 10 Nov 2021 10:37:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gEtZF9Kgi2EnPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Nov 2021 10:37:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Subject: [PATCH v3 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Date: Wed, 10 Nov 2021 11:37:00 +0100
Message-Id: <20211110103702.374-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211110103702.374-1-tzimmermann@suse.de>
References: <20211110103702.374-1-tzimmermann@suse.de>
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

v3:
	* fix drm_dev_enter() error path (Noralf)
	* remove unnecessary clipping from update function (Noralf)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 571f716ff427..7c7d0aca8e31 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -642,19 +642,23 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	void *vmap = shadow_plane_state->data[0].vaddr; /* TODO: Use mapping abstraction */
 	struct drm_device *dev = &sdev->dev;
 	void __iomem *dst = sdev->screen_base;
-	struct drm_rect clip;
+	struct drm_rect src_clip, dst_clip;
 	int idx;
 
 	if (!fb)
 		return;
 
-	if (!drm_dev_enter(dev, &idx))
+	drm_rect_fp_to_int(&src_clip, &plane_state->src);
+
+	dst_clip = plane_state->dst;
+	if (!drm_rect_intersect(&dst_clip, &src_clip))
 		return;
 
-	drm_rect_init(&clip, 0, 0, fb->width, fb->height);
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
-	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &clip);
-	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &clip);
+	dst += drm_fb_clip_offset(sdev->pitch, sdev->format, &dst_clip);
+	drm_fb_blit_toio(dst, sdev->pitch, sdev->format->format, vmap, fb, &src_clip);
 
 	drm_dev_exit(idx);
 }
@@ -686,20 +690,24 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_device *dev = &sdev->dev;
 	void __iomem *dst = sdev->screen_base;
-	struct drm_rect clip;
+	struct drm_rect src_clip, dst_clip;
 	int idx;
 
 	if (!fb)
 		return;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
+	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
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
@@ -794,6 +802,8 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 
+	drm_plane_enable_fb_damage_clips(&pipe->plane);
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.33.1

