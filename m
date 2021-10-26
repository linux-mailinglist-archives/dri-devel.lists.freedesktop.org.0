Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3C43B699
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 18:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7C16E598;
	Tue, 26 Oct 2021 16:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBEE6E598
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:10:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81A0360527
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635264624;
 bh=R9XHfPiiMdHaMgonXhRNxe+si5OeI8KDpG4+6gMNnWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EsNqCYCSil0bxC5mXHF3/mu9yA2nKdyb3QR3DpiKRa+sdOytrhblE9T1s8a20r6NO
 4u0bL9q8e6OWWQm05hPdS9ureYsE7gUKjp4ZFsGyvF6LIeQSZ+bh12Htt9Ly72bz7s
 hU4YcezLAYrnw2qr9j0n9sUqj4XAS6R8KqHEHqRrpgugaBrVpELkNCIb7mq4fUj3ZI
 rKgYRjGeve4WbHBUWha5aF0NcIko/3VXeTgVTFqLp2Cn7um2jIYGW/gbZEV6Azq0+i
 LCxc00ySfu8D6keTdEHEUjUOyLOu9uEzV/0dVsI6yd6tY9Vk7JseI7Y51rMNn4YXGX
 6/yV7ZIKWu9pg==
Received: by mail-ed1-f48.google.com with SMTP id z20so2390919edi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 09:10:24 -0700 (PDT)
X-Gm-Message-State: AOAM5320RovdDr0z31rDqpem98VDaEHsu58bVMjHedyScMwwrORVY0T+
 qxc1vZRHmWoRjWYQSrwJoE1L2JAgkPyvdDnGpg==
X-Google-Smtp-Source: ABdhPJyFy2UYH5W8n5qxwQhKlt0rY0EVB0dXXDZyKeTXA7dBLlF7y1ifgfrW3G4thyWRnm7C7npA+36pHS87eytsgRk=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr31993724ejc.388.1635264489262; 
 Tue, 26 Oct 2021 09:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-6-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 27 Oct 2021 00:07:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Wz8+k+XyZaojzuGu3mkR2oidFh09eYarQA_63NFJ__g@mail.gmail.com>
Message-ID: <CAAOTY_8Wz8+k+XyZaojzuGu3mkR2oidFh09eYarQA_63NFJ__g@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/mediatek: Clear pending flag when cmdq packet
 is done
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
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> In cmdq mode, packet may be flushed before it is executed, so
> the pending flag should be cleared after cmdq packet is done.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 51 ++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 31f05efc1bc0..ea285795776f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -275,8 +275,42 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> +       struct cmdq_cb_data *data =3D mssg;
>         struct cmdq_client *cmdq_cl =3D container_of(cl, struct cmdq_clie=
nt, client);
>         struct mtk_drm_crtc *mtk_crtc =3D container_of(cmdq_cl, struct mt=
k_drm_crtc, cmdq_client);
> +       struct mtk_crtc_state *state;
> +       unsigned int i;
> +
> +       if (data->sta < 0)
> +               return;
> +
> +       state =3D to_mtk_crtc_state(mtk_crtc->base.state);
> +
> +       state->pending_config =3D false;
> +
> +       if (mtk_crtc->pending_planes) {
> +               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> +                       struct mtk_plane_state *plane_state;
> +
> +                       plane_state =3D to_mtk_plane_state(plane->state);
> +
> +                       plane_state->pending.config =3D false;
> +               }
> +               mtk_crtc->pending_planes =3D false;
> +       }
> +
> +       if (mtk_crtc->pending_async_planes) {
> +               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> +                       struct mtk_plane_state *plane_state;
> +
> +                       plane_state =3D to_mtk_plane_state(plane->state);
> +
> +                       plane_state->pending.async_config =3D false;
> +               }
> +               mtk_crtc->pending_async_planes =3D false;
> +       }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>  }
> @@ -432,7 +466,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc=
,
>                                     state->pending_vrefresh, 0,
>                                     cmdq_handle);
>
> -               state->pending_config =3D false;
> +               if (!cmdq_handle)
> +                       state->pending_config =3D false;
>         }
>
>         if (mtk_crtc->pending_planes) {
> @@ -452,9 +487,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
c,
>                                 mtk_ddp_comp_layer_config(comp, local_lay=
er,
>                                                           plane_state,
>                                                           cmdq_handle);
> -                       plane_state->pending.config =3D false;
> +                       if (!cmdq_handle)
> +                               plane_state->pending.config =3D false;
>                 }
> -               mtk_crtc->pending_planes =3D false;
> +
> +               if (!cmdq_handle)
> +                       mtk_crtc->pending_planes =3D false;
>         }
>
>         if (mtk_crtc->pending_async_planes) {
> @@ -474,9 +512,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
c,
>                                 mtk_ddp_comp_layer_config(comp, local_lay=
er,
>                                                           plane_state,
>                                                           cmdq_handle);
> -                       plane_state->pending.async_config =3D false;
> +                       if (!cmdq_handle)
> +                               plane_state->pending.async_config =3D fal=
se;
>                 }
> -               mtk_crtc->pending_async_planes =3D false;
> +
> +               if (!cmdq_handle)
> +                       mtk_crtc->pending_async_planes =3D false;
>         }
>  }
>
> --
> 2.18.0
>
