Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A832E3D5CB8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88DD6EC2A;
	Mon, 26 Jul 2021 15:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC8B6EB9C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:14:44 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id x192so15447981ybe.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jifQRgGL6BJnh2QHxNCgt5ahwpxhb+ayyK8E8mUw8ys=;
 b=B+PXj7s3DgXdxAobXGNksbTi122W3r9yny4USm536JCHCcuNREuqaxp3S3vSZw4S4k
 14nUhp1SyPZ/G5sgaOSKgXhqLScIqx2GDd9YEHAY9lIuGkzxm6W/q9ytt44UikJMZqvn
 1Eg7ALax9R4oCl0dhdCEgxQ8zd2Ggm+zIqyRu4tFmfd1xlTTT0iutEnzXDcVKlUCSzow
 n7v3fIIAKlyQvl4lE5NB51xL42GBsPpSR3f+iG2GI5SFSEaLfnchCU1ZT1r/PEL8TC7P
 tHDY7xchWuh+OTOdir50vUIEzUCuL9Ra0zd6MCcnPosDvM3CF+fbWXIplN1VgJjnofe/
 fywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jifQRgGL6BJnh2QHxNCgt5ahwpxhb+ayyK8E8mUw8ys=;
 b=sjY1SKf05/KCZd/X+GFYVHB9AuvP+gSviwGNktmKkRVI8Uoa4ER3/et89p94wrKR7V
 44mTB6J8hjVanrpE8B85Ti4992jmAWhLSLDHnHIKea2Tlnt69jvgAq5UKRM4+JUkeGqe
 4w+s8f/6NkB50qv/cGD2KhG/ogR9hal/Ga7AAIrzNHHzX3ZvGmfBqYSNBSlvpPMHn/li
 3rKGEzk/GyjSOr9mQAs4spBa9pMK/KvGfouHAoTCWqYIpHHr6+4VmWqnNp73BVmEl6+H
 R6ddNzMOQ49F9NrPuFrP3Kn9NRTgbC6cJyPtdF3YFrkCrxaYBvKr+nHZhA9SbixRW/ld
 I2+A==
X-Gm-Message-State: AOAM531vYExWplvQbnSpKvYbqjkj1VFWcSsjZ+Skxs7Q1QaklMEKipda
 RgVZlfENRiN98tqx+RPTG0waqkp8Sw1TfMMam4BJ7A==
X-Google-Smtp-Source: ABdhPJwKW13ai9/QuQoz523Eo9tHb46TXlmLoiSEh7VOL2y0i8sTSD/vJFcvbT2dw0Cz/bAbix3IisAadTiMVNsmVkE=
X-Received: by 2002:a25:208b:: with SMTP id
 g133mr23935540ybg.211.1627312483937; 
 Mon, 26 Jul 2021 08:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113405.427004-1-matthew.auld@intel.com>
 <0988bf67-c42a-1e7e-af77-ae2da65b036f@linux.intel.com>
In-Reply-To: <0988bf67-c42a-1e7e-af77-ae2da65b036f@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:14:32 -0500
Message-ID: <CAOFGe94-StYYc3Fk70u3h0xp2F4RqONb96cnFLhgnhxOVKi8JA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/userptr: Probe existence of backing struct pages
 upon creation
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 3:31 AM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Op 23-07-2021 om 13:34 schreef Matthew Auld:
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
> > +     const unsigned long end =3D addr + len;
> > +     struct vm_area_struct *vma;
> > +     int ret =3D -EFAULT;
> > +
> > +     mmap_read_lock(mm);
> > +     for (vma =3D find_vma(mm, addr); vma; vma =3D vma->vm_next) {
> > +             /* Check for holes, note that we also update the addr bel=
ow */
> > +             if (vma->vm_start > addr)
> > +                     break;
> > +
> > +             if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
> > +                     break;
> > +
> > +             if (vma->vm_end >=3D end) {
> > +                     ret =3D 0;
> > +                     break;
> > +             }
> > +
> > +             addr =3D vma->vm_end;
> > +     }
> > +     mmap_read_unlock(mm);
> > +
> > +     return ret;
> > +}
> > +
> >  /*
> >   * Creates a new mm object that wraps some normal memory from the proc=
ess
> >   * context - user memory.
> > @@ -477,7 +505,8 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >       }
> >
> >       if (args->flags & ~(I915_USERPTR_READ_ONLY |
> > -                         I915_USERPTR_UNSYNCHRONIZED))
> > +                         I915_USERPTR_UNSYNCHRONIZED |
> > +                         I915_USERPTR_PROBE))
> >               return -EINVAL;
> >
> >       if (i915_gem_object_size_2big(args->user_size))
> > @@ -504,6 +533,16 @@ i915_gem_userptr_ioctl(struct drm_device *dev,
> >                       return -ENODEV;
> >       }
> >
> > +     if (args->flags & I915_USERPTR_PROBE) {
> > +             /*
> > +              * Check that the range pointed to represents real struct
> > +              * pages and not iomappings (at this moment in time!)
> > +              */
> > +             ret =3D probe_range(current->mm, args->user_ptr, args->us=
er_size);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> >  #ifdef CONFIG_MMU_NOTIFIER
> >       obj =3D i915_gem_object_alloc();
> >       if (obj =3D=3D NULL)
> > diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i91=
5/i915_getparam.c
> > index 24e18219eb50..bbb7cac43eb4 100644
> > --- a/drivers/gpu/drm/i915/i915_getparam.c
> > +++ b/drivers/gpu/drm/i915/i915_getparam.c
> > @@ -134,6 +134,7 @@ int i915_getparam_ioctl(struct drm_device *dev, voi=
d *data,
> >       case I915_PARAM_HAS_EXEC_FENCE_ARRAY:
> >       case I915_PARAM_HAS_EXEC_SUBMIT_FENCE:
> >       case I915_PARAM_HAS_EXEC_TIMELINE_FENCES:
> > +     case I915_PARAM_HAS_USERPTR_PROBE:
> >               /* For the time being all of these are always true;
> >                * if some supported hardware does not have one of these
> >                * features this value needs to be provided from
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
> >        * through the GTT. If the HW can't support readonly access, an e=
rror is
> >        * returned.
> >        *
> > +      * I915_USERPTR_PROBE:
> > +      *
> > +      * Probe the provided @user_ptr range and validate that the @user=
_ptr is
> > +      * indeed pointing to normal memory and that the range is also va=
lid.
> > +      * For example if some garbage address is given to the kernel, th=
en this
> > +      * should complain.
> > +      *
> > +      * Returns -EFAULT if the probe failed.
> > +      *
> > +      * Note that this doesn't populate the backing pages, and also do=
esn't
> > +      * guarantee that the object will remain valid when the object is
> > +      * eventually used.
> > +      *
> > +      * The kernel supports this feature if I915_PARAM_HAS_USERPTR_PRO=
BE
> > +      * returns a non-zero value.
> > +      *
> >        * I915_USERPTR_UNSYNCHRONIZED:
> >        *
> >        * NOT USED. Setting this flag will result in an error.
> >        */
> >       __u32 flags;
> >  #define I915_USERPTR_READ_ONLY 0x1
> > +#define I915_USERPTR_PROBE 0x2
> >  #define I915_USERPTR_UNSYNCHRONIZED 0x80000000
> >       /**
> >        * @handle: Returned handle for the object.
>
> Could we use _VALIDATE instead of probe? Or at least pin the pages as wel=
l, so we don't have to do it later?

I only care that the name matches what it does.  _VALIDATE sounds like
it does a full validation of everything such that, if the import
succeeds, execbuf will as well.  If we pin the pages at the same time,
maybe that's true?  _PROBE, on the other hand, sounds a lot more like
a one-time best-effort check which may race with other stuff and
doesn't guarantee future success.  That's in line with what the
current patch does.

> We already have i915_gem_object_userptr_validate, no need to dupe it.

I have no opinion on this.

--Jason
