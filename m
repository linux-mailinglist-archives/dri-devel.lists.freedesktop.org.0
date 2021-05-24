Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1243B38F2D0
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021E86E8E4;
	Mon, 24 May 2021 18:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371E36E8E4;
 Mon, 24 May 2021 18:17:27 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id i67so27890240qkc.4;
 Mon, 24 May 2021 11:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zz2kzbTbqN0tBzO+PKLu6ifHzrufowezQwfak2ww1Ig=;
 b=EefU6263Ep7gXqDnVGC8nInBnPn2z3qkc3LoaRC6G6u1UAVxdxdf0CkUtXs2NFPg3e
 QJ2yKg5IRVjr+DsY9KSi82Svv53h75TrBjhCdmkQx7N+8dje8pYR7ENrG64XuTAxodm8
 NA9oKx8A0+TfCv5UHZUWDE+cWB5ZQazNVvSng+ZL/1jhMnkevbP/t56t9YLy8yy31cAF
 3YIw3qd2ibFb/z16CmGZ67gEyRfTeDrSC/z4T0lAGgKuPS8IW5iEeTf+ryJjuxZoIHXN
 E1wfResmSpLAsRUDGW0ZrvBMGfrbpypZXzldD0J8BBz7CjzCNseHWegyTLlEBA3k737t
 Rt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zz2kzbTbqN0tBzO+PKLu6ifHzrufowezQwfak2ww1Ig=;
 b=m98eq8Vrs/IaIQFmOQ6q1LWdUPuFAnDmkUIM7zDXN1u7RfDafUpNWoSPIMYTO9JIGa
 D3Z2Kl6I00F0PZERKPVPxBoEkpxDKVCY7K4C3T/p78IIZO1ReeAIaaInjEMkj/NzKn6F
 nTbgX3mWZSIfXrkxf7lT46VCAybQRvbWZ5AxYCXniCO5UT2CF27FT9+WOraymv11CCCH
 qVRZ56DzePRDhJ8jp5yHEgFHiWy39eiNMZqO0KAtHwc8cIQKDvBFx+nfm9yMupVOoik6
 SE/JD9fDcRU+ZwLrG43DKpJr1lmRivw1WdDNYXeIchuM34f/lYMrfsk0Sw0JBZ4BnKu4
 9D5Q==
X-Gm-Message-State: AOAM5328JELfgwd8Hc2rNvkM1JxrD31U1A+US/ywjFL492Kd8pSxrpoo
 XDWpBf8RZpRzQqVZmZPZvM9O3WzMdpB1blXukmo=
X-Google-Smtp-Source: ABdhPJxmEby7VC5D+jGrC1HjK0Rf6WREu2FbMVwYZG8mYAMpsojLQ+rXGxYU1M5hUfSgIjMYI4hNcta7+mQ2Ud5ldtk=
X-Received: by 2002:a37:ac0d:: with SMTP id e13mr26497329qkm.426.1621880246340; 
 Mon, 24 May 2021 11:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-9-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210521153253.518037-9-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 24 May 2021 19:16:59 +0100
Message-ID: <CAM0jSHNP4NNQknBWLqn8h5kapcxVhAgwjjg3yQ9wDfYb41q92A@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] drm/ttm: Use drm_memcpy_from_wc_dbm for TTM bo
 moves
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 May 2021 at 16:33, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Use fast wc memcpy for reading out of wc memory for TTM bo moves.
>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 912cbe8e60a2..4a7d3d672f9a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -31,6 +31,7 @@
>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
> +#include <drm/drm_memcpy.h>
>  #include <drm/drm_vma_manager.h>
>  #include <linux/dma-buf-map.h>
>  #include <linux/io.h>
> @@ -91,6 +92,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>         const struct ttm_kmap_iter_ops *src_ops =3D src_iter->ops;
>         struct ttm_tt *ttm =3D bo->ttm;
>         struct dma_buf_map src_map, dst_map;
> +       bool wc_memcpy;
>         pgoff_t i;
>
>         /* Single TTM move. NOP */
> @@ -114,11 +116,16 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo,
>                 return;
>         }
>
> +       wc_memcpy =3D ((!src_ops->maps_tt || ttm->caching !=3D ttm_cached=
) &&

Why do we only consider the caching value for the maps_tt case? Or am
I misreading this?

> +                    drm_has_memcpy_from_wc());
> +
>         for (i =3D 0; i < dst_mem->num_pages; ++i) {
>                 dst_ops->map_local(dst_iter, &dst_map, i);
>                 src_ops->map_local(src_iter, &src_map, i);
>
> -               if (!src_map.is_iomem && !dst_map.is_iomem) {
> +               if (wc_memcpy) {
> +                       drm_memcpy_from_wc_dbm(&dst_map, &src_map, PAGE_S=
IZE);

Do we need to check the return value here? memcpy_from_wc expects
certain address alignment, or is that always guaranteed here? Maybe
throw a warning just for paranoia?

> +               } else if (!src_map.is_iomem && !dst_map.is_iomem) {
>                         memcpy(dst_map.vaddr, src_map.vaddr, PAGE_SIZE);
>                 } else if (!src_map.is_iomem) {
>                         dma_buf_map_memcpy_to(&dst_map, src_map.vaddr,
> --
> 2.31.1
>
