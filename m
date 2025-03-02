Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72598A4B10D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 12:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136610E138;
	Sun,  2 Mar 2025 11:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dI/jUzxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0668510E138
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:02:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 582115C556C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7230BC4CEF1
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 11:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740913343;
 bh=0dYRopgj7MY9Fono+yLkck1yirLmhq10431jfhctt4M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dI/jUzxoVB0jnsLae/FQlzvjQ7CYnYsIB3MwnXWvGhhR3jBsOy9Lne55sQfA2mJ3+
 PbIU6YS43nQwBKgXeh48GADc9RgU6+S623HOQWg/Vddyswo0yiw5y5eKK2daBf+UN8
 Hb938BynaEL8+4HPJwafxhEfLIpvhWmkQ2wgLW9YADDFMxHEOAAGIsI6c9MEdqdVTD
 m574t5Se7YXMPz7iXVTCH460eyXEdF+elO9Qz4AoT8Wsmm+I5AzZ+sr0GE33j0yLa5
 tjZs5yYHkBB+bR7Z4gom2yJLZO+gDrwnu2Jfx5bJTIqO34/RpHp29Xx2F8PvTM0tzk
 eham8rPTPCdgA==
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fea8d8c322so6314289a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 03:02:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVMEie5+6hPHCcx8oUBVjCvda70u6VtKRFh1CpeiwuLR/N+sqxgGyV59UhvEDkpuQXDYKl3XQu1XA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEDnwoWKgej8tEvLj8w27FOeQoCG52oy+3NH28a2qu+YU1CTAG
 av8earOMcIm4zVn1/bsGk4dccsRtea2Wq5u9BCGX0JT9A3Vfx03HY2ZhnC/ERusrj9t1uFuzwk7
 GV6+SZ00VSB6X/TGMrlQXVQrV4w==
X-Google-Smtp-Source: AGHT+IGXak0wWZcnO2fYe/U4V7W9M9ejGxSMKy2z27wcwQtCwsLxiJAGJVNg9RMSEfsiEk3SDeQMvuh7fJRecjo++dU=
X-Received: by 2002:a17:90b:5745:b0:2f2:a664:df1a with SMTP id
 98e67ed59e1d1-2febab2e065mr15533413a91.2.1740913342866; Sun, 02 Mar 2025
 03:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-4-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 19:03:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8KFgSQEYC7v+6Asi_KdYjdsj==fOt6LR1FnOvFF+-BvA@mail.gmail.com>
X-Gm-Features: AQ5f1JrgOeeHmf3p3iP0Zim-UptMlcZ6hRTIjGx7ZXATj_NZLe_or-pJTLaht-g
Message-ID: <CAAOTY_8KFgSQEYC7v+6Asi_KdYjdsj==fOt6LR1FnOvFF+-BvA@mail.gmail.com>
Subject: Re: [PATCH v7 03/43] drm/mediatek: mtk_dpi: Use an array for pixclk
 factor calculation
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Setting the TVD PLL clock requires to multiply the target pixel
> clock by a specific constant factor to achieve the target PLL
> frequency, and this is done to reduce jitter to acceptable levels.
>
> On all MediaTek SoCs, the factor is not retrieved by any real kind
> of calculation but rather by checking if the target pixel clock
> is less than a specified frequency, hence assigning a function
> pointer for just a bunch of if branches does enlarge the code
> size for little reason.
>
> Remove all SoC-specific functions, add a structure `mtk_dpi_factor`
> that holds a clock frequency and corresponding PLL factor, and
> declare the constraints for each SoC in form of an array of said
> structure.
> Instead of function pointers, this structure (and its size) is then
> assigned to each SoC's platform data.
>
> The "calculation" is then performed with a new static function
> mtk_dpi_calculate_factor(dpi, mode_clk) that iterates through all
> of the entries of the aforementioned array and returns the right
> factor.
>
> If no factor is found, the lowest possible factor is returned,
> mimicking the same flow as all of the old per-SoC calculation
> functions.
>
> This commit brings no functional change.

After fix conflicts, applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 103 +++++++++++++++--------------
>  1 file changed, 52 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index fc937490feda..41fdc193891a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -118,9 +118,15 @@ struct mtk_dpi_yc_limit {
>         u16 c_bottom;
>  };
>
> +struct mtk_dpi_factor {
> +       u32 clock;
> +       u8 factor;
> +};
> +
>  /**
>   * struct mtk_dpi_conf - Configuration of mediatek dpi.
> - * @cal_factor: Callback function to calculate factor value.
> + * @dpi_factor: SoC-specific pixel clock PLL factor values.
> + * @num_dpi_factor: Number of pixel clock PLL factor values.
>   * @reg_h_fre_con: Register address of frequency control.
>   * @max_clock_khz: Max clock frequency supported for this SoCs in khz un=
its.
>   * @edge_sel_en: Enable of edge selection.
> @@ -141,7 +147,8 @@ struct mtk_dpi_yc_limit {
>   * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs =
to be set in MMSYS.
>   */
>  struct mtk_dpi_conf {
> -       unsigned int (*cal_factor)(int clock);
> +       const struct mtk_dpi_factor *dpi_factor;
> +       const u8 num_dpi_factor;
>         u32 reg_h_fre_con;
>         u32 max_clock_khz;
>         bool edge_sel_en;
> @@ -516,6 +523,20 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>         return ret;
>  }
>
> +static unsigned int mtk_dpi_calculate_factor(struct mtk_dpi *dpi, int mo=
de_clk)
> +{
> +       const struct mtk_dpi_factor *dpi_factor =3D dpi->conf->dpi_factor=
;
> +       int i;
> +
> +       for (i =3D 0; i < dpi->conf->num_dpi_factor; i++) {
> +               if (mode_clk <=3D dpi_factor[i].clock)
> +                       return dpi_factor[i].factor;
> +       }
> +
> +       /* If no match try the lowest possible factor */
> +       return dpi_factor[dpi->conf->num_dpi_factor - 1].factor;
> +}
> +
>  static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>                                     struct drm_display_mode *mode)
>  {
> @@ -530,7 +551,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *d=
pi,
>         unsigned int factor;
>
>         /* let pll_rate can fix the valid range of tvdpll (1G~2GHz) */
> -       factor =3D dpi->conf->cal_factor(mode->clock);
> +       factor =3D mtk_dpi_calculate_factor(dpi, mode_clk);
>         drm_display_mode_to_videomode(mode, &vm);
>         pll_rate =3D vm.pixelclock * factor;
>
> @@ -965,48 +986,6 @@ static const struct component_ops mtk_dpi_component_=
ops =3D {
>         .unbind =3D mtk_dpi_unbind,
>  };
>
> -static unsigned int mt8173_calculate_factor(int clock)
> -{
> -       if (clock <=3D 27000)
> -               return 3 << 4;
> -       else if (clock <=3D 84000)
> -               return 3 << 3;
> -       else if (clock <=3D 167000)
> -               return 3 << 2;
> -       else
> -               return 3 << 1;
> -}
> -
> -static unsigned int mt2701_calculate_factor(int clock)
> -{
> -       if (clock <=3D 64000)
> -               return 4;
> -       else if (clock <=3D 128000)
> -               return 2;
> -       else
> -               return 1;
> -}
> -
> -static unsigned int mt8183_calculate_factor(int clock)
> -{
> -       if (clock <=3D 27000)
> -               return 8;
> -       else if (clock <=3D 167000)
> -               return 4;
> -       else
> -               return 2;
> -}
> -
> -static unsigned int mt8195_dpintf_calculate_factor(int clock)
> -{
> -       if (clock < 70000)
> -               return 4;
> -       else if (clock < 200000)
> -               return 2;
> -       else
> -               return 1;
> -}
> -
>  static const u32 mt8173_output_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_1X24,
>  };
> @@ -1021,8 +1000,25 @@ static const u32 mt8195_output_fmts[] =3D {
>         MEDIA_BUS_FMT_YUYV8_1X16,
>  };
>
> +static const struct mtk_dpi_factor dpi_factor_mt2701[] =3D {
> +       { 64000, 4 }, { 128000, 2 }, { U32_MAX, 1 }
> +};
> +
> +static const struct mtk_dpi_factor dpi_factor_mt8173[] =3D {
> +       { 27000, 48 }, { 84000, 24 }, { 167000, 12 }, { U32_MAX, 6 }
> +};
> +
> +static const struct mtk_dpi_factor dpi_factor_mt8183[] =3D {
> +       { 27000, 8 }, { 167000, 4 }, { U32_MAX, 2 }
> +};
> +
> +static const struct mtk_dpi_factor dpi_factor_mt8195_dp_intf[] =3D {
> +       { 70000 - 1, 4 }, { 200000 - 1, 2 }, { U32_MAX, 1 }
> +};
> +
>  static const struct mtk_dpi_conf mt8173_conf =3D {
> -       .cal_factor =3D mt8173_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt8173,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8173),
>         .reg_h_fre_con =3D 0xe0,
>         .max_clock_khz =3D 300000,
>         .output_fmts =3D mt8173_output_fmts,
> @@ -1039,7 +1035,8 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
>  };
>
>  static const struct mtk_dpi_conf mt2701_conf =3D {
> -       .cal_factor =3D mt2701_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt2701,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt2701),
>         .reg_h_fre_con =3D 0xb0,
>         .edge_sel_en =3D true,
>         .max_clock_khz =3D 150000,
> @@ -1057,7 +1054,8 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
>  };
>
>  static const struct mtk_dpi_conf mt8183_conf =3D {
> -       .cal_factor =3D mt8183_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt8183,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8183),
>         .reg_h_fre_con =3D 0xe0,
>         .max_clock_khz =3D 100000,
>         .output_fmts =3D mt8183_output_fmts,
> @@ -1074,7 +1072,8 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
>  };
>
>  static const struct mtk_dpi_conf mt8186_conf =3D {
> -       .cal_factor =3D mt8183_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt8183,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8183),
>         .reg_h_fre_con =3D 0xe0,
>         .max_clock_khz =3D 150000,
>         .output_fmts =3D mt8183_output_fmts,
> @@ -1092,7 +1091,8 @@ static const struct mtk_dpi_conf mt8186_conf =3D {
>  };
>
>  static const struct mtk_dpi_conf mt8192_conf =3D {
> -       .cal_factor =3D mt8183_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt8183,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8183),
>         .reg_h_fre_con =3D 0xe0,
>         .max_clock_khz =3D 150000,
>         .output_fmts =3D mt8183_output_fmts,
> @@ -1109,7 +1109,8 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>  };
>
>  static const struct mtk_dpi_conf mt8195_dpintf_conf =3D {
> -       .cal_factor =3D mt8195_dpintf_calculate_factor,
> +       .dpi_factor =3D dpi_factor_mt8195_dp_intf,
> +       .num_dpi_factor =3D ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
>         .max_clock_khz =3D 600000,
>         .output_fmts =3D mt8195_output_fmts,
>         .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> --
> 2.48.1
>
