Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B3954034
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 06:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039D110E572;
	Fri, 16 Aug 2024 04:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YpulM9WS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BC510E572
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 04:03:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B834ECE1EB1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 04:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CC3C32782
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723780986;
 bh=4GAZmM/9DtLX0KB1XpogjgnI+I82wrlfm93YsGzxfUE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YpulM9WSv+RAreGrhLOZzVMEctYr+39PKge11VfVK/L0iyOSyvQaQ8K1Nh4Z0Kef8
 3JckG1nkxddUT0Cm40RTBVBcNtTx4mlGmVX51ortbQ+PBYQt/F2Ejb+XB9X3E7kMVS
 EZZtSMbhzlAj6yKzStQL+wTz/LZdKHosIrhvKCgjbdslNG+8l9TQpILs9aW0IIN8Br
 NZ3mGifkhlzwBdl20pvc+b+s0FqHU9oagTwkTZ5hRz561Dm8gOhVEFMoGcnYsy7PHC
 rUrXJYQLIimZcki+QSv4m4lNpojEEa/VdY95Vwwl7ZC/0XPTvvh2kY615tkzc0wuNG
 gb48QGfABc7GA==
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2d3e46ba5bcso309139a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 21:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVcB0/wFHwFXVtorPMxLaxveV0zNNY5JWQFWTK6qUte8rih5b9yrG7Hp5uIyjsuaekglbb/BLfzT4U6qmME6nq3bX4E/l3K4cNmzfhZHSLf
X-Gm-Message-State: AOJu0Yx6PhHnODCP1VpSU5+Dn4DM0e33m6YWhnE+X0zsLZTRzSz9009n
 2amS/RbspoG5tdeQTALJ5qDR8xerKWXk+F1KUoIfptxzOFP3lfFQavCifiYgG7eWY6PogHDLMcp
 1Lw2x/oKyjw+QrPba/bg5Y1kWyg==
X-Google-Smtp-Source: AGHT+IEOGuaBfZk2Mttwbtdt3blKF/XU9pCPPCi7eO6Mh8VFFnf3M2v3Xsh5ll49RERqc+5RGbfiKUdsPEq0KZMsMrY=
X-Received: by 2002:a17:90a:6fa3:b0:2c9:7616:dec7 with SMTP id
 98e67ed59e1d1-2d3dfc2b2dbmr1932025a91.6.1723780986477; Thu, 15 Aug 2024
 21:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 16 Aug 2024 12:03:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
Message-ID: <CAAOTY__xOVgdF1iEtcbXrmnM40og8XJGZ+-5K02q58XbYY3GGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Jeffrey Kardatzke <jkardatzke@google.com>
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B47=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
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
> Therefore, use the mtk_crtc->config_updating flag set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't b=
e
> changed when the mtk_crtc_ddp_config() is preparing instructions.
>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_crtc.c | 34 +++++++++++++++--------------
>  1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> index 6f34f573e127..bc3bf0c3edd9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
> @@ -314,30 +314,32 @@ static void ddp_cmdq_cb(struct mbox_client *cl, voi=
d *mssg)
>
>         state =3D to_mtk_crtc_state(mtk_crtc->base.state);
>
> -       state->pending_config =3D false;
> +       if (!mtk_crtc->config_updating) {
> +               state->pending_config =3D false;

I think if mtk_crtc->config_updating =3D=3D true, the whole clear job
could be skipped.
And use spin_lock to protect the clear job in irq.

/*
spin_lock():
if (mtk_crtc->config_updating) {
        spin_unlock();
        goto out;
}

/* clear job */

spin_unlock();
*/
out:

In mtk_crtc_config_update(), use spin_lock to protect mtk_crtc->config_upda=
ting:

spin_lock();
mtk_crtc->config_updating =3D true;
spin_unlock();
...
spin_lock();
mtk_crtc->config_updating =3D false;
spin_unlock();

Regards,
Chun-Kuang.


>
> -       if (mtk_crtc->pending_planes) {
> -               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> -                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> -                       struct mtk_plane_state *plane_state;
> +               if (mtk_crtc->pending_planes) {
> +                       for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                               struct drm_plane *plane =3D &mtk_crtc->pl=
anes[i];
> +                               struct mtk_plane_state *plane_state;
>
> -                       plane_state =3D to_mtk_plane_state(plane->state);
> +                               plane_state =3D to_mtk_plane_state(plane-=
>state);
>
> -                       plane_state->pending.config =3D false;
> +                               plane_state->pending.config =3D false;
> +                       }
> +                       mtk_crtc->pending_planes =3D false;
>                 }
> -               mtk_crtc->pending_planes =3D false;
> -       }
>
> -       if (mtk_crtc->pending_async_planes) {
> -               for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> -                       struct drm_plane *plane =3D &mtk_crtc->planes[i];
> -                       struct mtk_plane_state *plane_state;
> +               if (mtk_crtc->pending_async_planes) {
> +                       for (i =3D 0; i < mtk_crtc->layer_nr; i++) {
> +                               struct drm_plane *plane =3D &mtk_crtc->pl=
anes[i];
> +                               struct mtk_plane_state *plane_state;
>
> -                       plane_state =3D to_mtk_plane_state(plane->state);
> +                               plane_state =3D to_mtk_plane_state(plane-=
>state);
>
> -                       plane_state->pending.async_config =3D false;
> +                               plane_state->pending.async_config =3D fal=
se;
> +                       }
> +                       mtk_crtc->pending_async_planes =3D false;
>                 }
> -               mtk_crtc->pending_async_planes =3D false;
>         }
>
>         mtk_crtc->cmdq_vblank_cnt =3D 0;
> --
> 2.18.0
>
