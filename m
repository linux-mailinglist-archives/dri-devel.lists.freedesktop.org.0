Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB341C74F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0486EA84;
	Wed, 29 Sep 2021 14:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343ED6EA84
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:52:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0923261452
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927124;
 bh=GfYq1vXltFRd+qnISduHB1I/tMZaDw2HQ2tpkKtGs6U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PiKslU+MvuDh58Sfw7WNhxNgf/prYAJ2OCS+i4xEJZSzXsCHXHfdZn7KsfAUh0Z2c
 RCrcoKNalCS2uCFcgBrZg/Pc6RPjhm+D2ZHkbDAziEKzsksTw7zwqYK9kHjwpa/mrR
 PAgQM0Th7J6W9E0BGlcuQBLmyVEH725XJe1VLCKnSclyLDKakv1DbAWFq/2rJi9+sS
 a4dXyPfLNYtDqUbldHnm0l9L7JDWcDo6Xv/ZF6B3GZ6Q4bE+DjjmwgGbvBggPX86t2
 Gv2Wsi0ipjMm1B3rwfUxSmPFgY8eDuYKBJ4j0LRWsoAF7BzfuY8wIGfxpu5/QAm/ho
 H5ykx28fMCiag==
Received: by mail-ed1-f42.google.com with SMTP id g7so9687179edv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM530x5ISgs5bKSpXRD93NN/nNw9MP/Vgxc1sKBZ4T8kqlJoBOr8TX
 m/aVjRUAVVPLG8ZkZHIvZGDjVV8eATDh0gitlA==
X-Google-Smtp-Source: ABdhPJyX/LV/fPaaoZ14xVXB3Pz2tSXauLNutH39v7zFHCmxP/zdbZOD+G/djSIAaJIp0C3v6TYQ9Lh6EYxED5gzT/I=
X-Received: by 2002:a17:906:7ac4:: with SMTP id
 k4mr146993ejo.430.1632927052199; 
 Wed, 29 Sep 2021 07:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070235.4290-1-jason-jh.lin@mediatek.com>
 <20210929070235.4290-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070235.4290-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:50:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ncB-sn+HspqkY-LrCX_J51KBrvW+QW2_zhmGVwrOe-A@mail.gmail.com>
Message-ID: <CAAOTY__ncB-sn+HspqkY-LrCX_J51KBrvW+QW2_zhmGVwrOe-A@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: Fix crash at using pkt->cl->chan in
 cmdq_pkt_finalize
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 fshao@chromium.org, 
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:02=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Because mtk_drm_crtc_create_pkt didn't assign pkt->cl, it will
> crash at using pkt->cl->chan in cmdq_pkt_finalize.
>
> So add struct cmdq_client and let mtk_drm_crtc instance define
> cmdq_client as:
>
> struct mtk_drm_crtc {
>         /* client instance data */
>         struct cmdq_client cmdq_client;
> };
>
> and in rx_callback function can use pkt->cl to get
> struct cmdq_client.
>
> Fixes: f4be17cd5b14 ("drm/mediatek: Remove struct cmdq_client")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 73 +++++++++++++------------
>  1 file changed, 38 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 5f81489fc60c..e98871a8c961 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -52,8 +52,7 @@ struct mtk_drm_crtc {
>         bool                            pending_async_planes;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       struct mbox_client              cmdq_cl;
> -       struct mbox_chan                *cmdq_chan;
> +       struct cmdq_client              cmdq_client;
>         struct cmdq_pkt                 cmdq_handle;
>         u32                             cmdq_event;
>         u32                             cmdq_vblank_cnt;
> @@ -227,8 +226,8 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struc=
t drm_crtc *crtc,
>  }
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -static int mtk_drm_cmdq_pkt_create(struct mbox_chan *chan, struct cmdq_p=
kt *pkt,
> -                                   size_t size)
> +static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cm=
dq_pkt *pkt,
> +                                  size_t size)
>  {
>         struct device *dev;
>         dma_addr_t dma_addr;
> @@ -239,8 +238,9 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan *=
chan, struct cmdq_pkt *pkt,
>                 return -ENOMEM;
>         }
>         pkt->buf_size =3D size;
> +       pkt->cl =3D (void *)client;
>
> -       dev =3D chan->mbox->dev;
> +       dev =3D client->chan->mbox->dev;
>         dma_addr =3D dma_map_single(dev, pkt->va_base, pkt->buf_size,
>                                   DMA_TO_DEVICE);
>         if (dma_mapping_error(dev, dma_addr)) {
> @@ -255,9 +255,11 @@ static int mtk_drm_cmdq_pkt_create(struct mbox_chan =
*chan, struct cmdq_pkt *pkt,
>         return 0;
>  }
>
> -static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan *chan, struct cmdq=
_pkt *pkt)
> +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>  {
> -       dma_unmap_single(chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> +
> +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_=
size,
>                          DMA_TO_DEVICE);
>         kfree(pkt->va_base);
>         kfree(pkt);
> @@ -265,8 +267,9 @@ static void mtk_drm_cmdq_pkt_destroy(struct mbox_chan=
 *chan, struct cmdq_pkt *pk
>
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> -       struct mtk_drm_crtc *mtk_crtc =3D container_of(cl, struct mtk_drm=
_crtc, cmdq_cl);
>         struct cmdq_cb_data *data =3D mssg;
> +       struct cmdq_pkt *pkt =3D data->pkt;
> +       struct mtk_drm_crtc *mtk_crtc =3D container_of(pkt->cl, struct mt=
k_drm_crtc, cmdq_client);

I think you should use cl to find struct cmdq_client, and then use
struct cmdq_clint to find struct mtk_drm_crtc.
In the next patch, you could remove the local variable pkt.

>         struct mtk_crtc_state *state;
>         unsigned int i;
>
> @@ -299,7 +302,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>         }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
> -       mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> +       mtk_drm_cmdq_pkt_destroy(pkt);

Maybe mtk_drm_cmdq_pkt_destroy(data->pkt); , so you need not the local
variable pkt.

Regards,
Chun-Kuang.



>  }
>  #endif
>
> @@ -550,24 +553,24 @@ static void mtk_drm_crtc_update_config(struct mtk_d=
rm_crtc *mtk_crtc,
>                 mtk_mutex_release(mtk_crtc->mutex);
>         }
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (mtk_crtc->cmdq_chan) {
> -               mbox_flush(mtk_crtc->cmdq_chan, 2000);
> +       if (mtk_crtc->cmdq_client.chan) {
> +               mbox_flush(mtk_crtc->cmdq_client.chan, 2000);
>                 cmdq_handle->cmd_buf_size =3D 0;
>                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
>                 cmdq_pkt_finalize(cmdq_handle);
> -               dma_sync_single_for_device(mtk_crtc->cmdq_chan->mbox->dev=
,
> -                                           cmdq_handle->pa_base,
> -                                           cmdq_handle->cmd_buf_size,
> -                                           DMA_TO_DEVICE);
> +               dma_sync_single_for_device(mtk_crtc->cmdq_client.chan->mb=
ox->dev,
> +                                          cmdq_handle->pa_base,
> +                                          cmdq_handle->cmd_buf_size,
> +                                          DMA_TO_DEVICE);
>                 /*
>                  * CMDQ command should execute in next vblank,
>                  * If it fail to execute in next 2 vblank, timeout happen=
.
>                  */
>                 mtk_crtc->cmdq_vblank_cnt =3D 2;
> -               mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
> -               mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
> +               mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
> +               mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
>  #endif
>         mtk_crtc->config_updating =3D false;
> @@ -581,7 +584,7 @@ static void mtk_crtc_ddp_irq(void *data)
>         struct mtk_drm_private *priv =3D crtc->dev->dev_private;
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
> +       if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
>                 mtk_crtc_ddp_config(crtc, NULL);
>         else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank=
_cnt =3D=3D 0)
>                 DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> @@ -924,20 +927,20 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         mutex_init(&mtk_crtc->hw_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -       mtk_crtc->cmdq_cl.dev =3D mtk_crtc->mmsys_dev;
> -       mtk_crtc->cmdq_cl.tx_block =3D false;
> -       mtk_crtc->cmdq_cl.knows_txdone =3D true;
> -       mtk_crtc->cmdq_cl.rx_callback =3D ddp_cmdq_cb;
> -       mtk_crtc->cmdq_chan =3D
> -                       mbox_request_channel(&mtk_crtc->cmdq_cl,
> -                                             drm_crtc_index(&mtk_crtc->b=
ase));
> -       if (IS_ERR(mtk_crtc->cmdq_chan)) {
> +       mtk_crtc->cmdq_client.client.dev =3D mtk_crtc->mmsys_dev;
> +       mtk_crtc->cmdq_client.client.tx_block =3D false;
> +       mtk_crtc->cmdq_client.client.knows_txdone =3D true;
> +       mtk_crtc->cmdq_client.client.rx_callback =3D ddp_cmdq_cb;
> +       mtk_crtc->cmdq_client.chan =3D
> +                       mbox_request_channel(&mtk_crtc->cmdq_client.clien=
t,
> +                                            drm_crtc_index(&mtk_crtc->ba=
se));
> +       if (IS_ERR(mtk_crtc->cmdq_client.chan)) {
>                 dev_dbg(dev, "mtk_crtc %d failed to create mailbox client=
, writing register by CPU now\n",
>                         drm_crtc_index(&mtk_crtc->base));
> -               mtk_crtc->cmdq_chan =3D NULL;
> +               mtk_crtc->cmdq_client.chan =3D NULL;
>         }
>
> -       if (mtk_crtc->cmdq_chan) {
> +       if (mtk_crtc->cmdq_client.chan) {
>                 ret =3D of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
>                                                  drm_crtc_index(&mtk_crtc=
->base),
> @@ -945,17 +948,17 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>                 if (ret) {
>                         dev_dbg(dev, "mtk_crtc %d failed to get mediatek,=
gce-events property\n",
>                                 drm_crtc_index(&mtk_crtc->base));
> -                       mbox_free_channel(mtk_crtc->cmdq_chan);
> -                       mtk_crtc->cmdq_chan =3D NULL;
> +                       mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                       mtk_crtc->cmdq_client.chan =3D NULL;
>                 } else {
> -                       ret =3D mtk_drm_cmdq_pkt_create(mtk_crtc->cmdq_ch=
an,
> -                                                      &mtk_crtc->cmdq_ha=
ndle,
> -                                                      PAGE_SIZE);
> +                       ret =3D mtk_drm_cmdq_pkt_create(&mtk_crtc->cmdq_c=
lient,
> +                                                     &mtk_crtc->cmdq_han=
dle,
> +                                                     PAGE_SIZE);
>                         if (ret) {
>                                 dev_dbg(dev, "mtk_crtc %d failed to creat=
e cmdq packet\n",
>                                         drm_crtc_index(&mtk_crtc->base));
> -                               mbox_free_channel(mtk_crtc->cmdq_chan);
> -                               mtk_crtc->cmdq_chan =3D NULL;
> +                               mbox_free_channel(mtk_crtc->cmdq_client.c=
han);
> +                               mtk_crtc->cmdq_client.chan =3D NULL;
>                         }
>                 }
>         }
> --
> 2.18.0
>
