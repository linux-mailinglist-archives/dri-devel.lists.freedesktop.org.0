Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C41A40A211
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 02:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7636E2D8;
	Tue, 14 Sep 2021 00:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5106E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 00:32:16 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id b15so11635669ils.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fc2qpd7/HkED54Dmv5q2n398ZaaGwNXVhIhrR+B9+xg=;
 b=fzBPJpuTidCguo+0rpVlS9ym+yazP5tQsqID/R/IBgyphfqbxgahDj1x5RehTy+98X
 +ZGJ1PxOCKK46fxVEihbOpl06s9gLSmHjeu1H9ECcc4Mdn2o31bvHIhC0aBQs8KLG6Gj
 Ib5rp1ioVdAUNCCvwvScdVCMBRQgtzl69rCMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fc2qpd7/HkED54Dmv5q2n398ZaaGwNXVhIhrR+B9+xg=;
 b=h26iZUNgMOzKSDU+M1kgoTaI3tWhJ5XMGBTIFKBtJsPXpGRU8qmHe1bfpN97ke8bgO
 Q6yR/u3/XNzDCyWLv7McJsLJFAJYIHfxWmZ6fC1jRnt2EnaupNgFq4XlsmO/yXK90vot
 ytRtxiSRgtT2KhMkIl1tkht+vKx2QkpSbRqH+OObJ3gvlc5qD9EldrfZgy49M06Eera5
 MRTeCfyfOQMb7Rx1cRi3h43y0ZNjukCEEksVwIleez+hslV6xJwJvE8zKdbP4A1ldVcT
 mecwDgsbeGwv6e+yreFOu0GNkNsothuxsquQiYLf96ux+7e2Ko7sQ/KTSPWx0M8Y6GYp
 3hew==
X-Gm-Message-State: AOAM532gPDRztix4RRtJYHnUSEfDMOvh/rGMLNQYuuxBpZbG7bMWEUad
 YhszK05oQRtXfz4Inumb3IyXuHXe8SbhOQ==
X-Google-Smtp-Source: ABdhPJzgJR+DJAgc3vEZjI7zP+Z8KRZzBjtL8tlJ1kMLKf5KF8VVRbSTxLMx8jThQJB7pb7m6p+1Hw==
X-Received: by 2002:a05:6e02:f13:: with SMTP id
 x19mr10108711ilj.216.1631579535915; 
 Mon, 13 Sep 2021 17:32:15 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id 12sm5746462ilq.37.2021.09.13.17.32.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 17:32:15 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id v16so7304921ilg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:32:15 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr9860853ilm.120.1631579534828; 
 Mon, 13 Sep 2021 17:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
In-Reply-To: <20210913143255.RFC.v2.1.I8ad7a535bb18a1f41f3858f83379beedb397a9db@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Sep 2021 17:32:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDn3XWt5USOmkhikYMUqY1gt7MQfOQhu7v+soy=u3_0g@mail.gmail.com>
Message-ID: <CAD=FV=XDn3XWt5USOmkhikYMUqY1gt7MQfOQhu7v+soy=u3_0g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 13, 2021 at 2:33 PM Philip Chen <philipchen@chromium.org> wrote:
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 685e9c38b2db..1b2414601538 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>
>  #include <drm/drm_bridge.h>
> @@ -31,6 +32,11 @@
>
>  #define NUM_MIPI_LANES         4
>
> +#define COMMON_PS8640_REGMAP_CONFIG \
> +       .reg_bits = 8, \
> +       .val_bits = 8, \
> +       .cache_type = REGCACHE_NONE

At some point we should see if we get any speed gains by actually
caching, but that could be done later and isn't terribly high
priority.


> +
>  /*
>   * PS8640 uses multiple addresses:
>   * page[0]: for DP control
> @@ -64,12 +70,48 @@ struct ps8640 {
>         struct drm_bridge *panel_bridge;
>         struct mipi_dsi_device *dsi;
>         struct i2c_client *page[MAX_DEVS];
> +       struct regmap   *regmap[MAX_DEVS];
>         struct regulator_bulk_data supplies[2];
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
>         bool powered;
>  };
>
> +static const struct regmap_config ps8640_regmap_config[] = {
> +       [PAGE0_DP_CNTL] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xbf
> +       },
> +       [PAGE1_VDO_BDG] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       },
> +       [PAGE2_TOP_CNTL] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       },
> +       [PAGE3_DSI_CNTL1] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       },
> +       [PAGE4_MIPI_PHY] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       },
> +       [PAGE5_VPLL] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0x7f
> +       },
> +       [PAGE6_DSI_CNTL2] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       },
> +       [PAGE7_SPI_CNTL] = {
> +               COMMON_PS8640_REGMAP_CONFIG,
> +               .max_register = 0xff
> +       }

nit: stylistically it's nice to add a "," after the last brace too.
It's not technically needed but it makes diffs cleaner if another
config is later added.


> @@ -362,6 +390,10 @@ static int ps8640_probe(struct i2c_client *client)
>
>         ps_bridge->page[PAGE0_DP_CNTL] = client;
>
> +       ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
> +       if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]))
> +               return PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]);

I'm a huge fan of dev_err_probe(). I wonder if it makes sense to use
it here? Untested:

if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]))
  return dev_err_probe(dev, PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]),
                       "Error initting page 0 regmap\n");


All of that is just nits, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
