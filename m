Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD6D72296F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155710E2BA;
	Mon,  5 Jun 2023 14:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1AC10E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7DA981FE68;
 Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685976497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uHJvrhLmzEPeOw0RdHMUnyLLXBwhpaTKMuUOa6/rKg=;
 b=jdbqMTPVxe2umwJpgenWffNE8eBkkevM+AM+G7kF4OpReYzjMLhnxeqnJj4jc8DHT166kn
 LjaVpyGoTCogoKKxL1kGY5m9ebi9Fi1itkV/b05+T8EP1uRimGM5cpSd5vxeTF3N431PAl
 9L3x56iueavE2C3jaxZAguR75wXyqBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685976497;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uHJvrhLmzEPeOw0RdHMUnyLLXBwhpaTKMuUOa6/rKg=;
 b=95a7bhQjT3Q/ZJetDlQaICVFwSQT21/o5P+dE/EGgKRVRHOgWsXvMzNWVAVwzaQlPUMKoU
 81WK2XQFmTBqvcCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EE35139C8;
 Mon,  5 Jun 2023 14:48:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AMCGDrH1fWQvXwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jun 2023 14:48:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
Subject: [PATCH 09/30] fbdev/ep93xx-fb: Alloc DMA memory from hardware device
Date: Mon,  5 Jun 2023 16:47:51 +0200
Message-Id: <20230605144812.15241-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605144812.15241-1-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass the hardware device to the DMA helpers dma_alloc_wc(), dma_mmap_wc()
and dma_free_coherent(). The fbdev device that is currently being used is
a software device and does not provide DMA memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ep93xx-fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 94fe52928be2..376ee59e925c 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -312,7 +312,7 @@ static int ep93xxfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	unsigned int offset = vma->vm_pgoff << PAGE_SHIFT;
 
 	if (offset < info->fix.smem_len) {
-		return dma_mmap_wc(info->dev, vma, info->screen_base,
+		return dma_mmap_wc(info->device, vma, info->screen_base,
 				   info->fix.smem_start, info->fix.smem_len);
 	}
 
@@ -423,7 +423,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	/* Maximum 16bpp -> used memory is maximum x*y*2 bytes */
 	fb_size = EP93XXFB_MAX_XRES * EP93XXFB_MAX_YRES * 2;
 
-	virt_addr = dma_alloc_wc(info->dev, fb_size, &phys_addr, GFP_KERNEL);
+	virt_addr = dma_alloc_wc(info->device, fb_size, &phys_addr, GFP_KERNEL);
 	if (!virt_addr)
 		return -ENOMEM;
 
@@ -440,7 +440,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 			"has bit 27 set: cannot init framebuffer\n",
 			phys_addr);
 
-		dma_free_coherent(info->dev, fb_size, virt_addr, phys_addr);
+		dma_free_coherent(info->device, fb_size, virt_addr, phys_addr);
 		return -ENOMEM;
 	}
 
@@ -454,7 +454,7 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 static void ep93xxfb_dealloc_videomem(struct fb_info *info)
 {
 	if (info->screen_base)
-		dma_free_coherent(info->dev, info->fix.smem_len,
+		dma_free_coherent(info->device, info->fix.smem_len,
 				  info->screen_base, info->fix.smem_start);
 }
 
-- 
2.40.1

