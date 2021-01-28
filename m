Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9B307133
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9956E92C;
	Thu, 28 Jan 2021 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC486E8C8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 05:09:53 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id u7so4332018iol.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 21:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wm/YQVXUMhIB/BMDJogyUbmGWPEi6vcYSKKfpvve88M=;
 b=XfARxNdjxfvwbLx87S4vCHGZ+hfoFXMjUJwaPdnI3B5svpibAJe2bxnEiivIvlareH
 nLMmddqGzyG0sSKdPR6iM7yvKfFBSzPSZ/UdDvm6ZTbORRtrQ52843Z4tTH4K/cmZhBr
 HouPPShhc/heV0RPWVfOFxAJ3hTmLn0UViKMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wm/YQVXUMhIB/BMDJogyUbmGWPEi6vcYSKKfpvve88M=;
 b=S8W5Rj/rmeSc4AsI7kAK15XCPtCP/pqofn8t9ft68rxQrwAVHgKvlEbunDOwdeyxGF
 ohnGwxA4bis1NL72WeJCKkVYfeEUg7lDOE3I8r1/EiMXb42cubjftgJu8iOEs/Ob+Yr+
 IV4W/LN/UoMsL/bAy/qOGL3ntWmVAQfNTR5O21bc7kulsrMnF6G8TlHYELH4raDTzEoT
 6VKacmeU+AxGki5hlvNXQoC7If8UNwWaY2qLOsaov4/3V4tFuti+9bCReUz7BunEfH5c
 8s5ZfkZFGed4XVvVXiYFbNNMUTjFXphygbkDcFSK4yWCsP1TsON+VPsc9F33B0Y9e+Ge
 DEww==
X-Gm-Message-State: AOAM530L40yQ3phby+kehucTpgfaE24s0pkKUFlXiDL19+xtqHFwmq+q
 9YHcATKTphRRbtPn3jdlIVi5EeNVrmxTXkmAlVB5RA==
X-Google-Smtp-Source: ABdhPJw9RDW4YOgrrY0K/Zhny0x/8TzsFk5NQqU8SfevdJcvgReB/EkAPUFQ4VOQjiKOfFg40N4g+dqfJBA6RuMZM68=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr11568954jad.98.1611810592540; 
 Wed, 27 Jan 2021 21:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-5-hsinyi@chromium.org>
 <1611808753.19104.2.camel@mtksdaap41>
In-Reply-To: <1611808753.19104.2.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:09:26 +0800
Message-ID: <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/9] drm/mediatek: generalize mtk_dither_set() function
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:35 +0000
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
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 28, 2021 at 12:39 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > There may be data structure other than mtk_ddp_comp_dev that would call
> > mtk_dither_set(), so use regs as parameter instead of device.
>
> You does not change the interface of mtk_dither_set(). You move the
> common part in mtk_dither_set() to a new function which could be called
> by another caller.
>
> Regards,
> CK.
>
Current mtk_dither_set() cast dev data to struct mtk_ddp_comp_dev. But
mtk_disp_gamma in next patch would also call this function. But it's
dev data is struct mtk_disp_gamma, which is different, so we can't
cast to mtk_ddp_comp_dev. I separate the necessary parameters (regs,
cmdq_reg) out, so both component dither and gamma can both call this
separated function.

This is similar to the mtk_gamma_set_common() in the next patch, which
gamma and aal both used.

> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
> >  2 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 46d199b7b4a29..c50d5fc9fd349 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_color_start(struct device *dev);
> >
> > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > +                        unsigned int bpc, unsigned int CFG,
> > +                        struct cmdq_pkt *cmdq_pkt);
> > +
> >  void mtk_dpi_start(struct device *dev);
> >  void mtk_dpi_stop(struct device *dev);
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 7b5293429426d..53d25823a37cc 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
> >       clk_disable_unprepare(priv->clk);
> >  }
> >
> > -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > -                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > -{
> > -     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> >
> > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > +                        unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > +{
> >       /* If bpc equal to 0, the dithering function didn't be enabled */
> >       if (bpc == 0)
> >               return;
> >
> >       if (bpc >= MTK_MIN_BPC) {
> > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
> >               mtk_ddp_write(cmdq_pkt,
> >                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> >                             DITHER_NEW_BIT_MODE,
> > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> > +                           cmdq_reg, regs, DISP_DITHER_15);
> >               mtk_ddp_write(cmdq_pkt,
> >                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> >                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> > -             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> > +                           cmdq_reg, regs, DISP_DITHER_16);
> > +             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
> >       }
> >  }
> >
> > +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > +                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +
> > +     mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> > +}
> > +
> >  static void mtk_od_config(struct device *dev, unsigned int w,
> >                         unsigned int h, unsigned int vrefresh,
> >                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
