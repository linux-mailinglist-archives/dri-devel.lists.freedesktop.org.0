Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5975770A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE1C88C3D;
	Tue, 18 Jul 2023 08:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382CC88C3D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:50:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FED8614CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D73C433CA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689670201;
 bh=tRxUGjHzdMRNxsqtXPPmao2+Um7MzStinRn6vhwmK3k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SdlRtdnP07pYXVTobZi7HP7g1NB8VokGrWO7PlSJZsF+qmStOKBTwFXr8as7ZbxyG
 H8/+SPqmBWoKH0KIpfX0BYU14DGGhrW9gGnX9pHYTSJgZXPLjsXP2vHn6duJB5xw6t
 J9Vvw57KBeXJScAaZ3o0mqjByTU3FK5lcihj3rkOiZaY6LmVynlmFlrJEPb0s0UYq8
 gW86z68am/npar1tNII5wRJw0Qqabl4Yo73ZTZip3ma1rG09hgLR0wMsXubDWsaLfz
 kry0FiEJQOmaALaPQN0RR4noqs1v6xkJMUNsyuljF+qIv8sbwCf3lMiJ+sOmbptl8+
 4Fy1SlGewrnLQ==
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3487d75e4c5so14785555ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:50:01 -0700 (PDT)
X-Gm-Message-State: ABy/qLav2xKIpFda7gCtKUjdluH85+M47l7Cdaxs73zNL2XqtMnZzONw
 yDbQO1CpiW0jrDW8Kfgc/KGtUfUy5KAOEYqD+/zsLA==
X-Google-Smtp-Source: APBJJlEjrkMkL6YQW10tWpvyxtSYCpxBJXwE+BKX6MekUeQHTyOoNhFQ1KzzT238MsAy1riC4d4HryxNeIhtdivNCYQ=
X-Received: by 2002:a05:6e02:1bae:b0:348:1a1d:79a5 with SMTP id
 n14-20020a056e021bae00b003481a1d79a5mr2270153ili.15.1689670200374; Tue, 18
 Jul 2023 01:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230718084215.12767-1-alex@shruggie.ro>
In-Reply-To: <20230718084215.12767-1-alex@shruggie.ro>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 18 Jul 2023 10:49:48 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5+WV65FSpuzjJY46beHU8SkOMYfZNS3DnXiVft_6MG4A@mail.gmail.com>
Message-ID: <CAN6tsi5+WV65FSpuzjJY46beHU8SkOMYfZNS3DnXiVft_6MG4A@mail.gmail.com>
Subject: Re: [PATCH v3] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
To: Alexandru Ardelean <alex@shruggie.ro>
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nuno.sa@analog.com, bogdan.togorean@analog.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 10:42=E2=80=AFAM Alexandru Ardelean <alex@shruggie.=
ro> wrote:
>
> From: Bogdan Togorean <bogdan.togorean@analog.com>
>
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
>
> Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>
> Changelog v2 -> v3:
> * https://lore.kernel.org/dri-devel/1c3fde3a873b0f948d3c4d37107c5bb67dc9f=
7bb.camel@gmail.com/T/#u
> * Added my S-o-b tag back
>
> Changelog v1 -> v2:
> * https://lore.kernel.org/dri-devel/20190716131005.761-1-bogdan.togorean@=
analog.com/
> * added Fixes: tag
> * added Reviewed-by: tag for Nuno
>
>
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index ddceafa7b637..09290a377957 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511=
,
>         else
>                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
>
> -       regmap_update_bits(adv7511->regmap, 0xfb,
> -               0x6, low_refresh_rate << 1);
> +       if (adv7511->type =3D=3D ADV7511)
> +               regmap_update_bits(adv7511->regmap, 0xfb,
> +                       0x6, low_refresh_rate << 1);
> +       else
> +               regmap_update_bits(adv7511->regmap, 0x4a,
> +                       0xc, low_refresh_rate << 2);
> +
>         regmap_update_bits(adv7511->regmap, 0x17,
>                 0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>
> --
> 2.41.0
>

This looks good, but I'm seeing some checkpatch style warnings, with
those fixed feel free to add my r-b.

CHECK: Alignment should match open parenthesis
#32: FILE: drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:791:
+        regmap_update_bits(adv7511->regmap, 0xfb,
+            0x6, low_refresh_rate << 1);

CHECK: Alignment should match open parenthesis
#35: FILE: drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:794:
+        regmap_update_bits(adv7511->regmap, 0x4a,
+            0xc, low_refresh_rate << 2);

total: 0 errors, 0 warnings, 2 checks, 15 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.

Commit 1955dfe734e4 ("drm: adv7511: Fix low refresh rate register for
ADV7533/5") has style problems, please review.

NOTE: If any of the errors are false positives, please report
