Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E369341DB70
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 15:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AB36E405;
	Thu, 30 Sep 2021 13:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B5B6E405
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:48:27 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id s64so10294277yba.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qCIbO2wDMMyDd6uR7JBLH8cBfovCQ4m78b6Zq5gtU3g=;
 b=P7qbv00TT3+cgp3SZV9RZ7gJmxPS5QZ7PA4t/ktRiK/NRvGTVuEXKMeY1XAcAUgXQK
 ze4E5mPXOHN133Go2PkI92waBTDjPzOqlawUlkq9DFzNOZqOHNUTSPrAxm+HeT7nGgFp
 XCE0+LSS+ahvCsWatEOcVKVgD+csrmqzuHcCaMG2NuTJoo86+0gSTpR7o2Moj7N4OAOo
 o+e/8WDEE7HdIgdgHKnPIzPSXdV1Bdah8OKD3rLxxdg/1N1IYntPdLp4eMVX09PXPdaB
 1zmFi+N0FiygJLPQAzGNy26F1As4VQDSnYM14UkDtnEdn+49lJ7V474pLA7goNLPqHQG
 oyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qCIbO2wDMMyDd6uR7JBLH8cBfovCQ4m78b6Zq5gtU3g=;
 b=UFOgs5ZEb5MVWCOlztRX5J3lYPbO26e0kuDJISsrjMIrQcDgcFlKKuPI8gtHlNAu8o
 JrSipK2VbOqtr6dBLC9/dz1clPVr13dVT4YrOSfTXtT5gM4HKrXVQbTdTnEXi/9W0y1o
 qykKl3/4JAeJfNKFeNa4219+H/KIkKgmyjKc+nP31Bjc0n/E1Q4y8+Mwkb9GGfZWZCuH
 MyUI2nSIV4L7ZsUDt4bVVK5rXtB4kbVOd5dbv6ugLoQOXohYlINIz0lY1oQ9Tt7PlOoh
 OJi9YgBtOrYIBizUOIHwG5R243SPwnxPZAOaohWfHX2chwNnH4JytL8Ed8LCO6Btztoe
 6BnQ==
X-Gm-Message-State: AOAM531VHDjQeIT7wHl9cm7cxZKIUPkC5kte4EXVdCF9zS5J/WCBApus
 jxKVC7ZJK4K844EdhPDereeToWAChCCXAsCvQGA=
X-Google-Smtp-Source: ABdhPJxWKS4DRNt+humwQM3heZ62u0HU+19M7PR9EVUL9V94tLiFoB95guhBC/knRHIVnGvV2v+TNNyTL2rdOK4jAnA=
X-Received: by 2002:a05:6902:1549:: with SMTP id
 r9mr7219948ybu.204.1633009706685; 
 Thu, 30 Sep 2021 06:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-2-jason-jh.lin@mediatek.com>
 <CAFqH_52w787DGbVE0WqMjA2y8Psw6XDMp8AFhj=7UMyCA-uv+g@mail.gmail.com>
 <CAAOTY_-bU-zuNE6-omHV=54R5UDOH2KQ0iD_ZcLc-VDeA65vTA@mail.gmail.com>
In-Reply-To: <CAAOTY_-bU-zuNE6-omHV=54R5UDOH2KQ0iD_ZcLc-VDeA65vTA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 30 Sep 2021 15:48:14 +0200
Message-ID: <CAFqH_52W6qaG665rikgo5rkiYfo5Z_xX9RycHpA1rG_+yEm_xg@mail.gmail.com>
Subject: Re: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
 "Nancy.Lin" <nancy.lin@mediatek.com>, singo.chang@mediatek.com
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

Hi Chun-Kuang,

Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dj., 30 de
set. 2021 a les 15:11:
>
> Hi, Enric:
>
> Enric Balletbo Serra <eballetbo@gmail.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >
> > Hi Jason,
> >
> >
> > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 30
> > de set. 2021 a les 4:47:
> > >
> > > Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
> > > crash at using pkt->cl->chan in cmdq_pkt_finalize.
> > >
> > > So add struct cmdq_client and let mtk_drm_crtc instance define
> > > cmdq_client as:
> > >
> > > struct mtk_drm_crtc {
> > >         /* client instance data */
> > >         struct cmdq_client cmdq_client;
> > > };
> > >
> > > and in rx_callback function can use pkt->cl to get
> > > struct cmdq_client.
> > >
> > > Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
> >
> > Looking at this patchset looks like you're fixing the above commit by
> > reintroducing the 'struct cmdq_client' again, which makes the above
> > commit as a non-sense commit. That's confusing and not clear. I'm
> > wondering if it wouldn't be more clear if you can just revert that
> > patch. Then if there are more changes that need to be done do it with
> > a follow up patch and really explain why these changes are needed.
>
> The patch f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
> does two things. One is to remove struct cmdq_client, another one is
> to embed cmdq_cl

Then it should have been two patches, one thing for patch really
helps, specially when something breaks and you try to bisect it.

> in mtk_drm_crtc (This means the pointer of cmdq_cl could be used to
> find the pointer of mtk_drm_crtc). The correct way to fix that patch
> is to remove the access to cmdq_client in cmdq_pkt_finalize(), but
> that would be a long term process. The simple way is to revert that
> patch, but the other patches depend on embedding cmdq_cl in
> mtk_drm_crtc. So this patch just revert the removing of struct
> cmdq_client but keep embedding cmdq_cl in mtk_drm_crtc.
>

Yes, I know and I suffered that when bisecting and I ended to revert
the full series in my local tree,  although I figured out that the
problem was this specific patch.

The following series landed during -rc1 cycle and break the Acer Chromebook=
 R13

 9efb16c2fdd6 ("drm/mediatek: Clear pending flag when cmdq packet is done")
 bc9241be73d9 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
 8cdcb3653424 ("drm/mediatek: Detect CMDQ execution timeout")
 f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
 c1ec54b7b5af ("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_=
cb")

Apart from that it was a pain bisecting and introduced different
behaviours between patches, all the above commits have a follow-up
patch (see [1] and [2]) as a fix for the landed series. That makes me
think that were no stable enough. As we're in the rc, and as you said
this is not the correct way to fix it, and the landed patches seems
more a cleanup that really solving a real problem I'd consider to just
revert the full series and resubmit again for next release with these
fixes squashed. IMO that will also help to no miss anything when
someone would backport all this to the stable versions and understand
better the history.

Just my 5 cents. In any case, I can confirm that applying the full
series solves the current problems that I have with my Acer Chromebook
R13.

Thanks,
  Enric

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5553=
83
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5547=
67



> Regards,
> Chun-Kuang.
>
> >
> > Thanks,
> >   Enric
> >
> >
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++----------=
--
> > >  1 file changed, 38 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_crtc.c
> > > index 5f81489fc60c..411d99fcbb8f 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > @@ -52,8 +52,7 @@ struct mtk_drm_crtc {
> > >         bool                            pending_async_planes;
> > >
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > -       struct mbox_client              cmdq_cl;
> > > -       struct mbox_chan                *cmdq_chan;
> > > +       struct cmdq_client              cmdq_client;
> > >         struct cmdq_pkt                 cmdq_handle;
> > >         u32                             cmdq_event;
> > >         u32                             cmdq_vblank_cnt;
> > > @@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(s=
truct drm_crtc *crtc,
> > >  }
> > >
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > -static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cm=
dq_pkt *pkt,
> > > -                                   size_t size)
> > > +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struc=
t cmdq_pkt *pkt,
> > > +                                  size_t size)
> > >  {
> > >         struct device *dev;
> > >         dma_addr_t dma_addr;
> > > @@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_ch=
an *chan, struct cmdq_pkt *pkt,
> > >                 return -ENOMEM;
> > >         }
> > >         pkt->buf_size =3D size;
> > > +       pkt->cl =3D (void *)client;
> > >
> > > -       dev =3D chan->mbox->dev;
> > > +       dev =3D client->chan->mbox->dev;
> > >         dma_addr =3D dma_map_single(dev, pkt->va_base, pkt->buf_size,
> > >                                   DMA_TO_DEVICE);
> > >         if (dma_mapping_error(dev, dma_addr)) {
> > > @@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_c=
han *chan, struct cmdq_pkt *pkt,
> > >         return 0;
> > >  }
> > >
> > > -static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct =
cmdq_pkt *pkt)
> > > +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> > >  {
> > > -       dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size=
,
> > > +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> > > +
> > > +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->=
buf_size,
> > >                          DMA_TO_DEVICE);
> > >         kfree(pkt->va_base);
> > >         kfree(pkt);
> > > @@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_=
chan *chan, struct cmdq_pkt *pk
> > >
> > >  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
> > >  {
> > > -       struct mtk_drm_crtc *mtk_crtc =3D container_of(cl, struct mtk=
_drm_crtc, cmdq_cl);
> > >         struct cmdq_cb_data *data =3D mssg;
> > > +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_=
client, client);
> > > +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struc=
t mtk_drm_crtc, cmdq_client);
> > >         struct mtk_crtc_state *state;
> > >         unsigned int i;
> > >
> > > @@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, v=
oid *mssg)
> > >         }
> > >
> > >         mtk_crtc->cmdq_vblank_cnt =3D 0;
> > > -       mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> > > +       mtk_drm_cmdq_pkt_destroy(data->pkt);
> > >  }
> > >  #endif
> > >
> > > @@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct m=
tk_drm_crtc *mtk_crtc,
> > >                 mtk_mutex_release(mtk_crtc->mutex);
> > >         }
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > -       if (mtk_crtc->cmdq_chan) {
> > > -               mbox_flush(mtk_crtc->cmdq_chan, 2000);
> > > +       if (mtk_crtc->cmdq_client.chan) {
> > > +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
> > >                 cmdq_handle->cmd_buf_size =3D 0;
> > >                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_even=
t);
> > >                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false=
);
> > >                 mtk_crtc_ddp_config(crtc, cmdq_handle);
> > >                 cmdq_pkt_finalize(cmdq_handle);
> > > -               dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox-=
>dev,
> > > -                                           cmdq_handle->pa_base,
> > > -                                           cmdq_handle->cmd_buf_size=
,
> > > -                                           DMA_TO_DEVICE);
> > > +               dma_sync_single_for_device(mtk_crtc->cmdq_client.chan=
->mbox->dev,
> > > +                                          cmdq_handle->pa_base,
> > > +                                          cmdq_handle->cmd_buf_size,
> > > +                                          DMA_TO_DEVICE);
> > >                 /*
> > >                  * CMDQ command should execute in next vblank,
> > >                  * If it fail to execute in next 2 vblank, timeout ha=
ppen.
> > >                  */
> > >                 mtk_crtc->cmdq_vblank_cnt =3D 2;
> > > -               mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
> > > -               mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
> > > +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_ha=
ndle);
> > > +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> > >         }
> > >  #endif
> > >         mtk_crtc->config_updating =3D false;
> > > @@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
> > >         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
> > >
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
> > > +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.ch=
an)
> > >                 mtk_crtc_ddp_config(crtc, NULL);
> > >         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vb=
lank_cnt =3D=3D 0)
> > >                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\=
n",
> > > @@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_=
dev,
> > >         mutex_init(&mtk_crtc->hw_lock);
> > >
> > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > -       mtk_crtc->cmdq_cl.dev =3D mtk_crtc->mmsys_dev;
> > > -       mtk_crtc->cmdq_cl.tx_block =3D false;
> > > -       mtk_crtc->cmdq_cl.knows_txdone =3D true;
> > > -       mtk_crtc->cmdq_cl.rx_callback =3D ddp_cmdq_cb;
> > > -       mtk_crtc->cmdq_chan =3D
> > > -                       mbox_request_channel(&mtk_crtc->cmdq_cl,
> > > -                                             drm_crtc_index(&mtk_crt=
c->base));
> > > -       if (IS_ERR(mtk_crtc->cmdq_chan)) {
> > > +       mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
> > > +       mtk_crtc->cmdq_client.client.tx_block =3D false;
> > > +       mtk_crtc->cmdq_client.client.knows_txdone =3D true;
> > > +       mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
> > > +       mtk_crtc->cmdq_client.chan =3D
> > > +                       mbox_request_channel(&mtk_crtc->cmdq_client.c=
lient,
> > > +                                            drm_crtc_index(&mtk_crtc=
->base));
> > > +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
> > >                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox cl=
ient, writing register by CPU now\n",
> > >                         drm_crtc_index(&mtk_crtc->base));
> > > -               mtk_crtc->cmdq_chan =3D NULL;
> > > +               mtk_crtc->cmdq_client.chan =3D NULL;
> > >         }
> > >
> > > -       if (mtk_crtc->cmdq_chan) {
> > > +       if (mtk_crtc->cmdq_client.chan) {
> > >                 ret =3D of_property_read_u32_index(priv->mutex_node,
> > >                                                  "mediatek,gce-events=
",
> > >                                                  drm_crtc_index(&mtk_=
crtc->base),
> > > @@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_=
dev,
> > >                 if (ret) {
> > >                         dev_dbg(dev, "mtk_crtc %d failed to get media=
tek,gce-events property\n",
> > >                                 drm_crtc_index(&mtk_crtc->base));
> > > -                       mbox_free_channel(mtk_crtc->cmdq_chan);
> > > -                       mtk_crtc->cmdq_chan =3D NULL;
> > > +                       mbox_free_channel(mtk_crtc->cmdq_client.chan)=
;
> > > +                       mtk_crtc->cmdq_client.chan =3D NULL;
> > >                 } else {
> > > -                       ret =3D mtk_drm_cmdq_pkt_create(mtk_crtc->cmd=
q_chan,
> > > -                                                      &mtk_crtc->cmd=
q_handle,
> > > -                                                      PAGE_SIZE);
> > > +                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cm=
dq_client,
> > > +                                                     &mtk_crtc->cmdq=
_handle,
> > > +                                                     PAGE_SIZE);
> > >                         if (ret) {
> > >                                 dev_dbg(dev, "mtk_crtc %d failed to c=
reate cmdq packet\n",
> > >                                         drm_crtc_index(&mtk_crtc->bas=
e));
> > > -                               mbox_free_channel(mtk_crtc->cmdq_chan=
);
> > > -                               mtk_crtc->cmdq_chan =3D NULL;
> > > +                               mbox_free_channel(mtk_crtc->cmdq_clie=
nt.chan);
> > > +                               mtk_crtc->cmdq_client.chan =3D NULL;
> > >                         }
> > >                 }
> > >         }
> > > --
> > > 2.18.0
> > >
