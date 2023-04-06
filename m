Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B826D91AD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0410EB1F;
	Thu,  6 Apr 2023 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C9210EB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:32:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9578621EEA;
 Thu,  6 Apr 2023 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680769962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVq5xku2YBPP1JrbSkNVMy9kEwLyhKOdjOkmRaST3jE=;
 b=PJNxcaHu5Kha0XNE5ZRbGedAD7nqNmmJMW4cHu2dfKLL1HYrHOHEXaaZ8b3l4/TqcZnplL
 i0Y0s/D2J7yORbByHAQ5evfs0NC7FO5eQcADhqvE3/WzN3nJMcwxqdS2sZ4bKeML89aADa
 9P1qktAhzazuuwVm10FucY6cUtTRFMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680769962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVq5xku2YBPP1JrbSkNVMy9kEwLyhKOdjOkmRaST3jE=;
 b=vo42XOpWAa7gRyO6SwVMuZKnIlZ8IXFEV7lPzmAWbgn4d8KMX4xvWnCruR8vCUmYS0/WIq
 UZd2ic6NEunf9PBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62E2A133E5;
 Thu,  6 Apr 2023 08:32:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SBsrF6qDLmQZZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:32:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v4 2/9] video/aperture: use generic code to figure out the vga
 default device
Date: Thu,  6 Apr 2023 10:32:33 +0200
Message-Id: <20230406083240.14031-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Since vgaarb has been promoted to be a core piece of the pci subsystem
we don't have to open code random guesses anymore, we actually know
this in a platform agnostic way, and there's no need for an x86
specific hack. See also commit 1d38fe6ee6a8 ("PCI/VGA: Move vgaarb to
drivers/pci")

This should not result in any functional change, and the non-x86
multi-gpu pci systems are probably rare enough to not matter (I don't
know of any tbh). But it's a nice cleanup, so let's do it.

There's been a few questions on previous iterations on dri-devel and
irc:

- fb_is_primary_device() seems to be yet another implementation of
  this theme, and at least on x86 it checks for both
  vga_default_device OR rom shadowing. There shouldn't ever be a case
  where rom shadowing gives any additional hints about the boot vga
  device, but if there is then the default vga selection in vgaarb
  should probably be fixed. And not special-case checks replicated all
  over.

- Thomas also brought up that on most !x86 systems
  fb_is_primary_device() returns 0, except on sparc/parisc. But these
  2 special cases are about platform specific devices and not pci, so
  shouldn't have any interactions.

- Furthermore fb_is_primary_device() is a bit a red herring since it's
  only used to select the right fbdev driver for fbcon, and not for
  the fw handover dance which the aperture helpers handle. At least
  for x86 we might want to look into unifying them, but that's a
  separate thing.

v2: Extend commit message trying to summarize various discussions.

v4:
- make the test for the primary device easier to read (Javier)
- fix commit message style (i.e., commit 1234 ("..."))
- fix Daniel's S-o-b address

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/aperture.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 41e77de1ea82..d0eccc4ed60b 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -328,9 +328,8 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 	resource_size_t base, size;
 	int bar, ret;
 
-#ifdef CONFIG_X86
-	primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
-#endif
+	if (pdev == vga_default_device())
+		primary = true;
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
-- 
2.40.0

