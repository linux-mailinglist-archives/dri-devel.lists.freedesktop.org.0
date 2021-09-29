Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6735341C769
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059966EAA5;
	Wed, 29 Sep 2021 14:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439FF6EAA5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:54:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0731E6140F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927265;
 bh=VvAbMG+fnKitKsMFsoHEqUuGjgvoQuGWlE5pTALcwRU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a1gaUb6ze+1WM3/GwU4CE6bXvxoyhbdhNewX/rbyUW+qrBaCZxN6/fDBlK+q544t8
 +sXJrLCDQQ08jLbVMsmevcsqyK5tK4wJCuzFvUyhi9DBrvmwJhsbeiqBhDjlEjTKGj
 OmZsxYwHAUN8sCLkCnuOmcDJuzPUQG2Iv/9YFPRnMJBsxgZpltmr1YlHP8BYG0CtaQ
 rkEm84Gbqd7J2tJpX94Rgscp9q71vxQB1vCnYTacvcvMIdKq4/czsKZwQ+cbY9nyzC
 YMAAg4Ha4CcT3OpHX+FvnEGBE//5GS5Xj7FWgGfAiZP9IDtHrQdYKqp+PPWEWwjhYa
 VfVXzmLk8Pxew==
Received: by mail-ed1-f43.google.com with SMTP id dn26so9655244edb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:54:24 -0700 (PDT)
X-Gm-Message-State: AOAM533tZHHM/W8iixGGW1W5+iQSt51iNrkTVU2RKGgSCAWHpVJmUaQN
 XsrhxD6lWDmSy2Nc6x65lX5RB5eyBIG6oUGUBw==
X-Google-Smtp-Source: ABdhPJxUSpbJLxQv4xE6xnQIWtVbavNuyeUJ/gUHQHcBU+8qpTIcmGcbrpQ1Dk83xyFI/d19Nw9/AJPtJhmghkTX2hU=
X-Received: by 2002:a17:907:3e21:: with SMTP id
 hp33mr121802ejc.205.1632927200231; 
 Wed, 29 Sep 2021 07:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210929070235.4290-1-jason-jh.lin@mediatek.com>
 <20210929070235.4290-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20210929070235.4290-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:53:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9uEACFCT6k9FaDqu4WN+e2CiJqWXOb20sWa1jXbCfc_A@mail.gmail.com>
Message-ID: <CAAOTY_9uEACFCT6k9FaDqu4WN+e2CiJqWXOb20sWa1jXbCfc_A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: Fix pkt buf alloc once but free many
 times
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
> Because mtk_drm_crt_cmdq_pkt_create is called once
> in mtk_drm_crtc_create, the pkt should not be destroy
> at ddp_cmdq_cb.
>
> So move mtk_drm_crtc_pkt_destroy to mtk_drm_crtc_destroy.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Fixes: bc9241be73d9 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index e98871a8c961..06342df2a0be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -108,12 +108,30 @@ static void mtk_drm_finish_page_flip(struct mtk_drm=
_crtc *mtk_crtc)
>         }
>  }
>
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> +{
> +       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> +
> +       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_=
size,
> +                        DMA_TO_DEVICE);
> +       kfree(pkt->va_base);
> +       kfree(pkt);
> +}
> +#endif
> +
>  static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
>  {
>         struct mtk_drm_crtc *mtk_crtc =3D to_mtk_crtc(crtc);
>
>         mtk_mutex_put(mtk_crtc->mutex);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
>
> +       if (mtk_crtc->cmdq_client.chan)
> +               mbox_free_channel(mtk_crtc->cmdq_client.chan);
> +                                 mtk_crtc->cmdq_client.chan =3D NULL;
> +#endif
>         drm_crtc_cleanup(crtc);
>  }
>
> @@ -255,16 +273,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_clien=
t *client, struct cmdq_pkt *
>         return 0;
>  }
>
> -static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> -{
> -       struct cmdq_client *client =3D (struct cmdq_client *)pkt->cl;
> -
> -       dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_=
size,
> -                        DMA_TO_DEVICE);
> -       kfree(pkt->va_base);
> -       kfree(pkt);
> -}
> -
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
>         struct cmdq_cb_data *data =3D mssg;
> @@ -302,7 +310,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void =
*mssg)
>         }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
> -       mtk_drm_cmdq_pkt_destroy(pkt);
>  }
>  #endif
>
> --
> 2.18.0
>
