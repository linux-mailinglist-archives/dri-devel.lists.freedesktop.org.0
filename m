Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E3650FF3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5257710E2E5;
	Mon, 19 Dec 2022 16:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C760A10E2C6;
 Mon, 19 Dec 2022 16:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74E9F6106C;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaoy/wsHmACEkNUPQDwCodxxk7bv39KwEjjtHvnuLPY=;
 b=zwnnLeVgu/s3egNObkVdpEXh77/XY3MobzVV5GJI1gttTfIxX9W8Q+m9TprcXlLjjw5+zk
 eYu4mOF+QvFS83FmGpyu69FfHB3eEEm8yYax1itCD+SjBRqew7QTnHV/9t85tFIVD0Q/VT
 APbe3gfOruEA6qOqZIn72uYlYQfIdv8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaoy/wsHmACEkNUPQDwCodxxk7bv39KwEjjtHvnuLPY=;
 b=kus+BY2vnPzmJQDjGCUVRzdQvBFM+NEu81vfD1mSWOqYl5qrrmEPyKieCOyRumTRUCMg+9
 UvJt4LdI4sHWxXDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3DD7913910;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SH0nDsGLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 12/18] fbdev/offb: Allocate struct offb_par with
 framebuffer_alloc()
Date: Mon, 19 Dec 2022 17:05:10 +0100
Message-Id: <20221219160516.23436-13-tzimmermann@suse.de>
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

Move the palette array into struct offb_par and allocate both via
framebuffer_alloc(), as intended by fbdev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/offb.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
index 91001990e351..a298adcee2d9 100644
--- a/drivers/video/fbdev/offb.c
+++ b/drivers/video/fbdev/offb.c
@@ -53,10 +53,9 @@ struct offb_par {
 	volatile void __iomem *cmap_data;
 	int cmap_type;
 	int blanked;
+	u32 pseudo_palette[16];
 };
 
-struct offb_par default_par;
-
 #ifdef CONFIG_PPC32
 extern boot_infos_t *boot_infos;
 #endif
@@ -393,11 +392,11 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 			 int foreign_endian, struct device_node *dp)
 {
 	unsigned long res_size = pitch * height;
-	struct offb_par *par = &default_par;
 	unsigned long res_start = address;
 	struct fb_fix_screeninfo *fix;
 	struct fb_var_screeninfo *var;
 	struct fb_info *info;
+	struct offb_par *par;
 
 	if (!request_mem_region(res_start, res_size, "offb"))
 		return;
@@ -411,17 +410,15 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 		return;
 	}
 
-	info = framebuffer_alloc(sizeof(u32) * 16, &parent->dev);
-
+	info = framebuffer_alloc(sizeof(*par), &parent->dev);
 	if (!info) {
 		release_mem_region(res_start, res_size);
 		return;
 	}
 	platform_set_drvdata(parent, info);
-
+	par = info->par;
 	fix = &info->fix;
 	var = &info->var;
-	info->par = par;
 
 	if (name) {
 		strcpy(fix->id, "OFfb ");
@@ -515,7 +512,7 @@ static void offb_init_fb(struct platform_device *parent, const char *name,
 
 	info->fbops = &offb_ops;
 	info->screen_base = ioremap(address, fix->smem_len);
-	info->pseudo_palette = (void *) (info + 1);
+	info->pseudo_palette = par->pseudo_palette;
 	info->flags = FBINFO_DEFAULT | FBINFO_MISC_FIRMWARE | foreign_endian;
 
 	fb_alloc_cmap(&info->cmap, 256, 0);
-- 
2.39.0

