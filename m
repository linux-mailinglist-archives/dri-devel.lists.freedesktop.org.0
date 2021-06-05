Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014A339C4EF
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 04:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E895F6E83B;
	Sat,  5 Jun 2021 02:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD5E6E83B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 02:02:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BC75613D2
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 02:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622858543;
 bh=d4HA0w75Y3EgqSo8a4akBrGEgJoOn80fFKdqRDslU3w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Dr3ydDrnEwPkuj2Oh5z6jHT5AA3uKZ1jrLy0x2H50pp5q2bNg/oDonm1UmK7Kd3dO
 Mzv59GeTaVZSaany6XGLn5s0w4mEufc7ajMsWg0yQT2syAe3mk1e0xPaY6oHpMwpqj
 3UC9PKH8oDNBjXa7MMC3XHLEnXphz+ulL2gIDNfMeBgrC9NwDox4/MGwhngE+XxZuL
 MOuP/AsSfCkZqK+c6A4k6cKC5FSB58CmJ4F44/2SQFPctYsDm57qsg8wfghBAq9ZJn
 PzO3O2p43VvlJY/0/SpEmlnCgV78TAbOmkV4+YawJv+kFYzxsgkwg/kgLiZCQsGpW2
 WcCxkCCZQCnmQ==
Received: by mail-io1-f51.google.com with SMTP id r4so12102626iol.6
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 19:02:23 -0700 (PDT)
X-Gm-Message-State: AOAM532z0GYrjEX5+5Vkq7nxXR/AIfAwb5w3EWG7sxnu3cuLaNS61zb4
 pPpugdJs3VV6X3y/IJVsMOW3jBMNj4CTjfEgRQg=
X-Google-Smtp-Source: ABdhPJxtAQ84yV3VSC9lDgHy0oV6H/0eMYq2wckOvU3SkYO3n6ax/RQYQ8yhqI2IsPZQiDLd/oMmkhPB8xltwMAIxKk=
X-Received: by 2002:a6b:4105:: with SMTP id n5mr5992888ioa.148.1622858542380; 
 Fri, 04 Jun 2021 19:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H5bO5MAshcxo=xehfxU5zMBKep4ebYaLQ1oT8uuTjqoSQ@mail.gmail.com>
 <20210604195646.GA2231573@bjorn-Precision-5520>
In-Reply-To: <20210604195646.GA2231573@bjorn-Precision-5520>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Jun 2021 10:02:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6MCGXiO3EcZV2BZi91AiUNsu2aZ=e9g4e2tcVVNOLbfg@mail.gmail.com>
Message-ID: <CAAhV-H6MCGXiO3EcZV2BZi91AiUNsu2aZ=e9g4e2tcVVNOLbfg@mail.gmail.com>
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

On Sat, Jun 5, 2021 at 3:56 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Jun 04, 2021 at 12:50:03PM +0800, Huacai Chen wrote:
> > On Thu, Jun 3, 2021 at 2:31 AM Bjorn Helgaas <bhelgaas@google.com> wrote:
> > >
> > > [+cc linux-pci]
> > >
> > > On Wed, Jun 2, 2021 at 11:22 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Wed, Jun 02, 2021 at 06:36:03PM +0800, Huacai Chen wrote:
> > > > > On Wed, Jun 2, 2021 at 2:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > > On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> > > > > > > On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > > > > > > > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > > > > > > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > > > > > > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > > > > > > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > > > > > > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > > > > > > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > > > > > > > device_init().
> > > > > > >
> > > > > > > Trying to juggle levels like this always fails if you build the code as
> > > > > > > a module.
> > > > > > >
> > > > > > > Why not fix it properly and handle the out-of-order loading by returning
> > > > > > > a "deferred" error if you do not have your resources yet?
> > > > > >
> > > > > > It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
> > > > > > something you can -EPROBE_DEFER I think, without potentially upsetting the
> > > > > > drivers that need this.
> > > > > >
> > > > > > Which might mean we should move this into pci subsystem proper perhaps?
> > > > > > Then adding the init call at the right time becomes trivial since we just
> > > > > > plug it in at the end of pci init.
> > > > > >
> > > > > > Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
> > > > > > generally a module, problem solved.
> > > > > >
> > > > > > Bjorn, would you take this entire vgaarb.c thing? From a quick look I
> > > > > > don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
> > > > > > a bit differently and doesn't have this init order issue).
> > > > > Emmm, this patch cannot handle the hotplug case and module case, it
> > > > > just handles the case that vgaarb, drm driver and pci all built-in.
> > > > > But I think this is enough, because the original problem only happens
> > > > > on very few BMC-based VGA cards (BMC doesn't set the VGA Enable bit on
> > > > > the bridge, which breaks vgaarb).
> > > >
> > > > I'm not talking aout hotplug, just ordering the various pieces correctly.
> > > > That vgaarb isn't really a driver and also can't really handle hotplug is
> > > > my point. I guess that got lost a bit?
> > > >
> > > > Anyway my proposal is essentially to do a
> > > >
> > > > $ git move drivers/gpu/vga/vgaarb.c drivers/pci
> > > >
> > > > But I just realized that vgaarb is a bool option, so module isn't possible
> > > > anyway, and we could fix this by calling vgaarb from pcibios init (with an
> > > > empty static inline in the header if vgaarb is disabled). That makes the
> > > > dependency very explicit and guarantees it works correctly.
> > >
> > > pcibios_init() is also an initcall and is implemented by every arch.
> > > I agree that calling vga_arb_device_init() directly from
> > > pcibios_init() would probably fix this problem, and it would be really
> > > nice to have it not be an initcall.  But it's also kind of a pain to
> > > have to update all those copies of pcibios_init(), and I would be
> > > looking for a way to unify it since it's not really an arch-specific
> > > thing.
> > >
> > > I think the simplest solution, which I suggested earlier [1], would be
> > > to explicitly call vga_arbiter_add_pci_device() directly from the PCI
> > > core when it enumerates a VGA device.  Then there's no initcall and no
> > > need for the BUS_NOTIFY_ADD/DEL_DEVICE stuff.
> > > vga_arbiter_add_pci_device() could set the default VGA device when it
> > > is enumerated, and change the default device if we enumerate a
> > > "better" one.  And hotplug VGA devices would work automatically.
> > Emm, It seems that your solution has some difficulties to remove the
> > whole initcall(vga_arb_device_init): we call
> > vga_arbiter_add_pci_device() in pci_bus_add_device(), the
> > list_for_each_entry() loop can be moved to
> > vga_arbiter_check_bridge_sharing(), vga_arb_select_default_device()
> > can be renamed to vga_arb_update_default_device() and be called in
> > vga_arbiter_add_pci_device(), but how to handle
> > misc_register(&vga_arb_device)?
>
> Might need to keep vga_arb_device_init() as an initcall, but remove
> everything from it except the misc_register().
OK, let me try. But I think call  vga_arbiter_add_pci_device() in pci
core is nearly the same as notifier.
Anyway, I will send a new patch later.

Huacai
