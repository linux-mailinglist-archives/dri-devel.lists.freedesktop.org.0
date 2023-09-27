Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A437AFD0A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3191710E495;
	Wed, 27 Sep 2023 07:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8A010E47A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B02F01F8B2;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800850; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsGg9pBHcmBGVB5fVyVMCdUdUXsjyV91NOpw9W5mbGw=;
 b=jr1y2UtrRO2Fvk4sTHj25E6K84GRQx4pQ/OPJPDlgynLAgPtyMDJkiktpaU8QgIPTXseh7
 IcitXZOrzlCzPoTGhglzHEAuVCYW65xRhwd6eGvGOHs4btRAxn43q34sBrxoBT6k5NpCw4
 smNgi2G/CgB1yY00cKoy7c/9798VbKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800850;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsGg9pBHcmBGVB5fVyVMCdUdUXsjyV91NOpw9W5mbGw=;
 b=VkmhwgRgFImZwchYzYgk7yADLhUAME2HkS8W1Ul4JJxek+eiAHTVprsnZni4roOFsXnHvm
 MAVqaDyIUa/lPTDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 767171338F;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AHv/GxLeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 23/46] fbdev/neofb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:56 +0200
Message-ID: <20230927074722.6197-24-tzimmermann@suse.de>
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

Initialize the instance of struct fb_ops with fbdev initializer
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
 drivers/video/fbdev/Kconfig | 3 ++-
 drivers/video/fbdev/neofb.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index aa3d2e3930e91..6105a97a3cf9c 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1268,10 +1268,11 @@ endif
 config FB_NEOMAGIC
 	tristate "NeoMagic display support"
 	depends on FB && PCI
-	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
+	select FB_MODE_HELPERS
 	select VGASTATE
 	select VIDEO_NOMODESET
 	help
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index b58b11015c0c6..632ba24559139 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1614,6 +1614,7 @@ static const struct fb_ops neofb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= neofb_open,
 	.fb_release	= neofb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= neofb_check_var,
 	.fb_set_par	= neofb_set_par,
 	.fb_setcolreg	= neofb_setcolreg,
@@ -1623,6 +1624,7 @@ static const struct fb_ops neofb_ops = {
 	.fb_fillrect	= neofb_fillrect,
 	.fb_copyarea	= neofb_copyarea,
 	.fb_imageblit	= neofb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* --------------------------------------------------------------------- */
-- 
2.42.0

