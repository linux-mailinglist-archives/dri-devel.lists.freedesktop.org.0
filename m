Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33277C0FDD8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6422C10E545;
	Mon, 27 Oct 2025 18:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jNkFmrZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4472110E544
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 18:13:22 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4711810948aso36568925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761588801; x=1762193601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
 b=jNkFmrZyelOybQOKHP7jeXHCsqjmbkG2q941fSp3xLXR172SNTIfgJ9k9xTZkK+aiL
 1yUh2FtMHaRSxzPVBWfzPUuQORu3DjLUL/arHwpgF3H9mwHFQzowEK0AzYG9MqexLifb
 06egByid1QIHoR1K7eIv7PKqjo/uIV/ZMP7wzUePzyKsSJPKsIqVcRpQ5iluR40Vff5M
 PE9ddW6O7Rp8U8wAgn3tBNGRnEbKNemftAluFRTV964gF4tRrpvmtgImkuWktOl6zciw
 Ku+OY2cG3Gd64fj5kTdjvqnjPH0BdHy83XSA/fuR7SoqB3RNk4Rh4zFLn+8rLMJ55kas
 hxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588801; x=1762193601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4a6LotzoT2wotkC+18NM23FPBfm0gNIMR2NilMKa+6U=;
 b=XVvJTUGiDLoWddQ3mu2vvaIyTTxPcjXK94P2Prq0NPBy3oUdEV5EwAAeWn6GWQMcV1
 Cu3s143Qqkrg3IrqPNhCjnz/zTcU6SwO66COfeA3I9LcMrNHNzSodTgBsesqSwGeWGiO
 41PGk5gBGJlsJ3BFbCGUIx1w/qphawmGuXGy8mXujZMuUKXNpXMn0NcLA1Zd4+Mw/eot
 Z2A8AFbgLoS/+KN3KiNYdJU9BS8E5/ehqEbLwbeE0jwmi0dw8lmAZWhq/r1nxa7aeg50
 Q6sThQmNLJEABACxHPyvBO0boqloVkdfI9V96HPg0yyfUru7VYobY0ZiR/3yqZZtzx5z
 nr1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp4WvgyVcqaRyoKiJP6Cr84p8TvoBqdqtht+mA+xprJuL0cLtxXp3+Rzg5QIAFHw47O+PFH+iy0UM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywvql9CWHGL4flnbggCBxAsIsWs2bSxvOuxTu294mDyEelux8qJ
 Ojy7eQBGC/YpDAzysvHMbTTTlImhbyyc0IMTUnS45lf7Y5E+FuuF/4Ea
X-Gm-Gg: ASbGncsRv/YNq65ODe59EtKKMYLY3EUp1WnWpR1tevN3Bu3ntQp6Srp7jmz1FXO8KNG
 zK+84BMqljLN/c8lclwR5JzpA5ZqD4C3ckore5IAqYHhm7uhb3R3tFl2IemrdoIpS4GTodsyhyH
 NUqvFLfcaFtf0+Y269po8O4ay7ip6k8QDLv3F/rKniMH0SDIwrHhwCKrKjyn5oAhkdSi+QTuIJ5
 kKPcc0ZCzcy+R8Arsq0yXo9Mi5fiQKnfOMcg1yZ7Q1a3lpuGdQVhkVrDxGz4hYDRb5W26oteHcn
 3Ta3i1r4uk1TIX9u2H78Qz4fBt6EK0OYmBry0fRYdlDYkPts1QfFMWO1FAuRr5I7oqOStM+Yc2P
 +bhAKcy9m4+n34vK811BlsDBhJEiz0Z2pxlO9taocgVbiyGz/oJp5CoYp2TMxubkfA2ZreJ6xHP
 Y8EM7Uz0EOUdI7MUgzUPQc2HHjJhn4QImgGFDayu0FNvb6FZ95PNC+ILMfypnGLcKhYW1y40kmB
 XwW0w==
X-Google-Smtp-Source: AGHT+IEqlnVwDpi13GnycHHx8DE0kjDHzXjgMTxar3Q9GtHCBjX6mOGesLa7ZV6EWb6wgPy30T7PJg==
X-Received: by 2002:a05:600c:6818:b0:475:de05:661f with SMTP id
 5b1f17b1804b1-47717e67c68mr5088525e9.41.1761588800714; 
 Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4924e2sm149902535e9.8.2025.10.27.11.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 11:13:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/30] drm/sun4i: ui layer: Write attributes in one go
Date: Mon, 27 Oct 2025 19:13:19 +0100
Message-ID: <10742932.nUPlyArG6x@jernej-laptop>
In-Reply-To: <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-9-jernej.skrabec@gmail.com>
 <CAGb2v668p+GOAA=Kgr6dhbkJb33artbPnYsiwEygq7O+92sovQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne ponedeljek, 27. oktober 2025 ob 17:04:38 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > It turns out that none of the UI channel registers were meant to be
> > read. Mostly it works fine but sometimes it returns incorrect values.
> >
> > Rework UI layer code to write all registers in one go to avoid reads.
> >
> > This rework will also allow proper code separation.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 50 +++++++++-----------------
> >  1 file changed, 16 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/s=
un4i/sun8i_ui_layer.c
> > index 12c83c54f9bc..8634d2ee613a 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -25,25 +25,27 @@
> >  #include "sun8i_ui_scaler.h"
> >  #include "sun8i_vi_scaler.h"
> >
> > -static void sun8i_ui_layer_update_alpha(struct sun8i_mixer *mixer, int=
 channel,
> > -                                       int overlay, struct drm_plane *=
plane)
> > +static void sun8i_ui_layer_update_attributes(struct sun8i_mixer *mixer,
> > +                                            int channel, int overlay,
> > +                                            struct drm_plane *plane)
> >  {
> > -       u32 mask, val, ch_base;
> > +       struct drm_plane_state *state =3D plane->state;
> > +       const struct drm_format_info *fmt;
> > +       u32 val, ch_base, hw_fmt;
> >
> >         ch_base =3D sun8i_channel_base(mixer, channel);
> > +       fmt =3D state->fb->format;
> > +       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> >
> > -       mask =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_MASK |
> > -               SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MASK;
> > -
> > -       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(plane->state->alph=
a >> 8);
> > -
> > -       val |=3D (plane->state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
> > +       val =3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA(state->alpha >> 8);
> > +       val |=3D (state->alpha =3D=3D DRM_BLEND_ALPHA_OPAQUE) ?
>=20
> Changing "plane->state" to "state" made the diff somewhat harder to read.

Do you prefer that I change that in next revision?

Best regards,
Jernej

>=20
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_PIXEL :
> >                 SUN8I_MIXER_CHAN_UI_LAYER_ATTR_ALPHA_MODE_COMBINED;
> > +       val |=3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > +       val |=3D SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN;
> >
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          mask, val);
> > +       regmap_write(mixer->engine.regs,
> > +                    SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay), =
val);
> >  }
> >
> >  static void sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int=
 channel,
> > @@ -111,24 +113,6 @@ static void sun8i_ui_layer_update_coord(struct sun=
8i_mixer *mixer, int channel,
> >         }
> >  }
> >
> > -static void sun8i_ui_layer_update_formats(struct sun8i_mixer *mixer, i=
nt channel,
> > -                                         int overlay, struct drm_plane=
 *plane)
> > -{
> > -       struct drm_plane_state *state =3D plane->state;
> > -       const struct drm_format_info *fmt;
> > -       u32 val, ch_base, hw_fmt;
> > -
> > -       ch_base =3D sun8i_channel_base(mixer, channel);
> > -
> > -       fmt =3D state->fb->format;
> > -       sun8i_mixer_drm_format_to_hw(fmt->format, &hw_fmt);
> > -
> > -       val =3D hw_fmt << SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_OFFSET;
> > -       regmap_update_bits(mixer->engine.regs,
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, over=
lay),
> > -                          SUN8I_MIXER_CHAN_UI_LAYER_ATTR_FBFMT_MASK, v=
al);
> > -}
> > -
> >  static void sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, in=
t channel,
> >                                          int overlay, struct drm_plane =
*plane)
> >  {
> > @@ -220,12 +204,10 @@ static void sun8i_ui_layer_atomic_update(struct d=
rm_plane *plane,
> >         if (!new_state->crtc || !new_state->visible)
> >                 return;
> >
> > +       sun8i_ui_layer_update_attributes(mixer, layer->channel,
> > +                                        layer->overlay, plane);
> >         sun8i_ui_layer_update_coord(mixer, layer->channel,
> >                                     layer->overlay, plane);
> > -       sun8i_ui_layer_update_alpha(mixer, layer->channel,
> > -                                   layer->overlay, plane);
> > -       sun8i_ui_layer_update_formats(mixer, layer->channel,
> > -                                     layer->overlay, plane);
> >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >  }
> > --
> > 2.51.0
> >
> >
>=20




