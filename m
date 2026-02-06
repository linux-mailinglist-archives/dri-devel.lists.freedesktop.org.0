Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6COIIBruhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2653FE34C
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0064D10E6F3;
	Fri,  6 Feb 2026 13:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jjIu+BD2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLsolaNy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jjIu+BD2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HLsolaNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EEA10E6F3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A7075BCCC;
 Fri,  6 Feb 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzWOYmU25p0zNTJayqtNmomwFE0m6DdkbA++UXWPpxw=;
 b=jjIu+BD25ziFDfX035Kf+Ij6wAGOkX6rZHRfikEy3etr7xKckJP1osFNbQotxmSWjmgGfB
 p3q7mov/n3V6SP9fjspMLAMtuywcuE48vlVYqrhvw/0oGc1q5U631kJFiMhA60ChZ0f+0g
 LjLAW/TjalOO6drJIVJrMw1MkkBJ6T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzWOYmU25p0zNTJayqtNmomwFE0m6DdkbA++UXWPpxw=;
 b=HLsolaNy/UVwD8Tztxa4O0DDVGLTLNPj+qBl6T80eZKwGzcdDinVJJWA1tOso5mwZFa4Q+
 1tfBj+LU2T3DYGBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jjIu+BD2;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HLsolaNy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzWOYmU25p0zNTJayqtNmomwFE0m6DdkbA++UXWPpxw=;
 b=jjIu+BD25ziFDfX035Kf+Ij6wAGOkX6rZHRfikEy3etr7xKckJP1osFNbQotxmSWjmgGfB
 p3q7mov/n3V6SP9fjspMLAMtuywcuE48vlVYqrhvw/0oGc1q5U631kJFiMhA60ChZ0f+0g
 LjLAW/TjalOO6drJIVJrMw1MkkBJ6T8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzWOYmU25p0zNTJayqtNmomwFE0m6DdkbA++UXWPpxw=;
 b=HLsolaNy/UVwD8Tztxa4O0DDVGLTLNPj+qBl6T80eZKwGzcdDinVJJWA1tOso5mwZFa4Q+
 1tfBj+LU2T3DYGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CF853EA65;
 Fri,  6 Feb 2026 13:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ALWpBQfuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/gma500: fbdev: Use a DRM client buffer
Date: Fri,  6 Feb 2026 14:21:57 +0100
Message-ID: <20260206133458.226467-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206133458.226467-1-tzimmermann@suse.de>
References: <20260206133458.226467-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.51
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E2653FE34C
X-Rspamd-Action: no action

Replace the internal DRM framebuffer with a DRM client buffer. The
client buffer allocates the DRM framebuffer on a file and also uses
GEM object handles via the regular ADDFB2 interfaces. This unifies
framebuffer allocation for clients in user space and gma500's internal
fbdev emulation.

Also simplify the clean-up side of the fbdev emulation.

Later patches will allow for streamlining gma500's framebuffer code and
DRM's fbdev emulation in general.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 49 ++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index a93c3d2fe0ff..d1e93588234f 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -72,17 +72,10 @@ static int psb_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static void psb_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_gem_object *obj = fb->obj[0];
 
 	drm_fb_helper_fini(fb_helper);
 
-	drm_framebuffer_unregister_private(fb);
-	drm_framebuffer_cleanup(fb);
-	kfree(fb);
-
-	drm_gem_object_put(obj);
-
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 }
 
@@ -105,18 +98,20 @@ static const struct drm_fb_helper_funcs psb_fbdev_fb_helper_funcs = {
 int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				 struct drm_fb_helper_surface_size *sizes)
 {
-	struct drm_device *dev = fb_helper->dev;
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = client->dev;
+	struct drm_file *file = client->file;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct fb_info *info = fb_helper->info;
 	u32 fourcc, pitch;
 	u64 size;
 	const struct drm_format_info *format;
-	struct drm_framebuffer *fb;
-	struct drm_mode_fb_cmd2 mode_cmd = { };
-	int ret;
+	struct drm_client_buffer *buffer;
 	struct psb_gem_object *backing;
 	struct drm_gem_object *obj;
+	u32 handle;
+	int ret;
 
 	/* No 24-bit packed mode */
 	if (sizes->surface_bpp == 24) {
@@ -148,20 +143,20 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	}
 	obj = &backing->base;
 
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
-	mode_cmd.pixel_format = fourcc;
-	mode_cmd.pitches[0] = pitch;
-	mode_cmd.modifier[0] = DRM_FORMAT_MOD_LINEAR;
-
-	fb = psb_framebuffer_create(dev, format, &mode_cmd, obj);
-	if (IS_ERR(fb)) {
-		ret = PTR_ERR(fb);
+	ret = drm_gem_handle_create(file, obj, &handle);
+	if (ret)
 		goto err_drm_gem_object_put;
+
+	buffer = drm_client_buffer_create(client, sizes->surface_width, sizes->surface_height,
+					  fourcc, handle, pitch);
+	if (IS_ERR(buffer)) {
+		ret = PTR_ERR(buffer);
+		goto err_drm_gem_handle_delete;
 	}
 
 	fb_helper->funcs = &psb_fbdev_fb_helper_funcs;
-	fb_helper->fb = fb;
+	fb_helper->buffer = buffer;
+	fb_helper->fb = buffer->fb;
 
 	info->fbops = &psb_fbdev_fb_ops;
 
@@ -182,10 +177,18 @@ int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
-	dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->height);
+	dev_dbg(dev->dev, "allocated %dx%d fb\n", buffer->fb->width, buffer->fb->height);
+
+	/* The handle is only needed for creating the framebuffer.*/
+	drm_gem_handle_delete(file, handle);
+
+	/* The framebuffer still holds a references on the GEM object. */
+	drm_gem_object_put(obj);
 
 	return 0;
 
+err_drm_gem_handle_delete:
+	drm_gem_handle_delete(file, handle);
 err_drm_gem_object_put:
 	drm_gem_object_put(obj);
 	return ret;
-- 
2.52.0

