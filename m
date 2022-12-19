Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAF650FFA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D3D10E2E6;
	Mon, 19 Dec 2022 16:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B89C10E2B7;
 Mon, 19 Dec 2022 16:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2E2738149;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671465921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obTd6Vm1en8QYigHEu9RhDcL5tb/CmpPkDgnKAoQ5jE=;
 b=b4K4FAar1WgYMZX5pfZnzCVcF80GxF/BuZdANPvIPGZthi5DRao3/arOXSSrCzmw+/YfIu
 DkFh6mfpuAErsioiYMFs06ZKz2+V2DVmkQA/tHWYwslk5m/ZgqIWKw4b6LELWED4hBlVJq
 1O/aqwBiAkBpVH844qCWXsHTJU1MG4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671465921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obTd6Vm1en8QYigHEu9RhDcL5tb/CmpPkDgnKAoQ5jE=;
 b=472H4JvHPod2/eeTkuU93yA7QE5pwbZ5rhmYSoL7HgEUeRiKO1eB//pWB5b5OYjMvvrDAE
 xRpEqrP5VJVl4uAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7D6213911;
 Mon, 19 Dec 2022 16:05:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SMr4K8CLoGPeZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:05:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 10/18] fbdev/efifb: Add struct efifb_par for driver data
Date: Mon, 19 Dec 2022 17:05:08 +0100
Message-Id: <20221219160516.23436-11-tzimmermann@suse.de>
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

The efifb_par structure holds the palette for efifb. It will also
be useful for storing the device's aperture range.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/efifb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 16c1aaae9afa..694013f62781 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -49,6 +49,10 @@ static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
 
 static struct pci_dev *efifb_pci_dev;	/* dev with BAR covering the efifb */
 
+struct efifb_par {
+	u32 pseudo_palette[16];
+};
+
 static struct fb_var_screeninfo efifb_defined = {
 	.activate		= FB_ACTIVATE_NOW,
 	.height			= -1,
@@ -351,6 +355,7 @@ static u64 bar_offset;
 static int efifb_probe(struct platform_device *dev)
 {
 	struct fb_info *info;
+	struct efifb_par *par;
 	int err, orientation;
 	unsigned int size_vmode;
 	unsigned int size_remap;
@@ -447,14 +452,14 @@ static int efifb_probe(struct platform_device *dev)
 			efifb_fix.smem_start);
 	}
 
-	info = framebuffer_alloc(sizeof(u32) * 16, &dev->dev);
+	info = framebuffer_alloc(sizeof(*par), &dev->dev);
 	if (!info) {
 		err = -ENOMEM;
 		goto err_release_mem;
 	}
 	platform_set_drvdata(dev, info);
-	info->pseudo_palette = info->par;
-	info->par = NULL;
+	par = info->par;
+	info->pseudo_palette = par->pseudo_palette;
 
 	info->apertures = alloc_apertures(1);
 	if (!info->apertures) {
-- 
2.39.0

