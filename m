Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDB641F191
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5706EE2F;
	Fri,  1 Oct 2021 15:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263CD6EE2F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:52:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D438061ABE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633103577;
 bh=jFCTGoNM7kXhzIy5u6FeGgm3nFsVRyLlZlXxykIL0ag=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T+5fJXNs+6lD6K1e+SBF+VRL/3usLUDapCAUOMzQgDxBtQnSzmirQhsCpgFj3NnqC
 9APuQhphmx8CdqkG90yTUdScxNNDTNLwA8nBDigPEjQMmJGf2BJBmS2dxcXnuA8xV2
 ImrYpIlJ0WPuMu2uXMdjvB3tldqya5lkWOkV8THjdOGk7NfTOGytrP1GTIt88CDHyg
 cnKGU4q0mGJIbRNCpqZzo/FAcMaIe2p4KAKWueUHMzh42tJFjBNkW91WXzGL9aAM9I
 v8Ebdex4f+FuqcA00SK73Xa4GSTpPRGJtpxPSIelnYFkyxYU1TlG+NaAPqG7E9UdRE
 iupaBlK7GGuFw==
Received: by mail-ed1-f49.google.com with SMTP id dj4so37393997edb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:52:57 -0700 (PDT)
X-Gm-Message-State: AOAM533Ez4yflqSNLWFBqqkZW1j13S0ykMA47bkbBjAJX/4gZSs71yAh
 dpruL0pDS+9gKiK485q+Gcgi3dXgTtkozj3zMQ==
X-Google-Smtp-Source: ABdhPJwIaCPJFnc4N+YU/9iiTssFja3Ohcwz3hKDU1cbsPtm4hkGkuHZ+VpjcO1x9eGcVt7Ku2otLE/+B/KN7M/Y6kQ=
X-Received: by 2002:a50:9d49:: with SMTP id j9mr14725210edk.39.1633103576227; 
 Fri, 01 Oct 2021 08:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-2-jason-jh.lin@mediatek.com>
 <CAFqH_52w787DGbVE0WqMjA2y8Psw6XDMp8AFhj=7UMyCA-uv+g@mail.gmail.com>
 <CAAOTY_-bU-zuNE6-omHV=54R5UDOH2KQ0iD_ZcLc-VDeA65vTA@mail.gmail.com>
 <CAFqH_52W6qaG665rikgo5rkiYfo5Z_xX9RycHpA1rG_+yEm_xg@mail.gmail.com>
In-Reply-To: <CAFqH_52W6qaG665rikgo5rkiYfo5Z_xX9RycHpA1rG_+yEm_xg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 1 Oct 2021 23:52:45 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8gXd_XtePjuOfheY6A6QuPJiYsXhyxt70R3MZP2juDZw@mail.gmail.com>
Message-ID: <CAAOTY_8gXd_XtePjuOfheY6A6QuPJiYsXhyxt70R3MZP2juDZw@mail.gmail.com>
Subject: Re: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
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

Hi, Enric:

Enric Balletbo Serra <eballetbo@gmail.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:48=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Chun-Kuang,
>
> Missatge de Chun-Kuang Hu <chunkuang.hu@kernel.org> del dia dj., 30 de
> set. 2021 a les 15:11:
> >
> > Hi, Enric:
> >
> > Enric Balletbo Serra <eballetbo@gmail.com> =E6=96=BC 2021=E5=B9=B49=E6=
=9C=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:12=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > >
> > > Hi Jason,
> > >
> > >
> > > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 30
> > > de set. 2021 a les 4:47:
> > > >
> > > > Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
> > > > crash at using pkt->cl->chan in cmdq_pkt_finalize.
> > > >
> > > > So add struct cmdq_client and let mtk_drm_crtc instance define
> > > > cmdq_client as:
> > > >
> > > > struct mtk_drm_crtc {
> > > >         /* client instance data */
> > > >         struct cmdq_client cmdq_client;
> > > > };
> > > >
> > > > and in rx_callback function can use pkt->cl to get
> > > > struct cmdq_client.
> > > >
> > > > Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
> > >
> > > Looking at this patchset looks like you're fixing the above commit by
> > > reintroducing the 'struct cmdq_client' again, which makes the above
> > > commit as a non-sense commit. That's confusing and not clear. I'm
> > > wondering if it wouldn't be more clear if you can just revert that
> > > patch. Then if there are more changes that need to be done do it with
> > > a follow up patch and really explain why these changes are needed.
> >
> > The patch f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
> > does two things. One is to remove struct cmdq_client, another one is
> > to embed cmdq_cl
>
> Then it should have been two patches, one thing for patch really
> helps, specially when something breaks and you try to bisect it.
>
> > in mtk_drm_crtc (This means the pointer of cmdq_cl could be used to
> > find the pointer of mtk_drm_crtc). The correct way to fix that patch
> > is to remove the access to cmdq_client in cmdq_pkt_finalize(), but
> > that would be a long term process. The simple way is to revert that
> > patch, but the other patches depend on embedding cmdq_cl in
> > mtk_drm_crtc. So this patch just revert the removing of struct
> > cmdq_client but keep embedding cmdq_cl in mtk_drm_crtc.
> >
>
> Yes, I know and I suffered that when bisecting and I ended to revert
> the full series in my local tree,  although I figured out that the
> problem was this specific patch.
>
> The following series landed during -rc1 cycle and break the Acer Chromebo=
ok R13
>
>  9efb16c2fdd6 ("drm/mediatek: Clear pending flag when cmdq packet is done=
")
>  bc9241be73d9 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
>  8cdcb3653424 ("drm/mediatek: Detect CMDQ execution timeout")
>  f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
>  c1ec54b7b5af ("drm/mediatek: Use mailbox rx_callback instead of cmdq_tas=
k_cb")
>
> Apart from that it was a pain bisecting and introduced different
> behaviours between patches, all the above commits have a follow-up
> patch (see [1] and [2]) as a fix for the landed series. That makes me
> think that were no stable enough. As we're in the rc, and as you said
> this is not the correct way to fix it, and the landed patches seems
> more a cleanup that really solving a real problem I'd consider to just
> revert the full series and resubmit again for next release with these
> fixes squashed. IMO that will also help to no miss anything when
> someone would backport all this to the stable versions and understand
> better the history.
>
> Just my 5 cents. In any case, I can confirm that applying the full
> series solves the current problems that I have with my Acer Chromebook
> R13.

OK, that series depend on an WARN_ON fixes in mailbox driver, and need
a better solution in cmdq helper, so let's revert that series first.
Would you like to send the revert patches? Or I send the revert
patches and let you test?

Regards,
Chun-Kuang.

>
> Thanks,
>   Enric
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D55=
5383
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D55=
4767
>
>
>
> > Regards,
> > Chun-Kuang.
> >
> > >
> > > Thanks,
> > >   Enric
> > >
> > >
> > > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++--------=
----
> > > >  1 file changed, 38 insertions(+), 35 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/=
drm/mediatek/mtk_drm_crtc.c
> > > > index 5f81489fc60c..411d99fcbb8f 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > > > @@ -52,8 +52,7 @@ struct mtk_drm_crtc {
> > > >         bool                            pending_async_planes;
> > > >
> > > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > > -       struct mbox_client              cmdq_cl;
> > > > -       struct mbox_chan                *cmdq_chan;
> > > > +       struct cmdq_client              cmdq_client;
> > > >         struct cmdq_pkt                 cmdq_handle;
> > > >         u32                             cmdq_event;
> > > >         u32                             cmdq_vblank_cnt;
> > > > @@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane=
(struct drm_crtc *crtc,
> > > >  }
> > > >
> > > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > > -static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct =
cmdq_pkt *pkt,
> > > > -                                   size_t size)
> > > > +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, str=
uct cmdq_pkt *pkt,
> > > > +                                  size_t size)
> > > >  {
> > > >         struct device *dev;
> > > >         dma_addr_t dma_addr;
> > > > @@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_=
chan *chan, struct cmdq_pkt *pkt,
> > > >                 return -ENOMEM;
> > > >         }
> > > >         pkt->buf_size =3D size;
> > > > +       pkt->cl =3D (void *)client;
> > > >
> > > > -       dev =3D chan->mbox->dev;
> > > > +       dev =3D client->chan->mbox->dev;
> > > >         dma_addr =3D dma_map_single(dev, pkt->va_base, pkt->buf_siz=
e,
> > > >                                   DMA_TO_DEVICE);
> > > >         if (dma_mapping_error(dev, dma_addr)) {
> > > > @@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox=
_chan *chan, struct cmdq_pkt *pkt,
> > > >         return 0;
> > > >  }
> > > >
> > > > -static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struc=
t cmdq_pkt *pkt)
> > > > +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> > > >  {
> > > > -       dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_si=
ze,
> > > > +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->c=
l;
> > > > +
> > > > +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt=
->buf_size,
> > > >                          DMA_TO_DEVICE);
> > > >         kfree(pkt->va_base);
> > > >         kfree(pkt);
> > > > @@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbo=
x_chan *chan, struct cmdq_pkt *pk
> > > >
> > > >  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
> > > >  {
> > > > -       struct mtk_drm_crtc *mtk_crtc =3D container_of(cl, struct m=
tk_drm_crtc, cmdq_cl);
> > > >         struct cmdq_cb_data *data =3D mssg;
> > > > +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmd=
q_client, client);
> > > > +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, str=
uct mtk_drm_crtc, cmdq_client);
> > > >         struct mtk_crtc_state *state;
> > > >         unsigned int i;
> > > >
> > > > @@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl,=
 void *mssg)
> > > >         }
> > > >
> > > >         mtk_crtc->cmdq_vblank_cnt =3D 0;
> > > > -       mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> > > > +       mtk_drm_cmdq_pkt_destroy(data->pkt);
> > > >  }
> > > >  #endif
> > > >
> > > > @@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct=
 mtk_drm_crtc *mtk_crtc,
> > > >                 mtk_mutex_release(mtk_crtc->mutex);
> > > >         }
> > > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > > -       if (mtk_crtc->cmdq_chan) {
> > > > -               mbox_flush(mtk_crtc->cmdq_chan, 2000);
> > > > +       if (mtk_crtc->cmdq_client.chan) {
> > > > +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
> > > >                 cmdq_handle->cmd_buf_size =3D 0;
> > > >                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_ev=
ent);
> > > >                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, fal=
se);
> > > >                 mtk_crtc_ddp_config(crtc, cmdq_handle);
> > > >                 cmdq_pkt_finalize(cmdq_handle);
> > > > -               dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbo=
x->dev,
> > > > -                                           cmdq_handle->pa_base,
> > > > -                                           cmdq_handle->cmd_buf_si=
ze,
> > > > -                                           DMA_TO_DEVICE);
> > > > +               dma_sync_single_for_device(mtk_crtc->cmdq_client.ch=
an->mbox->dev,
> > > > +                                          cmdq_handle->pa_base,
> > > > +                                          cmdq_handle->cmd_buf_siz=
e,
> > > > +                                          DMA_TO_DEVICE);
> > > >                 /*
> > > >                  * CMDQ command should execute in next vblank,
> > > >                  * If it fail to execute in next 2 vblank, timeout =
happen.
> > > >                  */
> > > >                 mtk_crtc->cmdq_vblank_cnt =3D 2;
> > > > -               mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle)=
;
> > > > -               mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
> > > > +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_=
handle);
> > > > +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> > > >         }
> > > >  #endif
> > > >         mtk_crtc->config_updating =3D false;
> > > > @@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
> > > >         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
> > > >
> > > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > > -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
> > > > +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.=
chan)
> > > >                 mtk_crtc_ddp_config(crtc, NULL);
> > > >         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_=
vblank_cnt =3D=3D 0)
> > > >                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout=
!\n",
> > > > @@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *dr=
m_dev,
> > > >         mutex_init(&mtk_crtc->hw_lock);
> > > >
> > > >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > > > -       mtk_crtc->cmdq_cl.dev =3D mtk_crtc->mmsys_dev;
> > > > -       mtk_crtc->cmdq_cl.tx_block =3D false;
> > > > -       mtk_crtc->cmdq_cl.knows_txdone =3D true;
> > > > -       mtk_crtc->cmdq_cl.rx_callback =3D ddp_cmdq_cb;
> > > > -       mtk_crtc->cmdq_chan =3D
> > > > -                       mbox_request_channel(&mtk_crtc->cmdq_cl,
> > > > -                                             drm_crtc_index(&mtk_c=
rtc->base));
> > > > -       if (IS_ERR(mtk_crtc->cmdq_chan)) {
> > > > +       mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
> > > > +       mtk_crtc->cmdq_client.client.tx_block =3D false;
> > > > +       mtk_crtc->cmdq_client.client.knows_txdone =3D true;
> > > > +       mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
> > > > +       mtk_crtc->cmdq_client.chan =3D
> > > > +                       mbox_request_channel(&mtk_crtc->cmdq_client=
.client,
> > > > +                                            drm_crtc_index(&mtk_cr=
tc->base));
> > > > +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
> > > >                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox =
client, writing register by CPU now\n",
> > > >                         drm_crtc_index(&mtk_crtc->base));
> > > > -               mtk_crtc->cmdq_chan =3D NULL;
> > > > +               mtk_crtc->cmdq_client.chan =3D NULL;
> > > >         }
> > > >
> > > > -       if (mtk_crtc->cmdq_chan) {
> > > > +       if (mtk_crtc->cmdq_client.chan) {
> > > >                 ret =3D of_property_read_u32_index(priv->mutex_node=
,
> > > >                                                  "mediatek,gce-even=
ts",
> > > >                                                  drm_crtc_index(&mt=
k_crtc->base),
> > > > @@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *dr=
m_dev,
> > > >                 if (ret) {
> > > >                         dev_dbg(dev, "mtk_crtc %d failed to get med=
iatek,gce-events property\n",
> > > >                                 drm_crtc_index(&mtk_crtc->base));
> > > > -                       mbox_free_channel(mtk_crtc->cmdq_chan);
> > > > -                       mtk_crtc->cmdq_chan =3D NULL;
> > > > +                       mbox_free_channel(mtk_crtc->cmdq_client.cha=
n);
> > > > +                       mtk_crtc->cmdq_client.chan =3D NULL;
> > > >                 } else {
> > > > -                       ret =3D mtk_drm_cmdq_pkt_create(mtk_crtc->c=
mdq_chan,
> > > > -                                                      &mtk_crtc->c=
mdq_handle,
> > > > -                                                      PAGE_SIZE);
> > > > +                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->=
cmdq_client,
> > > > +                                                     &mtk_crtc->cm=
dq_handle,
> > > > +                                                     PAGE_SIZE);
> > > >                         if (ret) {
> > > >                                 dev_dbg(dev, "mtk_crtc %d failed to=
 create cmdq packet\n",
> > > >                                         drm_crtc_index(&mtk_crtc->b=
ase));
> > > > -                               mbox_free_channel(mtk_crtc->cmdq_ch=
an);
> > > > -                               mtk_crtc->cmdq_chan =3D NULL;
> > > > +                               mbox_free_channel(mtk_crtc->cmdq_cl=
ient.chan);
> > > > +                               mtk_crtc->cmdq_client.chan =3D NULL=
;
> > > >                         }
> > > >                 }
> > > >         }
> > > > --
> > > > 2.18.0
> > > >
