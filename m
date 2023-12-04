Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E28035FA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C3C10E256;
	Mon,  4 Dec 2023 14:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88910E1DC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:05:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C4D96B80E9C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24221C433D9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701698727;
 bh=MikWwilY6AlAEwPb9n44T6+u3WbTD+M+d4po/lQ5HnM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=amMSqmlL1JlBBzMHA2Naxsq67iDGHlfBCYjsbioFEsOFfxOlM2DrNMd0I+MxfH33P
 msSS2fIf8o21zKhKOvXpH06Y86QrA0fjnnD/Xpe5Wwpc4XrvwFznpjQtbOCZkAUQV0
 0kI4T/HnGzFPrNcTUbjm+UuODnTv2Vu6mD6WdSUN58fNjsqoFM6BNk6u9NGspoKAX4
 UKaSkPZ2q2rDd2y/ZM9TerSzNkj9cXl0uLNTu5T0WAXP5BXgVnaLKlKFLQmjxUVtUw
 WbxdMpUWrEhtyEt47lrOZcWUrR4RA6x6uxtDHTfMmz1BxeZmMUCcrNWFmm+iD5Nyd8
 PutoXb93DphXQ==
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50bf32c0140so1359201e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 06:05:27 -0800 (PST)
X-Gm-Message-State: AOJu0Yyxo7cGaB9oXGjF1ADaMr3ThpWFMs8mTb/ftMFRLdG34AG2qEPb
 ttuHyhNXTsMfqv8oskz/TiQwi4l9uQR5R8rObg==
X-Google-Smtp-Source: AGHT+IE5kTtQJLXuKdrxlPmdCTmbrcAAy4/rUzJktaFpe9bUJogKNHvbwii0IAMZsoCpZA1Brc80S1YhpluawsSPzCI=
X-Received: by 2002:a05:6512:2250:b0:50b:ffb3:5ca with SMTP id
 i16-20020a056512225000b0050bffb305camr133278lfu.116.1701698725294; Mon, 04
 Dec 2023 06:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20231113085305.1823455-1-javierm@redhat.com>
 <CAL_JsqKHTN5hfd4qpg5RXbmQLKZNVywDkSj9mxvfGmjrcChQQg@mail.gmail.com>
 <87jzqi59bt.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJM9+cbNviwuKGB5+3YbyAP3UH+TxCxsU5nUtX-iRGP2w@mail.gmail.com>
 <CAMj1kXG7Xyk0ys9j-XRo7Rr8gYz1qJE8fFSixBOwVbm-pjeX+A@mail.gmail.com>
 <874jhj1fm3.fsf@minerva.mail-host-address-is-not-set>
 <58672ab8-99bf-4a2a-af79-031d1e8fcba0@suse.de>
 <87fs0mxlyp.fsf@minerva.mail-host-address-is-not-set>
 <CAL_JsqJbZ736iV+bRbSNNaimkbJLpB9MbeKLSct16Yi67ttFcw@mail.gmail.com>
 <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5qqxq56.fsf@minerva.mail-host-address-is-not-set>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Dec 2023 08:05:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
Message-ID: <CAL_Jsq+7AwuLt9pfX0zr8g=65zSVLUFzFds82ENaspEFQNK=gg@mail.gmail.com>
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

On Mon, Dec 4, 2023 at 3:39=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Rob Herring <robh@kernel.org> writes:
>
> Hello Rob,
>
> > On Fri, Dec 1, 2023 at 4:21=E2=80=AFAM Javier Martinez Canillas
>
> [...]
>
> >> >> I don't have a better idea than this patch but maybe Thomas or Sima=
 do?
> >> >
> >> > At SUSE, we've carried such a patch in our repos for some time. It w=
orks
> >> > around the double-framebuffer problem in a similar way. [1]
> >> >
> >>
> >> Thanks for the information. I see that your patch is basically mine bu=
t
> >> doing it unconditionally while this one only does the sysfb_disable() =
if
> >> a "simple-framebuffer" DT node has been found.
> >>
> >> > As Javier mentioned, we do track the framebuffer ranges for EFI/VESA=
/OF
> >> > framebuffers in the graphics aperture helpers. Fbdev has done this f=
or
> >> > decades, and the current codebase extends and harmonizes this
> >> > functionality among fbdev and DRM drivers.
> >> >
> >> > WRT DT vs EFI: AFAIK the EFI support on affected platforms looks at =
the
> >> > DT to set up the EFI framebuffer. So IMHO the DT is the authoritativ=
e
> >> > source on the framebuffer.
> >> >
> >>
> >> Agreed. Sima Vetter also mentioned on IRC that they think this patch i=
s
> >> the least bad option. Rob, Ard any thoughts? Maybe we can land this as
> >> a fix and then figure how this could be better handled in the long ter=
m?
> >
> > What about moving the DT setup code here to sysfb? Then we just setup
> > the right thing up front.
> >
>
> Right now sysfb is pretty platform agnostic, in the sense that just looks
> at the screen_info global struct and uses it to add the platform data tha=
t
> contains the firmware provided framebuffer.
>
> How the screen_info was filled (e.g: by the Linux EFI stub using the GOP
> or the x86 early boot code using VESA) is transparent to sysfb. For this
> reason adding platform specific logic there, like finding OF nodes, is no=
t
> desirable.
>
> I also suggested to Thomas to move the DT setup code to sysfb but he said
> that would be the wrong approach for the reason mentioned above. Please
> correct me Thomas if I'm misremembering here.
>
> > However, there might be one other issue with that and this fix. The DT
> > simplefb can have resources such as clocks and regulators. With
> > fw_devlink, the driver won't probe until those dependencies are met.
> > So if you want the framebuffer console up early, then you may want to
> > register the EFI framebuffer first and then handoff to the DT simplefb
> > when it probes (rather than registering the device).
> >
> > But I agree, probably better to take this patch now and have those
> > quirks instead of flat out not working.
> >
>
> If we do that what's the plan? Are you thinking about merging this patch
> through your OF tree or do you want to go through drm-misc with your ack?

I can take it. Do we need this in 6.7 and stable?

Rob
