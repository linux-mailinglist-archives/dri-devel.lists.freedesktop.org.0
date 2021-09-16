Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5F40E9B6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 20:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124116E964;
	Thu, 16 Sep 2021 18:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14CB6E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:16:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0EC21223E9;
 Thu, 16 Sep 2021 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631816165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Jh4IL8x6fRz0DGudiE3hYtePs9MzEqvWimsmod0kWA=;
 b=Kac4znEoYCYkMM3Q552GRys++jbrH7qCYvWmnoPJBNv4YlD4I4zZEF26rD4gmP20mi1L8c
 bSGtZhYptZWEoTgYd6yaVz+uNmi15lvdaDykfzK+ODsQQuqfGaXBCi5MbPQUBFdajbY2ZN
 QMFigORuYi7Rm3LW/IGl2dITC9EvwkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631816165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Jh4IL8x6fRz0DGudiE3hYtePs9MzEqvWimsmod0kWA=;
 b=g/IFNaqvd/chtiYOsjkBCDQCX/SUQ6wJWevNKrDKhxhUScvMNwmi0Vg8wCZg7dEw4iHxIL
 ByFbfAbur4+pu0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C492E13D67;
 Thu, 16 Sep 2021 18:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qC8SL+SJQ2FleQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Sep 2021 18:16:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hdegoede@redhat.com,
 marcan@marcan.st, maz@kernel.org, akpm@linux-foundation.org,
 npiggin@gmail.com, thunder.leizhen@huawei.com, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/mgag200: Use managed interfaces for framebuffer write
 combining
Date: Thu, 16 Sep 2021 20:16:00 +0200
Message-Id: <20210916181601.9146-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916181601.9146-1-tzimmermann@suse.de>
References: <20210916181601.9146-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace arch_phys_wc_add() and arch_io_reserve_memtype_wc() with
the rsp managed functions. Allows for removing the cleanup code
for memory management

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h |  2 --
 drivers/gpu/drm/mgag200/mgag200_mm.c  | 35 ++++++---------------------
 2 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 196f74a0834e..4368112023f7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -224,8 +224,6 @@ struct mga_device {
 
 	enum mga_type			type;
 
-	int fb_mtrr;
-
 	union {
 		struct {
 			long ref_clk;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mm.c b/drivers/gpu/drm/mgag200/mgag200_mm.c
index b667371b69a4..fa996d46feed 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mm.c
@@ -75,26 +75,12 @@ static size_t mgag200_probe_vram(struct mga_device *mdev, void __iomem *mem,
 	return offset - 65536;
 }
 
-static void mgag200_mm_release(struct drm_device *dev, void *ptr)
-{
-	struct mga_device *mdev = to_mga_device(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
-	mdev->vram_fb_available = 0;
-	iounmap(mdev->vram);
-	arch_io_free_memtype_wc(pci_resource_start(pdev, 0),
-				pci_resource_len(pdev, 0));
-	arch_phys_wc_del(mdev->fb_mtrr);
-	mdev->fb_mtrr = 0;
-}
-
 int mgag200_mm_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u8 misc;
 	resource_size_t start, len;
-	int ret;
 
 	WREG_ECRT(0x04, 0x00);
 
@@ -112,15 +98,13 @@ int mgag200_mm_init(struct mga_device *mdev)
 		return -ENXIO;
 	}
 
-	arch_io_reserve_memtype_wc(start, len);
-
-	mdev->fb_mtrr = arch_phys_wc_add(start, len);
+	/* Don't fail on errors, but performance might be reduced. */
+	devm_arch_io_reserve_memtype_wc(dev->dev, start, len);
+	devm_arch_phys_wc_add(dev->dev, start, len);
 
-	mdev->vram = ioremap(start, len);
-	if (!mdev->vram) {
-		ret = -ENOMEM;
-		goto err_arch_phys_wc_del;
-	}
+	mdev->vram = devm_ioremap(dev->dev, start, len);
+	if (!mdev->vram)
+		return -ENOMEM;
 
 	mdev->mc.vram_size = mgag200_probe_vram(mdev, mdev->vram, len);
 	mdev->mc.vram_base = start;
@@ -128,10 +112,5 @@ int mgag200_mm_init(struct mga_device *mdev)
 
 	mdev->vram_fb_available = mdev->mc.vram_size;
 
-	return drmm_add_action_or_reset(dev, mgag200_mm_release, NULL);
-
-err_arch_phys_wc_del:
-	arch_phys_wc_del(mdev->fb_mtrr);
-	arch_io_free_memtype_wc(start, len);
-	return ret;
+	return 0;
 }
-- 
2.33.0

