Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD513C676D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 02:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4741289ECB;
	Tue, 13 Jul 2021 00:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE5389ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 00:24:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 460816120A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626135888;
 bh=KexV+4F3TgN4PPH4fBSUjkTODP7+uxdjEVPvdNWA3ek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=efNv2ZKOQmeZOzjaWJvY+GGdSdjEMfy1vzaR/X6ySrmMtOdN/rb6XSpLr2EssXBsa
 c0ht1ljsmxEqenKRNycCRiooGY2sogJkyPHIJ2T9LWcK2C+n7B3/kWWUcbtUMQh8YQ
 Ipc/JneCNEEMgTb1Z7tXZOopQwElPl3roo5YgVGHNj+uugtCGu0+tMCBUa71MaQeiv
 AFIU3EnPzs3XJzlTxRxVpsmGZIocKROZc39+qoOS7xG/BCQT6OOZluMXud37p0yjN9
 d2WwQmrW/ULkhSZ18v4noIr5MP7g//aZ5rs2q7EagHbYPzXCTM4r+y61PcaTJ09a4I
 HtFMH2QFFBrIA==
Received: by mail-ej1-f41.google.com with SMTP id dt7so8288169ejc.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 17:24:48 -0700 (PDT)
X-Gm-Message-State: AOAM5333adjRxjcZ3D2fEtS4rbzAXlBFe6yRd/rZasDaHD2hEmYD7amj
 B9DilCxko6jgKsbAukfCxl0k5uw7og72tPP9wQ==
X-Google-Smtp-Source: ABdhPJzbNtMkeM1yr6+TVDvgJG2LQ1xNzk1FIO6ziqPDzewhB10dddOwyHMlOtOpBIsKU25K3xu2hWGbrYxzWaqPvF0=
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr2043181ejc.303.1626135886765; 
 Mon, 12 Jul 2021 17:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <1626072109-2657-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626072109-2657-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626072109-2657-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 13 Jul 2021 08:24:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8=fdhVosGKj0uAqYemka3=PX+LOvnDPpTWfqBHaJgJ_Q@mail.gmail.com>
Message-ID: <CAAOTY_8=fdhVosGKj0uAqYemka3=PX+LOvnDPpTWfqBHaJgJ_Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: clear pending flag when cmdq packet is
 done.
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=8812=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:42=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> In cmdq mode, packet may be flushed before it is executed, so
> the pending flag should be cleared after cmdq packet is done.

I would like this patch to base on the series [1] because that series
use the standard mailbox callback interface.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5143=
69

Regards,
Chun-Kuang.

>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 92 +++++++++++++++++++++++++++=
+++---
>  1 file changed, 85 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 40df2c8..8cd107b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -73,6 +73,13 @@ struct mtk_crtc_state {
>         unsigned int                    pending_vrefresh;
>  };
>
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +struct mtk_cmdq_cb_data {
> +       struct cmdq_pkt                 *cmdq_handle;
> +       struct mtk_drm_crtc             *mtk_crtc;
> +};
> +#endif
> +
>  static inline struct mtk_drm_crtc *to_mtk_crtc(struct drm_crtc *c)
>  {
>         return container_of(c, struct mtk_drm_crtc, base);
> @@ -224,7 +231,64 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct cmdq_cb_data data)
>  {
> -       cmdq_pkt_destroy(data.data);
> +       struct mtk_cmdq_cb_data *cb_data =3D data.data;
> +       struct mtk_drm_crtc *mtk_crtc;
> +       struct mtk_crtc_state *state;
> +       unsigned int i;
> +
> +       if (!cb_data) {
> +               DRM_ERROR("cmdq callback data is null pointer!\n");
> +               return;
> +       }
> +
> +       if (data.sta !=3D 0) {
> +               DRM_WARN("cmdq callback error %d!!\n", data.sta);
> +               goto destroy_pkt;
> +       }
> +
> +       mtk_crtc =3D cb_data->mtk_crtc;
> +       if (!mtk_crtc) {
> +               DRM_ERROR("cmdq callback mtk_crtc is null pointer!\n");
> +               goto destroy_pkt;
> +       }
> +
> +       state =3D to_mtk_crtc_state(mtk_crtc->base.state);
> +
> +       if (state->pending_config) {
> +               state->pending_config =3D false;
> +       }
> +
> +       if (mtk_crtc->pending_planes) {
> +               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> +                       struct mtk_plane_state *plane_state;
> +
> +                       plane_state =3D to_mtk_plane_state(plane->state);
> +
> +                       if (plane_state->pending.config)
> +                               plane_state->pending.config =3D false;
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
> +                       if (plane_state->pending.async_config)
> +                               plane_state->pending.async_config =3D fal=
se;
> +               }
> +               mtk_crtc->pending_async_planes =3D false;
> +       }
> +
> +destroy_pkt:
> +       if (cb_data->cmdq_handle)
> +               cmdq_pkt_destroy(cb_data->cmdq_handle);
> +
> +       kfree(cb_data);
>  }
>  #endif
>
> @@ -378,7 +442,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc=
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
> @@ -398,9 +463,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
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
> @@ -420,9 +488,13 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
c,
>                                 mtk_ddp_comp_layer_config(comp, local_lay=
er,
>                                                           plane_state,
>                                                           cmdq_handle);
> -                       plane_state->pending.async_config =3D false;
> +
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
> @@ -469,13 +541,19 @@ static void mtk_drm_crtc_update_config(struct mtk_d=
rm_crtc *mtk_crtc,
>         }
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (mtk_crtc->cmdq_client) {
> +               struct mtk_cmdq_cb_data *cb_data;
> +
>                 mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
>                 cmdq_handle =3D cmdq_pkt_create(mtk_crtc->cmdq_client, PA=
GE_SIZE);
>                 cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
>                 cmdq_pkt_finalize(cmdq_handle);
> -               cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handl=
e);
> +
> +               cb_data =3D kmalloc(sizeof(*cb_data), GFP_KERNEL);
> +               cb_data->cmdq_handle =3D cmdq_handle;
> +               cb_data->mtk_crtc =3D mtk_crtc;
> +               cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cb_data);
>         }
>  #endif
>         mtk_crtc->config_updating =3D false;
> --
> 1.8.1.1.dirty
>
