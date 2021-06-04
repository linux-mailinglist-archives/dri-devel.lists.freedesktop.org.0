Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852F339B1A1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 06:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96D26E879;
	Fri,  4 Jun 2021 04:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52A6E879
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 04:50:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C659261412
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 04:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622782216;
 bh=qE8jySZf7O68StYikD3YxeyG/IpIT2hs3H0U8WcThuM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZAvwAMi97bZQmCMygNzKVc6sx/3F7XkcMnDYU6aacIt/LXpRWXZjbMjQbbMUTjF08
 vYbKvKbm3W+7Emn7T/7sT6y0cZZmJYflwphaHq81i6vd/3eG+MJVAbvwvpEWQgbwtr
 UoSQbPyEHs5eFT9InGn4xA3IUF1QTMUlbSSR+fS5N4yPZcUM6jpkHHl3VME+1Zml6l
 RYr5oZKg5LUkfo2utfO/vqt5idXnoq1KmFrD3xR4j6wkKY+uSVsQol17t3l3VjTASh
 QX9FsxoEyrxWubn2JHKvSgMDgFGfLbApK8UAttT3WUvuihdGb0rG3qJ0nDU7K57Kle
 aZQYD+6bTCkFw==
Received: by mail-io1-f44.google.com with SMTP id r4so8724843iol.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 21:50:16 -0700 (PDT)
X-Gm-Message-State: AOAM5317slCr7stjyWzPotWg1KInf5fH17d44jJEZ/6VC1I6RCzNErTp
 gyfhCH3OF//PWf1gVsQmYTi6xPJRpxWqUm5CiCM=
X-Google-Smtp-Source: ABdhPJx6DVloRZJ8q1rh4Ivr+Pat40frkD3DUIkUMtub6ohxE16nUSOWY7CdFneJWh1f4as8340HZSblh/t9q2H4mfM=
X-Received: by 2002:a5e:a806:: with SMTP id c6mr2175064ioa.180.1622782216204; 
 Thu, 03 Jun 2021 21:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local> <YLZqe14Lf2+5Lbf3@kroah.com>
 <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
 <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
 <YLewShl3lMyqJ1WZ@phenom.ffwll.local>
 <CAErSpo4cLp4YHGh0Lp=hZ70=1A4WBEtUhM-KUKk=SnNmTVzmRg@mail.gmail.com>
In-Reply-To: <CAErSpo4cLp4YHGh0Lp=hZ70=1A4WBEtUhM-KUKk=SnNmTVzmRg@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 4 Jun 2021 12:50:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5bO5MAshcxo=xehfxU5zMBKep4ebYaLQ1oT8uuTjqoSQ@mail.gmail.com>
Message-ID: <CAAhV-H5bO5MAshcxo=xehfxU5zMBKep4ebYaLQ1oT8uuTjqoSQ@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
To: Bjorn Helgaas <bhelgaas@google.com>
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
 Linux PCI <linux-pci@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Thu, Jun 3, 2021 at 2:31 AM Bjorn Helgaas <bhelgaas@google.com> wrote:
>
> [+cc linux-pci]
>
> On Wed, Jun 2, 2021 at 11:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jun 02, 2021 at 06:36:03PM +0800, Huacai Chen wrote:
> > > On Wed, Jun 2, 2021 at 2:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> > > > > On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > > > > > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > > > > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > > > > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > > > > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > > > > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > > > > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > > > > > device_init().
> > > > >
> > > > > Trying to juggle levels like this always fails if you build the code as
> > > > > a module.
> > > > >
> > > > > Why not fix it properly and handle the out-of-order loading by returning
> > > > > a "deferred" error if you do not have your resources yet?
> > > >
> > > > It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
> > > > something you can -EPROBE_DEFER I think, without potentially upsetting the
> > > > drivers that need this.
> > > >
> > > > Which might mean we should move this into pci subsystem proper perhaps?
> > > > Then adding the init call at the right time becomes trivial since we just
> > > > plug it in at the end of pci init.
> > > >
> > > > Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
> > > > generally a module, problem solved.
> > > >
> > > > Bjorn, would you take this entire vgaarb.c thing? From a quick look I
> > > > don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
> > > > a bit differently and doesn't have this init order issue).
> > > Emmm, this patch cannot handle the hotplug case and module case, it
> > > just handles the case that vgaarb, drm driver and pci all built-in.
> > > But I think this is enough, because the original problem only happens
> > > on very few BMC-based VGA cards (BMC doesn't set the VGA Enable bit on
> > > the bridge, which breaks vgaarb).
> >
> > I'm not talking aout hotplug, just ordering the various pieces correctly.
> > That vgaarb isn't really a driver and also can't really handle hotplug is
> > my point. I guess that got lost a bit?
> >
> > Anyway my proposal is essentially to do a
> >
> > $ git move drivers/gpu/vga/vgaarb.c drivers/pci
> >
> > But I just realized that vgaarb is a bool option, so module isn't possible
> > anyway, and we could fix this by calling vgaarb from pcibios init (with an
> > empty static inline in the header if vgaarb is disabled). That makes the
> > dependency very explicit and guarantees it works correctly.
>
> pcibios_init() is also an initcall and is implemented by every arch.
> I agree that calling vga_arb_device_init() directly from
> pcibios_init() would probably fix this problem, and it would be really
> nice to have it not be an initcall.  But it's also kind of a pain to
> have to update all those copies of pcibios_init(), and I would be
> looking for a way to unify it since it's not really an arch-specific
> thing.
>
> I think the simplest solution, which I suggested earlier [1], would be
> to explicitly call vga_arbiter_add_pci_device() directly from the PCI
> core when it enumerates a VGA device.  Then there's no initcall and no
> need for the BUS_NOTIFY_ADD/DEL_DEVICE stuff.
> vga_arbiter_add_pci_device() could set the default VGA device when it
> is enumerated, and change the default device if we enumerate a
> "better" one.  And hotplug VGA devices would work automatically.
Emm, It seems that your solution has some difficulties to remove the
whole initcall(vga_arb_device_init): we call
vga_arbiter_add_pci_device() in pci_bus_add_device(), the
list_for_each_entry() loop can be moved to
vga_arbiter_check_bridge_sharing(), vga_arb_select_default_device()
can be renamed to vga_arb_update_default_device() and be called in
vga_arbiter_add_pci_device(), but how to handle
misc_register(&vga_arb_device)?

Huacai
>
> > Whether we move vgaarb into drivers/pci or not is then kinda orthogonal.
>
> I'm fine with moving it to drivers/pci if that makes anything easier.
> It definitely is PCI-related stuff, not GPU-related stuff.
>
> [1] https://lore.kernel.org/r/20210526182940.GA1303599@bjorn-Precision-5520
