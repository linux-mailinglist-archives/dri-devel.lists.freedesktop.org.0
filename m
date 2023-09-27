Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE107AFCA2
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED0210E47A;
	Wed, 27 Sep 2023 07:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBA710E47F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C75711F8AB;
 Wed, 27 Sep 2023 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF4q/BcGjd3EcEu/UtBnJFO+RuYCH2Wk4kZdjDMiFr0=;
 b=WqzRei3/rLDeaKxj3/3jqeBHVMqWmeTdoE+a8zvSe2G5wm5Oc+Lu8RAeJPGSjtbhGqdN6k
 3U0e+7rsJEzcIhBWGvNtXQ38e6IGyF9JSgCNK6jBc6ZSb4YkiE7GXWg9vhWMr+61Z0oQJb
 4GjOL7sMBi57JynSyCCJjhZQ68dI+u8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF4q/BcGjd3EcEu/UtBnJFO+RuYCH2Wk4kZdjDMiFr0=;
 b=kzF3hdiK0b7++Wq+QbEA1mbfhS2uglWQZRjaGRS7a/rptovTeehY5jf83rgoWxgTRjv9op
 /7+iVHa+ipYY46AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B0011338F;
 Wed, 27 Sep 2023 07:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UNcHIRDeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 16/46] fbdev/hgafb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:49 +0200
Message-ID: <20230927074722.6197-17-tzimmermann@suse.de>
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
 dri-devel@lists.freedesktop.org, Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-nvidia@lists.surfsouth.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
---
 drivers/video/fbdev/Kconfig | 1 +
 drivers/video/fbdev/hgafb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 0f6cd44bc7561..0e0591fb32cae 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -485,6 +485,7 @@ config FB_N411
 config FB_HGA
 	tristate "Hercules mono graphics support"
 	depends on FB && X86
+	select FB_IOMEM_FOPS
 	help
 	  Say Y here if you have a Hercules mono graphics card.
 
diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index 6a64e6d7255eb..10728259dac25 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -532,12 +532,14 @@ static const struct fb_ops hgafb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= hgafb_open,
 	.fb_release	= hgafb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_setcolreg	= hgafb_setcolreg,
 	.fb_pan_display	= hgafb_pan_display,
 	.fb_blank	= hgafb_blank,
 	.fb_fillrect	= hgafb_fillrect,
 	.fb_copyarea	= hgafb_copyarea,
 	.fb_imageblit	= hgafb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 /* ------------------------------------------------------------------------- *
-- 
2.42.0

