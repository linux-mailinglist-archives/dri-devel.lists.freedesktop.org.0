Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C395B36CF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492810ECCF;
	Fri,  9 Sep 2022 11:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D1A10ECC7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK1CdanF9meIELJCy6euxVOibFZO0o03l9wTW7YHQk0=;
 b=VIupfid/yX2m5/iJWLXTJOALP6P16gvl+IuvnGFdL+eVk6NvPVhfYqBh43ikImYUjcpTQF
 rSxU1sbnYmfxS67uMiyuCbiN3v3ZprkN4yl6XA43wdnqiCuqoK+k91CtRfCe1zihfC4rmq
 3E6E9GNboSmFX66aSCyOk0sgGuDY3vY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-QU6KhLcNMZOwtT6RypQqiA-1; Fri, 09 Sep 2022 07:56:57 -0400
X-MC-Unique: QU6KhLcNMZOwtT6RypQqiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A8F485A585;
 Fri,  9 Sep 2022 11:56:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 896AC1410F36;
 Fri,  9 Sep 2022 11:56:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 5/6] drm/gma500: Rewrite power management code
Date: Fri,  9 Sep 2022 13:56:45 +0200
Message-Id: <20220909115646.99920-6-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

Rewrite the power.c code. For some reason this was doing locking +
refcounting + state (suspended or not) bookkeeping all by itself.

But there is no reason for this, this is all taken care of by
the runtime-pm core, through pm_runtime_get()/_put().

Besides this not being necessary the DIY code is also quite weird/
buggy in some places. E.g. power_begin() would manually do a resume
when not resumed already and force_on=true, followed by a
pm_runtime_get(), which will cause a call to gma_power_resume() to
get scheduled which would redo the entire resume again. Which can
all be replaced by a single pm_runtime_get_sync() call.

Note that this is just a cleanup, this does not actually fix
the (disabled through #if 0) runtime-pm support. It does now call
pm_runtime_enable(), but only after doing a pm_runtime_get() at
probe-time, so the device is never runtime suspended.

Doing this permanent get() + enable() instead of not calling
enable() at all is necessary for the pm_runtime_get_if_in_use() call
in gma_power_begin() to work properly.

Note this also removes the gma_power_is_on() call a check like this
without actually holding a reference is always racy, so it is a bad
idea (and therefor has no pm_runtime_foo() equivalent).

The 2 code paths which were using gma_power_is_on() are actually both
guaranteed to only run when the device is powered-on so the 2 checks
can simply be dropped.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c |   1 -
 drivers/gpu/drm/gma500/power.c         | 131 ++++++-------------------
 drivers/gpu/drm/gma500/power.h         |   9 --
 drivers/gpu/drm/gma500/psb_drv.c       |   6 --
 drivers/gpu/drm/gma500/psb_drv.h       |   4 +-
 drivers/gpu/drm/gma500/psb_irq.c       |  15 ++-
 6 files changed, 37 insertions(+), 129 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 4d98df189e10..75b4eb1c8884 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -61,7 +61,6 @@ static void oaktrail_lvds_set_power(struct drm_device *dev,
 			pp_status = REG_READ(PP_STATUS);
 		} while (pp_status & PP_ON);
 		dev_priv->is_lvds_on = false;
-		pm_request_idle(dev->dev);
 	}
 	gma_power_end(dev);
 }
diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index 66873085d450..5dd291dad4a4 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -37,9 +37,6 @@
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 
-static struct mutex power_mutex;	/* Serialize power ops */
-static DEFINE_SPINLOCK(power_ctrl_lock);	/* Serialize power claim */
-
 /**
  *	gma_power_init		-	initialise power manager
  *	@dev: our device
@@ -54,13 +51,22 @@ void gma_power_init(struct drm_device *dev)
 	dev_priv->apm_base = dev_priv->apm_reg & 0xffff;
 	dev_priv->ospm_base &= 0xffff;
 
-	dev_priv->display_power = true;	/* We start active */
-	dev_priv->display_count = 0;	/* Currently no users */
-	dev_priv->suspended = false;	/* And not suspended */
-	mutex_init(&power_mutex);
-
 	if (dev_priv->ops->init_pm)
 		dev_priv->ops->init_pm(dev);
+
+	/*
+	 * Runtime pm support is broken atm. So for now unconditionally
+	 * call pm_runtime_get() here and put it again in psb_driver_unload()
+	 *
+	 * To fix this we need to call pm_runtime_get() once for each active
+	 * pipe at boot and then put() / get() for each pipe disable / enable
+	 * so that the device gets runtime suspended when no pipes are active.
+	 */
+	pm_runtime_get(dev->dev);
+	pm_runtime_set_active(dev->dev); /* Must be done before pm_runtime_enable()! */
+	pm_runtime_enable(dev->dev);
+
+	dev_priv->pm_initialized = true;
 }
 
 /**
@@ -71,8 +77,13 @@ void gma_power_init(struct drm_device *dev)
  */
 void gma_power_uninit(struct drm_device *dev)
 {
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
+	if (!dev_priv->pm_initialized)
+		return;
+
 	pm_runtime_disable(dev->dev);
-	pm_runtime_set_suspended(dev->dev);
+	pm_runtime_put_noidle(dev->dev);
 }
 
 /**
@@ -85,11 +96,8 @@ static void gma_suspend_display(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
-	if (dev_priv->suspended)
-		return;
 	dev_priv->ops->save_regs(dev);
 	dev_priv->ops->power_down(dev);
-	dev_priv->display_power = false;
 }
 
 /**
@@ -106,8 +114,6 @@ static void gma_resume_display(struct pci_dev *pdev)
 
 	/* turn on the display power island */
 	dev_priv->ops->power_up(dev);
-	dev_priv->suspended = false;
-	dev_priv->display_power = true;
 
 	PSB_WVDC32(dev_priv->pge_ctl | _PSB_PGETBL_ENABLED, PSB_PGETBL_CTL);
 	pci_write_config_word(pdev, PSB_GMCH_CTRL,
@@ -131,9 +137,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	int bsm, vbt;
 
-	if (dev_priv->suspended)
-		return;
-
 	pci_save_state(pdev);
 	pci_read_config_dword(pdev, 0x5C, &bsm);
 	dev_priv->regs.saveBSM = bsm;
@@ -142,8 +145,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
 
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, PCI_D3hot);
-
-	dev_priv->suspended = true;
 }
 
 /**
@@ -153,26 +154,17 @@ static void gma_suspend_pci(struct pci_dev *pdev)
  *	Perform the resume processing on our PCI device state - rewrite
  *	register state and re-enable the PCI device
  */
-static bool gma_resume_pci(struct pci_dev *pdev)
+static int gma_resume_pci(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	int ret;
-
-	if (!dev_priv->suspended)
-		return true;
 
 	pci_set_power_state(pdev, PCI_D0);
 	pci_restore_state(pdev);
 	pci_write_config_dword(pdev, 0x5c, dev_priv->regs.saveBSM);
 	pci_write_config_dword(pdev, 0xFC, dev_priv->regs.saveVBT);
-	ret = pci_enable_device(pdev);
 
-	if (ret != 0)
-		dev_err(&pdev->dev, "pci_enable failed: %d\n", ret);
-	else
-		dev_priv->suspended = false;
-	return !dev_priv->suspended;
+	return pci_enable_device(pdev);
 }
 
 /**
@@ -187,20 +179,10 @@ int gma_power_suspend(struct device *_dev)
 {
 	struct pci_dev *pdev = to_pci_dev(_dev);
 	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
-	mutex_lock(&power_mutex);
-	if (!dev_priv->suspended) {
-		if (dev_priv->display_count) {
-			mutex_unlock(&power_mutex);
-			dev_err(dev->dev, "GPU hardware busy, cannot suspend\n");
-			return -EBUSY;
-		}
-		gma_irq_uninstall(dev);
-		gma_suspend_display(dev);
-		gma_suspend_pci(pdev);
-	}
-	mutex_unlock(&power_mutex);
+	gma_irq_uninstall(dev);
+	gma_suspend_display(dev);
+	gma_suspend_pci(pdev);
 	return 0;
 }
 
@@ -215,26 +197,12 @@ int gma_power_resume(struct device *_dev)
 	struct pci_dev *pdev = to_pci_dev(_dev);
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	mutex_lock(&power_mutex);
 	gma_resume_pci(pdev);
 	gma_resume_display(pdev);
 	gma_irq_install(dev);
-	mutex_unlock(&power_mutex);
 	return 0;
 }
 
-/**
- *	gma_power_is_on		-	returne true if power is on
- *	@dev: our DRM device
- *
- *	Returns true if the display island power is on at this moment
- */
-bool gma_power_is_on(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	return dev_priv->display_power;
-}
-
 /**
  *	gma_power_begin		-	begin requiring power
  *	@dev: our DRM device
@@ -245,35 +213,10 @@ bool gma_power_is_on(struct drm_device *dev)
  */
 bool gma_power_begin(struct drm_device *dev, bool force_on)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	int ret;
-	unsigned long flags;
-
-	spin_lock_irqsave(&power_ctrl_lock, flags);
-	/* Power already on ? */
-	if (dev_priv->display_power) {
-		dev_priv->display_count++;
-		pm_runtime_get(dev->dev);
-		spin_unlock_irqrestore(&power_ctrl_lock, flags);
-		return true;
-	}
-	if (force_on == false)
-		goto out_false;
-
-	/* Ok power up needed */
-	ret = gma_resume_pci(pdev);
-	if (ret == 0) {
-		gma_irq_preinstall(dev);
-		gma_irq_postinstall(dev);
-		pm_runtime_get(dev->dev);
-		dev_priv->display_count++;
-		spin_unlock_irqrestore(&power_ctrl_lock, flags);
-		return true;
-	}
-out_false:
-	spin_unlock_irqrestore(&power_ctrl_lock, flags);
-	return false;
+	if (force_on)
+		return pm_runtime_resume_and_get(dev->dev) == 0;
+	else
+		return pm_runtime_get_if_in_use(dev->dev) == 1;
 }
 
 /**
@@ -285,12 +228,6 @@ bool gma_power_begin(struct drm_device *dev, bool force_on)
  */
 void gma_power_end(struct drm_device *dev)
 {
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	unsigned long flags;
-	spin_lock_irqsave(&power_ctrl_lock, flags);
-	dev_priv->display_count--;
-	WARN_ON(dev_priv->display_count < 0);
-	spin_unlock_irqrestore(&power_ctrl_lock, flags);
 	pm_runtime_put(dev->dev);
 }
 
@@ -304,16 +241,6 @@ int psb_runtime_resume(struct device *dev)
 	return gma_power_resume(dev);
 }
 
-int psb_runtime_idle(struct device *dev)
-{
-	struct drm_device *drmdev = pci_get_drvdata(to_pci_dev(dev));
-	struct drm_psb_private *dev_priv = to_drm_psb_private(drmdev);
-	if (dev_priv->display_count)
-		return 0;
-	else
-		return 1;
-}
-
 int gma_power_thaw(struct device *_dev)
 {
 	return gma_power_resume(_dev);
diff --git a/drivers/gpu/drm/gma500/power.h b/drivers/gpu/drm/gma500/power.h
index 0c89c4d6ec20..243b9dd00910 100644
--- a/drivers/gpu/drm/gma500/power.h
+++ b/drivers/gpu/drm/gma500/power.h
@@ -54,19 +54,10 @@ int gma_power_restore(struct device *_dev);
 bool gma_power_begin(struct drm_device *dev, bool force);
 void gma_power_end(struct drm_device *dev);
 
-/*
- * Use this function to do an instantaneous check for if the hw is on.
- * Only use this in cases where you know the mutex is already held such
- * as in irq install/uninstall and you need to
- * prevent a deadlock situation.  Otherwise use gma_power_begin().
- */
-bool gma_power_is_on(struct drm_device *dev);
-
 /*
  * GFX-Runtime PM callbacks
  */
 int psb_runtime_suspend(struct device *dev);
 int psb_runtime_resume(struct device *dev);
-int psb_runtime_idle(struct device *dev);
 
 #endif /*_PSB_POWERMGMT_H_*/
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8266371aeac1..aea8876059d8 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -407,11 +407,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		return ret;
 	psb_intel_opregion_enable_asle(dev);
-#if 0
-	/* Enable runtime pm at last */
-	pm_runtime_enable(dev->dev);
-	pm_runtime_set_active(dev->dev);
-#endif
 
 	return devm_add_action_or_reset(dev->dev, psb_device_release, dev);
 
@@ -484,7 +479,6 @@ static const struct dev_pm_ops psb_pm_ops = {
 	.restore = gma_power_restore,
 	.runtime_suspend = psb_runtime_suspend,
 	.runtime_resume = psb_runtime_resume,
-	.runtime_idle = psb_runtime_idle,
 };
 
 static const struct file_operations psb_gem_fops = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index dd6fd49d85f3..049701ce8a5f 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -426,9 +426,7 @@ struct drm_psb_private {
 	spinlock_t irqmask_lock;
 
 	/* Power */
-	bool suspended;
-	bool display_power;
-	int display_count;
+	bool pm_initialized;
 
 	/* Modesetting */
 	struct psb_intel_mode_device mode_dev;
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 038f18ed0a95..d421031462df 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -228,7 +228,7 @@ static irqreturn_t gma_irq_handler(int irq, void *arg)
 	vdc_stat &= dev_priv->vdc_irq_mask;
 	spin_unlock(&dev_priv->irqmask_lock);
 
-	if (dsp_int && gma_power_is_on(dev)) {
+	if (dsp_int) {
 		gma_vdc_interrupt(dev, vdc_stat);
 		handled = 1;
 	}
@@ -264,13 +264,12 @@ void gma_irq_preinstall(struct drm_device *dev)
 
 	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
 
-	if (gma_power_is_on(dev)) {
-		PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
-		PSB_WVDC32(0x00000000, PSB_INT_MASK_R);
-		PSB_WVDC32(0x00000000, PSB_INT_ENABLE_R);
-		PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
-		PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
-	}
+	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
+	PSB_WVDC32(0x00000000, PSB_INT_MASK_R);
+	PSB_WVDC32(0x00000000, PSB_INT_ENABLE_R);
+	PSB_WSGX32(0x00000000, PSB_CR_EVENT_HOST_ENABLE);
+	PSB_RSGX32(PSB_CR_EVENT_HOST_ENABLE);
+
 	if (dev->vblank[0].enabled)
 		dev_priv->vdc_irq_mask |= _PSB_VSYNC_PIPEA_FLAG;
 	if (dev->vblank[1].enabled)
-- 
2.37.2

