Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E23DE2F2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 01:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5116E0FC;
	Mon,  2 Aug 2021 23:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2D56E0FC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:16:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C261160EE9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627946195;
 bh=0CE6qR/gop+OdKgxD/k5bSNptqvMl6JQUMWiGm6+tfw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JL0zMLYdH8Ohwr0tKC+IKekf9Qbx/szIeRH9N8fqiDCVhLUwEpH0OaP2BmrUBBOMe
 J3d2gpr0JPj+pzFs3AWElm9jmuiqcZnxjHChKTXJAQWwlWelFoGHHNcIj/UBCcLnlB
 h+/MMl4u+SZq16NuI3C67q2HZweSwyOitqWIgJD4HZT4Pqc+pJPJqABOSeKxHrUCDM
 UlgJqUlXToOjoMEgH6wjA7bNQI2Kc+VnewJDgfZWG6m3nFPYTIICwkoTRuYHNTfKLJ
 UtRDwZ81YzKbbrKn4oTHVbrTX8+pRytq8MdWuHIh/97vwkaZJ75slHtGja2GXC0iCN
 pDLNuM01n7y5A==
Received: by mail-ed1-f47.google.com with SMTP id cf5so15127311edb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Aug 2021 16:16:35 -0700 (PDT)
X-Gm-Message-State: AOAM531ENKrzQ1THr1Re6MWL5Vvh6lHI9zz9BbB8S9uacYOxmQLL/HLT
 DVhocjDwqmMUI4hbCxTl35OHqymXIIls/QIg1Q==
X-Google-Smtp-Source: ABdhPJxJAhueT9lDCmD6Pnv55JDItfMv10i4eCO+yqwvWYDC+oNsWVEH5yVZqBJ6i6TEgSsxIe1LvfnoD9+mHDpuKCw=
X-Received: by 2002:aa7:c6d3:: with SMTP id b19mr21633222eds.303.1627946194379; 
 Mon, 02 Aug 2021 16:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1627888227-5757-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627888227-5757-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1627888227-5757-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:16:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7MNrO5my3_9EAeSVxtsVC-dGTZH31tph9TpY3faAdwQ@mail.gmail.com>
Message-ID: <CAAOTY_-7MNrO5my3_9EAeSVxtsVC-dGTZH31tph9TpY3faAdwQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: clear pending flag when cmdq packet is
 done.
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
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

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=
=882=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:11=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> In cmdq mode, packet may be flushed before it is executed, so
> the pending flag should be cleared after cmdq packet is done.
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 51 +++++++++++++++++++++++++++=
++----
>  1 file changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 4c25e33..2a2d43e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -267,6 +267,40 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>  {
>         struct mtk_drm_crtc *mtk_crtc =3D container_of(cl, struct mtk_drm=
_crtc, cmdq_cl);
>         struct cmdq_cb_data *data =3D mssg;
> +       struct mtk_crtc_state *state;
> +       unsigned int i;
> +
> +       state =3D to_mtk_crtc_state(mtk_crtc->base.state);
> +
> +       if (state->pending_config) {

No matter pending_config is true or not, it would be false after this.
So we could simply drop this checking.

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

Ditto.

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

Ditto.

Regards,
Chun-Kuang.

> +                               plane_state->pending.async_config =3D fal=
se;
> +               }
> +               mtk_crtc->pending_async_planes =3D false;
> +       }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
> @@ -423,7 +457,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc=
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
> @@ -443,9 +478,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
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
> @@ -465,9 +503,12 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crt=
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
> 1.8.1.1.dirty
>
