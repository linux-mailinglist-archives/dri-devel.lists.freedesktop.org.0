Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45C43D7BC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 01:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533856E8E5;
	Wed, 27 Oct 2021 23:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC096E908
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:47:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E25661073
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635378473;
 bh=t+PpqypSCKapTKRguvjCBaJPzX1t0c7f7uN58dcUX7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g35vda8IPAZHnszM/A969Xutm5EPOZJyoiXZ6xXU5xMhupCFrKeb2gAzsFABGAJO9
 JZmzqgM1jCV7X2r00r3JANnowHEwoGcx6YT5cHvQuDiBliY1FnnIewjQ98rtxKvIyP
 8H4po/ArJBCEdqHRTuKXeEitONH/RP+rIqsLx609a3SzptaiBKFwNKtM//ImcIi692
 GNFPf//j06uYa4Z6s0uJH5Yd5j6cNsygjaYvJwMSBbzJxlGYVNoMWjMUllt75wFAjs
 WwWicaSlYeI9CXqZvPpftCo5DS+s6yS0xLl+EP20WZa+sXrwDgWXDGgAko1VPRsUmH
 o+tvCXbwDoHBw==
Received: by mail-ed1-f50.google.com with SMTP id g10so16907398edj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:47:53 -0700 (PDT)
X-Gm-Message-State: AOAM5339z3X9R0y8cqd3LXZdXaDQb9p13vAY0kDjcpu8SnIuGOdoXse1
 hA9xzZTbiw3UnyDEXft01rK+3P6yU12Y5vHIxA==
X-Google-Smtp-Source: ABdhPJxg4eUZljI10gC+7+cwqF6vxnwg2Rr90TkBscgjdcWRIhtecmw9FjFNDtU5mtrkdv/lNBHMmDxTzmNvXUH9TzE=
X-Received: by 2002:a05:6402:28f:: with SMTP id
 l15mr1357751edv.272.1635378471564; 
 Wed, 27 Oct 2021 16:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
 <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
In-Reply-To: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Oct 2021 07:47:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
Message-ID: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: Fei Shao <fshao@chromium.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=8827=E6=97=A5=
 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Jason,
>
> On Wed, Oct 27, 2021 at 10:19 AM jason-jh.lin <jason-jh.lin@mediatek.com>=
 wrote:
> >
> > From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >
> > CMDQ is used to update display register in vblank period, so
> > it should be execute in next 2 vblank. One vblank interrupt
> > before send message (occasionally) and one vblank interrupt
> > after cmdq done. If it fail to execute in next 3 vblank,
> > tiemout happen.
> >
> > Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index e23e3224ac67..dad1f85ee315 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -54,6 +54,7 @@ struct mtk_drm_crtc {
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >         struct cmdq_client              cmdq_client;
> >         u32                             cmdq_event;
> > +       u32                             cmdq_vblank_cnt;
> >  #endif
> >
> >         struct device                   *mmsys_dev;
> > @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(st=
ruct drm_crtc *crtc,
> >  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
> >  {
> >         struct cmdq_cb_data *data =3D mssg;
> > +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_cl=
ient, client);
> > +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struct =
mtk_drm_crtc, cmdq_client);
> >
> > +       mtk_crtc->cmdq_vblank_cnt =3D 0;
> >         cmdq_pkt_destroy(data->pkt);
> >  }
> >  #endif
> > @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_=
drm_crtc *mtk_crtc,
> >                                            cmdq_handle->pa_base,
> >                                            cmdq_handle->cmd_buf_size,
> >                                            DMA_TO_DEVICE);
> > +               /*
> > +                * CMDQ command should execute in next 3 vblank.
> > +                * One vblank interrupt before send message (occasional=
ly)
> > +                * and one vblank interrupt after cmdq done,
> > +                * so it's timeout after 3 vblank interrupt.
> > +                * If it fail to execute in next 3 vblank, timeout happ=
en.
> > +                */
> > +               mtk_crtc->cmdq_vblank_cnt =3D 3;
> > +
> >                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_hand=
le);
> >                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> >         }
> > @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan=
)
> > +               mtk_crtc_ddp_config(crtc, NULL);
> > +       else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vbla=
nk_cnt =3D=3D 0)
> I think atomic_dec_and_test() does what you want to do here.

I think this operation is not necessary to be atomic operation, and
this statement could be reduced to

else if (--mtk_crtc->cmdq_vblank_cnt =3D=3D 0)

>
>
>
>
> > +               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n"=
,
> > +                         drm_crtc_index(&mtk_crtc->base));
> >  #else
> >         if (!priv->data->shadow_register)
> > -#endif
> >                 mtk_crtc_ddp_config(crtc, NULL);
> > -
> > +#endif
> >         mtk_drm_finish_page_flip(mtk_crtc);
> >  }
> >
> > --
> > 2.18.0
> >
