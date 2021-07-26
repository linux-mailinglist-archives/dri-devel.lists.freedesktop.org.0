Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3043D5CB5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7E189D5C;
	Mon, 26 Jul 2021 15:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6721189D5C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:12:52 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id z18so15352900ybg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IhB/DAdJ/ykBPXvwoWpGu78yd2obvTVItmg7otew97Q=;
 b=Ih7ARm7vkOvw/RGF6xD0TSfzz/Fn4MKZqjQ/85VNso5YSoDVqbHgBZh9dkH2I9YwMX
 wmnavZQxO+ldLksnJ+gA9PpDZzuWoayREVJy6joXUutNn/Jw9ufzFdJZsowmBEpOywGB
 ohpz/Ux8Ca40LYZCLtRyJtUX2nRFIBv9EHLW309T9D3k4/4v068z7zQIq6slWCj6Dx+w
 LzuHnGpdUtB1+Xh0blB84GA6yNBcM68q6RghwYPtfuOMH7H5t0ZI25mWzvhsE8YAGGDD
 Ra/xxwhkX918evBjk0MlwWs6662PayMPWsgfxnfsKAU4VGi+OczNybOKJiPS7UvKG6i+
 mE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IhB/DAdJ/ykBPXvwoWpGu78yd2obvTVItmg7otew97Q=;
 b=qExVaTI2bvBuhTnXDa1nxb02cAsk8OVljUkIGkUay2t24jVvSkB6O/9nH9bMjASxEU
 4RqOCXrQs6bTbos0MbLUG2ycqrBdalyj/XOyTgurT7yg19LbDBmnP8IwtwcgCiZqHPFx
 Rd/MqV4Ymgvr5uGyhPt1wIihTDXKLPrLlUOHG7L+Kajcdw2cq26SmTpIEPpEcRw7AtkN
 Ec9bCvp5MoVnE2CKMF12ygNbGKPl234fal2iauQG1HCCSTl+4hcVgg8X/ZlEwDhDQz8w
 PFIjaqycA0qWbZshTyP9IJP7/0AVXr7+gXagdx6GKDvJ7tWfSErmYDCZyID+5k4GviPu
 wmjQ==
X-Gm-Message-State: AOAM532K+R3uiizbqPBKBPfhhFL/Vfz75A63kd+PZoseRerJWDymvjhc
 nAUbnq/k7P1MoThXHIJaLzWxhsBq3hj56G85UeLAVw==
X-Google-Smtp-Source: ABdhPJzun2yQP67PEn8sgu9BkyFvPEi02qrcR0PDfmHKcJXcua/siXqN0lnqlBMEqlW0orfLMywreO/Ud5LMUhkUhlM=
X-Received: by 2002:a25:b708:: with SMTP id t8mr3496954ybj.139.1627312371375; 
 Mon, 26 Jul 2021 08:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113405.427004-1-matthew.auld@intel.com>
 <CAOFGe95TGvvQ5JYQgA1P=Kn3JXb+i+fteOU4L31SMTt4OcDR6g@mail.gmail.com>
 <CAM0jSHOzR7GE8hGYnMuKMzbWOGEwB6V878c_KH=Gkq7KNPcFSg@mail.gmail.com>
In-Reply-To: <CAM0jSHOzR7GE8hGYnMuKMzbWOGEwB6V878c_KH=Gkq7KNPcFSg@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:12:39 -0500
Message-ID: <CAOFGe977pnoZTC4M0C=4kacpwqu_K1hW9b63fht1Mpixq+5JgQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/userptr: Probe existence of backing
 struct pages upon creation
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 3:06 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 23 Jul 2021 at 18:48, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12044
>
> Cool, is that ready to go? i.e can we start merging the kernel + IGT side=
.

Yes, it's all reviewed.  Though, it sounds like Maarten had a comment
so we should settle on that before landing.

> >
> > On Fri, Jul 23, 2021 at 6:35 AM Matthew Auld <matthew.auld@intel.com> w=
rote:
> > >
> > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > >
> > > Jason Ekstrand requested a more efficient method than userptr+set-dom=
ain
> > > to determine if the userptr object was backed by a complete set of pa=
ges
> > > upon creation. To be more efficient than simply populating the userpt=
r
> > > using get_user_pages() (as done by the call to set-domain or execbuf)=
,
> > > we can walk the tree of vm_area_struct and check for gaps or vma not
> > > backed by struct page (VM_PFNMAP). The question is how to handle
> > > VM_MIXEDMAP which may be either struct page or pfn backed...
> > >
> > > With discrete we are going to drop support for set_domain(), so offer=
ing
> > > a way to probe the pages, without having to resort to dummy batches h=
as
> > > been requested.
> > >
> > > v2:
> > > - add new query param for the PROBE flag, so userspace can easily
> > >   check if the kernel supports it(Jason).
> > > - use mmap_read_{lock, unlock}.
> > > - add some kernel-doc.
> > > v3:
> > > - In the docs also mention that PROBE doesn't guarantee that the page=
s
> > >   will remain valid by the time they are actually used(Tvrtko).
> > > - Add a small comment for the hole finding logic(Jason).
> > > - Move the param next to all the other params which just return true.
> > >
> > > Testcase: igt/gem_userptr_blits/probe
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > Acked-by: Kenneth Graunke <kenneth@whitecape.org>
> > > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 41 +++++++++++++++++++=
+-
> > >  drivers/gpu/drm/i915/i915_getparam.c        |  1 +
> > >  include/uapi/drm/i915_drm.h                 | 20 ++++++++++
> > >  3 files changed, 61 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gp=
u/drm/i915/gem/i915_gem_userptr.c
> > > index 56edfeff8c02..468a7a617fbf 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > > @@ -422,6 +422,34 @@ static const struct drm_i915_gem_object_ops i915=
_gem_userptr_ops =3D {
> > >
> > >  #endif
> > >
> > > +static int
> > > +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long =
len)
> > > +{
> > > +       const unsigned long end =3D addr + len;
> > > +       struct vm_area_struct *vma;
> > > +       int ret =3D -EFAULT;
> > > +
> > > +       mmap_read_lock(mm);
> > > +       for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > > +               /* Check for holes, note that we also update the addr=
 below */
> > > +               if (vma->vm_start > addr)
> > > +                       break;
> > > +
> > > +               if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > > +                       break;
> > > +
> > > +               if (vma->vm_end >=3D end) {
> > > +                       ret =3D 0;
> > > +                       break;
> > > +               }
> > > +
> > > +               addr =3D vma->vm_end;
> > > +       }
> > > +       mmap_read_unlock(mm);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  /*
> > >   * Creates a new mm object that wraps some normal memory from the pr=
ocess
> > >   * context - user memory.
> > > @@ -477,7 +505,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >         }
> > >
> > >         if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > > -                           I915_USERPTR_UNSYNCHRONIZED))
> > > +                           I915_USERPTR_UNSYNCHRONIZED |
> > > +                           I915_USERPTR_PROBE))
> > >                 return -EINVAL;
> > >
> > >         if (i915_gem_object_size_2big(args->user_size))
> > > @@ -504,6 +533,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >                         return -ENODEV;
> > >         }
> > >
> > > +       if (args->flags & I915_USERPTR_PROBE) {
> > > +               /*
> > > +                * Check that the range pointed to represents real st=
ruct
> > > +                * pages and not iomappings (at this moment in time!)
> > > +                */
> > > +               ret =3D probe_range(current->mm, args->user_ptr, args=
->user_size);
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > >  #ifdef CONFIG_MMU_NOTIFIER
> > >         obj =3D i915_gem_object_alloc();
> > >         if (obj =3D=3D NULL)
> > > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i=
915/i915_getparam.c
> > > index 24e18219eb50..bbb7cac43eb4 100644
> > > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > > @@ -134,6 +134,7 @@ int i915_getparam_ioctl(struct drm_device *dev, v=
oid *data,
> > >         case I915_PARAM_HAS_EXEC_FENCE_ARRAY:
> > >         case I915_PARAM_HAS_EXEC_SUBMIT_FENCE:
> > >         case I915_PARAM_HAS_EXEC_TIMELINE_FENCES:
> > > +       case I915_PARAM_HAS_USERPTR_PROBE:
> > >                 /* For the time being all of these are always true;
> > >                  * if some supported hardware does not have one of th=
ese
> > >                  * features this value needs to be provided from
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.=
h
> > > index 975087553ea0..0d290535a6e5 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> > >   */
> > >  #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> > >
> > > +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > > +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > > +
> > >  /* Must be kept compact -- no holes and well documented */
> > >
> > >  typedef struct drm_i915_getparam {
> > > @@ -2222,12 +2225,29 @@ struct drm_i915_gem_userptr {
> > >          * through the GTT. If the HW can't support readonly access, =
an error is
> > >          * returned.
> > >          *
> > > +        * I915_USERPTR_PROBE:
> > > +        *
> > > +        * Probe the provided @user_ptr range and validate that the @=
user_ptr is
> > > +        * indeed pointing to normal memory and that the range is als=
o valid.
> > > +        * For example if some garbage address is given to the kernel=
, then this
> > > +        * should complain.
> > > +        *
> > > +        * Returns -EFAULT if the probe failed.
> > > +        *
> > > +        * Note that this doesn't populate the backing pages, and als=
o doesn't
> > > +        * guarantee that the object will remain valid when the objec=
t is
> > > +        * eventually used.
> > > +        *
> > > +        * The kernel supports this feature if I915_PARAM_HAS_USERPTR=
_PROBE
> > > +        * returns a non-zero value.
> > > +        *
> > >          * I915_USERPTR_UNSYNCHRONIZED:
> > >          *
> > >          * NOT USED. Setting this flag will result in an error.
> > >          */
> > >         __u32 flags;
> > >  #define I915_USERPTR_READ_ONLY 0x1
> > > +#define I915_USERPTR_PROBE 0x2
> > >  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> > >         /**
> > >          * @handle: Returned handle for the object.
> > > --
> > > 2.26.3
> > >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
