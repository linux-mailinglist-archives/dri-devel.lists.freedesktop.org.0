Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGaTOBLuhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85566FE316
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E463410E6E9;
	Fri,  6 Feb 2026 13:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ipLNmzIL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2r+4ttC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ipLNmzIL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f2r+4ttC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC6E10E6E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:35:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95E763E6D4;
 Fri,  6 Feb 2026 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bkd0DYduEWsOocrkVMTZ9f5LeN6Qbp9wKugt7CdB5+c=;
 b=ipLNmzILhk96dOz+ARQjkkmQjvWZJQm7KBzux3eFCZJCEwcg2/NW9yNCoQuA7jp2ghCsQ4
 vXgr1/Siawv49LeFrfD4npcEMTK6Y0byP7/VJqzV1ogqB0s6vla5Ij688uimFQFoRl6MQY
 E4LYXIuxaih4QbP5ZqThIuXnxd4kjXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bkd0DYduEWsOocrkVMTZ9f5LeN6Qbp9wKugt7CdB5+c=;
 b=f2r+4ttCGyHt/GnRa1FKdCM7eOkp8OUHm+A7NXVISh9UlU42ttruXqFDdnfRVynu9CVYww
 n9/w7dW9t0UUxtBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ipLNmzIL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f2r+4ttC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770384903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bkd0DYduEWsOocrkVMTZ9f5LeN6Qbp9wKugt7CdB5+c=;
 b=ipLNmzILhk96dOz+ARQjkkmQjvWZJQm7KBzux3eFCZJCEwcg2/NW9yNCoQuA7jp2ghCsQ4
 vXgr1/Siawv49LeFrfD4npcEMTK6Y0byP7/VJqzV1ogqB0s6vla5Ij688uimFQFoRl6MQY
 E4LYXIuxaih4QbP5ZqThIuXnxd4kjXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770384903;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bkd0DYduEWsOocrkVMTZ9f5LeN6Qbp9wKugt7CdB5+c=;
 b=f2r+4ttCGyHt/GnRa1FKdCM7eOkp8OUHm+A7NXVISh9UlU42ttruXqFDdnfRVynu9CVYww
 n9/w7dW9t0UUxtBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 559773EA64;
 Fri,  6 Feb 2026 13:35:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yCS0EwfuhWnncwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Feb 2026 13:35:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/gma500: Create framebuffers with drm_gem_fb_create()
Date: Fri,  6 Feb 2026 14:21:58 +0100
Message-ID: <20260206133458.226467-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206133458.226467-1-tzimmermann@suse.de>
References: <20260206133458.226467-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.51
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
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 85566FE316
X-Rspamd-Action: no action

Replace gma500's internal framebuffer creation with DRM's standard
helper drm_gem_fb_create(). The result is equivalent. Only keep the
existing tests for color depth and pitch alignment.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/framebuffer.c | 104 +++------------------------
 drivers/gpu/drm/gma500/psb_drv.h     |   6 --
 2 files changed, 9 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index e69b537ded6b..37a9f666c0f2 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -12,111 +12,25 @@
 #include "framebuffer.h"
 #include "psb_drv.h"
 
-static const struct drm_framebuffer_funcs psb_fb_funcs = {
-	.destroy = drm_gem_fb_destroy,
-	.create_handle = drm_gem_fb_create_handle,
-};
-
-/**
- *	psb_framebuffer_init	-	initialize a framebuffer
- *	@dev: our DRM device
- *	@fb: framebuffer to set up
- *	@mode_cmd: mode description
- *	@obj: backing object
- *
- *	Configure and fill in the boilerplate for our frame buffer. Return
- *	0 on success or an error code if we fail.
- */
-static int psb_framebuffer_init(struct drm_device *dev,
-					struct drm_framebuffer *fb,
-					const struct drm_format_info *info,
-					const struct drm_mode_fb_cmd2 *mode_cmd,
-					struct drm_gem_object *obj)
+static struct drm_framebuffer *
+psb_user_framebuffer_create(struct drm_device *dev, struct drm_file *filp,
+			    const struct drm_format_info *info,
+			    const struct drm_mode_fb_cmd2 *cmd)
 {
-	int ret;
-
 	/*
 	 * Reject unknown formats, YUV formats, and formats with more than
 	 * 4 bytes per pixel.
 	 */
 	if (!info->depth || info->cpp[0] > 4)
-		return -EINVAL;
-
-	if (mode_cmd->pitches[0] & 63)
-		return -EINVAL;
-
-	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
-	fb->obj[0] = obj;
-	ret = drm_framebuffer_init(dev, fb, &psb_fb_funcs);
-	if (ret) {
-		dev_err(dev->dev, "framebuffer init failed: %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
-/**
- *	psb_framebuffer_create	-	create a framebuffer backed by gt
- *	@dev: our DRM device
- *	@info: pixel format information
- *	@mode_cmd: the description of the requested mode
- *	@obj: the backing object
- *
- *	Create a framebuffer object backed by the gt, and fill in the
- *	boilerplate required
- *
- *	TODO: review object references
- */
-struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
-					       const struct drm_format_info *info,
-					       const struct drm_mode_fb_cmd2 *mode_cmd,
-					       struct drm_gem_object *obj)
-{
-	struct drm_framebuffer *fb;
-	int ret;
-
-	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
-	if (!fb)
-		return ERR_PTR(-ENOMEM);
-
-	ret = psb_framebuffer_init(dev, fb, info, mode_cmd, obj);
-	if (ret) {
-		kfree(fb);
-		return ERR_PTR(ret);
-	}
-	return fb;
-}
-
-/**
- *	psb_user_framebuffer_create	-	create framebuffer
- *	@dev: our DRM device
- *	@filp: client file
- *	@cmd: mode request
- *
- *	Create a new framebuffer backed by a userspace GEM object
- */
-static struct drm_framebuffer *psb_user_framebuffer_create
-			(struct drm_device *dev, struct drm_file *filp,
-			 const struct drm_format_info *info,
-			 const struct drm_mode_fb_cmd2 *cmd)
-{
-	struct drm_gem_object *obj;
-	struct drm_framebuffer *fb;
+		return ERR_PTR(-EINVAL);
 
 	/*
-	 *	Find the GEM object and thus the gtt range object that is
-	 *	to back this space
+	 * Pitch must be aligned to 64 bytes.
 	 */
-	obj = drm_gem_object_lookup(filp, cmd->handles[0]);
-	if (obj == NULL)
-		return ERR_PTR(-ENOENT);
-
-	/* Let the core code do all the work */
-	fb = psb_framebuffer_create(dev, info, cmd, obj);
-	if (IS_ERR(fb))
-		drm_gem_object_put(obj);
+	if (cmd->pitches[0] & 63)
+		return ERR_PTR(-EINVAL);
 
-	return fb;
+	return drm_gem_fb_create(dev, filp, info, cmd);
 }
 
 static const struct drm_mode_config_funcs psb_mode_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 0b27112ec46f..db197b865b90 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -592,12 +592,6 @@ struct psb_ops {
 extern void psb_modeset_init(struct drm_device *dev);
 extern void psb_modeset_cleanup(struct drm_device *dev);
 
-/* framebuffer */
-struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
-					       const struct drm_format_info *info,
-					       const struct drm_mode_fb_cmd2 *mode_cmd,
-					       struct drm_gem_object *obj);
-
 /* fbdev */
 #if defined(CONFIG_DRM_FBDEV_EMULATION)
 int psb_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
-- 
2.52.0

