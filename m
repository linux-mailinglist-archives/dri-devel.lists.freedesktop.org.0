Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8496532D8B
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 17:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FAB10E3F7;
	Tue, 24 May 2022 15:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB0710E4EB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 15:31:25 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id v6so11942955qtx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 May 2022 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=24+aqcwK0Ad9K0gZRiF7OddgspvzBsX08PG7AgjtZXU=;
 b=aBBlcbxZlQ9PwGGM3qTG5M0kKlBfakQF/ihGMeZCikTXHKpDvPooHDxwCOBHiWFARX
 BKZmXmpGXtR/1VtZx600SfanHT/xvLbLYQhYaBeQqwPuWXaMZWTFuGoyITjLaf3BIyZy
 c+JxVEbRtrK+li2SWdy4kT0aUUi/hCJuf/cyQ5meY4rpPTie99UxRmzu3F4a5tfPgKqa
 i4IcAmMAnBud8qgAfsq5y86ufkxM8TlXDb14Owbbhtttz+MdmT1hwdDN+X34B/B9nPcw
 oBwZJdW9nxRh7hz/F0jJMmN5qS6tL6oXT9hArpi4k7Hi4ZVwl8uOr8NtgHa9Uubdteny
 rOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=24+aqcwK0Ad9K0gZRiF7OddgspvzBsX08PG7AgjtZXU=;
 b=hHJ7N4T80i6S2dcNB1FEXm/SP/YDh6SZrBztHWn1blWT46mv4ZuC6eBUQ3wj7LzAaZ
 VfNkGSyWiZWuCZ0fzrQ3WEVNdRssuWtTv/DOv1AQPPgeSOSSrtn3eKinc5OkMQhIAObh
 WVVVJ+RQfsdFNtzDtfK+bx2VgFJHaZ+GewgrJ7wLOQTpJsIic0VvMCp7O5HitLTfuXFX
 n2PAbMmH9ZQ5+OY89t1VHuwyXqbANBszjgTxf00K+UpTkncBlZ1wivjZ9t1W8rHsuDhT
 JHGDO23NYaGOnz6iqaXVS1LhQUEoj1CVgSOeg5lPDpy/8VZ0ic8M3DIyKWtEQ/oiTtJz
 NDAA==
X-Gm-Message-State: AOAM530/Y/5iFDWYdr9keEFWrmutr+dROElzEpNpBMVnfKiFMXKhdrzF
 1AIc0FU/NM5EWpMibnPQkWz5wpziQXa/iW4Ssb4=
X-Google-Smtp-Source: ABdhPJwz8oNxE0TWNQ5Wsc55k7vDZ2sdPE4eYjk1JQqeyf/XWgJ9Z4Ur9tTAeswaaAuIFGvsPq/lMuP2r/LOJtyhdzM=
X-Received: by 2002:ac8:7dd5:0:b0:2f3:d8bd:19e4 with SMTP id
 c21-20020ac87dd5000000b002f3d8bd19e4mr20691978qte.103.1653406284647; Tue, 24
 May 2022 08:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
In-Reply-To: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Tue, 24 May 2022 18:31:13 +0300
Message-ID: <CAGphcd=wTPnTqNxP+TQ8YCDsT=7EUVssAKDpG2J_G=R-7N=YKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix blend registers corruption for DE2.0/DE3.0
To: mripard@kernel.org, wens@csie.org, 
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, airlied@linux.ie, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, megi@xff.cz
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

NAK for this. Further testing showed such an approach is not reliable
due to .atomic_update() callback called only in case planes have some
changes.

=D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52, Roman Strati=
ienko <r.stratiienko@gmail.com>:
>
> Corruption happens when plane zpos is updated
>
> Example scenario:
>
> Initial frame blender state:
>     PLANE_ZPOS =3D {0, 1, 2, 3}
>     BLD_ROUTE  =3D {0, 1, 2, 0}
>     BLD_EN     =3D {1, 1, 1, 0}
>
> New frame commit (Only ZPOS has been changed):
>
>     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
>
> Expected results after plane state update:
>                 Z0 Z1 Z2 Z3
>     BLD_ROUTE =3D {1, 2, 0, 0}
>     BLD_EN    =3D {1, 1, 1, 0}
>
> What is currently happening:
>
> 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=3D0):
>     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
>     BLD_EN    =3D {1->0, 1, 1->1, 0}
>
> 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=3D1):
>     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
>     BLD_EN    =3D {0->1, 1->0, 1, 0}
>
> 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=3D2):
>     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
>     BLD_EN    =3D {1, 0->2, 1->0, 0}
>
> After updating of all the planes we are ending up with BLD_EN[2]=3D0,
> which makes this channel disabled.
>
> To fix this issue, clear BLEND registers before updating the planes
> and do not clear the old state while processing every plane.
>
> Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 +++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 ++++----------------------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 ++++----------------------
>  3 files changed, 24 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index f5e8aeaa3cdf..004377a000fc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw=
_format)
>         return -EINVAL;
>  }
>
> +static void sun8i_atomic_begin(struct sunxi_engine *engine,
> +                              struct drm_crtc_state *old_state)
> +{
> +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +       u32 bld_base =3D sun8i_blender_base(mixer);
> +
> +       regmap_write(engine->regs,
> +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> +                    0);
> +
> +       regmap_write(engine->regs,
> +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> +                    0);
> +}
> +
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
>         DRM_DEBUG_DRIVER("Committing changes\n");
> @@ -299,6 +314,7 @@ static struct drm_plane **sun8i_layers_init(struct dr=
m_device *drm,
>  }
>
>  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
> +       .atomic_begin   =3D sun8i_atomic_begin,
>         .commit         =3D sun8i_mixer_commit,
>         .layers_init    =3D sun8i_layers_init,
>  };
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 7845c2a53a7f..b294a882626a 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -24,8 +24,7 @@
>  #include "sun8i_ui_scaler.h"
>
>  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel=
,
> -                                 int overlay, bool enable, unsigned int =
zpos,
> -                                 unsigned int old_zpos)
> +                                 int overlay, bool enable, unsigned int =
zpos)
>  {
>         u32 val, bld_base, ch_base;
>
> @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *=
mixer, int channel,
>                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overla=
y),
>                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
>
> -       if (!enable || zpos !=3D old_zpos) {
> -               regmap_update_bits(mixer->engine.regs,
> -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -                                  SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos=
),
> -                                  0);
> -
> -               regmap_update_bits(mixer->engine.regs,
> -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_z=
pos),
> -                                  0);
> -       }
> -
>         if (enable) {
>                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
>
> @@ -291,31 +278,24 @@ static int sun8i_ui_layer_atomic_check(struct drm_p=
lane *plane,
>  static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> -       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> -                                                                        =
  plane);
>         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
> -       unsigned int old_zpos =3D old_state->normalized_zpos;
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
> -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, fals=
e, 0,
> -                             old_zpos);
> +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, fals=
e, 0);
>  }
>
>  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
>                                          struct drm_atomic_state *state)
>  {
> -       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> -                                                                        =
  plane);
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct sun8i_ui_layer *layer =3D plane_to_sun8i_ui_layer(plane);
>         unsigned int zpos =3D new_state->normalized_zpos;
> -       unsigned int old_zpos =3D old_state->normalized_zpos;
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
>         if (!new_state->visible) {
>                 sun8i_ui_layer_enable(mixer, layer->channel,
> -                                     layer->overlay, false, 0, old_zpos)=
;
> +                                     layer->overlay, false, 0);
>                 return;
>         }
>
> @@ -328,7 +308,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_p=
lane *plane,
>         sun8i_ui_layer_update_buffer(mixer, layer->channel,
>                                      layer->overlay, plane);
>         sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> -                             true, zpos, old_zpos);
> +                             true, zpos);
>  }
>
>  static const struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs =
=3D {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index bb7c43036dfa..4653244b2fd8 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -18,8 +18,7 @@
>  #include "sun8i_vi_scaler.h"
>
>  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel=
,
> -                                 int overlay, bool enable, unsigned int =
zpos,
> -                                 unsigned int old_zpos)
> +                                 int overlay, bool enable, unsigned int =
zpos)
>  {
>         u32 val, bld_base, ch_base;
>
> @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *=
mixer, int channel,
>                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overla=
y),
>                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
>
> -       if (!enable || zpos !=3D old_zpos) {
> -               regmap_update_bits(mixer->engine.regs,
> -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> -                                  SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos=
),
> -                                  0);
> -
> -               regmap_update_bits(mixer->engine.regs,
> -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_z=
pos),
> -                                  0);
> -       }
> -
>         if (enable) {
>                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
>
> @@ -395,31 +382,24 @@ static int sun8i_vi_layer_atomic_check(struct drm_p=
lane *plane,
>  static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> -       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> -                                                                        =
  plane);
>         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
> -       unsigned int old_zpos =3D old_state->normalized_zpos;
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
> -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, fals=
e, 0,
> -                             old_zpos);
> +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, fals=
e, 0);
>  }
>
>  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
>                                          struct drm_atomic_state *state)
>  {
> -       struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> -                                                                        =
  plane);
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct sun8i_vi_layer *layer =3D plane_to_sun8i_vi_layer(plane);
>         unsigned int zpos =3D new_state->normalized_zpos;
> -       unsigned int old_zpos =3D old_state->normalized_zpos;
>         struct sun8i_mixer *mixer =3D layer->mixer;
>
>         if (!new_state->visible) {
>                 sun8i_vi_layer_enable(mixer, layer->channel,
> -                                     layer->overlay, false, 0, old_zpos)=
;
> +                                     layer->overlay, false, 0);
>                 return;
>         }
>
> @@ -432,7 +412,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_p=
lane *plane,
>         sun8i_vi_layer_update_buffer(mixer, layer->channel,
>                                      layer->overlay, plane);
>         sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> -                             true, zpos, old_zpos);
> +                             true, zpos);
>  }
>
>  static const struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs =
=3D {
> --
> 2.30.2
>
