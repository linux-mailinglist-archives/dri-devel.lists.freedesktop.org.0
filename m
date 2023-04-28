Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB80D6F17BF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9993210ED0C;
	Fri, 28 Apr 2023 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB96010ED05
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:24:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D10421F57;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IO6VeosqS9+n7L1naSlHESMxaeiRmTE2GHrbh7xUu/A=;
 b=Q4+BnEO1FUB6iF7oo+QLETP7f1eO/XIWUisX3DOarwTalwl4XadaFr6hQ093mpqtOEtRj+
 8sJ9fnI7cR8gXccLRj/eflBMb3AeSvo/IKxO4AWFKiJfOvnSte7iAVnzDMbeQL+/qyWpuL
 DW48PxY0bFUADz8dDggq9oyL/oz6DRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IO6VeosqS9+n7L1naSlHESMxaeiRmTE2GHrbh7xUu/A=;
 b=hsnW2i5vt93MdKUK06UVrzARtXA/I2hpTx0pHLAsC/AMHyy2pQjbrjqtTp30PakFVOCXgZ
 6CEYEJlkxjP4mDCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E305139C3;
 Fri, 28 Apr 2023 12:24:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YIM3Ehi7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 03/19] hid/hid-picolcd_fb: Use struct fb_info.screen_buffer
Date: Fri, 28 Apr 2023 14:24:36 +0200
Message-Id: <20230428122452.4856-4-tzimmermann@suse.de>
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
 drivers/hid/hid-picolcd_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index de61c08fabea..dabcd054dad9 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -221,7 +221,7 @@ int picolcd_fb_reset(struct picolcd_data *data, int clear)
 	return 0;
 }
 
-/* Update fb_vbitmap from the screen_base and send changed tiles to device */
+/* Update fb_vbitmap from the screen_buffer and send changed tiles to device */
 static void picolcd_fb_update(struct fb_info *info)
 {
 	int chip, tile, n;
@@ -541,7 +541,7 @@ int picolcd_init_framebuffer(struct picolcd_data *data)
 		dev_err(dev, "can't get a free page for framebuffer\n");
 		goto err_nomem;
 	}
-	info->screen_base = (char __force __iomem *)fbdata->bitmap;
+	info->screen_buffer = fbdata->bitmap;
 	info->fix.smem_start = (unsigned long)fbdata->bitmap;
 	memset(fbdata->vbitmap, 0xff, PICOLCDFB_SIZE);
 	data->fb_info = info;
-- 
2.40.0

