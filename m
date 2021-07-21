Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B13D0F2A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED086EBA8;
	Wed, 21 Jul 2021 13:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67DF6EBA8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:06:10 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id f11so811039uan.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sE5V6logeIB6yN4Rh0mfzUJ1rGMZI822LGADa05C45E=;
 b=Bj7bk/C1PKkuSzV5YRthYWTCkuufUKTTiVbPn4NU1EPzJdN8DRLfPg6ae8XCATPHBq
 pd+kUYv9wqu2Rr+Y6yw7c/BUKey/G2MxviKwFxh/HOdNK7Ui5sbpLQ0o+eOECLOrZ8wL
 pdVA1KzoZq1MjDKOvgaP1gL63WJWVdsOK0OBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sE5V6logeIB6yN4Rh0mfzUJ1rGMZI822LGADa05C45E=;
 b=D0e0CzhE8sDjdoo/F0MHQ72FQTZpu3pUIuftwoNUwmT27EuwolD23UzPYq7pT/gBJN
 Vok+1zqicKccsM4P0VW5JYqaX/j6UBQl40gj7jUe77axQLBp5q586VNvCggZY+lQ79pW
 mbeavARxDcmLpw7T78SlSPP9ZKcu/VnfkVfo9KmZs91CJiYBz5aKQvpIsZi69v2DqJIt
 3QOXySUPEGZN9nVlZUTdenqEL1WvieJ9hW35ycFUKoUqEsVYL/Gn2hrQF8/xL6u8DtNG
 vxs98cioZAEvrdhXBr8VF6b/6pUZl5WIf+YuwZLpDCJLJWh8z/4QAG1mqiRY5zHFsHPQ
 oVFw==
X-Gm-Message-State: AOAM5320xtLkmcSvbXbwd4siqxSC4Ko398ugDSuXadOTPVwX/aMcKyck
 4uKW2JatEcL5S8i93V4edCvvnhbtloNAGM6A
X-Google-Smtp-Source: ABdhPJzHVKHiT+veOH6QMlMnjHioQ9hYORmws0fIOjPW2p7shM2yozwv7YuPq7FkO6GPBA8deL4T1w==
X-Received: by 2002:a05:6130:40c:: with SMTP id
 ba12mr35450926uab.38.1626872769704; 
 Wed, 21 Jul 2021 06:06:09 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id e10sm3091655vso.29.2021.07.21.06.06.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 06:06:08 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id q124so505163vka.8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 06:06:08 -0700 (PDT)
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr31887451vke.2.1626872768157; 
 Wed, 21 Jul 2021 06:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210720074734.22287-1-jason-jh.lin@mediatek.com>
 <20210720074734.22287-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210720074734.22287-2-jason-jh.lin@mediatek.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 21 Jul 2021 09:05:29 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLuhmRwWSUx9ODP59VK6Xe=RzLwGOn6FB=OLxs04oQmbw@mail.gmail.com>
Message-ID: <CAOw6vbLuhmRwWSUx9ODP59VK6Xe=RzLwGOn6FB=OLxs04oQmbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Fix cursor plane didn't update
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@google.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
 David-YH.Chiu@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 3:47 AM jason-jh.lin <jason-jh.lin@mediatek.com> wr=
ote:
>
> The cursor plane should use the current plane state hook in
> atomic_async_update because it would not be the new plane state in
> the global atomic state, since drm_atomic_helper_swap_state happened
> when those plane state hook are run.
>
> Fix cursor plane didn't update issue by below modification:
> 1. Remove plane_helper_funcs->atomic_update(plane, state) in
>    mtk_drm_crtc_async_update.
> 2. Add mtk_drm_update_new_state into mtk_plane_atomic_async_update to
>    update the cursor plane by current plane state hook and add it into
>    mtk_plane_atomic_update to update others plane by the new_state.
>
> Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state po=
inter")
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 60 ++++++++++++++----------
>  2 files changed, 34 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index 474efb844249..063c75bab3a8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -538,7 +538,6 @@ void mtk_drm_crtc_async_update(struct drm_crtc *crtc,=
 struct drm_plane *plane,
>         if (!mtk_crtc->enabled)
>                 return;
>
> -       plane_helper_funcs->atomic_update(plane, state);

plane_helper_funcs is now unused

../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:578:39: warning: unused
variable =E2=80=98plane_helper_funcs=E2=80=99 [-Wunused-variable]

>
>         mtk_drm_crtc_update_config(mtk_crtc, false);
>  }
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_plane.c
> index b5582dcf564c..e6dcb34d3052 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -110,6 +110,35 @@ static int mtk_plane_atomic_async_check(struct drm_p=
lane *plane,
>                                                    true, true);
>  }
>
> +static void mtk_plane_update_new_state(struct drm_plane_state *new_state=
,
> +                                      struct mtk_plane_state *mtk_plane_=
state)
> +{
> +       struct drm_framebuffer *fb =3D new_state->fb;
> +       struct drm_gem_object *gem;
> +       struct mtk_drm_gem_obj *mtk_gem;
> +       unsigned int pitch, format;
> +       dma_addr_t addr;
> +
> +       gem =3D fb->obj[0];
> +       mtk_gem =3D to_mtk_gem_obj(gem);
> +       addr =3D mtk_gem->dma_addr;
> +       pitch =3D fb->pitches[0];
> +       format =3D fb->format->format;
> +
> +       addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +       addr +=3D (new_state->src.y1 >> 16) * pitch;
> +
> +       mtk_plane_state->pending.enable =3D true;
> +       mtk_plane_state->pending.pitch =3D pitch;
> +       mtk_plane_state->pending.format =3D format;
> +       mtk_plane_state->pending.addr =3D addr;
> +       mtk_plane_state->pending.x =3D new_state->dst.x1;
> +       mtk_plane_state->pending.y =3D new_state->dst.y1;
> +       mtk_plane_state->pending.width =3D drm_rect_width(&new_state->dst=
);
> +       mtk_plane_state->pending.height =3D drm_rect_height(&new_state->d=
st);
> +       mtk_plane_state->pending.rotation =3D new_state->rotation;
> +}
> +
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
>                                           struct drm_atomic_state *state)
>  {
> @@ -126,8 +155,10 @@ static void mtk_plane_atomic_async_update(struct drm=
_plane *plane,
>         plane->state->src_h =3D new_state->src_h;
>         plane->state->src_w =3D new_state->src_w;
>         swap(plane->state->fb, new_state->fb);
> -       new_plane_state->pending.async_dirty =3D true;
>
> +       mtk_plane_update_new_state(new_state, new_plane_state);
> +       wmb(); /* Make sure the above parameters are set before update */
> +       new_plane_state->pending.async_dirty =3D true;
>         mtk_drm_crtc_async_update(new_state->crtc, plane, state);
>  }
>
> @@ -189,14 +220,8 @@ static void mtk_plane_atomic_update(struct drm_plane=
 *plane,
>         struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
>                                                                          =
  plane);
>         struct mtk_plane_state *mtk_plane_state =3D to_mtk_plane_state(ne=
w_state);
> -       struct drm_crtc *crtc =3D new_state->crtc;
> -       struct drm_framebuffer *fb =3D new_state->fb;
> -       struct drm_gem_object *gem;
> -       struct mtk_drm_gem_obj *mtk_gem;
> -       unsigned int pitch, format;
> -       dma_addr_t addr;
>
> -       if (!crtc || WARN_ON(!fb))
> +       if (!new_state->crtc || WARN_ON(!new_state->fb))
>                 return;
>
>         if (!new_state->visible) {
> @@ -204,24 +229,7 @@ static void mtk_plane_atomic_update(struct drm_plane=
 *plane,
>                 return;
>         }
>
> -       gem =3D fb->obj[0];
> -       mtk_gem =3D to_mtk_gem_obj(gem);
> -       addr =3D mtk_gem->dma_addr;
> -       pitch =3D fb->pitches[0];
> -       format =3D fb->format->format;
> -
> -       addr +=3D (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -       addr +=3D (new_state->src.y1 >> 16) * pitch;
> -
> -       mtk_plane_state->pending.enable =3D true;
> -       mtk_plane_state->pending.pitch =3D pitch;
> -       mtk_plane_state->pending.format =3D format;
> -       mtk_plane_state->pending.addr =3D addr;
> -       mtk_plane_state->pending.x =3D new_state->dst.x1;
> -       mtk_plane_state->pending.y =3D new_state->dst.y1;
> -       mtk_plane_state->pending.width =3D drm_rect_width(&new_state->dst=
);
> -       mtk_plane_state->pending.height =3D drm_rect_height(&new_state->d=
st);
> -       mtk_plane_state->pending.rotation =3D new_state->rotation;
> +       mtk_plane_update_new_state(new_state, mtk_plane_state);
>         wmb(); /* Make sure the above parameters are set before update */
>         mtk_plane_state->pending.dirty =3D true;
>  }
> --
> 2.18.0
>
