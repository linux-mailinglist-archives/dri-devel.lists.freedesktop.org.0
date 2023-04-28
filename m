Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FDD6F17C0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1F10ED18;
	Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229910ED02
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B00FC20089;
 Fri, 28 Apr 2023 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aPsyFTJr43Lszagydf+pSrX+nXo8MeylPieiY3vQvU=;
 b=UBGvMwmQH/bcpcSA6r1+nedynQEmwVcKj6usyhIn2pJ5Z6sNSRmhVMQiH9AJ9YqsdhfTW0
 8CQmeEqvUgalnxA09fMC5RydgP6DlxHVVR5tlJtt28JtJB9eP1o+cMS9SkWjXTWaNUN1lQ
 fucDfVAshDyNFAkuK0P4vTTg9WL+7qw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684697;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aPsyFTJr43Lszagydf+pSrX+nXo8MeylPieiY3vQvU=;
 b=qNyzAuHK/kK6YKnpjfu7XvM5n1eNphOATROwgrRe2iUtC+Z130U0JlqtObOftkiKZghGWa
 IU/JqK0ZBBap41AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72E8B139C3;
 Fri, 28 Apr 2023 12:24:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mODpGhm7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 07/19] fbdev/hecubafb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:40 +0200
Message-Id: <20230428122452.4856-8-tzimmermann@suse.de>
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
 drivers/video/fbdev/hecubafb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index eb1eaadc1bbb..ddfa2853cc41 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -102,7 +102,7 @@ static void apollo_send_command(struct hecubafb_par *par, unsigned char data)
 static void hecubafb_dpy_update(struct hecubafb_par *par)
 {
 	int i;
-	unsigned char *buf = (unsigned char __force *)par->info->screen_base;
+	unsigned char *buf = par->info->screen_buffer;
 
 	apollo_send_command(par, APOLLO_START_NEW_IMG);
 
@@ -183,7 +183,7 @@ static ssize_t hecubafb_write(struct fb_info *info, const char __user *buf,
 		count = total_size - p;
 	}
 
-	dst = (void __force *) (info->screen_base + p);
+	dst = info->screen_buffer + p;
 
 	if (copy_from_user(dst, buf, count))
 		err = -EFAULT;
@@ -239,7 +239,7 @@ static int hecubafb_probe(struct platform_device *dev)
 	if (!info)
 		goto err_fballoc;
 
-	info->screen_base = (char __force __iomem *)videomemory;
+	info->screen_buffer = videomemory;
 	info->fbops = &hecubafb_ops;
 
 	info->var = hecubafb_var;
@@ -287,7 +287,7 @@ static int hecubafb_remove(struct platform_device *dev)
 		struct hecubafb_par *par = info->par;
 		fb_deferred_io_cleanup(info);
 		unregister_framebuffer(info);
-		vfree((void __force *)info->screen_base);
+		vfree(info->screen_buffer);
 		if (par->board->remove)
 			par->board->remove(par);
 		module_put(par->board->owner);
-- 
2.40.0

