Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 634045AF636
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 22:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36FA10EAD8;
	Tue,  6 Sep 2022 20:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7C210EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662496737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oTshp9JRJarcNiAGEN39IGs6tsZIsOMdlugCotc2gX8=;
 b=M4QWh4ukIzO41WkqxoaS5z+Gj8NtbpFrEnbyFMvOeb3E0dVr0F/qUinCrnLQV3rf7nIvBu
 pfp3RWPI5UmWgHFBq33zxmXZQhqG/DqAgEwERbNx+WwBbpJqyswQLUimgXEUFJOtN+1Rjj
 zibms4enVo4C9GG4qW2YTi7Yh5grEw4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-7QBD7uBZMOmk-QeseLYiDQ-1; Tue, 06 Sep 2022 16:38:56 -0400
X-MC-Unique: 7QBD7uBZMOmk-QeseLYiDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBA5E3C025C9;
 Tue,  6 Sep 2022 20:38:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 299912026D4C;
 Tue,  6 Sep 2022 20:38:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v2 3/3] drm/gma500: Fix (vblank) IRQs not working after
 suspend/resume
Date: Tue,  6 Sep 2022 22:38:52 +0200
Message-Id: <20220906203852.527663-4-hdegoede@redhat.com>
In-Reply-To: <20220906203852.527663-1-hdegoede@redhat.com>
References: <20220906203852.527663-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix gnome-shell (and other page-flip users) hanging after suspend/resume
because of the gma500's IRQs not working.

This fixes 2 problems with the IRQ handling:

1. gma_power_off() calls gma_irq_uninstall() which does a free_irq(), but
   gma_power_on() called gma_irq_preinstall() + gma_irq_postinstall() which
   do not call request_irq. Replace the pre- + post-install calls with
   gma_irq_install() which does prep + request + post.

2. After fixing 1. IRQs still do not work on a Packard Bell Dot SC (Intel
   Atom N2600, cedarview) netbook.

   Cederview uses MSI interrupts and it seems that the BIOS re-configures
   things back to normal APIC based interrupts during S3 suspend. There is
   some MSI PCI-config registers save/restore code which tries to deal with
   this, but on the Packard Bell Dot SC this is not sufficient to restore
   MSI IRQ functionality after a suspend/resume.

   Replace the PCI-config registers save/restore with pci_disable_msi() on
   suspend + pci_enable_msi() on resume. Fixing e.g. gnome-shell hanging.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/cdv_device.c      |  4 +---
 drivers/gpu/drm/gma500/oaktrail_device.c |  5 +----
 drivers/gpu/drm/gma500/power.c           |  8 +-------
 drivers/gpu/drm/gma500/psb_drv.c         |  2 +-
 drivers/gpu/drm/gma500/psb_drv.h         |  5 +----
 drivers/gpu/drm/gma500/psb_irq.c         | 15 ++++++++++++---
 drivers/gpu/drm/gma500/psb_irq.h         |  2 +-
 7 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index dd32b484dd82..ce96234f3df2 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -581,11 +581,9 @@ static const struct psb_offset cdv_regmap[2] = {
 static int cdv_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
 
-	if (pci_enable_msi(pdev))
-		dev_warn(dev->dev, "Enabling MSI failed!\n");
+	dev_priv->use_msi = true;
 	dev_priv->regmap = cdv_regmap;
 	gma_get_core_freq(dev);
 	psb_intel_opregion_init(dev);
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 5923a9c89312..f90e628cb482 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -501,12 +501,9 @@ static const struct psb_offset oaktrail_regmap[2] = {
 static int oaktrail_chip_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int ret;
 
-	if (pci_enable_msi(pdev))
-		dev_warn(dev->dev, "Enabling MSI failed!\n");
-
+	dev_priv->use_msi = true;
 	dev_priv->regmap = oaktrail_regmap;
 
 	ret = mid_chip_setup(dev);
diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index b91de6d36e41..66873085d450 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -139,8 +139,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
 	dev_priv->regs.saveBSM = bsm;
 	pci_read_config_dword(pdev, 0xFC, &vbt);
 	dev_priv->regs.saveVBT = vbt;
-	pci_read_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, &dev_priv->msi_addr);
-	pci_read_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, &dev_priv->msi_data);
 
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, PCI_D3hot);
@@ -168,9 +166,6 @@ static bool gma_resume_pci(struct pci_dev *pdev)
 	pci_restore_state(pdev);
 	pci_write_config_dword(pdev, 0x5c, dev_priv->regs.saveBSM);
 	pci_write_config_dword(pdev, 0xFC, dev_priv->regs.saveVBT);
-	/* restoring MSI address and data in PCIx space */
-	pci_write_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, dev_priv->msi_addr);
-	pci_write_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, dev_priv->msi_data);
 	ret = pci_enable_device(pdev);
 
 	if (ret != 0)
@@ -223,8 +218,7 @@ int gma_power_resume(struct device *_dev)
 	mutex_lock(&power_mutex);
 	gma_resume_pci(pdev);
 	gma_resume_display(pdev);
-	gma_irq_preinstall(dev);
-	gma_irq_postinstall(dev);
+	gma_irq_install(dev);
 	mutex_unlock(&power_mutex);
 	return 0;
 }
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 1d8744f3e702..54e756b48606 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -383,7 +383,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 
-	gma_irq_install(dev, pdev->irq);
+	gma_irq_install(dev);
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 0ea3d23575f3..731cc356c07a 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -490,6 +490,7 @@ struct drm_psb_private {
 	int rpm_enabled;
 
 	/* MID specific */
+	bool use_msi;
 	bool has_gct;
 	struct oaktrail_gct_data gct_data;
 
@@ -499,10 +500,6 @@ struct drm_psb_private {
 	/* Register state */
 	struct psb_save_area regs;
 
-	/* MSI reg save */
-	uint32_t msi_addr;
-	uint32_t msi_data;
-
 	/* Hotplug handling */
 	struct work_struct hotplug_work;
 
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index e6e6d61bbeab..038f18ed0a95 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -316,17 +316,24 @@ void gma_irq_postinstall(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 }
 
-int gma_irq_install(struct drm_device *dev, unsigned int irq)
+int gma_irq_install(struct drm_device *dev)
 {
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	int ret;
 
-	if (irq == IRQ_NOTCONNECTED)
+	if (dev_priv->use_msi && pci_enable_msi(pdev)) {
+		dev_warn(dev->dev, "Enabling MSI failed!\n");
+		dev_priv->use_msi = false;
+	}
+
+	if (pdev->irq == IRQ_NOTCONNECTED)
 		return -ENOTCONN;
 
 	gma_irq_preinstall(dev);
 
 	/* PCI devices require shared interrupts. */
-	ret = request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
+	ret = request_irq(pdev->irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
 	if (ret)
 		return ret;
 
@@ -369,6 +376,8 @@ void gma_irq_uninstall(struct drm_device *dev)
 	spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
 
 	free_irq(pdev->irq, dev);
+	if (dev_priv->use_msi)
+		pci_disable_msi(pdev);
 }
 
 int gma_crtc_enable_vblank(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
index b51e395194ff..7648f69824a5 100644
--- a/drivers/gpu/drm/gma500/psb_irq.h
+++ b/drivers/gpu/drm/gma500/psb_irq.h
@@ -17,7 +17,7 @@ struct drm_device;
 
 void gma_irq_preinstall(struct drm_device *dev);
 void gma_irq_postinstall(struct drm_device *dev);
-int  gma_irq_install(struct drm_device *dev, unsigned int irq);
+int  gma_irq_install(struct drm_device *dev);
 void gma_irq_uninstall(struct drm_device *dev);
 
 int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
-- 
2.37.2

