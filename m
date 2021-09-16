Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83040E9B5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 20:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BEE6E98D;
	Thu, 16 Sep 2021 18:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E926E57E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:16:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5416D1FF07;
 Thu, 16 Sep 2021 18:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631816165; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZmcdpEyICX8T3xnNyzpUDIl3QY/10Xz2N01djy0zPs=;
 b=NRIJuSyDB+28aolGyA8CMMtkq8FjUMnvjrlKr7Tx7Og9/4RJa0kRoqerlAOuwcDuozISaQ
 tv0M9psIk4FgINmLBHaPk96Wkm2hTzRPYUDqZfr7BRCWkRcIRBIzdOgYtYsH0+MRcd/9w4
 +JSjKweqa5OW6+AfiGpUfGUklTKIR20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631816165;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZmcdpEyICX8T3xnNyzpUDIl3QY/10Xz2N01djy0zPs=;
 b=+K8P0s4o2kEFkekV6SqS3I18TW1FI8zhlBz138EQ5H2GkUw4gmKanywjOxjfZoJke+PGI2
 9JE1UxDjrAaDX/AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1488313F79;
 Thu, 16 Sep 2021 18:16:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0L4IBOWJQ2FleQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Sep 2021 18:16:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hdegoede@redhat.com,
 marcan@marcan.st, maz@kernel.org, akpm@linux-foundation.org,
 npiggin@gmail.com, thunder.leizhen@huawei.com, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/5] drm/vboxvideo: Use managed interfaces for framebuffer
 write combining
Date: Thu, 16 Sep 2021 20:16:01 +0200
Message-Id: <20210916181601.9146-6-tzimmermann@suse.de>
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

Replace arch_phys_wc_add() with the rsp managed function. Allows for
removing the cleanup code for memory management

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.c |  5 +----
 drivers/gpu/drm/vboxvideo/vbox_drv.h |  1 -
 drivers/gpu/drm/vboxvideo/vbox_ttm.c | 17 ++++++++---------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
index 2b81cb259d23..a6c81af37345 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -69,7 +69,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	ret = vbox_mode_init(vbox);
 	if (ret)
-		goto err_mm_fini;
+		goto err_hw_fini;
 
 	ret = vbox_irq_init(vbox);
 	if (ret)
@@ -87,8 +87,6 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	vbox_irq_fini(vbox);
 err_mode_fini:
 	vbox_mode_fini(vbox);
-err_mm_fini:
-	vbox_mm_fini(vbox);
 err_hw_fini:
 	vbox_hw_fini(vbox);
 	return ret;
@@ -101,7 +99,6 @@ static void vbox_pci_remove(struct pci_dev *pdev)
 	drm_dev_unregister(&vbox->ddev);
 	vbox_irq_fini(vbox);
 	vbox_mode_fini(vbox);
-	vbox_mm_fini(vbox);
 	vbox_hw_fini(vbox);
 }
 
diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index 4903b91d7fe4..e77bd6512eb1 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -139,7 +139,6 @@ void vbox_mode_fini(struct vbox_private *vbox);
 void vbox_report_caps(struct vbox_private *vbox);
 
 int vbox_mm_init(struct vbox_private *vbox);
-void vbox_mm_fini(struct vbox_private *vbox);
 
 /* vbox_irq.c */
 int vbox_irq_init(struct vbox_private *vbox);
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index fd8a53a4d8d6..dc24c2172fd4 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -13,22 +13,21 @@
 int vbox_mm_init(struct vbox_private *vbox)
 {
 	int ret;
+	resource_size_t base, size;
 	struct drm_device *dev = &vbox->ddev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
-				       vbox->available_vram_size);
+	base = pci_resource_start(pdev, 0);
+	size = pci_resource_len(pdev, 0);
+
+	/* Don't fail on errors, but performance might be reduced. */
+	devm_arch_phys_wc_add(&pdev->dev, base, size);
+
+	ret = drmm_vram_helper_init(dev, base, vbox->available_vram_size);
 	if (ret) {
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
 		return ret;
 	}
 
-	vbox->fb_mtrr = arch_phys_wc_add(pci_resource_start(pdev, 0),
-					 pci_resource_len(pdev, 0));
 	return 0;
 }
-
-void vbox_mm_fini(struct vbox_private *vbox)
-{
-	arch_phys_wc_del(vbox->fb_mtrr);
-}
-- 
2.33.0

