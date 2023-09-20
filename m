Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F647A7A5F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EAF10E489;
	Wed, 20 Sep 2023 11:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C6810E485
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BE8221CBF;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOzQ7qpNA+KclMliSOuSDd4MVYyYAHN23hnajIi4Ch0=;
 b=M8zcAjYu2zqo9iOAfLuu1t3pTlVDkSxBH15/S8SKiOsHV/+xxehzABfRp38nwBhMXHYpfD
 7wYL5YxgyMojcIh9B1n93PSESY1aznqte2hX4yduOcaTq5o2vKVc6lYNSLn4Ob5GLWnKYp
 G2Dodu6JaRSa/090H9g55FTR/gT0ZyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOzQ7qpNA+KclMliSOuSDd4MVYyYAHN23hnajIi4Ch0=;
 b=5DVyPeWPJok4p5E9i+RJjVYSXx2MWH5Bm11rrw2bPJL+KgvQbXOxupGX9BjT+t0d5pt1ej
 aEgTbXXlebPBgABA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 647E013A64;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UIWkF5fWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 5/8] drm/ofdrm: Store xfrm buffer in device instance
Date: Wed, 20 Sep 2023 13:10:17 +0200
Message-ID: <20230920112508.11770-6-tzimmermann@suse.de>
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

Store and instance of struct drm_xfrm_buf in struct ofdrm_device and
keep the allocated memory allocated across display updates. Avoid
possibly reallocating temporary memory on each display update. Unloading
the DRM device also releases the xfrm buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/ofdrm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 1add55c872670..08e4b04e0590e 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -301,6 +301,7 @@ struct ofdrm_device {
 	struct drm_display_mode mode;
 	const struct drm_format_info *format;
 	unsigned int pitch;
+	struct drm_xfrm_buf xfrm;
 
 	/* colormap */
 	void __iomem *cmap_base;
@@ -796,7 +797,6 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_framebuffer *fb = plane_state->fb;
 	unsigned int dst_pitch = odev->pitch;
 	const struct drm_format_info *dst_format = odev->format;
-	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	struct drm_atomic_helper_damage_iter iter;
 	struct drm_rect damage;
 	int ret, idx;
@@ -818,13 +818,12 @@ static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
 		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage, &xfrm);
+			    &damage, &odev->xfrm);
 	}
 
 	drm_dev_exit(idx);
 out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-	drm_xfrm_buf_release(&xfrm);
 }
 
 static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
@@ -1248,6 +1247,10 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
 		&format->format, width, height, linebytes);
 
+	ret = drmm_xfrm_buf_init(dev, &odev->xfrm);
+	if (ret)
+		return ERR_PTR(ret);
+
 	/*
 	 * Mode-setting pipeline
 	 */
-- 
2.42.0

