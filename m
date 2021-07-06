Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962133BC871
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D99389B27;
	Tue,  6 Jul 2021 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C36789B27
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:22:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BF8A61997
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625563337;
 bh=3s5ugsEzs+cniHj/MyiyLTHGSbA6Q7UbOM1poGD90Xc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rMGSDqNbyL3XxOalqL0aOTQmAZROhFTZvJ2lnORyWLLoUqM9hbnrH4v4VCIUzjrVt
 Bt7dKA/pMo5UABJM11nV9WbkClfcd8xzkNICh815T18E2IVLHxu2TlnZ9QAfjalst8
 BI6p0jNyaT4/wF/3YpA6pgou0BJu9qAYqjCBB5K7tNZe/3ZT7xRZOY3kS60QRTTAI1
 eej1Wx29890Ul7jfz0O/t8nxbeTcW1W8iY1/8fQSS1MbrMnb/epSrI12gn2QviA893
 7Dgaftg3X4YZ9RzPmpecccDXEu3jKTzkGz2wH/901mqpOnaD8j7EHt15OXKm8eBERs
 K46N4nhNw9tdA==
Received: by mail-io1-f50.google.com with SMTP id d9so24010260ioo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 02:22:17 -0700 (PDT)
X-Gm-Message-State: AOAM5336rkVJBFk3UWrohudWvRUd+WghW3oKRpbMROV/S6Z3ik0WwpV2
 ZMYoWl4fDTWQhuvfJsBwZdB35yJPpF1if5HU2sg=
X-Google-Smtp-Source: ABdhPJzUu3UiulIBr8OyVDmnnrkBv7411/bdSwA5KaYRS4jbyqfnMHNdFS62oPaKk4Jmu4zsrTn+6J4ArbHiwVZdpAM=
X-Received: by 2002:a05:6638:1204:: with SMTP id
 n4mr357413jas.135.1625563336641; 
 Tue, 06 Jul 2021 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210705100503.1120643-1-chenhuacai@loongson.cn>
 <YOQSoQgFn/t4TzX5@phenom.ffwll.local>
In-Reply-To: <YOQSoQgFn/t4TzX5@phenom.ffwll.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Jul 2021 17:21:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H40ix+91f0BCt5JaXZ9SpgYKHmzaYXrP97EZaBt4VZ40g@mail.gmail.com>
Message-ID: <CAAhV-H40ix+91f0BCt5JaXZ9SpgYKHmzaYXrP97EZaBt4VZ40g@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Rework default VGA device selection
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel,

On Tue, Jul 6, 2021 at 4:21 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jul 05, 2021 at 06:05:03PM +0800, Huacai Chen wrote:
> > Currently, vga_arb_device_init() selects the first probed VGA device
> > with VGA legacy resources enabled as the default device. However, some
> > BMC-based VGA cards (e.g., AST2500 and HiSilicon D05) don't enable VGA
> > legacy resources because their built-in upstream bridges don't support
> > PCI_BRIDGE_CTL_VGA. This makes "no default VGA card" and breaks X.org
> > auto-detection.
> >
> > Commit a37c0f48950b56f6ef2e ("vgaarb: Select a default VGA device even
> > if there's no legacy VGA") try to solve this problem but fails on some
> > platforms, because it relies on the initcall order:
> >
> > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > may fail to select the default VGA device. Since vga_arb_device_init()
> > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > both wrapped by subsys_initcall(), their sequence is not assured. So, it
> > is possible to use subsys_initcall_sync() instead of subsys_initcall()
> > to wrap vga_arb_device_init().
> >
> > However, the above approach still has drawbacks, it cannot handle the
> > cases that a VGA card is hot-plugged, or the gpu driver is compiled as a
> > module.
> >
> > So, as suggested by Bjorn Helgaas, this patch rework the selection:
> > 1, Remove direct vga_arb_select_default_device() calls in vga_arb_
> >    device_init().
> > 2, Rename vga_arb_select_default_device() to vga_arb_update_default_
> >    device(), which selects the first probed VGA device as the default
> >    (whether legacy resources enabled or not), and update the default
> >    device if a better one is found (device with legacy resources enabled
> >    is better, device owns the firmware framebuffer is even better).
> > 3, Every time a new VGA device is probed, vga_arbiter_add_pci_device()
> >    is called, and vga_arb_update_default_device() is also called. So the
> >    hotplug case and the module case can also be handled.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> Sounds reasonable, but because this is defacto pci stuff that just isn't
> in drivers/pci (maybe we should move it) I'll defer to Bjorn's review
> before I apply this patch.
> -Daniel
This (move to drivers/pci) has been disscussed before, I think that
can be another patch.

Huacai
>
> > ---
> >  drivers/gpu/vga/vgaarb.c | 219 +++++++++++++++++----------------------
> >  1 file changed, 97 insertions(+), 122 deletions(-)
> >
> > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > index 949fde433ea2..07770aae3aaf 100644
> > --- a/drivers/gpu/vga/vgaarb.c
> > +++ b/drivers/gpu/vga/vgaarb.c
> > @@ -586,6 +586,97 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
> >  }
> >  EXPORT_SYMBOL(vga_put);
> >
> > +#if defined(CONFIG_ACPI)
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +     struct acpi_device *adev = ACPI_COMPANION(dev);
> > +
> > +     return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > +}
> > +#else
> > +static bool vga_arb_integrated_gpu(struct device *dev)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> > +static void vga_arb_update_default_device(struct vga_device *vgadev)
> > +{
> > +     struct pci_dev *pdev = vgadev->pdev;
> > +     struct device *dev = &pdev->dev;
> > +     struct vga_device *vgadev_default;
> > +#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > +     int i;
> > +     unsigned long flags;
> > +     u64 base = screen_info.lfb_base;
> > +     u64 size = screen_info.lfb_size;
> > +     u64 limit;
> > +     resource_size_t start, end;
> > +#endif
> > +
> > +     /* Deal with VGA default device. Use first enabled one
> > +      * by default if arch doesn't have it's own hook
> > +      */
> > +     if (!vga_default_device()) {
> > +             if ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)
> > +                     vgaarb_info(dev, "setting as boot VGA device\n");
> > +             else
> > +                     vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> > +             vga_set_default_device(pdev);
> > +     }
> > +
> > +     vgadev_default = vgadev_find(vga_default);
> > +
> > +     /* Overridden by a better device */
> > +     if (vgadev_default && ((vgadev_default->owns & VGA_RSRC_LEGACY_MASK) == 0)
> > +             && ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
> > +             vgaarb_info(dev, "overriding boot VGA device\n");
> > +             vga_set_default_device(pdev);
> > +     }
> > +
> > +     if (vga_arb_integrated_gpu(dev)) {
> > +             vgaarb_info(dev, "overriding boot VGA device\n");
> > +             vga_set_default_device(pdev);
> > +     }
> > +
> > +#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > +     if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> > +             base |= (u64)screen_info.ext_lfb_base << 32;
> > +
> > +     limit = base + size;
> > +
> > +     /*
> > +      * Override vga_arbiter_add_pci_device()'s I/O based detection
> > +      * as it may take the wrong device (e.g. on Apple system under
> > +      * EFI).
> > +      *
> > +      * Select the device owning the boot framebuffer if there is
> > +      * one.
> > +      */
> > +
> > +     /* Does firmware framebuffer belong to us? */
> > +     for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> > +             flags = pci_resource_flags(vgadev->pdev, i);
> > +
> > +             if ((flags & IORESOURCE_MEM) == 0)
> > +                     continue;
> > +
> > +             start = pci_resource_start(vgadev->pdev, i);
> > +             end  = pci_resource_end(vgadev->pdev, i);
> > +
> > +             if (!start || !end)
> > +                     continue;
> > +
> > +             if (base < start || limit >= end)
> > +                     continue;
> > +
> > +             if (vgadev->pdev != vga_default_device())
> > +                     vgaarb_info(dev, "overriding boot device\n");
> > +             vga_set_default_device(vgadev->pdev);
> > +     }
> > +#endif
> > +}
> > +
> >  /*
> >   * Rules for using a bridge to control a VGA descendant decoding: if a bridge
> >   * has only one VGA descendant then it can be used to control the VGA routing
> > @@ -643,6 +734,11 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
> >               }
> >               new_bus = new_bus->parent;
> >       }
> > +
> > +     if (vgadev->bridge_has_one_vga == true)
> > +             vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
> > +     else
> > +             vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
> >  }
> >
> >  /*
> > @@ -713,15 +809,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
> >               bus = bus->parent;
> >       }
> >
> > -     /* Deal with VGA default device. Use first enabled one
> > -      * by default if arch doesn't have it's own hook
> > -      */
> > -     if (vga_default == NULL &&
> > -         ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
> > -             vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
> > -             vga_set_default_device(pdev);
> > -     }
> > -
> > +     vga_arb_update_default_device(vgadev);
> >       vga_arbiter_check_bridge_sharing(vgadev);
> >
> >       /* Add to the list */
> > @@ -1451,111 +1539,10 @@ static struct miscdevice vga_arb_device = {
> >       MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
> >  };
> >
> > -#if defined(CONFIG_ACPI)
> > -static bool vga_arb_integrated_gpu(struct device *dev)
> > -{
> > -     struct acpi_device *adev = ACPI_COMPANION(dev);
> > -
> > -     return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
> > -}
> > -#else
> > -static bool vga_arb_integrated_gpu(struct device *dev)
> > -{
> > -     return false;
> > -}
> > -#endif
> > -
> > -static void __init vga_arb_select_default_device(void)
> > -{
> > -     struct pci_dev *pdev, *found = NULL;
> > -     struct vga_device *vgadev;
> > -
> > -#if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > -     u64 base = screen_info.lfb_base;
> > -     u64 size = screen_info.lfb_size;
> > -     u64 limit;
> > -     resource_size_t start, end;
> > -     unsigned long flags;
> > -     int i;
> > -
> > -     if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
> > -             base |= (u64)screen_info.ext_lfb_base << 32;
> > -
> > -     limit = base + size;
> > -
> > -     list_for_each_entry(vgadev, &vga_list, list) {
> > -             struct device *dev = &vgadev->pdev->dev;
> > -             /*
> > -              * Override vga_arbiter_add_pci_device()'s I/O based detection
> > -              * as it may take the wrong device (e.g. on Apple system under
> > -              * EFI).
> > -              *
> > -              * Select the device owning the boot framebuffer if there is
> > -              * one.
> > -              */
> > -
> > -             /* Does firmware framebuffer belong to us? */
> > -             for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> > -                     flags = pci_resource_flags(vgadev->pdev, i);
> > -
> > -                     if ((flags & IORESOURCE_MEM) == 0)
> > -                             continue;
> > -
> > -                     start = pci_resource_start(vgadev->pdev, i);
> > -                     end  = pci_resource_end(vgadev->pdev, i);
> > -
> > -                     if (!start || !end)
> > -                             continue;
> > -
> > -                     if (base < start || limit >= end)
> > -                             continue;
> > -
> > -                     if (!vga_default_device())
> > -                             vgaarb_info(dev, "setting as boot device\n");
> > -                     else if (vgadev->pdev != vga_default_device())
> > -                             vgaarb_info(dev, "overriding boot device\n");
> > -                     vga_set_default_device(vgadev->pdev);
> > -             }
> > -     }
> > -#endif
> > -
> > -     if (!vga_default_device()) {
> > -             list_for_each_entry_reverse(vgadev, &vga_list, list) {
> > -                     struct device *dev = &vgadev->pdev->dev;
> > -                     u16 cmd;
> > -
> > -                     pdev = vgadev->pdev;
> > -                     pci_read_config_word(pdev, PCI_COMMAND, &cmd);
> > -                     if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
> > -                             found = pdev;
> > -                             if (vga_arb_integrated_gpu(dev))
> > -                                     break;
> > -                     }
> > -             }
> > -     }
> > -
> > -     if (found) {
> > -             vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
> > -             vga_set_default_device(found);
> > -             return;
> > -     }
> > -
> > -     if (!vga_default_device()) {
> > -             vgadev = list_first_entry_or_null(&vga_list,
> > -                                               struct vga_device, list);
> > -             if (vgadev) {
> > -                     struct device *dev = &vgadev->pdev->dev;
> > -                     vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
> > -                     vga_set_default_device(vgadev->pdev);
> > -             }
> > -     }
> > -}
> > -
> >  static int __init vga_arb_device_init(void)
> >  {
> >       int rc;
> >       struct pci_dev *pdev;
> > -     struct vga_device *vgadev;
> >
> >       rc = misc_register(&vga_arb_device);
> >       if (rc < 0)
> > @@ -1571,18 +1558,6 @@ static int __init vga_arb_device_init(void)
> >                              PCI_ANY_ID, pdev)) != NULL)
> >               vga_arbiter_add_pci_device(pdev);
> >
> > -     list_for_each_entry(vgadev, &vga_list, list) {
> > -             struct device *dev = &vgadev->pdev->dev;
> > -
> > -             if (vgadev->bridge_has_one_vga)
> > -                     vgaarb_info(dev, "bridge control possible\n");
> > -             else
> > -                     vgaarb_info(dev, "no bridge control possible\n");
> > -     }
> > -
> > -     vga_arb_select_default_device();
> > -
> > -     pr_info("loaded\n");
> >       return rc;
> >  }
> >  subsys_initcall(vga_arb_device_init);
> > --
> > 2.27.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
