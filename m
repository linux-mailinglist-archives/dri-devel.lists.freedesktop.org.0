Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A27325A604A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 12:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED1D10E00C;
	Tue, 30 Aug 2022 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC210E00C;
 Tue, 30 Aug 2022 10:07:09 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id c20so8094973qtw.8;
 Tue, 30 Aug 2022 03:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=B6sPmfOEwPF2h7f07mGfudT4aQe+F6kN6ETICFIZHMY=;
 b=o4+XEGitnnYqoqgpcZSIvG7RMttE7byKzwJfldKa3rgmfRywsHWOGZFZwmR2Gys3GK
 NtKbFA4Ho3GdaYUwo1PZp0O5x+Ew5maD9izZYp0K3w5A+S+o3xxRmpJLw1ZDaxSO+Opu
 ZIitImslMx8RuWP9OEpkuQXeILQVLpe4ZzS210YKI1eSqoK0Hm/Op/33kMjkZ2QEgBZa
 iB3YzwubfFebxXwhtqPNBYhJSH1Sib+OUA59igCYBo+Q2rL6gK4Mgl68Cf16R8co5pmg
 /pjeR7ohR8Zgp3Hp+DyoQndiNBvDVXbMZvo7swgW+BGcGusDvHsKPjfU8iJP/uHesJJu
 xOWw==
X-Gm-Message-State: ACgBeo0ssKdgqMiDSPPeZ6qKYLi2evRqxWnKGweBCspI4XCBekPqnvi/
 QBjMt8x+kFOxEx+EbSZRe/Nvr/zLpz8l8g==
X-Google-Smtp-Source: AA6agR7HTStCAJjuMUvrtkPAuP1jQedksE3tAKTXBMgTCKhbb2AQh+bPCaiA2m4ZBWoTGlm8li0dLA==
X-Received: by 2002:a05:622a:1788:b0:344:7c86:f9a1 with SMTP id
 s8-20020a05622a178800b003447c86f9a1mr13617175qtk.22.1661854028519; 
 Tue, 30 Aug 2022 03:07:08 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 az11-20020a05620a170b00b006bbd0ae9c05sm8039630qkb.130.2022.08.30.03.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 03:07:07 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-3321c2a8d4cso260683937b3.5; 
 Tue, 30 Aug 2022 03:07:07 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr10033148ybl.604.1661854027231; Tue, 30
 Aug 2022 03:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-14-459522d653a7@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2022 12:06:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Message-ID: <CAMuHMdV9wVgHFfwHoqtBoYzJDnjDmKTfaZkAKvTVKh1Y-2x1pA@mail.gmail.com>
Subject: Re: [PATCH v2 14/41] drm/modes: Move named modes parsing to a
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Ben Skeggs <bskeggs@redhat.com>, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Aug 29, 2022 at 3:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The current construction of the named mode parsing doesn't allow to extend
> it easily. Let's move it to a separate function so we can add more
> parameters and modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1909,6 +1909,9 @@ void drm_connector_list_update(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_list_update);
>
> +#define STR_STRICT_EQ(str, len, cmp) \
> +       ((strlen(cmp) == len) && !strncmp(str, cmp, len))

This is not part of the move, but newly added.

> +
>  static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
>                                       struct drm_cmdline_mode *mode)
>  {
> @@ -2208,6 +2211,52 @@ static const char * const drm_named_modes_whitelist[] = {
>         "PAL",
>  };
>
> +static int drm_mode_parse_cmdline_named_mode(const char *name,
> +                                            unsigned int name_end,
> +                                            struct drm_cmdline_mode *cmdline_mode)
> +{
> +       unsigned int i;
> +
> +       if (!name_end)
> +               return 0;

This is already checked by the caller.

> +
> +       /* If the name starts with a digit, it's not a named mode */
> +       if (isdigit(name[0]))
> +               return 0;
> +
> +       /*
> +        * If there's an equal sign in the name, the command-line
> +        * contains only an option and no mode.
> +        */
> +       if (strnchr(name, name_end, '='))
> +               return 0;
> +
> +       /* The connection status extras can be set without a mode. */
> +       if (STR_STRICT_EQ(name, name_end, "d") ||
> +           STR_STRICT_EQ(name, name_end, "D") ||
> +           STR_STRICT_EQ(name, name_end, "e"))
> +               return 0;

These checks are not part of the move, and should probably be added
in a separate patch.

> +
> +       /*
> +        * We're sure we're a named mode at that point, iterate over the
> +        * list of modes we're aware of.
> +        */
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
> +               return 1;
> +       }
> +
> +       return -EINVAL;
> +}
> +
>  /**
>   * drm_mode_parse_command_line_for_connector - parse command line modeline for connector
>   * @mode_option: optional per connector mode option
> @@ -2244,7 +2293,7 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>         const char *bpp_ptr = NULL, *refresh_ptr = NULL, *extra_ptr = NULL;
>         const char *options_ptr = NULL;
>         char *bpp_end_ptr = NULL, *refresh_end_ptr = NULL;
> -       int i, len, ret;
> +       int len, ret;
>
>         memset(mode, 0, sizeof(*mode));
>         mode->panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> @@ -2285,17 +2334,19 @@ bool drm_mode_parse_command_line_for_connector(const char *mode_option,
>                 parse_extras = true;
>         }
>
> -       /* First check for a named mode */
> -       for (i = 0; i < ARRAY_SIZE(drm_named_modes_whitelist); i++) {
> -               ret = str_has_prefix(name, drm_named_modes_whitelist[i]);
> -               if (ret == mode_end) {
> -                       if (refresh_ptr)
> -                               return false; /* named + refresh is invalid */
>
> -                       strcpy(mode->name, drm_named_modes_whitelist[i]);
> -                       mode->specified = true;
> -                       break;
> -               }
> +       if (mode_end) {
> +               ret = drm_mode_parse_cmdline_named_mode(name, mode_end, mode);
> +               if (ret < 0)
> +                       return false;
> +
> +               /*
> +                * Having a mode that starts by a letter (and thus is named)
> +                * and an at-sign (used to specify a refresh rate) is
> +                * disallowed.
> +                */
> +               if (ret && refresh_ptr)
> +                       return false;
>         }
>
>         /* No named mode? Check for a normal mode argument, e.g. 1024x768 */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
