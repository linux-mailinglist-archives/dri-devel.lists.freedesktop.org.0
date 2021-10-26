Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C243B620
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F14189C1F;
	Tue, 26 Oct 2021 15:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6560589C1F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:53:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27A77603E7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635263584;
 bh=nAKmjX5ewh+7F2mMRFmm/YA3gft13iioUU3Qv6ArlsA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jICFmR6I2JioLGyWh1vmjqPo6HcKo9HSSW801K0HwZ+zb7FbAzEp4e2yyK4YB0RbS
 4ZdH+nsBjr3Emp3Qy8Lm7lVJO8JdQHJwJrF/mFfMyb2F1qrLzlLOhFlQ4eH8g1lh0P
 dni/aXcKSMjwyrcIfoEVmQNj1mfwSRof082CLQK92vihHyVSHU5dOr8GwydOE17u5f
 ZQOw9RgPk6PKjBXFrBZPD00+yVv0/GSBnodr2uCs33mBeKTmGZrdrtRP9u0pFBE05Y
 /vu6hvvpqIK1Esu8ZDwBEKM2YACup808a6rTFuVqjCs194I7vD2UFnRfhDXAa4ZmZG
 vcwCHz4kt9H9w==
Received: by mail-ed1-f44.google.com with SMTP id z20so15991983edc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 08:53:04 -0700 (PDT)
X-Gm-Message-State: AOAM531TZifEwFgELJvbXqp1HXB56f8Da7rxN3UnRK2AVmEnQNkrmLj1
 u1r5eJ834wlyPVrC+5yjmGzztUMHz1lnjntcWQ==
X-Google-Smtp-Source: ABdhPJwAzMS+M5QGF4LBx8XUxrq/iAKzw2brrpMhdspRZ8GCoR3k8K+jw/RtWsU34QCh2Sr7vT+F/Tg+vztn5C69A8w=
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr17917455edw.272.1635263411638; 
 Tue, 26 Oct 2021 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052916.8222-1-jason-jh.lin@mediatek.com>
 <20211026052916.8222-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20211026052916.8222-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 26 Oct 2021 23:50:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY__RA-dDUhpaBugOXEEX=W2C2MU_yChdzO_a1PF2nO+Mtw@mail.gmail.com>
Message-ID: <CAAOTY__RA-dDUhpaBugOXEEX=W2C2MU_yChdzO_a1PF2nO+Mtw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/mediatek: Use mailbox rx_callback instead of
 cmdq_task_cb
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
> rx_callback is a standard mailbox callback mechanism and could cover the
> function of proprietary cmdq_task_cb, so use the standard one instead of
> the proprietary one.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index a4e80e499674..369d3e68c0b6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -4,6 +4,8 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/mailbox_controller.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
> @@ -222,9 +224,11 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(stru=
ct drm_crtc *crtc,
>  }
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> -static void ddp_cmdq_cb(struct cmdq_cb_data data)
> +static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
> -       cmdq_pkt_destroy(data.data);
> +       struct cmdq_cb_data *data =3D mssg;
> +
> +       cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
>
> @@ -475,7 +479,12 @@ static void mtk_drm_crtc_update_config(struct mtk_dr=
m_crtc *mtk_crtc,
>                 cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>                 mtk_crtc_ddp_config(crtc, cmdq_handle);
>                 cmdq_pkt_finalize(cmdq_handle);
> -               cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handl=
e);
> +               dma_sync_single_for_device(mtk_crtc->cmdq_client->chan->m=
box->dev,
> +                                          cmdq_handle->pa_base,
> +                                          cmdq_handle->cmd_buf_size,
> +                                          DMA_TO_DEVICE);
> +               mbox_send_message(mtk_crtc->cmdq_client->chan, cmdq_handl=
e);
> +               mbox_client_txdone(mtk_crtc->cmdq_client->chan, 0);
>         }
>  #endif
>         mtk_crtc->config_updating =3D false;
> @@ -839,6 +848,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>         }
>
>         if (mtk_crtc->cmdq_client) {
> +               mtk_crtc->cmdq_client->client.rx_callback =3D ddp_cmdq_cb=
;
>                 ret =3D of_property_read_u32_index(priv->mutex_node,
>                                                  "mediatek,gce-events",
>                                                  drm_crtc_index(&mtk_crtc=
->base),
> --
> 2.18.0
>
