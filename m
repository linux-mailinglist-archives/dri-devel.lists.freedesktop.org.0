Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0411A4B200
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 15:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C202410E0E0;
	Sun,  2 Mar 2025 14:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="feia/f3N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E869E10E0E0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B22CD5C55CF
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759EFC4CEF1
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Mar 2025 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740924303;
 bh=ACEiqu9VyNmqiDL7jDGjoGE0f92hgXDBZVuSdlhL6c4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=feia/f3NOUJDjs0K1SnCGswU3g3gzbBeIKSDA/ChWT6xKyWlnHs1ayaXRl/uZKfAv
 wf3u3MtYT+Es8Kmf5uUW5gxsZhrz5HH5MheS4CMuI4943Dk+vhGJg7dAoX3WQRKgWZ
 pHmCZEgOmgahdTDdMoXMgwHs8uGJgCKF31NlvS52VP7Bcysu+9cElBpMmdccCjtITo
 xPGo0TWs4hfxm/yXi5Gnt7wTCbMRgsgid/X+PUU+OfBIgeZEtlCOiE8OxvMhD8sEwz
 3UmxWbsJuH8txJHlOLpFjk9S1oc5cpvU4U4jlLdceGdrCitabASCPgMyHcRWiU+dIF
 EpUe0sHVWhSpg==
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2feb9076a1cso5270793a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Mar 2025 06:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkfdFEo+OxqypiOO+lk2yWq09bySkZbL6MZ7t+DhdrR8ootf15Wn0fLqMBGuXPAfMINxNRCNlKFak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4j18RlNz57+CqPisS3ULxeCN+HRBY41Qng+PeQ0thfDvL3DKx
 Y9zpLnfo8IOYiL6om46hIuvncVdgg1GfqfBGyAD3dNh0fR/GByRKRdGv8r8VPf5xVgKQU9MKaeQ
 mcaryBcwIOrCB5zyUTC1DYJDaCw==
X-Google-Smtp-Source: AGHT+IG16EEdJJHvm6Oj64x4u72JISQwLPN9kfN5w5LtdjSW9aGHHuRsWNMb8JRAz2CRhaPVGvxVlY/s8nFADdCz3Og=
X-Received: by 2002:a17:90b:4fd0:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-2febab5e11dmr17308029a91.14.1740924302962; Sun, 02 Mar 2025
 06:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-10-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Mar 2025 22:05:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__zrRM9oyDtuDAzJ+ddOU2as2-vy9FkGs_Wzqjo_==RvA@mail.gmail.com>
X-Gm-Features: AQ5f1JoTySmTRsktldIsbqAg0MJ_QRQyHKP457TZ4jFIH5MH1bn0tYelMK9Vy-I
Message-ID: <CAAOTY__zrRM9oyDtuDAzJ+ddOU2as2-vy9FkGs_Wzqjo_==RvA@mail.gmail.com>
Subject: Re: [PATCH v7 09/43] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
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
> In preparation for adding support for MT8195's HDMI reserved
> DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
> for the TVD clock: in this particular case, the aforementioned
> clock is not (and cannot be) parented to neither pixel or engine
> clocks hence it won't get enabled automatically by the clock
> framework.
>
> Please note that on all of the currently supported MediaTek
> platforms, the TVD clock is always a parent of either pixel or
> engine clocks, and this means that the common clock framework
> is already enabling this clock before the children.
> On such platforms, this commit will only increase the refcount
> of the TVD clock without any functional change.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index e12dc73ed79c..ee952785866c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -499,6 +499,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>
>         mtk_dpi_disable(dpi);
>         clk_disable_unprepare(dpi->pixel_clk);
> +       clk_disable_unprepare(dpi->tvd_clk);
>         clk_disable_unprepare(dpi->engine_clk);
>  }
>
> @@ -515,6 +516,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>                 goto err_refcount;
>         }
>
> +       ret =3D clk_prepare_enable(dpi->tvd_clk);
> +       if (ret) {
> +               dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> +               goto err_engine;
> +       }
> +
>         ret =3D clk_prepare_enable(dpi->pixel_clk);
>         if (ret) {
>                 dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", r=
et);
> @@ -524,6 +531,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>         return 0;
>
>  err_pixel:
> +       clk_disable_unprepare(dpi->tvd_clk);
> +err_engine:
>         clk_disable_unprepare(dpi->engine_clk);
>  err_refcount:
>         dpi->refcount--;
> --
> 2.48.1
>
