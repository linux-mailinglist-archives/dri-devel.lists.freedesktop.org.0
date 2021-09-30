Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22541DABF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 15:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249046EB86;
	Thu, 30 Sep 2021 13:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5096EB86
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:11:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F31076187A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633007475;
 bh=IPmaOclIoeWRYsf5R3sAnuGbfHT7SkzOGvJojBMY7Mg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IA3LmBzjoJioOLIhjb24zJA8UHxuN7BBoQoBblKfOq5pnGPVGfwKupJjYGFxoPWU5
 NBReojWLhUXsjqIdym7CeCUc5PBSOZYz99kMBOUs2TQDn1NHcVC1wxvyJpYRXy+ecx
 IVdToCIDxOvgRTehz1wpW3UZ5aQVQlB3FRNcCB02bgsp89oiBz82uBPdfsfSsSJHhT
 KHO+wm20VPp02OpYfVTqw6jy8yefOCLNtVQ+693K17bua5AlI1wtIqrqJgt93e0qP0
 Xb//UV5w3l+MPbOfJb2JVwK4FHJy4Qe/92qbtRytvv2frisYEt0aK1gwPRawQOiuOJ
 HeA6EZU81jciA==
Received: by mail-ed1-f53.google.com with SMTP id r18so21778859edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:11:14 -0700 (PDT)
X-Gm-Message-State: AOAM532aLuHjWkI/lv7aeXBtoMJIidChvrbenQZK0HgdSlEgDM0SEVKN
 xHjWFPxCtuvhECbwn/qcytwimlbIkhWBiA1I3w==
X-Google-Smtp-Source: ABdhPJyBLu5cCwIDZ89ApNeKQU8a74FbPUJTL2QbRzeJ3b6AakIQWNpnxzwBoCNj0EC1GofBryeZzOUZ67VTWdVNNmc=
X-Received: by 2002:a05:6402:40c5:: with SMTP id
 z5mr3938186edb.272.1633007473094; 
 Thu, 30 Sep 2021 06:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210930024704.6966-1-jason-jh.lin@mediatek.com>
 <20210930024704.6966-2-jason-jh.lin@mediatek.com>
 <CAFqH_52w787DGbVE0WqMjA2y8Psw6XDMp8AFhj=7UMyCA-uv+g@mail.gmail.com>
In-Reply-To: <CAFqH_52w787DGbVE0WqMjA2y8Psw6XDMp8AFhj=7UMyCA-uv+g@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Sep 2021 21:11:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-bU-zuNE6-omHV=54R5UDOH2KQ0iD_ZcLc-VDeA65vTA@mail.gmail.com>
Message-ID: <CAAOTY_-bU-zuNE6-omHV=54R5UDOH2KQ0iD_ZcLc-VDeA65vTA@mail.gmail.com>
Subject: Re: [v2 PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
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
=8830=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:12=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Jason,
>
>
> Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 30
> de set. 2021 a les 4:47:
> >
> > Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
> > crash at using pkt->cl->chan in cmdq_pkt_finalize.
> >
> > So add struct cmdq_client and let mtk_drm_crtc instance define
> > cmdq_client as:
> >
> > struct mtk_drm_crtc {
> >         /* client instance data */
> >         struct cmdq_client cmdq_client;
> > };
> >
> > and in rx_callback function can use pkt->cl to get
> > struct cmdq_client.
> >
> > Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
>
> Looking at this patchset looks like you're fixing the above commit by
> reintroducing the 'struct cmdq_client' again, which makes the above
> commit as a non-sense commit. That's confusing and not clear. I'm
> wondering if it wouldn't be more clear if you can just revert that
> patch. Then if there are more changes that need to be done do it with
> a follow up patch and really explain why these changes are needed.

The patch f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
does two things. One is to remove struct cmdq_client, another one is
to embed cmdq_cl
in mtk_drm_crtc (This means the pointer of cmdq_cl could be used to
find the pointer of mtk_drm_crtc). The correct way to fix that patch
is to remove the access to cmdq_client in cmdq_pkt_finalize(), but
that would be a long term process. The simple way is to revert that
patch, but the other patches depend on embedding cmdq_cl in
mtk_drm_crtc. So this patch just revert the removing of struct
cmdq_client but keep embedding cmdq_cl in mtk_drm_crtc.

Regards,
Chun-Kuang.

>
> Thanks,
>   Enric
>
>
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++------------
> >  1 file changed, 38 insertions(+), 35 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/=
mediatek/mtk_drm_crtc.c
> > index 5f81489fc60c..411d99fcbb8f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -52,8 +52,7 @@ struct mtk_drm_crtc {
> >         bool                            pending_async_planes;
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > -       struct mbox_client              cmdq_cl;
> > -       struct mbox_chan                *cmdq_chan;
> > +       struct cmdq_client              cmdq_client;
> >         struct cmdq_pkt                 cmdq_handle;
> >         u32                             cmdq_event;
> >         u32                             cmdq_vblank_cnt;
> > @@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(str=
uct drm_crtc *crtc,
> >  }
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > -static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq=
_pkt *pkt,
> > -                                   size_t size)
> > +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct =
cmdq_pkt *pkt,
> > +                                  size_t size)
> >  {
> >         struct device *dev;
> >         dma_addr_t dma_addr;
> > @@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan=
 *chan, struct cmdq_pkt *pkt,
> >                 return -ENOMEM;
> >         }
> >         pkt->buf_size =3D size;
> > +       pkt->cl =3D (void *)client;
> >
> > -       dev =3D chan->mbox->dev;
> > +       dev =3D client->chan->mbox->dev;
> >         dma_addr =3D dma_map_single(dev, pkt->va_base, pkt->buf_size,
> >                                   DMA_TO_DEVICE);
> >         if (dma_mapping_error(dev, dma_addr)) {
> > @@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_cha=
n *chan, struct cmdq_pkt *pkt,
> >         return 0;
> >  }
> >
> > -static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cm=
dq_pkt *pkt)
> > +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> >  {
> > -       dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> > +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> > +
> > +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->bu=
f_size,
> >                          DMA_TO_DEVICE);
> >         kfree(pkt->va_base);
> >         kfree(pkt);
> > @@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_ch=
an *chan, struct cmdq_pkt *pk
> >
> >  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
> >  {
> > -       struct mtk_drm_crtc *mtk_crtc =3D container_of(cl, struct mtk_d=
rm_crtc, cmdq_cl);
> >         struct cmdq_cb_data *data =3D mssg;
> > +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_cl=
ient, client);
> > +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struct =
mtk_drm_crtc, cmdq_client);
> >         struct mtk_crtc_state *state;
> >         unsigned int i;
> >
> > @@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, voi=
d *mssg)
> >         }
> >
> >         mtk_crtc->cmdq_vblank_cnt =3D 0;
> > -       mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> > +       mtk_drm_cmdq_pkt_destroy(data->pkt);
> >  }
> >  #endif
> >
> > @@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct mtk=
_drm_crtc *mtk_crtc,
> >                 mtk_mutex_release(mtk_crtc->mutex);
> >         }
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > -       if (mtk_crtc->cmdq_chan) {
> > -               mbox_flush(mtk_crtc->cmdq_chan, 2000);
> > +       if (mtk_crtc->cmdq_client.chan) {
> > +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
> >                 cmdq_handle->cmd_buf_size =3D 0;
> >                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event)=
;
> >                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
> >                 mtk_crtc_ddp_config(crtc, cmdq_handle);
> >                 cmdq_pkt_finalize(cmdq_handle);
> > -               dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->d=
ev,
> > -                                           cmdq_handle->pa_base,
> > -                                           cmdq_handle->cmd_buf_size,
> > -                                           DMA_TO_DEVICE);
> > +               dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->=
mbox->dev,
> > +                                          cmdq_handle->pa_base,
> > +                                          cmdq_handle->cmd_buf_size,
> > +                                          DMA_TO_DEVICE);
> >                 /*
> >                  * CMDQ command should execute in next vblank,
> >                  * If it fail to execute in next 2 vblank, timeout happ=
en.
> >                  */
> >                 mtk_crtc->cmdq_vblank_cnt =3D 2;
> > -               mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
> > -               mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
> > +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_hand=
le);
> > +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
> >         }
> >  #endif
> >         mtk_crtc->config_updating =3D false;
> > @@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
> >         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
> > +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan=
)
> >                 mtk_crtc_ddp_config(crtc, NULL);
> >         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vbla=
nk_cnt =3D=3D 0)
> >                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n"=
,
> > @@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_de=
v,
> >         mutex_init(&mtk_crtc->hw_lock);
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > -       mtk_crtc->cmdq_cl.dev =3D mtk_crtc->mmsys_dev;
> > -       mtk_crtc->cmdq_cl.tx_block =3D false;
> > -       mtk_crtc->cmdq_cl.knows_txdone =3D true;
> > -       mtk_crtc->cmdq_cl.rx_callback =3D ddp_cmdq_cb;
> > -       mtk_crtc->cmdq_chan =3D
> > -                       mbox_request_channel(&mtk_crtc->cmdq_cl,
> > -                                             drm_crtc_index(&mtk_crtc-=
>base));
> > -       if (IS_ERR(mtk_crtc->cmdq_chan)) {
> > +       mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
> > +       mtk_crtc->cmdq_client.client.tx_block =3D false;
> > +       mtk_crtc->cmdq_client.client.knows_txdone =3D true;
> > +       mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
> > +       mtk_crtc->cmdq_client.chan =3D
> > +                       mbox_request_channel(&mtk_crtc->cmdq_client.cli=
ent,
> > +                                            drm_crtc_index(&mtk_crtc->=
base));
> > +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
> >                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox clie=
nt, writing register by CPU now\n",
> >                         drm_crtc_index(&mtk_crtc->base));
> > -               mtk_crtc->cmdq_chan =3D NULL;
> > +               mtk_crtc->cmdq_client.chan =3D NULL;
> >         }
> >
> > -       if (mtk_crtc->cmdq_chan) {
> > +       if (mtk_crtc->cmdq_client.chan) {
> >                 ret =3D of_property_read_u32_index(priv->mutex_node,
> >                                                  "mediatek,gce-events",
> >                                                  drm_crtc_index(&mtk_cr=
tc->base),
> > @@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_de=
v,
> >                 if (ret) {
> >                         dev_dbg(dev, "mtk_crtc %d failed to get mediate=
k,gce-events property\n",
> >                                 drm_crtc_index(&mtk_crtc->base));
> > -                       mbox_free_channel(mtk_crtc->cmdq_chan);
> > -                       mtk_crtc->cmdq_chan =3D NULL;
> > +                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> > +                       mtk_crtc->cmdq_client.chan =3D NULL;
> >                 } else {
> > -                       ret =3D mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_=
chan,
> > -                                                      &mtk_crtc->cmdq_=
handle,
> > -                                                      PAGE_SIZE);
> > +                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq=
_client,
> > +                                                     &mtk_crtc->cmdq_h=
andle,
> > +                                                     PAGE_SIZE);
> >                         if (ret) {
> >                                 dev_dbg(dev, "mtk_crtc %d failed to cre=
ate cmdq packet\n",
> >                                         drm_crtc_index(&mtk_crtc->base)=
);
> > -                               mbox_free_channel(mtk_crtc->cmdq_chan);
> > -                               mtk_crtc->cmdq_chan =3D NULL;
> > +                               mbox_free_channel(mtk_crtc->cmdq_client=
.chan);
> > +                               mtk_crtc->cmdq_client.chan =3D NULL;
> >                         }
> >                 }
> >         }
> > --
> > 2.18.0
> >
