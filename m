Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7941FE66
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1340B6E042;
	Sat,  2 Oct 2021 22:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1336E042
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:13:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i25so53813896lfg.6
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PQ9rDxGkZ/nC9w9XyA3Z0nup3/Xg+RTAFrCGeTWPcw=;
 b=NwfjhLCiYEhAizHQjqvOZWaW9Out6/5dDXHFMSeN5Q7W3SG+CoQ0yUInPM/8C759+m
 96SdhefzprnShMktj304d7sBMbmrFYXfEhRyicYi0iOQtbyO1smUz0xHgeApGpKkc9wr
 rilbcMhHmLyyDQl2kx8PIZ2fdnrftvPYo5wpI+ic795EWGd+fresILGFwz9GnVTukwMK
 5t5x2D1giw21y4qJav1L4fdOErQC5H2pArvjvMejkKNqddoSZhFo0Xfp/E7fkfzryCiV
 TnmiH89xjAJzJ1dEs+jaCyaonzzzSsbAk1zOHskErIGJE9qiN//C3o+eUEcWyUn6cHD2
 //Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PQ9rDxGkZ/nC9w9XyA3Z0nup3/Xg+RTAFrCGeTWPcw=;
 b=qgZdjyxFM2gyMIIvxU1s+SylEK3CSrsMnzrv1RFM8oeMXLmmvHbKX3pG0g3tuWsVdW
 /QLRncQFsqnEfZsLM5xxrbo2s3tz4MNCkktbEggBo2lCYcYkTV6nVaG1tnQUjkpo8fr5
 nCkNEhyZYlkcS+ajXYaSIKjYI0EPjKB98tal7A4QTLzza+dy8WTfGilAnRgKasvLn/Kt
 Uju/YCpJ/fGljmCkLhUlAHJ30i+6AcHgSW0Jqy/BxenwrB8aKQ9919/PIZlm5IjQ1ykz
 EFVSnN5WevZ4NB/LJlfpRiacyd6Tu43DWtmiRotBS8NcHnA7kZme2wkS+VqxvgSvzg2b
 9X+w==
X-Gm-Message-State: AOAM533UTdxl83bNMqgEePvPO9wo3/quPZYzFOGoxlltOxSiU8RBqfLU
 k6SIrvl2ieF8zpxBCqaXQdiJvpdqWZMErwzusBQ=
X-Google-Smtp-Source: ABdhPJyuHoDP3auSRIBlC8GTHGFlPgiBus9Njfqpe9s4IDYXot0scpJD7ftFTcelHrCbN1mVJ8QmhWbXHt74JFGKkCk=
X-Received: by 2002:a05:6512:610:: with SMTP id
 b16mr5607937lfe.56.1633212823751; 
 Sat, 02 Oct 2021 15:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-4-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-4-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:13:32 +0200
Message-ID: <CAMeQTsaNJisxQOX0su63A76LrJWMrw2r2JSCNBek54-sZnb-4w@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/gma500: Reimplement psb_gem_create()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Sep 28, 2021 at 10:44 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Implement psb_gem_create() for general use. Create the GEM handle in
> psb_gem_create_dumb(). Allows to use psb_gem_create() for creating all
> of the GEM objects.
>
> While at it, clean-up drm_gem_dumb_create() to make it more readable.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> ---
>  drivers/gpu/drm/gma500/gem.c | 93 ++++++++++++++++++++++--------------
>  drivers/gpu/drm/gma500/gem.h |  4 +-
>  2 files changed, 59 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index ff2c1d64689e..8f4bcf9cf912 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -164,45 +164,36 @@ struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
>         return NULL;
>  }
>
> -int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
> -                  u32 *handlep, int stolen, u32 align)
> +struct gtt_range *
> +psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align)
>  {
> -       struct gtt_range *r;
> +       struct gtt_range *gt;
> +       struct drm_gem_object *obj;
>         int ret;
> -       u32 handle;
>
>         size = roundup(size, PAGE_SIZE);
>
> -       /* Allocate our object - for now a direct gtt range which is not
> -          stolen memory backed */
> -       r = psb_gtt_alloc_range(dev, size, "gem", 0, PAGE_SIZE);
> -       if (r == NULL) {
> +       gt = psb_gtt_alloc_range(dev, size, name, stolen, align);
> +       if (!gt) {
>                 dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
> -               return -ENOSPC;
> +               return ERR_PTR(-ENOSPC);
>         }
> -       r->gem.funcs = &psb_gem_object_funcs;
> -       /* Initialize the extra goodies GEM needs to do all the hard work */
> -       if (drm_gem_object_init(dev, &r->gem, size) != 0) {
> -               psb_gtt_free_range(dev, r);
> -               /* GEM doesn't give an error code so use -ENOMEM */
> -               dev_err(dev->dev, "GEM init failed for %lld\n", size);
> -               return -ENOMEM;
> -       }
> -       /* Limit the object to 32bit mappings */
> -       mapping_set_gfp_mask(r->gem.filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
> -       /* Give the object a handle so we can carry it more easily */
> -       ret = drm_gem_handle_create(file, &r->gem, &handle);
> -       if (ret) {
> -               dev_err(dev->dev, "GEM handle failed for %p, %lld\n",
> -                                                       &r->gem, size);
> -               drm_gem_object_release(&r->gem);
> -               psb_gtt_free_range(dev, r);
> -               return ret;
> -       }
> -       /* We have the initial and handle reference but need only one now */
> -       drm_gem_object_put(&r->gem);
> -       *handlep = handle;
> -       return 0;
> +       obj = &gt->gem;
> +
> +       obj->funcs = &psb_gem_object_funcs;
> +
> +       ret = drm_gem_object_init(dev, obj, size);
> +       if (ret)
> +               goto err_psb_gtt_free_range;
> +
> +       /* Limit the object to 32-bit mappings */
> +       mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
> +
> +       return gt;
> +
> +err_psb_gtt_free_range:
> +       psb_gtt_free_range(dev, gt);
> +       return ERR_PTR(ret);
>  }
>
>  /**
> @@ -218,10 +209,40 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
>  int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>                         struct drm_mode_create_dumb *args)
>  {
> -       args->pitch = ALIGN(args->width * ((args->bpp + 7) / 8), 64);
> -       args->size = args->pitch * args->height;
> -       return psb_gem_create(file, dev, args->size, &args->handle, 0,
> -                             PAGE_SIZE);
> +       size_t pitch, size;
> +       struct gtt_range *gt;
> +       struct drm_gem_object *obj;
> +       u32 handle;
> +       int ret;
> +
> +       pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
> +       pitch = ALIGN(pitch, 64);
> +
> +       size = pitch * args->height;
> +       size = roundup(size, PAGE_SIZE);
> +       if (!size)
> +               return -EINVAL;
> +
> +       gt = psb_gem_create(dev, size, "gem", false, PAGE_SIZE);
> +       if (IS_ERR(gt))
> +               return PTR_ERR(gt);
> +       obj = &gt->gem;
> +
> +       ret = drm_gem_handle_create(file, obj, &handle);
> +       if (ret)
> +               goto err_drm_gem_object_put;
> +
> +       drm_gem_object_put(obj);
> +
> +       args->pitch = pitch;
> +       args->size = size;
> +       args->handle = handle;
> +
> +       return 0;
> +
> +err_drm_gem_object_put:
> +       drm_gem_object_put(obj);
> +       return ret;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
> index 275494aedd4c..ad76127dc719 100644
> --- a/drivers/gpu/drm/gma500/gem.h
> +++ b/drivers/gpu/drm/gma500/gem.h
> @@ -14,8 +14,8 @@ struct drm_device;
>
>  extern const struct drm_gem_object_funcs psb_gem_object_funcs;
>
> -extern int psb_gem_create(struct drm_file *file, struct drm_device *dev,
> -                         u64 size, u32 *handlep, int stolen, u32 align);
> +struct gtt_range *
> +psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align);
>
>  struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len, const char *name,
>                                       int backed, u32 align);
> --
> 2.33.0
>
