Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4595B81E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AD010EADE;
	Thu, 22 Aug 2024 14:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XIgbiW8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCBA10EADE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:16:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 70B9DA4046F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3BEC4AF13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724336169;
 bh=W5kwXF+wJz51bitQriLhe8Uli77pQxLNfl6KnfeRs/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XIgbiW8FQYxrDZR0nMP5Ve6yr+YP7T4Dg3ykcO3Ro7O0JixNowObn9fRCQGWk9WWD
 z3zm77AxqRUP+r+52AM2h8TY3CKWfdcnPfvyXgMbRAK87J0xhZC+mjH7SEkYxclXYc
 cP88L+blh8qdgCyuC5/1KBov+tyKMSDcljEoL2fDKAqJmp69Zy3/oUCIiqGfg+F1dh
 WoKoYm3Z74CQ/4Qp8fNbnxZ8iWyneN8Q+SMAttml/LvhXelKRrbm4/rhQhWYI/otoO
 yjh6djVUkKDRkyLN6ekbuLboaA42uyQsNKdZyQh33mNBSP6261LESQ0wPInfBpg6Hz
 ouyJu7Uh325vg==
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-6e7b121be30so614645a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 07:16:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXy5Dfy45T763LmWUe/p4GBxGGX6rDjPbd0sOtGbtY6VmGkM12nw1MQMovY0UbjI5dZOaCCTEpSpK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvg2zxnQVLmIfAUuL9GTLJWgZf1iCWZ+I429nw2BEOuoHoBzm9
 97Cd2jYgo+cW4cGkP/pNA36kLyfKN9K6VuiIX2DnF6XDjPOwfnHU2tCcfyl0sagcH5JyIoT87sM
 eVllYL22oKjEcuy3DWIWKSe78kg==
X-Google-Smtp-Source: AGHT+IHWa/d6YEshaBG7X/oWKaxeKpPhnMr3wygRupON5CVgJxcR8GfDfn3XtpvG+CdSumjZAvL45/if2dc9g07I6Lc=
X-Received: by 2002:a17:90b:8c:b0:2d3:b748:96dd with SMTP id
 98e67ed59e1d1-2d616b56691mr2332303a91.25.1724336168860; Thu, 22 Aug 2024
 07:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com>
In-Reply-To: <20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Aug 2024 22:16:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-XUtAGz26KUiXyceY=2OiqEoGMerLt3BpUOKcD36xH+g@mail.gmail.com>
Message-ID: <CAAOTY_-XUtAGz26KUiXyceY=2OiqEoGMerLt3BpUOKcD36xH+g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
To: jason-jh.lin@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=
=9C=8819=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8811:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>
> In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
> generate instructions to cmdq_handle, such as:
>   state->pending_config
>   mtk_crtc->pending_planes
>   plane_state->pending.config
>   mtk_crtc->pending_async_planes
>   plane_state->pending.async_config
>
> These configuration flags may be set to false when a GCE IRQ comes callin=
g
> ddp_cmdq_cb(). This may result in missing prepare instructions,
> especially if mtk_crtc_update_config() with the flase need_vblank (no nee=
d
> to wait for vblank) cases.
>
> Therefore, the mtk_crtc->config_updating flag is set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't b=
e
> changed when the mtk_crtc_ddp_config() is preparing instructions.
> But somehow the ddp_cmdq_cb() didn't use the mtk_crtc->config_updating
> flag to prevent those pending config flags from being cleared.
>
> To avoid missing the configuration when generating the config instruction=
,
> the config_updating flag should be added into ddp_cmdq_cb() and be
> protected with spin_lock.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
> Change in v2:
> Add spin_lock protection for config_updating flag.
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..b752c0b46383 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -69,6 +69,8 @@ struct mtk_crtc {
>         /* lock for display hardware access */
>         struct mutex                    hw_lock;
>         bool                            config_updating;
> +       /* lock for config_updating to cmd buffer */
> +       spinlock_t                      config_lock;
>  };
>
>  struct mtk_crtc_state {
> @@ -107,10 +109,13 @@ static void mtk_crtc_finish_page_flip(struct mtk_cr=
tc *mtk_crtc)
>  static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
>  {
>         drm_crtc_handle_vblank(&mtk_crtc->base);
> +
> +       spin_lock(&mtk_crtc->config_lock);
>         if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank)=
 {
>                 mtk_crtc_finish_page_flip(mtk_crtc);
>                 mtk_crtc->pending_needs_vblank =3D false;
>         }
> +       spin_unlock(&mtk_crtc->config_lock);
>  }
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> @@ -314,6 +319,13 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
> +       spin_lock(&mtk_crtc->config_lock);
> +
> +       if (mtk_crtc->config_updating) {
> +               spin_unlock(&mtk_crtc->config_lock);
> +               goto ddp_cmdq_cb_out;
> +       }
> +
>         state->pending_config =3D false;
>
>         if (mtk_crtc->pending_planes) {
> @@ -340,6 +352,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>                 mtk_crtc->pending_async_planes =3D false;
>         }
>
> +       spin_unlock(&mtk_crtc->config_lock);
> +
> +ddp_cmdq_cb_out:
> +
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         wake_up(&mtk_crtc->cb_blocking_queue);
>  }
> @@ -571,7 +587,11 @@ static void mtk_crtc_update_config(struct mtk_crtc *=
mtk_crtc, bool needs_vblank)
>         int i;
>
>         mutex_lock(&mtk_crtc->hw_lock);
> +
> +       spin_lock(&mtk_crtc->config_lock);
>         mtk_crtc->config_updating =3D true;
> +       spin_unlock(&mtk_crtc->config_lock);
> +
>         if (needs_vblank)
>                 mtk_crtc->pending_needs_vblank =3D true;
>
> @@ -625,7 +645,10 @@ static void mtk_crtc_update_config(struct mtk_crtc *=
mtk_crtc, bool needs_vblank)
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
>  #endif
> +       spin_lock(&mtk_crtc->config_lock);
>         mtk_crtc->config_updating =3D false;
> +       spin_unlock(&mtk_crtc->config_lock);
> +
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
>
> @@ -1068,6 +1091,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, con=
st unsigned int *path,
>                 drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_s=
ize);
>         drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut=
_size);
>         mutex_init(&mtk_crtc->hw_lock);
> +       spin_lock_init(&mtk_crtc->config_lock);
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         i =3D priv->mbox_index++;
>
> ---
> base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
> change-id: 20240819-drm-fixup-0819-f51e2d37fcd7
>
> Best regards,
> --
> Jason-JH.Lin <jason-jh.lin@mediatek.com>
>
>
