Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535183986A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A7E6E072;
	Wed,  2 Jun 2021 10:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754FE6E072
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:36:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A0DA613B8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622630175;
 bh=Xa5oz/ILz8vjR97/pJYCvyY/NNpND8pGb1w+9hOSe2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gIC784woqMHBUpdHqC4l/yXihvsojUnxUi/YZdAsG4IEVgyQ9h/MEwJANPU35aBxt
 FlefHOvvpOayn3NgdkTlwM0iGzb9ietQJ2c8lCv6a5XFjn9m9qJv8nGSvbhVjamAWg
 mHdXvDCnuWXhd30vLCmg13W7ryiIppvrPq7fMWez494zpDbFOMlQDLoOwRdCsHpmVK
 fNZjoeke+ThTSDvKUprTYgTD4WhiW6w1DDa8TgPQ0qWElcpLsODYSFtKgYfD9swLNE
 5LuHrsjO1b4tnTPCe42qEgELSdKAAOz131izgpCoyowEiuUH1rn3FiFw/uFklLk9Zh
 KBdhmh98miM2Q==
Received: by mail-io1-f46.google.com with SMTP id r4so1979639iol.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:36:15 -0700 (PDT)
X-Gm-Message-State: AOAM531EBrznVLljsu8lo54kgJH3aiv9Tl7GMYxEgwnvw/5rE5mPEvGe
 S0/qu1YCTrQ2w6BW2pda8JHS8QwuwYymkSMW1Ao=
X-Google-Smtp-Source: ABdhPJy/mXkJVCvdeq/DzKWm7d6euHfmEfP1hs6djPIcQz4qO7uJsKLN55Yd2IKaNFbYd6h7OEJETU/0qqW//YOVjTo=
X-Received: by 2002:a05:6638:1202:: with SMTP id
 n2mr3174690jas.57.1622630174963; 
 Wed, 02 Jun 2021 03:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
 <YLZYuM6SepbeLcI7@phenom.ffwll.local> <YLZqe14Lf2+5Lbf3@kroah.com>
 <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
In-Reply-To: <YLZ2WJlHu0EZT7H9@phenom.ffwll.local>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 2 Jun 2021 18:36:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
Message-ID: <CAAhV-H5Mt7tmmDVoix6sY3UtfhjxGvHovve2N=5o5xtvmFeQOA@mail.gmail.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
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
Cc: David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel,

On Wed, Jun 2, 2021 at 2:03 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jun 01, 2021 at 07:12:27PM +0200, Greg KH wrote:
> > On Tue, Jun 01, 2021 at 05:56:40PM +0200, Daniel Vetter wrote:
> > > On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> > > > We should call vga_arb_device_init() after PCI enumeration, otherwise it
> > > > may fail to select the default VGA device. Since vga_arb_device_init()
> > > > and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> > > > both wrapped by subsys_initcall(), their sequence is not assured. So, we
> > > > use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> > > > device_init().
> >
> > Trying to juggle levels like this always fails if you build the code as
> > a module.
> >
> > Why not fix it properly and handle the out-of-order loading by returning
> > a "deferred" error if you do not have your resources yet?
>
> It's not a driver, it's kinda a bolted-on-the-side subsytem of pci. So not
> something you can -EPROBE_DEFER I think, without potentially upsetting the
> drivers that need this.
>
> Which might mean we should move this into pci subsystem proper perhaps?
> Then adding the init call at the right time becomes trivial since we just
> plug it in at the end of pci init.
>
> Also maybe that's how distros avoid this pain, pci is built-in, vgaarb is
> generally a module, problem solved.
>
> Bjorn, would you take this entire vgaarb.c thing? From a quick look I
> don't think it has a drm-ism in it (unlike vga_switcheroo, but that works
> a bit differently and doesn't have this init order issue).
Emmm, this patch cannot handle the hotplug case and module case, it
just handles the case that vgaarb, drm driver and pci all built-in.
But I think this is enough, because the original problem only happens
on very few BMC-based VGA cards (BMC doesn't set the VGA Enable bit on
the bridge, which breaks vgaarb).

Huacai
>
> Thoughts on this?
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
