Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB186FE47
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B38710FF10;
	Mon,  4 Mar 2024 10:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9C110FF10
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:05:29 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6093e067220so38171407b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709546726; x=1710151526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oy2SzYfcUDrGL3J66h8Xddc1g80levpMxXsFMRTfvtY=;
 b=Gd1X4zL054/YAPR/G7iRST4w0MTH0ABU3Ih7x422jHVavB/HjhVOrwjccfftLfX2J1
 R16dMRK+cHHsKLPPviZWngr6JxzcuQVAnMfiODvCy6hlJvmLCoqAdlxszXkt/3wHCuDV
 R9qIMA/6BH7OO/UEQmpETI/Dr1sEnCNjd7njIXhUwkZMFPX8GboJnGoxCFrTpd8xeFDp
 /kwrxP2+NKuaf1OTfMpVJ/fZsOUtsP1NWcIwABZJJ1/huO2wu+9yPvyJUbECtL8zQ9Lq
 WLS4iCZeg83vTn8ogFuUO1u7bYBFAvDSA8QuvgiwYh1mRrPkKEJNXL6Z0W/OAKuc8qnU
 8PKQ==
X-Gm-Message-State: AOJu0Yy82UtkFQElSF4ZyzuQWu7A7FwSbYJW39DQcTMGeBsDjO23zLqA
 EFguRvPHQfA3dOmN6xiY8PiN/+sAHeAkMHFlmKPSXziJMrag0ujQmRWo6Ifz1cc=
X-Google-Smtp-Source: AGHT+IF/fyHDk7FzGSSkPRgvd97GPh2aAbIN04NDgQDKNjcxQeqoZ1fa4fKG5LATBATiO87Ol6Rz7A==
X-Received: by 2002:a81:79d8:0:b0:609:846b:aa5f with SMTP id
 u207-20020a8179d8000000b00609846baa5fmr7377137ywc.41.1709546726526; 
 Mon, 04 Mar 2024 02:05:26 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 c7-20020a81c947000000b006049de6fa26sm2493573ywl.57.2024.03.04.02.05.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 02:05:26 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc74435c428so4625882276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 02:05:25 -0800 (PST)
X-Received: by 2002:a25:2b89:0:b0:dcf:288e:21ca with SMTP id
 r131-20020a252b89000000b00dcf288e21camr6044369ybr.11.1709546725700; Mon, 04
 Mar 2024 02:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20240304091225.366325-1-mripard@kernel.org>
In-Reply-To: <20240304091225.366325-1-mripard@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Mar 2024 11:05:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-H=yvY-fhADXKtbFY4NnhTinXxk-Xbr-69H1_aR0cPQ@mail.gmail.com>
Message-ID: <CAMuHMdW-H=yvY-fhADXKtbFY4NnhTinXxk-Xbr-69H1_aR0cPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: hdmi: Fix u64 div on 32bit arch
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 kernel test robot <lkp@intel.com>
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

Hi Maxime,

Thanks for your patch!

On Mon, Mar 4, 2024 at 10:12=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> Commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and
> mode_valid") changed the clock rate from an unsigned long to an unsigned
> long long resulting in a a 64-bit division that might not be supported
> on all platforms.

Why was this changed to unsigned long long?
Can a valid pixel clock really not fit in 32-bit?

> The resulted in compilation being broken at least for m68k, xtensa and
> some arm configurations, at least.
>
> Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_=
valid")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+k=
K9Zop6u=3Dywmw@mail.gmail.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403011839.KLiXh4wC-lkp@i=
ntel.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -163,11 +163,11 @@ static enum drm_mode_status
>  sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
>                                  const struct drm_display_mode *mode,
>                                  unsigned long long clock)
>  {
>         const struct sun4i_hdmi *hdmi =3D drm_connector_to_sun4i_hdmi(con=
nector);
> -       unsigned long diff =3D clock / 200; /* +-0.5% allowed by HDMI spe=
c */
> +       unsigned long diff =3D div_u64(clock, 200); /* +-0.5% allowed by =
HDMI spec */

I'd rather see clock changed back to unsigned long.

>         long rounded_rate;
>
>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>                 return MODE_BAD;
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
