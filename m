Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6B90B447
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 17:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3475410E438;
	Mon, 17 Jun 2024 15:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="E+bxhn3i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ADXF6VdY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZHH6IoS5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OsEyKSuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613DC10E438
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:28:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01079602B8;
 Mon, 17 Jun 2024 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718638130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2TS7wAgbzFG0nVSVF2PzTKbHQg/Pgc/sTC0Ki8uO4QE=;
 b=E+bxhn3ifAnBMuFHLTa97P/eDFEVlZW5cYCPNmbWj/8JPjVLHeX7Iwjm5dSFy3tAHqebPn
 Aio7wO+0mr2vgY0RAnALGDyqwYjm8xrc9L2Y7nBsUME6w/eayZYIs36UzUbWo1wW76AcAF
 8jjHLjA73bZKtFeUiObjimJmYsTc/E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718638130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2TS7wAgbzFG0nVSVF2PzTKbHQg/Pgc/sTC0Ki8uO4QE=;
 b=ADXF6VdY2adMW3Cdo/SMZPjnPxvuBOBq7m2sj2+NnIA+uFXkDcAQJE9dpOgJHXjBdc7Ajb
 o0uxO8TIjSKbFpAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZHH6IoS5;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OsEyKSuP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718638129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2TS7wAgbzFG0nVSVF2PzTKbHQg/Pgc/sTC0Ki8uO4QE=;
 b=ZHH6IoS5nKzervK87rFQkb+K3AT57cqhiPHEsc2Kup1mbadQyGm/3EPPx1/sQhPVoNDLCx
 RPeDMneTnYKZqfSADRLd3/XRS9kWSMY1mrROAskGmmpAJ3gEtiIJCoAAiYw0hy+SfOqDH2
 C5sMGxDF/bVZ124MK6cbj8qZemj6GFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718638129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2TS7wAgbzFG0nVSVF2PzTKbHQg/Pgc/sTC0Ki8uO4QE=;
 b=OsEyKSuPThlJpLm3eAeDDXSvT4BspnEwIvJX37of+P1hMkEZ5WDPeouwLgIQ28119LQtNl
 QAqkUIkMN/WrEHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C808B13AAA;
 Mon, 17 Jun 2024 15:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +MyGLzBWcGYebAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jun 2024 15:28:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: peng.fan@oss.nxp.com,
	daniel@ffwll.ch,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module option
Date: Mon, 17 Jun 2024 17:26:37 +0200
Message-ID: <20240617152843.11886-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,suse.de:email,suse.de:dkim]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 01079602B8
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Only export struct fb_info.fix.smem_start if that is required by the
user and the memory does not come from vmalloc().

Setting struct fb_info.fix.smem_start breaks systems where DMA
memory is backed by vmalloc address space. An example error is
shown below.

[    3.536043] ------------[ cut here ]------------
[    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
[    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
[    3.565455] Modules linked in:
[    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
[    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
[    3.582452] Workqueue: events_unbound deferred_probe_work_func
[    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.595233] pc : __virt_to_phys+0x68/0x98
[    3.599246] lr : __virt_to_phys+0x68/0x98
[    3.603276] sp : ffff800083603990
[    3.677939] Call trace:
[    3.680393]  __virt_to_phys+0x68/0x98
[    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
[    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
[    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
[    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
[    3.705161]  drm_client_register+0x60/0xb0
[    3.709269]  drm_fbdev_dma_setup+0x94/0x148

Additionally, DMA memory is assumed to by contiguous in physical
address space, which is not guaranteed by vmalloc().

Resolve this by checking the module flag drm_leak_fbdev_smem when
DRM allocated the instance of struct fb_info. Fbdev-dma then only
sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
guarantee that the framebuffer is not located in vmalloc address
space.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
Closes: https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
---
 drivers/gpu/drm/drm_fb_helper.c | 6 +++---
 drivers/gpu/drm/drm_fbdev_dma.c | 5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e2e19f49342e1..18565ec684517 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -517,6 +517,9 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
+	if (!drm_leak_fbdev_smem)
+		info->flags |= FBINFO_HIDE_SMEM_START;
+
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret)
 		goto err_release;
@@ -1853,9 +1856,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 	info = fb_helper->info;
 	info->var.pixclock = 0;
 
-	if (!drm_leak_fbdev_smem)
-		info->flags |= FBINFO_HIDE_SMEM_START;
-
 	/* Need to drop locks to avoid recursive deadlock in
 	 * register_framebuffer. This is ok because the only thing left to do is
 	 * register the fbdev emulation instance in kernel_fb_helper_list. */
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 97ef6300d47e0..4b0527ddeb5a7 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -137,7 +137,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		info->flags |= FBINFO_READS_FAST; /* signal caching */
 	info->screen_size = sizes->surface_height * fb->pitches[0];
 	info->screen_buffer = map.vaddr;
-	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
+	if (!(info->flags & FBINFO_HIDE_SMEM_START)) {
+		if (!drm_WARN_ON(dev, is_vmalloc_addr(info->screen_buffer)))
+			info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
+	}
 	info->fix.smem_len = info->screen_size;
 
 	/* deferred I/O */
-- 
2.45.2

