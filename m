Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F643B642
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9036E550;
	Tue, 26 Oct 2021 15:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BFE6E550
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:57:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 375C2603E9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635263879;
 bh=OB+yWz25S7H3KGVqOadlPy4oTErCjsdJuZ0ZVaPAy8k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JrywvMSadwF6SG26QZ/9xHya1dlEgaSM2GWFZ1zDrUwXqi+TfLQFz7ZD3jO0HDFR8
 zrbX8yatA0W3Sx2jvWtoGD1XAp8YNdyroQDoovLiw4Tg0TaQbfiOJBOx7C1JuTrqj7
 zlkN/LV6rm/hAvJxPdT6wrp/8OdbJBtMBzy9Gj3Tlmlg1bC8JZvFT2GubnQtyj2aOm
 0feLbYDflMfLgPNQEyyHGt+DQrTn4h75Z/NhKH9aBsEikomNRn6Mf+Ll90IE42PzpC
 FM+sdNKHPRhgIE4LZU4TJl4Tdhpe/bPRQZB4scYTTrd4RkGfmabOUzGtqddDgSjizJ
 xbEQNSrsicdnA==
Received: by mail-ed1-f42.google.com with SMTP id z20so2247864edi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:57:59 -0700 (PDT)
X-Gm-Message-State: AOAM5312BnXSOP6rA4ZuoJzylLbJKb4PRBc8NnUhGYJ2AEZQK9Oim3i7
 gP8PNfh1bY0AKETOAV8Bvv+vVB3g9nG+z43Hxg==
X-Google-Smtp-Source: ABdhPJybqDR3/pnAJXzhteBsi4mz3UfvtHoiBaXiMxgZ9m+2o1xf0216M+QZACOhTRWtaq3EIkWNHjKybj9XSRrnxzE=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr22780481edu.357.1635263708464; 
 Tue, 26 Oct 2021 08:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 26 Oct 2021 23:54:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY__8jL__0H=puB+WmMAO9MBiFpzh=6Aw8VLSJ6xNsSakuA@mail.gmail.com>
Message-ID: <CAAOTY__8jL__0H=puB+WmMAO9MBiFpzh=6Aw8VLSJ6xNsSakuA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/mediatek: Detect CMDQ execution timeout
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=88=
26=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:29=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> CMDQ is used to update display register in vblank period, so
> it should be execute in next 2 vblank. One vblank interrupt
> before send message (occasionally) and one vblank interrupt
> after cmdq done. If it fail to execute in next 3 vblank,
> tiemout happen.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index e23e3224ac67..dad1f85ee315 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -54,6 +54,7 @@ struct mtk_drm_crtc {
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         struct cmdq_client              cmdq_client;
>         u32                             cmdq_event;
> +       u32                             cmdq_vblank_cnt;
>  #endif
>
>         struct device                   *mmsys_dev;
> @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
>         struct cmdq_cb_data *data =3D mssg;
> +       struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_clie=
nt, client);
> +       struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struct mt=
k_drm_crtc, cmdq_client);
>
> +       mtk_crtc->cmdq_vblank_cnt =3D 0;
>         cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
> @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_dr=
m_crtc *mtk_crtc,
>                                            cmdq_handle->pa_base,
>                                            cmdq_handle->cmd_buf_size,
>                                            DMA_TO_DEVICE);
> +               /*
> +                * CMDQ command should execute in next 3 vblank.
> +                * One vblank interrupt before send message (occasionally=
)
> +                * and one vblank interrupt after cmdq done,
> +                * so it's timeout after 3 vblank interrupt.
> +                * If it fail to execute in next 3 vblank, timeout happen=
.
> +                */
> +               mtk_crtc->cmdq_vblank_cnt =3D 3;
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> +               mtk_crtc_ddp_config(crtc, NULL);
> +       else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank=
_cnt =3D=3D 0)
> +               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> +                         drm_crtc_index(&mtk_crtc->base));
>  #else
>         if (!priv->data->shadow_register)
> -#endif
>                 mtk_crtc_ddp_config(crtc, NULL);
> -
> +#endif
>         mtk_drm_finish_page_flip(mtk_crtc);
>  }
>
> --
> 2.18.0
>
