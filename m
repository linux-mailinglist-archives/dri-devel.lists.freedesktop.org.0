Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F53DF118
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CEA6E889;
	Tue,  3 Aug 2021 15:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6F76E889
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:09:27 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 l12-20020a4a94cc0000b02902618ad2ea55so5264354ooi.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7apil66j8bpF13Zhfk67i/lkOKL/lPWcAQEbpN00lVQ=;
 b=bj0drZAg9BGugnCw+j9iOjpJ6gtNJk1LQqk87AZ0NvPljI9iXEcD5n56Ne9WcQKLVs
 F75fAlxEP8NFL0/vNeTonpguvky1tU9bN3RsU0qV1l6iRYzPQL/CTvSSc/uj446BvJLL
 vZEbXsl+bQWpgDnpbCCFQEVKN4WqMU1XySUfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7apil66j8bpF13Zhfk67i/lkOKL/lPWcAQEbpN00lVQ=;
 b=uHzHwXCmZsS6/TXZwadXEUuP4Ley7j+8ijdUqtswKn3drn7UL+8YnAIP1beWmqjjGe
 3UWdvF6KVLj0pL3XsOxKPvgd7RxefVXsCrLRDmHTwDHfhyDsGVmHodkjR4OVq/6MkaLy
 pJIhGA7ln9BPm4kwrdqgc+5Q0FC5Cov706I+IrnHCjse1V038Db112pukJpTbAbj2fV1
 i7h45lMaquGuCzAsAZZlscPW0OB1zkkgvmGwBw2Dd3r/FSGbz45mJfnKQTJP407UpxEU
 hPr4ZF1XmwgG9eOcnabLdUA5hJK5V+/TEBsIV7GR269G7uRSGZcinwJJCBV3BZwZ3CO8
 aidQ==
X-Gm-Message-State: AOAM530zJJ7vYN9NIfSROccmInFwZkBL4hOt8wD+MKXjU+LkKjlcbfrX
 e3MgJrztqKseschpA8pA0O9BoCrH51wRDjJwXTomqg==
X-Google-Smtp-Source: ABdhPJzCnvpi1QcTTfwGEAHHOycqYGHdx5k4r9Z1UaTslt69Qqu1cDD8gnvzFNkIvMKsqA/9DGFAWmY3oFFwTKot1Ak=
X-Received: by 2002:a4a:e382:: with SMTP id l2mr14859099oov.85.1628003366329; 
 Tue, 03 Aug 2021 08:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113405.427004-1-matthew.auld@intel.com>
 <0988bf67-c42a-1e7e-af77-ae2da65b036f@linux.intel.com>
 <CAOFGe94-StYYc3Fk70u3h0xp2F4RqONb96cnFLhgnhxOVKi8JA@mail.gmail.com>
 <cf0253c0-6a4c-aaaa-4110-aa403d66ea9f@linux.intel.com>
 <CAM0jSHO7rQZ0dj5+8kC3P1-00LFkGHeE9XJj6rB95E=gjzkHwg@mail.gmail.com>
In-Reply-To: <CAM0jSHO7rQZ0dj5+8kC3P1-00LFkGHeE9XJj6rB95E=gjzkHwg@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 3 Aug 2021 17:09:15 +0200
Message-ID: <CAKMK7uGFn=SV4mZMXQuGE-CrtsX8E=ibtvaBkFCtDerMqVucAw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/userptr: Probe existence of backing
 struct pages upon creation
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Intel GFX <intel-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>
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

On Wed, Jul 28, 2021 at 4:22 PM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 26 Jul 2021 at 17:10, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 26/07/2021 16:14, Jason Ekstrand wrote:
> > > On Mon, Jul 26, 2021 at 3:31 AM Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com> wrote:
> > >>
> > >> Op 23-07-2021 om 13:34 schreef Matthew Auld:
> > >>> From: Chris Wilson <chris@chris-wilson.co.uk>
> > >>>
> > >>> Jason Ekstrand requested a more efficient method than userptr+set-d=
omain
> > >>> to determine if the userptr object was backed by a complete set of =
pages
> > >>> upon creation. To be more efficient than simply populating the user=
ptr
> > >>> using get_user_pages() (as done by the call to set-domain or execbu=
f),
> > >>> we can walk the tree of vm_area_struct and check for gaps or vma no=
t
> > >>> backed by struct page (VM_PFNMAP). The question is how to handle
> > >>> VM_MIXEDMAP which may be either struct page or pfn backed...
> > >>>
> > >>> With discrete we are going to drop support for set_domain(), so off=
ering
> > >>> a way to probe the pages, without having to resort to dummy batches=
 has
> > >>> been requested.
> > >>>
> > >>> v2:
> > >>> - add new query param for the PROBE flag, so userspace can easily
> > >>>    check if the kernel supports it(Jason).
> > >>> - use mmap_read_{lock, unlock}.
> > >>> - add some kernel-doc.
> > >>> v3:
> > >>> - In the docs also mention that PROBE doesn't guarantee that the pa=
ges
> > >>>    will remain valid by the time they are actually used(Tvrtko).
> > >>> - Add a small comment for the hole finding logic(Jason).
> > >>> - Move the param next to all the other params which just return tru=
e.
> > >>>
> > >>> Testcase: igt/gem_userptr_blits/probe
> > >>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > >>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > >>> Cc: Jordan Justen <jordan.l.justen@intel.com>
> > >>> Cc: Kenneth Graunke <kenneth@whitecape.org>
> > >>> Cc: Jason Ekstrand <jason@jlekstrand.net>
> > >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >>> Cc: Ramalingam C <ramalingam.c@intel.com>
> > >>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > >>> Acked-by: Kenneth Graunke <kenneth@whitecape.org>
> > >>> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > >>> ---
> > >>>   drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 41 ++++++++++++++++=
++++-
> > >>>   drivers/gpu/drm/i915/i915_getparam.c        |  1 +
> > >>>   include/uapi/drm/i915_drm.h                 | 20 ++++++++++
> > >>>   3 files changed, 61 insertions(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/=
gpu/drm/i915/gem/i915_gem_userptr.c
> > >>> index 56edfeff8c02..468a7a617fbf 100644
> > >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > >>> @@ -422,6 +422,34 @@ static const struct drm_i915_gem_object_ops i9=
15_gem_userptr_ops =3D {
> > >>>
> > >>>   #endif
> > >>>
> > >>> +static int
> > >>> +probe_range(struct mm_struct *mm, unsigned long addr, unsigned lon=
g len)
> > >>> +{
> > >>> +     const unsigned long end =3D addr + len;
> > >>> +     struct vm_area_struct *vma;
> > >>> +     int ret =3D -EFAULT;
> > >>> +
> > >>> +     mmap_read_lock(mm);
> > >>> +     for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > >>> +             /* Check for holes, note that we also update the addr=
 below */
> > >>> +             if (vma->vm_start > addr)
> > >>> +                     break;
> > >>> +
> > >>> +             if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > >>> +                     break;
> > >>> +
> > >>> +             if (vma->vm_end >=3D end) {
> > >>> +                     ret =3D 0;
> > >>> +                     break;
> > >>> +             }
> > >>> +
> > >>> +             addr =3D vma->vm_end;
> > >>> +     }
> > >>> +     mmap_read_unlock(mm);
> > >>> +
> > >>> +     return ret;
> > >>> +}
> > >>> +
> > >>>   /*
> > >>>    * Creates a new mm object that wraps some normal memory from the=
 process
> > >>>    * context - user memory.
> > >>> @@ -477,7 +505,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >>>        }
> > >>>
> > >>>        if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > >>> -                         I915_USERPTR_UNSYNCHRONIZED))
> > >>> +                         I915_USERPTR_UNSYNCHRONIZED |
> > >>> +                         I915_USERPTR_PROBE))
> > >>>                return -EINVAL;
> > >>>
> > >>>        if (i915_gem_object_size_2big(args->user_size))
> > >>> @@ -504,6 +533,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> > >>>                        return -ENODEV;
> > >>>        }
> > >>>
> > >>> +     if (args->flags & I915_USERPTR_PROBE) {
> > >>> +             /*
> > >>> +              * Check that the range pointed to represents real st=
ruct
> > >>> +              * pages and not iomappings (at this moment in time!)
> > >>> +              */
> > >>> +             ret =3D probe_range(current->mm, args->user_ptr, args=
->user_size);
> > >>> +             if (ret)
> > >>> +                     return ret;
> > >>> +     }
> > >>> +
> > >>>   #ifdef CONFIG_MMU_NOTIFIER
> > >>>        obj =3D i915_gem_object_alloc();
> > >>>        if (obj =3D=3D NULL)
> > >>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm=
/i915/i915_getparam.c
> > >>> index 24e18219eb50..bbb7cac43eb4 100644
> > >>> --- a/drivers/gpu/drm/i915/i915_getparam.c
> > >>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > >>> @@ -134,6 +134,7 @@ int i915_getparam_ioctl(struct drm_device *dev,=
 void *data,
> > >>>        case I915_PARAM_HAS_EXEC_FENCE_ARRAY:
> > >>>        case I915_PARAM_HAS_EXEC_SUBMIT_FENCE:
> > >>>        case I915_PARAM_HAS_EXEC_TIMELINE_FENCES:
> > >>> +     case I915_PARAM_HAS_USERPTR_PROBE:
> > >>>                /* For the time being all of these are always true;
> > >>>                 * if some supported hardware does not have one of t=
hese
> > >>>                 * features this value needs to be provided from
> > >>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_dr=
m.h
> > >>> index 975087553ea0..0d290535a6e5 100644
> > >>> --- a/include/uapi/drm/i915_drm.h
> > >>> +++ b/include/uapi/drm/i915_drm.h
> > >>> @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> > >>>    */
> > >>>   #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> > >>>
> > >>> +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > >>> +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > >>> +
> > >>>   /* Must be kept compact -- no holes and well documented */
> > >>>
> > >>>   typedef struct drm_i915_getparam {
> > >>> @@ -2222,12 +2225,29 @@ struct drm_i915_gem_userptr {
> > >>>         * through the GTT. If the HW can't support readonly access,=
 an error is
> > >>>         * returned.
> > >>>         *
> > >>> +      * I915_USERPTR_PROBE:
> > >>> +      *
> > >>> +      * Probe the provided @user_ptr range and validate that the @=
user_ptr is
> > >>> +      * indeed pointing to normal memory and that the range is als=
o valid.
> > >>> +      * For example if some garbage address is given to the kernel=
, then this
> > >>> +      * should complain.
> > >>> +      *
> > >>> +      * Returns -EFAULT if the probe failed.
> > >>> +      *
> > >>> +      * Note that this doesn't populate the backing pages, and als=
o doesn't
> > >>> +      * guarantee that the object will remain valid when the objec=
t is
> > >>> +      * eventually used.
> > >>> +      *
> > >>> +      * The kernel supports this feature if I915_PARAM_HAS_USERPTR=
_PROBE
> > >>> +      * returns a non-zero value.
> > >>> +      *
> > >>>         * I915_USERPTR_UNSYNCHRONIZED:
> > >>>         *
> > >>>         * NOT USED. Setting this flag will result in an error.
> > >>>         */
> > >>>        __u32 flags;
> > >>>   #define I915_USERPTR_READ_ONLY 0x1
> > >>> +#define I915_USERPTR_PROBE 0x2
> > >>>   #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> > >>>        /**
> > >>>         * @handle: Returned handle for the object.
> > >>
> > >> Could we use _VALIDATE instead of probe? Or at least pin the pages a=
s well, so we don't have to do it later?
> > >
> > > I only care that the name matches what it does.  _VALIDATE sounds lik=
e
> > > it does a full validation of everything such that, if the import
> > > succeeds, execbuf will as well.  If we pin the pages at the same time=
,
> > > maybe that's true?  _PROBE, on the other hand, sounds a lot more like
> >
> > No it is not possible to guarantee backing store remains valid until
> > execbuf.
> >
> > > a one-time best-effort check which may race with other stuff and
> > > doesn't guarantee future success.  That's in line with what the
> > > current patch does.
> > >
> > >> We already have i915_gem_object_userptr_validate, no need to dupe it=
.
> > >
> > > I have no opinion on this.
> >
> > I was actually suggesting the same as Maarten here - that we should add
> > a "populate" flag. But opinion was that was not desired - please look
> > for the older threads to see the reasoning there.
>
> So how should we proceed here? Maarten?

I honestly don't care, and I think the probe flag here is perfectly
fine. Reasons for that:
- we don't have an immediate allocation flag for buffer creation
either. So if there's a need we need a flag for this across the board,
not just userptr, and a clear userspace ask
- it's a fundamentally racy test anyway, userspace can munmap or map
something else and then it will fail. So we really don't gain anything
by pinning pages because by the time we go into execbuf they might be
invalidated already - checking the vmas for VM_SPECIAL is perfectly
good enough.
- we can always change the implementation later on too.

Hence why I think PROBE is the semantics we want/need here. Can we get
some acks/reviews here or is this really a significant enough bikeshed
that we need to hold up dg1 pciids for them?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
