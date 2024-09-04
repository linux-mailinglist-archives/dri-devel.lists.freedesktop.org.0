Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117696BE22
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E98910E06A;
	Wed,  4 Sep 2024 13:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JQ6Bxug5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E0D10E06A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:19:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CEF3AA4430E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A964EC4CECB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725455943;
 bh=iQaWUuNayeHsxNpsOPsmiP87PVA1V+997ba5NP2/0SM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JQ6Bxug5FhdirKhlMS1LzSU6cK2X+gpcfN6ByVYAKVerwhVesNzvrzk0mC/HPIQc0
 lQeDy1hGLjolv05LmG5ykgFQF5d6Csmed1Du/0yr4libZAqzSKaFy72YuH8D5wEOjc
 q0Wps9kL5iFimSZABpuFj6y/taVXrJikZTmh51N0mGc4NCY33V/RjPSmvat2IUUagC
 CpBY4mQDVvwk0AGtdC6DSgoDQQ6O2ZMjrL6c31qkSC0R3WtH5Nxo7phd2VGZaG82mF
 SDgXXFMn//JMH+FxWYwg9KeDtYzH10fCmRjIIb8RoBINE+W53/7ITOlT4cHONZq8lK
 rZE3TmElDEsxA==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f4f505118fso74319841fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 06:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUM6TPwlGsncZJ10cAjinKiMd5i91HpV8ZWJk3UmGHLSf1wqrBN6CvDSkuA1Ftvt4/c0BQTPpLe3VM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws9ifwfd+YPa08nQOoSFHPA0NJmjvuHvPcGwAJIJ84ASaiFUUG
 1rIpPnOOp9sBG5mTUL6RMqZwSWx7wWu+RXO8WpS3twOvAMEslN/EVPTXwalI+rgVLI2INAQScee
 ffrzckkkDLoReM4dJmuxLiEAOtw==
X-Google-Smtp-Source: AGHT+IHUUeSgzSozkOQHj26+7oHV3+xzw+ZQjg6TFrBfWOYCsaBdvEQOe4/S7wY/3OtormH15qUALYau8GIPppWD+UI=
X-Received: by 2002:a2e:bc0b:0:b0:2ef:251f:785 with SMTP id
 38308e7fff4ca-2f6265503femr113203391fa.1.1725455942007; Wed, 04 Sep 2024
 06:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
 <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
 <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
In-Reply-To: <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Sep 2024 08:18:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
Message-ID: <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
Subject: Re: [PATCH] drm: vc4: Use of_property_present()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 4, 2024 at 6:18=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Rob
>
> On Tue, 3 Sept 2024 at 20:19, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> > >
> > > Use of_property_present() to test for property presence rather than
> > > of_find_property(). This is part of a larger effort to remove callers
> > > of of_find_property() and similar functions. of_find_property() leaks
> > > the DT struct property and data pointers which is a problem for
> > > dynamically allocated nodes which may be freed.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Ping!
>
> Sorry, this fell through the cracks.
>
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index d57c4a5948c8..049de06460d5 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi =
*vc4_hdmi)
> > >         struct device *dev =3D &vc4_hdmi->pdev->dev;
> > >         struct platform_device *codec_pdev;
> > >         const __be32 *addr;
> > > -       int index, len;
> > > +       int index;
> > >         int ret;
> > >
> > >         /*
> > > @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi =
*vc4_hdmi)
> > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D 0);
> > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
> > >
> > > -       if (!of_find_property(dev->of_node, "dmas", &len) || !len) {
> > > +       if (!of_property_present(dev->of_node, "dmas")) {
>
> The existing conditional is true if the property is not present or is 0 l=
ength.
> Your new one is only true if the property isn't present, so it isn't the =
same.

It is not the kernel's job to validate the DT. It does a terrible job
of it and we have better tools for that now (schemas (though RPi
platforms are in a pretty sad state for schemas)). I'm pretty sure a
zero length or otherwise malformed "dmas" property would also cause a
dtc warning as well. Non-zero length is hardly a complete test
anyways. Any bogus value of "dmas" would pass. Or it can be completely
valid, but the DMA driver is not enabled (whether you even probe
depends on fw_devlinks).

The kernel should just parse the properties it wants and handle any errors =
then.

>
> Is there a more appropriate of_ call to return the length of the property=
?

There are several which are all based on the data type (string, u32,
u8, phandle+args, etc.). This case would be
of_count_phandle_with_args(). Unless you required something like 2
dmas entries instead of 1, I wouldn't use that here though.

Rob
