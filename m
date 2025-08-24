Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35EFB33260
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 21:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2C10E203;
	Sun, 24 Aug 2025 19:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Lkrw/QNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992210E203;
 Sun, 24 Aug 2025 19:34:03 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id E9C3B4637A;
 Sun, 24 Aug 2025 22:34:01 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id A17084634F;
 Sun, 24 Aug 2025 22:34:00 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id E3FCD1FF729;
 Sun, 24 Aug 2025 22:33:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756064040;
 bh=FO7P5D7yox0EP4cdvKTLPi2yl1V7XKqyY3X/+jd53jY=;
 h=Received:From:Subject:To;
 b=Lkrw/QNNqv+73HOAr4bdCy34NRSy9rI6mben8jL/YaOFpEEn4HEmFrAebN1DhsL89
 7EhsIGoOxL+O0EyHxlVeKAUegzFNyqJVaKrgoglRyYNGGYYOsmvPKY0teV7Vc3I0G0
 NXuBda6fmLkCywXltUQhKef7DDIpKKRFTUjBUbes47Jji5iDoigGarQ9wOTcdt5CvX
 JoovGLP0aaCtkgYj52hio04+Faq3+zV67lD4U839fFdAWadm92cp6qSKauJ+f7kvf5
 QY1UoWqqGWspwBwQXvMPy6+m0/q5W5TwMdg/dy/VGEozUSqCm+BKR51nB+v3SZVp8i
 FC7MiZPOJrDYg==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3364e945ce7so22317431fa.1;
 Sun, 24 Aug 2025 12:33:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YxlNShUzUN9IHfn8JIwqbxBBH1A2pk5LWeS6cNPKsMtnKtPwSdW
 0bPDwlUtKSLXiEnUqBUdWikcjrorzpn5ZxT2NIlNEjVdsp8fBssnKKjuOvDUKAK5eB8GBZKVxUR
 DlEcDozvG3JBnRqdFJPF2wyM9+6MAwQw=
X-Google-Smtp-Source: AGHT+IGY0rDs0kClJQVQH2fIcccJT8iGCa1xORUIDDflp5Zi0bohdpW5Q4OqIN4bwO60cUCeMSFXqbEbJ4VujP9Gz2s=
X-Received: by 2002:a05:651c:110d:b0:32f:1df5:aca1 with SMTP id
 38308e7fff4ca-33650f99907mr22871231fa.22.1756064039329; Sun, 24 Aug 2025
 12:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250824085351.454619-1-lkml@antheas.dev>
 <20250824085351.454619-2-lkml@antheas.dev>
In-Reply-To: <20250824085351.454619-2-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 24 Aug 2025 21:33:47 +0200
X-Gmail-Original-Message-ID: <CAGwozwH7m5CgGiK5Xu_q0JbJvRQbcHkgQd9nFXJNq3DQhWO7QQ@mail.gmail.com>
X-Gm-Features: Ac12FXyKjPTDZSp_1B8GyHbueZzBn-qOItLYTnPwoc8HrcP795BSb-kYcepP-yE
Message-ID: <CAGwozwH7m5CgGiK5Xu_q0JbJvRQbcHkgQd9nFXJNq3DQhWO7QQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/amd/display: Adjust AUX brightness to be a
 granularity of 100
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Peyton Lee <peytolee@amd.com>, 
 Lang Yu <lang.yu@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <175606404020.795271.4027913057195354646@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On Sun, 24 Aug 2025 at 10:54, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> Certain OLED devices malfunction on specific brightness levels.
> Specifically, when DP_SOURCE_BACKLIGHT_LEVEL is written to with
> the minor byte being 0x00 and sometimes 0x01, the panel forcibly
> turns off until the device sleeps again. This is an issue on
> multiple handhelds, including OneXPlayer F1 Pro and Ayaneo 3
> (the panel is suspected to be the same-1080p 7in OLED).
>
> Below are some examples. This was found by iterating over brighness
> ranges while printing DP_SOURCE_BACKLIGHT_LEVEL. It was found that
> the screen would malfunction on specific values, and some of them
> were collected.
>
> Broken:
>  86016:  10101000000000000
>  86272:  10101000100000000
>  87808:  10101011100000000
> 251648: 111101011100000000
> 251649: 111101011100000001
>
> Working:
>  86144:  10101000010000000
>  87809:  10101011100000001
> 251650: 111101011100000010
>
> The reason for this is that the range manipulation is too granular.
> AUX is currently written to with a granularity of 1. Forcing 100,
> which on the Ayaneo 3 OLED yields 400*10=4000 values, is plenty of
> granularity and fixes this issue. Iterating over the values through
> Python shows that the final byte is never 0x00, and testing over the
> entire range with a cadence of 0.2s/it and 73 increments (to saturate
> the range) shows no issues. Windows likewise shows no issues.

Well Phil managed to fall into the value 332800, which has a 0 minor
bit. Unfortunate. In hindsight, every 256 hundreds there would be a
zero anyway.

Before I made this patch I made a partial refactor of panel-quirks
where a quirk like this could go to. But I would really prefer not to
do quirks. Ill send that too.

Antheas

> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3803
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++++--------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cd0e2976e268..bb16adcafb88 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4739,7 +4739,8 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
>  }
>
>  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> -                               unsigned int *min, unsigned int *max)
> +                               unsigned int *min, unsigned int *max,
> +                               unsigned int *multiple)
>  {
>         if (!caps)
>                 return 0;
> @@ -4748,10 +4749,12 @@ static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
>                 // Firmware limits are in nits, DC API wants millinits.
>                 *max = 1000 * caps->aux_max_input_signal;
>                 *min = 1000 * caps->aux_min_input_signal;
> +               *multiple = 100;
>         } else {
>                 // Firmware limits are 8-bit, PWM control is 16-bit.
>                 *max = 0x101 * caps->max_input_signal;
>                 *min = 0x101 * caps->min_input_signal;
> +               *multiple = 1;
>         }
>         return 1;
>  }
> @@ -4813,23 +4816,25 @@ static void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *cap
>  static u32 convert_brightness_from_user(const struct amdgpu_dm_backlight_caps *caps,
>                                         uint32_t brightness)
>  {
> -       unsigned int min, max;
> +       unsigned int min, max, multiple;
>
> -       if (!get_brightness_range(caps, &min, &max))
> +       if (!get_brightness_range(caps, &min, &max, &multiple))
>                 return brightness;
>
>         convert_custom_brightness(caps, min, max, &brightness);
>
> -       // Rescale 0..max to min..max
> -       return min + DIV_ROUND_CLOSEST_ULL((u64)(max - min) * brightness, max);
> +       // Rescale 0..max to min..max rounding to nearest multiple
> +       return rounddown(
> +               min + DIV_ROUND_CLOSEST_ULL((u64)(max - min) * brightness, max),
> +               multiple);
>  }
>
>  static u32 convert_brightness_to_user(const struct amdgpu_dm_backlight_caps *caps,
>                                       uint32_t brightness)
>  {
> -       unsigned int min, max;
> +       unsigned int min, max, multiple;
>
> -       if (!get_brightness_range(caps, &min, &max))
> +       if (!get_brightness_range(caps, &min, &max, &multiple))
>                 return brightness;
>
>         if (brightness < min)
> @@ -4970,7 +4975,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>         struct backlight_properties props = { 0 };
>         struct amdgpu_dm_backlight_caps *caps;
>         char bl_name[16];
> -       int min, max;
> +       int min, max, multiple;
>
>         if (aconnector->bl_idx == -1)
>                 return;
> @@ -4983,15 +4988,16 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
>         }
>
>         caps = &dm->backlight_caps[aconnector->bl_idx];
> -       if (get_brightness_range(caps, &min, &max)) {
> +       if (get_brightness_range(caps, &min, &max, &multiple)) {
>                 if (power_supply_is_system_supplied() > 0)
>                         props.brightness = DIV_ROUND_CLOSEST((max - min) * caps->ac_level, 100);
>                 else
>                         props.brightness = DIV_ROUND_CLOSEST((max - min) * caps->dc_level, 100);
>                 /* min is zero, so max needs to be adjusted */
>                 props.max_brightness = max - min;
> -               drm_dbg(drm, "Backlight caps: min: %d, max: %d, ac %d, dc %d\n", min, max,
> -                       caps->ac_level, caps->dc_level);
> +               drm_dbg(drm,
> +                       "Backlight caps: min: %d, max: %d, ac %d, dc %d, multiple: %d\n",
> +                       min, max, caps->ac_level, caps->dc_level, multiple);
>         } else
>                 props.brightness = props.max_brightness = MAX_BACKLIGHT_LEVEL;
>
> --
> 2.50.1
>
>

