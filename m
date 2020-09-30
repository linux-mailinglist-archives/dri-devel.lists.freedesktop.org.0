Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF93227E0AE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 07:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BCA6E4DD;
	Wed, 30 Sep 2020 05:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284DB6E4DD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 05:54:04 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id c17so382768ybe.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BcvnMjWpl7DioAOBXECd/HmpBzH9iI266r7S09tfCkY=;
 b=Jbj0ytqfNyDN8FMXg1mZTpL9yaHkmNV7t41EpYEPw1IYqb4q8db9aBpG3Qt+mudkud
 9T/o7KTzg0nSDiqwpzcCixjIhs0ZovNbK368qkpbGT4ughzc0NfOSNdjf/s81IJ/g7SS
 GOY+4eejepJsBrVAZ4DfTIdy5+pZqhz5qHgiY46WxMT9Uso9puDmMuIIssJ3LZzOKGzL
 ++CfIJeZl8sQoRrFEjb9xjkHvBycuH+lk2KHVw4EFDV/Btf2/Rpg8NKg+8nb06NEUrdm
 11b/SuvGWRl2MVat+s34wpqrr8ultnLna7zaGXtLElMG4mkQPWLEHRBTFQ7b5t0A73rO
 SwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BcvnMjWpl7DioAOBXECd/HmpBzH9iI266r7S09tfCkY=;
 b=PT3XGyHG0oHCaMcXN6pVYLEIaeuep4jOVYEWsWWALSRBne2GxTP3NUnp5XanvBIzdu
 EURXFkAiIOqOVxwOkjK9DRnqzmVLRtyA3a3lZM9Hez5r27qBTwFR7RhRvctP9KKoi+c6
 Lkyf7S+X1InC8/Wc2RXyXQ3dmx1Pe/Rqk0TIs4Goi7iUsbsCuMiK6HP6Z30pvTlw9+HM
 D67zjrRphYaHwj0yvhJ4KGtUrlv39FKt+8W2caqxKtXWs6Txooqg+ZTwr1wsYon1gmcN
 /JsUpFQvUwdzXqm+ZDF40D37xf78uesJ1qscXahOYQCbs+XYNYKnlY+Jit9pwm5mg0dW
 gyOw==
X-Gm-Message-State: AOAM533Lbe4wvxkufkNTK8rw5ZYn3o0N/x5ZEdpjwWgZjUE9oj05vNWC
 glrw+yLj0oMhY1uQ+yfTebQSGKoBA9GRQLKLzzLJAPT+P7Y=
X-Google-Smtp-Source: ABdhPJymvOZ/UlT8uFQncMN6TpU1ZvuK8ZYyMvtFS7kwvvEurOF6C8n5t52gwOcjK2jCtsNE/x/i4JLZg3j6XnTTSI0=
X-Received: by 2002:a25:6994:: with SMTP id e142mr1117617ybc.470.1601445243365; 
 Tue, 29 Sep 2020 22:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-19-airlied@gmail.com>
In-Reply-To: <20200924051845.397177-19-airlied@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 30 Sep 2020 15:53:52 +1000
Message-ID: <CACAvsv7NH-nj9Y07hr-Of-8Sv8w44Yq3KD6jtJQQR86gPYhgUA@mail.gmail.com>
Subject: Re: [PATCH 18/45] drm/nouveau: handle move notify inside move
 callback.
To: Dave Airlie <airlied@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Sep 2020 at 15:20, Dave Airlie <airlied@gmail.com> wrote:
>
> From: Dave Airlie <airlied@redhat.com>
>
> Don't use explicit move notify for moves just do it in the driver side.
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 62 ++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 1e6c2561d692..144b82db16ac 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -970,38 +970,42 @@ nouveau_bo_move_flips(struct ttm_buffer_object *bo, bool evict,
>  }
>
>  static void
> -nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
> -                    struct ttm_resource *new_reg)
> +nouveau_bo_vma_map_update(struct nouveau_bo *nvbo,
> +                         uint32_t mem_type,
> +                         struct nouveau_mem *mem)
>  {
> -       struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
> -       struct nouveau_bo *nvbo = nouveau_bo(bo);
>         struct nouveau_vma *vma;
>
> -       /* ttm can now (stupidly) pass the driver bos it didn't create... */
> -       if (bo->destroy != nouveau_bo_del_ttm)
> -               return;
> -
> -       nouveau_bo_del_io_reserve_lru(bo);
> -
> -       if (mem && new_reg->mem_type != TTM_PL_SYSTEM &&
> +       if (mem && mem_type != TTM_PL_SYSTEM &&
>             mem->mem.page == nvbo->page) {
>                 list_for_each_entry(vma, &nvbo->vma_list, head) {
>                         nouveau_vma_map(vma, mem);
>                 }
>         } else {
>                 list_for_each_entry(vma, &nvbo->vma_list, head) {
> -                       WARN_ON(ttm_bo_wait(bo, false, false));
> +                       WARN_ON(ttm_bo_wait(&nvbo->bo, false, false));
I can look at this more closely myself a bit down the track, as I need
to do a lot in this area in the near future anyway, but it'd be nice
to pass the failure back here where possible to do so.  The new
invalidate_notify() hook still can't fail, but the other uses can and
it'd be nice to do the right thing where it's possible.

Ben.

>                         nouveau_vma_unmap(vma);
>                 }
>         }
> +}
>
> -       if (new_reg) {
> -               if (new_reg->mm_node)
> -                       nvbo->offset = (new_reg->start << PAGE_SHIFT);
> -               else
> -                       nvbo->offset = 0;
> -       }
> +static void
> +nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, bool evict,
> +                    struct ttm_resource *new_reg)
> +{
> +       struct nouveau_bo *nvbo = nouveau_bo(bo);
> +
> +       /* ttm can now (stupidly) pass the driver bos it didn't create... */
> +       if (bo->destroy != nouveau_bo_del_ttm)
> +               return;
> +
> +       /* handle new_reg path in move */
> +       if (new_reg)
> +               return;
> +
> +       nouveau_bo_del_io_reserve_lru(bo);
>
> +       nouveau_bo_vma_map_update(nvbo, 0, NULL);
>  }
>
>  static int
> @@ -1038,6 +1042,20 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>         *old_tile = new_tile;
>  }
>
> +
> +static void
> +nouveau_bo_update_mem(struct nouveau_bo *nvbo,
> +                     struct ttm_resource *new_reg)
> +{
> +       nouveau_bo_vma_map_update(nvbo, new_reg->mem_type, nouveau_mem(new_reg));
> +       if (new_reg) {
> +               if (new_reg->mm_node)
> +                       nvbo->offset = (new_reg->start << PAGE_SHIFT);
> +               else
> +                       nvbo->offset = 0;
> +       }
> +}
> +
>  static int
>  nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>                 struct ttm_operation_ctx *ctx,
> @@ -1053,6 +1071,9 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>         if (ret)
>                 return ret;
>
> +       nouveau_bo_del_io_reserve_lru(bo);
> +       nouveau_bo_update_mem(nvbo, new_reg);
> +
>         if (nvbo->bo.pin_count)
>                 NV_WARN(drm, "Moving pinned object %p!\n", nvbo);
>
> @@ -1108,6 +1129,11 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>                         nouveau_bo_vm_cleanup(bo, new_tile, &nvbo->tile);
>         }
>
> +       if (ret) {
> +               nouveau_bo_del_io_reserve_lru(bo);
> +               nouveau_bo_update_mem(nvbo, &bo->mem);
> +       }
> +
>         return ret;
>  }
>
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
