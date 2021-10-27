Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB343C958
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5668389A92;
	Wed, 27 Oct 2021 12:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA776E876
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:32:29 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id j6so2285557ila.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XHjYTJsHtmmMad6y4D14arx8SSI4DLlQcaRHAcm09Q=;
 b=f7moHQylEHJ9KJFRrrluC9FcbdrY48H1HrCI6LgdHxR0ARIgYRHqyz3yKJ0V2VX9fB
 BwcF0KOpJmqgVmTesRjK8vGTilcFhpOBan2BWYH3k7UY1KwCLHyl7B5eekYGAAYyHCDw
 bEB8A5PuJKWeVmuFBzGeKMZO5sg7k5GTZv+uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XHjYTJsHtmmMad6y4D14arx8SSI4DLlQcaRHAcm09Q=;
 b=QG+vkrZQj/mf2ytL/eiNME1ZTF9qeLbd9hWdE2lsmjWDUnEZTbNq5oOLYlP3BQxyF6
 qoFwulFaD/QmqJkse1MmtctyJgLkEdx2sGJoMDksSvAOeqq53HsLfK3XiyCflm9ghI8x
 DmCDATGn1m2CqET+zAzgERfCS8opu+vjiqiHSyE0amyJICej8kgzCZffY6Vn+WJAbd1U
 77q2MuL4ILm4UXmtU18EDAIFxBeWj2VOzNHIKaG6tywjc1Q7wiy6jALI11EAqlLXo/J1
 6BVg3rJSXCvwXDD64u6RzpSBdsUbNnlA8zC3nOkWLdV1aFr3nVYiQMS75cYZfxT0Z8No
 kRgg==
X-Gm-Message-State: AOAM531t3sHT+yAkHfpv+p7sL7/wyOxAUZarxMYYj63oTHaZADrbtjou
 f/7R3PWIO03HJJ+cLU3IZhtX3+xp8smhqg==
X-Google-Smtp-Source: ABdhPJx6s/Aj2c6X3QrGuHQpLGzGcfEUKqMg0GodXN5WSdSTAyRbfU0HcERp8VvW6KTTHGjjhVp6iw==
X-Received: by 2002:a05:6e02:1c0c:: with SMTP id
 l12mr18411801ilh.69.1635327147082; 
 Wed, 27 Oct 2021 02:32:27 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id z11sm10984201ilb.11.2021.10.27.02.32.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 02:32:26 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id h2so2212579ili.11
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 02:32:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:1747:: with SMTP id
 y7mr18329876ill.95.1635327145411; 
 Wed, 27 Oct 2021 02:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211027021857.20816-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Oct 2021 17:31:49 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
Message-ID: <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, hsinyi@chromium.org, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 27 Oct 2021 12:15:54 +0000
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

Hi Jason,

On Wed, Oct 27, 2021 at 10:19 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> CMDQ is used to update display register in vblank period, so
> it should be execute in next 2 vblank. One vblank interrupt
> before send message (occasionally) and one vblank interrupt
> after cmdq done. If it fail to execute in next 3 vblank,
> tiemout happen.
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
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
> @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
>         struct cmdq_cb_data *data = mssg;
> +       struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
> +       struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
>
> +       mtk_crtc->cmdq_vblank_cnt = 0;
>         cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
> @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>                                            cmdq_handle->pa_base,
>                                            cmdq_handle->cmd_buf_size,
>                                            DMA_TO_DEVICE);
> +               /*
> +                * CMDQ command should execute in next 3 vblank.
> +                * One vblank interrupt before send message (occasionally)
> +                * and one vblank interrupt after cmdq done,
> +                * so it's timeout after 3 vblank interrupt.
> +                * If it fail to execute in next 3 vblank, timeout happen.
> +                */
> +               mtk_crtc->cmdq_vblank_cnt = 3;
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> +               mtk_crtc_ddp_config(crtc, NULL);
> +       else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
I think atomic_dec_and_test() does what you want to do here.




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
