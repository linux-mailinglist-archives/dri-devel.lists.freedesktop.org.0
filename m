Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CB44ACC14
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E78A10E23A;
	Mon,  7 Feb 2022 22:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2879510E23A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:34:27 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id c188so18871455iof.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49K/FC0XgxvPLs02mphy+wvDgAB1sedLZp3jK1FmWWc=;
 b=CPIBKwKv/FwLg2yY0ZkogHcyqOJ6wXGdxtnuuT3KXumkKCCa4MBzSaFGOV8iguFlhV
 AuCW3nuq1WdCAGIVAr0+et1PxmlV3ge4N7sCdkSk73gECW4T5wZe/KPp/rM5K8TKCc9Y
 oOj0af7zPMRpqeDcjvQpUM87PAXyjfw9nhAzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49K/FC0XgxvPLs02mphy+wvDgAB1sedLZp3jK1FmWWc=;
 b=H+pfle34a3e8v61NvRJKw8Miaih34R/krjRh+2+z9CeM7zXhlrBI0nteZnwos3Wvvl
 dmdQDGhSZEqBuWhPOi9qQh1nczfGOSDuM4vMs7ZRHt3x14Rl5Ajz2JXEOlKcP9rrGs4p
 ixNyXFrByyWiW/T/8qUfMgLMxVUa049YdYWyVUL1fIXOvDPPtiHJ3vpfdX9S6X4y9Kps
 JGg06Ty19iaF++zBrz7TebUNX4KXN9Y7SwL63c1hbiy9XYyS/pKdMo1yKX/DJM6JvACC
 ggmh+YcqKldaqoGZIMMApLwdDc8B1AvumpAQ7XtcR6S7/hp6CQJBAjjcp/D0SQ43dHXU
 gY6w==
X-Gm-Message-State: AOAM531B22EpFz1SaThZvYvR4I9kw/lNz91RBJ0K4iE4KEp1/IpYEyD2
 v0taayMO5qL9KxixnqqIoonT15iTODW5tA==
X-Google-Smtp-Source: ABdhPJxOHwCRzClBRnDmzm6bqh0N59PZ89QzvgpeeI2/98GjhVlFhOdGE9otAvSg4yw+betqxLTG0A==
X-Received: by 2002:a6b:3b8a:: with SMTP id i132mr781186ioa.85.1644273266153; 
 Mon, 07 Feb 2022 14:34:26 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id x19sm6974039iov.33.2022.02.07.14.34.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:34:24 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id 9so18930862iou.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:34:23 -0800 (PST)
X-Received: by 2002:a02:cc8a:: with SMTP id s10mr805670jap.263.1644273263536; 
 Mon, 07 Feb 2022 14:34:23 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-6-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-6-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:34:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com>
Message-ID: <CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com>
Subject: Re: [PATCH v1 5/9] drm/bridge: ti-sn65dsi86: Fetch bpc via
 drm_bridge_state
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> To prepare for DRM_BRIDGE_ATTACH_NO_CONNECTOR support,
> fix so the bpc is found using the output format.
>
> This avoids the use of the connector stored in the private data.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index d681ab68205c..dc6ec40bc1ef 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/media-bus-format.h>
>
>  #define SN_DEVICE_REV_REG                      0x08
>  #define SN_DPPLL_SRC_REG                       0x0A
> @@ -823,9 +824,11 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>
> -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> +static unsigned int ti_sn_bridge_get_bpp(struct drm_bridge_state *bridge_state)
>  {
> -       if (pdata->connector.display_info.bpc <= 6)
> +       int bpc = media_bus_format_to_bpc(bridge_state->output_bus_cfg.format);
> +
> +       if (bpc <= 6)
>                 return 18;
>         else
>                 return 24;

Unfortunately this doesn't work as hoped. :(
`bridge_state->output_bus_cfg.format` is 0 in my testing...

...and then media_bus_format_to_bpc() returns an error, which is
negative and <= 6. That's not super ideal...

I guess this gets down to what the output bus format is _supposed_ to
be for eDP. Based on my understanding of eDP there isn't really a
concept of a fixed "bus format" that the panel ought to work at. There
is a concept of the number of bits per component (6, 8, 10, 12) that a
panel can run at but then after that I believe the format is standard,
or at least it's something that's dynamic / negotiated. Also note that
the format on the bus is more related to the current mode we're
running the panel in than some inherent property of the panel. For
instance, a 10 bpc panel can likely have data provided in 8 bpc and 6
bpc. I've also seen 6 bpc panels that can accept 8 bpc data and can
dither it. In any case, this type of stuff is really all dynamic for
eDP. The old value we were looking at was really being interpreted as
the "max" bpc that the panel could run in and we'd choose to run the
panel in 8 bpc if the panel supported it and 6 bpc otherwise (this
bridge chip only supports 6bpc or 8bpc).

So I guess the question is: how do we move forward here?

Do we need to somehow figure out how to get "output_bus_cfg.format"
filled in? Any suggestions for how to do that? Do we just implement
atomic_get_output_bus_fmts() and then pick one of
MEDIA_BUS_FMT_RGB666_1X18 or MEDIA_BUS_FMT_RBG888_1X24 based on the
bpc in the connector state? ...or do we just list both of them and
something magically will pick the right one? Hrm, I tried that and it
didn't magically work, but I didn't debug further...

One thing I realized is that, at least in theory, we might not know
whether we want to run in 6 bpc or 8 bpc until we've done link
training. It's at least somewhat plausible that there could be edge
cases where we'd want to fall back to the low bpc if link training
failed at the higher bpc. The driver doesn't support that right now,
but ideally the design wouldn't preclude it. At the moment link
training happens in enable. Maybe that's a problem to worry about
another day, though?

-Doug
