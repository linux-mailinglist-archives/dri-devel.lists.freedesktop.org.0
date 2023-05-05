Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2936F87CC
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 19:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85E10E029;
	Fri,  5 May 2023 17:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAF310E029
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:41:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD0DA61492
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3297C433A1
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683308475;
 bh=VXIPbVt5ooPbkAjjpZpHqh7KRKHYkPDMpipRC+g/0v0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SoSkJRVpidOcO8iGxxBhTDA6YM3VT93vI4KfhxkA9ESb4doBNTMO9HTEYKNYlgJ5q
 UmurNPr6kzsBAQ39jWnzonFivakdo8CJH2QHhVrx5qmHqfLigk2YLiWJ9hWj5IbGXO
 Ofsfd0aVFji9X/WTatbIP5IIZI6kn9LBin6QjmAmle6KnHvuxa5MMpPRnqg3dBiWQH
 MoTAym7TofKO/8QcuVNL7yq2hQ1BH3YCDwMCBIrpS7+La+mLrTvBxFgAQ3rdFfBnit
 P+hOaJeoxk6tSr+gaTlquPGBVA6Y01+V+zaSo2TPI+RNZ06eMIOi/m2NEy/n3rFZMO
 kF+YgcjIRGayw==
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-5144043d9d1so1407770a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 10:41:15 -0700 (PDT)
X-Gm-Message-State: AC+VfDzkLCzQYd581DZXTYsvW2HNQHS+W/qPgSzPQ8lgfoIscDp8IrlT
 crHxfgvs349XffVDsQDWYvZ4YZh4J3xmyxlp2sI0xQ==
X-Google-Smtp-Source: ACHHUZ7V0c8GuBWBpRyAstUWowwNQf+aYXoWkIYfxe801StPrNtcqkzx6w+RRrSKryhYqCm8BNK7dWJHW1lex6Pon8E=
X-Received: by 2002:a17:90b:3a8d:b0:23f:9fac:6b35 with SMTP id
 om13-20020a17090b3a8d00b0023f9fac6b35mr2173471pjb.39.1683308475334; Fri, 05
 May 2023 10:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-5-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-5-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 19:41:04 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4NmNbQ3dava=rr-Jx4tV37QD6=ujNq2bXDuSaoP8mdrQ@mail.gmail.com>
Message-ID: <CAN6tsi4NmNbQ3dava=rr-Jx4tV37QD6=ujNq2bXDuSaoP8mdrQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] drm/bridge: tc358768: fix TCLK_ZEROCNT computation
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

On Thu, Apr 27, 2023 at 4:35=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correct computation of TCLK_ZEROCNT register.
>
> This register must be set to a value that ensure that
> (TCLK-PREPARECNT + TCLK-ZERO) > 300ns
>
> with the actual value of (TCLK-PREPARECNT + TCLK-ZERO) being
>
> (1 to 2) + (TCLK_ZEROCNT + 1)) x HSByteClkCycle + (PHY output delay)
>
> with PHY output delay being about
>
> (2 to 3) x MIPIBitClk cycle in the BitClk conversion.
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index dba1bf3912f1..aff400c36066 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -742,10 +742,10 @@ static void tc358768_bridge_pre_enable(struct drm_b=
ridge *bridge)
>
>         /* 38ns < TCLK_PREPARE < 95ns */
>         val =3D tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
> -       /* TCLK_PREPARE > 300ns */
> -       val2 =3D tc358768_ns_to_cnt(300 + tc358768_to_ns(3 * ui_nsk),
> -                                 dsibclk_nsk);
> -       val |=3D (val2 - tc358768_to_ns(phy_delay_nsk - dsibclk_nsk)) << =
8;
> +       /* TCLK_PREPARE + TCLK_ZERO > 300ns */
> +       val2 =3D tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
> +                                 dsibclk_nsk) - 2;
> +       val |=3D val2 << 8;
>         dev_dbg(priv->dev, "TCLK_HEADERCNT: 0x%x\n", val);
>         tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
