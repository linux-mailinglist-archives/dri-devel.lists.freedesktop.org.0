Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2596B6B8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72B410E714;
	Wed,  4 Sep 2024 09:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LJ/62vUX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nT8tVQU1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LJ/62vUX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nT8tVQU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC05F10E716
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:31:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E42D1F7B2;
 Wed,  4 Sep 2024 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725442305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7k8KHCqNnnVnrNQ9MtB5yfp4f1P0LG7iGjx6jHo3Lu0=;
 b=LJ/62vUXnz56DSrXy2ZENlf0AdCpo47Kj6icXJEoBKaU5LFETuuioPFxIJQ74MJtrqknhq
 iVythqye08A90uxCPaqf8pk+SXfeggW/y2PhFQXpI4ZfFj/m70tWVuGzzPMEHj+6xDPHNY
 jF74AhnS5X3suKLSjykRRi7PJEYfHj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725442305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7k8KHCqNnnVnrNQ9MtB5yfp4f1P0LG7iGjx6jHo3Lu0=;
 b=nT8tVQU1hJN/01VnaWRJfd9rU2EWE7HT2jChL+X9ahYNghMS457X4DjWRlG8TLva+f+/aw
 gxIl5SgoKgQTGWCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="LJ/62vUX";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nT8tVQU1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725442305; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7k8KHCqNnnVnrNQ9MtB5yfp4f1P0LG7iGjx6jHo3Lu0=;
 b=LJ/62vUXnz56DSrXy2ZENlf0AdCpo47Kj6icXJEoBKaU5LFETuuioPFxIJQ74MJtrqknhq
 iVythqye08A90uxCPaqf8pk+SXfeggW/y2PhFQXpI4ZfFj/m70tWVuGzzPMEHj+6xDPHNY
 jF74AhnS5X3suKLSjykRRi7PJEYfHj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725442305;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7k8KHCqNnnVnrNQ9MtB5yfp4f1P0LG7iGjx6jHo3Lu0=;
 b=nT8tVQU1hJN/01VnaWRJfd9rU2EWE7HT2jChL+X9ahYNghMS457X4DjWRlG8TLva+f+/aw
 gxIl5SgoKgQTGWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E40D139E2;
 Wed,  4 Sep 2024 09:31:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6zj6BQEp2GYFFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Sep 2024 09:31:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, alexander.stein@ew.tq-group.com,
 linus.walleij@linaro.org, daniel@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/fbdev-dma: Only install deferred I/O if necessary
Date: Wed,  4 Sep 2024 11:31:23 +0200
Message-ID: <20240904093140.15203-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5E42D1F7B2
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ew.tq-group.com,linaro.org,ffwll.ch,gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email];
 RCPT_COUNT_SEVEN(0.00)[9];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Deferred I/O requires struct page for framebuffer memory, which is
not guaranteed for all DMA ranges. We thus only install deferred I/O
if we have a framebuffer that requires it.

A reported bug affected the ipu-v3 and pl111 drivers, which have video
memory in either Normal or HighMem zones

[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]

where deferred I/O only works correctly with HighMem. See the Closes
tags for bug reports.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 808a40b69468 ("drm/fbdev-dma: Implement damage handling and deferred I/O")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/all/23636953.6Emhk5qWAg@steina-w/
Reported-by: Linus Walleij <linus.walleij@linaro.org>
Closes: https://lore.kernel.org/dri-devel/CACRpkdb+hb9AGavbWpY-=uQQ0apY9en_tWJioPKf_fAbXMP4Hg@mail.gmail.com/
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_fbdev_dma.c | 71 ++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 7ef5a48c8029..455dc48d17a7 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -36,20 +36,11 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
 	return 0;
 }
 
-FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
-				   drm_fb_helper_damage_range,
-				   drm_fb_helper_damage_area);
-
 static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_framebuffer *fb = fb_helper->fb;
-	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
 
-	if (!dma->map_noncoherent)
-		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-
-	return fb_deferred_io_mmap(info, vma);
+	return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
 }
 
 static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
@@ -70,13 +61,40 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 }
 
 static const struct fb_ops drm_fbdev_dma_fb_ops = {
+	.owner = THIS_MODULE,
+	.fb_open = drm_fbdev_dma_fb_open,
+	.fb_release = drm_fbdev_dma_fb_release,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
+	.fb_mmap = drm_fbdev_dma_fb_mmap,
+	.fb_destroy = drm_fbdev_dma_fb_destroy,
+};
+
+FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS(drm_fbdev_dma,
+				   drm_fb_helper_damage_range,
+				   drm_fb_helper_damage_area);
+
+static int drm_fbdev_dma_deferred_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
+
+	if (!dma->map_noncoherent)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+
+	return fb_deferred_io_mmap(info, vma);
+}
+
+static const struct fb_ops drm_fbdev_dma_deferred_fb_ops = {
 	.owner = THIS_MODULE,
 	.fb_open = drm_fbdev_dma_fb_open,
 	.fb_release = drm_fbdev_dma_fb_release,
 	__FB_DEFAULT_DEFERRED_OPS_RDWR(drm_fbdev_dma),
 	DRM_FB_HELPER_DEFAULT_OPS,
 	__FB_DEFAULT_DEFERRED_OPS_DRAW(drm_fbdev_dma),
-	.fb_mmap = drm_fbdev_dma_fb_mmap,
+	.fb_mmap = drm_fbdev_dma_deferred_fb_mmap,
 	.fb_destroy = drm_fbdev_dma_fb_destroy,
 };
 
@@ -89,6 +107,7 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	bool use_deferred_io = false;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_framebuffer *fb;
@@ -111,6 +130,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 
 	fb = buffer->fb;
 
+	/*
+	 * Deferred I/O requires struct page for framebuffer memory,
+	 * which is not guaranteed for all DMA ranges. We thus only
+	 * install deferred I/O if we have a framebuffer that requires
+	 * it.
+	 */
+	if (fb->funcs->dirty)
+		use_deferred_io = true;
+
 	ret = drm_client_buffer_vmap(buffer, &map);
 	if (ret) {
 		goto err_drm_client_buffer_delete;
@@ -130,7 +158,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->fbops = &drm_fbdev_dma_fb_ops;
+	if (use_deferred_io)
+		info->fbops = &drm_fbdev_dma_deferred_fb_ops;
+	else
+		info->fbops = &drm_fbdev_dma_fb_ops;
 
 	/* screen */
 	info->flags |= FBINFO_VIRTFB; /* system memory */
@@ -145,13 +176,15 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	info->fix.smem_len = info->screen_size;
 
 	/* deferred I/O */
-	fb_helper->fbdefio.delay = HZ / 20;
-	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
-
-	info->fbdefio = &fb_helper->fbdefio;
-	ret = fb_deferred_io_init(info);
-	if (ret)
-		goto err_drm_fb_helper_release_info;
+	if (use_deferred_io) {
+		fb_helper->fbdefio.delay = HZ / 20;
+		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
+
+		info->fbdefio = &fb_helper->fbdefio;
+		ret = fb_deferred_io_init(info);
+		if (ret)
+			goto err_drm_fb_helper_release_info;
+	}
 
 	return 0;
 
-- 
2.46.0

