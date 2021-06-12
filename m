Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B910B3A4CE1
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 06:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4646E077;
	Sat, 12 Jun 2021 04:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BE6E077
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 04:40:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DB5F611CD
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jun 2021 04:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623472821;
 bh=h2MVUBbWWtPoo4DrZRMh4N6tqk9475KN79CPpksjyQk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pMInXAx4itrjfif4EczHFRqImCLtEYWfLbkTc+D3xF3qAf81r0N84t39IG1FxgCOi
 GfVYltn6TQjQERvmQveX3JNWiStZDWKpgXGB8peXt3KzzUMCi1Ss8BJyvblASWwxhe
 KwuVHKmmfYTaKYroK6OOP58jTAPjS+W1n6IQPMYWxeBsgziPv1f3JvluLEJfcZQAH0
 gPcbL1+4kSAvsQjDkxVQcrttEnv0VCBH3Rz9bKjeuv6UnVXLB8EeRe4nlNC84xv2kT
 u+zkXAIH18T2EIn7wDHgjCql5nsBGqMvciQY+IfL/je96fPgAoxC3VR++CD/sWZv9o
 fI0yt/6yvkUoQ==
Received: by mail-io1-f44.google.com with SMTP id d9so33420523ioo.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:40:21 -0700 (PDT)
X-Gm-Message-State: AOAM533zDYQXMtivCXsC3FxNLAPa1o91sxX4QTbEBgMWR701C3dRkf9/
 nzDz4QwvXaNlhIXuTzt13QsJz3NLUyd+GmCpB30=
X-Google-Smtp-Source: ABdhPJwV+cOfKgkNQBTnorWimSt2e5PFjRNpKtu/U1D9uR2zqrKmPKo833nbhr6a4AFCyqjnR+pw/rE6ZRcMdNilcz0=
X-Received: by 2002:a02:a501:: with SMTP id e1mr6906108jam.96.1623472821006;
 Fri, 11 Jun 2021 21:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H6MCGXiO3EcZV2BZi91AiUNsu2aZ=e9g4e2tcVVNOLbfg@mail.gmail.com>
 <20210605175936.GA2309279@bjorn-Precision-5520>
In-Reply-To: <20210605175936.GA2309279@bjorn-Precision-5520>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 12 Jun 2021 12:40:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Tj9FmzAzuvq9sTjicwFkGCHGj5wjPWn0nwMPSRKZWrQ@mail.gmail.com>
Message-ID: <CAAhV-H5Tj9FmzAzuvq9sTjicwFkGCHGj5wjPWn0nwMPSRKZWrQ@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Sun, Jun 6, 2021 at 1:59 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Sat, Jun 05, 2021 at 10:02:05AM +0800, Huacai Chen wrote:
> > On Sat, Jun 5, 2021 at 3:56 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Jun 04, 2021 at 12:50:03PM +0800, Huacai Chen wrote:
> > > > On Thu, Jun 3, 2021 at 2:31 AM Bjorn Helgaas <bhelgaas@google.com> wrote:
>
> > > > > I think the simplest solution, which I suggested earlier [1],
> > > > > would be to explicitly call vga_arbiter_add_pci_device()
> > > > > directly from the PCI core when it enumerates a VGA device.
> > > > > Then there's no initcall and no need for the
> > > > > BUS_NOTIFY_ADD/DEL_DEVICE stuff.  vga_arbiter_add_pci_device()
> > > > > could set the default VGA device when it is enumerated, and
> > > > > change the default device if we enumerate a "better" one.  And
> > > > > hotplug VGA devices would work automatically.
> > > >
> > > > Emm, It seems that your solution has some difficulties to remove
> > > > the whole initcall(vga_arb_device_init): we call
> > > > vga_arbiter_add_pci_device() in pci_bus_add_device(), the
> > > > list_for_each_entry() loop can be moved to
> > > > vga_arbiter_check_bridge_sharing(),
> > > > vga_arb_select_default_device() can be renamed to
> > > > vga_arb_update_default_device() and be called in
> > > > vga_arbiter_add_pci_device(), but how to handle
> > > > misc_register(&vga_arb_device)?
> > >
> > > Might need to keep vga_arb_device_init() as an initcall, but
> > > remove everything from it except the misc_register().
> >
> > OK, let me try. But I think call  vga_arbiter_add_pci_device() in
> > pci core is nearly the same as notifier.  Anyway, I will send a new
> > patch later.
>
> Notifiers are useful in some situations, for example, if a loadable
> module needs to be called when a device is added or removed.
>
> But when possible, I will always choose a direct call instead because
> it's much less complicated.  The VGA arbiter cannot be a loadable
> module, so I don't think there's any reason to use a notifier in this
> case.
I have done a new patch (see below) to solve this problem, but I still
use a notifier. Because in my opinion, direct call is suitable in the
same subsystem, and notifier is suitable when it is cross subsystem
(vgaarb and pci are two different subsystems, at least now). If you
still think it better to use direct call, I will send a new version.

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 5180c5687ee5..9bb3325cb26b 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -585,6 +585,78 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);

+static void vga_arb_update_default_device(struct vga_device *vgadev)
+{
+       struct pci_dev *pdev = vgadev->pdev;
+       struct device *dev = &pdev->dev;
+       struct vga_device *vgadev_default;
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+       int i;
+       unsigned long flags;
+       u64 base = screen_info.lfb_base;
+       u64 size = screen_info.lfb_size;
+       u64 limit;
+       resource_size_t start, end;
+#endif
+
+       /* Deal with VGA default device. Use first enabled one
+        * by default if arch doesn't have it's own hook
+        */
+       if (!vga_default_device()) {
+               if ((vgadev->owns & VGA_RSRC_LEGACY_MASK) ==
VGA_RSRC_LEGACY_MASK)
+                       vgaarb_info(dev, "setting as boot VGA device\n");
+               else
+                       vgaarb_info(dev, "setting as boot device (VGA
legacy resources not available)\n");
+               vga_set_default_device(pdev);
+       }
+
+       vgadev_default = vgadev_find(vga_default);
+
+       /* Overrided by a better device */
+       if (((vgadev_default->owns & VGA_RSRC_LEGACY_MASK) == 0) &&
+           ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
+               vgaarb_info(dev, "overriding boot VGA device\n");
+               vga_set_default_device(pdev);
+       }
+
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+       if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+               base |= (u64)screen_info.ext_lfb_base << 32;
+
+       limit = base + size;
+
+       /*
+        * Override vga_arbiter_add_pci_device()'s I/O based detection
+        * as it may take the wrong device (e.g. on Apple system under
+        * EFI).
+        *
+        * Select the device owning the boot framebuffer if there is
+        * one.
+        */
+
+       /* Does firmware framebuffer belong to us? */
+       for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
+               flags = pci_resource_flags(vgadev->pdev, i);
+
+               if ((flags & IORESOURCE_MEM) == 0)
+                       continue;
+
+               start = pci_resource_start(vgadev->pdev, i);
+               end  = pci_resource_end(vgadev->pdev, i);
+
+               if (!start || !end)
+                       continue;
+
+               if (base < start || limit >= end)
+                       continue;
+
+               if (vgadev->pdev != vga_default_device())
+                       vgaarb_info(dev, "overriding boot device\n");
+               vga_set_default_device(vgadev->pdev);
+       }
+#endif
+}
+
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -642,6 +714,11 @@ static void
vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
                }
                new_bus = new_bus->parent;
        }
+
+       if (vgadev->bridge_has_one_vga == true)
+               vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
+       else
+               vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
 }

 /*
@@ -712,15 +789,7 @@ static bool vga_arbiter_add_pci_device(struct
pci_dev *pdev)
                bus = bus->parent;
        }

-       /* Deal with VGA default device. Use first enabled one
-        * by default if arch doesn't have it's own hook
-        */
-       if (vga_default == NULL &&
-           ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
-               vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
-               vga_set_default_device(pdev);
-       }
-
+       vga_arb_update_default_device(vgadev);
        vga_arbiter_check_bridge_sharing(vgadev);

        /* Add to the list */
@@ -1450,91 +1519,9 @@ static struct miscdevice vga_arb_device = {
        MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
 };

-static void __init vga_arb_select_default_device(void)
-{
-       struct pci_dev *pdev;
-       struct vga_device *vgadev;
-
-#if defined(CONFIG_X86) || defined(CONFIG_IA64)
-       u64 base = screen_info.lfb_base;
-       u64 size = screen_info.lfb_size;
-       u64 limit;
-       resource_size_t start, end;
-       unsigned long flags;
-       int i;
-
-       if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-               base |= (u64)screen_info.ext_lfb_base << 32;
-
-       limit = base + size;
-
-       list_for_each_entry(vgadev, &vga_list, list) {
-               struct device *dev = &vgadev->pdev->dev;
-               /*
-                * Override vga_arbiter_add_pci_device()'s I/O based detection
-                * as it may take the wrong device (e.g. on Apple system under
-                * EFI).
-                *
-                * Select the device owning the boot framebuffer if there is
-                * one.
-                */
-
-               /* Does firmware framebuffer belong to us? */
-               for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
-                       flags = pci_resource_flags(vgadev->pdev, i);
-
-                       if ((flags & IORESOURCE_MEM) == 0)
-                               continue;
-
-                       start = pci_resource_start(vgadev->pdev, i);
-                       end  = pci_resource_end(vgadev->pdev, i);
-
-                       if (!start || !end)
-                               continue;
-
-                       if (base < start || limit >= end)
-                               continue;
-
-                       if (!vga_default_device())
-                               vgaarb_info(dev, "setting as boot device\n");
-                       else if (vgadev->pdev != vga_default_device())
-                               vgaarb_info(dev, "overriding boot device\n");
-                       vga_set_default_device(vgadev->pdev);
-               }
-       }
-#endif
-       if (!vga_default_device()) {
-               list_for_each_entry(vgadev, &vga_list, list) {
-                       struct device *dev = &vgadev->pdev->dev;
-                       u16 cmd;
-
-                       pdev = vgadev->pdev;
-                       pci_read_config_word(pdev, PCI_COMMAND, &cmd);
-                       if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
-                               vgaarb_info(dev, "setting as boot
device (VGA legacy resources not available)\n");
-                               vga_set_default_device(pdev);
-                               break;
-                       }
-               }
-       }
-
-       if (!vga_default_device()) {
-               vgadev = list_first_entry_or_null(&vga_list,
-                                                 struct vga_device, list);
-               if (vgadev) {
-                       struct device *dev = &vgadev->pdev->dev;
-                       vgaarb_info(dev, "setting as boot device (VGA
legacy resources not available)\n");
-                       vga_set_default_device(vgadev->pdev);
-               }
-       }
-}
-
 static int __init vga_arb_device_init(void)
 {
        int rc;
-       struct pci_dev *pdev;
-       struct vga_device *vgadev;

        rc = misc_register(&vga_arb_device);
        if (rc < 0)
@@ -1542,26 +1529,6 @@ static int __init vga_arb_device_init(void)

        bus_register_notifier(&pci_bus_type, &pci_notifier);

-       /* We add all PCI devices satisfying VGA class in the arbiter by
-        * default */
-       pdev = NULL;
-       while ((pdev =
-               pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-                              PCI_ANY_ID, pdev)) != NULL)
-               vga_arbiter_add_pci_device(pdev);
-
-       list_for_each_entry(vgadev, &vga_list, list) {
-               struct device *dev = &vgadev->pdev->dev;
-
-               if (vgadev->bridge_has_one_vga)
-                       vgaarb_info(dev, "bridge control possible\n");
-               else
-                       vgaarb_info(dev, "no bridge control possible\n");
-       }
-
-       vga_arb_select_default_device();
-
-       pr_info("loaded\n");
        return rc;
 }
 subsys_initcall(vga_arb_device_init);

>
> Bjorn
