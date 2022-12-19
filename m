Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3778650FF6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD910E2E9;
	Mon, 19 Dec 2022 16:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B442C10E2B5;
 Mon, 19 Dec 2022 16:06:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADBD86106D;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2jMhvkkO9mLB5vKRkLVLy8CI9SvsP5N5f5b7as6/CU=;
 b=jlpOqVgx0JWpTTagkVpW0ycTf7HMO7BrUqOyZsmYdexIVlgyax/4nsXQ1e5aeNnK8JEgso
 Pyx/hzHSa8UEUO71MJtxg+IZuyN2EUVVYXXUoOZyRrJeKVx9RvNrXToFeGkKWDOC6L1D8Z
 fTUh3hZdQ8cKVdwNPhEdHXlhpcX90D4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2jMhvkkO9mLB5vKRkLVLy8CI9SvsP5N5f5b7as6/CU=;
 b=Wm9K/NTKX3LnQnA38r1Gk4tbb2AN+sCRv18AFj9TkilcgUWn68U33ad4UIIbSy2ix+gjvy
 cyGTCUDg0bWPbuDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77E5B13911;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAxqHMGLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 13/18] fbdev/offb: Do not use struct fb_info.apertures
Date: Mon, 19 Dec 2022 17:05:11 +0100
Message-Id: <20221219160516.23436-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire ownership of the firmware scanout buffer by calling Linux'
aperture helpers. Remove the use of struct fb_info.apertures and do
not set FBINFO_MISC_FIRMWARE; both of which previously configured
buffer ownership.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/offb.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index a298adcee2d9..f7ad6bc9d02d 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -12,6 +12,7 @@
  *  more details.
  */
 
+#include <linux/aperture.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -54,6 +55,8 @@ struct offb_par {
 	int cmap_type;
 	int blanked;
 	u32 pseudo_palette[16];
+	resource_size_t base;
+	resource_size_t size;
 };
 
 #ifdef CONFIG_PPC32
@@ -279,9 +282,11 @@ static int offb_set_par(struct fb_info *info)
 
 static void offb_destroy(struct fb_info *info)
 {
+	struct offb_par *par = info->par;
+
 	if (info->screen_base)
 		iounmap(info->screen_base);
-	release_mem_region(info->apertures->ranges[0].base, info->apertures->ranges[0].size);
+	release_mem_region(par->base, par->size);
 	fb_dealloc_cmap(&info->cmap);
 	framebuffer_release(info);
 }
@@ -503,20 +508,18 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 	var->sync = 0;
 	var->vmode = FB_VMODE_NONINTERLACED;
 
-	/* set offb aperture size for generic probing */
-	info->apertures = alloc_apertures(1);
-	if (!info->apertures)
-		goto out_aper;
-	info->apertures->ranges[0].base = address;
-	info->apertures->ranges[0].size = fix->smem_len;
+	par->base = address;
+	par->size = fix->smem_len;
 
 	info->fbops = &offb_ops;
 	info->screen_base = ioremap(address, fix->smem_len);
 	info->pseudo_palette = par->pseudo_palette;
-	info->flags = FBINFO_DEFAULT | FBINFO_MISC_FIRMWARE | foreign_endian;
+	info->flags = FBINFO_DEFAULT | foreign_endian;
 
 	fb_alloc_cmap(&info->cmap, 256, 0);
 
+	if (devm_aperture_acquire_for_platform_device(parent, par->base, par->size) < 0)
+		goto out_err;
 	if (register_framebuffer(info) < 0)
 		goto out_err;
 
@@ -526,7 +529,6 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 out_err:
 	fb_dealloc_cmap(&info->cmap);
 	iounmap(info->screen_base);
-out_aper:
 	iounmap(par->cmap_adr);
 	par->cmap_adr = NULL;
 	framebuffer_release(info);
-- 
2.39.0

