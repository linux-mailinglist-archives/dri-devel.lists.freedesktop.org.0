Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABC96FBF8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF38C10EAE7;
	Fri,  6 Sep 2024 19:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oNBrTrTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782EE10EAE7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B65FA4524B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D93BC4CEC7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725650126;
 bh=8PYtUzBcRzDR+BkqAPJy0YFiShnPQgO2syJSUrN07gE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oNBrTrTAYqb5KVvZmDYXr/Tw1x3q2PzUQw1iCxKVBQIGMk9jv/ujH8K6Oz/Xb5lyE
 zITJ6p6plvdQZy1zcSOKHAyO4JjvCQy7Y24Yu3n+1+XRIrwr7efRcyEcRD2Cj4ciME
 yUOsSxscNyPTcLXk3JreInQAnNknQIuEPzy0YqHvQDl9ZBY/CiFuz3ANmm4nrSMPWV
 rTx4TGMdsqZPUB/HVxpY3/Siw92u26oF0PoZTNsZOwQDm40aY64R4Svbaii67UBWsW
 cVZxotgdPvCM/1MKM+xF3tv4obg45rv5I4JjZgx24MVlpV4qjuSrDifnDYjRz0XT5Y
 dLIAngWfoW4kg==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso2906030e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 12:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVibSXMsOsq+V0zLs0O8u+Xq2USRr1gL4NfAoV6uQJbGQ6FWmhWvUmP2Bb7+ESjoQs9H6uMa3SafgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yynw+Ik06midzreM0PknBTqvpxxEXc77rPphS2zJQCbkTbDzhZG
 bVs4OLlO+6QHUl63I5V1366S4lJriAO/1eiy/WAjrWaBPiLHOinJhcWwSqQrtYe7c4/2AdCdQl2
 xJLodGOj9y6fycuiQXFWi7c7KGQ==
X-Google-Smtp-Source: AGHT+IESGdRuCUkts+rxu7pfXA/qAjquHWsXBUeusiW4kkmLl2lNFAhP28jMC+hCB9hG78a+QRBP6Rs8ZXuOucr3RL0=
X-Received: by 2002:a05:6512:1289:b0:52e:9fda:f18a with SMTP id
 2adb3069b0e04-536587f5be1mr2777799e87.44.1725650124666; Fri, 06 Sep 2024
 12:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-12-robh@kernel.org>
 <CAL_JsqKvA0Uw7uqpmdMP7Z4mL3Qsmay5Fqb4M97s=QsBW_Nxyg@mail.gmail.com>
 <CAPY8ntAv3Xpq45ykwX_98WJKFBxqP6Os+6KvD5xzDTFz8a1idQ@mail.gmail.com>
 <CAL_JsqKjRbHCeFoZDE_wss5HMNmt8UBWa+y_8yJ6TC80xxiTOA@mail.gmail.com>
 <CAPY8ntBJL9nJupadT8T1DGeQHn++MRGKbyH5xSF94a0moqWGYw@mail.gmail.com>
In-Reply-To: <CAPY8ntBJL9nJupadT8T1DGeQHn++MRGKbyH5xSF94a0moqWGYw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Sep 2024 14:15:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKZSk+zY49CAzDisA3kBQf46TOvN-OF+wTH=LGLGwSQUw@mail.gmail.com>
Message-ID: <CAL_JsqKZSk+zY49CAzDisA3kBQf46TOvN-OF+wTH=LGLGwSQUw@mail.gmail.com>
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

On Fri, Sep 6, 2024 at 9:24=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Wed, 4 Sept 2024 at 14:19, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Sep 4, 2024 at 6:18=E2=80=AFAM Dave Stevenson
> > <dave.stevenson@raspberrypi.com> wrote:
> > >
> > > Hi Rob
> > >
> > > On Tue, 3 Sept 2024 at 20:19, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Wed, Jul 31, 2024 at 2:13=E2=80=AFPM Rob Herring (Arm) <robh@ker=
nel.org> wrote:
> > > > >
> > > > > Use of_property_present() to test for property presence rather th=
an
> > > > > of_find_property(). This is part of a larger effort to remove cal=
lers
> > > > > of of_find_property() and similar functions. of_find_property() l=
eaks
> > > > > the DT struct property and data pointers which is a problem for
> > > > > dynamically allocated nodes which may be freed.
> > > > >
> > > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > ---
> > > > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > Ping!
> > >
> > > Sorry, this fell through the cracks.
> > >
> > > > >
> > > > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4=
/vc4_hdmi.c
> > > > > index d57c4a5948c8..049de06460d5 100644
> > > > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > > > @@ -2211,7 +2211,7 @@ static int vc4_hdmi_audio_init(struct vc4_h=
dmi *vc4_hdmi)
> > > > >         struct device *dev =3D &vc4_hdmi->pdev->dev;
> > > > >         struct platform_device *codec_pdev;
> > > > >         const __be32 *addr;
> > > > > -       int index, len;
> > > > > +       int index;
> > > > >         int ret;
> > > > >
> > > > >         /*
> > > > > @@ -2234,7 +2234,7 @@ static int vc4_hdmi_audio_init(struct vc4_h=
dmi *vc4_hdmi)
> > > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi_audio, card) !=3D 0=
);
> > > > >         BUILD_BUG_ON(offsetof(struct vc4_hdmi, audio) !=3D 0);
> > > > >
> > > > > -       if (!of_find_property(dev->of_node, "dmas", &len) || !len=
) {
> > > > > +       if (!of_property_present(dev->of_node, "dmas")) {
> > >
> > > The existing conditional is true if the property is not present or is=
 0 length.
> > > Your new one is only true if the property isn't present, so it isn't =
the same.
> >
> > It is not the kernel's job to validate the DT. It does a terrible job
> > of it and we have better tools for that now (schemas (though RPi
> > platforms are in a pretty sad state for schemas)). I'm pretty sure a
> > zero length or otherwise malformed "dmas" property would also cause a
> > dtc warning as well. Non-zero length is hardly a complete test
> > anyways. Any bogus value of "dmas" would pass. Or it can be completely
> > valid, but the DMA driver is not enabled (whether you even probe
> > depends on fw_devlinks).
> >
> > The kernel should just parse the properties it wants and handle any err=
ors then.
>
> I've followed up over the rationale of this.
>
> The base DT enables HDMI audio.
> On some systems there is a need to use the DMA channels for other
> purposes and no need for HDMI audio.

If that's a user decision, I wouldn't use overlays to decide that, but
make it a run-time OS decision...

> As we understand it, an overlay can't remove a property from the base
> DT, but it can set it to being empty. (Please correct us if there is a
> way to delete an existing property).

There isn't currently.

> The current check therefore allows an overlay to disable the HDMI
> audio that is enabled in the base DT. It doesn't care how long the
> property actually is, just whether it is totally empty or not as an
> alternative to being present.
>
> I understand that you may consider that abuse of DT, but that is the
> reasoning behind it. We can drop it to a downstream patch if
> necessary.

I guess it's going to be use of_count_phandle_with_args() instead.

Rob
