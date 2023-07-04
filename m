Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B937475D5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 18:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714F710E2DD;
	Tue,  4 Jul 2023 16:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B79D10E2DD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 16:01:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 685F71FDCE;
 Tue,  4 Jul 2023 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688486495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HNzFbkOxT3wYRs/yGJOSWV56VFROq6gaVSgPJPLezI=;
 b=CF/NsosiphT5TK8Gm/jnpeQW+5mJgGl2kBwo4m9jiUoqOtbGoCUfaTgU5P7OzFJ5evzkVX
 wiBTrnRuKz4CTqobiZHFNfKIBs0ALA3MBVkgGzYBaYtbxSoke/IRp0NC0Oj/Dn5yhEEtL4
 pz0fmnzVXTVuyynR1RdYMHlQbC8a+c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688486495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9HNzFbkOxT3wYRs/yGJOSWV56VFROq6gaVSgPJPLezI=;
 b=VMsaooGl05z/fGaZ4w2m/1zddiga9OcnyIO0AhrgQW15PMrVEaMH/JhlC0FDqnkN5Z2gGR
 VaU9K7DdH0tvEgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33522139ED;
 Tue,  4 Jul 2023 16:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JOgC19CpGTzLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Jul 2023 16:01:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
Date: Tue,  4 Jul 2023 17:49:58 +0200
Message-ID: <20230704160133.20261-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704160133.20261-1-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
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

