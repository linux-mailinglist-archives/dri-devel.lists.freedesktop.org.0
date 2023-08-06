Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 187047714DA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7396910E0CA;
	Sun,  6 Aug 2023 12:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC0710E0BD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 789601F74B;
 Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icA7jEJiAVdR9wKWnZiaaJHwtNZfmbFsFLra5dhQC/0=;
 b=gfzYCi7iCJ8dGmriOaG3p6RR1PDGta08PGbVjsE9F3+Zb4jdJ3NLazm58ftMnDXTC1aMiZ
 Z33AuIDQh8GM/8tqpIzRidANki7Ju10jyjlKwRmC7p/jWSQPyakORVg/iKitkzbz88BSir
 CzoOLaM96qtrHQvbgU39mlk2KrB3wBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icA7jEJiAVdR9wKWnZiaaJHwtNZfmbFsFLra5dhQC/0=;
 b=+ETLYZlI3EN2OOfZ0O+aXC1p8Vtuy2M3ZzMbVD4LbpklyuxNt1bDoOpDdSIX1gLJiov/fw
 6ZLCX5SvJFK01kCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B4E0139D1;
 Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uEJ2EXmNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 03/11] fbdev/sbus: Add initializer macros and Kconfig tokens
 for SBUS support
Date: Sun,  6 Aug 2023 13:58:54 +0200
Message-ID: <20230806120926.5368-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806120926.5368-1-tzimmermann@suse.de>
References: <20230806120926.5368-1-tzimmermann@suse.de>
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
Cc: sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add macros to initialize struct fb_ops for drivers that support
framebuffers on Sparc's SBUS. Also add a Kconfig token that selects
the necessary helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig   |  6 ++++++
 drivers/video/fbdev/sbuslib.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 5d93ecc01f6a..fd5bd284c0f8 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -518,6 +518,12 @@ config FB_SBUS
 	help
 	  Say Y if you want support for SBUS or UPA based frame buffer device.
 
+config FB_SBUS_HELPERS
+	bool
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
+
 config FB_BW2
 	bool "BWtwo support"
 	depends on (FB = y) && (SPARC && FB_SBUS)
diff --git a/drivers/video/fbdev/sbuslib.h b/drivers/video/fbdev/sbuslib.h
index 02ac1282903b..6466b4cbcd7b 100644
--- a/drivers/video/fbdev/sbuslib.h
+++ b/drivers/video/fbdev/sbuslib.h
@@ -29,4 +29,35 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg);
 
+/*
+ * Initialize struct fb_ops for SBUS I/O.
+ */
+
+#define __FB_DEFAULT_SBUS_OPS_RDWR(__prefix) \
+	.fb_read	= fb_io_read, \
+	.fb_write	= fb_io_write
+
+#define __FB_DEFAULT_SBUS_OPS_DRAW(__prefix) \
+	.fb_fillrect	= cfb_fillrect, \
+	.fb_copyarea	= cfb_copyarea, \
+	.fb_imageblit	= cfb_imageblit
+
+#ifdef CONFIG_COMPAT
+#define __FB_DEFAULT_SBUS_OPS_IOCTL(__prefix) \
+	.fb_ioctl		= __prefix ## _sbusfb_ioctl, \
+	.fb_compat_ioctl	= sbusfb_compat_ioctl
+#else
+#define __FB_DEFAULT_SBUS_OPS_IOCTL(__prefix) \
+	.fb_ioctl	= __prefix ## _sbusfb_ioctl
+#endif
+
+#define __FB_DEFAULT_SBUS_OPS_MMAP(__prefix) \
+	.fb_mmap	= __prefix ## _sbusfb_mmap
+
+#define FB_DEFAULT_SBUS_OPS(__prefix) \
+	__FB_DEFAULT_SBUS_OPS_RDWR(__prefix), \
+	__FB_DEFAULT_SBUS_OPS_DRAW(__prefix), \
+	__FB_DEFAULT_SBUS_OPS_IOCTL(__prefix), \
+	__FB_DEFAULT_SBUS_OPS_MMAP(__prefix)
+
 #endif /* _SBUSLIB_H */
-- 
2.41.0

