Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0428CC09
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030A08828E;
	Tue, 13 Oct 2020 10:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDA6E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:54:18 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t67so3497363vkb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynUyUlf8ZBc/wosstkfDmHSkC80iEcSV9kvyuaRkng4=;
 b=NCxMoMNZHtR/f6uBXfzdJQk8jzrc8dbrfZvgIF6hyvcC214r0LB+m+NNlUMfQGJLdP
 /zg9yuYcYn5wAPieHv5PsxM9+sloG71VPrC41niSEVM377SaFTB3shYj8zCNTNyIbua6
 iOWtDADZ+xIDrzoOMJULESyfqCSmB0DeWUMpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynUyUlf8ZBc/wosstkfDmHSkC80iEcSV9kvyuaRkng4=;
 b=kUUUwyiytqFYyy5x2Q73WJ20x660UCJhp+mw4CEb6i8ciB3jTqdWApMuPbg4Zj5MZn
 V7a9f+hgu3uUDU6wdE2Lw5ZlGJZQ/kb+NXtdniYPWcOGfr0SAWVoS7Q12H5n38wBmhd7
 wCfaaJa+peCqXiInVWWdtAWF2G0WW+8R570ZBFe5dYN7paJAqWnf71WIYVIu+jnvpMBq
 ETw+sTK+Zt1CJG6fnUJqpIA+yN+s4trGPWQha+mLmacprEVFtrg6Hada2waeVFU7r5Nv
 m1FRvgkdQB4K0+5N7ZvOzMfM8ZO0WFj4IO/f839LsCspVTMCsQoetjUcSBR3AT6Agr/P
 E7PA==
X-Gm-Message-State: AOAM530pWLpgQSQLekHEOyPyk+gtn0pUaWNBRpBweZMq2ZiP30Yqn0Q2
 dNgqTomlcNamvgtSUWtJgSiNS7G6vIhVSChDKJjVdQ==
X-Google-Smtp-Source: ABdhPJysPQ5eomCeyfTMzrgpCupOQSNSpjtTrgtpcQZw7r3iRalZSOO25Xe+CvFq/MXGQdp/beZjzKxff66coldxr7U=
X-Received: by 2002:a1f:2450:: with SMTP id k77mr15393251vkk.13.1602586457062; 
 Tue, 13 Oct 2020 03:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201013100625.13056-1-jitao.shi@mediatek.com>
 <20201013100625.13056-2-jitao.shi@mediatek.com>
In-Reply-To: <20201013100625.13056-2-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 13 Oct 2020 18:54:05 +0800
Message-ID: <CANMq1KBvG54ZW5gCzp4c_cpQjP6pZ9svngvvRUpWJn7FuMHt3Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: dsi: fix scrolling of panel with
 small hfp or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 cawa cheng <cawa.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 6:06 PM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> Replace horizontal_backporch_byte with vm->hback_porch * bpp to aovid
> flowing judgement negative number.
>
> if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
>         data_phy_cycles * dsi->lanes + delta)
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 80b7a082e874..ddddf69ebeaf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -445,6 +445,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>         u32 horizontal_backporch_byte;
>         u32 horizontal_frontporch_byte;
>         u32 dsi_tmp_buf_bpp, data_phy_cycles;
> +       u32 delta;
>         struct mtk_phy_timing *timing = &dsi->phy_timing;
>
>         struct videomode *vm = &dsi->vm;
> @@ -466,50 +467,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>         horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> -               horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
> +               horizontal_backporch_byte =
> +                       (vm->hback_porch * dsi_tmp_buf_bpp - 10);

These parentheses are not required, but it might be a little clearer to write:
(vm->hback_porch * dsi_tmp_buf_bpp) - 10;

>         else
> -               horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
> -                                           dsi_tmp_buf_bpp;
> +               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> +                       dsi_tmp_buf_bpp - 10);

ditto:
((vm->hback_porch + vm->hsync_len) * dsi_tmp_buf_bpp) - 10;

But then, _maybe_ it's clearer to drop this hunk and just add this
below the if/else:

horizontal_backporch_byte -= 10;

>
>         data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> -                         timing->da_hs_zero + timing->da_hs_exit;
> -
> -       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> -               if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
> -                   data_phy_cycles * dsi->lanes + 18) {
> -                       horizontal_frontporch_byte =
> -                               vm->hfront_porch * dsi_tmp_buf_bpp -
> -                               (data_phy_cycles * dsi->lanes + 18) *
> -                               vm->hfront_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -
> -                       horizontal_backporch_byte =
> -                               horizontal_backporch_byte -
> -                               (data_phy_cycles * dsi->lanes + 18) *
> -                               vm->hback_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -               } else {
> -                       DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> -                       horizontal_frontporch_byte = vm->hfront_porch *
> -                                                    dsi_tmp_buf_bpp;
> -               }
> +                         timing->da_hs_zero + timing->da_hs_exit + 3;

(for reference, apart from this `+ 3`, there is no functional change
in this hunk: this just moves delta outside of the if/else block,
which is a good idea for readability)

> +
> +       delta = (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) ? 18 : 12;
> +
> +       if ((vm->hfront_porch * dsi_tmp_buf_bpp + horizontal_backporch_byte) >
> +           data_phy_cycles * dsi->lanes + delta) {
> +               horizontal_frontporch_byte =
> +                       vm->hfront_porch * dsi_tmp_buf_bpp -
> +                       (data_phy_cycles * dsi->lanes + delta) *
> +                       vm->hfront_porch /
> +                       (vm->hfront_porch + vm->hback_porch);
> +
> +               horizontal_backporch_byte =
> +                       horizontal_backporch_byte -
> +                       (data_phy_cycles * dsi->lanes + delta) *
> +                       vm->hback_porch /
> +                       (vm->hfront_porch + vm->hback_porch);
>         } else {
> -               if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
> -                   data_phy_cycles * dsi->lanes + 12) {
> -                       horizontal_frontporch_byte =
> -                               vm->hfront_porch * dsi_tmp_buf_bpp -
> -                               (data_phy_cycles * dsi->lanes + 12) *
> -                               vm->hfront_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -                       horizontal_backporch_byte = horizontal_backporch_byte -
> -                               (data_phy_cycles * dsi->lanes + 12) *
> -                               vm->hback_porch /
> -                               (vm->hfront_porch + vm->hback_porch);
> -               } else {
> -                       DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> -                       horizontal_frontporch_byte = vm->hfront_porch *
> -                                                    dsi_tmp_buf_bpp;
> -               }
> +               DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
> +               horizontal_frontporch_byte = vm->hfront_porch *
> +                                            dsi_tmp_buf_bpp;
>         }
>
>         writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> --
> 2.12.5
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
