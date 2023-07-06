Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DF749C6C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5B010E3F7;
	Thu,  6 Jul 2023 12:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4638510E3F4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:49:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97ED022938;
 Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688647747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKR3ZnbG7MMz5F4/vJcdpyoOxU6C2g5Dy4H9g3Ktz+0=;
 b=sXc4YA8u8aTqZndLL8hSvqvUD9NqGTTAKcn8jrziX34ylRUlfDprk0iEOcfflc3VUb3t5o
 AI3wtRG3kY7rzdEFm0bYJTpeLWz/ZIYpuBPkGiofOnG22tRHeTCvpdZCyE3oUmyfjbC3kA
 eV8byS/dEP6hz/rQVjRBIXKgK/jSrkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688647747;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKR3ZnbG7MMz5F4/vJcdpyoOxU6C2g5Dy4H9g3Ktz+0=;
 b=3lacPbe3y9/72q/1mlWk1ASFMP6+e6rSoEwKwHycOsXsSnyeWKAanYjh3LCpJ5kyiVbbrM
 ZlTnLXRQ+w2S3JAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FFAA138FC;
 Thu,  6 Jul 2023 12:49:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wHSfEkO4pmS7QgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 12:49:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 01/11] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
Date: Thu,  6 Jul 2023 14:46:39 +0200
Message-ID: <20230706124905.15134-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706124905.15134-1-tzimmermann@suse.de>
References: <20230706124905.15134-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initializer macros for struct fb_ops for framebuffers in DMA-able
memory areas. Also add a corresponding Kconfig token. As of now, this
is equivalent to system framebuffers and mostly useful for labeling
drivers correctly.

A later patch may add a generic DMA-specific mmap operation. Linux
offers a number of dma_mmap_*() helpers for different use cases.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/Kconfig |  8 ++++++++
 include/linux/fb.h          | 13 +++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index cecf15418632..f14229757311 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -168,6 +168,14 @@ config FB_DEFERRED_IO
 	bool
 	depends on FB
 
+config FB_DMA_HELPERS
+	bool
+	depends on FB
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
+
 config FB_IO_HELPERS
 	bool
 	depends on FB
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b09..1191a78c5289 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -594,6 +594,19 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 	__FB_DEFAULT_SYS_OPS_DRAW, \
 	__FB_DEFAULT_SYS_OPS_MMAP
 
+/*
+ * Helpers for framebuffers in DMA-able memory
+ */
+
+#define __FB_DEFAULT_DMA_OPS_RDWR \
+	.fb_read	= fb_sys_read, \
+	.fb_write	= fb_sys_write
+
+#define __FB_DEFAULT_DMA_OPS_DRAW \
+	.fb_fillrect	= sys_fillrect, \
+	.fb_copyarea	= sys_copyarea, \
+	.fb_imageblit	= sys_imageblit
+
 /* drivers/video/fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
-- 
2.41.0

