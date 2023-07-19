Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE197599A8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAED410E4D5;
	Wed, 19 Jul 2023 15:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A52110E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:26:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B6D761737
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA322C433CA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689780370;
 bh=nXOLt+Ru1599YLHogJZDfcCqEFtOC1MXpEQo8Utf5+4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X5Ur6GtOca0SFfi+2pqbWqAT2zyHEBEDsVDrSunDo62xwbrVst2eiLVPhX8LugXjg
 VPDH89Nwmdq4z7T9tXZJcSsK5UZhxGjzsbMhwc+3YELx3nwxBr1uyAy1BrUVxflDnd
 gyS0lvCBVAN2uYJptRT+6wrKD8KOMVvcMLSUG2djW8YJNayqmxBPBlCnPIAgZCKqTq
 wSM2U3r2QwqV5nZxt97CKc0wcpwHvgcrpZuPAt3ga2aXnTdPEdV8HKUrn5wAKeIbl1
 HoVdUdR4ReF/1XyB6SYMJeCbie8OcWHaMfG0FKlpRhKaKn4Q6EGaaNhS6ge9z7gPkB
 7MNDCW+sYBPRw==
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2b74310566cso110846711fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:26:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLaM2V6lOd8axZ211252TBYfy23sZXP4py5C3mQ6maSo6U69MAR0
 QTr+3+ZrY8IkmkkUKBj/UqpBv3/MhNnaFn8QIg==
X-Google-Smtp-Source: APBJJlFD292w7Q5p4ODutCfH9ve7dS7RcKMi1F2heH6iTUGn+9PvFn4FmEnqaV09PWhCD4P6dYl3jZJjD/GC9Da5Kbg=
X-Received: by 2002:a2e:985a:0:b0:2b6:a057:8098 with SMTP id
 e26-20020a2e985a000000b002b6a0578098mr249343ljj.0.1689780368825; Wed, 19 Jul
 2023 08:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Jul 2023 23:25:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oDNUx+_c=5u6TqX6vx-AG1r1xVzE-UWe+LaqQQEaaSw@mail.gmail.com>
Message-ID: <CAAOTY__oDNUx+_c=5u6TqX6vx-AG1r1xVzE-UWe+LaqQQEaaSw@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jitao.shi@mediatek.com
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao:

Do you have any comment?
If you have no comment, I would apply this patch.

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2023=E5=B9=B45=E6=9C=8823=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:4=
2=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
> later calculation for horizontal sync-active (HSA), back (HBP) and
> front (HFP) porches got incorrect due to the logic being inverted.
>
> This means that a number of settings were wrong because....:
>  - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>    set in order to disable the End of Transmission packet;
>  - Horizontal Sync and Back/Front porches: The delta used to
>    calculate all of HSA, HBP and HFP should account for the
>    additional EOT packet.
>
> Before this change...
>  - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>  - For HSA/HBP/HFP delta... all three were wrong, as words were
>    added when EOT disabled, instead of when EOT packet enabled!
>
> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
> MediaTek DSI driver to fix the aforementioned issues.
>
> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time caused b=
y EOTp")
> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and EOT=
 packet control")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 7d5250351193..b0ab38e59db9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>         if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>                 tmp_reg |=3D HSTX_CKLP_EN;
>
> -       if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> +       if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>                 tmp_reg |=3D DIS_EOT;
>
>         writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
> @@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi =
*dsi)
>                           timing->da_hs_zero + timing->da_hs_exit + 3;
>
>         delta =3D dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
> -       delta +=3D dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
> +       delta +=3D dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
>
>         horizontal_frontporch_byte =3D vm->hfront_porch * dsi_tmp_buf_bpp=
;
>         horizontal_front_back_byte =3D horizontal_frontporch_byte + horiz=
ontal_backporch_byte;
> --
> 2.40.1
>
