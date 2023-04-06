Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21426D91B6
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBA510EB30;
	Thu,  6 Apr 2023 08:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B504C10EB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:32:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F2AC21FB8;
 Thu,  6 Apr 2023 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680769964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKBHrMS7FMlxLjl03JkFeFxbWJ2g6H+zJbTU4mqVMyk=;
 b=p/7yN2L9yX/d6un7sr58uECoekbM8uu/iAvD0FF+HW9iiXslYiNR38naKifWEL5dm5Utyj
 HH4ni4wXjbKNptCPwlY/6ckzvWfPYp5vWrwjSnzJr8irsEgnuz/EmuhJpiXoEUH3f/+DO3
 7ypnD4jEuK6hO3xH+EuRk9JXk/Dnz1g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680769964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKBHrMS7FMlxLjl03JkFeFxbWJ2g6H+zJbTU4mqVMyk=;
 b=HkAZHfTOU9neZsJGddh7hPH/JvgG6dwRgHPa4dSAnl+sEsNrgxj69pvIofm+3VgPKoc1j6
 /q/TB2zZRQkn3jAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1057C133E5;
 Thu,  6 Apr 2023 08:32:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4AIfA6yDLmQZZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:32:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v4 8/9] fbdev: Simplify fb_is_primary_device for x86
Date: Thu,  6 Apr 2023 10:32:39 +0200
Message-Id: <20230406083240.14031-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406083240.14031-1-tzimmermann@suse.de>
References: <20230406083240.14031-1-tzimmermann@suse.de>
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
Cc: x86@kernel.org, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

vga_default_device really is supposed to cover all corners, at least
for x86. Additionally checking for rom shadowing should be redundant,
because the bios/fw only does that for the boot vga device.

If this turns out to be wrong, then most likely that's a special case
which should be added to the vgaarb code, not replicated all over.

Patch motived by changes to the aperture helpers, which also have this
open code in a bunch of places, and which are all removed in a
clean-up series. This function here is just for selecting the default
fbdev device for fbcon, but I figured for consistency it might be good
to throw this patch in on top.

Note that the shadow rom check predates vgaarb, which was only wired
up in commit 88674088d10c ("x86: Use vga_default_device() when
determining whether an fb is primary"). That patch doesn't explain why
we still fall back to the shadow rom check.

v4:
- fix commit message style (i.e., commit 1234 ("..."))
- fix Daniel's S-o-b address

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 arch/x86/video/fbdev.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/video/fbdev.c b/arch/x86/video/fbdev.c
index 9fd24846d094..5ec4eafbb981 100644
--- a/arch/x86/video/fbdev.c
+++ b/arch/x86/video/fbdev.c
@@ -14,26 +14,15 @@
 int fb_is_primary_device(struct fb_info *info)
 {
 	struct device *device = info->device;
-	struct pci_dev *default_device = vga_default_device();
 	struct pci_dev *pci_dev;
-	struct resource *res;
 
 	if (!device || !dev_is_pci(device))
 		return 0;
 
 	pci_dev = to_pci_dev(device);
 
-	if (default_device) {
-		if (pci_dev == default_device)
-			return 1;
-		return 0;
-	}
-
-	res = pci_dev->resource + PCI_ROM_RESOURCE;
-
-	if (res->flags & IORESOURCE_ROM_SHADOW)
+	if (pci_dev == vga_default_device())
 		return 1;
-
 	return 0;
 }
 EXPORT_SYMBOL(fb_is_primary_device);
-- 
2.40.0

