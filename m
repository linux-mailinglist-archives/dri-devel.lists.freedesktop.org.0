Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322C912D789
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC56E1E5;
	Tue, 31 Dec 2019 09:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778DE89FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 17:39:52 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id i16so33292646edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2019 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=B4WvjKu8Zt3GS/MjJj0aGEhrMWvdET73RfaIlriHe3M=;
 b=Cdltx7QuvnVePJtclMpUE5avgOZ7vn+sQJkW0imjDWDm9LD+cDlkZtZunUggU7oZ8f
 186CNr7VsziAvktWvVV8ad2oFO3IlucQGs+kYuNHUxyJyzD9stuyXaP7j9v807qaysBJ
 s/Xrku3Db5dxTJlUdprGSlHUAfiRS6c3tMReOalklMVudIfLSlI4/qI8txuPwOiF1YYm
 ln2cy3foofpkuOsLIROVrfo0SJZkV8cvCvV23tbEb1qxramvXyNKgdhdr9shqkiOvRDM
 IZbTdqlFNqmKaLfvpVOIbeQFBByJ7JPOqmN4PGGje3cpf9Pr/WmIDzFAukx+4MbDNLg+
 J4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=B4WvjKu8Zt3GS/MjJj0aGEhrMWvdET73RfaIlriHe3M=;
 b=IYNMmmn9uM7QA5kPKU/4d9Za82M6FNFrHeK6x3mMJ8omkr+c70BtDOWLnAwO/WHGRo
 Bn5OTsrx6E6V0O508qH4L2vosb3Rs3tNO1YLqTJ6rRDIYtsjl+VFxzwEEIOTFYTYK9br
 TX3csgH/T8+7Tv3bepnbzL6+SOFvMCdzwF/xpstSb5AiJVNpQdrlc4POQCPenYf4wZQR
 t2rd6HnkXYmL2Pzzz4UeYkSnzdLhM7Bj3AkHvfxFZ/1rhkaBSS4ppC4kPCNRLRDYnnYC
 Rdl5seQ0GVOM+TzSzWrf56VXwUxExE4/lmeSUxHAHw8qMvhchG2Yetr9eqtkB1YyxLvL
 UwyA==
X-Gm-Message-State: APjAAAXA4aBhF11yE7S7CmDsSbcSZbpkT9HrSQpff1HMl9RCHfVo/An6
 vk5I55/DbqsGtelpwTtFX5Vri4vt1dCjWM+SYAa++iJf
X-Google-Smtp-Source: APXvYqz58OXCxpaMpQZ3ZaLiqXlcrCgRTKRypogsiG+N7VIcMFWPhTNdEd546YAYMaoy+r2aq8N8NQGcCSWqN3UXHRc=
X-Received: by 2002:a17:906:80b:: with SMTP id
 e11mr71173253ejd.278.1577727590802; 
 Mon, 30 Dec 2019 09:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20191229162828.3326-1-roman.stratiienko@globallogic.com>
 <CAODwZ7uLd57LdCuC_onFPD53mSAryJVfeHUEWmaTxsyf80Wzww@mail.gmail.com>
In-Reply-To: <CAODwZ7uLd57LdCuC_onFPD53mSAryJVfeHUEWmaTxsyf80Wzww@mail.gmail.com>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Mon, 30 Dec 2019 19:39:39 +0200
Message-ID: <CAODwZ7tD6u9Uus3OFpS=4mK5WYVk51my7K-fb6-14eLArRZwnw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/sun4i: Reimplement plane z position setting
 logic
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

False alarm. Since DRM sets normalized ZPOS there should be no gaps
and all should work as expected.

On Mon, Dec 30, 2019 at 1:25 PM Roman Stratiienko
<roman.stratiienko@globallogic.com> wrote:
>
> Please HOLD this until v3.
> I forgot about blender channel frame coords that updated according to
> zpos and can have gap between channels.
> I will also try to simplify this patch.
>
> On Sun, Dec 29, 2019 at 6:28 PM <roman.stratiienko@globallogic.com> wrote:
> >
> > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > To set blending channel order register software needs to know state and
> > position of each channel, which impossible at plane commit stage.
> >
> > Move this procedure to atomic_flush stage, where all necessary information
> > is available.
> >
> > Fixes: f88c5ee77496 ("drm/sun4i: Implement zpos for DE2")
> > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > ---
> > v2:
> > - Use SUN8I_MIXER_MAX_LAYERS macro
> > - Use plane_cnt instead of hard-coded number
> > - Put initialization of channel_zpos into for loop
> > - Add 'Fixes' line to the commit message
> > - Minor clean-ups
> > - Comments added
> > ---
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 52 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  5 +++
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 42 +++------------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 39 +++----------------
> >  4 files changed, 66 insertions(+), 72 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > index 8b803eb903b8..d306ad5dc093 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > @@ -259,8 +259,54 @@ const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
> >
> >  static void sun8i_mixer_commit(struct sunxi_engine *engine)
> >  {
> > -       DRM_DEBUG_DRIVER("Committing changes\n");
> > +       struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
> > +       u32 base = sun8i_blender_base(mixer);
> > +       int i, j = 0;
> > +       int channel_by_zpos[SUN8I_MIXER_MAX_LAYERS];
> > +       u32 route = 0, pipe_ctl = 0;
> > +       int plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> > +
> > +       DRM_DEBUG_DRIVER("Update blender routing\n");
> > +       /* Assume that values in mixer->channel_zpos[] are unique except -1 */
> > +
> > +       for (i = 0; i < plane_cnt; i++)
> > +               channel_by_zpos[i] = -1;
> >
> > +       /* Sort by zpos */
> > +       for (i = 0; i < plane_cnt; i++) {
> > +               int zpos = mixer->channel_zpos[i];
> > +
> > +               if (zpos >= 0 && zpos < plane_cnt)
> > +                       channel_by_zpos[zpos] = i;
> > +       }
> > +
> > +       /* Route enabled blending channels first */
> > +       for (i = 0; i < plane_cnt; i++) {
> > +               int ch = channel_by_zpos[i];
> > +
> > +               if (ch >= 0) {
> > +                       pipe_ctl |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(j);
> > +                       route |= ch << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
> > +                       j++;
> > +               }
> > +       }
> > +
> > +       /* Set remaining routing fields to match disabled channel indices */
> > +       for (i = 0; i < SUN8I_MIXER_MAX_LAYERS && j < SUN8I_MIXER_MAX_LAYERS;
> > +            i++) {
> > +               if (mixer->channel_zpos[i] < 0) {
> > +                       route |= i << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(j);
> > +                       j++;
> > +               }
> > +       }
> > +
> > +       regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> > +                          SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, pipe_ctl);
> > +
> > +       regmap_write(mixer->engine.regs,
> > +                    SUN8I_MIXER_BLEND_ROUTE(base), route);
> > +
> > +       DRM_DEBUG_DRIVER("Committing changes\n");
> >         regmap_write(engine->regs, SUN8I_MIXER_GLOBAL_DBUFF,
> >                      SUN8I_MIXER_GLOBAL_DBUFF_ENABLE);
> >  }
> > @@ -485,10 +531,12 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
> >                      SUN8I_MIXER_BLEND_COLOR_BLACK);
> >
> >         plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
> > -       for (i = 0; i < plane_cnt; i++)
> > +       for (i = 0; i < plane_cnt; i++) {
> > +               mixer->channel_zpos[i] = -1;
> >                 regmap_write(mixer->engine.regs,
> >                              SUN8I_MIXER_BLEND_MODE(base, i),
> >                              SUN8I_MIXER_BLEND_MODE_DEF);
> > +       }
> >
> >         regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
> >                            SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > index c6cc94057faf..b193d9d1db66 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> > @@ -13,6 +13,8 @@
> >  #include "sun8i_csc.h"
> >  #include "sunxi_engine.h"
> >
> > +#define SUN8I_MIXER_MAX_LAYERS                 5
> > +
> >  #define SUN8I_MIXER_SIZE(w, h)                 (((h) - 1) << 16 | ((w) - 1))
> >  #define SUN8I_MIXER_COORD(x, y)                        ((y) << 16 | (x))
> >
> > @@ -176,6 +178,9 @@ struct sun8i_mixer {
> >
> >         struct clk                      *bus_clk;
> >         struct clk                      *mod_clk;
> > +
> > +       /* -1 means that layer is disabled */
> > +       int channel_zpos[SUN8I_MIXER_MAX_LAYERS];
> >  };
> >
> >  static inline struct sun8i_mixer *
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > index c87fd842918e..ee7c13d8710f 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > @@ -24,12 +24,10 @@
> >  #include "sun8i_ui_scaler.h"
> >
> >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
> > -                                 int overlay, bool enable, unsigned int zpos,
> > -                                 unsigned int old_zpos)
> > +                                 int overlay, bool enable, unsigned int zpos)
> >  {
> > -       u32 val, bld_base, ch_base;
> > +       u32 val, ch_base;
> >
> > -       bld_base = sun8i_blender_base(mixer);
> >         ch_base = sun8i_channel_base(mixer, channel);
> >
> >         DRM_DEBUG_DRIVER("%sabling channel %d overlay %d\n",
> > @@ -44,32 +42,7 @@ static void sun8i_ui_layer_enable(struct sun8i_mixer *mixer, int channel,
> >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base, overlay),
> >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_EN, val);
> >
> > -       if (!enable || zpos != old_zpos) {
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > -                                  0);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > -                                  0);
> > -       }
> > -
> > -       if (enable) {
> > -               val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                  val, val);
> > -
> > -               val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
> > -                                  val);
> > -       }
> > +       mixer->channel_zpos[channel] = enable ? zpos : -1;
> >  }
> >
> >  static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
> > @@ -265,11 +238,9 @@ static void sun8i_ui_layer_atomic_disable(struct drm_plane *plane,
> >                                           struct drm_plane_state *old_state)
> >  {
> >         struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
> > -       unsigned int old_zpos = old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer = layer->mixer;
> >
> > -       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
> > -                             old_zpos);
> > +       sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
> >  }
> >
> >  static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> > @@ -277,12 +248,11 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> >  {
> >         struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
> >         unsigned int zpos = plane->state->normalized_zpos;
> > -       unsigned int old_zpos = old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer = layer->mixer;
> >
> >         if (!plane->state->visible) {
> >                 sun8i_ui_layer_enable(mixer, layer->channel,
> > -                                     layer->overlay, false, 0, old_zpos);
> > +                                     layer->overlay, false, 0);
> >                 return;
> >         }
> >
> > @@ -293,7 +263,7 @@ static void sun8i_ui_layer_atomic_update(struct drm_plane *plane,
> >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >         sun8i_ui_layer_enable(mixer, layer->channel, layer->overlay,
> > -                             true, zpos, old_zpos);
> > +                             true, zpos);
> >  }
> >
> >  static struct drm_plane_helper_funcs sun8i_ui_layer_helper_funcs = {
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > index 42d445d23773..97cbc98bf781 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > @@ -17,8 +17,7 @@
> >  #include "sun8i_vi_scaler.h"
> >
> >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
> > -                                 int overlay, bool enable, unsigned int zpos,
> > -                                 unsigned int old_zpos)
> > +                                 int overlay, bool enable, unsigned int zpos)
> >  {
> >         u32 val, bld_base, ch_base;
> >
> > @@ -37,32 +36,7 @@ static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
> >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base, overlay),
> >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_EN, val);
> >
> > -       if (!enable || zpos != old_zpos) {
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > -                                  0);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > -                                  0);
> > -       }
> > -
> > -       if (enable) {
> > -               val = SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > -                                  val, val);
> > -
> > -               val = channel << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
> > -
> > -               regmap_update_bits(mixer->engine.regs,
> > -                                  SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > -                                  SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(zpos),
> > -                                  val);
> > -       }
> > +       mixer->channel_zpos[channel] = enable ? zpos : -1;
> >  }
> >
> >  static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
> > @@ -350,11 +324,9 @@ static void sun8i_vi_layer_atomic_disable(struct drm_plane *plane,
> >                                           struct drm_plane_state *old_state)
> >  {
> >         struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
> > -       unsigned int old_zpos = old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer = layer->mixer;
> >
> > -       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0,
> > -                             old_zpos);
> > +       sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay, false, 0);
> >  }
> >
> >  static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> > @@ -362,12 +334,11 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> >  {
> >         struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
> >         unsigned int zpos = plane->state->normalized_zpos;
> > -       unsigned int old_zpos = old_state->normalized_zpos;
> >         struct sun8i_mixer *mixer = layer->mixer;
> >
> >         if (!plane->state->visible) {
> >                 sun8i_vi_layer_enable(mixer, layer->channel,
> > -                                     layer->overlay, false, 0, old_zpos);
> > +                                     layer->overlay, false, 0);
> >                 return;
> >         }
> >
> > @@ -378,7 +349,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
> >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> >                                      layer->overlay, plane);
> >         sun8i_vi_layer_enable(mixer, layer->channel, layer->overlay,
> > -                             true, zpos, old_zpos);
> > +                             true, zpos);
> >  }
> >
> >  static struct drm_plane_helper_funcs sun8i_vi_layer_helper_funcs = {
> > --
> > 2.17.1
> >
>
>
> --
> Best regards,
> Roman Stratiienko
> Global Logic Inc.



-- 
Best regards,
Roman Stratiienko
Global Logic Inc.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
