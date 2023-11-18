Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0E7EFF2B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 12:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7D210E008;
	Sat, 18 Nov 2023 11:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218A410E008
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700305851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zcW40Pm/C2VhC3hYpvH2rN7+M3PaPEN3Ao5G1XKi4yM=;
 b=hVodhAXKwVyNOc9iwIrLn6/Kc5Sse02Lp2JaJ7rDHmnLSoKtwhSVn4xV+TNpyWWL9cp9wf
 j3pIKQln1Bh9n1YqA8++zQUdNdY+EEp85neMsGqGMSZYUhXrLgw28Wzig89LbNThCnJvRk
 T5RPJoAXbiTVAVVBZ3OUJHcNPGO/mCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-_OYGVw9lMnOAE9fgSoUQPw-1; Sat, 18 Nov 2023 06:10:47 -0500
X-MC-Unique: _OYGVw9lMnOAE9fgSoUQPw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32f798bc811so1499381f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 03:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700305846; x=1700910646;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcW40Pm/C2VhC3hYpvH2rN7+M3PaPEN3Ao5G1XKi4yM=;
 b=q6Xj26pbtIbvm/4KIZtaT4tMFPeIM63rk5KuUEzCb94iHsa6KN/MqUoPxZbp13w2x4
 /U9NuPNqTUc2sskQ3cLhiEVPGOlknAJmUe30wFdjsLXNb90LUf6XjT/47b6UXs/Rw3z7
 tDPSm/Bnbra/AdxIaDXvB7j/rT9IUgn7ogj7VZ//o09aiKJChvsSdg4vhvQASYSWFHO9
 BNldQV+lOdwt8JEN3Ze4m0BipKlFp8kWg0Wpw3uaGNbUHeP/0urplhMt9+Iii+zOj0FG
 V95dAQl2dT8CvfN0uMFOiWVLDQbJ4yaqBt1E8hZRfk1WFkAS9Ff4nD9PybfnceX3Fvc/
 wzKg==
X-Gm-Message-State: AOJu0YykQBQBOn3qh/bigom6pj8ui2ssBC1f8cp/KFauu8H2KQzn/57X
 6VLKP9ekbeeRLw0FOea84dMDjPTwfYsmt6vlblU7OC9XaOmDu8fTQKYYMgwsZ6Tp5FOSvxVnsc3
 a7AfBNuQj9jMTUxScY3yWnMxXqr7/
X-Received: by 2002:adf:ef92:0:b0:32d:9cdd:a23 with SMTP id
 d18-20020adfef92000000b0032d9cdd0a23mr1563658wro.25.1700305846398; 
 Sat, 18 Nov 2023 03:10:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5Qbad3a6WzEcATGME42HhfaqZx1bG/yleXweOgoccNqiDLr2I5NcRH9p1kx3aG3lak43/aA==
X-Received: by 2002:adf:ef92:0:b0:32d:9cdd:a23 with SMTP id
 d18-20020adfef92000000b0032d9cdd0a23mr1563650wro.25.1700305845984; 
 Sat, 18 Nov 2023 03:10:45 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o6-20020a5d4086000000b003316e684c5esm2950657wrp.79.2023.11.18.03.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 03:10:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH] of/platform: Disable sysfb if a simple-framebuffer
 node is found
In-Reply-To: <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
Date: Sat, 18 Nov 2023 12:10:44 +0100
Message-ID: <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ard Biesheuvel <ardb@kernel.org> writes:

Hello Ard,

> On Fri, 17 Nov 2023 at 00:09, Rob Herring <robh@kernel.org> wrote:

[...]

>> > >
>> > > This could also lead to an interesting scenario. As simple-framebuffer
>> > > can define its memory in a /reserved-memory node, but that is ignored
>> > > in EFI boot. Probably would work, but only because EFI probably
>> > > generates its memory map table from the /reserved-memory nodes.
>> > >
>> >
>> > I see. So what would be the solution then? Ignoring creating a platform
>> > device for "simple-framebuffer" if booted using EFI and have an EFI-GOP?
>>
>> Shrug. I don't really know anything more about EFI FB, but I would
>> guess it can't support handling resources like clocks, power domains,
>> regulators, etc. that simple-fb can. So if a platform needs those, do
>> we say they should not setup EFI-GOP? Or is there a use case for
>> having both? Clients that don't muck with resources can use EFI-GOP
>> and those that do use simple-fb. For example, does/can grub use
>> EFI-GOP, but not simple-fb?
>>
>
> The EFI GOP is just a dumb framebuffer, and it is not even generally
> possible to cross reference the GOP with a particular device in the
> device hierarchy unless you e.g., compare the BARs of each device with
> the region described by the GOP protocol.
>
> GRUB for EFI will use the GOP and nothing else, but only at boot time
> (the GOP protocol is more than a magic linear memory region, it also
> implements a Blt() abstraction that permits the use of framebuffers
> that are not mapped linearly into the address space at all, and GRUB
> makes use of this)
>
> The EFI stub will only expose GOPs to the kernel if they are in fact
> linear framebuffers, but has zero insight into whether the hardware
> needs clocks and regulators, and whether or not the framebuffer needs
> IOMMU pass through (which might be the case if the scanout is using
> DMA into system memory)
>
> So calling EFI GOP 'source of truth' is rather generous, and I think
> it makes sense to prioritize more accurate descriptions of the
> underlying framebuffer over EFI GOP.
>

That was my opinion as well and the reason why I called the DTB the
single source of truth.

> However, making 'simple-framebuffer' magic in this regard doesn't seem
> like a great approach to me. Is there a better way we could get the
> resource conflict to be decided in a way where the EFI GOP gets
> superseded if its resources are claimed by another device?
>

There is an aperture [0] framework that is used by the fbdev and DRM
subsystems to allow native drivers to remove any conflicting devices
that share the same framebuffer aperture.

But it only makes sense for native drivers to use that I think, but
in this case is about two drivers that attempt to use the same frame
buffer provided by the firmware but getting it from different places.

I don't have a better idea than this patch but maybe Thomas or Sima do?

[0]: https://elixir.bootlin.com/linux/latest/source/drivers/video/aperture.c

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

