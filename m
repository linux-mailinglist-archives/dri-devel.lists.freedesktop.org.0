Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B856D6CF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4767A10F251;
	Mon, 11 Jul 2022 07:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0903810F421
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:29:30 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id j29so5838405qtv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vn9RnGOLMiTjJq2R61BybdGrozv2mqJxAh2DpK7q6tQ=;
 b=tWwSOiaN4TprmmHVh9rGZZCc2LadOLcC7C/vFVx6N7kvE9yQX5Z9g3NYB5ZwPtmRkO
 5qDuorpXM0XkWBFVrbP/Ai2gGR25Gww+hzZQ+KW2I7S2QqrH1NjmPa/0Nzwg1bpU+5XL
 4gzGxUY6qA1ZSdkCZNuc8jcqWy44saqUVSLL33qKPXR2ux041OCfW720km7Rj4uM9mAI
 odBhA/Kdn6zT9ShElii+c3EzMWYFac7EXZ6ueNl88UU7pCqrGBOeTESxbSlBHV7C7IOH
 PZAi3pKCIc+lb33UGU4ncl9j93wOm9AeZBoG40qqqX1yio+jpPjjjafT4zhpvqc984vb
 JM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vn9RnGOLMiTjJq2R61BybdGrozv2mqJxAh2DpK7q6tQ=;
 b=nhJINIlqAGjFEOfkRFucW2zkjZj+/jxtv/gjMxL+sjC0RJazEfvh5ARkRmOk14zpxe
 vudGE4nMoC4U3OZAIYcqgZzHnsBc0L/SPGZjpNhdAi58ysjUVjN1+i1vBDNt8EI2TiCm
 DXi/aZXvF3523tEB9c8exkZqL3R++kN4QdyLheJ6r/BKD5lgghUHFWMebXq3NqbtntkT
 +Byc9HHY5O3t2JY3828QFkZ0Ldps/PrMbZZWZH620gKO+QBQhrAwEYsiKcdzfnGokDcu
 T0KA/+VXfDYj+3hInvoE9Z/8aXME/fsMo3HAI04xUQeoL/0YWJyFGLjNWFVdIVJFYk5Y
 je8g==
X-Gm-Message-State: AJIora+0MvLcPdI5xLbMqXC+d7fHNN9VQNMOQP1icPDEDdIwVdFBsUUP
 0jLnO2xN1rAVsu/oEU690fMZbbxjr/iPStwiPwEPaQ==
X-Google-Smtp-Source: AGRyM1tQhMOlFA4dzCEZxBWibccQVLVlffa7HebJhI4b8ogv/f/fDbItnpLk1YzxgoCFEnSET9X88SV6zp0S2C6v7BU=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12575411qtx.370.1657524568595; Mon, 11
 Jul 2022 00:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
 <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
 <YssivkHHpKFhw3cr@ravnborg.org>
In-Reply-To: <YssivkHHpKFhw3cr@ravnborg.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Jul 2022 10:29:17 +0300
Message-ID: <CAA8EJppwg54N4HPDSFCgUA_5kpxxOm7wh0eCZWZ0wKCjv=5pkg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 at 22:04, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sun, Jul 10, 2022 at 09:45:34PM +0300, Dmitry Baryshkov wrote:
> > Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
> > / atomic_post_disable rather than their non-atomic versions.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> a more or less identical patch was applied to drm-misc-next
> the other day.
> See d8b599bf625d1d818fdbb322a272fd2a5ea32e38.

Ugh, thanks for pointing this out.

>
>         Sam
>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 8cad662de9bb..01171547f638 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> >       return MODE_OK;
> >  }
> >
> > -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                     struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
> >       return ret;
> >  }
> >
> > -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                    struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >       const char *last_err_str = "No supported DP rate";
> > @@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> >                          VSTREAM_ENABLE);
> >  }
> >
> > -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> >       usleep_range(100, 110);
> >  }
> >
> > -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> > +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> > +                                          struct drm_bridge_state *old_bridge_state)
> >  {
> >       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >
> > @@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
> >       .attach = ti_sn_bridge_attach,
> >       .detach = ti_sn_bridge_detach,
> >       .mode_valid = ti_sn_bridge_mode_valid,
> > -     .pre_enable = ti_sn_bridge_pre_enable,
> > -     .enable = ti_sn_bridge_enable,
> > -     .disable = ti_sn_bridge_disable,
> > -     .post_disable = ti_sn_bridge_post_disable,
> > +     .atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> > +     .atomic_enable = ti_sn_bridge_atomic_enable,
> > +     .atomic_disable = ti_sn_bridge_atomic_disable,
> > +     .atomic_post_disable = ti_sn_bridge_atomic_post_disable,
> >  };
> >
> >  static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
> > --
> > 2.35.1



-- 
With best wishes
Dmitry
