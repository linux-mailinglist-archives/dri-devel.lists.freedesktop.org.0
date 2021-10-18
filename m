Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC8431911
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 14:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22F89E1D;
	Mon, 18 Oct 2021 12:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1307E89993
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 12:27:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r19so66140451lfe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J4xZ1V6sIJIJ+Q/+6nMHIf3uvE26NRi8/JwSl7yOBJU=;
 b=majwWu1UtAv73DgCB7y6V1IwGwIcHs+gQpglnNQ8dnvbVQol41PmOUgxJZ2hRLm8hm
 qI1DwlAuoCCNdaw/Yvc6DULF+zQ4FiAEIsuHGYagkerk2mCKmdOj6FMFMjgsq+5bM39O
 9HoPDFAmKWA4HoFKuloUK46Kmadc5ZuxnOr2mJzr6EeMQKn6FCVmr9FH6FYxYxEsIEAj
 VkV0Rpy/A0h91gtJ+oQ5Taajo48SYm8aNZ7aCEAIUHkJxopaX5DRO0WBoBy1Jiwn6hEg
 iQMDZIucgfN+rDnFFTfDUehTDVSFIbdv0+pn42xE8r4YLcONTBpWkhDDIYxLiUgWCk6G
 Uv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J4xZ1V6sIJIJ+Q/+6nMHIf3uvE26NRi8/JwSl7yOBJU=;
 b=xIG00rBLNXF7BMKid0mBmuaV0WeFQMQ+E01L9vD5d+1WFHhwqYZ/1RucK2/waOS7gR
 0a7ECcVtdjzi/5kNRRLzlvfl4Jmjgtw1DdwMouxmE2qStCDYM8TA+t2Q62ECgln5D6Lx
 yTFF6frlFSKIojxTff8pDsinyjQAM+8m1fHtkg7E/TB1aHA8EXoHeApYDdALijGU32kd
 xPk2VZ35hybKq6CUZLtkgRQyZphDwqLn3ibi0SW8FoPSTFJG/Hqqi0TcOkfAZvMRrwsa
 Yj2cgdy8U6Rm4yFxEH/z1ktL/QRIKkpCXZvA/JvjWsL8HlCuN4P4JJUKtdrh+B2rsjsA
 m5OA==
X-Gm-Message-State: AOAM530rmBUSVLSBSjL0a6W09kFNUuHJ9DtWhqqUCpxNFSe9Qn6Gmhmf
 uNbqiWjlgcmH485cXC1c3KjsV4tFhRxTWLG8Grc=
X-Google-Smtp-Source: ABdhPJy0LEgxuDkEB1cwtxJ9Ahfr7L4kih4ay2YWrm7OyAGRjGuJZXe/X8FRQbTHGg/WLgaUDYrOKZOLlmGLdB23wX0=
X-Received: by 2002:a05:6512:3401:: with SMTP id
 i1mr16762970lfr.336.1634560069242; 
 Mon, 18 Oct 2021 05:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211015084053.13708-1-tzimmermann@suse.de>
 <20211015084053.13708-8-tzimmermann@suse.de>
In-Reply-To: <20211015084053.13708-8-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 18 Oct 2021 14:27:38 +0200
Message-ID: <CAMeQTsZgjF77eoM8qytB-OUmgQ_QXLzuVgfgmiBOk0RbPm8Z_Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] drm/gma500: Inline psb_gtt_{alloc, free}_range()
 into rsp callers
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

On Fri, Oct 15, 2021 at 10:40 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> psb_gtt_alloc_range() allocates struct gtt_range, create the GTT resource
> and performs some half-baked initialization. Inline the function into its
> only caller psb_gem_create(). For creating the GTT resource, introduce a
> new helper, psb_gtt_alloc_resource() that hides the details of the GTT.
>
> For psb_gtt_free_range(), inline the function into its only caller
> psb_gem_free_object(). While at it, remove the explicit invocation of
> drm_gem_free_mmap_offset(). The mmap offset is already released by
> drm_gem_object_release().
>
> v3:
>         * replace offset[static 1] with pointer notation (Patrik)
>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c | 94 ++++++++++++------------------------
>  drivers/gpu/drm/gma500/gtt.c | 27 +++++++++++
>  drivers/gpu/drm/gma500/gtt.h |  6 +++
>  3 files changed, 65 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 37b61334ade2..425d183c76ca 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -91,30 +91,22 @@ void psb_gem_unpin(struct gtt_range *gt)
>         mutex_unlock(&dev_priv->gtt_mutex);
>  }
>
> -static void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
> -{
> -       /* Undo the mmap pin if we are destroying the object */
> -       if (gt->mmapping) {
> -               psb_gem_unpin(gt);
> -               gt->mmapping = 0;
> -       }
> -       WARN_ON(gt->in_gart && !gt->stolen);
> -       release_resource(&gt->resource);
> -       kfree(gt);
> -}
> -
>  static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
>
>  static void psb_gem_free_object(struct drm_gem_object *obj)
>  {
> -       struct gtt_range *gtt = to_gtt_range(obj);
> +       struct gtt_range *gt = to_gtt_range(obj);
>
> -       /* Remove the list map if one is present */
> -       drm_gem_free_mmap_offset(obj);
>         drm_gem_object_release(obj);
>
> -       /* This must occur last as it frees up the memory of the GEM object */
> -       psb_gtt_free_range(obj->dev, gtt);
> +       /* Undo the mmap pin if we are destroying the object */
> +       if (gt->mmapping)
> +               psb_gem_unpin(gt);
> +
> +       WARN_ON(gt->in_gart && !gt->stolen);
> +
> +       release_resource(&gt->resource);
> +       kfree(gt);
>  }
>
>  static const struct vm_operations_struct psb_gem_vm_ops = {
> @@ -128,59 +120,35 @@ static const struct drm_gem_object_funcs psb_gem_object_funcs = {
>         .vm_ops = &psb_gem_vm_ops,
>  };
>
> -static struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
> -                                            const char *name, int backed, u32 align)
> -{
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct gtt_range *gt;
> -       struct resource *r = dev_priv->gtt_mem;
> -       int ret;
> -       unsigned long start, end;
> -
> -       if (backed) {
> -               /* The start of the GTT is the stolen pages */
> -               start = r->start;
> -               end = r->start + dev_priv->gtt.stolen_size - 1;
> -       } else {
> -               /* The rest we will use for GEM backed objects */
> -               start = r->start + dev_priv->gtt.stolen_size;
> -               end = r->end;
> -       }
> -
> -       gt = kzalloc(sizeof(struct gtt_range), GFP_KERNEL);
> -       if (gt == NULL)
> -               return NULL;
> -       gt->resource.name = name;
> -       gt->stolen = backed;
> -       gt->in_gart = backed;
> -       /* Ensure this is set for non GEM objects */
> -       gt->gem.dev = dev;
> -       ret = allocate_resource(dev_priv->gtt_mem, &gt->resource,
> -                               len, start, end, align, NULL, NULL);
> -       if (ret == 0) {
> -               gt->offset = gt->resource.start - r->start;
> -               return gt;
> -       }
> -       kfree(gt);
> -       return NULL;
> -}
> -
>  struct gtt_range *
>  psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align)
>  {
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
>         struct gtt_range *gt;
>         struct drm_gem_object *obj;
>         int ret;
>
>         size = roundup(size, PAGE_SIZE);
>
> -       gt = psb_gtt_alloc_range(dev, size, name, stolen, align);
> -       if (!gt) {
> -               dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
> -               return ERR_PTR(-ENOSPC);
> -       }
> +       gt = kzalloc(sizeof(*gt), GFP_KERNEL);
> +       if (!gt)
> +               return ERR_PTR(-ENOMEM);
>         obj = &gt->gem;
>
> +       /* GTT resource */
> +
> +       ret = psb_gtt_allocate_resource(dev_priv, &gt->resource, name, size, align, stolen,
> +                                       &gt->offset);
> +       if (ret)
> +               goto err_kfree;
> +
> +       if (stolen) {
> +               gt->stolen = true;
> +               gt->in_gart = 1;
> +       }
> +
> +       /* GEM object */
> +
>         obj->funcs = &psb_gem_object_funcs;
>
>         if (stolen) {
> @@ -188,7 +156,7 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
>         } else {
>                 ret = drm_gem_object_init(dev, obj, size);
>                 if (ret)
> -                       goto err_psb_gtt_free_range;
> +                       goto err_release_resource;
>
>                 /* Limit the object to 32-bit mappings */
>                 mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
> @@ -196,8 +164,10 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
>
>         return gt;
>
> -err_psb_gtt_free_range:
> -       psb_gtt_free_range(dev, gt);
> +err_release_resource:
> +       release_resource(&gt->resource);
> +err_kfree:
> +       kfree(gt);
>         return ERR_PTR(ret);
>  }
>
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 0aacf7122e32..d00ca065f3d3 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -18,6 +18,33 @@
>   *     GTT resource allocator - manage page mappings in GTT space
>   */
>
> +int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
> +                             const char *name, resource_size_t size, resource_size_t align,
> +                             bool stolen, u32 *offset)
> +{
> +       struct resource *root = pdev->gtt_mem;
> +       resource_size_t start, end;
> +       int ret;
> +
> +       if (stolen) {
> +               /* The start of the GTT is backed by stolen pages. */
> +               start = root->start;
> +               end = root->start + pdev->gtt.stolen_size - 1;
> +       } else {
> +               /* The rest is backed by system pages. */
> +               start = root->start + pdev->gtt.stolen_size;
> +               end = root->end;
> +       }
> +
> +       res->name = name;
> +       ret = allocate_resource(root, res, size, start, end, align, NULL, NULL);
> +       if (ret)
> +               return ret;
> +       *offset = res->start - root->start;
> +
> +       return 0;
> +}
> +
>  /**
>   *     psb_gtt_mask_pte        -       generate GTT pte entry
>   *     @pfn: page number to encode
> diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
> index 36162b545570..6f3808e29059 100644
> --- a/drivers/gpu/drm/gma500/gtt.h
> +++ b/drivers/gpu/drm/gma500/gtt.h
> @@ -10,6 +10,8 @@
>
>  #include <drm/drm_gem.h>
>
> +struct drm_psb_private;
> +
>  /* This wants cleaning up with respect to the psb_dev and un-needed stuff */
>  struct psb_gtt {
>         uint32_t gatt_start;
> @@ -43,6 +45,10 @@ struct gtt_range {
>
>  extern int psb_gtt_restore(struct drm_device *dev);
>
> +int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
> +                             const char *name, resource_size_t size, resource_size_t align,
> +                             bool stolen, u32 *offset);
> +
>  int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
>  void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
>
> --
> 2.33.0
>
