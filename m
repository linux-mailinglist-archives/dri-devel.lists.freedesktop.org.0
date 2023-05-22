Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FA70C5BB
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 21:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA9A10E228;
	Mon, 22 May 2023 19:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D766410E214
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 19:06:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 81281200EC;
 Mon, 22 May 2023 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684782402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tiCnBFxJmBc6Og9u/JUT6ZWwU8jv+TZ56qM+6S+dSB8=;
 b=Du8yoFZ/nlyFZq7cpgznbaDngVIhVQMcQZnKyzR4hXHlneT66kw6LOjQBWyBbJN4+0cmTd
 P+a6htvuF1IzZ37q94VU7zRXxRxTs9+cYsQqeWVLeZIUnRMoVm5fDKqDIWjVjTXCmXdT2B
 HYeVeSrEB5lrVZxwIzylazabgxR7mZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684782402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tiCnBFxJmBc6Og9u/JUT6ZWwU8jv+TZ56qM+6S+dSB8=;
 b=VZRsa8mH05WiS+ofq1Pyf54QOmRLDuw/KOPfp0WcwtkpgAv/5KoUi9ZzNbr52HgERsmddH
 ytTy8Z8iwmM8R2Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 618B313336;
 Mon, 22 May 2023 19:06:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lAHCFkK9a2T+MQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 19:06:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Clear fbdev framebuffer with fb_memset_io()
Date: Mon, 22 May 2023 21:06:37 +0200
Message-Id: <20230522190637.7039-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev framebuffer is I/O memory, so clear it with fb_memset_io().
Fixes the following sparse warning:

../drivers/gpu/drm/gma500/fbdev.c:234:20: warning: incorrect type in argument 1 (different address spaces)
../drivers/gpu/drm/gma500/fbdev.c:234:20:    expected void *s
../drivers/gpu/drm/gma500/fbdev.c:234:20:    got char [noderef] __iomem *screen_base

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 62287407e717..4f0309548b2b 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -231,7 +231,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	info->fix.mmio_start = pci_resource_start(pdev, 0);
 	info->fix.mmio_len = pci_resource_len(pdev, 0);
 
-	memset(info->screen_base, 0, info->screen_size);
+	fb_memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
-- 
2.40.1

