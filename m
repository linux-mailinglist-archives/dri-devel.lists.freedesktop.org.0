Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D36EC845
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 11:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A438A10E411;
	Mon, 24 Apr 2023 09:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80810E411
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 09:03:51 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-54fb9384c2dso48990497b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682327030; x=1684919030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cSv908+XbxMNLsKEbTm9jFklu64ICgFxL9KYAhHv6U=;
 b=rGaI5R8xnw5jjlLgvyRcDN8MOmGhLU9gutbCOvkCTQbBB+j+2n1wbu+UrIaQX86gRE
 iX9ivyYi8HeVrwFZZr3hr65F7WfYO0deRCEtc9aUtuMVfCZ1+2Jm/SSZQ+OuUqVDwpT2
 WOk7s7eTJLqytJMxbB5TAJuIpEEflg/IqVdGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327030; x=1684919030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cSv908+XbxMNLsKEbTm9jFklu64ICgFxL9KYAhHv6U=;
 b=kuJ1Dgu1yl5+1qLrKnbSjMxDNeHSyTqb1Pz0tImFS2LOhhqasmf/4+xPK5pR55Cpp9
 TZxbxda/QeGw24i2JQ6RBsmrM3sT10yCg92Nu5Q1cm7HS88ZN0M3uukBK76X1d/9oKgb
 z2FumEIbcnscCeMX+Dntmz3DfDhxhUSVhwnKCoUSKp0FqO6pvGbWxm/Rd//ZDpzV3/0T
 Lh1ZC0Wfiswvg08ourUVKegBXzCCwGKQlVfURITGtTY4NDHYK0wxvaXn0l9DdH47iBt7
 ZDemAY16i3OTT6EH85gPVZFMPzhvm6V+TF1xCNmJYAqTVZQMf1ssgPzAEHIBDOolfFKg
 b47Q==
X-Gm-Message-State: AAQBX9dcR+rYUpAuCcumPYRBVpCvL9JcxGGT5+Hx4yObuvFwWuoIRATD
 KjSe1avd8t11XapctT9SPMOo1+lhXrx2fjy1Kh+aPw==
X-Google-Smtp-Source: AKy350Z7B0vqLEmVxsm8gwNXz0Mr3uw6c5CelEFXXRS8WBWNscFAnrUucpIycBwqf062sEv89dWQgMEgJ48vn/ek6tc=
X-Received: by 2002:a0d:de85:0:b0:527:b681:3e62 with SMTP id
 h127-20020a0dde85000000b00527b6813e62mr6741490ywe.23.1682327030489; Mon, 24
 Apr 2023 02:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-2-aford173@gmail.com>
In-Reply-To: <20230423121232.1345909-2-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 24 Apr 2023 14:33:38 +0530
Message-ID: <CAMty3ZCn9_AT8SOfFD-MYox16ZcqOEezt_0x6aES6LWQFj8Kpg@mail.gmail.com>
Subject: Re: [PATCH V2 1/6] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
To: Adam Ford <aford173@gmail.com>, l.stach@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 5:42=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> From: Lucas Stach <l.stach@pengutronix.de>
>
> Scale the blanking packet sizes to match the ratio between HS clock
> and DPI interface clock. The controller seems to do internal scaling
> to the number of active lanes, so we don't take those into account.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index e0a402a85787..2be3b58624c3 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(struct sa=
msung_dsim *dsi)
>         u32 reg;
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> +               int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_khz=
 / m->clock;

I do not quite understand why it depends on burst_clk_rate, would you
please explain? does it depends on bpp something like this

mipi_dsi_pixel_format_to_bpp(format) / 8

> +               int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz / m=
->clock;
> +               int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_kh=
z / m->clock;
> +
> +               /* remove packet overhead when possible */
> +               hfp =3D max(hfp - 6, 0);
> +               hbp =3D max(hbp - 6, 0);
> +               hsa =3D max(hsa - 6, 0);

6 blanking packet overhead here means, 4 bytes + payload + 2 bytes
format? does this packet overhead depends on the respective porch's
like hpf, hbp and hsa has different packet overheads?

Jagan.
