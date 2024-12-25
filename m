Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071339FC5D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 16:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F0710E139;
	Wed, 25 Dec 2024 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PTRpjynZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EE910E139
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:08:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D727A40488
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B811AC4AF09
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735139337;
 bh=OMb/rpLM+V5DGueRzdj6awBuZkMVY5pC2pMU/jT0yaI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PTRpjynZzSzHVMJL/fd7dlJHLslIuElBkF5DWGBuQzoj+rHhk3MFXS59Gut+vxiwn
 tdyD9o583fJG/r1ZX69Ir4aZaOxRDF0WcmwFZT7QQMUMYb/dRzTaE91K2KMrOFedt7
 LNaSZq0m0qWYAc1bgUVLouLSFew3yPjVBBkBY3nYFGXx3KIMezKF0T4yuBTqcHZ4Cm
 fXUdOF++TDzBUzDJbRBFeIunqe3AQ4r28qnYrFSAe3j3wnuQVMtZdyXipguwodjiOt
 IohDZ+v1oFCu/FBPp2HaqrOM3ssbkKQMhytkRnYPy6RN721ZXqKFapMG5iyiOETZqU
 PdC6PzT47povw==
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2ef70c7efa5so5107705a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 07:08:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXBzfRJm8CP5oIPVyEJ9jQ3VU7t82TerZQXzgfP1CZYwtnkx/LF/wMdDn5Wb/winI8l21m0qJKXW0Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5utyDW5tS9IeVUmcA+LAzvSPdtaOshE8fx937rEzNYYV114wB
 3i9tDgZvDJ0BLwU3Mi/T1hWzr2Dz7mitkhkW3fWPAfOEKXGk/b5c2aGTAgIxxTTUO6yDZ/uhqjF
 4CZG7udXZURv15JMU0b6NQuRMBg==
X-Google-Smtp-Source: AGHT+IFNohSARnz7/AmpMrxWwtTihcrjyxAynE3EZ/j8OawR4Ys3V/MW+8rDZzV9qlPF3PkrQnE8ZYRou//whw1yFVY=
X-Received: by 2002:a17:90b:534e:b0:2ee:7a4f:9265 with SMTP id
 98e67ed59e1d1-2f452e22c53mr32774802a91.15.1735139337257; Wed, 25 Dec 2024
 07:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241211034716.29241-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 25 Dec 2024 23:09:29 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9SKy0H8Kdhu81_4kxa14RgKhCcnW3FJyKbwraitR5NrA@mail.gmail.com>
Message-ID: <CAAOTY_9SKy0H8Kdhu81_4kxa14RgKhCcnW3FJyKbwraitR5NrA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: Move mtk_crtc_finish_page_flip() to
 ddp_cmdq_cb()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, fshao@chromium.org, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
11=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> mtk_crtc_finish_page_flip() is used to notify userspace that a
> page flip has been completed, allowing userspace to free the frame
> buffer of the last frame and commit the next frame.
>
> In MediaTek's hardware design for configuring display hardware by using
> GCE, `DRM_EVENT_FLIP_COMPLETE` should be notified to userspace after
> GCE has finished configuring all display hardware settings for each
> atomic_commit().
>
> Currently, mtk_crtc_finish_page_flip() cannot guarantee that GCE has
> configured all the display hardware settings of the last frame.
> Therefore, to increase the accuracy of the timing for notifying
> `DRM_EVENT_FLIP_COMPLETE` to userspace, mtk_crtc_finish_page_flip()
> should be moved to ddp_cmdq_cb().

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index eb0e1233ad04..5674f5707cca 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -112,6 +112,11 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc=
 *mtk_crtc)
>
>         drm_crtc_handle_vblank(&mtk_crtc->base);
>
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       if (mtk_crtc->cmdq_client.chan)
> +               return;
> +#endif
> +
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank)=
 {
>                 mtk_crtc_finish_page_flip(mtk_crtc);
> @@ -284,10 +289,8 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void=
 *mssg)
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
> -       if (mtk_crtc->config_updating) {
> -               spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +       if (mtk_crtc->config_updating)
>                 goto ddp_cmdq_cb_out;
> -       }
>
>         state->pending_config =3D false;
>
> @@ -315,10 +318,15 @@ static void ddp_cmdq_cb(struct mbox_client *cl, voi=
d *mssg)
>                 mtk_crtc->pending_async_planes =3D false;
>         }
>
> -       spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> -
>  ddp_cmdq_cb_out:
>
> +       if (mtk_crtc->pending_needs_vblank) {
> +               mtk_crtc_finish_page_flip(mtk_crtc);
> +               mtk_crtc->pending_needs_vblank =3D false;
> +       }
> +
> +       spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
>         wake_up(&mtk_crtc->cb_blocking_queue);
>  }
> @@ -606,13 +614,18 @@ static void mtk_crtc_update_config(struct mtk_crtc =
*mtk_crtc, bool needs_vblank)
>                  */
>                 mtk_crtc->cmdq_vblank_cnt =3D 3;
>
> +               spin_lock_irqsave(&mtk_crtc->config_lock, flags);
> +               mtk_crtc->config_updating =3D false;
> +               spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle=
);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> -#endif
> +#else
>         spin_lock_irqsave(&mtk_crtc->config_lock, flags);
>         mtk_crtc->config_updating =3D false;
>         spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
> +#endif
>
>         mutex_unlock(&mtk_crtc->hw_lock);
>  }
> --
> 2.43.0
>
