Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA1463DC2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 19:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AF16E2ED;
	Tue, 30 Nov 2021 18:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 82524 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 18:25:17 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F32E6E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:25:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9D48ECE1AFD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C027BC53FD2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638296713;
 bh=I558V0JgsXljEVAcQXHf/PeyIwz8vKpCjcthI+bmzOg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ok5mkNkNfVwqfLLKxswXXEe/YB6OdY2s3GVITXE41NWzE2KfCfyBbxS+3dSpiq/G3
 aCXiOl6WHQq5OwXgR6OUzlEpiOtN4NB8DQDkM/CMd9RHKTPINhJMPXzMB6NT8PcFPu
 S9DRJ5otUZnkyyhgQ+b+SVrCl9t4Gr3Le/bqcQwCuG6JIfL02c9sC+8mSAphw8FWWX
 isdXyWbnv/Eyn+7g3eklet6sutqt6/lQgyQ96P3URbC4zryr7AvzVejIhlTyAWVXzQ
 Z6+zR8jTRrkX8jvme0KWE8ahFiCOsM0Mx9nIAdaLLBL/w1KqGGbbZBkxrbiftqH7MX
 jY9g4j7Z47yIQ==
Received: by mail-ed1-f50.google.com with SMTP id v1so90463548edx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 10:25:13 -0800 (PST)
X-Gm-Message-State: AOAM530iqt0FhbRiaSrT/pfYQeVbZ+ozGYmp350CNLzqlpDmZLOLtn/d
 ZnzfVzQ+DsVtRw/If9pioydDigvkPnqkqha2lw==
X-Google-Smtp-Source: ABdhPJy+uJ3QVXrQFnJdxIORaNgPpu6gm5253sxa9hphGM8Vf5FmWVsu5u0W+x+HwYttlOZwa9H0rmWNKyMP7sPSC8w=
X-Received: by 2002:a05:6402:35ce:: with SMTP id
 z14mr888825edc.197.1638296712088; 
 Tue, 30 Nov 2021 10:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-2-marcan@marcan.st>
 <f3582c00-925d-91ec-c829-0aaa8f0157c0@suse.de>
 <36f3cf18-6654-e1bf-1fa6-a5797751ee86@marcan.st>
 <CAL_JsqLd=NrZgkTw+N2+Ka4zqRVpZMRNSisUDV9MhBQA-0TZQg@mail.gmail.com>
 <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
In-Reply-To: <CABxcv=mkuJLrXr_nbELg39qJvUvV2y69FAisFKURR9bqa3FzKg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 30 Nov 2021 12:25:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJr5LYkWafLB0+Voo6pKDbRSF9QaDfavKNvSP0FXcSAkw@mail.gmail.com>
Message-ID: <CAL_JsqJr5LYkWafLB0+Voo6pKDbRSF9QaDfavKNvSP0FXcSAkw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/simpledrm: Bind to OF framebuffers in /chosen
To: Javier Martinez Canillas <javier@dowhile0.org>
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
Cc: David Airlie <airlied@linux.ie>, Hector Martin <marcan@marcan.st>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 30, 2021 at 12:45 AM Javier Martinez Canillas
<javier@dowhile0.org> wrote:
>
> > > >
> > > > Simpledrm is just a driver, but this is platform setup code. Why is this
> > > > code located here and not under arch/ or drivers/firmware/?
> > > >
>
> Agreed. Creating platform devices is something for platform code and
> not really a DRM driver.
>
> > > > I know that other drivers do similar things, it doesn't seem to belong here.
> > >
>
> Yeah, the simplefb driver does this but that seems like something that
> should be changed.
>
> > > This definitely doesn't belong in either of those, since it is not arch-
> > > or firmware-specific. It is implementing support for the standard
> > > simple-framebuffer OF binding, which specifies that it must be located
> > > within the /chosen node (and thus the default OF setup code won't do the
> > > matching for you); this applies to all OF platforms [1]
> > >
> > > Adding Rob; do you think this should move from simplefb/simpledrm to
> > > common OF code? (where?)
> >
> > of_platform_default_populate_init() should work.
>
> That should work but I still wonder if it is the correct place to add
> this logic.

It is because that is where most of the other devices are created
unless the bus handles it.

> I think that instead it could be done in the sysfb_create_simplefb()
> function [0], which already creates the "simple-framebuffer" device
> for x86 legacy BIOS and x86/arm64/riscv EFI so it makes sense to do
> the same for OF. That way the simplefb platform device registration
> code could also be dropped from the driver and users would just need
> to enable CONFIG_SYSFB and CONFIG_SYSFB_SIMPLEFB to have the same.

Doesn't look like that would share anything with anything else (BIOS/EFI/ACPI).

Rob
