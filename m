Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB1650FC9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D710E2C4;
	Mon, 19 Dec 2022 16:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF4810E002;
 Mon, 19 Dec 2022 16:05:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A57F38148;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+BusCraEh5B/kjNqlmWH+J56/01IzSqEoXG4u/ApxA=;
 b=k7jGbHXivI8oaQx7V9IBKJo+DdTFFl41MQn27pb9GsHRNJ74ovh21uVJdx1DBf6AM1AN94
 tUvpGhJrqeLTJvrIVht5sLAu5lgKhrihHp3PQF08mHJCtJiLIq764LPsFwt9m1Grq4ptQU
 Z2SZ8LUremjqHJ6YvZlq3xNvFen8q8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465920;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+BusCraEh5B/kjNqlmWH+J56/01IzSqEoXG4u/ApxA=;
 b=y/6SDwejq5Tt4rZOdRLJCx0aYachA6O9xsFjfG0AGO+GH3NwOR3y+4LVALyVGFr4W8+Vb3
 MB84pAqpOitWoQBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 415CB13911;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mKASD8CLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 08/18] fbdev/hyperv-fb: Do not set struct fb_info.apertures
Date: Mon, 19 Dec 2022 17:05:06 +0100
Message-Id: <20221219160516.23436-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219160516.23436-1-tzimmermann@suse.de>
References: <20221219160516.23436-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic fbdev drivers use the apertures field in struct fb_info to
control ownership of the framebuffer memory and graphics device. Do
not set the values in hyperv-fb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hyperv_fb.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index d8edb5635f77..1c7d6ff5a6c0 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -988,13 +988,10 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	struct pci_dev *pdev  = NULL;
 	void __iomem *fb_virt;
 	int gen2vm = efi_enabled(EFI_BOOT);
+	resource_size_t base, size;
 	phys_addr_t paddr;
 	int ret;
 
-	info->apertures = alloc_apertures(1);
-	if (!info->apertures)
-		return -ENOMEM;
-
 	if (!gen2vm) {
 		pdev = pci_get_device(PCI_VENDOR_ID_MICROSOFT,
 			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
@@ -1003,8 +1000,8 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			return -ENODEV;
 		}
 
-		info->apertures->ranges[0].base = pci_resource_start(pdev, 0);
-		info->apertures->ranges[0].size = pci_resource_len(pdev, 0);
+		base = pci_resource_start(pdev, 0);
+		size = pci_resource_len(pdev, 0);
 
 		/*
 		 * For Gen 1 VM, we can directly use the contiguous memory
@@ -1027,8 +1024,8 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 		}
 		pr_info("Unable to allocate enough contiguous physical memory on Gen 1 VM. Using MMIO instead.\n");
 	} else {
-		info->apertures->ranges[0].base = screen_info.lfb_base;
-		info->apertures->ranges[0].size = screen_info.lfb_size;
+		base = screen_info.lfb_base;
+		size = screen_info.lfb_size;
 	}
 
 	/*
@@ -1070,9 +1067,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	info->screen_size = dio_fb_size;
 
 getmem_done:
-	aperture_remove_conflicting_devices(info->apertures->ranges[0].base,
-					    info->apertures->ranges[0].size,
-					    false, KBUILD_MODNAME);
+	aperture_remove_conflicting_devices(base, size, false, KBUILD_MODNAME);
 
 	if (gen2vm) {
 		/* framebuffer is reallocated, clear screen_info to avoid misuse from kexec */
-- 
2.39.0

