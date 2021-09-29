Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAB41C79C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3CD6EAA6;
	Wed, 29 Sep 2021 14:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7B46EAA6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:59:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42D4F61406
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927578;
 bh=fk2MhdHw89PM9OnTQ22OUkjvEi2mid5QuP4EjsFGyks=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oLfuPLtVgOnE+Qu6ccxBE2npn1D3qXbWW2jg+090nhkBU8jKAZpqqHtKkNdwZEVf9
 80Lzv8ufKEWsi/gWphQIbShDpO8tMP0yagYTdmEuRN4fmuTjWTSG1A3txkfZAL5Gz2
 G1RcUbMcJ+jk/MMeykNgTVEsFrlwJshtNd0po29mu6nSpcl+Kk44TP2qfd2K72eZdT
 yFxykTOw0rtZmNQcq0nzp6DvhlHNzM87bd6yy5auh0a5dSVNun/eOGbUnppWkFc5Dq
 j9pX/xZwJPcf1miQf7sUrIws3Y/myKPNqxCFjeQ2Kg/UBTV85io/tmClfq7VYD4pcq
 /0igVNxVkm03w==
Received: by mail-ed1-f51.google.com with SMTP id dn26so9713729edb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:59:38 -0700 (PDT)
X-Gm-Message-State: AOAM532RI/BeDxyj7V+wLzSNgWnxbC0+hK+lSqbU2I7ovT2BQzlhZIV1
 XWl4dXryO0mAUZBAlBE4qqiJOfnkl0EAwkfNzg==
X-Google-Smtp-Source: ABdhPJwCGdIq+oqx27NfXCSPDAUfJueMf8gUKcQgTqgUAMZrpdXWe4oipBNxHCQTw6eESlV9N3bkv12WqrTgIBYJt8c=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr118869ejc.511.1632927500166; 
 Wed, 29 Sep 2021 07:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-3-jitao.shi@mediatek.com>
In-Reply-To: <20210915223117.7857-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:58:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ayWfcqsVsyMun-_jX_Po_AiHfpiuTJAkEaeRYq902MQ@mail.gmail.com>
Message-ID: <CAAOTY__ayWfcqsVsyMun-_jX_Po_AiHfpiuTJAkEaeRYq902MQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/mediatek: implment the dsi hs packets aligned
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com
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

Hi, Jitao:

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8816=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:31=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Some dsi devices require the packets on lanes aligned at the end,
> or the screen will shift or scroll.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 93b40c245f00..9d72e6dce0bf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -194,6 +194,8 @@ struct mtk_dsi {
>         struct clk *hs_clk;
>
>         u32 data_rate;
> +       /* force dsi line end without dsi_null data */
> +       bool hs_packet_end_aligned;
>
>         unsigned long mode_flags;
>         enum mipi_dsi_pixel_format format;
> @@ -499,6 +501,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi=
 *dsi)
>                 DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\=
n");
>         }
>
> +       if (dsi->hs_packet_end_aligned) {
> +               horizontal_sync_active_byte =3D roundup(horizontal_sync_a=
ctive_byte, dsi->lanes) - 2;
> +               horizontal_frontporch_byte =3D roundup(horizontal_frontpo=
rch_byte, dsi->lanes) - 2;
> +               horizontal_backporch_byte =3D roundup(horizontal_backporc=
h_byte, dsi->lanes) - 2;
> +               horizontal_backporch_byte -=3D (vm->hactive * dsi_tmp_buf=
_bpp + 2) % dsi->lanes;
> +       }
> +
>         writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>         writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>         writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> @@ -793,6 +802,7 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *=
host,
>         dsi->lanes =3D device->lanes;
>         dsi->format =3D device->format;
>         dsi->mode_flags =3D device->mode_flags;
> +       dsi->hs_packet_end_aligned =3D device->hs_packet_end_aligned;
>
>         return 0;
>  }
> --
> 2.25.1
