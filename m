Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDF9522B9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2726510E52A;
	Wed, 14 Aug 2024 19:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RpmQPgbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741DD10E52A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 19:35:47 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-690b6cbce11so2920347b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723664146; x=1724268946;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXKYkmuG/SU6rLkPPinW1g80glKtRtQVhMpRCtKKj8A=;
 b=RpmQPgbd/5BjvIn5hn1WYu3MrIQkTz4iQ8uF9WKhw4Wi0LWC1xWqyCScA0sSbi68C1
 677iIJWQHMLytZ0K1ZTwziwduzlrRCBdWE7zh2vZ8zRvHQGrvTNWcZerQ2LEWBZS37re
 VikKtf6xp14nagkS7/kpHhA7CZ6nnPqR6nv2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723664146; x=1724268946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXKYkmuG/SU6rLkPPinW1g80glKtRtQVhMpRCtKKj8A=;
 b=kWOIrLCp5Q8PjlNHi5y/8YtJr+bX9RfzK55eaZmoRQ4QnXlTFgzRaZDxhWw5klhIm8
 xOO1a2TTMjTFx/Ra4cpyOP/mqwYZ9P9oNNNTVItmoU+Tul5swvZu95wcpwzQmUjsznvC
 IeytF0ayme1SzCUIjzglshYQwwhaTU4y+0wfEbfgez9Ywg6+DYtF8QS/HO+Yq2ff6GDn
 XN60DU0zqWp/8uxAXsafn39+N8rol3XLVecDxxIKrYW3s6/f1od9m2VE1VdttXrLlHlx
 iX1CyCy5mgyfXSa2nyV7xD39W+NbrOv6y4MgB+tZp1Bt9NRH10FPzONkXjLe/VESoCtm
 t8hA==
X-Gm-Message-State: AOJu0Ywv9DKhTy2HBj/kxO2C72/TqgPitFZ/RzPsnQIoViA/TDetRk6n
 9nAMBiujoMa7PK8ycqxfXiTpMpHOhwT9uv4FJ+yMCmzQ1OXjx0WKTX09vBoAiAyQsQlNzLELZGq
 Lj8UUDfEzQuVOMSTDK3UJEqM1SavJiS9RXvA6
X-Google-Smtp-Source: AGHT+IE7lpozbo57felRmsSQr4ai2rs4R3ER9HGxXfX32TS2VRfQKIj+17yMahwS4vWORjT4Ir13rVg9MI6jY42fexo=
X-Received: by 2002:a05:690c:578f:b0:6af:5295:6673 with SMTP id
 00721157ae682-6af5295692fmr3468097b3.28.1723664146311; Wed, 14 Aug 2024
 12:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240814192824.56750-1-zack.rusin@broadcom.com>
In-Reply-To: <20240814192824.56750-1-zack.rusin@broadcom.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Wed, 14 Aug 2024 14:35:36 -0500
Message-ID: <CAO6MGti4NYG8-kqUb2+xmQkQc7eJGsGcxa+YJ6Xt5pUf1CgY7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 martin.krastev@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

Looks Good
Thanks,

Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>

On Wed, Aug 14, 2024 at 2:28=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> The kms paths keep a persistent map active to read and compare the cursor
> buffer. These maps can race with each other in simple scenario where:
> a) buffer "a" mapped for update
> b) buffer "a" mapped for compare
> c) do the compare
> d) unmap "a" for compare
> e) update the cursor
> f) unmap "a" for update
> At step "e" the buffer has been unmapped and the read contents is bogus.
>
> Prevent unmapping of active read buffers by simply keeping a count of
> how many paths have currently active maps and unmap only when the count
> reaches 0.
>
> v2: Update doc strings
>
> Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorByp=
ass 4")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.19+
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 13 +++++++++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h |  3 +++
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index f42ebc4a7c22..a0e433fbcba6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -360,6 +360,8 @@ void *vmw_bo_map_and_cache_size(struct vmw_bo *vbo, s=
ize_t size)
>         void *virtual;
>         int ret;
>
> +       atomic_inc(&vbo->map_count);
> +
>         virtual =3D ttm_kmap_obj_virtual(&vbo->map, &not_used);
>         if (virtual)
>                 return virtual;
> @@ -383,11 +385,17 @@ void *vmw_bo_map_and_cache_size(struct vmw_bo *vbo,=
 size_t size)
>   */
>  void vmw_bo_unmap(struct vmw_bo *vbo)
>  {
> +       int map_count;
> +
>         if (vbo->map.bo =3D=3D NULL)
>                 return;
>
> -       ttm_bo_kunmap(&vbo->map);
> -       vbo->map.bo =3D NULL;
> +       map_count =3D atomic_dec_return(&vbo->map_count);
> +
> +       if (!map_count) {
> +               ttm_bo_kunmap(&vbo->map);
> +               vbo->map.bo =3D NULL;
> +       }
>  }
>
>
> @@ -421,6 +429,7 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
>         vmw_bo->tbo.priority =3D 3;
>         vmw_bo->res_tree =3D RB_ROOT;
>         xa_init(&vmw_bo->detached_resources);
> +       atomic_set(&vmw_bo->map_count, 0);
>
>         params->size =3D ALIGN(params->size, PAGE_SIZE);
>         drm_gem_private_object_init(vdev, &vmw_bo->tbo.base, params->size=
);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index 62b4342d5f7c..43b5439ec9f7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -71,6 +71,8 @@ struct vmw_bo_params {
>   * @map: Kmap object for semi-persistent mappings
>   * @res_tree: RB tree of resources using this buffer object as a backing=
 MOB
>   * @res_prios: Eviction priority counts for attached resources
> + * @map_count: The number of currently active maps. Will differ from the
> + * cpu_writers because it includes kernel maps.
>   * @cpu_writers: Number of synccpu write grabs. Protected by reservation=
 when
>   * increased. May be decreased without reservation.
>   * @dx_query_ctx: DX context if this buffer object is used as a DX query=
 MOB
> @@ -90,6 +92,7 @@ struct vmw_bo {
>         u32 res_prios[TTM_MAX_BO_PRIORITY];
>         struct xarray detached_resources;
>
> +       atomic_t map_count;
>         atomic_t cpu_writers;
>         /* Not ref-counted.  Protected by binding_mutex */
>         struct vmw_resource *dx_query_ctx;
> --
> 2.43.0
>
