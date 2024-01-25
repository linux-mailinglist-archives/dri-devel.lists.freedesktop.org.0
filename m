Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185A83CB6C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 19:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BC510E33B;
	Thu, 25 Jan 2024 18:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8FC10E33B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 18:45:35 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ddc268ce2bso6804b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706208275; x=1706813075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81jWFTTTYAtqoCJJ13OsSFtUzfIkGNBcYQalGJf/MDM=;
 b=j6KiDZVIsuO+feI4YzG/T4KciN6G4Ye4dbDngprRcegYARg3PTp3Xwl1j8C8jJnTIl
 SCeFasWZoskXFwME5Xvt31zO4TkLbtU8JCSVcubFpr2V2xcCOO7v7HMUnXEjnzcrRQ4g
 UraSOVJRupN+LqWn5mSn7d2BGqrQB6RVi7R2EaX8n4qjGHgbCrk4H5l183enTh9E+4uj
 AuqDVVD7igDP3XC9/QVYMrxTqdSsqJTDtIB8iCuBsTf1ueJKtc+DhS1EAcXO9hDDI9PE
 oEh25Cwu7FnuG3EzU6sOabMTx7vVkd6lJQYc3hKWeFerUgCFVYvuNp6ABft3rA12zU2T
 J0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706208275; x=1706813075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81jWFTTTYAtqoCJJ13OsSFtUzfIkGNBcYQalGJf/MDM=;
 b=P1UnNFWA5yGSpvK9GQGeqeqOw3WBfLFBjY4xli5b/xGnSyujXzVqdRSb8xSxwqxUkq
 EYPV16i1F6gGfTJsldnKnEtjtu6SyHy9XeO5/4h3jzy15MQ1epEYVEnqM+ncxMqO3iPk
 58QwBrxaqIbNICINdBwS52yGoznwgwIttHot6z96XMt2dV7KBxXWer6bS2cRS7Wh0G8M
 NnOUGdDR4tsT7qQOlhA/AiyUqhZoO/PK7AnGD72/ox/fMte2N0gbPqWkSvseJOyVDnui
 29e8aNOtFW1PQzr1aMCWsqsUM2epNNmgnG2O1ZZfRqcBFU8Z/G2sUa5Gvv0ZHd3kC0y7
 2Euw==
X-Gm-Message-State: AOJu0Yz7aUqCnMmUDV+mGOZ5wVEEP/BOkN2EJ4ZyvIcYn+vSTDHquPCP
 7ZmTsBl4QyrsFFB2eHq0pVig5akJDFn1laArmPH+91PgBWELR0N8S6bxVKWB1MDN+UJe5FQuWpU
 dAOWmpaB/eDzZHYgmf/pjRH1DIypg4nFi
X-Google-Smtp-Source: AGHT+IHMq8SnoE+FUdLwYAp07S1sZ1ZXNpW9iId/mZ5vizI584+m8d6ebM2DNj1atCj1i7xNKCmRa7+VvUSlymliGxA=
X-Received: by 2002:a05:6a00:1ac6:b0:6db:de7c:53fe with SMTP id
 f6-20020a056a001ac600b006dbde7c53femr1190523pfv.62.1706208274952; Thu, 25 Jan
 2024 10:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20231212033259.189718-1-aford173@gmail.com>
 <20231212033259.189718-2-aford173@gmail.com>
In-Reply-To: <20231212033259.189718-2-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 25 Jan 2024 12:44:23 -0600
Message-ID: <CAHCN7xKKMzOtVaEXzgTgsO4yZF0JZ6=o+TFJOeTCza0fMGss2w@mail.gmail.com>
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
 Marco Felsch <m.felsch@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
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
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.=
MX8MM with HDMI monitor
> Signed-off-by: Adam Ford <aford173@gmail.com>

Gentle nudge on this one.  Basically this fixes an issue with the 8MP,
but it's still unknown why it doesn't work on 8MM or 8MN, but Frieder
confirmed there are no regressions on 8MM or 8MN.

adam


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
