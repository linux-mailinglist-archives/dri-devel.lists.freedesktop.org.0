Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C011DF51
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 09:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66926E2A3;
	Fri, 13 Dec 2019 08:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A8F6E227
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 22:47:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so4440145wma.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5IJJRTBUjrokx6n8I8OPKUPzWJ7qg8DNRBW3t4GV4Hs=;
 b=kX4Os0/lmxUm0ai4YVXeTrYk3/ranF6amw6hCIl/ou5WqeGFakXwQU+loVIIgfi4xc
 oglwyJSaXF6gkgkPBV2wqaCrkUBE4toVvQqRGyHHhNPJ/huzNw/cXU8CARArhIFV/+w0
 248c/615FpGIQfyc1bJwr17+CPu01hMLuo4bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5IJJRTBUjrokx6n8I8OPKUPzWJ7qg8DNRBW3t4GV4Hs=;
 b=KU5+S4kR7AhoTMyumYm1NIbRl7AWhV0v47SSeeboKAemBajkEwDWJGOuNOc15YLii7
 I81F27j4M475MZ2JPq1mPUzCk9EXt0eTcMv/ovhDGqVBlDGdmTXy2mDRAAubtbt8UdnF
 w5uLGVDFU+B5WgsiEYLqFmWXsmGi/kd4oG8dmmpY6UWzhet2T29C2OdJgJtYuo2Qz/aX
 /w26NxoLGXuQCRggpEBkhZlKYvgk1BFibFsx6ZYmmOdpktINnznzwxdgAyY1ALs6mP1p
 x2ZhaMZe3xyfjWFB66Qfqae78rO7PU0c5DHBfmNjCGg8rkaVeZGLphkOxqdLfiDQJOgp
 v1+Q==
X-Gm-Message-State: APjAAAXaKUtZWxra8sq6/nD4XaNFy3c9Hbyv82P7Nf1naCbhDt3EY4Hv
 ZQ6NxXq/CyKtCGIq4J9bUnlmFzbpk3VLSnmc0RQRsA==
X-Google-Smtp-Source: APXvYqzLUhVmZ2ENiiGNDu1FtI/To6o6PiCFobC/bnZ0WlUCNbChjfxbsuSViZE3KiuSeSBxKkwz8oYHc7ZR/7aSsEs=
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr9700769wmh.22.1576190873745;
 Thu, 12 Dec 2019 14:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-8-jitao.shi@mediatek.com>
 <1569487880.9612.2.camel@mtksdaap41>
 <CAFqH_52oPHH-9GGCgsYVK5K6ys9OrdkMad59+Mm5CzSdbcx7rw@mail.gmail.com>
In-Reply-To: <CAFqH_52oPHH-9GGCgsYVK5K6ys9OrdkMad59+Mm5CzSdbcx7rw@mail.gmail.com>
From: Ryan Case <ryandcase@chromium.org>
Date: Thu, 12 Dec 2019 14:47:42 -0800
Message-ID: <CACjz--kPY4DwJjMu+8EWanMWu6oD-OGm-wku3HGFvXea7F-yYw@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: change the dsi phytiming calculate
 method
To: Enric Balletbo Serra <eballetbo@gmail.com>
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:22:24 +0000
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, sj.huang@mediatek.com,
 Hsinyu Chao <hychao@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

On Thu, Dec 12, 2019 at 5:53 AM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi,
>
> Missatge de CK Hu <ck.hu@mediatek.com> del dia dj., 26 de set. 2019 a les 10:51:
> >
> > Hi, Jitao:
> >
> > On Thu, 2019-09-19 at 14:58 +0800, Jitao Shi wrote:
> > > Change the method of frame rate calc which can get more accurate
> > > frame rate.
> > >
> > > data rate = pixel_clock * bit_per_pixel / lanes
> > > Adjust hfp_wc to adapt the additional phy_data
> > >
> > > if MIPI_DSI_MODE_VIDEO_BURST
> > >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12 - 6;
> > > else
> > >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12;
> > >
> > > Note:
> > > //(2: 1 for sync, 1 for phy idle)
> > > data_phy_cycles = T_hs_exit + T_lpx + T_hs_prepare + T_hs_zero + 2;
> > >
> > > bpp: bit per pixel
> >
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> >
> > >
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Tested-by: Ryan Case <ryandcase@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 118 ++++++++++++++++++++---------
>
> I didn't look in detail yet because looks like there is a lot of maths
> involved, but this patch introduces a regression for MT8173 or my
> board (Acer Chromebook R 13 - ELM). I need to revert this patch in
> order to make the display working, basically, I don't see any error
> but I only get a black screen. Reverting this patch fixes the issue
> for me. If anyone knows what could be the problem I'd appreciate.

I won't pretend to be aware of current status but an in progress patch
with updated timings that have been tested on elm can be found here:
https://crrev.com/c/1915442

- ryan

>
> Thanks,
>  Enric
>
> > >  1 file changed, 81 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index b3676426aeb5..b02373b04848 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -136,12 +136,6 @@
> > >  #define DATA_0                               (0xff << 16)
> > >  #define DATA_1                               (0xff << 24)
> > >
> > > -#define T_LPX                5
> > > -#define T_HS_PREP    6
> > > -#define T_HS_TRAIL   8
> > > -#define T_HS_EXIT    7
> > > -#define T_HS_ZERO    10
> > > -
> > >  #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
> > >
> > >  #define MTK_DSI_HOST_IS_READ(type) \
> > > @@ -150,6 +144,25 @@
> > >       (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
> > >       (type == MIPI_DSI_DCS_READ))
> > >
> > > +struct mtk_phy_timing {
> > > +     u32 lpx;
> > > +     u32 da_hs_prepare;
> > > +     u32 da_hs_zero;
> > > +     u32 da_hs_trail;
> > > +
> > > +     u32 ta_go;
> > > +     u32 ta_sure;
> > > +     u32 ta_get;
> > > +     u32 da_hs_exit;
> > > +
> > > +     u32 clk_hs_zero;
> > > +     u32 clk_hs_trail;
> > > +
> > > +     u32 clk_hs_prepare;
> > > +     u32 clk_hs_post;
> > > +     u32 clk_hs_exit;
> > > +};
> > > +
> > >  struct phy;
> > >
> > >  struct mtk_dsi_driver_data {
> > > @@ -180,6 +193,7 @@ struct mtk_dsi {
> > >       enum mipi_dsi_pixel_format format;
> > >       unsigned int lanes;
> > >       struct videomode vm;
> > > +     struct mtk_phy_timing phy_timing;
> > >       int refcount;
> > >       bool enabled;
> > >       u32 irq_data;
> > > @@ -213,17 +227,36 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
> > >  {
> > >       u32 timcon0, timcon1, timcon2, timcon3;
> > >       u32 ui, cycle_time;
> > > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> > > +
> > > +     ui = DIV_ROUND_UP(1000000000, dsi->data_rate);
> > > +     cycle_time = div_u64(8000000000ULL, dsi->data_rate);
> > > +
> > > +     timing->lpx = NS_TO_CYCLE(60, cycle_time);
> > > +     timing->da_hs_prepare = NS_TO_CYCLE(50 + 5 * ui, cycle_time);
> > > +     timing->da_hs_zero = NS_TO_CYCLE(110 + 6 * ui, cycle_time);
> > > +     timing->da_hs_trail = NS_TO_CYCLE(77 + 4 * ui, cycle_time);
> > >
> > > -     ui = 1000 / dsi->data_rate + 0x01;
> > > -     cycle_time = 8000 / dsi->data_rate + 0x01;
> > > +     timing->ta_go = 4 * timing->lpx;
> > > +     timing->ta_sure = 3 * timing->lpx / 2;
> > > +     timing->ta_get = 5 * timing->lpx;
> > > +     timing->da_hs_exit = 2 * timing->lpx;
> > >
> > > -     timcon0 = T_LPX | T_HS_PREP << 8 | T_HS_ZERO << 16 | T_HS_TRAIL << 24;
> > > -     timcon1 = 4 * T_LPX | (3 * T_LPX / 2) << 8 | 5 * T_LPX << 16 |
> > > -               T_HS_EXIT << 24;
> > > -     timcon2 = ((NS_TO_CYCLE(0x64, cycle_time) + 0xa) << 24) |
> > > -               (NS_TO_CYCLE(0x150, cycle_time) << 16);
> > > -     timcon3 = NS_TO_CYCLE(0x40, cycle_time) | (2 * T_LPX) << 16 |
> > > -               NS_TO_CYCLE(80 + 52 * ui, cycle_time) << 8;
> > > +     timing->clk_hs_zero = NS_TO_CYCLE(336, cycle_time);
> > > +     timing->clk_hs_trail = NS_TO_CYCLE(100, cycle_time) + 10;
> > > +
> > > +     timing->clk_hs_prepare = NS_TO_CYCLE(64, cycle_time);
> > > +     timing->clk_hs_post = NS_TO_CYCLE(80 + 52 * ui, cycle_time);
> > > +     timing->clk_hs_exit = 2 * timing->lpx;
> > > +
> > > +     timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
> > > +               timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
> > > +     timcon1 = timing->ta_go | timing->ta_sure << 8 |
> > > +               timing->ta_get << 16 | timing->da_hs_exit << 24;
> > > +     timcon2 = 1 << 8 | timing->clk_hs_zero << 16 |
> > > +               timing->clk_hs_trail << 24;
> > > +     timcon3 = timing->clk_hs_prepare | timing->clk_hs_post << 8 |
> > > +               timing->clk_hs_exit << 16;
> > >
> > >       writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
> > >       writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
> > > @@ -410,7 +443,8 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> > >       u32 horizontal_sync_active_byte;
> > >       u32 horizontal_backporch_byte;
> > >       u32 horizontal_frontporch_byte;
> > > -     u32 dsi_tmp_buf_bpp;
> > > +     u32 dsi_tmp_buf_bpp, data_phy_cycles;
> > > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> > >
> > >       struct videomode *vm = &dsi->vm;
> > >
> > > @@ -437,7 +471,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> > >               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> > >                       dsi_tmp_buf_bpp - 10);
> > >
> > > -     horizontal_frontporch_byte = (vm->hfront_porch * dsi_tmp_buf_bpp - 12);
> > > +     data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> > > +                               timing->da_hs_zero + timing->da_hs_exit + 2;
> > > +
> > > +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> > > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > > +                 data_phy_cycles * dsi->lanes + 18) {
> > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > +                                                  dsi_tmp_buf_bpp -
> > > +                                                  data_phy_cycles *
> > > +                                                  dsi->lanes - 18;
> > > +             } else {
> > > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > +                                                  dsi_tmp_buf_bpp;
> > > +             }
> > > +     } else {
> > > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > > +                 data_phy_cycles * dsi->lanes + 12) {
> > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > +                                                  dsi_tmp_buf_bpp -
> > > +                                                  data_phy_cycles *
> > > +                                                  dsi->lanes - 12;
> > > +             } else {
> > > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > +                                                  dsi_tmp_buf_bpp;
> > > +             }
> > > +     }
> > >
> > >       writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> > >       writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> > > @@ -537,8 +598,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> > >  {
> > >       struct device *dev = dsi->host.dev;
> > >       int ret;
> > > -     u64 pixel_clock, total_bits;
> > > -     u32 htotal, htotal_bits, bit_per_pixel, overhead_cycles, overhead_bits;
> > > +     u32 bit_per_pixel;
> > >
> > >       if (++dsi->refcount != 1)
> > >               return 0;
> > > @@ -557,24 +617,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> > >               break;
> > >       }
> > >
> > > -     /**
> > > -      * htotal_time = htotal * byte_per_pixel / num_lanes
> > > -      * overhead_time = lpx + hs_prepare + hs_zero + hs_trail + hs_exit
> > > -      * mipi_ratio = (htotal_time + overhead_time) / htotal_time
> > > -      * data_rate = pixel_clock * bit_per_pixel * mipi_ratio / num_lanes;
> > > -      */
> > > -     pixel_clock = dsi->vm.pixelclock;
> > > -     htotal = dsi->vm.hactive + dsi->vm.hback_porch + dsi->vm.hfront_porch +
> > > -                     dsi->vm.hsync_len;
> > > -     htotal_bits = htotal * bit_per_pixel;
> > > -
> > > -     overhead_cycles = T_LPX + T_HS_PREP + T_HS_ZERO + T_HS_TRAIL +
> > > -                     T_HS_EXIT;
> > > -     overhead_bits = overhead_cycles * dsi->lanes * 8;
> > > -     total_bits = htotal_bits + overhead_bits;
> > > -
> > > -     dsi->data_rate = DIV_ROUND_UP_ULL(pixel_clock * total_bits,
> > > -                                       htotal * dsi->lanes);
> > > +     dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> > > +                                       dsi->lanes);
> > >
> > >       ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
> > >       if (ret < 0) {
> >
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
