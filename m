Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB1359115B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555C3B3376;
	Fri, 12 Aug 2022 13:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14262B3349
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 13:25:56 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id m5so740518qkk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=OXdSHuVG78f8K6rpNcMaWPwy/pvmJ+nqUgx8dG2xzfs=;
 b=wJD1UBbp4RqkFFQ5GtECOnyrKhtSiBNOOOEP8FK/8bE6Mb20y2HnhWvkc3OV3Fds3T
 CiYMt2JCFVZ5vBGaehLHCtJg6nQWm6M5pTCLYVHh06Beq9NpEKSgTUMg2ANAuIkYN4Di
 SRMg6zAR1cQNJO1iBBdWx2zQbyA41dr47UKJ2nReSWTqW4iCmUaAsRxcaaSJ+xzt0IyP
 fm1B/S/kI9OqT+5sEUAaF8MET7zBFpg5nFr1krp9ZfV1K7cie6GRbbKyyA+UpHqWIixK
 Rtu7pIXaOSdPP6QK+Ls0/6VgZYrTidUd58JQs4yst+53yDR3BZ1TW02dou1fgxEpynyH
 McEw==
X-Gm-Message-State: ACgBeo3w4O3GNLAv8QE/fhRDjjllmJXbMs87/TpliVKXdYKeTWpl1lyD
 9/g/2y5NsJ4PpSgVy5c+J561GxGzUg4V6A==
X-Google-Smtp-Source: AA6agR7XZM2m78h42XfghRzRePF8SvmGXmkrKUqv1aWE2MlK1uRTysS+mv1CSs5vsLRz+1n0WYja6A==
X-Received: by 2002:a37:a957:0:b0:6ba:dfff:df61 with SMTP id
 s84-20020a37a957000000b006badfffdf61mr739655qke.519.1660310754774; 
 Fri, 12 Aug 2022 06:25:54 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 br15-20020a05620a460f00b006b99975ad62sm1760396qkb.48.2022.08.12.06.25.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 06:25:52 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id i62so1475286yba.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 06:25:51 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr3307653ybq.543.1660310750947; Fri, 12
 Aug 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-7-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:25:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Message-ID: <CAMuHMdWa9soLHSvmxWqjKAO93WhViww6GZiC9qh0RccVENPRYw@mail.gmail.com>
Subject: Re: [PATCH v1 07/35] drm/modes: Only consider bpp and refresh before
 options
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

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Some video= options might have a value that contains a dash. However, the
> command line parsing mode considers all dashes as the separator between the
> mode and the bpp count.
>
> Let's rework the parsing code a bit to only consider a dash as the bpp
> separator if it before a comma, the options separator.
>
> A follow-up patch will add a unit-test for this once such an option is
> introduced.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1819,20 +1819,22 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>
>         name = mode_option;
>
> +       /* Locate the start of named options */
> +       options_ptr = strchr(name, ',');
> +       if (options_ptr)
> +               options_off = options_ptr - name;
> +       else
> +               options_off = strlen(name);
> +
>         /* Try to locate the bpp and refresh specifiers, if any */
> -       bpp_ptr = strchr(name, '-');
> +       bpp_ptr = strnchr(name, options_off, '-');

Probably you still want to add a check that the next character
is actually a digit, cfr. my "[PATCH v2 5/5] drm/modes:
parse_cmdline: Add support for named modes containing dashes"
(https://lore.kernel.org/dri-devel/2eb205da88c3cb19ddf04d167ece4e16a330948b.1657788997.git.geert@linux-m68k.org)?

>         if (bpp_ptr)
>                 bpp_off = bpp_ptr - name;
>
> -       refresh_ptr = strchr(name, '@');
> +       refresh_ptr = strnchr(name, options_off, '@');
>         if (refresh_ptr)
>                 refresh_off = refresh_ptr - name;
>
> -       /* Locate the start of named options */
> -       options_ptr = strchr(name, ',');
> -       if (options_ptr)
> -               options_off = options_ptr - name;
> -
>         /* Locate the end of the name / resolution, and parse it */
>         if (bpp_ptr) {
>                 mode_end = bpp_off;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
