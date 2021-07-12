Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D353C5E04
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 16:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187B589C48;
	Mon, 12 Jul 2021 14:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC53289C48
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 14:12:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id l6so3227763wmq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a28CSe1hu0HXQmLQwPWQNYnyjAftdNHCNfYWISrptb8=;
 b=eDl2LhRSryO9sgqqfIlnMpw11OU0UZskOusUE+gvTW4jfhaxv006IdxAOfdgH/9bhd
 k76OWpzsipUGrxoSBTk8oQhkpbjQbnpKwKhifKQfkYZtIlgqIfVkBctC3l+FdDWQPmQZ
 515mBfWzKzUeuR43+to6r/hQ+N+Kvnpkoa60I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a28CSe1hu0HXQmLQwPWQNYnyjAftdNHCNfYWISrptb8=;
 b=MYbgWJ9AP7haRAYrUJhXCayITdEgzV5OwDpnWnC5pRgNQT0AlDsLY1CwYjmCNIHm/V
 JUiTKfrKasywBCDg4C1J1INFNPet1ENhq0e9hi/mEvuzwWVop+GE8SIrIe5ZiOIWPctD
 MLH2qrMsKrwB/5SURKLAfc8uCMsqvzol0dosy53uWRCKTE4lDL3IWjbvAIH80Muio/5G
 8v8Y4FRjzdTSH3lYG4ZVGSQbJYcKLXt747wSmzZJcmAU86nALJGHJNmichJtKRpuOWoV
 agWOsuVZVA4leouhEdmxRh2W3XKedH7XKa4hFoJzBUFnfxjwxhP0WE6fUY+A4zeJKrVh
 xhVw==
X-Gm-Message-State: AOAM531OvrQZdSacHakUPUoCW332SLbSc3smN6IZZo/8AvArQys5OPC4
 1WPcPL9QkJrWAyYIm0vQ/KpY5w==
X-Google-Smtp-Source: ABdhPJzRS3vsRiZ52pSbx+eJYutuJUNQJqOiEI4I3CBMVHdAEV2IeCwKj6/vkUx+LEUGrR0Szyd9OQ==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr12406253wmk.146.1626099125326; 
 Mon, 12 Jul 2021 07:12:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k13sm10290485wrp.34.2021.07.12.07.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:12:04 -0700 (PDT)
Date: Mon, 12 Jul 2021 16:12:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Add TTM offset argument to mmap.
Message-ID: <YOxNsiQIHuxByHzv@phenom.ffwll.local>
References: <20210709114120.651309-1-maarten.lankhorst@linux.intel.com>
 <CAOFGe96ZGygDpJcfHeWQVYr6UqkZBWvJ1mtzkPWShtm_K5Or1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOFGe96ZGygDpJcfHeWQVYr6UqkZBWvJ1mtzkPWShtm_K5Or1g@mail.gmail.com>
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

On Mon, Jul 12, 2021 at 08:47:24AM -0500, Jason Ekstrand wrote:
> On Fri, Jul 9, 2021 at 6:41 AM Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > This is only used for ttm, and tells userspace that the mapping type is
> > ignored. This disables the other type of mmap offsets when discrete
> > memory is used, so fix the selftests as well.
> >
> > Document the struct as well, so it shows up in docbook correctly.
> >
> > Changes since v1:
> > - Add docbook entries.
> >
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 17 ++++++-
> >  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
> >  .../drm/i915/gem/selftests/i915_gem_mman.c    | 27 +++++++++-
> >  include/uapi/drm/i915_drm.h                   | 51 +++++++++++++++----
> >  4 files changed, 82 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index a90f796e85c0..b34be9e5d094 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -679,10 +679,16 @@ __assign_mmap_offset(struct drm_i915_gem_object *obj,
> >                 return -ENODEV;
> >
> >         if (obj->ops->mmap_offset)  {
> > +               if (mmap_type != I915_MMAP_TYPE_TTM)
> > +                       return -ENODEV;
> > +
> >                 *offset = obj->ops->mmap_offset(obj);
> >                 return 0;
> >         }
> >
> > +       if (mmap_type == I915_MMAP_TYPE_TTM)
> > +               return -ENODEV;
> > +
> >         if (mmap_type != I915_MMAP_TYPE_GTT &&
> >             !i915_gem_object_has_struct_page(obj) &&
> >             !i915_gem_object_has_iomem(obj))
> > @@ -727,7 +733,9 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
> >  {
> >         enum i915_mmap_type mmap_type;
> >
> > -       if (boot_cpu_has(X86_FEATURE_PAT))
> > +       if (HAS_LMEM(to_i915(dev)))
> > +               mmap_type = I915_MMAP_TYPE_TTM;
> > +       else if (boot_cpu_has(X86_FEATURE_PAT))
> >                 mmap_type = I915_MMAP_TYPE_WC;
> >         else if (!i915_ggtt_has_aperture(&to_i915(dev)->ggtt))
> >                 return -ENODEV;
> > @@ -798,6 +806,10 @@ i915_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> >                 type = I915_MMAP_TYPE_UC;
> >                 break;
> >
> > +       case I915_MMAP_OFFSET_TTM:
> > +               type = I915_MMAP_TYPE_TTM;
> > +               break;
> > +
> >         default:
> >                 return -EINVAL;
> >         }
> > @@ -968,6 +980,9 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> >                 vma->vm_ops = &vm_ops_cpu;
> >                 break;
> >
> > +       case I915_MMAP_TYPE_TTM:
> > +               GEM_WARN_ON(mmo->mmap_type == I915_MMAP_TYPE_TTM);
> > +               /* fall-through */
> >         case I915_MMAP_TYPE_WB:
> >                 vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> >                 vma->vm_ops = &vm_ops_cpu;
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > index ef3de2ae9723..d4c42bcdfeb6 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -105,6 +105,7 @@ enum i915_mmap_type {
> >         I915_MMAP_TYPE_WC,
> >         I915_MMAP_TYPE_WB,
> >         I915_MMAP_TYPE_UC,
> > +       I915_MMAP_TYPE_TTM,
> >  };
> >
> >  struct i915_mmap_offset {
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > index 1da8bd675e54..27a35d88e5f5 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> > @@ -573,6 +573,14 @@ static int make_obj_busy(struct drm_i915_gem_object *obj)
> >         return 0;
> >  }
> >
> > +static enum i915_mmap_type default_mapping(struct drm_i915_private *i915)
> > +{
> > +       if (HAS_LMEM(i915))
> > +               return I915_MMAP_TYPE_TTM;
> > +
> > +       return I915_MMAP_TYPE_GTT;
> > +}
> > +
> >  static bool assert_mmap_offset(struct drm_i915_private *i915,
> >                                unsigned long size,
> >                                int expected)
> > @@ -585,7 +593,7 @@ static bool assert_mmap_offset(struct drm_i915_private *i915,
> >         if (IS_ERR(obj))
> >                 return expected && expected == PTR_ERR(obj);
> >
> > -       ret = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
> > +       ret = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
> >         i915_gem_object_put(obj);
> >
> >         return ret == expected;
> > @@ -689,7 +697,7 @@ static int igt_mmap_offset_exhaustion(void *arg)
> >                 goto out;
> >         }
> >
> > -       err = __assign_mmap_offset(obj, I915_MMAP_TYPE_GTT, &offset, NULL);
> > +       err = __assign_mmap_offset(obj, default_mapping(i915), &offset, NULL);
> >         if (err) {
> >                 pr_err("Unable to insert object into reclaimed hole\n");
> >                 goto err_obj;
> > @@ -831,8 +839,14 @@ static int wc_check(struct drm_i915_gem_object *obj)
> >
> >  static bool can_mmap(struct drm_i915_gem_object *obj, enum i915_mmap_type type)
> >  {
> > +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> >         bool no_map;
> >
> > +       if (HAS_LMEM(i915))
> > +               return type == I915_MMAP_TYPE_TTM;
> > +       else if (type == I915_MMAP_TYPE_TTM)
> > +               return false;
> > +
> >         if (type == I915_MMAP_TYPE_GTT &&
> >             !i915_ggtt_has_aperture(&to_i915(obj->base.dev)->ggtt))
> >                 return false;
> > @@ -970,6 +984,8 @@ static int igt_mmap(void *arg)
> >                         err = __igt_mmap(i915, obj, I915_MMAP_TYPE_GTT);
> >                         if (err == 0)
> >                                 err = __igt_mmap(i915, obj, I915_MMAP_TYPE_WC);
> > +                       if (err == 0)
> > +                               err = __igt_mmap(i915, obj, I915_MMAP_TYPE_TTM);
> >
> >                         i915_gem_object_put(obj);
> >                         if (err)
> > @@ -987,6 +1003,7 @@ static const char *repr_mmap_type(enum i915_mmap_type type)
> >         case I915_MMAP_TYPE_WB: return "wb";
> >         case I915_MMAP_TYPE_WC: return "wc";
> >         case I915_MMAP_TYPE_UC: return "uc";
> > +       case I915_MMAP_TYPE_TTM: return "ttm";
> >         default: return "unknown";
> >         }
> >  }
> > @@ -1100,6 +1117,8 @@ static int igt_mmap_access(void *arg)
> >                         err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_WC);
> >                 if (err == 0)
> >                         err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_UC);
> > +               if (err == 0)
> > +                       err = __igt_mmap_access(i915, obj, I915_MMAP_TYPE_TTM);
> >
> >                 i915_gem_object_put(obj);
> >                 if (err)
> > @@ -1241,6 +1260,8 @@ static int igt_mmap_gpu(void *arg)
> >                 err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_GTT);
> >                 if (err == 0)
> >                         err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_WC);
> > +               if (err == 0)
> > +                       err = __igt_mmap_gpu(i915, obj, I915_MMAP_TYPE_TTM);
> >
> >                 i915_gem_object_put(obj);
> >                 if (err)
> > @@ -1396,6 +1417,8 @@ static int igt_mmap_revoke(void *arg)
> >                 err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_GTT);
> >                 if (err == 0)
> >                         err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_WC);
> > +               if (err == 0)
> > +                       err = __igt_mmap_revoke(i915, obj, I915_MMAP_TYPE_TTM);
> >
> >                 i915_gem_object_put(obj);
> >                 if (err)
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index e334a8b14ef2..1610ed40b4b5 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -849,31 +849,60 @@ struct drm_i915_gem_mmap_gtt {
> >         __u64 offset;
> >  };
> >
> > +/**
> > + * struct drm_i915_gem_mmap_offset - Retrieve an offset so we can mmap this buffer object.
> > + *
> > + * This struct is passed as argument to the `DRM_IOCTL_I915_GEM_MMAP_OFFSET` ioctl,
> > + * and is used to retrieve the fake offset to mmap an object specified by &handle.
> > + *
> > + * The legacy way of using `DRM_IOCTL_I915_GEM_MMAP` is removed on gen12+.
> > + * `DRM_IOCTL_I915_GEM_MMAP_GTT` is an older supported alias to this struct, but will behave
> > + * as setting the &extensions to 0, and &flags to `I915_MMAP_OFFSET_GTT`.
> > + */
> >  struct drm_i915_gem_mmap_offset {
> > -       /** Handle for the object being mapped. */
> > +       /** @handle: Handle for the object being mapped. */
> >         __u32 handle;
> > +       /** @pad: Must be zero */
> >         __u32 pad;
> >         /**
> > -        * Fake offset to use for subsequent mmap call
> > +        * @offset: The fake offset to use for subsequent mmap call
> >          *
> >          * This is a fixed-size type for 32/64 compatibility.
> >          */
> >         __u64 offset;
> >
> >         /**
> > -        * Flags for extended behaviour.
> > +        * @flags: Flags for extended behaviour.
> > +        *
> > +        * It is mandatory that one of the `MMAP_OFFSET` types
> > +        * should be included:
> > +        * - `I915_MMAP_OFFSET_GTT`: Use mmap with the object bound to GTT.
> > +        * - `I915_MMAP_OFFSET_WC`: Use Write-Combined caching.
> > +        * - `I915_MMAP_OFFSET_WB`: Use Write-Back caching.
> > +        * - `I915_MMAP_OFFSET_TTM`: Use TTM to determine caching based on object placement.
> > +        *
> > +        * Only on devices with local memory is `I915_MMAP_OFFSET_TTM` valid. On
> > +        * devices without local memory, this caching mode is invalid.
> >          *
> > -        * It is mandatory that one of the MMAP_OFFSET types
> > -        * (GTT, WC, WB, UC, etc) should be included.
> > +        * As caching mode when specifying `I915_MMAP_OFFSET_TTM`, WC or WB will
> > +        * be used, depending on the object placement. WC will be used
> > +        * when the object resides in local memory, WB otherwise.
> >          */
> >         __u64 flags;
> > -#define I915_MMAP_OFFSET_GTT 0
> > -#define I915_MMAP_OFFSET_WC  1
> > -#define I915_MMAP_OFFSET_WB  2
> > -#define I915_MMAP_OFFSET_UC  3
> >
> > -       /*
> > -        * Zero-terminated chain of extensions.
> > +/** Use an mmap for the object by binding to GTT. */
> > +#define I915_MMAP_OFFSET_GTT   0
> > +/** Use Write-Combined caching. */
> > +#define I915_MMAP_OFFSET_WC    1
> > +/** Use Write-Back caching. */
> > +#define I915_MMAP_OFFSET_WB    2
> > +/** Do not use caching when binding this mmap. */
> > +#define I915_MMAP_OFFSET_UC    3
> > +/** Use the TTM binding, which determines the appropriate caching mode. */
> > +#define I915_MMAP_OFFSET_TTM   4
> 
> I'm not sure I like the name here.  TTM is an implementation detail,
> not a kind of map.  I think we want something more like
> I915_MMAP_OFFSET_IMPLICIT or something like that.  The semantics here,
> as far as I can tell, are "the mmap type is based on the object; you
> can't change it."  On DG1, the mmap type is fixed for all objects.  On
> integrated, we could have a BO create option for the mmap type but we
> don't yet.

Yeah it's not a great name, but also we didn't come up with anything
substantially better on irc. More ideas:
- PREDEFINED
- PRESELECTED

Note that we want to pick a value here which also makes sense for when we
extend GEM_CREATE_EXT to allow you to select the single mmap mode you get
at creation time (for igfx cleanup of the uapi). So IMPLICIT isn't the
greatest name either, when we'll allow userspace to explicit chose it -
just not here anymore.

Anyway, pick a name and we'll paint this bikeshed, I don't care much
really. As long as there's kerneldoc :-)
-Daniel

> 
> --Jason
> 
> > +
> > +       /**
> > +        * @extensions: Zero-terminated chain of extensions.
> >          *
> >          * No current extensions defined; mbz.
> >          */
> > --
> > 2.31.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
