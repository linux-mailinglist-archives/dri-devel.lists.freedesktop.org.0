Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37519FE6ED
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0C610E4E9;
	Mon, 30 Dec 2024 14:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="couHbG+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BF010E4E9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:16:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 192765C5B0C
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CB8C4CEDE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735568207;
 bh=zMel9og/teRYkYQgE3auw7VYAfFToz8pv8OyAdYM6Vc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=couHbG+cc12NySKm/DaR6Ywy17VZbuufrot3nS4vCPMLMdiz05h8XQ9G0GERyJbnP
 QiW3K9ouiUDlSjUw9nskMeLbqS4UqCF3WPei9G+qLIafd6nwmTlT92R0Zv5IQwXaVo
 /5KXJQ//6A/rX8DABtFB4DRxkh09AcQYtXUsKYHv3MeIVotjCf0XIIvSOscQVAfUYm
 pcUYVKGrGynfo0termfhTXwwTDh74C+EQKkLbQx+ggr0MdGrzr4PtwVOVasv4l2ZA2
 xN3+mqq5cUzW744HtbFEOzM6TZp+iUxZZDNFDqSIsnmR71fqKgGo/CWRuHgywoDEV5
 2CdB31gFLkNqQ==
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2efe25558ddso9336847a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 06:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUzf2zTh1lG4//c4rDz6YiR0FFmriPhQ+uTPx5/TAGLmkVoJQukDAk3V4AFzd1ChLez+p35UqMSTwY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy61Ngrn/Y87zuVbc9SFunYH4kiTyxlprnG7sm0ZBDaU5+Z3b+
 UNzm+bLViWi95WOeKNGi8PfC0vv8aQ5CkAbDXPATgWgYZfGMmP/ElaImvzK1Kz609J0elMk9aMN
 8W29GmnlCmcdLW7kWqUNqlLuR7Q==
X-Google-Smtp-Source: AGHT+IHowbYDO6MzZoxKYBdpJQizCGbMvec0FMWr41jNazuXAPv1UNUBAqhQ7YhM003grWBzgeCVH3eRmuQNBazSRto=
X-Received: by 2002:a17:90b:270d:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2f452e1606amr56816645a91.15.1735568206567; Mon, 30 Dec 2024
 06:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20241025083036.8829-1-liankun.yang@mediatek.com>
 <20241025083036.8829-2-liankun.yang@mediatek.com>
In-Reply-To: <20241025083036.8829-2-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 30 Dec 2024 22:17:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY__iZiyCpaKO-P6EHxg8GaJxmN-xguQ4Ny+HO7SiK6EaBg@mail.gmail.com>
Message-ID: <CAAOTY__iZiyCpaKO-P6EHxg8GaJxmN-xguQ4Ny+HO7SiK6EaBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/mediatek: Fix YCbCr422 color format issue for
 DP
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
 dmitry.osipenko@collabora.com, msp@baylibre.com, rex-bc.chen@mediatek.com, 
 granquet@baylibre.com, peng.liu@mediatek.com, jitao.shi@mediatek.com, 
 mac.shen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
25=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:32=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Setting up misc0 for Pixel Encoding Format.
>
> According to the definition of YCbCr in spec 1.2a Table 2-96,
> 0x1 << 1 should be written to the register.
>
> Use switch case to distinguish RGB, YCbCr422,
> and unsupported color formats.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Change in V2
> - Modify the value written to the register
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510021810.=
19302-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index f0f6f402994a..613e1c842478 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -460,18 +460,16 @@ static int mtk_dp_set_color_format(struct mtk_dp *m=
tk_dp,
>                                    enum dp_pixelformat color_format)
>  {
>         u32 val;
> -
> -       /* update MISC0 */
> -       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> -                          color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> -                          DP_TEST_COLOR_FORMAT_MASK);
> +       u32 misc0_color;
>
>         switch (color_format) {
>         case DP_PIXELFORMAT_YUV422:
>                 val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> +               misc0_color =3D DP_COLOR_FORMAT_YCbCr422;
>                 break;
>         case DP_PIXELFORMAT_RGB:
>                 val =3D PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> +               misc0_color =3D DP_COLOR_FORMAT_RGB;
>                 break;
>         default:
>                 drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n=
",
> @@ -479,6 +477,11 @@ static int mtk_dp_set_color_format(struct mtk_dp *mt=
k_dp,
>                 return -EINVAL;
>         }
>
> +       /* update MISC0 */
> +       mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +                          misc0_color,
> +                          DP_TEST_COLOR_FORMAT_MASK);
> +
>         mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C,
>                            val, PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
>         return 0;
> --
> 2.45.2
>
