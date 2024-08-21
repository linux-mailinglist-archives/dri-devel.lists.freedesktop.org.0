Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E31E959E15
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 15:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66710EAA3;
	Wed, 21 Aug 2024 13:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="eFRyZ+Wp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j4wHcour";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eFRyZ+Wp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j4wHcour";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977ED10EA44;
 Wed, 21 Aug 2024 13:04:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3314E200AB;
 Wed, 21 Aug 2024 13:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab/NwJ4IumKFUFbcSowrscINQ8yOb0DMLg9hW0XHvZs=;
 b=eFRyZ+WpZg7ukrgFz6KbZ8tO3eJVvIVDPD+RZhTWrrYjuNBprg5K1t7D4NErSLdFlEX9tY
 r0mb+VM7FYsPLbqdRc/mAzeDaeuJ9UnqAr0e9ioJUe6FZlkVh2XoGVRRG1vzJO8Gu88Yal
 sW9EePSyrkfWkR7USB1Z2+55aYBGj6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab/NwJ4IumKFUFbcSowrscINQ8yOb0DMLg9hW0XHvZs=;
 b=j4wHcourTDQ0MueSvsSHIpn+p218sLBoG/3mZRIj5NJ1w03ODQClokX6rMhKLH4msfjUGu
 Z5MjFsc52muHtXCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724245465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab/NwJ4IumKFUFbcSowrscINQ8yOb0DMLg9hW0XHvZs=;
 b=eFRyZ+WpZg7ukrgFz6KbZ8tO3eJVvIVDPD+RZhTWrrYjuNBprg5K1t7D4NErSLdFlEX9tY
 r0mb+VM7FYsPLbqdRc/mAzeDaeuJ9UnqAr0e9ioJUe6FZlkVh2XoGVRRG1vzJO8Gu88Yal
 sW9EePSyrkfWkR7USB1Z2+55aYBGj6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724245465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab/NwJ4IumKFUFbcSowrscINQ8yOb0DMLg9hW0XHvZs=;
 b=j4wHcourTDQ0MueSvsSHIpn+p218sLBoG/3mZRIj5NJ1w03ODQClokX6rMhKLH4msfjUGu
 Z5MjFsc52muHtXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4CF013B18;
 Wed, 21 Aug 2024 13:04:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ALOnNtjlxWbXGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Aug 2024 13:04:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 86/86] drm/fb-helper: Remove struct drm_fb_helper.fb_probe
Date: Wed, 21 Aug 2024 15:00:23 +0200
Message-ID: <20240821130348.73038-87-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821130348.73038-1-tzimmermann@suse.de>
References: <20240821130348.73038-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza),to(RLazpx1r3qpnsfr8nfakn)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The callback fb_probe in struct drm_fb_helper is unused. Remove it.
New drivers should set struct drm_driver.fbdev_probe instead and call
drm_client_setup() to instantiate in-kernel DRM clients.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c |  8 ++++----
 include/drm/drm_fb_helper.h     | 17 -----------------
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 148de5727702..4968676a88a9 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1625,6 +1625,9 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	struct fb_info *info;
 	int ret;
 
+	if (drm_WARN_ON(dev, !dev->driver->fbdev_probe))
+		return -EINVAL;
+
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
 	if (ret) {
 		/* First time: disable all crtc's.. */
@@ -1634,10 +1637,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	}
 
 	/* push down into drivers */
-	if (dev->driver->fbdev_probe)
-		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
-	else if (fb_helper->funcs)
-		ret = fb_helper->funcs->fb_probe(fb_helper, &sizes);
+	ret = dev->driver->fbdev_probe(fb_helper, &sizes);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3dcb9a60e408..56cf0cae3321 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -69,23 +69,6 @@ struct drm_fb_helper_surface_size {
  * Driver callbacks used by the fbdev emulation helper library.
  */
 struct drm_fb_helper_funcs {
-	/**
-	 * @fb_probe:
-	 *
-	 * Driver callback to allocate and initialize the fbdev info structure.
-	 * Furthermore it also needs to allocate the DRM framebuffer used to
-	 * back the fbdev.
-	 *
-	 * This callback is mandatory.
-	 *
-	 * RETURNS:
-	 *
-	 * The driver should return 0 on success and a negative error code on
-	 * failure.
-	 */
-	int (*fb_probe)(struct drm_fb_helper *helper,
-			struct drm_fb_helper_surface_size *sizes);
-
 	/**
 	 * @fb_dirty:
 	 *
-- 
2.46.0

