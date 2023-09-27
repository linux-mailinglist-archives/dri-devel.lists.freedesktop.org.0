Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 315577AFCF6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050610E489;
	Wed, 27 Sep 2023 07:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0FA10E476
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C8B9218A8;
 Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZw8Bk3hSKCOgaHlTiXgdYztz2Y+ozx4V8mRYVfUzyQ=;
 b=V6cRAPCZrvs4NnJRIF9JtY1Dwsk+/+oT8FAouQ/oK/k6Y4SzF3GUIOHzQE/0q68Pqf1IKZ
 3yGNIWLXQipNP7g4ftCSL91GJaCdBPIDsOFDlhsshIlhQZpUYQ/dmTqEGusSSmiVbib4KJ
 +D7mKCdtNFDS6bl2XgYj4zp+USv05A4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZw8Bk3hSKCOgaHlTiXgdYztz2Y+ozx4V8mRYVfUzyQ=;
 b=BwcIdP6iM2lElCnOubhTCV/PHOmBNSTfR5d3IJ45k8jouKvnRlf4lxPPK6Ct/Q8nlx3Fui
 qB0TvoKbDRKKQwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12EA31338F;
 Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2AK4AxbeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 36/46] fbdev/sm501fb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:27:09 +0200
Message-ID: <20230927074722.6197-37-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize each instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary I/O helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default implementation to be invoked; hence requiring the I/O
helpers to be built in any case. Setting all callbacks in all
drivers explicitly will allow to make the I/O helpers optional.
This benefits systems that do not use these functions.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig   | 1 +
 drivers/video/fbdev/sm501fb.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index bda5ed8a40b0a..c87eb90c04af0 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1667,6 +1667,7 @@ config FB_SM501
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  Frame buffer driver for the CRT and LCD controllers in the Silicon
 	  Motion SM501.
diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 65c799ac5604f..d6fdc1737cd24 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -1452,6 +1452,7 @@ static void sm501fb_fillrect(struct fb_info *info, const struct fb_fillrect *rec
 
 static struct fb_ops sm501fb_ops_crt = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= sm501fb_check_var_crt,
 	.fb_set_par	= sm501fb_set_par_crt,
 	.fb_blank	= sm501fb_blank_crt,
@@ -1462,10 +1463,12 @@ static struct fb_ops sm501fb_ops_crt = {
 	.fb_copyarea	= sm501fb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
 	.fb_sync	= sm501fb_sync,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static struct fb_ops sm501fb_ops_pnl = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= sm501fb_check_var_pnl,
 	.fb_set_par	= sm501fb_set_par_pnl,
 	.fb_pan_display	= sm501fb_pan_pnl,
@@ -1476,6 +1479,7 @@ static struct fb_ops sm501fb_ops_pnl = {
 	.fb_copyarea	= sm501fb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
 	.fb_sync	= sm501fb_sync,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* sm501_init_cursor
-- 
2.42.0

