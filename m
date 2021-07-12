Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333703C5E7D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA8289857;
	Mon, 12 Jul 2021 14:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206489857
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:38:40 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n4so1161004wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uHEv0lGE/C2eCMruQ3ng+6P6t/nY6L6JozLU5zKKMRo=;
 b=ksOgn0OaMzIbUOmjywphIXa2CJ5rVxQ1g716B3Zn/cCO9aZgaePYfKl4mBYj9BPzdl
 c5O3lvpnsDG8dAgfBfjbQBrm80hZ1xSKBZNak+T6AQd02Qk3IJ5WJPLt48PXrlbf9H9r
 iws8djks1P59GhYlTRt74Ohqv0HAfbOwkEVos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uHEv0lGE/C2eCMruQ3ng+6P6t/nY6L6JozLU5zKKMRo=;
 b=EJJy8YrpiQ84NU9b5uzY+3Cec87YEnqwvcgdtFqilfEYBDrxIrM7m9+FGJImqvv6Qb
 qibXK7eQtnZTMMZq72Diqqdu+5XdMFAscTSgwtWrB/xggie22p3IhNOoG6obx3oS7AJZ
 gw1phWbwWibYMqlgrirLhZJIzTlsrgU+7f6m+2CoH+EhYBB6fR52eycE9D07P10saxno
 tB1T4dhLNdFaXUPbcLcczig1TylxFRlSfw0XEp8XpKMrBsGxC/FHrj4e5s5OrCKTSLG1
 Zr3LzmakcFVStveU44ep2+/7763D2lusL542uOf7rOL1HrgS7YkNpWszNAB4977vEhaM
 rLDA==
X-Gm-Message-State: AOAM533G8Ty3C8lw6DcQJjcQ6nmObP4ngRHur4wk5RhGbRR75D867H3d
 FaOXqp3ms10ZbjdClW/EJfaNkA==
X-Google-Smtp-Source: ABdhPJyEA7NQob/0i2cic/7Nwr9UfaP0/DnrvCt1R7m8DUzfpcZtrCFj78sGAF83tCvT1+ABDnuzyQ==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr7757424wmf.24.1626100719265; 
 Mon, 12 Jul 2021 07:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm14286369wrr.21.2021.07.12.07.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:38:38 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:38:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Add TTM offset argument to mmap.
Message-ID: <YOxT7M2WuVB4bglb@phenom.ffwll.local>
References: <20210709114120.651309-1-maarten.lankhorst@linux.intel.com>
 <CAOFGe96ZGygDpJcfHeWQVYr6UqkZBWvJ1mtzkPWShtm_K5Or1g@mail.gmail.com>
 <YOxNsiQIHuxByHzv@phenom.ffwll.local>
 <CAOFGe96NL1LQLJ-iKktanD1HXHi3XqEx18fRVEWbeyfWxte5Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe96NL1LQLJ-iKktanD1HXHi3XqEx18fRVEWbeyfWxte5Qw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 09:31:13AM -0500, Jason Ekstrand wrote:
> On Mon, Jul 12, 2021 at 9:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jul 12, 2021 at 08:47:24AM -0500, Jason Ekstrand wrote:
> > > On Fri, Jul 9, 2021 at 6:41 AM Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com> wrote:
> > > >
> > > > This is only used for ttm, and tells userspace that the mapping type is
> > > > ignored. This disables the other type of mmap offsets when discrete
> > > > memory is used, so fix the selftests as well.
> > > >
> > > > Document the struct as well, so it shows up in docbook correctly.
> > > >
> > > > Changes since v1:
> > > > - Add docbook entries.
> > > >
> > > > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 17 ++++++-
> > > >  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
> > > >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 27 +++++++++-
> > > >  include/uapi/drm/i915_drm.h                   | 51 +++++++++++++++----
> > > >  4 files changed, 82 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > index a90f796e85c0..b34be9e5d094 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > @@ -679,10 +679,16 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
> > > >                 return -ENODEV;
> > > >
> > > >         if (obj->ops->mmap_offset)  {
> > > > +               if (mmap_type != I915_MMAP_TYPE_TTM)
> > > > +                       return -ENODEV;
> > > > +
> > > >                 *offset = obj->ops->mmap_offset(obj);
> > > >                 return 0;
> > > >         }
> > > >
> > > > +       if (mmap_type == I915_MMAP_TYPE_TTM)
> > > > +               return -ENODEV;
> > > > +
> > > >         if (mmap_type != I915_MMAP_TYPE_GTT &&
> > > >             !i915_gem_object_has_struct_page(obj) &&
> > > >             !i915_gem_object_has_iomem(obj))
> > > > @@ -727,7 +733,9 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
> > > >  {
> > > >         enum i915_mmap_type mmap_type;
> > > >
> > > > -       if (boot_cpu_has(X86_FEATURE_PAT))
> > > > +       if (HAS_LMEM(to_i915(dev)))
> > > > +               mmap_type = I915_MMAP_TYPE_TTM;
> > > > +       else if (boot_cpu_has(X86_FEATURE_PAT))
> > > >                 mmap_type = I915_MMAP_TYPE_WC;
> > > >         else if (!i915_ggtt_has_aperture(&to_i915(dev)->ggtt))
> > > >                 return -ENODEV;
> > > > @@ -798,6 +806,10 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> > > >                 type = I915_MMAP_TYPE_UC;
> > > >                 break;
> > > >
> > > > +       case I915_MMAP_OFFSET_TTM:
> > > > +               type = I915_MMAP_TYPE_TTM;
> > > > +               break;
> > > > +
> > > >         default:
> > > >                 return -EINVAL;
> > > >         }
> > > > @@ -968,6 +980,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> > > >                 vma->vm_ops = &vm_ops_cpu;
> > > >                 break;
> > > >
> > > > +       case I915_MMAP_TYPE_TTM:
> > > > +               GEM_WARN_ON(mmo->mmap_type == I915_MMAP_TYPE_TTM);
> > > > +               /* fall-through */
> > > >         case I915_MMAP_TYPE_WB:
> > > >                 vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> > > >                 vma->vm_ops = &vm_ops_cpu;
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > > > index ef3de2ae9723..d4c42bcdfeb6 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > > > @@ -105,6 +105,7 @@ enum i915_mmap_type {
> > > >         I915_MMAP_TYPE_WC,
> > > >         I915_MMAP_TYPE_WB,
> > > >         I915_MMAP_TYPE_UC,
> > > > +       I915_MMAP_TYPE_TTM,
> > > >  };
> > > >
> > > >  struct i915_mmap_offset {
> > > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > index 1da8bd675e54..27a35d88e5f5 100644
> > > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > > > @@ -573,6 +573,14 @@ static int make_obj_busy(struct drm_i915_gem_object *obj)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static enum i915_mmap_type default_mapping(struct drm_i915_private *i915)
> > > > +{
> > > > +       if (HAS_LMEM(i915))
> > > > +               return I915_MMAP_TYPE_TTM;
> > > > +
> > > > +       return I915_MMAP_TYPE_GTT;
> > > > +}
> > > > +
> > > >  static bool assert_mmap_offset(struct drm_i915_private *i915,
> > > >                                unsigned long size,
> > > >                                int expected)
> > > > @@ -585,7 +593,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
> > > >         if (IS_ERR(obj))
> > > >                 return expected && expected == PTR_ERR(obj);
> > > >
> > > > -       ret = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
> > > > +       ret = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
> > > >         i915_gem_object_put(obj);
> > > >
> > > >         return ret == expected;
> > > > @@ -689,7 +697,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
> > > >                 goto out;
> > > >         }
> > > >
> > > > -       err = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
> > > > +       err = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
> > > >         if (err) {
> > > >                 pr_err("Unable to insert object into reclaimed hole\n");
> > > >                 goto err_obj;
> > > > @@ -831,8 +839,14 @@ static int wc_check(struct drm_i915_gem_object *obj)
> > > >
> > > >  static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
> > > >  {
> > > > +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> > > >         bool no_map;
> > > >
> > > > +       if (HAS_LMEM(i915))
> > > > +               return type == I915_MMAP_TYPE_TTM;
> > > > +       else if (type == I915_MMAP_TYPE_TTM)
> > > > +               return false;
> > > > +
> > > >         if (type == I915_MMAP_TYPE_GTT &&
> > > >             !i915_ggtt_has_aperture(&to_i915(obj->base.dev)->ggtt))
> > > >                 return false;
> > > > @@ -970,6 +984,8 @@ static int igt_mmap(void *arg)
> > > >                         err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
> > > >                         if (err == 0)
> > > >                                 err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
> > > > +                       if (err == 0)
> > > > +                               err = __igt_mmap(i915, obj, I915_MMAP_TYPE_TTM);
> > > >
> > > >                         i915_gem_object_put(obj);
> > > >                         if (err)
> > > > @@ -987,6 +1003,7 @@ static const char *repr_mmap_type(enum i915_mmap_type type)
> > > >         case I915_MMAP_TYPE_WB: return "wb";
> > > >         case I915_MMAP_TYPE_WC: return "wc";
> > > >         case I915_MMAP_TYPE_UC: return "uc";
> > > > +       case I915_MMAP_TYPE_TTM: return "ttm";
> > > >         default: return "unknown";
> > > >         }
> > > >  }
> > > > @@ -1100,6 +1117,8 @@ static int igt_mmap_access(void *arg)
> > > >                         err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WC);
> > > >                 if (err == 0)
> > > >                         err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_UC);
> > > > +               if (err == 0)
> > > > +                       err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_TTM);
> > > >
> > > >                 i915_gem_object_put(obj);
> > > >                 if (err)
> > > > @@ -1241,6 +1260,8 @@ static int igt_mmap_gpu(void *arg)
> > > >                 err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
> > > >                 if (err == 0)
> > > >                         err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
> > > > +               if (err == 0)
> > > > +                       err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_TTM);
> > > >
> > > >                 i915_gem_object_put(obj);
> > > >                 if (err)
> > > > @@ -1396,6 +1417,8 @@ static int igt_mmap_revoke(void *arg)
> > > >                 err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
> > > >                 if (err == 0)
> > > >                         err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
> > > > +               if (err == 0)
> > > > +                       err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_TTM);
> > > >
> > > >                 i915_gem_object_put(obj);
> > > >                 if (err)
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > index e334a8b14ef2..1610ed40b4b5 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -849,31 +849,60 @@ struct drm_i915_gem_mmap_gtt {
> > > >         __u64 offset;
> > > >  };
> > > >
> > > > +/**
> > > > + * struct drm_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer object.
> > > > + *
> > > > + * This struct is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
> > > > + * and is used to retrieve the fake offset to mmap an object specified by &handle.
> > > > + *
> > > > + * The legacy way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
> > > > + * `DRM_IOCTL_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will behave
> > > > + * as setting the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
> > > > + */
> > > >  struct drm_i915_gem_mmap_offset {
> > > > -       /** Handle for the object being mapped. */
> > > > +       /** @handle: Handle for the object being mapped. */
> > > >         __u32 handle;
> > > > +       /** @pad: Must be zero */
> > > >         __u32 pad;
> > > >         /**
> > > > -        * Fake offset to use for subsequent mmap call
> > > > +        * @offset: The fake offset to use for subsequent mmap call
> > > >          *
> > > >          * This is a fixed-size type for 32/64 compatibility.
> > > >          */
> > > >         __u64 offset;
> > > >
> > > >         /**
> > > > -        * Flags for extended behaviour.
> > > > +        * @flags: Flags for extended behaviour.
> > > > +        *
> > > > +        * It is mandatory that one of the `MMAP_OFFSET` types
> > > > +        * should be included:
> > > > +        * - `I915_MMAP_OFFSET_GTT`: Use mmap with the object bound to GTT.
> > > > +        * - `I915_MMAP_OFFSET_WC`: Use Write-Combined caching.
> > > > +        * - `I915_MMAP_OFFSET_WB`: Use Write-Back caching.
> > > > +        * - `I915_MMAP_OFFSET_TTM`: Use TTM to determine caching based on object placement.
> > > > +        *
> > > > +        * Only on devices with local memory is `I915_MMAP_OFFSET_TTM` valid. On
> > > > +        * devices without local memory, this caching mode is invalid.
> > > >          *
> > > > -        * It is mandatory that one of the MMAP_OFFSET types
> > > > -        * (GTT, WC, WB, UC, etc) should be included.
> > > > +        * As caching mode when specifying `I915_MMAP_OFFSET_TTM`, WC or WB will
> > > > +        * be used, depending on the object placement. WC will be used
> > > > +        * when the object resides in local memory, WB otherwise.
> > > >          */
> > > >         __u64 flags;
> > > > -#define I915_MMAP_OFFSET_GTT 0
> > > > -#define I915_MMAP_OFFSET_WC  1
> > > > -#define I915_MMAP_OFFSET_WB  2
> > > > -#define I915_MMAP_OFFSET_UC  3
> > > >
> > > > -       /*
> > > > -        * Zero-terminated chain of extensions.
> > > > +/** Use an mmap for the object by binding to GTT. */
> > > > +#define I915_MMAP_OFFSET_GTT   0
> > > > +/** Use Write-Combined caching. */
> > > > +#define I915_MMAP_OFFSET_WC    1
> > > > +/** Use Write-Back caching. */
> > > > +#define I915_MMAP_OFFSET_WB    2
> > > > +/** Do not use caching when binding this mmap. */
> > > > +#define I915_MMAP_OFFSET_UC    3
> > > > +/** Use the TTM binding, which determines the appropriate caching mode. */
> > > > +#define I915_MMAP_OFFSET_TTM   4
> > >
> > > I'm not sure I like the name here.  TTM is an implementation detail,
> > > not a kind of map.  I think we want something more like
> > > I915_MMAP_OFFSET_IMPLICIT or something like that.  The semantics here,
> > > as far as I can tell, are "the mmap type is based on the object; you
> > > can't change it."  On DG1, the mmap type is fixed for all objects.  On
> > > integrated, we could have a BO create option for the mmap type but we
> > > don't yet.
> >
> > Yeah it's not a great name, but also we didn't come up with anything
> > substantially better on irc. More ideas:
> > - PREDEFINED
> > - PRESELECTED
> >
> > Note that we want to pick a value here which also makes sense for when we
> > extend GEM_CREATE_EXT to allow you to select the single mmap mode you get
> > at creation time (for igfx cleanup of the uapi). So IMPLICIT isn't the
> > greatest name either, when we'll allow userspace to explicit chose it -
> > just not here anymore.
> 
> Yeah, none of them are great.  Maybe FIXED?  Or PER_BO?  Or BO_CREATE?
>  Or just BO?  I think the semantics we want are "whatever was on the
> BO at create time".

_FIXED sounds like the least horrible one to me.
-Daniel

> 
> --Jason
> 
> >
> > Anyway, pick a name and we'll paint this bikeshed, I don't care much
> > really. As long as there's kerneldoc :-)
> > -Daniel
> >
> > >
> > > --Jason
> > >
> > > > +
> > > > +       /**
> > > > +        * @extensions: Zero-terminated chain of extensions.
> > > >          *
> > > >          * No current extensions defined; mbz.
> > > >          */
> > > > --
> > > > 2.31.0
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
