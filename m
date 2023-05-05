Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFE6F8861
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7823A10E64F;
	Fri,  5 May 2023 18:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84810E64F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:07:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98F9A63FC2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B41C4339C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683310031;
 bh=SLXLVsRKiID4HTKaDJ18JTOztvB3O778HpU6t3fR1U4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kzt08nxPFS8hKFeBDEXS9DAuBEmSltfclRtK0OxvFmPD/vAt0YysnDZF5U7q4n7Vi
 /73HIALD8NRSOAkkw+hnHm40mShBnw6XgD7HRlitLogv7z6T3r4cU9LUyKucZ6PlEs
 ieNwKSW7bmawpk8n0cvzhpa2ss8U01/jYXiSKKxvxTQwCBkHWeK1x2BKE0kUcgeGh7
 a7QiDYcOFX61Yfy1+i2ljRR40fjh/tamqRX4dwOSZYjGF6AB2jpFKnjsJtiIrtvVYZ
 aSPfacCO4iLE4zunbv5EO4mcHGcP+BVVD9pRjPtbcYvT4+TMm49x1jJzEnUbnHgNxj
 HpflT6o3BT9cw==
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-643995a47f7so1867012b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:07:10 -0700 (PDT)
X-Gm-Message-State: AC+VfDwAaX3pUgzfWwLknTOzv2sClWs3lklyxcKJYgwoOHuMANmZcM4f
 TGLAYMV+ZQK2qgI2AgirV4FOJqa7lASF1NeB/bFwQA==
X-Google-Smtp-Source: ACHHUZ649OwsqyPFugyLLuCFgi4H32qoyAX6lylL2HIG3QYkaeSdoDnaTG+0ODejYNL2rj7aecmY7R4lNSyJi494wR0=
X-Received: by 2002:a05:6a20:748d:b0:f4:24e6:1065 with SMTP id
 p13-20020a056a20748d00b000f424e61065mr3044424pzd.39.1683310030576; Fri, 05
 May 2023 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-9-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-9-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 20:06:59 +0200
X-Gmail-Original-Message-ID: <CAN6tsi54HRw6STzkxbChxdCK+oV+8EF0taO6dSp8YpsokQ8TCQ@mail.gmail.com>
Message-ID: <CAN6tsi54HRw6STzkxbChxdCK+oV+8EF0taO6dSp8YpsokQ8TCQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] drm/bridge: tc358768: fix THS_TRAILCNT computation
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 4:34=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correct computation of THS_TRAILCNT register.
>
> This register must be set to a value that ensure that
> THS_TRAIL > 60 ns + 4 x UI
>  and
> THS_TRAIL > 8 x UI
>  and
> THS_TRAIL < TEOT
>  with
> TEOT =3D 105 ns + (12 x UI)
>
> with the actual value of THS_TRAIL being
>
> (1 + THS_TRAILCNT) x ByteClk cycle + ((1 to 2) + 2) xHSBYTECLK cycle +
>  - (PHY output delay)
>
> with PHY output delay being about
>
> (8 + (5 to 6)) x MIPIBitClk cycle in the BitClk conversion.
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 854fc04f08d0..947c7dca567a 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -779,9 +779,10 @@ static void tc358768_bridge_pre_enable(struct drm_br=
idge *bridge)
>         dev_dbg(priv->dev, "TCLK_POSTCNT: 0x%x\n", val);
>         tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
>
> -       /* 60ns + 4*UI < THS_PREPARE < 105ns + 12*UI */
> -       val =3D tc358768_ns_to_cnt(60 + tc358768_to_ns(15 * ui_nsk),
> -                                dsibclk_nsk) - 5;
> +       /* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
> +       raw_val =3D tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
> +                                    dsibclk_nsk) - 4;
> +       val =3D clamp(raw_val, 0, 15);
>         dev_dbg(priv->dev, "THS_TRAILCNT: 0x%x\n", val);
>         tc358768_write(priv, TC358768_THS_TRAILCNT, val);
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
