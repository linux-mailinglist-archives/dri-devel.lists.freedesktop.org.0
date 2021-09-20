Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C36411679
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49EC6E517;
	Mon, 20 Sep 2021 14:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A1A6E507
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:10:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 953872208E;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632147053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CB+vxg2L9mCPNR2+ngMTJjUkDKGBNWMvylY+RVOffVU=;
 b=nTXGPcfk9tj9fQFLwJ12ShARAiMxN70qAPi0r1MmezKc515eKeaxUwq15mRZXN8+UqDENW
 TmJMO8hoKti1uENzGauYN1PSugtaP+dq8x/R+7Ub8P2Kl+zbpka0K44B2Dd/crLpERrwuS
 mvGpAvG7T6r9TFJrSP1hKAOXU15UVKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632147053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CB+vxg2L9mCPNR2+ngMTJjUkDKGBNWMvylY+RVOffVU=;
 b=drq+/+lN/AUfmxODTGnhxqIsB4pF+6ZHDPp5M1cRbRxbLeZ5d3U4VYHnDywtfk5Gos13en
 OazItpji0G4jxmAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7384F143AD;
 Mon, 20 Sep 2021 14:10:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WCfZGm2WSGG0cgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 14:10:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm/gma500: Remove dev_priv branch from unload function
Date: Mon, 20 Sep 2021 16:10:50 +0200
Message-Id: <20210920141051.30988-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920141051.30988-1-tzimmermann@suse.de>
References: <20210920141051.30988-1-tzimmermann@suse.de>
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

The value of dev_priv in psb_driver_unload() is always non-zero. Remove
the respective test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/psb_drv.c | 93 ++++++++++++++++----------------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 48967bbc4501..cef9fb6a06d2 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -167,57 +167,56 @@ static void psb_driver_unload(struct drm_device *dev)
 
 	/* TODO: Kill vblank etc here */
 
-	if (dev_priv) {
-		if (dev_priv->backlight_device)
-			gma_backlight_exit(dev);
-		psb_modeset_cleanup(dev);
+	if (dev_priv->backlight_device)
+		gma_backlight_exit(dev);
+	psb_modeset_cleanup(dev);
 
-		if (dev_priv->ops->chip_teardown)
-			dev_priv->ops->chip_teardown(dev);
+	if (dev_priv->ops->chip_teardown)
+		dev_priv->ops->chip_teardown(dev);
 
-		psb_intel_opregion_fini(dev);
+	psb_intel_opregion_fini(dev);
 
-		if (dev_priv->pf_pd) {
-			psb_mmu_free_pagedir(dev_priv->pf_pd);
-			dev_priv->pf_pd = NULL;
-		}
-		if (dev_priv->mmu) {
-			struct psb_gtt *pg = &dev_priv->gtt;
-
-			down_read(&pg->sem);
-			psb_mmu_remove_pfn_sequence(
-				psb_mmu_get_default_pd
-				(dev_priv->mmu),
-				pg->mmu_gatt_start,
-				dev_priv->vram_stolen_size >> PAGE_SHIFT);
-			up_read(&pg->sem);
-			psb_mmu_driver_takedown(dev_priv->mmu);
-			dev_priv->mmu = NULL;
-		}
-		psb_gtt_takedown(dev);
-		if (dev_priv->scratch_page) {
-			set_pages_wb(dev_priv->scratch_page, 1);
-			__free_page(dev_priv->scratch_page);
-			dev_priv->scratch_page = NULL;
-		}
-		if (dev_priv->vdc_reg) {
-			iounmap(dev_priv->vdc_reg);
-			dev_priv->vdc_reg = NULL;
-		}
-		if (dev_priv->sgx_reg) {
-			iounmap(dev_priv->sgx_reg);
-			dev_priv->sgx_reg = NULL;
-		}
-		if (dev_priv->aux_reg) {
-			iounmap(dev_priv->aux_reg);
-			dev_priv->aux_reg = NULL;
-		}
-		pci_dev_put(dev_priv->aux_pdev);
-		pci_dev_put(dev_priv->lpc_pdev);
-
-		/* Destroy VBT data */
-		psb_intel_destroy_bios(dev);
+	if (dev_priv->pf_pd) {
+		psb_mmu_free_pagedir(dev_priv->pf_pd);
+		dev_priv->pf_pd = NULL;
 	}
+	if (dev_priv->mmu) {
+		struct psb_gtt *pg = &dev_priv->gtt;
+
+		down_read(&pg->sem);
+		psb_mmu_remove_pfn_sequence(
+			psb_mmu_get_default_pd
+			(dev_priv->mmu),
+			pg->mmu_gatt_start,
+			dev_priv->vram_stolen_size >> PAGE_SHIFT);
+		up_read(&pg->sem);
+		psb_mmu_driver_takedown(dev_priv->mmu);
+		dev_priv->mmu = NULL;
+	}
+	psb_gtt_takedown(dev);
+	if (dev_priv->scratch_page) {
+		set_pages_wb(dev_priv->scratch_page, 1);
+		__free_page(dev_priv->scratch_page);
+		dev_priv->scratch_page = NULL;
+	}
+	if (dev_priv->vdc_reg) {
+		iounmap(dev_priv->vdc_reg);
+		dev_priv->vdc_reg = NULL;
+	}
+	if (dev_priv->sgx_reg) {
+		iounmap(dev_priv->sgx_reg);
+		dev_priv->sgx_reg = NULL;
+	}
+	if (dev_priv->aux_reg) {
+		iounmap(dev_priv->aux_reg);
+		dev_priv->aux_reg = NULL;
+	}
+	pci_dev_put(dev_priv->aux_pdev);
+	pci_dev_put(dev_priv->lpc_pdev);
+
+	/* Destroy VBT data */
+	psb_intel_destroy_bios(dev);
+
 	gma_power_uninit(dev);
 }
 
-- 
2.33.0

