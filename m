Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D492449B7C2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 16:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F42894A7;
	Tue, 25 Jan 2022 15:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065A3894A7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 15:39:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CE40616EC;
 Tue, 25 Jan 2022 15:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D13C340E0;
 Tue, 25 Jan 2022 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643125139;
 bh=3+IIyO4s9LRB2WJTD77TQ1psxFyUDAivLJQg1pOB6c0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Pi1B/S1XqQwEErfMBvI/lQ+vMJznZoW2tBZuA6TrAoIxdFVFIV9uAYtuHus8INUmK
 FqJMXQ6SWoIOJDeEwAfgxexxhfsmhtK/j8Q5NrbOh9mGFQV4x0bYLQN45WTIb+3vli
 zMR4ZJdQt493xqFWC9yhVnwI7W5sbZpTxX8czi/QJghc/1/bUgNgd/pCMA+t1Dg7Vz
 47qdsECIxUvg+allRMzAedu1CMPqh1ESqMmPsLjoZRqig/wQtP3bZQYCEjV8Xf6KM9
 KE0sfiXEIRtd8EUwRH8cyF4ccARZl0s1sYCG9MPRH1SPA5yUy0/bgQUNvRNvb8rJxn
 g1B4yVi3AjkVg==
Date: Tue, 25 Jan 2022 09:38:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH v8 04/10] vgaarb: Move framebuffer detection to
 ADD_DEVICE path
Message-ID: <20220125153858.GA1609157@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4GAgKh4HBeWQ+LGf2x_uKy_T5MaMv0dNcYXFKVGAZEzw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+cc Maarten, Maxime, Thomas; beginning of thread:
https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org]

On Tue, Jan 25, 2022 at 10:51:15AM +0800, Huacai Chen wrote:
> Hi, Bjorn,
> 
> Why this series still missing in 5.17-rc1? :(

1) It was posted late in the cycle (Jan 6, when the merge window
opened Jan 9), so it was too late to expect a significant change like
this to be merged for v5.17.  Right now is a good time to consider it
again so it would some time in -next.

2) As of now, this code is still in drivers/gpu, and I don't maintain
that area.  It's up to the DRM folks, who are all cc'd here.

I would like to move this from drivers/gpu to drivers/pci, but that
requires a little more work to resolve the initcall ordering problem
with respect to vga_arb_device_init() and misc_init() [1].

Bjorn

[1] https://lore.kernel.org/linux-pci/CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU27KHWcyWKkMftEsA@mail.gmail.com/

> On Fri, Jan 7, 2022 at 12:21 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Thu, Jan 06, 2022 at 02:44:42PM +0800, Huacai Chen wrote:
> > > On Thu, Jan 6, 2022 at 8:07 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > Previously we selected a device that owns the boot framebuffer as the
> > > > default device in vga_arb_select_default_device().  This was only done in
> > > > the vga_arb_device_init() subsys_initcall, so devices enumerated later,
> > > > e.g., by pcibios_init(), were not eligible.
> > > >
> > > > Fix this by moving the framebuffer device selection from
> > > > vga_arb_select_default_device() to vga_arbiter_add_pci_device(), which is
> > > > called after every PCI device is enumerated, either by the
> > > > vga_arb_device_init() subsys_initcall or as an ADD_DEVICE notifier.
> > > >
> > > > Note that if vga_arb_select_default_device() found a device owning the boot
> > > > framebuffer, it unconditionally set it to be the default VGA device, and no
> > > > subsequent device could replace it.
> > > >
> > > > Link: https://lore.kernel.org/r/20211015061512.2941859-7-chenhuacai@loongson.cn
> > > > Based-on-patch-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > > > Cc: Bruno Prémont <bonbons@linux-vserver.org>
> > > > ---
> > > >  drivers/gpu/vga/vgaarb.c | 37 +++++++++++++++++--------------------
> > > >  1 file changed, 17 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> > > > index b0ae0f177c6f..aefa4f406f7d 100644
> > > > --- a/drivers/gpu/vga/vgaarb.c
> > > > +++ b/drivers/gpu/vga/vgaarb.c
> > > > @@ -72,6 +72,7 @@ struct vga_device {
> > > >         unsigned int io_norm_cnt;       /* normal IO count */
> > > >         unsigned int mem_norm_cnt;      /* normal MEM count */
> > > >         bool bridge_has_one_vga;
> > > > +       bool is_framebuffer;    /* BAR covers firmware framebuffer */
> > > >         unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
> > > >  };
> > > >
> > > > @@ -565,10 +566,9 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
> > > >  }
> > > >  EXPORT_SYMBOL(vga_put);
> > > >
> > > > -static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
> > > > +static bool vga_is_framebuffer_device(struct pci_dev *pdev)
> > > >  {
> > > >  #if defined(CONFIG_X86) || defined(CONFIG_IA64)
> > > > -       struct device *dev = &pdev->dev;
> > > >         u64 base = screen_info.lfb_base;
> > > >         u64 size = screen_info.lfb_size;
> > > >         u64 limit;
> > > > @@ -583,15 +583,6 @@ static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
> > > >
> > > >         limit = base + size;
> > > >
> > > > -       /*
> > > > -        * Override vga_arbiter_add_pci_device()'s I/O based detection
> > > > -        * as it may take the wrong device (e.g. on Apple system under
> > > > -        * EFI).
> > > > -        *
> > > > -        * Select the device owning the boot framebuffer if there is
> > > > -        * one.
> > > > -        */
> > > > -
> > > >         /* Does firmware framebuffer belong to us? */
> > > >         for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> > > >                 flags = pci_resource_flags(pdev, i);
> > > > @@ -608,13 +599,10 @@ static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
> > > >                 if (base < start || limit >= end)
> > > >                         continue;
> > > >
> > > > -               if (!vga_default_device())
> > > > -                       vgaarb_info(dev, "setting as boot device\n");
> > > > -               else if (pdev != vga_default_device())
> > > > -                       vgaarb_info(dev, "overriding boot device\n");
> > > > -               vga_set_default_device(pdev);
> > > > +               return true;
> > > >         }
> > > >  #endif
> > > > +       return false;
> > > >  }
> > > >
> > > >  static bool vga_arb_integrated_gpu(struct device *dev)
> > > > @@ -635,6 +623,7 @@ static bool vga_arb_integrated_gpu(struct device *dev)
> > > >  static bool vga_is_boot_device(struct vga_device *vgadev)
> > > >  {
> > > >         struct vga_device *boot_vga = vgadev_find(vga_default_device());
> > > > +       struct pci_dev *pdev = vgadev->pdev;
> > > >
> > > >         /*
> > > >          * We select the default VGA device in this order:
> > > > @@ -645,6 +634,18 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
> > > >          *   Other device (see vga_arb_select_default_device())
> > > >          */
> > > >
> > > > +       /*
> > > > +        * We always prefer a firmware framebuffer, so if we've already
> > > > +        * found one, there's no need to consider vgadev.
> > > > +        */
> > > > +       if (boot_vga && boot_vga->is_framebuffer)
> > > > +               return false;
> > > > +
> > > > +       if (vga_is_framebuffer_device(pdev)) {
> > > > +               vgadev->is_framebuffer = true;
> > > > +               return true;
> > > > +       }
> > > Maybe it is better to rename vga_is_framebuffer_device() to
> > > vga_is_firmware_device() and rename is_framebuffer to
> > > is_fw_framebuffer?
> >
> > That's a great point, thanks!
> >
> > The "framebuffer" term is way too generic.  *All* VGA devices have a
> > framebuffer, so it adds no information.  This is really about finding
> > the device that was used by firmware.
> >
> > I renamed:
> >
> >   vga_is_framebuffer_device() -> vga_is_firmware_default()
> >   vga_device.is_framebuffer   -> vga_device.is_firmware_default
> >
> > I updated my local branch and pushed it to:
> > https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=pci/vga
> > with head 0f4caffa1297 ("vgaarb: Replace full MIT license text with
> > SPDX identifier").
> >
> > I don't maintain drivers/gpu/vga/vgaarb.c, so this branch is just for
> > reference.  It'll ultimately be up to the DRM folks to handle this.
> >
> > I'll wait for any other comments or testing reports before reposting.
> >
> > > >         /*
> > > >          * A legacy VGA device has MEM and IO enabled and any bridges
> > > >          * leading to it have PCI_BRIDGE_CTL_VGA enabled so the legacy
> > > > @@ -1531,10 +1532,6 @@ static void __init vga_arb_select_default_device(void)
> > > >         struct pci_dev *pdev, *found = NULL;
> > > >         struct vga_device *vgadev;
> > > >
> > > > -       list_for_each_entry(vgadev, &vga_list, list) {
> > > > -               vga_select_framebuffer_device(vgadev->pdev);
> > > > -       }
> > > > -
> > > >         if (!vga_default_device()) {
> > > >                 list_for_each_entry_reverse(vgadev, &vga_list, list) {
> > > >                         struct device *dev = &vgadev->pdev->dev;
> > > > --
> > > > 2.25.1
> > > >
