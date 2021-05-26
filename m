Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735AC390E55
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 04:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54596EB67;
	Wed, 26 May 2021 02:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B289B03
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 02:33:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26BB561431
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 02:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621996399;
 bh=wKfINeG7VRmsh8MALQOBucDaw4lYbXUVhfcrQe7WQH0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FMsFuycbmdTuAXfSQSABUeJPp5BY96XQ+A80WJgGPMXC0/2pUQxQ29X6gd1d8ETzH
 E8INcb4BZFlKJb1MW+4sZBJ3UplUZ6LOYiUF95eagCdnI7f5Kfzd2ROO/h0l9mksS1
 cmIBvrae8/Y6wmXOHuoXAAQfLuEZ+S1P7vm35acwHNk7equtPt9HrKkHrC2flCYFJM
 nNcThpr4QkYhflm8pifuItYDRD/etdns5kbqHV8/u7ddVyZG+XJFpq2Xh4a0Fe6h0C
 zsHE+M+wLCgmgWiUz6X/G53mKUT8NiszfeigSX0YT4GwJa3O7d9NqZcQDs+/49O0ve
 gHB9gG4XzFTOQ==
Received: by mail-il1-f169.google.com with SMTP id k4so26345824ili.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 19:33:19 -0700 (PDT)
X-Gm-Message-State: AOAM530D8nvBygw2vwXRuem2JsmL89sdzDY3uGNvYTO2DswUGWLMDAWy
 5D5jsvtao3gE3bjm68om9EwswBM5ZeIVNG3O/mo=
X-Google-Smtp-Source: ABdhPJw0XPKAy6Nuhr+BA2/FRskCAhS00Ptc9Q0ob6BiDmgYm6F/FTH4Q+ai+Q94WuSH/YGdK4sQ6hVFQQSvYfcH890=
X-Received: by 2002:a92:c987:: with SMTP id y7mr27608674iln.173.1621996398468; 
 Tue, 25 May 2021 19:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7D-drrEaDskQhVx0c8_VAy--n3mbsQN_ijfWrRQGVQ=A@mail.gmail.com>
 <20210525135523.GA1185972@bjorn-Precision-5520>
In-Reply-To: <20210525135523.GA1185972@bjorn-Precision-5520>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 May 2021 10:33:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Ayg9QyPBsXRqBbsn8OTEmN2yw7Bf3on63UVM950rARA@mail.gmail.com>
Message-ID: <CAAhV-H4Ayg9QyPBsXRqBbsn8OTEmN2yw7Bf3on63UVM950rARA@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI: Support ASpeed VGA cards behind a misbehaving
 bridge
To: Bjorn Helgaas <helgaas@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 Jingfeng Sui <suijingfeng@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Tue, May 25, 2021 at 9:55 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Tue, May 25, 2021 at 07:03:05PM +0800, Huacai Chen wrote:
> > On Thu, May 20, 2021 at 3:33 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, May 19, 2021 at 10:17:14AM +0800, Huacai Chen wrote:
> > > > On Wed, May 19, 2021 at 3:35 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > On Tue, May 18, 2021 at 03:13:43PM +0800, Huacai Chen wrote:
> > > > > > On Tue, May 18, 2021 at 2:28 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > > On Mon, May 17, 2021 at 08:53:43PM +0800, Huacai Chen wrote:
> > > > > > > > On Sat, May 15, 2021 at 5:09 PM Huacai Chen <chenhuacai@gmail.com> wrote:
> > > > > > > > > On Fri, May 14, 2021 at 11:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > > > > > On Fri, May 14, 2021 at 04:00:25PM +0800, Huacai Chen wrote:
> > > > > > > > > > > According to PCI-to-PCI bridge spec, bit 3 of Bridge Control Register is
> > > > > > > > > > > VGA Enable bit which modifies the response to VGA compatible addresses.
> > > > > > > > > >
> > > > > > > > > > The bridge spec is pretty old, and most of the content has been
> > > > > > > > > > incorporated into the PCIe spec.  I think you can cite "PCIe r5.0, sec
> > > > > > > > > > 7.5.1.3.13" here instead.
> > > > > > > > > >
> > > > > > > > > > > If the VGA Enable bit is set, the bridge will decode and forward the
> > > > > > > > > > > following accesses on the primary interface to the secondary interface.
> > > > > > > > > >
> > > > > > > > > > *Which* following accesses?  The structure of English requires that if
> > > > > > > > > > you say "the following accesses," you must continue by *listing* the
> > > > > > > > > > accesses.
> > > > > > > > > >
> > > > > > > > > > > The ASpeed AST2500 hardward does not set the VGA Enable bit on its
> > > > > > > > > > > bridge control register, which causes vgaarb subsystem don't think the
> > > > > > > > > > > VGA card behind the bridge as a valid boot vga device.
> > > > > > > > > >
> > > > > > > > > > s/hardward/bridge/
> > > > > > > > > > s/vga/VGA/ (also in code comments and dmesg strings below)
> > > > > > > > > >
> > > > > > > > > > From the code, it looks like AST2500 ([1a03:2000]) is a VGA device,
> > > > > > > > > > since it apparently has a VGA class code.  But here you say the
> > > > > > > > > > AST2500 has a Bridge Control register, which suggests that it's a
> > > > > > > > > > bridge.  If AST2500 is some sort of combination that includes both a
> > > > > > > > > > bridge and a VGA device, please outline that topology.
> > > > > > > > > >
> > > > > > > > > > But the hardware defect is that some bridges forward VGA accesses even
> > > > > > > > > > though their VGA Enable bit is not set?  The quirk should be attached
> > > > > > > > > > to broken *bridges*, not to VGA devices.
> > > > > > > > > >
> > > > > > > > > > If a bridge forwards VGA accesses regardless of how its VGA Enable bit
> > > > > > > > > > is set, that means VGA arbitration (in vgaarb.c) cannot work
> > > > > > > > > > correctly, so merely setting the default VGA device once in a quirk is
> > > > > > > > > > not sufficient.  You would have to somehow disable any future attempts
> > > > > > > > > > to use other VGA devices.  Only the VGA device below this defective
> > > > > > > > > > bridge is usable.  Any other VGA devices in the system would be
> > > > > > > > > > useless.
> > > > > > > > > >
> > > > > > > > > > > So we provide a quirk to fix Xorg auto-detection.
> > > > > > > > > > >
> > > > > > > > > > > See similar bug:
> > > > > > > > > > >
> > > > > > > > > > > https://patchwork.kernel.org/project/linux-pci/patch/20170619023528.11532-1-dja@axtens.net/
> > > > > > > > > >
> > > > > > > > > > This patch was never merged.  If we merged a revised version, please
> > > > > > > > > > cite the SHA1 instead.
> > > > > > > > >
> > > > > > > > > This patch has never merged, and I found that it is unnecessary after
> > > > > > > > > commit a37c0f48950b56f6ef2ee637 ("vgaarb: Select a default VGA device
> > > > > > > > > even if there's no legacy VGA"). Maybe this ASpeed patch is also
> > > > > > > > > unnecessary. If it is still needed, I'll investigate the root cause.
> > > > > > > >
> > > > > > > > I found that vga_arb_device_init() and pcibios_init() are both wrapped
> > > > > > > > by subsys_initcall(), which means their sequence is unpredictable. And
> > > > > > > > unfortunately, in our platform vga_arb_device_init() is called before
> > > > > > > > pcibios_init(), which makes vga_arb_device_init() fail to set a
> > > > > > > > default vga device. This is the root cause why we thought that we
> > > > > > > > still need a quirk for AST2500.
> > > > > > >
> > > > > > > Does this mean there is no hardware defect here?  The VGA Enable bit
> > > > > > > works correctly?
> > > > > > >
> > > > > > No, VGA Enable bit still doesn't set, but with commit
> > > > > > a37c0f48950b56f6ef2ee637 ("vgaarb: Select a default VGA device even if
> > > > > > there's no legacy VGA") we no longer depend on VGA Enable.
> > > > >
> > > > > Correct me if I'm wrong:
> > > > >
> > > > >   - On the AST2500 bridge [1a03:1150], the VGA Enable bit is
> > > > >     read-only 0.
> > > > >
> > > > >   - The AST2500 bridge never forwards VGA accesses ([mem
> > > > >     0xa0000-0xbffff], [io 0x3b0-0x3bb], [io 0x3c0-0x3df]) to its
> > > > >     secondary bus.
> > > > >
> > > > > The VGA Enable bit is optional, and if both the above are true, the
> > > > > bridge is working correctly per spec, and the quirk below is not the
> > > > > right solution, and whatever solution we come up with should not
> > > > > claim that the bridge is misbehaving.
> > > > Yes, you are right, the bridge is working correctly, which is similar
> > > > to HiSilicon D05.
> > > >
> > > >
> > > > >
> > > > > > > > I think the best solution is make vga_arb_device_init() be wrapped by
> > > > > > > > subsys_initcall_sync(), do you think so?
> > > > > > >
> > > > > > > Hmm.  Unfortunately the semantics of subsys_initcall_sync() are not
> > > > > > > documented, so I'm not sure exactly *why* such a change would work and
> > > > > > > whether we could rely on it to continue working.
> > > > > > >
> > > > > > > pcibios_init() isn't very consistent across arches.  On some,
> > > > > > > including alpha, microblaze, some MIPS platforms, powerpc, and sh, it
> > > > > > > enumerates PCI devices.  On others (ia64, parisc, sparc, x86), it does
> > > > > > > basically nothing.  That makes life a little difficult.
> > > > > >
> > > > > > subsys_initcall_sync() is ensured after all subsys_initcall()
> > > > > > functions, so at least it can solve the problem on platforms which use
> > > > > > pcibios_init() to enumerate PCI devices (x86 and other ACPI-based
> > > > > > platforms are also OK, because they use acpi_init()
> > > > > > -->acpi_scan_init() -->pci_acpi_scan_root() to enumerate devices).
> > > > >
> > > > > More details in my response to suijingfeng:
> > > > > https://lore.kernel.org/r/20210518193100.GA148462@bjorn-Precision-5520
> > > > >
> > > > > I'd rather not fiddle with the initcall ordering.  That mechanism is
> > > > > fragile and I'd prefer something more robust.
> > > > >
> > > > > I'm wondering whether it's practical to do something in the normal PCI
> > > > > enumeration path, e.g., in pci_init_capabilities().  Maybe we can
> > > > > detect the default VGA device as we enumerate it.  Then we wouldn't
> > > > > have this weird process of "find all PCI devices first, then scan for
> > > > > the default VGA device, and oh, by the way, also check for VGA devices
> > > > > hot-added later."
> > > >
> > > > If we don't want to rely on initcall order, and want to solve the
> > > > hot-added case, then can we add vga_arb_select_default_device() in
> > > > pci_notify() when (action == BUS_NOTIFY_ADD_DEVICE &&
> > > > !vga_default_device())?
> > >
> > > I think I would see if it's possible to call
> > > vga_arb_select_default_device() from vga_arbiter_add_pci_device()
> > > instead of from vga_arb_device_init().
> > >
> > > I would also (as a separate patch) try to get rid of this loop in
> > > vga_arb_device_init():
> > >
> > >         list_for_each_entry(vgadev, &vga_list, list) {
> > >                 struct device *dev = &vgadev->pdev->dev;
> > >
> > >                 if (vgadev->bridge_has_one_vga)
> > >                         vgaarb_info(dev, "bridge control possible\n");
> > >                 else
> > >                         vgaarb_info(dev, "no bridge control possible\n");
> > >         }
> > >
> > > and do the vgaarb_info() in vga_arbiter_check_bridge_sharing(), where
> > > the loop would not be needed.
> >
> > Any updates?
>
> Are you waiting for me to do something else?
>
> I suggested an approach above, but I don't have time to actually do
> the work for you.
Yes, I am really waiting... but I am also investigating history and thinking.

If I haven't missed something (correct me if I'm wrong). For the
original HiSilicon problem, the first attempt is to modify
vga_arbiter_add_pci_device() and remove the VGA_RSRC_LEGACY_MASK
check. But vga_arbiter_add_pci_device() is called for each PCI device,
so removing that check will cause the first VGA device to be the
default VGA device. This breaks some x86 platforms, so after that you
don't touch vga_arbiter_add_pci_device(), but add
vga_arb_select_default_device() in vga_arb_device_init().

If the above history is correct, then we cannot add
vga_arb_select_default_device() in vga_arbiter_add_pci_device()
directly. So it seems we can only add vga_arb_select_default_device()
in pci_notify(). And if we don't care about hotplug, we can simply use
subsys_initcall_sync() to wrap vga_arb_device_init().

And DRM developers, please let me know what do you think about?

Huacai

>
> Bjorn
