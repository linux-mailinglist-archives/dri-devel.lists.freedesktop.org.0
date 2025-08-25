Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8EB34DD0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 23:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A357F10E57E;
	Mon, 25 Aug 2025 21:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Xwc/AG9l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8310E57E;
 Mon, 25 Aug 2025 21:20:16 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id A1B50BDC8F;
 Tue, 26 Aug 2025 00:20:14 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id C7D5EBDC9B;
 Tue, 26 Aug 2025 00:20:13 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 56FAA2066DE;
 Tue, 26 Aug 2025 00:20:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756156813;
 bh=KgSSMGx/B32WUtsQsFXAJ17WR6GiQsGYag+yC0UbfHk=;
 h=Received:From:Subject:To;
 b=Xwc/AG9lF6hJ96clFm7RX+DAFEzExkmSgNcPrg7hDS3WmH+3ru7KTqGvzsSN1b8YJ
 c2ttx9yWtq3drMoJ3AYt5YWKgE+Q7hJCnAr2otQ5PbtD+RqGkC4qk4okNwl7B3lPg7
 STkveQPNeIJF+QpArgqPwehNy2MjdiOUwM21krz2NRQtbbl73493j/3FLgLAtid8Ev
 fkjE8UOUjNj1N9eQ6JvGUsVdjYPYfG1zBVlGTzkTnZIObZ4azOeFc+sTigMcrWEjin
 x3y0UwKmujnNWCQw7az/6MiSfNVd64R2iMg6oC2Exfda9Qgw1c+RMcEywhFNvmAg2A
 1Q6nIABZ8y7DQ==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3366f66a04cso12791271fa.1;
 Mon, 25 Aug 2025 14:20:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXI0ZQZy8LImu03vzMY/5u9bcxUS6HDnnGFBVleSJycNHcjdNax/3WQNcGrkRCPR4iaXksUvIZ6dbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCf3wNkyHMYgjcN7vvPioRIIfXovyTl6/Q6dC7PYq0Bi04a00I
 F2dmtzMhAjVqhiULcK9Glb4wYyqi6gwH5LZzi3drHdbl/tKN7dsfAjqGVVQ5+jWe1+bc7oXmuz3
 R+J67CxPcdfDiasi6tkEEosFHT+Bofyo=
X-Google-Smtp-Source: AGHT+IEA9Wte1D1s19GhOV4s9u6F9hdWvU6Jgp3IV/NHyEfAf7tLqnG55bJaLrHLu+D+YKMLbbjnSB9gv6m7aH5FEGA=
X-Received: by 2002:a2e:be11:0:b0:336:853d:27fe with SMTP id
 38308e7fff4ca-336853d30bamr2594421fa.6.1756156812789; Mon, 25 Aug 2025
 14:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-6-lkml@antheas.dev>
 <f1ba9808-64a5-4d64-a4ef-b2a95cebae94@amd.com>
 <CAGwozwEGdcyFnOADrCTb2cUDvq8H0kxtA+KRb_Kz5De1eFXztQ@mail.gmail.com>
 <0e1e33a6-70a0-40a0-86d9-b8f636b19455@amd.com>
In-Reply-To: <0e1e33a6-70a0-40a0-86d9-b8f636b19455@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 25 Aug 2025 23:20:00 +0200
X-Gmail-Original-Message-ID: <CAGwozwHuHnwq+OyFLVfMu15LPUKeX3Nz=_uPC50FS2ZFEhWhOg@mail.gmail.com>
X-Gm-Features: Ac12FXzF-z-S7YFMSUmFPXde2xWrC8T6vtTTCTpOcIGJNlg2lleTcvBQdUzjUuM
Message-ID: <CAGwozwHuHnwq+OyFLVfMu15LPUKeX3Nz=_uPC50FS2ZFEhWhOg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm: panel-backlight-quirks: Add Steam Decks
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, philm@manjaro.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <175615681352.2935778.15642475613166709037@linux3247.grserver.gr>
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

On Mon, 25 Aug 2025 at 23:05, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 8/25/2025 4:02 PM, Antheas Kapenekakis wrote:
> > On Mon, 25 Aug 2025 at 18:47, Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> On 8/24/2025 3:02 PM, Antheas Kapenekakis wrote:
> >>> On the SteamOS kernel, Valve universally makes minimum brightness 0
> >>> for all devices. SteamOS is (was?) meant for the Steam Deck, so
> >>> enabling it universally is reasonable. However, it causes issues in
> >>> certain devices. Therefore, introduce it just for the Steam Deck here.
> >>>
> >>> SteamOS kernel does not have a public mirror, but this replaces commit
> >>> 806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
> >>> in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
> >>> See unofficial mirror reconstructed from sources below.
> >>>
> >>> Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>
> >> Directionally I agree with this commit in favor of what the downstream
> >> kernel tree has that you linked above.
> >>
> >> But I would rather see it sent alone and not tied to a series to
> >> overhaul how quirks work.  If it's sent alone we should be able to get
> >> it reviewed pretty easily and in drm-misc-fixes.
> >
> > That's a good idea. However, this commit relies on patch 1 and 3, as
> > it has no edid information and uses a second match.
>
> The EDID half should be a solvable problem.  IE the EDIDs for Steam Deck
> and Steam Deck OLED are known quantities, or a least trivial to dump.
>
> And once you have the EDID in place I'm not sure if you need a second
> match anymore or not really (at least for SD/SD OLED).

Yeah. Perhaps for those you are right. The information should be in
gamescope in github. I think there are four panels.

I need to start logging edid information on bug reports though,
otherwise I would not say it is trivial, esp. for the four devices
that need the luminance quirk.

> >
> > Antheas
> >
> >>>    drivers/gpu/drm/drm_panel_backlight_quirks.c | 17 ++++++++++++++++-
> >>>    1 file changed, 16 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> >>> index 78c430b07d6a..5c24f4a86519 100644
> >>> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> >>> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> >>> @@ -73,7 +73,22 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
> >>>                .dmi_match_other.field = DMI_PRODUCT_NAME,
> >>>                .dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
> >>>                .quirk = { .brightness_mask = 3, },
> >>> -     }
> >>> +     },
> >>> +     /* Steam Deck models */
> >>> +     {
> >>> +             .dmi_match.field = DMI_SYS_VENDOR,
> >>> +             .dmi_match.value = "Valve",
> >>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
> >>> +             .dmi_match_other.value = "Jupiter",
> >>> +             .quirk = { .min_brightness = 1, },
> >>> +     },
> >>> +     {
> >>> +             .dmi_match.field = DMI_SYS_VENDOR,
> >>> +             .dmi_match.value = "Valve",
> >>> +             .dmi_match_other.field = DMI_PRODUCT_NAME,
> >>> +             .dmi_match_other.value = "Galileo",
> >>> +             .quirk = { .min_brightness = 1, },
> >>> +     },
> >>>    };
> >>>
> >>>    static bool drm_panel_min_backlight_quirk_matches(
> >>
> >>
> >
>
>

