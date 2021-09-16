Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4791E40D479
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C2C6EAD9;
	Thu, 16 Sep 2021 08:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661966EAD9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:28:40 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id h132so2052326vke.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vur8QfWaufdfY19Gt5LsCkUbC6s2ER7D7arUmPtdWRs=;
 b=R6gEAW1JYqCdAV+yfPtAs6uwDqy9826JzfPDVTTFEA3Y4YLxwzZ8sf8QcK62edZS0u
 91BIFfx4U5+eHovn2KAJFJVkbiG7S6nmUTTW58f1MRXZe0Tib34hYXw5q0FdoVHaBOkL
 gsFRNVCXj/6rJapcvJflpwICJm0/HjQhWWsgRD+DXqqEXf2qy6DF+PfSjaVkArglA/hz
 MyF72bvVDzzwxzlidkDSc+9tFdacSbcz8i5+layOGOyAkEMl/fTy1nD6kJRH3IV1N3Fu
 5SUoKQ1yIOUVWpz5toEKSqzlLxwTZM0J6atIuy2HsZR221tQDA1gaH9goeNyNpW1s94+
 e9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vur8QfWaufdfY19Gt5LsCkUbC6s2ER7D7arUmPtdWRs=;
 b=qW9rsAvQie61PJbZuWDdgrM2IULD7SVCrbgsTnEAktLllPgESNUqqjJuvtfJazyarj
 Ua9+XYjCDpfInjmv6ugL/ldIS6yp96IUMdQ6r0yZ08D0o1Q2p5LHYa4chj/KyAn6zsuS
 5kiaqFGMEKyWad7QDB2Nysh/CtgZNsdx9oY31jIFn4secytJQvk2PPG4dp/W8q0s5F22
 +hQlBD7RXunkb/6wZ61ITiuiXkEUYYEQQ+DSrpcSh8Rd5PEhNlZdwI5+bxbebtDP4eoj
 p0N4qNJf3y/uf0WgCDRfNCQYvWTzruTnOLbwAS+PjQnMQEr+LtR7CarzPTJ3Lax8jDhy
 lRkg==
X-Gm-Message-State: AOAM533LtazLigwy/W1PpF2d85rplbr7rrsZfK3E1lU3oKW9eff0w3R1
 AAMHgtFYT6zSCrA3Al6zFFp/+tq77N0r/9B/fpI=
X-Google-Smtp-Source: ABdhPJy8vHapc9+y63iC6nMY8/0g/omaRe6qgxTgLi1fZNzKE/9cX98Z0KedDWcvoqMseewULrIdyeFGU03BcazBtFk=
X-Received: by 2002:a1f:7d4e:: with SMTP id y75mr3007128vkc.3.1631780919397;
 Thu, 16 Sep 2021 01:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210911093056.1555274-1-chenhuacai@loongson.cn>
 <20210914191847.GA1446332@bjorn-Precision-5520>
In-Reply-To: <20210914191847.GA1446332@bjorn-Precision-5520>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Thu, 16 Sep 2021 16:28:26 +0800
Message-ID: <CAAhV-H7HS3CULcCFZxbRnhg1-TV_ooFeGXSWLz9=4NuuOuJYtA@mail.gmail.com>
Subject: Re: [PATCH V5 00/11] PCI/VGA: Rework default VGA device selection
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-pci <linux-pci@vger.kernel.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Xuefeng Li <lixuefeng@loongson.cn>
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

On Wed, Sep 15, 2021 at 3:18 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Sat, Sep 11, 2021 at 05:30:45PM +0800, Huacai Chen wrote:
> > My original work is at [1].
> >
> > Current default VGA device selection fails in some cases:
> >
> >   - On BMC system, the AST2500 bridge [1a03:1150] does not implement
> >     PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
> >     legacy VGA resources won't reach downstream devices unless they're
> >     included in the usual bridge windows.
> >
> >   - vga_arb_select_default_device() will set a device below such a
> >     bridge as the default VGA device as long as it has PCI_COMMAND_IO
> >     and PCI_COMMAND_MEMORY enabled.
> >
> >   - vga_arbiter_add_pci_device() is called for every VGA device,
> >     either at boot-time or at hot-add time, and it will also set the
> >     device as the default VGA device, but ONLY if all bridges leading
> >     to it implement PCI_BRIDGE_CTL_VGA.
> >
> >   - This difference between vga_arb_select_default_device() and
> >     vga_arbiter_add_pci_device() means that a device below an AST2500
> >     or similar bridge can only be set as the default if it is
> >     enumerated before vga_arb_device_init().
> >
> >   - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
> >     which runs before vga_arb_device_init().
> >
> >   - On non-ACPI systems, like on MIPS system, they are enumerated by
> >     pcibios_init(), which typically runs *after*
> >     vga_arb_device_init().
> >
> > So I made vga_arb_update_default_device() to replace the current vga_
> > arb_select_default_device(), which will be call from vga_arbiter_add_
> > pci_device(), set the default device even if it does not own the VGA
> > resources because an upstream bridge doesn't implement PCI_BRIDGE_CTL_
> > VGA. And the default VGA device is updated if a better one is found
> > (device with legacy resources enabled is better, device owns the
> > firmware framebuffer is even better).
> >
> > Bjorn do some rework and extension in V2. It moves the VGA arbiter to
> > the PCI subsystem, fixes a few nits, and breaks a few pieces to make
> > the main patch a little smaller.
> >
> > V3 rewrite the commit log of the last patch (which is also summarized
> > by Bjorn).
> >
> > V4 split the last patch to two steps.
> >
> > V5 split big patches again and sort the patches.
>
> Not sure if I'm missing something, or if this is an interim version
> and you're working on a v6.
>
> From https://lore.kernel.org/r/20210909175926.GA996660@bjorn-Precision-5520,
> I was looking for:
>
>   BUT as I mentioned, I want the very first patch to be the very
>   simple 2-line change to vga_arb_update_default_device() that actually
>   fixes your problem.
>
> That doesn't seem to be what we have here.
I try my best to split patches. But it seems very difficult to achieve
the goal of "simple 2-line change" because I cannot break a single
functional change.  E.g., I think I can try to split Patch-5 again,
but Patch-6 seems impossible.

Huacai

>
> > All comments welcome!
> >
> > [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> >
> > Bjorn Helgaas (4):
> >   PCI/VGA: Move vgaarb to drivers/pci
> >   PCI/VGA: Remove empty vga_arb_device_card_gone()
> >   PCI/VGA: Use unsigned format string to print lock counts
> >   PCI/VGA: Replace full MIT license text with SPDX identifier
> >
> > Huacai Chen (7):
> >   PCI/VGA: Prefer vga_default_device()
> >   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
> >   PCI/VGA: Split out vga_arb_update_default_device()
> >   PCI/VGA: Update default VGA device if a better one found
> >   PCI/VGA: Update default VGA device again for X86/IA64
> >   PCI/VGA: Remove vga_arb_select_default_device()
> >   PCI/VGA: Log bridge control messages when adding devices
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  drivers/gpu/vga/Kconfig           |  19 ---
> >  drivers/gpu/vga/Makefile          |   1 -
> >  drivers/pci/Kconfig               |  19 +++
> >  drivers/pci/Makefile              |   1 +
> >  drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
> >  5 files changed, 126 insertions(+), 183 deletions(-)
> >  rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
> > --
> > 2.27.0
> >
