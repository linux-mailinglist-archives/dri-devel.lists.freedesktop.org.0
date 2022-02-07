Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE44ACC21
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC8A10E2B2;
	Mon,  7 Feb 2022 22:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD6110E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:39:50 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id p11so6285264ils.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q3XxY+/6sgXFpItjxoJiUUAP9QisacgEgCSVQOkp65A=;
 b=CHvEUBcobtQTZiZvaMEUY4CZo4TKit9qzzvWnX/E7RZYfdBM0UOyLnxenR9w4a1G9w
 bSp2NzIXFz8lS9JQlCAwziSyetP3G2Mkeu8zeA8ZwltciIMz0Ty17pKzBMaUvK672Mm1
 mX3zVYvTYv5ADWnYxg5iWeyvJaTDTADwsJtE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q3XxY+/6sgXFpItjxoJiUUAP9QisacgEgCSVQOkp65A=;
 b=odlVlHdBqHOhsDDnoMVmvsobCQe+Ct+LJ5bFFtFx1SXhQaH/q2InvOUuHtCNLJ8hbC
 xShdVDWvxWcrr20kny7FUD9fsAAV9VvfXDI71xI7/+BhB9sPN/aqvW8w29Y5kKCSrAs0
 I+G1NJ9yP7DrFnYDNJFK6KddP/18FbzxO0CIPc8I57v+jmuRdKSmeVJaEcFVisBfUdXc
 iBA1LZD3i6SGoL4TBqsnOdbRATowOdOTPV04yXfT6zg5YyfEeMeIcg7S2iMsPDJBxWM5
 pIbtq7RK5sfwGiYgkPakX8DOuvRuANCKTNX1GTnU5DpMp8DyM/IBJHqIHl1oNy9ncELR
 zX3Q==
X-Gm-Message-State: AOAM531pUa8eMQ+dFxeZsIlvLPHjJvUaWP0MwEqHxklx8heWFEwYjwf5
 45Idrgd32GrsPyosDi/fZP3bVAjA1G0W2Q==
X-Google-Smtp-Source: ABdhPJzhkVbvZAmTFglpxBGoXeYYq5Z3gr4+fqvKq3jUrJxOBKWzf2QxDL4odH0Evi0m0hEUKpnZVA==
X-Received: by 2002:a92:d4ce:: with SMTP id o14mr822094ilm.218.1644273589870; 
 Mon, 07 Feb 2022 14:39:49 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id h3sm7006511iow.0.2022.02.07.14.39.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 14:39:49 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id i62so18916118ioa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 14:39:49 -0800 (PST)
X-Received: by 2002:a05:6602:2c8a:: with SMTP id
 i10mr805845iow.98.1644273242026; 
 Mon, 07 Feb 2022 14:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-5-sam@ravnborg.org>
In-Reply-To: <20220206154405.1243333-5-sam@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 14:33:47 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WJFUuLj1-spL=wiQOadg809FnLV4RdfBHOx1FcW3g=ow@mail.gmail.com>
Message-ID: <CAD=FV=WJFUuLj1-spL=wiQOadg809FnLV4RdfBHOx1FcW3g=ow@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] drm/bridge: ti-sn65dsi86: Use atomic variants of
 drm_bridge_funcs
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
> Move away from the deprecated enable/diable operations in
> drm_bridge_funcs and enable atomic use.
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba136a188be7..d681ab68205c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -796,7 +796,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         return MODE_OK;
>  }
>
> -static void ti_sn_bridge_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
> +                                       struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1055,7 +1056,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>         return ret;
>  }
>
> -static void ti_sn_bridge_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
> +                                      struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>         const char *last_err_str = "No supported DP rate";
> @@ -1124,7 +1126,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>                            VSTREAM_ENABLE);
>  }
>
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +                                          struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1137,7 +1140,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>         usleep_range(100, 110);
>  }
>
> -static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
> +static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *old_bridge_state)
>  {
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>
> @@ -1158,10 +1162,11 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .attach = ti_sn_bridge_attach,
>         .detach = ti_sn_bridge_detach,
>         .mode_valid = ti_sn_bridge_mode_valid,
> -       .pre_enable = ti_sn_bridge_pre_enable,
> -       .enable = ti_sn_bridge_enable,
> -       .disable = ti_sn_bridge_disable,
> -       .post_disable = ti_sn_bridge_post_disable,
> +       .atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
> +       .atomic_enable = ti_sn_atomic_bridge_enable,
> +       .atomic_disable = ti_sn_atomic_bridge_disable,
> +       .atomic_post_disable = ti_sn_bridge_post_disable,

Compiler doesn't like the fact that you are inconsistent about whether
it's "atomic_bridge" or "bridge_atomic". Probably should settle on
"bridge_atomic"? ...and the "post_disable" needs "atomic" in the
name...

> +       DRM_BRIDGE_STATE_OPS,

Wow, is it really that simple? I guess it seems to work OK...

Since I don't actually know tons about atomic and whether this is
enough, consider my Reviewed-by tag to be pretty weak. That being
said, this _seems_ right to me?

So once it compiles then I'm fine w/ my (weak) Reviewed-by and my Tested-by.

-Doug
