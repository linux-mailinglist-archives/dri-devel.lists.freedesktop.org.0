Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3059679E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 05:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFF010E10A;
	Wed, 17 Aug 2022 03:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91FC10E06F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 03:04:39 +0000 (UTC)
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 108473FBAA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1660705476;
 bh=w6JV87LcGHoZetvO2mBofZg1S1pCy7Myl46GH8CQteM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=cNCHF25ed9qXbNiURc9j6pGtcOUFdlfB9Q5KgQiAlbJetOgX3UH8HzZcU+OcOFUxX
 UUGRokJVBnZEaQoAagt1L2mHz61ZtC6Aq3ztwyOoNa3bEmDr1q1liep3GfCjwUOGx+
 InjQTh1r5nE19zAhIUEDPs1iTv/xetS+ENvaRFownEmZID77ZsOhzUnqNFMvQtttOn
 xck7HnPMhmwvKXqcHny9kto1zeOC7Wu3SmQy1O1ULJ+c4IcY3W8p+YbLH1XOnIj9HH
 taz9/1mY24aPIOExGnWq/dN2zNvRDCSbcWagGyf67aVybnnEibqvZAw9TMOMz4SCiZ
 D0/DPQioNnm7A==
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1101032fd65so3354265fac.7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 20:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=w6JV87LcGHoZetvO2mBofZg1S1pCy7Myl46GH8CQteM=;
 b=Aag2fUO0n5Ay5Z+mx9S/XRtLxF46q5dS+H38EHfPCH8UlMzxMTcMcGFj2Jf7JS4bl+
 yZbNk7Stp9bm2hiM4PuPcRlhiWn+MEcS+ANdChNe2XrYuA88nzWxJ6K/QO4rYtmiABuh
 X0KyiIWtx+FPJzcucwB8JH33ahVLjfbOrvV+QRX3vxA9a7SF4nwl+qP8O3KerRbLVBpR
 Ey22pX/2rCtG8QjOFiM375M9d6pmkIjWTz5EdHf0S3zK4jXIzVD243dtmc4U3cMlUUiS
 j1UghLKWSLrPzpJ7s06M67exPgsOUEM3jYiKWCZsgRRWNWUDmrKTIP3khFKToYQm6Lzj
 17ng==
X-Gm-Message-State: ACgBeo2ssmlVVGXCIaz6vjagd+liIe2avDjiKJfKcUUWF9bwvNvIbk9H
 ck9jyYvCjLLvRJZQbjdPHEIQqR9tTNtCg/ymnS5v0iPhqo36cHGVzv5hsnOUPg8LJuAR2BjNiZd
 OG/1cBZ66jY/n+Dm4iDjDZSvDifeWS2t+jz9LpnyNopgz6UrvMgFUL7rwXm6qEg==
X-Received: by 2002:a05:6870:2111:b0:e6:8026:8651 with SMTP id
 f17-20020a056870211100b000e680268651mr757868oae.42.1660705474763; 
 Tue, 16 Aug 2022 20:04:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7plBkZI2auuJqWKlH2nBaLkbEGzTeN2uJ+wYFjEK1dkHBByzWoqZn+kuBGWbmq61vZO8UmSNKD/FZ2f7wPNQM=
X-Received: by 2002:a05:6870:2111:b0:e6:8026:8651 with SMTP id
 f17-20020a056870211100b000e680268651mr757847oae.42.1660705474408; Tue, 16 Aug
 2022 20:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
 <CAAd53p49X95MKrTDUq92LuHw3y2i09fUA2HEPzM1EcO8xO97Eg@mail.gmail.com>
 <CACO55tvgmb4Vog701idDYGuh125S9mjWPXhftxDMZ7hg-nQXBw@mail.gmail.com>
In-Reply-To: <CACO55tvgmb4Vog701idDYGuh125S9mjWPXhftxDMZ7hg-nQXBw@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 17 Aug 2022 11:04:21 +0800
Message-ID: <CAAd53p4W9rjmVJcUasy9hb1Yam+846+Oomvc2r9RMNmWeh_=0w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when it's supported
To: Karol Herbst <kherbst@redhat.com>
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 9:49 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 17, 2022 at 3:18 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > On Wed, Aug 17, 2022 at 2:50 AM Karol Herbst <kherbst@redhat.com> wrote=
:
> > >
> > > On Tue, Aug 16, 2022 at 4:53 AM Kai-Heng Feng
> > > <kai.heng.feng@canonical.com> wrote:
> > > >
> > > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can swit=
ch to
> > > > dGFX so external monitors are routed to dGFX, and more monitors can=
 be
> > > > supported as result.
> > > >
> > > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM functi=
on 20
> > > > on intel_dsm_guid2. This method is described in Intel document 6321=
07.
> > > >
> > >
> > > Can we please not do things like this just because?
> >
> > I there's a very good reason to support more external monitors,
> > especially when eDP is already 4K so iGPU don't have enough buffer for
> > more displays.
> >
>
> well.. they do have it. What's the limit? 3 or 4 4K displays with gen
> 11th+? I find conflicting information, but 3 4K displays are no
> problem. It might be if you get to higher refresh rates or something.
>
> I know that 2 work quite reliably and I know I can put even more on
> the Intel GPU.

More monitors can be supported via a thunderbolt dock.

>
> > >
> > > It forces the discrete GPU to be on leading to higher thermal pressur=
e
> > > and power consumption of the system. Lower battery runtime or higher
> > > fan noise is the result. Not everybody wants to use an AC simply just
> > > because they attach an external display.
> >
> > The system is designed in this way.
> >
>
> ?!? This makes no sense. If the discrete GPU is turned on, it means
> the system has to cool away more heat, because it consumes more power.
> It then causes louder fans. No idea how a "system design" can just go
> around simple physics...

The spec from HP [1] says:
Multi Display Support
Without HP Thunderbolt=E2=84=A2 Dock G2
UMA Graphics: Unit supports up to 4 independent displays. Any
combination of displays outputs may be used except one of
Thunderbolt=E2=84=A2 4 and HDMI.
Hybrid Graphics: Unit supports up 5 simultaneous displays (4 from dGPU
+ 1 from iGPU). Any combination of displays outputs may
be used except when using one USBC and HDMI are exclusive

With HP Thunderbolt=E2=84=A2 Dock G2
UMA Graphics: Unit supports up to 4 simultaneous displays. Any
combination of displays outputs may be used except one of
Thunderbolt=E2=84=A2 4 and HDMI.
Hybrid Graphics (NVIDIA): Unit supports up to 5 simultaneous displays
(4 from dGPU + 1 from iGPU). Any combination of displays
outputs may be used except when using one USBC and HDMI are exclusive
Hybrid Graphics (AMD): Unit supports up to 5 simultaneous displays (5
from dGPU + 1 from iGPU). Any combination of displays
outputs may be used except when using one USBC and HDMI are exclusive

So it's "designed" to use dGPU on the hybrid configs.

Let's hope the copper tubes have can dissipate the heat fast enough.

>
> Even the CPU consumes more power, because on some systems it prevents
> deeper package sleeping modes due to the active PCIe bridge
> controller.
>
> But if you have certain systems where you want to enable this behavior
> despite the drawbacks, maybe maintain a list of systems where to apply
> this method?

The behavior will be enabled only when _DSM function 20 is present.
So it's already a selected few.

>
> > And many (if not all) gaming laptops and mobile workstations use
> > discrete GPU for external monitors.
> > We just recently found out we have to use a switch to make it work.
> >
>
> yeah some do, and if people buy those, they already deal with loud
> fans and just accept this fact.
>
> Others might want silent fans... and why do you have to switch? Out of
> the box Intel GPUs support 3 4K displays. I want to see the general
> use case for 4 4K displays.

It's not for us to decide.
When a user buys a laptop according to the spec, the expectation is to
have those supported.

>
> So what systems are actually affected and do users have the option to
> disable it, if they prefer a more silent system?

Maybe adding a new i915 option to override the default behavior? But
it depends on i915 maintainers' opinion.

>
> > >
> > > If the problem is "we run out of displays" then can we have something
> > > more dynamic, where we are doing this only and only if we run out of
> > > resources to drive as that many displays.
> >
> > This is a boot-time switch, so it's not possible to switch it dynamical=
ly.
> >
>
> This makes it even worse.
>
> > >
> > > Most users will be fine with ports being driven by the iGPU. Why hurt
> > > most users, because of some weird special case with mostly only
> > > drawbacks?
> >
> > This is a use case that hardware vendor never bother to test.
> > And this is not a special case - the system is designed to use dGPU
> > for external monitors.
> >
> > Kai-Heng
> >
>
> so instead of hard wiring, they added a software switch to do the same th=
ing?

I think it's a TGL-H thing, to provide a way so discrete GPU can use
the generic TCSS. I don't know the reason though.

>
> And then don't bother to test both possibilities?

That's ODM and hardware vendors :)

>
> Anyway.. it doesn't make any sense and this opens up more questions
> than I initially had.
>
> I honestly still don't see the point here and still doubt that
> pleasing a handful of users is worth accepting the drawbacks.

Users may purchase the system based on the number of external monitors
it can support.
Besides, the drawbacks (if any) will only happen on systems with this
design (i.e. with _DSM function 20 supported).

>
> I also have no say if it comes to the i915 driver, but from a user
> perspective none of this makes much sense tbh.

It makes much sense for users that need more monitors.

[1] https://h20195.www2.hp.com/v2/GetDocument.aspx?docname=3Dc07606964

Kai-Heng


>
> > >
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_acpi.c | 18 +++++++++++++++++-
> > > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gp=
u/drm/i915/display/intel_acpi.c
> > > > index e78430001f077..3bd5930e2769b 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> > > > @@ -20,6 +20,7 @@ static const guid_t intel_dsm_guid =3D
> > > >                   0xa8, 0x54, 0x0f, 0x13, 0x17, 0xb0, 0x1c, 0x2c);
> > > >
> > > >  #define INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SUPPORTED 0 /* No args */
> > > > +#define INTEL_DSM_FN_DP_IN_SWITCH_TO_DGFX 20 /* No args */
> > > >
> > > >  static const guid_t intel_dsm_guid2 =3D
> > > >         GUID_INIT(0x3e5b41c6, 0xeb1d, 0x4260,
> > > > @@ -187,6 +188,7 @@ void intel_dsm_get_bios_data_funcs_supported(st=
ruct drm_i915_private *i915)
> > > >         struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
> > > >         acpi_handle dhandle;
> > > >         union acpi_object *obj;
> > > > +       int supported =3D 0;
> > > >
> > > >         dhandle =3D ACPI_HANDLE(&pdev->dev);
> > > >         if (!dhandle)
> > > > @@ -194,8 +196,22 @@ void intel_dsm_get_bios_data_funcs_supported(s=
truct drm_i915_private *i915)
> > > >
> > > >         obj =3D acpi_evaluate_dsm(dhandle, &intel_dsm_guid2, INTEL_=
DSM_REVISION_ID,
> > > >                                 INTEL_DSM_FN_GET_BIOS_DATA_FUNCS_SU=
PPORTED, NULL);
> > > > -       if (obj)
> > > > +       if (obj) {
> > > > +               if (obj->type =3D=3D ACPI_TYPE_INTEGER)
> > > > +                       supported =3D obj->integer.value;
> > > > +
> > > >                 ACPI_FREE(obj);
> > > > +       }
> > > > +
> > > > +       /* Tiger Lake H DP-IN Boot Time Switching from iGfx to dGfx=
 */
> > > > +       if (supported & BIT(20)) {
> > > > +               obj =3D acpi_evaluate_dsm(dhandle, &intel_dsm_guid2=
,
> > > > +                                       INTEL_DSM_REVISION_ID,
> > > > +                                       INTEL_DSM_FN_DP_IN_SWITCH_T=
O_DGFX,
> > > > +                                       NULL);
> > > > +               if (obj)
> > > > +                       ACPI_FREE(obj);
> > > > +       }
> > > >  }
> > > >
> > > >  /*
> > > > --
> > > > 2.36.1
> > > >
> > >
> >
>
