Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C645780E920
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 11:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8442710E5A7;
	Tue, 12 Dec 2023 10:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC8810E5A7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 10:29:12 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5c6734e0c22so2683592a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 02:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702376951; x=1702981751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHmbx/TAJnGNEEz0o7g8cBj5c1EY3ZNmozjuVxS5uaw=;
 b=XEXtGtj6HAWQ8XCySodpVkik5OvE9IebQZCHT08ZMBQZ3QrxMxv6RU0VGIiA25P5wy
 zu0aB7YfPwd+yIWa80FM1VHxN5J7u6wkXOqQ7MOm7HFcq0Dr9FS1ppQCWhDu3USuAWRA
 T2kY2m/hp8TcWE71StGdnIh+5ukyErtcpiVUHOeSwqB+JHC4rlTeGQd4zVgJpdGeLymQ
 GthSyoQPLpZfS3otZRsEUS79xnkh4aBdP8VLSuuFVxys2iylWAi2Dq/wMfDFIQHoImgp
 i5GaY3WuZF57lLKfx67tTVH/ZFHw3Km67T4yDn0KCvhFPOODBc1AQ96i6RBwJmomhDTc
 5+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702376951; x=1702981751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHmbx/TAJnGNEEz0o7g8cBj5c1EY3ZNmozjuVxS5uaw=;
 b=pr6eLr3rye70cE7cSQBQKLJjc7p2Vg46nM6Ih/8TPjiQCgXELOIhsr1KeDqhjDFgPf
 aVfJGqHBlktBYvdN6oeHhKm2eJV1XBl1+ZrzNVWO5xMQCSZDp4qYvbYDvsi65VpbwJQ5
 u1H4Lbk+7nH76OQ8y+eTu9VyNY0Ul4bgiE3IrtxZuWTpjJ1vfBhD/7LPJIhF1ZYqXHav
 Ek9ysdjZ4+1k25skcpqXhP9Uu+/F6Y0HxdT5R+cU76FVZPuC0g92JevW8aVSbyLsv3F2
 5NDZTPzMqvxHfhyBK3lAKSBVIOekTYublLwkxCpl6X8Hi5uZLMbuyo0dXGvJonfX1o91
 wqwQ==
X-Gm-Message-State: AOJu0YwPFiay3Brq39255kvSTDfG5aTURBEH6i0Se0iGR2y1e3exasdj
 FJgLWbs47ZX3APDF5aG8lMuUX0vzITY7il7faRWamlVAsZLfDA==
X-Google-Smtp-Source: AGHT+IE48kxlzdKD3yLytlZEb4kSrO2sHIRT3ZAoG2MXpUlCf7iBAfbi5OAjmRU9iIoXDqrpN6Spq6yjmg/XfwEqDd4=
X-Received: by 2002:a17:90a:8a0e:b0:286:a944:abb2 with SMTP id
 w14-20020a17090a8a0e00b00286a944abb2mr2532263pjn.20.1702376951377; Tue, 12
 Dec 2023 02:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20231212033259.189718-1-aford173@gmail.com>
 <20231212033259.189718-2-aford173@gmail.com>
In-Reply-To: <20231212033259.189718-2-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Dec 2023 04:29:00 -0600
Message-ID: <CAHCN7xJC_+0uHa1_ODXLjEXAL-S2hZWr-GBPATQ_BBZaY2c4_A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation
 rounding
To: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 9:33=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> When using video sync pulses, the HFP, HBP, and HSA are divided between
> the available lanes if there is more than one lane.  For certain
> timings and lane configurations, the HFP may not be evenly divisible.
> If the HFP is rounded down, it ends up being too small which can cause
> some monitors to not sync properly. In these instances, adjust htotal
> and hsync to round the HFP up, and recalculate the htotal.
>

For anyone who's following this,  I added a note which I apparently
forgot to save:

This adds support for 720p60 in the i.MX8M Plus.

NXP uses a look-up table in their downstream code to accomplish this.
Using this calculation, the driver can adjust without the need for a
complicated table and should be flexible for different timings and
resolutions depending on the monitor.

I don't have a DSI analyzer, and this appears to only work on
i.MX8M Plus but not Mini and Nano for some reason, despite their
having a similar DSI bridge.

When Frieder teste this, he reported no changes on the Kontrol BL
i.MX8MM:   "So at least there is no negative impact in this case"


If someone else has an i.MX8MP, I would appreciate any feedback.

thanks

adam

> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.=
MX8MM with HDMI monitor
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index 239d253a7d71..f5795da1d8bb 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1628,6 +1628,27 @@ static int samsung_dsim_atomic_check(struct drm_br=
idge *bridge,
>                 adjusted_mode->flags |=3D (DRM_MODE_FLAG_PHSYNC | DRM_MOD=
E_FLAG_PVSYNC);
>         }
>
> +       /*
> +        * When using video sync pulses, the HFP, HBP, and HSA are divide=
d between
> +        * the available lanes if there is more than one lane.  For certa=
in
> +        * timings and lane configurations, the HFP may not be evenly div=
isible.
> +        * If the HFP is rounded down, it ends up being too small which c=
an cause
> +        * some monitors to not sync properly. In these instances, adjust=
 htotal
> +        * and hsync to round the HFP up, and recalculate the htotal. Thr=
ough trial
> +        * and error, it appears that the HBP and HSA do not appearto nee=
d the same
> +        * correction that HFP does.
> +        */
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE && dsi->lane=
s > 1) {
> +               int hfp =3D adjusted_mode->hsync_start - adjusted_mode->h=
display;
> +               int remainder =3D hfp % dsi->lanes;
> +
> +               if (remainder) {
> +                       adjusted_mode->hsync_start +=3D remainder;
> +                       adjusted_mode->hsync_end   +=3D remainder;
> +                       adjusted_mode->htotal      +=3D remainder;
> +               }
> +       }
> +
>         return 0;
>  }
>
> --
> 2.40.1
>
