Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961C3D3F27
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242886EC85;
	Fri, 23 Jul 2021 17:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF05E6EC60
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 17:49:41 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id v46so3570002ybi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qq2mSzj2XUFiywGlPj9xvRfrAzWr1S4xVmQX3jmAP1g=;
 b=Vs8skBL37cjpBlhp9xpJ+Ysq/3hIlN26gdnbME4Y1rE8QIpWZbfMLvlW5Dq4wZ9ZAI
 ghjJTcOzRIK2G+HX2dzxG2ctpDL47IJJlMJEU5kJ5ssN30YXEtTHSdmUN/ndE9DRsxHi
 vVjwjao946jomWYBJvCdiXXj12YDnOqwmh1/fBfxpDoX4l239krHUABDdzdkRNlNNLrQ
 wnTFrUW2cDrMLvjDmdo9TZCwWXOqAMZAqd6xldf7cZJNyXHAOj9GeAOLtSl01/i57Wyy
 Ma1/DonCMAXdUyKk+3XdA7SKF4PwCtj1hpvrS9QuGxLMROy1pZOTNcekK4nCWskph1WP
 pmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qq2mSzj2XUFiywGlPj9xvRfrAzWr1S4xVmQX3jmAP1g=;
 b=pMP276fczv2ojU9ZJHe0cJh3dtL3L2Y5RI6PgKrVflctrqJx6FaBMSC2/doZhrmgOj
 A0Po0V/dE62QBtm6tnjUgn3X63dEriZGs8UixQMKPx6592tEIpOeir+EVT1N99xSGCCg
 r6rZ+6yUg7lCtUsOg4ksemYlQS5P/OeUJJmaPPBN78Ar0wGEPiD/l6te+vge05VdHJxi
 Qe5v9Kvrc6Ek5tPgWZwXe0BqPF9E2kxmqaUuz3ZsmB1Cx7XAimKLmZI/90zJBEZGmrXe
 PgFwo1pq7f+X7SAynDBd1H9YZDlmcCUJQ+Cry5lKqR47M7bLIAxwA5+1EbrCekqLJLVc
 tHcA==
X-Gm-Message-State: AOAM530NQvNAHqznLUycF3WpAg8MY4eqAqxmv0s+nOg7KckYjpPAnnld
 u9s0JFIUKD1K3OqBwXP7JOtvQt2Q9hRHbU9ecTHvfQ==
X-Google-Smtp-Source: ABdhPJyPPVbc61oXjY9KuZZHbkDCT8czo/VlX5pDK/YkKEyb6J0e5G78J6mJfXW8DWgl24GvgV8JWIYcU2jiJQzCEj0=
X-Received: by 2002:a25:3305:: with SMTP id z5mr6031739ybz.241.1627062580886; 
 Fri, 23 Jul 2021 10:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113405.427004-1-matthew.auld@intel.com>
 <CAOFGe95TGvvQ5JYQgA1P=Kn3JXb+i+fteOU4L31SMTt4OcDR6g@mail.gmail.com>
In-Reply-To: <CAOFGe95TGvvQ5JYQgA1P=Kn3JXb+i+fteOU4L31SMTt4OcDR6g@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Jul 2021 12:49:29 -0500
Message-ID: <CAOFGe96fH8N9w2NqRXcFTxLDYeVWHSCtGit6tvOcyM9jYR3g_w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/userptr: Probe existence of backing struct pages
 upon creation
To: Matthew Auld <matthew.auld@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Are there IGTs for this anywhere?

On Fri, Jul 23, 2021 at 12:47 PM Jason Ekstrand <jason@jlekstrand.net> wrot=
e:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12044
>
> On Fri, Jul 23, 2021 at 6:35 AM Matthew Auld <matthew.auld@intel.com> wro=
te:
> >
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> >
> > Jason Ekstrand requested a more efficient method than userptr+set-domai=
n
> > to determine if the userptr object was backed by a complete set of page=
s
> > upon creation. To be more efficient than simply populating the userptr
> > using get_user_pages() (as done by the call to set-domain or execbuf),
> > we can walk the tree of vm_area_struct and check for gaps or vma not
> > backed by struct page (VM_PFNMAP). The question is how to handle
> > VM_MIXEDMAP which may be either struct page or pfn backed...
> >
> > With discrete we are going to drop support for set_domain(), so offerin=
g
> > a way to probe the pages, without having to resort to dummy batches has
> > been requested.
> >
> > v2:
> > - add new query param for the PROBE flag, so userspace can easily
> >   check if the kernel supports it(Jason).
> > - use mmap_read_{lock, unlock}.
> > - add some kernel-doc.
> > v3:
> > - In the docs also mention that PROBE doesn't guarantee that the pages
> >   will remain valid by the time they are actually used(Tvrtko).
> > - Add a small comment for the hole finding logic(Jason).
> > - Move the param next to all the other params which just return true.
> >
> > Testcase: igt/gem_userptr_blits/probe
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Acked-by: Kenneth Graunke <kenneth@whitecape.org>
> > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_userptr.c | 41 ++++++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_getparam.c        |  1 +
> >  include/uapi/drm/i915_drm.h                 | 20 ++++++++++
> >  3 files changed, 61 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/=
drm/i915/gem/i915_gem_userptr.c
> > index 56edfeff8c02..468a7a617fbf 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> > @@ -422,6 +422,34 @@ static const struct drm_i915_gem_object_ops i915_g=
em_userptr_ops =3D {
> >
> >  #endif
> >
> > +static int
> > +probe_range(struct mm_struct *mm, unsigned long addr, unsigned long le=
n)
> > +{
> > +       const unsigned long end =3D addr + len;
> > +       struct vm_area_struct *vma;
> > +       int ret =3D -EFAULT;
> > +
> > +       mmap_read_lock(mm);
> > +       for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > +               /* Check for holes, note that we also update the addr b=
elow */
> > +               if (vma->vm_start > addr)
> > +                       break;
> > +
> > +               if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > +                       break;
> > +
> > +               if (vma->vm_end >=3D end) {
> > +                       ret =3D 0;
> > +                       break;
> > +               }
> > +
> > +               addr =3D vma->vm_end;
> > +       }
> > +       mmap_read_unlock(mm);
> > +
> > +       return ret;
> > +}
> > +
> >  /*
> >   * Creates a new mm object that wraps some normal memory from the proc=
ess
> >   * context - user memory.
> > @@ -477,7 +505,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >         }
> >
> >         if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > -                           I915_USERPTR_UNSYNCHRONIZED))
> > +                           I915_USERPTR_UNSYNCHRONIZED |
> > +                           I915_USERPTR_PROBE))
> >                 return -EINVAL;
> >
> >         if (i915_gem_object_size_2big(args->user_size))
> > @@ -504,6 +533,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >                         return -ENODEV;
> >         }
> >
> > +       if (args->flags & I915_USERPTR_PROBE) {
> > +               /*
> > +                * Check that the range pointed to represents real stru=
ct
> > +                * pages and not iomappings (at this moment in time!)
> > +                */
> > +               ret =3D probe_range(current->mm, args->user_ptr, args->=
user_size);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> >  #ifdef CONFIG_MMU_NOTIFIER
> >         obj =3D i915_gem_object_alloc();
> >         if (obj =3D=3D NULL)
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i91=
5/i915_getparam.c
> > index 24e18219eb50..bbb7cac43eb4 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -134,6 +134,7 @@ int i915_getparam_ioctl(struct drm_device *dev, voi=
d *data,
> >         case I915_PARAM_HAS_EXEC_FENCE_ARRAY:
> >         case I915_PARAM_HAS_EXEC_SUBMIT_FENCE:
> >         case I915_PARAM_HAS_EXEC_TIMELINE_FENCES:
> > +       case I915_PARAM_HAS_USERPTR_PROBE:
> >                 /* For the time being all of these are always true;
> >                  * if some supported hardware does not have one of thes=
e
> >                  * features this value needs to be provided from
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 975087553ea0..0d290535a6e5 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -674,6 +674,9 @@ typedef struct drm_i915_irq_wait {
> >   */
> >  #define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> >
> > +/* Query if the kernel supports the I915_USERPTR_PROBE flag. */
> > +#define I915_PARAM_HAS_USERPTR_PROBE 56
> > +
> >  /* Must be kept compact -- no holes and well documented */
> >
> >  typedef struct drm_i915_getparam {
> > @@ -2222,12 +2225,29 @@ struct drm_i915_gem_userptr {
> >          * through the GTT. If the HW can't support readonly access, an=
 error is
> >          * returned.
> >          *
> > +        * I915_USERPTR_PROBE:
> > +        *
> > +        * Probe the provided @user_ptr range and validate that the @us=
er_ptr is
> > +        * indeed pointing to normal memory and that the range is also =
valid.
> > +        * For example if some garbage address is given to the kernel, =
then this
> > +        * should complain.
> > +        *
> > +        * Returns -EFAULT if the probe failed.
> > +        *
> > +        * Note that this doesn't populate the backing pages, and also =
doesn't
> > +        * guarantee that the object will remain valid when the object =
is
> > +        * eventually used.
> > +        *
> > +        * The kernel supports this feature if I915_PARAM_HAS_USERPTR_P=
ROBE
> > +        * returns a non-zero value.
> > +        *
> >          * I915_USERPTR_UNSYNCHRONIZED:
> >          *
> >          * NOT USED. Setting this flag will result in an error.
> >          */
> >         __u32 flags;
> >  #define I915_USERPTR_READ_ONLY 0x1
> > +#define I915_USERPTR_PROBE 0x2
> >  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> >         /**
> >          * @handle: Returned handle for the object.
> > --
> > 2.26.3
> >
