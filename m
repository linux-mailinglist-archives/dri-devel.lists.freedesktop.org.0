Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7877D6F17C4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E56410ED09;
	Fri, 28 Apr 2023 12:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312BE10ED08
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82DA92008C;
 Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJwvVmYYVIjHOCEqd/CQqEAjpuAR4dZsIp60xdkkG5k=;
 b=jEm7nH3vUdoqaqBB+DVzixKQ6rh4B03BFGmOUZ8/JG7RlMLcoa3pB+GWhG+Ym9psHdWlWR
 wj0dkucC/zL2rYaL7C7OOaJIuPseBwGZD/escGSYHGjHDIoVvh+hzotZQVqhhJDuM3dWm1
 /f3HwPKPqEz1U48Sfx/y7aqNcEflBwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJwvVmYYVIjHOCEqd/CQqEAjpuAR4dZsIp60xdkkG5k=;
 b=dpwWHpzDlyDBUjUqKfI2KjlXw2Coeu1aw5xeZhdnF10eV0d6SBmSYCMrGv04FZ+Rki5m0J
 xPZld7I00XL9P6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 477481390E;
 Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8BSQEBq7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 10/19] fbdev/smscufx: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:43 +0200
Message-Id: <20230428122452.4856-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use info->screen_buffer when reading and writing framebuffers in
system memory. It's the correct pointer for this address space.

The struct fb_info has a union to store the framebuffer memory. This can
either be info->screen_base if the framebuffer is stored in I/O memory,
or info->screen_buffer if the framebuffer is stored in system memory.

As the driver operates on the latter address space, it is wrong to use
.screen_base and .screen_buffer must be used instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/smscufx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 2ad6e98ce10d..17cec62cc65d 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -1150,7 +1150,7 @@ static void ufx_free_framebuffer(struct ufx_data *dev)
 		fb_dealloc_cmap(&info->cmap);
 	if (info->monspecs.modedb)
 		fb_destroy_modedb(info->monspecs.modedb);
-	vfree(info->screen_base);
+	vfree(info->screen_buffer);
 
 	fb_destroy_modelist(&info->modelist);
 
@@ -1257,7 +1257,7 @@ static int ufx_ops_set_par(struct fb_info *info)
 
 	if ((result == 0) && (dev->fb_count == 0)) {
 		/* paint greenscreen */
-		pix_framebuffer = (u16 *) info->screen_base;
+		pix_framebuffer = (u16 *)info->screen_buffer;
 		for (i = 0; i < info->fix.smem_len / 2; i++)
 			pix_framebuffer[i] = 0x37e6;
 
@@ -1303,7 +1303,7 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 {
 	int old_len = info->fix.smem_len;
 	int new_len;
-	unsigned char *old_fb = info->screen_base;
+	unsigned char *old_fb = info->screen_buffer;
 	unsigned char *new_fb;
 
 	pr_debug("Reallocating framebuffer. Addresses will change!");
@@ -1318,12 +1318,12 @@ static int ufx_realloc_framebuffer(struct ufx_data *dev, struct fb_info *info)
 		if (!new_fb)
 			return -ENOMEM;
 
-		if (info->screen_base) {
+		if (info->screen_buffer) {
 			memcpy(new_fb, old_fb, old_len);
-			vfree(info->screen_base);
+			vfree(info->screen_buffer);
 		}
 
-		info->screen_base = new_fb;
+		info->screen_buffer = new_fb;
 		info->fix.smem_len = PAGE_ALIGN(new_len);
 		info->fix.smem_start = (unsigned long) new_fb;
 		info->flags = smscufx_info_flags;
@@ -1746,7 +1746,7 @@ static int ufx_usb_probe(struct usb_interface *interface,
 	atomic_set(&dev->usb_active, 0);
 setup_modes:
 	fb_destroy_modedb(info->monspecs.modedb);
-	vfree(info->screen_base);
+	vfree(info->screen_buffer);
 	fb_destroy_modelist(&info->modelist);
 error:
 	fb_dealloc_cmap(&info->cmap);
-- 
2.40.0

