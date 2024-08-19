Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89E956CBF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C008E10E27F;
	Mon, 19 Aug 2024 14:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Hdg8jbyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D9410E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:09:47 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-81fd1e05a5aso188068739f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724076586; x=1724681386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swVfMfyxOr5BO79YIGcnKk6lTV20lDYKD6a7JRV6Zqk=;
 b=Hdg8jbyu0x/FU0ZLijHPn/L7ml+F6TOAi/rfUVHxrrgKT8mYJjPwB1iesSV4y4pM8V
 nfdkZQuhVWlE3qyCpt+ID0aMgY5jR2FSVZpENYiadfdsmA5EEEarzT0VNH+ogkvh5xiA
 UPvrM6djxnzDpLrx2qf5LoVIsBgE3D+vmB+OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724076586; x=1724681386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swVfMfyxOr5BO79YIGcnKk6lTV20lDYKD6a7JRV6Zqk=;
 b=aHxVUlVHqY6wcO2iSqY5KVlj46+Cizuy3YtsdUZQDipC7lK13B4HPV54lMVN4UhNtQ
 detzYDm65OR5I5LDbPr+4TR7fGpReVPRgPATLt3oZudGE5KPCq1IVC2hL5kU6/7xH5O9
 jjxBk5OmVdw5ktFBZ8AmbyxRGf/IdL2MIWCgvX5f+vs3b2GSLJjpB3URqALS0chcKfIm
 d7g/OwbPiFSj+FENJPyyGFwj6GJDuj4drymLv0qupfBcc4WWvrPnUKprmBgRRy0Rw5pe
 +9VFivZF0PXYJZX6xp0n/0jNPjVe9bNC9ksTevxziEgJoTfcTE0lzOwD1Wa0jrlfzkGW
 +84g==
X-Gm-Message-State: AOJu0Ywv+LfK2zHYu8oQqp5UwXGaKmYNCBKtIG3cFs2isoK6yodBjUt1
 wquHOI8JFXxcffQAGezICjlRo//lhvmXWNEwUVqDjDVzYfxL097nUCm+bk/ykPCwaPiwZhKEBG/
 cnTuwv32MIYFemtqWQr9Beg27PU0W6zy5Soqb
X-Google-Smtp-Source: AGHT+IF6F9x5DMW8ub4NKkAEYOfJWjZ7TcVM6VSK7bhktOE29lZYxUahzZgSlMmo6cSvAarIAawkJsxO1rOMFrEBfDg=
X-Received: by 2002:a05:6602:15d5:b0:803:c955:eda8 with SMTP id
 ca18e2360f4ac-824fe1b254amr978450439f.6.1724076586170; Mon, 19 Aug 2024
 07:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240815153404.630214-1-zack.rusin@broadcom.com>
In-Reply-To: <20240815153404.630214-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 19 Aug 2024 17:09:35 +0300
Message-ID: <CAKLwHdVK=tkrWum2q46y9HETSCD+2tOafz19dz2Xee+ZHvLzYQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/vmwgfx: Prevent unmapping active read buffers
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
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

On Thu, Aug 15, 2024 at 6:34=E2=80=AFPM Zack Rusin <zack.rusin@broadcom.com=
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

LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
