Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CD5B1EDC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C25010E5C0;
	Thu,  8 Sep 2022 13:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C772010E5C0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 13:26:40 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id l65so17914664pfl.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZLPf+1k6x08TqTxwKItwOZ2N4DIt82ytxggkEqqSg6o=;
 b=EPJTfLmw2AwBIAAzuVugXup87vo881JSGO20TSHdZsiagxMnI6XEq80pPyPDXSQG2E
 911CaiivVqNp9il6o3Z1bqj0TTFRY32tYWQM9hFCGlzITIsav1xvB5VT9fl2DLgaBmnR
 HUq6jNE9Wm39lMKomLeIw/huM28Zsu2SF4bWcM/VcbrHjHYZPzNycfGQl5OE97odI16A
 ZUfiXhuA+jM+BJkvwleDtPj1fvAjc28b5IIhkUw4TznQwHsoQ+sDzIg1zPNpxuGYMOiN
 hTgWiCbhWiVNN4QrGWhQq4GFpBoP5S80rGVDsKnaTbpEVZGz1PPriG+aw7zc6j3qyIba
 lJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZLPf+1k6x08TqTxwKItwOZ2N4DIt82ytxggkEqqSg6o=;
 b=UZ5KLvJb3RMrmAzoyEYKXteL0EUnjnNGQ69H9590f8zdYvRtoMMPJtDivtQRXBNU+i
 2FpP6SHxmFNBtZVHI1ipZsjjh7E1FDm448hS4txPzMRKglb1wHl/mBOWCxt1o4vUM33k
 AByTlFZVHeVZgFbsKIltXIcEXDg0lPDNC3ZLaH501IQglmVDRFiAI6lM4o7FoTIZxIlN
 jLFz/X7tpjqqTA1qMBpWNnnHbkwUh51TOMY+8AocZExRlc/QCz2GQr5tWZACUYZHrOUi
 fTwglO1x8LGFreKbHjtFbRru0sbD4B/99F1tdMM8uxzVHIXuWzhIZqAoQMhkGZLmHfOW
 PTaQ==
X-Gm-Message-State: ACgBeo2yzWOw1Bv/3Wh0wDg+mLzRIggATxSu2nY1LwN3nCipV3C6q/JN
 uxyfZLhXuSyWERjK+THxx7t6ZnaHh5yo/aWqjR+wHCMy
X-Google-Smtp-Source: AA6agR5/vVkSwSSq1INR2uvDKG91OoHQNBK9w0oIPOiX6hrsBT1hO8//LMBz/+iApDbVrlY5fLgtGkJJ50PCaBUyCig=
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d52 with SMTP id
 l4-20020a056a0016c400b0053508900d52mr9139243pfc.9.1662643600177; Thu, 08 Sep
 2022 06:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-4-hdegoede@redhat.com>
In-Reply-To: <20220906203852.527663-4-hdegoede@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 8 Sep 2022 15:26:28 +0200
Message-ID: <CAMeQTsYwrtAwb2_Lj2RyrWCov88Nq=-_tScD5dXC548Fog3X0w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/gma500: Fix (vblank) IRQs not working after
 suspend/resume
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 10:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Fix gnome-shell (and other page-flip users) hanging after suspend/resume
> because of the gma500's IRQs not working.
>
> This fixes 2 problems with the IRQ handling:
>
> 1. gma_power_off() calls gma_irq_uninstall() which does a free_irq(), but
>    gma_power_on() called gma_irq_preinstall() + gma_irq_postinstall() which
>    do not call request_irq. Replace the pre- + post-install calls with
>    gma_irq_install() which does prep + request + post.

Hmm, I don't think we're supposed to do free_irq() during suspend in
the first place. request_irq() and free_irq() are normally only called
in the pci device probe/remove hooks. Same is true for msi
enable/disable.

I can take this patch as is since it improves on the current situation
but feel free to dig deeper if you like. On Poulsbo I can see
interrupts not getting handled during suspend/resume even with this
patch applied.

-Patrik

>
> 2. After fixing 1. IRQs still do not work on a Packard Bell Dot SC (Intel
>    Atom N2600, cedarview) netbook.
>
>    Cederview uses MSI interrupts and it seems that the BIOS re-configures
>    things back to normal APIC based interrupts during S3 suspend. There is
>    some MSI PCI-config registers save/restore code which tries to deal with
>    this, but on the Packard Bell Dot SC this is not sufficient to restore
>    MSI IRQ functionality after a suspend/resume.
>
>    Replace the PCI-config registers save/restore with pci_disable_msi() on
>    suspend + pci_enable_msi() on resume. Fixing e.g. gnome-shell hanging.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/gma500/cdv_device.c      |  4 +---
>  drivers/gpu/drm/gma500/oaktrail_device.c |  5 +----
>  drivers/gpu/drm/gma500/power.c           |  8 +-------
>  drivers/gpu/drm/gma500/psb_drv.c         |  2 +-
>  drivers/gpu/drm/gma500/psb_drv.h         |  5 +----
>  drivers/gpu/drm/gma500/psb_irq.c         | 15 ++++++++++++---
>  drivers/gpu/drm/gma500/psb_irq.h         |  2 +-
>  7 files changed, 18 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
> index dd32b484dd82..ce96234f3df2 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.c
> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> @@ -581,11 +581,9 @@ static const struct psb_offset cdv_regmap[2] = {
>  static int cdv_chip_setup(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
>         INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
>
> -       if (pci_enable_msi(pdev))
> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
> +       dev_priv->use_msi = true;
>         dev_priv->regmap = cdv_regmap;
>         gma_get_core_freq(dev);
>         psb_intel_opregion_init(dev);
> diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
> index 5923a9c89312..f90e628cb482 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_device.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_device.c
> @@ -501,12 +501,9 @@ static const struct psb_offset oaktrail_regmap[2] = {
>  static int oaktrail_chip_setup(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
>         int ret;
>
> -       if (pci_enable_msi(pdev))
> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
> -
> +       dev_priv->use_msi = true;
>         dev_priv->regmap = oaktrail_regmap;
>
>         ret = mid_chip_setup(dev);
> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> index b91de6d36e41..66873085d450 100644
> --- a/drivers/gpu/drm/gma500/power.c
> +++ b/drivers/gpu/drm/gma500/power.c
> @@ -139,8 +139,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
>         dev_priv->regs.saveBSM = bsm;
>         pci_read_config_dword(pdev, 0xFC, &vbt);
>         dev_priv->regs.saveVBT = vbt;
> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, &dev_priv->msi_addr);
> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, &dev_priv->msi_data);
>
>         pci_disable_device(pdev);
>         pci_set_power_state(pdev, PCI_D3hot);
> @@ -168,9 +166,6 @@ static bool gma_resume_pci(struct pci_dev *pdev)
>         pci_restore_state(pdev);
>         pci_write_config_dword(pdev, 0x5c, dev_priv->regs.saveBSM);
>         pci_write_config_dword(pdev, 0xFC, dev_priv->regs.saveVBT);
> -       /* restoring MSI address and data in PCIx space */
> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, dev_priv->msi_addr);
> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, dev_priv->msi_data);
>         ret = pci_enable_device(pdev);
>
>         if (ret != 0)
> @@ -223,8 +218,7 @@ int gma_power_resume(struct device *_dev)
>         mutex_lock(&power_mutex);
>         gma_resume_pci(pdev);
>         gma_resume_display(pdev);
> -       gma_irq_preinstall(dev);
> -       gma_irq_postinstall(dev);
> +       gma_irq_install(dev);
>         mutex_unlock(&power_mutex);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 1d8744f3e702..54e756b48606 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -383,7 +383,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>         PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>
> -       gma_irq_install(dev, pdev->irq);
> +       gma_irq_install(dev);
>
>         dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index 0ea3d23575f3..731cc356c07a 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -490,6 +490,7 @@ struct drm_psb_private {
>         int rpm_enabled;
>
>         /* MID specific */
> +       bool use_msi;
>         bool has_gct;
>         struct oaktrail_gct_data gct_data;
>
> @@ -499,10 +500,6 @@ struct drm_psb_private {
>         /* Register state */
>         struct psb_save_area regs;
>
> -       /* MSI reg save */
> -       uint32_t msi_addr;
> -       uint32_t msi_data;
> -
>         /* Hotplug handling */
>         struct work_struct hotplug_work;
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index e6e6d61bbeab..038f18ed0a95 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -316,17 +316,24 @@ void gma_irq_postinstall(struct drm_device *dev)
>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>  }
>
> -int gma_irq_install(struct drm_device *dev, unsigned int irq)
> +int gma_irq_install(struct drm_device *dev)
>  {
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
>         int ret;
>
> -       if (irq == IRQ_NOTCONNECTED)
> +       if (dev_priv->use_msi && pci_enable_msi(pdev)) {
> +               dev_warn(dev->dev, "Enabling MSI failed!\n");
> +               dev_priv->use_msi = false;
> +       }
> +
> +       if (pdev->irq == IRQ_NOTCONNECTED)
>                 return -ENOTCONN;
>
>         gma_irq_preinstall(dev);
>
>         /* PCI devices require shared interrupts. */
> -       ret = request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
> +       ret = request_irq(pdev->irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
>         if (ret)
>                 return ret;
>
> @@ -369,6 +376,8 @@ void gma_irq_uninstall(struct drm_device *dev)
>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
>
>         free_irq(pdev->irq, dev);
> +       if (dev_priv->use_msi)
> +               pci_disable_msi(pdev);
>  }
>
>  int gma_crtc_enable_vblank(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
> index b51e395194ff..7648f69824a5 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.h
> +++ b/drivers/gpu/drm/gma500/psb_irq.h
> @@ -17,7 +17,7 @@ struct drm_device;
>
>  void gma_irq_preinstall(struct drm_device *dev);
>  void gma_irq_postinstall(struct drm_device *dev);
> -int  gma_irq_install(struct drm_device *dev, unsigned int irq);
> +int  gma_irq_install(struct drm_device *dev);
>  void gma_irq_uninstall(struct drm_device *dev);
>
>  int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
> --
> 2.37.2
>
