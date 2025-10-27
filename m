Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6FBC0FE0C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF4610E546;
	Mon, 27 Oct 2025 18:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lKDUIcrQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523A110E546
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:17:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98522603A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C32C113D0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761589036;
 bh=6nd/xaCVmVViBpeV0cBqu/UumtloLX/T9G1ZHGpbMWc=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=lKDUIcrQbRWMzcs/byoQUfInnMtMm4M/OR53T9IQQhw/pUi/12XLs/X12lQzVF5PO
 nof4BoXiil+9PMKQDUtXURLrmEqw/dTSe1Tz29pJ2udO7wYiz9duSSQV0fM2BslIEo
 4Y+47rUQnb6qOr9RHJIjE9WGhJzD78cDAZ6AGHxMqhtdJWs/8mXKoasLP3cuYO4TLU
 6MlKur3i67dx6iHfiscGoChkYSdZhD2X/ubr/y38QaBPN6DhsyWIhQsn706VS30xqL
 rjiiPPHMaKoc7GGsAKn7W6hj9jOoWx2xWjhKWC9tpCJ5n0LhiZnxUzNX9jm/g3szs/
 VuESXGe8wrsCw==
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-93e89a59d68so214217039f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:17:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUip0ONaIeXuoYAPLX5u9oAzjWBTtOPjnFVgxDUJPrnR48scqSsRlIG/fFuZvM1H033f4SL8AYEEbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztHFrzjONkvFGXuG9eP/oYXzkHsII1JaIbtp7xSEzzwFmF7bAi
 2LkukTStOPmEPKdDgHS4jtRESnwbzEdG/RJWA94ZqAsSjLR8RvR+gXKDrQxM+PU4Oc8Fu36mYkl
 kKKc+QuQeda2yX821yrOiXNCJUAOOoBg=
X-Google-Smtp-Source: AGHT+IG8zyj7yHZN9LacH9IlKXFT7dH+scROPtkp6gXmpK9NPsaJpiuFwmBzdRIMm/de3SVZSRzRTX72Xl1Fa1OPcJs=
X-Received: by 2002:a05:6602:6d14:b0:93e:856a:2fe8 with SMTP id
 ca18e2360f4ac-945b84edf9fmr159706739f.19.1761589035669; Mon, 27 Oct 2025
 11:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com>
 <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
 <10742932.nUPlyArG6x@jernej-laptop>
In-Reply-To: <10742932.nUPlyArG6x@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 02:16:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v64YkkYRqfXnOcHkn+L3xh26mSXZ+CWjzbr_KXdNmq+Jpw@mail.gmail.com>
X-Gm-Features: AWmQ_bkVDWDL1iQ2lwVNNkITQo8BZYUH6exm_dJJvH_NxnAyZvBvVjoZ7LEJoQs
Message-ID: <CAGb2v64YkkYRqfXnOcHkn+L3xh26mSXZ+CWjzbr_KXdNmq+Jpw@mail.gmail.com>
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 28, 2025 at 2:13=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 27. oktober 2025 ob 17:04:38 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> > On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@=
gmail.com> wrote:
> > >
> > > It turns out that none of the UI channel registers were meant to be
> > > read. Mostly it works fine but sometimes it returns incorrect values.
> > >
> > > Rework UI layer code to write all registers in one go to avoid reads.
> > >
> > > This rework will also allow proper code separation.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++---------------=
--
> > >  1 file changed, 16 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm=
/sun4i/sun8i_ui_layer.c
> > > index 12c83c54f9bc..8634d2ee613a 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > @@ -25,25 +25,27 @@
> > >  #include "sun8i_ui_scaler.h"
> > >  #include "sun8i_vi_scaler.h"
> > >
> > > -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, i=
nt channel,
> > > -                                       int overlay, struct drm_plane=
 *plane)
> > > +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mix=
er,
> > > +                                            int channel, int overlay=
,
> > > +                                            struct drm_plane *plane)
> > >  {
> > > -       u32 mask, val, ch_base;
> > > +       struct drm_plane_state *state =3D plane->state;
> > > +       const struct drm_format_info *fmt;
> > > +       u32 val, ch_base, hw_fmt;
> > >
> > >         ch_base =3D sun8i_channel_base(mixer, channel);
> > > +       fmt =3D state->fb->format;
> > > +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> > >
> > > -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > > -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > > -
> > > -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->al=
pha >> 8);
> > > -
> > > -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) =
?
> > > +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> =
8);
> > > +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> >
> > Changing "plane->state" to "state" made the diff somewhat harder to rea=
d.
>
> Do you prefer that I change that in next revision?

No need.
