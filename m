Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C67983DC0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA4710E4F6;
	Tue, 24 Sep 2024 07:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LT6MKzEp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zr4WlUVb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LT6MKzEp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zr4WlUVb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E840010E4E6;
 Tue, 24 Sep 2024 07:17:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E3D41FBDE;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NnhpHQ8n8MLjCCBEYOSozPtv2yh1Pm/vyP2JHeFHTY=;
 b=LT6MKzEpTEk4/szMWwmUz2yUTePDnxSkMZhqC4IVki3fwIPJ1zCLlizDB5kWTevP00uf2C
 RnI6yA1I1K+yp/y84+R0ybgMhdXyW+ZfvrAYKfsBuLp9OXldSScd5rrD5h23sr0ek18xzN
 Z4l9A9e/kuUCtfwyzWjEUIkjiJpORys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NnhpHQ8n8MLjCCBEYOSozPtv2yh1Pm/vyP2JHeFHTY=;
 b=zr4WlUVbo+aM5Fum59dgKtDMknQyPWsPDhSJiORkDXPz55q4Kr00CVcXihbm2C0b1foAqS
 J0/yQi45/mz0v9Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NnhpHQ8n8MLjCCBEYOSozPtv2yh1Pm/vyP2JHeFHTY=;
 b=LT6MKzEpTEk4/szMWwmUz2yUTePDnxSkMZhqC4IVki3fwIPJ1zCLlizDB5kWTevP00uf2C
 RnI6yA1I1K+yp/y84+R0ybgMhdXyW+ZfvrAYKfsBuLp9OXldSScd5rrD5h23sr0ek18xzN
 Z4l9A9e/kuUCtfwyzWjEUIkjiJpORys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NnhpHQ8n8MLjCCBEYOSozPtv2yh1Pm/vyP2JHeFHTY=;
 b=zr4WlUVbo+aM5Fum59dgKtDMknQyPWsPDhSJiORkDXPz55q4Kr00CVcXihbm2C0b1foAqS
 J0/yQi45/mz0v9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D4DE1386E;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oAiqEZNn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 02/80] drm/fbdev-helper: Set and clear VGA switcheroo
 client from fb_info
Date: Tue, 24 Sep 2024 09:12:00 +0200
Message-ID: <20240924071734.98201-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO
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

Call vga_switcheroo_client_fb_set() with the PCI device from the
instance of struct fb_info. All fbdev clients now run these calls.
For non-PCI devices or drivers without vga-switcheroo, this does
nothing. For i915 and radeon, it allows these drivers to use a
common fbdev client.

The device is the same as the one stored in struct drm_client and
struct drm_fb_helper, so there is no difference in behavior. Some
NULL-pointer checks are being removed, where those pointers cannot
be NULL.

v4:
- clarify call semantics for drm_fb_helper_unregister_info() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index af1fe79c701d..550fa69311cb 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -554,7 +554,7 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
 
 /**
  * drm_fb_helper_unregister_info - unregister fb_info framebuffer device
- * @fb_helper: driver-allocated fbdev helper, can be NULL
+ * @fb_helper: driver-allocated fbdev helper, must not be NULL
  *
  * A wrapper around unregister_framebuffer, to release the fb_info
  * framebuffer device. This must be called before releasing all resources for
@@ -562,8 +562,12 @@ EXPORT_SYMBOL(drm_fb_helper_release_info);
  */
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
-	if (fb_helper && fb_helper->info)
-		unregister_framebuffer(fb_helper->info);
+	struct fb_info *info = fb_helper->info;
+	struct device *dev = info->device;
+
+	if (dev_is_pci(dev))
+		vga_switcheroo_client_fb_set(to_pci_dev(dev), NULL);
+	unregister_framebuffer(fb_helper->info);
 }
 EXPORT_SYMBOL(drm_fb_helper_unregister_info);
 
@@ -1615,6 +1619,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
+	struct fb_info *info;
 	int ret;
 
 	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
@@ -1632,9 +1637,11 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 
 	strcpy(fb_helper->fb->comm, "[fbcon]");
 
+	info = fb_helper->info;
+
 	/* Set the fb info for vgaswitcheroo clients. Does nothing otherwise. */
-	if (dev_is_pci(dev->dev))
-		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), fb_helper->info);
+	if (dev_is_pci(info->device))
+		vga_switcheroo_client_fb_set(to_pci_dev(info->device), info);
 
 	return 0;
 }
-- 
2.46.0

