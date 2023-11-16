Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D127EE2D7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0719E10E5F7;
	Thu, 16 Nov 2023 14:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832C010E5F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0FDB61A3E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B293BC433CA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700145065;
 bh=nkr6WoisDwyKnThmymGE20Y09erBdJh/ybpDhjAfA4M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=drQJwxo0EHLXhOCm+VbfX6mHYLg9T+UjlT90OMVHW5p7qFKf8arFFgvv4FhxF/ImW
 zz4R09GsjLW7FLHd8ltROQ9JQBch1GSrUnQVmVtHE5kOOMy3DvpD8v4PuX5NnGw30X
 tbNspDUPYpqmLZFUFnenCUuckv/T2r7amqKTUzbD7j2vZWxYImE6dYrVXziYp5qFYD
 vW24Uh/jnh+43It8pvdTL5ZrlpfIpmG4hfm6ws7rZPjCcaDqm/aG5RnGUdqfIdVcLI
 M4D/48wZNb3/3zWcMpUJPpoa7fBFi9cBzxQfWU+CnI0kCsp4s0bWUHPdtMeHACQj9+
 j3T2tebQo95BA==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so10987241fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:31:05 -0800 (PST)
X-Gm-Message-State: AOJu0Yz/DcryIjgRGM54Hj9MoLRQLDPrCoDr/bjI4j+YG7ryjXG+xWuL
 ISyOSdoIfq6Z7FhGazGfuIddGGObiXZb/jO6OaM=
X-Google-Smtp-Source: AGHT+IFvbKXaSm314e6lcbPOKqiwTPtyKVhULP1MOCxG7yT7+11mplpz7UKvlhvlrsKbUEYALYELh1nn4NbEf+5s/xc=
X-Received: by 2002:a05:651c:3cf:b0:2c5:3e:6bdb with SMTP id
 f15-20020a05651c03cf00b002c5003e6bdbmr6334354ljp.32.1700145063865; Thu, 16
 Nov 2023 06:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
In-Reply-To: <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Nov 2023 00:30:51 +1000
X-Gmail-Original-Message-ID: <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
Message-ID: <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Hector Martin <marcan@marcan.st>,
 Andrew Worsley <amworsley@gmail.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Nov 2023 at 00:09, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 16, 2023 at 3:36=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > Rob Herring <robh@kernel.org> writes:
> >
> > Hello Rob,
> >
> > > On Mon, Nov 13, 2023 at 2:53=E2=80=AFAM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > >>
> > >> Some DT platforms use EFI to boot and in this case the EFI Boot Serv=
ices
> > >> may register a EFI_GRAPHICS_OUTPUT_PROTOCOL handle, that will later =
be
> > >> queried by the Linux EFI stub to fill the global struct screen_info =
data.
> > >>
> > >> The data is used by the Generic System Framebuffers (sysfb) framewor=
k to
> > >> add a platform device with platform data about the system framebuffe=
r.
> > >>
> > >> But if there is a "simple-framebuffer" node in the DT, the OF core w=
ill
> > >> also do the same and add another device for the system framebuffer.
> > >>
> > >> This could lead for example, to two platform devices ("simple-frameb=
uffer"
> > >> and "efi-framebuffer") to be added and matched with their correspond=
ing
> > >> drivers. So both efifb and simpledrm will be probed, leading to foll=
owing:
> > >>
> > >> [    0.055752] efifb: framebuffer at 0xbd58dc000, using 16000k, tota=
l 16000k
> > >> [    0.055755] efifb: mode is 2560x1600x32, linelength=3D10240, page=
s=3D1
> > >> [    0.055758] efifb: scrolling: redraw
> > >> [    0.055759] efifb: Truecolor: size=3D2:10:10:10, shift=3D30:20:10=
:0
> > >> ...
> > >> [    3.295896] simple-framebuffer bd58dc000.framebuffer: [drm] *ERRO=
R*
> > >> could not acquire memory range [??? 0xffff79f30a29ee40-0x2a5000001a7
> > >> flags 0x0]: -16
> > >> [    3.298018] simple-framebuffer: probe of bd58dc000.framebuffer
> > >> failed with error -16
> > >>
> > >> To prevent the issue, make the OF core to disable sysfb if there is =
a node
> > >> with a "simple-framebuffer" compatible. That way only this device wi=
ll be
> > >> registered and sysfb would not attempt to register another one using=
 the
> > >> screen_info data even if this has been filled.
> > >>
> > >> This seems the correct thing to do in this case because:
> > >>
> > >> a) On a DT platform, the DTB is the single source of truth since is =
what
> > >>    describes the hardware topology. Even if EFI Boot Services are us=
ed to
> > >>    boot the machine.
> > >
> > > This is the opposite of what we do for memory and memory reservations=
.
> > > EFI is the source of truth for those.
> > >
> > > This could also lead to an interesting scenario. As simple-framebuffe=
r
> > > can define its memory in a /reserved-memory node, but that is ignored
> > > in EFI boot. Probably would work, but only because EFI probably
> > > generates its memory map table from the /reserved-memory nodes.
> > >
> >
> > I see. So what would be the solution then? Ignoring creating a platform
> > device for "simple-framebuffer" if booted using EFI and have an EFI-GOP=
?
>
> Shrug. I don't really know anything more about EFI FB, but I would
> guess it can't support handling resources like clocks, power domains,
> regulators, etc. that simple-fb can. So if a platform needs those, do
> we say they should not setup EFI-GOP? Or is there a use case for
> having both? Clients that don't muck with resources can use EFI-GOP
> and those that do use simple-fb. For example, does/can grub use
> EFI-GOP, but not simple-fb?
>

The EFI GOP is just a dumb framebuffer, and it is not even generally
possible to cross reference the GOP with a particular device in the
device hierarchy unless you e.g., compare the BARs of each device with
the region described by the GOP protocol.

GRUB for EFI will use the GOP and nothing else, but only at boot time
(the GOP protocol is more than a magic linear memory region, it also
implements a Blt() abstraction that permits the use of framebuffers
that are not mapped linearly into the address space at all, and GRUB
makes use of this)

The EFI stub will only expose GOPs to the kernel if they are in fact
linear framebuffers, but has zero insight into whether the hardware
needs clocks and regulators, and whether or not the framebuffer needs
IOMMU pass through (which might be the case if the scanout is using
DMA into system memory)

So calling EFI GOP 'source of truth' is rather generous, and I think
it makes sense to prioritize more accurate descriptions of the
underlying framebuffer over EFI GOP.

However, making 'simple-framebuffer' magic in this regard doesn't seem
like a great approach to me. Is there a better way we could get the
resource conflict to be decided in a way where the EFI GOP gets
superseded if its resources are claimed by another device?
