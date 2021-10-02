Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5C41FE6A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B276E44D;
	Sat,  2 Oct 2021 22:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534BD6E44D
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:14:55 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y26so54132587lfa.11
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VuuhUW5V0PJiSeLd5x+axUedWJsqS6MtzmBJrMRiQH8=;
 b=IG0Nmr22HnAAW+vfJP+8XAC1zlHCYSEq3GQFa745tPxNl27OsNWKEzM7uhPUmWuHCp
 /bfCT5NNc+GNTG2OdJ4bIf4DIXCCl/8Umn3a/rbEwraTCRnMYmCryVpR1Phce2mSqLgu
 3AXsWQGSLuYEX31uYHlu5xt0gtFrOH8mUW4l7iB+/R8W/n4e24jCoOLblXuAqoso7IJ0
 yVQsJgDWZBNNSwvHR6tLiOkxqIV0dX+bx69te9KxIMRTp+kQ7r0ud/9un1uNk6PazuW0
 aGO1ylpVOoG6Ldn6j83P9H+Ej35cnVKwAlt8cnC1Wk4rw6dID+RiVZSVPN0IvTDGFlSG
 y3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuuhUW5V0PJiSeLd5x+axUedWJsqS6MtzmBJrMRiQH8=;
 b=aVA2ZJ7iVJJ/XgmFzBMs+irhTW17s4H5SapaDyEwW7fKsiQywhKb9BVZXOZqiv6vua
 KakSyG76Ja67lD9EHhfTgvbBWDggqttXPbNLMzjVsLSFFrGLrMiup9/mWZo5g+mQ3zqD
 M7+BFzSBjEyEDHpXVRLu9T+Y72B2fcdRbiQIm4GrA9E/HdI39zWYWvmhnndyfamDHmvU
 kXNzgH7yg/H22Ah7w0wKDREtE2V8TamCCRq9DkE/UmqCuZCejn6LDSNxxEHotNBZ+qMy
 cLY5+ZizjNa8DjLmyNy5/TKEuUecfRqzsvULPF4VMiYxs8AA2kZeEPlk/lKgu2FqHBFs
 FoBw==
X-Gm-Message-State: AOAM5309wEp43VntacLvb8rIC8KgqXpB/AeWbVKdwLVA89IYWlm/pQE+
 uDeS5qv0IUM5gmxhtpzSJnSIITzmrjxwuEh/mzY=
X-Google-Smtp-Source: ABdhPJxjE1OieZBcn7cMlaiprq7mTwDFzL3ILPV/Wku4IgZ3IXE3/Bp7m6n3iD3LnPAU4rMn9Lswdi6HmZjTTPnG93Q=
X-Received: by 2002:ac2:4c48:: with SMTP id o8mr5837359lfk.196.1633212893591; 
 Sat, 02 Oct 2021 15:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-8-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-8-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:14:42 +0200
Message-ID: <CAMeQTsYLfqiZ4CXG-gsqYbr5=xQOh5yVTWu17AL2m0go-nkNaQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gma500: Inline psb_gtt_{alloc,free}_range()
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

On Tue, Sep 28, 2021 at 10:44 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c | 94 ++++++++++++------------------------
>  drivers/gpu/drm/gma500/gtt.c | 27 +++++++++++
>  drivers/gpu/drm/gma500/gtt.h |  6 +++
>  3 files changed, 65 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index a48d7d5ed026..46209e10dcc2 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -87,30 +87,22 @@ void psb_gem_unpin(struct gtt_range *gt)
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
> @@ -124,59 +116,35 @@ static const struct drm_gem_object_funcs psb_gem_object_funcs = {
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
> @@ -184,7 +152,7 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
>         } else {
>                 ret = drm_gem_object_init(dev, obj, size);
>                 if (ret)
> -                       goto err_psb_gtt_free_range;
> +                       goto err_release_resource;
>
>                 /* Limit the object to 32-bit mappings */
>                 mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
> @@ -192,8 +160,10 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
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
> index 0aacf7122e32..5d940fdbe6b8 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -18,6 +18,33 @@
>   *     GTT resource allocator - manage page mappings in GTT space
>   */
>
> +int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
> +                             const char *name, resource_size_t size, resource_size_t align,
> +                             bool stolen, u32 offset[static 1])

Why [static 1]?


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
> index 36162b545570..459a03141e8b 100644
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
> +                             bool stolen, u32 offset[static 1]);
> +
>  int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
>  void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
>
> --
> 2.33.0
>
