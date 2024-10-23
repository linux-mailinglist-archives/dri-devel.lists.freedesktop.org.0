Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9A09ACBDC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C104610E084;
	Wed, 23 Oct 2024 14:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qdbkBEO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411CE10E084
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:04:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBB8D5C5F3E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07126C4CEE9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729692244;
 bh=3MPewIa2RjMP+i+zsFQ9KeXkrzNB/sGLihdu9ZgX1Xs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qdbkBEO03QRVYRTMpVXLWE71cKSwutRohJy5TwoxqVHO0wkbQW0YgPfaX29DAqor+
 94w70E+QfzZ8tOiLhZfTmGiJXyMfqIA9WandhakNjKEstnVmIpxmGu2JbDDQdDkS/w
 NWQ5ig4TJSBvkyDfxXkdP1g4/5AMAMuOW+QINcxLUcscOsXdpJ71ovHR+NONEqypC5
 qgw07B94tMVCL2IjSWYlKY/0RtTHeZ/Be19Cfta+jos4swJIdpy6az0lvXq7d+OIrR
 7twC2anxpXhsptQC9SoqaW0MPESbGAV3lm1ehUPtatYHeVZzrTS+E2Vi0mR8iuJp36
 nvIMrFdhieGFQ==
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7e6ed072cdaso4907171a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5X4p+/5ijx6/nlNvztVN1Msxd65X24Q9rMGQXF2UtFLPowPQl/eSSPWra8gJ7nbOHM1BNlfcFkcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzx0ZK6LBO6oQmzOnxrrfqnuy2dO4Blz0Etuy31iwP90AxPgsKs
 1HHUEoRmTm+hd2ZHLC8UznXMZH1LbT23OA9aQrdCktao/4fGwuXLNiNm4c1nNRfYVmqu9mN8fib
 OS+oQPPc0XB9vZYwCj14L5JCAiQ==
X-Google-Smtp-Source: AGHT+IF5Q62FJLxl3oE9wLeYU7rpvkWxnbOMZ2oAU54lobEqlwICxfdK2vspUXn7Guq+K/KROXh3ysDXrXOnjtvP2zM=
X-Received: by 2002:a05:6a21:2d8b:b0:1d9:3957:8c24 with SMTP id
 adf61e73a8af0-1d978b39ee6mr2739553637.21.1729692243502; Wed, 23 Oct 2024
 07:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240923132521.22785-1-liankun.yang@mediatek.com>
In-Reply-To: <20240923132521.22785-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:04:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY__3PvRUaU0a8E0X82yaTjYe8c5J6Uud5+SzMQhew+srgA@mail.gmail.com>
Message-ID: <CAAOTY__3PvRUaU0a8E0X82yaTjYe8c5J6Uud5+SzMQhew+srgA@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
 shuijing.li@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
 peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
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

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=882=
3=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Update efuse data for MT8188 displayport.
>
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp functio=
n")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Changes in V5:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240905124041.=
3658-1-liankun.yang@mediatek.com/
>
> Changes in V4:
> - Remove excess newlines.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.=
20689-1-liankun.yang@mediatek.com/
>
> Changes in V3
> - Update change log position in commit message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.=
16461-1-liankun.yang@mediatek.com/
>
> Changes in V2
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.=
31103-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>         u16 audio_m_div2_bit;
>  };
>
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX]=
 =3D {
> +       [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
> +               .idx =3D 0,
> +               .shift =3D 10,
> +               .mask =3D 0x1f,
> +               .min_val =3D 1,
> +               .max_val =3D 0x1e,
> +               .default_val =3D 0xf,
> +       },
> +       [MTK_DP_CAL_CLKTX_IMPSE] =3D {
> +               .idx =3D 0,
> +               .shift =3D 15,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 0,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 8,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 16,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 24,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 4,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 12,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 20,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 28,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +};
> +
>  static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX=
] =3D {
>         [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
>                 .idx =3D 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_susp=
end, mtk_dp_resume);
>  static const struct mtk_dp_data mt8188_dp_data =3D {
>         .bridge_type =3D DRM_MODE_CONNECTOR_DisplayPort,
>         .smc_cmd =3D MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -       .efuse_fmt =3D mt8195_dp_efuse_fmt,
> +       .efuse_fmt =3D mt8188_dp_efuse_fmt,
>         .audio_supported =3D true,
>         .audio_pkt_in_hblank_area =3D true,
>         .audio_m_div2_bit =3D MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0=
_DIV_2,
> --
> 2.45.2
>
