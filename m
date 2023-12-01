Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD9800CF8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 15:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C6310E8B0;
	Fri,  1 Dec 2023 14:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90E910E8B0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 14:16:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 682BBCE26A1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 14:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7ED5C433C7
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701440210;
 bh=MJQPrjEbwnWoXRgfWZMLIA19K+UrEYt4GGLLJInlnkw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VAoqrfB2+2J4i4OGNP/3tHLhCaStYAJg2OWwtGZ7ghy+SXR5LCpWIcvdBLm90tp9f
 8Wfa2u30Z7n4sxrmBwmQCx2493wxi7ZGRgKpacU9qPTk9yevf/brhE7u+stHfyEfUD
 lFN2R6uGZ6At7QK6/13kngH7xGIMMQ92/VyI1zrtez5/SIgbF346XmhW/3CPUT8s4K
 73u41AZzdgvO9CKY7IqyKhCGzqQcbHc5ELkb/xLM15CrhdbVGEiqNWXgxTcIS3BxTy
 jrvlzpxi/hybq4kv2iOI6hzr/CtbAIgotLHRbb3uBw3IfxqCGQENFPMMiFTnyMf7Lk
 x3gtHSaJ7IwWA==
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-50bdebb1786so281411e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 06:16:50 -0800 (PST)
X-Gm-Message-State: AOJu0Yx/okhNl85RtD6Y18ilk+r/iNLwbAgnxtaidLuQOdOj8Z3RCGtN
 WmzW4P6lwl8Qs3dFJFaiY0Kh25dB3XsscFStEg==
X-Google-Smtp-Source: AGHT+IFvdXLlccvsGinrIBKW4A0GOxFYg+cmQXKwotpjG+QcEogIvSJGIwTd8+Y3Cma0S4B2G66D47ghVfowf1JtDjU=
X-Received: by 2002:a19:430d:0:b0:50b:e03b:ebc7 with SMTP id
 q13-20020a19430d000000b0050be03bebc7mr83514lfa.20.1701440208798; Fri, 01 Dec
 2023 06:16:48 -0800 (PST)
MIME-Version: 1.0
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
From: Rob Herring <robh@kernel.org>
Date: Fri, 1 Dec 2023 08:16:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
Message-ID: <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
To: Javier Martinez Canillas <javierm@redhat.com>
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
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Frank Rowand <frowand.list@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 1, 2023 at 4:21=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> > Hi
> >
> > Am 18.11.23 um 12:10 schrieb Javier Martinez Canillas:
> >> Ard Biesheuvel <ardb@kernel.org> writes:
> >>
> >> Hello Ard,
> >>
> >>> On Fri, 17 Nov 2023 at 00:09, Rob Herring <robh@kernel.org> wrote:
> >>
> >> [...]
> >>
> >>>>>>
> >>>>>> This could also lead to an interesting scenario. As simple-framebu=
ffer
> >>>>>> can define its memory in a /reserved-memory node, but that is igno=
red
> >>>>>> in EFI boot. Probably would work, but only because EFI probably
> >>>>>> generates its memory map table from the /reserved-memory nodes.
> >>>>>>
> >>>>>
> >>>>> I see. So what would be the solution then? Ignoring creating a plat=
form
> >>>>> device for "simple-framebuffer" if booted using EFI and have an EFI=
-GOP?
> >>>>
> >>>> Shrug. I don't really know anything more about EFI FB, but I would
> >>>> guess it can't support handling resources like clocks, power domains=
,
> >>>> regulators, etc. that simple-fb can. So if a platform needs those, d=
o
> >>>> we say they should not setup EFI-GOP? Or is there a use case for
> >>>> having both? Clients that don't muck with resources can use EFI-GOP
> >>>> and those that do use simple-fb. For example, does/can grub use
> >>>> EFI-GOP, but not simple-fb?
> >>>>
> >>>
> >>> The EFI GOP is just a dumb framebuffer, and it is not even generally
> >>> possible to cross reference the GOP with a particular device in the
> >>> device hierarchy unless you e.g., compare the BARs of each device wit=
h
> >>> the region described by the GOP protocol.
> >>>
> >>> GRUB for EFI will use the GOP and nothing else, but only at boot time
> >>> (the GOP protocol is more than a magic linear memory region, it also
> >>> implements a Blt() abstraction that permits the use of framebuffers
> >>> that are not mapped linearly into the address space at all, and GRUB
> >>> makes use of this)
> >>>
> >>> The EFI stub will only expose GOPs to the kernel if they are in fact
> >>> linear framebuffers, but has zero insight into whether the hardware
> >>> needs clocks and regulators, and whether or not the framebuffer needs
> >>> IOMMU pass through (which might be the case if the scanout is using
> >>> DMA into system memory)
> >>>
> >>> So calling EFI GOP 'source of truth' is rather generous, and I think
> >>> it makes sense to prioritize more accurate descriptions of the
> >>> underlying framebuffer over EFI GOP.
> >>>
> >>
> >> That was my opinion as well and the reason why I called the DTB the
> >> single source of truth.
> >>
> >>> However, making 'simple-framebuffer' magic in this regard doesn't see=
m
> >>> like a great approach to me. Is there a better way we could get the
> >>> resource conflict to be decided in a way where the EFI GOP gets
> >>> superseded if its resources are claimed by another device?
> >>>
> >>
> >> There is an aperture [0] framework that is used by the fbdev and DRM
> >> subsystems to allow native drivers to remove any conflicting devices
> >> that share the same framebuffer aperture.
> >>
> >> But it only makes sense for native drivers to use that I think, but
> >> in this case is about two drivers that attempt to use the same frame
> >> buffer provided by the firmware but getting it from different places.
> >>
> >> I don't have a better idea than this patch but maybe Thomas or Sima do=
?
> >
> > At SUSE, we've carried such a patch in our repos for some time. It work=
s
> > around the double-framebuffer problem in a similar way. [1]
> >
>
> Thanks for the information. I see that your patch is basically mine but
> doing it unconditionally while this one only does the sysfb_disable() if
> a "simple-framebuffer" DT node has been found.
>
> > As Javier mentioned, we do track the framebuffer ranges for EFI/VESA/OF
> > framebuffers in the graphics aperture helpers. Fbdev has done this for
> > decades, and the current codebase extends and harmonizes this
> > functionality among fbdev and DRM drivers.
> >
> > WRT DT vs EFI: AFAIK the EFI support on affected platforms looks at the
> > DT to set up the EFI framebuffer. So IMHO the DT is the authoritative
> > source on the framebuffer.
> >
>
> Agreed. Sima Vetter also mentioned on IRC that they think this patch is
> the least bad option. Rob, Ard any thoughts? Maybe we can land this as
> a fix and then figure how this could be better handled in the long term?

What about moving the DT setup code here to sysfb? Then we just setup
the right thing up front.

However, there might be one other issue with that and this fix. The DT
simplefb can have resources such as clocks and regulators. With
fw_devlink, the driver won't probe until those dependencies are met.
So if you want the framebuffer console up early, then you may want to
register the EFI framebuffer first and then handoff to the DT simplefb
when it probes (rather than registering the device).

But I agree, probably better to take this patch now and have those
quirks instead of flat out not working.

Rob
