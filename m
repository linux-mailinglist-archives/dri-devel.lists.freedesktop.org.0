Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A97EE84CBF6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D1A113262;
	Wed,  7 Feb 2024 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zV6RQpW3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z9jG/9eF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zV6RQpW3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z9jG/9eF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5014810E7A5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:49:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBDA422305;
 Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
 b=zV6RQpW3bKTOS2uqTULwl9TSW9yvpF9M9zEuQOIeJUD95IzdCqGK4Y7A+QWI1/P6DzkvZW
 qbK1OdzU5y3/j3n9XeHLg/gay4ACx7ajikyAB7SptNLQHp3/d+T0obqbD3rJ6Q9lkSabn6
 XVtspSFwHTkf1eOZDqXqFtnlHi3H6RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707313777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
 b=Z9jG/9eF86O+xymlhlBRWA1t2cXILrJ6pvphGXtZnktaT1bjk+1hZszBisOtJfrARUK7CF
 pQyI08KzBxQKlnAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
 b=zV6RQpW3bKTOS2uqTULwl9TSW9yvpF9M9zEuQOIeJUD95IzdCqGK4Y7A+QWI1/P6DzkvZW
 qbK1OdzU5y3/j3n9XeHLg/gay4ACx7ajikyAB7SptNLQHp3/d+T0obqbD3rJ6Q9lkSabn6
 XVtspSFwHTkf1eOZDqXqFtnlHi3H6RA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707313777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7/m6ngH/9vR7GU3dOozu7ziOJrbdZSSV92eIclE80M=;
 b=Z9jG/9eF86O+xymlhlBRWA1t2cXILrJ6pvphGXtZnktaT1bjk+1hZszBisOtJfrARUK7CF
 pQyI08KzBxQKlnAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 870A2139B9;
 Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aL1qH3GKw2V7IQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sui.jingfeng@linux.dev, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 8/8] fbdev/efifb: Remove framebuffer relocation tracking
Date: Wed,  7 Feb 2024 14:47:17 +0100
Message-ID: <20240207134932.7321-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207134932.7321-1-tzimmermann@suse.de>
References: <20240207134932.7321-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RL4936hw7dbgk3hb39jfn1xy19)];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[26.53%]
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the firmware framebuffer has been reloacted, the sysfb code
fixes the screen_info state before it creates the framebuffer's
platform device. Efifb will automatically receive a screen_info
with updated values. Hence remove the tracking from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/video/fbdev/efifb.c | 76 +------------------------------------
 1 file changed, 1 insertion(+), 75 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index f76b7ae007518..8dd82afb3452b 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -13,7 +13,6 @@
 #include <linux/efi-bgrt.h>
 #include <linux/errno.h>
 #include <linux/fb.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
@@ -47,8 +46,6 @@ static bool use_bgrt = true;
 static bool request_mem_succeeded = false;
 static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
 
-static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
-
 struct efifb_par {
 	u32 pseudo_palette[16];
 	resource_size_t base;
@@ -348,9 +345,6 @@ static struct attribute *efifb_attrs[] = {
 };
 ATTRIBUTE_GROUPS(efifb);
 
-static struct resource *bar_resource;
-static u64 bar_offset;
-
 static int efifb_probe(struct platform_device *dev)
 {
 	struct screen_info *si;
@@ -411,21 +405,7 @@ static int efifb_probe(struct platform_device *dev)
 		si->rsvd_pos = 24;
 	}
 
-	efifb_fix.smem_start = si->lfb_base;
-
-	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE) {
-		u64 ext_lfb_base;
-
-		ext_lfb_base = (u64)(unsigned long)si->ext_lfb_base << 32;
-		efifb_fix.smem_start |= ext_lfb_base;
-	}
-
-	if (bar_resource &&
-	    bar_resource->start + bar_offset != efifb_fix.smem_start) {
-		dev_info(&efifb_pci_dev->dev,
-			 "BAR has moved, updating efifb address\n");
-		efifb_fix.smem_start = bar_resource->start + bar_offset;
-	}
+	efifb_fix.smem_start = __screen_info_lfb_base(si);
 
 	efifb_defined.bits_per_pixel = si->lfb_depth;
 	efifb_defined.xres = si->lfb_width;
@@ -640,57 +620,3 @@ static struct platform_driver efifb_driver = {
 };
 
 builtin_platform_driver(efifb_driver);
-
-#if defined(CONFIG_PCI)
-
-static void record_efifb_bar_resource(struct pci_dev *dev, int idx, u64 offset)
-{
-	u16 word;
-
-	efifb_pci_dev = dev;
-
-	pci_read_config_word(dev, PCI_COMMAND, &word);
-	if (!(word & PCI_COMMAND_MEMORY)) {
-		dev_err(&dev->dev,
-			"BAR %d: assigned to efifb but device is disabled!\n",
-			idx);
-		return;
-	}
-
-	bar_resource = &dev->resource[idx];
-	bar_offset = offset;
-
-	dev_info(&dev->dev, "BAR %d: assigned to efifb\n", idx);
-}
-
-static void efifb_fixup_resources(struct pci_dev *dev)
-{
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	int i;
-
-	if (efifb_pci_dev || screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
-		return;
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	if (!base)
-		return;
-
-	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
-		struct resource *res = &dev->resource[i];
-
-		if (!(res->flags & IORESOURCE_MEM))
-			continue;
-
-		if (res->start <= base && res->end >= base + size - 1) {
-			record_efifb_bar_resource(dev, i, base - res->start);
-			break;
-		}
-	}
-}
-DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY,
-			       16, efifb_fixup_resources);
-
-#endif
-- 
2.43.0

