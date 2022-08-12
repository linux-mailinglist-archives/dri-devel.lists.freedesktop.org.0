Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E7591160
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF836B33D9;
	Fri, 12 Aug 2022 13:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3EB34B2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:27:33 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id b2so722110qkh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=aaWmraAyVdsxzOKXcrqOwgi0BA7kWyk0fbcE3gB04Gk=;
 b=zZpWf2MohR1c2kggQpb0aixYLvIaR2KvISI/Pk5iG3eVedMjK66l/FP81l62MLksp3
 LTvnL7JsEVz9xwYEUiUhe1jUruTCdqEhnZmRKHUMRwuSHKWHiPN08K2RmbiTy2gfC94d
 YXOolbgSGlHY9ZG/7gjPWt43vyZTkO7tIBuL489sU0SvDwW6kWZtVMLvTG/yFWtLuaKb
 +rHI//KveBVMUIXoziYG3Z+byJQAErJNdZBP0Far+pFXG6xnm3EG1jVsZS6Z/FIR3OK9
 XpZl/8zVHkwibXrCmNWavnlShcC/t5EEcTFnqOH4R9+fL2WCtpmZGpBPgtPACHvhCtNL
 Aa5A==
X-Gm-Message-State: ACgBeo2Vpz+qYyijmtXk4Cn7cdEZ0a+e8v+KVzJVGn63LI323MQyW6fW
 lGK0W3jHs5cjUZVLo8Unv2iOmbUycxQcGA==
X-Google-Smtp-Source: AA6agR6AMYFgqfslJw38mdAFZE19VHeRDRs1bxGVmHYW+vwTQPJSC/8u8lbXHDOSq1vzRByFcoW6EA==
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id
 x7-20020a05620a258700b006a7ee6fbf2amr2781806qko.542.1660310852373; 
 Fri, 12 Aug 2022 06:27:32 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05620a268300b006b5d9a1d326sm1783545qkp.83.2022.08.12.06.27.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 06:27:30 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 21so1481766ybf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:27:29 -0700 (PDT)
X-Received: by 2002:a25:da0b:0:b0:67a:7fb6:8ae with SMTP id
 n11-20020a25da0b000000b0067a7fb608aemr3414026ybf.89.1660310848820; Fri, 12
 Aug 2022 06:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-9-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:27:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Message-ID: <CAMuHMdUiMEybnhgxgBXh1Cbv6syVe9iVU=sb17zHM72R8A2Dew@mail.gmail.com>
Subject: Re: [PATCH v1 09/35] drm/modes: Move named modes parsing to a
 separate function
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Fri, Jul 29, 2022 at 6:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch, which looks similar to my "[PATCH v2 2/5]
drm/modes: Extract drm_mode_parse_cmdline_named_mode()"
(https://lore.kernel.org/dri-devel/1371554419ae63cb54c2a377db0c1016fcf200bb.1657788997.git.geert@linux-m68k.org
;-)

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1773,6 +1773,28 @@ static const char * const drm_named_modes_whitelist[] = {
>         "PAL",
>  };
>
> +static bool drm_mode_parse_cmdline_named_mode(const char *name,
> +                                             unsigned int name_end,
> +                                             struct drm_cmdline_mode *cmdline_mode)
> +{
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> +               int ret;
> +
> +               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> +               if (ret != name_end)
> +                       continue;
> +
> +               strcpy(cmdline_mode->name, drm_named_modes_whitelist[i]);
> +               cmdline_mode->specified = true;
> +
> +               return true;
> +       }
> +
> +       return false;

What's the point in returning a value, if it is never checked?
Just make this function return void?

> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -1848,18 +1870,14 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>                 parse_extras = true;
>         }
>
> -       /* First check for a named mode */
> -       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -               if (ret == mode_end) {
> -                       if (refresh_ptr)
> -                               return false; /* named + refresh is invalid */
> +       /*
> +        * Having a mode that starts by a letter (and thus is named) and
> +        * an at-sign (used to specify a refresh rate) is disallowed.
> +        */
> +       if (!isdigit(name[0]) && refresh_ptr)

This condition may have to be relaxed, if we want to support e.g.
"hd720p@50", cfr. my comments on "[PATCH v1 05/35] drm/connector:
Add TV standard property".

> +               return false;
>
> -                       strcpy(mode->name, drm_named_modes_whitelist[i]);
> -                       mode->specified = true;
> -                       break;
> -               }
> -       }
> +       drm_mode_parse_cmdline_named_mode(name, mode_end, mode);

This call needs to be conditional on mode_end being non-zero, cfr. my
patch "[PATCH v2 1/5] drm/modes: parse_cmdline: Handle empty mode name
part" (https://lore.kernel.org/dri-devel/302d0737539daa2053134e8f24fdf37e3d939e1e.1657788997.git.geert@linux-m68k.org).

>
>         /* No named mode? Check for a normal mode argument, e.g. 1024x768 */
>         if (!mode->specified && isdigit(name[0])) {


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
