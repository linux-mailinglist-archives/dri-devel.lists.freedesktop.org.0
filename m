Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB13F258C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 06:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF856E9F6;
	Fri, 20 Aug 2021 04:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846EE6E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 04:07:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D99161101
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629432437;
 bh=aFFRAKxmcOn6wnJ2YdXmJSuGRMozyCqrjXLi5HnjZto=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G+Mr5N3p7YzwcOlVqnxkF4cNRhMVO08tNIbB0MSrBvwncL4tYUxrDGXozJdQ5HFsf
 hpcfIHM6cwjwAphpUb3BTRhSCbAh3nyUg+hGb3YoMLqf369pd1oA1HDzSLybHfb4iS
 iW6oouakgisUl1F8AaMtgNMk74SytbIqgbnunL7paiPo2qZi88S0ei34822jrZWIK5
 teesgCqOn6F4HUag5qxfjyN1HNDVB2qkmXbD4mn4no4XNHvNGBsSh5bbTDPE29e3Gd
 5Anc0tTY5ZtO7YZ7nvEg3gmAdnbJHnoDPQgCB7Kyzm9+QzZYnPtWxxsmlq/sPlRGxa
 R77V2ULgeLZmg==
Received: by mail-io1-f54.google.com with SMTP id g9so10502430ioq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 21:07:17 -0700 (PDT)
X-Gm-Message-State: AOAM532LyOgbQlqkMkuySLeFfwcYZsmLrAdiKHtUeKBXgrrIWZZK5XXq
 riHqCFPZkF+b+1+C62u7oJVeTwj7p7Az8ZIg3ek=
X-Google-Smtp-Source: ABdhPJzFKuM7pvOL9Ed5fC2IPve+nx7tQ57LLiLQ9+zpiiRyU70x8S41i7ZQr7SxRCF4SeyqLNlfO1jrR73+wbCkIvQ=
X-Received: by 2002:a02:b697:: with SMTP id i23mr16063279jam.78.1629432436680; 
 Thu, 19 Aug 2021 21:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210809185901.GA2176971@bjorn-Precision-5520>
 <20210819215240.GA3241693@bjorn-Precision-5520>
In-Reply-To: <20210819215240.GA3241693@bjorn-Precision-5520>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Aug 2021 12:07:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4qqAaCoi6_kVnwXCMjBqfen5iH583tQ07bxK5P5zpYeQ@mail.gmail.com>
Message-ID: <CAAhV-H4qqAaCoi6_kVnwXCMjBqfen5iH583tQ07bxK5P5zpYeQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@linux.ie>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-pci <linux-pci@vger.kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>, 
 Christoph Hellwig <hch@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bjorn,

On Fri, Aug 20, 2021 at 5:52 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Aug 09, 2021 at 01:59:01PM -0500, Bjorn Helgaas wrote:
> > On Tue, Aug 03, 2021 at 12:06:44PM -0500, Bjorn Helgaas wrote:
> > > On Sat, Jul 24, 2021 at 05:30:02PM +0800, Huacai Chen wrote:
> > > > On Sat, Jul 24, 2021 at 8:10 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> > > > > Thanks for the above; that was helpful.  To summarize:
> > > > >
> > > > >   - On your system, the AST2500 bridge [1a03:1150] does not implement
> > > > >     PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
> > > > >     legacy VGA resources won't reach downstream devices unless they're
> > > > >     included in the usual bridge windows.
> > > > >
> > > > >   - vga_arb_select_default_device() will set a device below such a
> > > > >     bridge as the default VGA device as long as it has PCI_COMMAND_IO
> > > > >     and PCI_COMMAND_MEMORY enabled.
> > > > >
> > > > >   - vga_arbiter_add_pci_device() is called for every VGA device,
> > > > >     either at boot-time or at hot-add time, and it will also set the
> > > > >     device as the default VGA device, but ONLY if all bridges leading
> > > > >     to it implement PCI_BRIDGE_CTL_VGA.
> > > > >
> > > > >   - This difference between vga_arb_select_default_device() and
> > > > >     vga_arbiter_add_pci_device() means that a device below an AST2500
> > > > >     or similar bridge can only be set as the default if it is
> > > > >     enumerated before vga_arb_device_init().
> > > > >
> > > > >   - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
> > > > >     which runs before vga_arb_device_init().
> > > > >
> > > > >   - On non-ACPI systems, like your MIPS system, they are enumerated by
> > > > >     pcibios_init(), which typically runs *after*
> > > > >     vga_arb_device_init().
> > > > >
> > > > > So I think the critical change is actually that you made
> > > > > vga_arb_update_default_device(), which you call from
> > > > > vga_arbiter_add_pci_device(), set the default device even if it does
> > > > > not own the VGA resources because an upstream bridge doesn't implement
> > > > > PCI_BRIDGE_CTL_VGA, i.e.,
> > > > >
> > > > >   (vgadev->owns & VGA_RSRC_LEGACY_MASK) != VGA_RSRC_LEGACY_MASK
> > > > >
> > > > > Does that seem right?
> > > >
> > > > Yes, that's right.
> > >
> > > I think that means I screwed up.  I somehow had it in my head that the
> > > hot-add path would never set the default VGA device.  But that is
> > > false.
> > >
> > > I still think we should move vgaarb.c to drivers/pci/ and get it more
> > > tightly integrated into the PCI core.
> > >
> > > BUT that's a lot of churn and obscures the simple change that fixes
> > > the problem for you.  So I think the first step should be the change
> > > to vga_arb_update_default_device() so it sets the default device even
> > > when the upstream bridge doesn't implement PCI_BRIDGE_CTL_VGA.
> > >
> > > That should be a relatively small change, and I think it's better to
> > > make the fix before embarking on major restructuring.
> >
> > To make sure this doesn't get lost: I'm hoping you can separate out
> > and post the small patch to vga_arb_update_default_device().
> >
> > I can look at the move/restructure stuff later.
>
> What's happening with this?  I'm still assuming you can post a small
> patch to vga_arb_update_default_device() that's suitable for v5.15,
> Huacai.
>
> Otherwise I'm afraid we won't make any forward progress this cycle.
In my opinion these patches (including the last one) are small enough,
so can I update the commit message of the last one and keep the patch
content as is and send V3?

Huacai
>
> Bjorn
