Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462797AFCEB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED2910E475;
	Wed, 27 Sep 2023 07:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDA710E476
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 336F2218A4;
 Wed, 27 Sep 2023 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeQUJIWHKBBJ3jys9jjR4bGnZhwDb6jK0AnbAs8YGpk=;
 b=yZkOcQObzqTpg0xhq9dzvYbujp/QwAFaI6MGVQqN2dGUAIS2mKhvY9D9qTGNDN7TqxCPCP
 oDCgAr6sz60QliCOY6/4imoISZS4n666LuzJq/BVCApp128aixe0OLrVvAy35Ny1MZTJQn
 7RA0QbVn1L4mGnAkDdH9vP7v4RmNz4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PeQUJIWHKBBJ3jys9jjR4bGnZhwDb6jK0AnbAs8YGpk=;
 b=TJrvxOxYcF4yr5U6G4xV3p21zcvJSi8u26plSvZZGhJIxrnXRzOT7CVicCbxHnUK6cOHyq
 JBOJngSDyrVIagAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B346613A74;
 Wed, 27 Sep 2023 07:47:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YLXsKhLeE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 24/46] fbdev/nvidiafb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:57 +0200
Message-ID: <20230927074722.6197-25-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 linux-parisc@vger.kernel.org, dri-devel@lists.freedesktop.org,
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
Cc: Antonino Daplas <adaplas@gmail.com>
---
 drivers/video/fbdev/Kconfig         | 2 +-
 drivers/video/fbdev/nvidia/nvidia.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6105a97a3cf9c..8b387d98f6b1e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -689,10 +689,10 @@ config FB_NVIDIA
 	tristate "nVidia Framebuffer Support"
 	depends on FB && PCI
 	select FB_BACKLIGHT if FB_NVIDIA_BACKLIGHT
-	select FB_MODE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select BITREVERSE
 	select VGASTATE
 	select VIDEO_NOMODESET
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 907c22408652b..8900f181f1952 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1028,6 +1028,7 @@ static struct fb_ops nvidia_fb_ops = {
 	.owner          = THIS_MODULE,
 	.fb_open        = nvidiafb_open,
 	.fb_release     = nvidiafb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var   = nvidiafb_check_var,
 	.fb_set_par     = nvidiafb_set_par,
 	.fb_setcolreg   = nvidiafb_setcolreg,
@@ -1038,6 +1039,7 @@ static struct fb_ops nvidia_fb_ops = {
 	.fb_imageblit   = nvidiafb_imageblit,
 	.fb_cursor      = nvidiafb_cursor,
 	.fb_sync        = nvidiafb_sync,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int nvidiafb_suspend_late(struct device *dev, pm_message_t mesg)
-- 
2.42.0

