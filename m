Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953645B3033
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B902610EC1E;
	Fri,  9 Sep 2022 07:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513F410EBFF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 07:34:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d12so1013668plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 00:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=F8heGgiX2zw+gUOsFvHDUXB/UIkouvU71qsS0n5i0Pc=;
 b=iI85s80/dPQ8Df+s4L1AsOz2KtLDjSBRJjt2iwUkd73KubU95F38aa8cmUYCwPZuWN
 JGlHI2zI20QadGQBl7MZfgkUBQ0FelJ3u/VzjVao/92ro0vH7FhHM7FSz0rXlDnVC/Gd
 nf48+iI4B4+HP2E7JEXzS5KJ3xw6yvWMo6qLeoPKt6BbMa1gsJHfxKBcbpWfrgv8Etbs
 jw4QEFPI6vFYQwEsr5t9A3+LhvZs10UHXige0CjZplPruKYQLp6CAF8uZmxh2qxMC8e6
 7A3HYj8ff1vtIyGNYitMWfWIvz8VLIxSehXy2rUP+8iZ81XeJRldJJqbsmlS8+f2LnlO
 SpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=F8heGgiX2zw+gUOsFvHDUXB/UIkouvU71qsS0n5i0Pc=;
 b=0pzPNeb39e1cv5vrqvsSEOVPiFC3krQa0VHO8URwR6JHm7cd744NkYPL5r7WMStrvU
 xnhAyM8st2XaoCUaVtoSEHYIh1HZSiJN0MPEFGrm3Rv4dHtX5DAih7bO1PkcHzn1uIaR
 yaSpsoOAL/SjvGWg9hNH27exsLCzWRbLKfd7/D9A0slYRdFaDSTtWnnH4ndteBz2+C+L
 ZUKECb/31lAOsfx6aempTmUAucTCdrp19Qo0YNH2UhRUPhLu6jkr5uDcUctNVIpz0lgf
 NdH/aMrOX0683IDMtd4SBVUi10eL90OKSHapmya4yt44nJZhy1Z7JBNUZNzFiRRBtgeh
 Lxbw==
X-Gm-Message-State: ACgBeo14pDFM0aIXcnSXxGvoOz5qZ0QqCFaWe4ShE5kPrRcZoJQyMxYe
 wl44gTMKT5E/8TkymwhxRdd5aXx7GUwB+x5Ze65vBgKZrHg=
X-Google-Smtp-Source: AA6agR6nWTt41yPkZk8qPY6PwN1PCncI0K+TIQmdbqS2qVU+d+6pVuxL0aollaKpt7jdCR+Y1jYwApiM/323IKoMDG8=
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr8464382pjb.197.1662708897458; Fri, 09
 Sep 2022 00:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220906203852.527663-1-hdegoede@redhat.com>
 <20220906203852.527663-4-hdegoede@redhat.com>
 <CAMeQTsYwrtAwb2_Lj2RyrWCov88Nq=-_tScD5dXC548Fog3X0w@mail.gmail.com>
 <69fc33c6-b6b0-ba98-d2c6-0fb35df63933@redhat.com>
In-Reply-To: <69fc33c6-b6b0-ba98-d2c6-0fb35df63933@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 9 Sep 2022 09:34:46 +0200
Message-ID: <CAMeQTsae12K7WzCBQSVoMk5+CO1H6tO=r0iAfsqNo96ekp4SmA@mail.gmail.com>
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

pci_restore_msi_stateOn Thu, Sep 8, 2022 at 3:39 PM Hans de Goede
<hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 9/8/22 15:26, Patrik Jakobsson wrote:
> > On Tue, Sep 6, 2022 at 10:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Fix gnome-shell (and other page-flip users) hanging after suspend/resume
> >> because of the gma500's IRQs not working.
> >>
> >> This fixes 2 problems with the IRQ handling:
> >>
> >> 1. gma_power_off() calls gma_irq_uninstall() which does a free_irq(), but
> >>    gma_power_on() called gma_irq_preinstall() + gma_irq_postinstall() which
> >>    do not call request_irq. Replace the pre- + post-install calls with
> >>    gma_irq_install() which does prep + request + post.
> >
> > Hmm, I don't think we're supposed to do free_irq() during suspend in
> > the first place. request_irq() and free_irq() are normally only called
> > in the pci device probe/remove hooks. Same is true for msi
> > enable/disable.
>
> Right. I first tried to switch to disable_irq() / enable_irq() which are
> expected to be used during suspend/resume. That did resolve the issue
> of there no longer being an IRQ handler registered after suspend/resume,
> but the IRQ still would no longer fire after a suspend/resume.

The irq enable/disable is handled by writing PSB_INT_ENABLE_R in
gma_irq_install/uninstall(). Also using disable_irq() and enable_irq()
shouldn't be required. But the docs could be wrong and this might fix
the interrupts I'm seeing on PSB after resume.

>
> So then I tried the pci_disable_msi() + pci_enable_msi() and that
> did the trick. And since we should not call pci_disable_msi() with an
> IRQ handler registered I decided to keep the free_irq + request_irq
> over suspend/resume.

Ok, then I understand your motivation for the free/request dance.
However, I would argue that if this problem is specific to your
Packard Bell Dot SC it is better handled with a quirk.

>
> Another option is to never call pci_enable_msi() and use APIC style
> IRQs instead. At least on the Packard Bell Dot SC (cedarview) that
> works.

Yes, the quirk could be to not use MSI on the Packard Bell Dot SC. But
let me check this on other Cedarview systems first.

>
> > I can take this patch as is since it improves on the current situation
> > but feel free to dig deeper if you like.
>
> I'm not sure what else I can do to dig deeper though. TBH I'm happy
> I managed to come up with something which works at all.

Digging deeper would be to figure out why pci_restore_msi_state() is
not doing its job. The fact that gma500 is touching those MSI
registers in PCI config space manually is worrying. Did you test if
MSI works after resume if you remove the save/restore of
PSB_PCIx_MSI_ADDR_LOC and PSB_PCIx_MSI_DATA_LOC?

>
> > On Poulsbo I can see
> > interrupts not getting handled during suspend/resume even with this
> > patch applied.
>
> "during" ?  I guess you mean _after_ a suspend/resume ?

Yes. I get: irq 16: nobody cared (try booting with the "irqpoll" option).
But perhaps the system is just too slow to respond.

>
> I have been refactoring the backlight (detection) code on
> x86/acpi devices. See:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
>
> As you can see there are also some drm driver changes involved for
> all the (non virtual) drm/kms drivers used on x86/acpi laptops.
>
> I am working on also making matching changes (*) to the gma500 code,
> which is why I scrounged up the Packard Bell Dot SC I'm testing this on.

I'll have a look.

>
> So all the fixes in this series are somewhat of a distraction of what
> I'm actually trying to acomplish.

Fair enough, let's not focus too much on the details here. I can take
this patch as is so you can continue work on the backlight code.
Sounds good?

>
> I have also scrounged up a Sony Vaio VPCX11S1E which has an Atom
> Z540 with PSB graphics. I have yet to test on that one though...

If you do, bring lots of patience. Those systems are very slow. You
can literally sip on coffee while waiting for the cursor to move :)

>
> Regards,
>
> Hans
>
>
> *) For wip code see:
>
> https://github.com/jwrdegoede/linux-sunxi/commits/main
>
> and specifically:
>
> https://github.com/jwrdegoede/linux-sunxi/commit/97a1dbbd320b0bdbacf935e52f786e8185005298
>
> which unifies the backlight handling between all 3 different
> SoC types supported by the gma500 code resulting in a nice cleanup.
>
>
>
>
>
> >> 2. After fixing 1. IRQs still do not work on a Packard Bell Dot SC (Intel
> >>    Atom N2600, cedarview) netbook.
> >>
> >>    Cederview uses MSI interrupts and it seems that the BIOS re-configures
> >>    things back to normal APIC based interrupts during S3 suspend. There is
> >>    some MSI PCI-config registers save/restore code which tries to deal with
> >>    this, but on the Packard Bell Dot SC this is not sufficient to restore
> >>    MSI IRQ functionality after a suspend/resume.
> >>
> >>    Replace the PCI-config registers save/restore with pci_disable_msi() on
> >>    suspend + pci_enable_msi() on resume. Fixing e.g. gnome-shell hanging.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/gpu/drm/gma500/cdv_device.c      |  4 +---
> >>  drivers/gpu/drm/gma500/oaktrail_device.c |  5 +----
> >>  drivers/gpu/drm/gma500/power.c           |  8 +-------
> >>  drivers/gpu/drm/gma500/psb_drv.c         |  2 +-
> >>  drivers/gpu/drm/gma500/psb_drv.h         |  5 +----
> >>  drivers/gpu/drm/gma500/psb_irq.c         | 15 ++++++++++++---
> >>  drivers/gpu/drm/gma500/psb_irq.h         |  2 +-
> >>  7 files changed, 18 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
> >> index dd32b484dd82..ce96234f3df2 100644
> >> --- a/drivers/gpu/drm/gma500/cdv_device.c
> >> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> >> @@ -581,11 +581,9 @@ static const struct psb_offset cdv_regmap[2] = {
> >>  static int cdv_chip_setup(struct drm_device *dev)
> >>  {
> >>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
> >>         INIT_WORK(&dev_priv->hotplug_work, cdv_hotplug_work_func);
> >>
> >> -       if (pci_enable_msi(pdev))
> >> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
> >> +       dev_priv->use_msi = true;
> >>         dev_priv->regmap = cdv_regmap;
> >>         gma_get_core_freq(dev);
> >>         psb_intel_opregion_init(dev);
> >> diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
> >> index 5923a9c89312..f90e628cb482 100644
> >> --- a/drivers/gpu/drm/gma500/oaktrail_device.c
> >> +++ b/drivers/gpu/drm/gma500/oaktrail_device.c
> >> @@ -501,12 +501,9 @@ static const struct psb_offset oaktrail_regmap[2] = {
> >>  static int oaktrail_chip_setup(struct drm_device *dev)
> >>  {
> >>         struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
> >>         int ret;
> >>
> >> -       if (pci_enable_msi(pdev))
> >> -               dev_warn(dev->dev, "Enabling MSI failed!\n");
> >> -
> >> +       dev_priv->use_msi = true;
> >>         dev_priv->regmap = oaktrail_regmap;
> >>
> >>         ret = mid_chip_setup(dev);
> >> diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
> >> index b91de6d36e41..66873085d450 100644
> >> --- a/drivers/gpu/drm/gma500/power.c
> >> +++ b/drivers/gpu/drm/gma500/power.c
> >> @@ -139,8 +139,6 @@ static void gma_suspend_pci(struct pci_dev *pdev)
> >>         dev_priv->regs.saveBSM = bsm;
> >>         pci_read_config_dword(pdev, 0xFC, &vbt);
> >>         dev_priv->regs.saveVBT = vbt;
> >> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, &dev_priv->msi_addr);
> >> -       pci_read_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, &dev_priv->msi_data);
> >>
> >>         pci_disable_device(pdev);
> >>         pci_set_power_state(pdev, PCI_D3hot);
> >> @@ -168,9 +166,6 @@ static bool gma_resume_pci(struct pci_dev *pdev)
> >>         pci_restore_state(pdev);
> >>         pci_write_config_dword(pdev, 0x5c, dev_priv->regs.saveBSM);
> >>         pci_write_config_dword(pdev, 0xFC, dev_priv->regs.saveVBT);
> >> -       /* restoring MSI address and data in PCIx space */
> >> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_ADDR_LOC, dev_priv->msi_addr);
> >> -       pci_write_config_dword(pdev, PSB_PCIx_MSI_DATA_LOC, dev_priv->msi_data);
> >>         ret = pci_enable_device(pdev);
> >>
> >>         if (ret != 0)
> >> @@ -223,8 +218,7 @@ int gma_power_resume(struct device *_dev)
> >>         mutex_lock(&power_mutex);
> >>         gma_resume_pci(pdev);
> >>         gma_resume_display(pdev);
> >> -       gma_irq_preinstall(dev);
> >> -       gma_irq_postinstall(dev);
> >> +       gma_irq_install(dev);
> >>         mutex_unlock(&power_mutex);
> >>         return 0;
> >>  }
> >> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> >> index 1d8744f3e702..54e756b48606 100644
> >> --- a/drivers/gpu/drm/gma500/psb_drv.c
> >> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> >> @@ -383,7 +383,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >>         PSB_WVDC32(0xFFFFFFFF, PSB_INT_MASK_R);
> >>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >>
> >> -       gma_irq_install(dev, pdev->irq);
> >> +       gma_irq_install(dev);
> >>
> >>         dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
> >>
> >> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> >> index 0ea3d23575f3..731cc356c07a 100644
> >> --- a/drivers/gpu/drm/gma500/psb_drv.h
> >> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> >> @@ -490,6 +490,7 @@ struct drm_psb_private {
> >>         int rpm_enabled;
> >>
> >>         /* MID specific */
> >> +       bool use_msi;
> >>         bool has_gct;
> >>         struct oaktrail_gct_data gct_data;
> >>
> >> @@ -499,10 +500,6 @@ struct drm_psb_private {
> >>         /* Register state */
> >>         struct psb_save_area regs;
> >>
> >> -       /* MSI reg save */
> >> -       uint32_t msi_addr;
> >> -       uint32_t msi_data;
> >> -
> >>         /* Hotplug handling */
> >>         struct work_struct hotplug_work;
> >>
> >> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> >> index e6e6d61bbeab..038f18ed0a95 100644
> >> --- a/drivers/gpu/drm/gma500/psb_irq.c
> >> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> >> @@ -316,17 +316,24 @@ void gma_irq_postinstall(struct drm_device *dev)
> >>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >>  }
> >>
> >> -int gma_irq_install(struct drm_device *dev, unsigned int irq)
> >> +int gma_irq_install(struct drm_device *dev)
> >>  {
> >> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> >> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
> >>         int ret;
> >>
> >> -       if (irq == IRQ_NOTCONNECTED)
> >> +       if (dev_priv->use_msi && pci_enable_msi(pdev)) {
> >> +               dev_warn(dev->dev, "Enabling MSI failed!\n");
> >> +               dev_priv->use_msi = false;
> >> +       }
> >> +
> >> +       if (pdev->irq == IRQ_NOTCONNECTED)
> >>                 return -ENOTCONN;
> >>
> >>         gma_irq_preinstall(dev);
> >>
> >>         /* PCI devices require shared interrupts. */
> >> -       ret = request_irq(irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
> >> +       ret = request_irq(pdev->irq, gma_irq_handler, IRQF_SHARED, dev->driver->name, dev);
> >>         if (ret)
> >>                 return ret;
> >>
> >> @@ -369,6 +376,8 @@ void gma_irq_uninstall(struct drm_device *dev)
> >>         spin_unlock_irqrestore(&dev_priv->irqmask_lock, irqflags);
> >>
> >>         free_irq(pdev->irq, dev);
> >> +       if (dev_priv->use_msi)
> >> +               pci_disable_msi(pdev);
> >>  }
> >>
> >>  int gma_crtc_enable_vblank(struct drm_crtc *crtc)
> >> diff --git a/drivers/gpu/drm/gma500/psb_irq.h b/drivers/gpu/drm/gma500/psb_irq.h
> >> index b51e395194ff..7648f69824a5 100644
> >> --- a/drivers/gpu/drm/gma500/psb_irq.h
> >> +++ b/drivers/gpu/drm/gma500/psb_irq.h
> >> @@ -17,7 +17,7 @@ struct drm_device;
> >>
> >>  void gma_irq_preinstall(struct drm_device *dev);
> >>  void gma_irq_postinstall(struct drm_device *dev);
> >> -int  gma_irq_install(struct drm_device *dev, unsigned int irq);
> >> +int  gma_irq_install(struct drm_device *dev);
> >>  void gma_irq_uninstall(struct drm_device *dev);
> >>
> >>  int  gma_crtc_enable_vblank(struct drm_crtc *crtc);
> >> --
> >> 2.37.2
> >>
> >
>
