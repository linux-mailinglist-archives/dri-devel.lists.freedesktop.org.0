Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E806F17DB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FD010ED2F;
	Fri, 28 Apr 2023 12:25:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3185810ED09
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEE122008D;
 Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OcYfYVJ7U+KiGswDbBZ+oiWz6sQpYQbnNJZdT2+/4I=;
 b=vH+NWtNXZOr3hHQNVE5aL4/NZCNylcfT9Fw5c2ARYhe0dinKCeRUJ1gzo2XbeY6flwnR3B
 SvEBoA9FbFs8NsYS/t0ia6k2A0qkzrliOKz3CDwwD01pVn2cEUNNED38QtOzJp0Vq2EbzR
 drgKU8uGDvi7vd3jxtLfKvLU6YRM3QE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OcYfYVJ7U+KiGswDbBZ+oiWz6sQpYQbnNJZdT2+/4I=;
 b=jKK7E3cUIZZr6sWtJymZgs/iQ7ng7EeId5Mk85iUzgYBE54NSb9Ap+7F/Kgh6YSfEICtSQ
 v9JN5IBMQaP0FfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85710139C3;
 Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uEbIHxq7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 11/19] fbdev/udlfb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:44 +0200
Message-Id: <20230428122452.4856-12-tzimmermann@suse.de>
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
.screen_base and .screen_buffer must be used instead. This also gets
rid of casting needed due to not using the correct data type.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/udlfb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 216d49c9d47e..09cf9381075a 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1006,7 +1006,7 @@ static void dlfb_ops_destroy(struct fb_info *info)
 		fb_dealloc_cmap(&info->cmap);
 	if (info->monspecs.modedb)
 		fb_destroy_modedb(info->monspecs.modedb);
-	vfree(info->screen_base);
+	vfree(info->screen_buffer);
 
 	fb_destroy_modelist(&info->modelist);
 
@@ -1120,7 +1120,7 @@ static int dlfb_ops_set_par(struct fb_info *info)
 
 		/* paint greenscreen */
 
-		pix_framebuffer = (u16 *) info->screen_base;
+		pix_framebuffer = (u16 *)info->screen_buffer;
 		for (i = 0; i < info->fix.smem_len / 2; i++)
 			pix_framebuffer[i] = 0x37e6;
 	}
@@ -1219,7 +1219,7 @@ static void dlfb_deferred_vfree(struct dlfb_data *dlfb, void *mem)
 static int dlfb_realloc_framebuffer(struct dlfb_data *dlfb, struct fb_info *info, u32 new_len)
 {
 	u32 old_len = info->fix.smem_len;
-	const void *old_fb = (const void __force *)info->screen_base;
+	const void *old_fb = info->screen_buffer;
 	unsigned char *new_fb;
 	unsigned char *new_back = NULL;
 
@@ -1236,12 +1236,12 @@ static int dlfb_realloc_framebuffer(struct dlfb_data *dlfb, struct fb_info *info
 		}
 		memset(new_fb, 0xff, new_len);
 
-		if (info->screen_base) {
+		if (info->screen_buffer) {
 			memcpy(new_fb, old_fb, old_len);
-			dlfb_deferred_vfree(dlfb, (void __force *)info->screen_base);
+			dlfb_deferred_vfree(dlfb, info->screen_buffer);
 		}
 
-		info->screen_base = (char __iomem *)new_fb;
+		info->screen_buffer = new_fb;
 		info->fix.smem_len = new_len;
 		info->fix.smem_start = (unsigned long) new_fb;
 		info->flags = udlfb_info_flags;
-- 
2.40.0

