Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7386F17C8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF110ED14;
	Fri, 28 Apr 2023 12:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2E10ED07
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D229521F58;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLWuGCUCtLFjHCc+Azt5ygcchweoqpbB1KeKuZbqua4=;
 b=xCi+dWd/o4Ijb0RqswEuDZTQ4boaVuMS0605usGbdwfF3hL/D1Z6QfMTH2NbatQlvyebQP
 y4oAjFmw/HMxPokARhZriB2v4WsvTarGaBymmciKV1lG/AfdKJMu8RA51tGIBOACdTOO9B
 GVg0uAp39yI0ESh58k4X7xLv4vRqYVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLWuGCUCtLFjHCc+Azt5ygcchweoqpbB1KeKuZbqua4=;
 b=y0c/jgfjY2bsav2KS8eyKFAzPeJd9qm53OhcstdGoWo2yVBdvmcCFA+pNDbYRd77AIgKi/
 pJ7MHLKNdgC4IHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 902B21390E;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFJKIhi7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 04/19] fbdev/arcfb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:37 +0200
Message-Id: <20230428122452.4856-5-tzimmermann@suse.de>
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
 drivers/video/fbdev/arcfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 45e64016db32..088c4b30fd31 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -260,7 +260,7 @@ static void arcfb_lcd_update_page(struct arcfb_par *par, unsigned int upper,
 	ks108_set_yaddr(par, chipindex, upper/8);
 
 	linesize = par->info->var.xres/8;
-	src = (unsigned char __force *) par->info->screen_base + (left/8) +
+	src = (unsigned char *)par->info->screen_buffer + (left/8) +
 		(upper * linesize);
 	ks108_set_xaddr(par, chipindex, left);
 
@@ -468,7 +468,7 @@ static ssize_t arcfb_write(struct fb_info *info, const char __user *buf,
 	if (count) {
 		char *base_addr;
 
-		base_addr = (char __force *)info->screen_base;
+		base_addr = info->screen_buffer;
 		count -= copy_from_user(base_addr + p, buf, count);
 		*ppos += count;
 		err = -EFAULT;
@@ -525,7 +525,7 @@ static int arcfb_probe(struct platform_device *dev)
 	if (!info)
 		goto err;
 
-	info->screen_base = (char __iomem *)videomemory;
+	info->screen_buffer = videomemory;
 	info->fbops = &arcfb_ops;
 
 	info->var = arcfb_var;
@@ -595,7 +595,7 @@ static int arcfb_remove(struct platform_device *dev)
 		unregister_framebuffer(info);
 		if (irq)
 			free_irq(((struct arcfb_par *)(info->par))->irq, info);
-		vfree((void __force *)info->screen_base);
+		vfree(info->screen_buffer);
 		framebuffer_release(info);
 	}
 	return 0;
-- 
2.40.0

