Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E396F17C2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90F310ED07;
	Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FDF10ED05
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02DAF2008A;
 Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4yeQbq1z5ypr/x3VehRtOMaP0LhD+3yMbEvjs9dREU=;
 b=LOlnVqOl1ZQNs9W9sDgrlUvHE06c6tPdWk9bHiRnCc9Alu7s+SqLFA6scXtMtLrsMXbiFJ
 wTqrwlgpIlebxxQPL5bIvhu8M/BcEd4P1zQ1s2p4u6ZLAUoho7XCfKB2K4d1oUxDO6S5Cy
 KYUgYK1P65HvaIujK6SGrLh3xeCgdQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4yeQbq1z5ypr/x3VehRtOMaP0LhD+3yMbEvjs9dREU=;
 b=o5U2w0fIZqcJcfmfhhoZZBG1/OZ4G+Qh3FkSFJ8LXNvS1owrY/+vZ9yqi01CfbSxHCCtiR
 xPks/set1dz3GrCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B58661390E;
 Fri, 28 Apr 2023 12:24:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +Pp8Kxm7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 08/19] fbdev/metronomefb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:41 +0200
Message-Id: <20230428122452.4856-9-tzimmermann@suse.de>
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
 drivers/video/fbdev/metronomefb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 9fd4bb85d735..afa9b41f5a87 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -438,7 +438,7 @@ static void metronomefb_dpy_update(struct metronomefb_par *par)
 {
 	int fbsize;
 	u16 cksum;
-	unsigned char *buf = (unsigned char __force *)par->info->screen_base;
+	unsigned char *buf = par->info->screen_buffer;
 
 	fbsize = par->info->fix.smem_len;
 	/* copy from vm to metromem */
@@ -453,7 +453,7 @@ static u16 metronomefb_dpy_update_page(struct metronomefb_par *par, int index)
 {
 	int i;
 	u16 csum = 0;
-	u16 *buf = (u16 __force *)(par->info->screen_base + index);
+	u16 *buf = (u16 *)(par->info->screen_buffer + index);
 	u16 *img = (u16 *)(par->metromem_img + index);
 
 	/* swizzle from vm to metromem and recalc cksum at the same time*/
@@ -543,7 +543,7 @@ static ssize_t metronomefb_write(struct fb_info *info, const char __user *buf,
 		count = total_size - p;
 	}
 
-	dst = (void __force *)(info->screen_base + p);
+	dst = info->screen_buffer + p;
 
 	if (copy_from_user(dst, buf, count))
 		err = -EFAULT;
@@ -599,7 +599,7 @@ static int metronomefb_probe(struct platform_device *dev)
 		goto err;
 
 	/* we have two blocks of memory.
-	info->screen_base which is vm, and is the fb used by apps.
+	info->screen_buffer which is vm, and is the fb used by apps.
 	par->metromem which is physically contiguous memory and
 	contains the display controller commands, waveform,
 	processed image data and padding. this is the data pulled
@@ -634,7 +634,7 @@ static int metronomefb_probe(struct platform_device *dev)
 	if (!videomemory)
 		goto err_fb_rel;
 
-	info->screen_base = (char __force __iomem *)videomemory;
+	info->screen_buffer = videomemory;
 	info->fbops = &metronomefb_ops;
 
 	metronomefb_fix.line_length = fw;
@@ -756,7 +756,7 @@ static int metronomefb_remove(struct platform_device *dev)
 		fb_dealloc_cmap(&info->cmap);
 		par->board->cleanup(par);
 		vfree(par->csum_table);
-		vfree((void __force *)info->screen_base);
+		vfree(info->screen_buffer);
 		module_put(par->board->owner);
 		dev_dbg(&dev->dev, "calling release\n");
 		framebuffer_release(info);
-- 
2.40.0

