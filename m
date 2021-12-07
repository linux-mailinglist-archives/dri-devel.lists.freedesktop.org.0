Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9695746C283
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 19:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FE66FACF;
	Tue,  7 Dec 2021 18:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443186FAEE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 18:15:22 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u17so23953583wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yureAynpoBBEpa3IGIRCQv/Mxpk914/bT/LFHO43VII=;
 b=BzcLzpXTrPgMDNeSJ9NKGUfw7edmJznhI3p3Jlu4BwVyggGpwQVrOBesCyYySsLNCd
 Je/cLCv3umcOCu8DU4L+NT4OTcaBTiLgsghsbgO5o/9DhSqO0ifGZbkMI3SLZSg0EMPJ
 sOBzMuVgPH5dCegRt+VPN9RjgJlLrdKL9GHck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yureAynpoBBEpa3IGIRCQv/Mxpk914/bT/LFHO43VII=;
 b=CcHtAptYKv1qdbv2oaeUc97c+7xOjWYRa6Hik0NumHTSmrC3uhXvVqx3COuJJNRpgv
 HCUyD3qFhJS8Wcv5DF5K3Ofp/Ia/wdSRp3OcciWd57w8xLvtsn1+KXq8Y+aUcQd+JevE
 7Cwg4IC1iy79Z7l9uOdQ3e1apFZczhsZgKi4Vi3v+fFVt34/hYxudEusNezkpXdxu9Gs
 kqzcmg3a72SkdPduzaSE02PoLFESfHMctEh3N8He0VcadXJhK7g6gb9Um0IK5LGjQvHL
 bQnet1iaP4rAF/C5/SX0RXknRpNj/uQM8/gVbVuWhcMxtf3q4iaU2fOUgCJIKYOv7FvH
 e1pg==
X-Gm-Message-State: AOAM533jqzlsk9hVLvPSiIlsdUBZDbZggFrAf9tWyMVQBcB4g7I2jkn2
 CxU9cwQjE0ufHosSshOCknosEKfT0kNARA==
X-Google-Smtp-Source: ABdhPJypAGynFO3t1ycslAbOLw9PrnCjrF9i+TGatU84tdHP4WKHBmg0L9NKEHCWcHz/4tiNv2pAUw==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr53030581wrw.104.1638900920707; 
 Tue, 07 Dec 2021 10:15:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x1sm451196wru.40.2021.12.07.10.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 10:15:20 -0800 (PST)
Date: Tue, 7 Dec 2021 19:15:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 03/16] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members, v2.
Message-ID: <Ya+ktjAiEFi5K42y@phenom.ffwll.local>
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-4-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPcJJLV7Sx170FWBdGhc1X+bwC=cshP3ndEHYJvZDmMYw@mail.gmail.com>
 <b7fe0261-2528-b862-ec41-eda79a035a94@linux.intel.com>
 <CAM0jSHMY0DiPC7R_saw6i-q-YWohyc7UsarwTWmiQ1wbmFfgtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHMY0DiPC7R_saw6i-q-YWohyc7UsarwTWmiQ1wbmFfgtw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 06, 2021 at 05:00:46PM +0000, Matthew Auld wrote:
> On Mon, 6 Dec 2021 at 15:18, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > On 06-12-2021 14:13, Matthew Auld wrote:
> > > On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
> > > <maarten.lankhorst@linux.intel.com> wrote:
> > >> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> > >> the special handling, all callers use the defaults anyway. We only remap
> > >> in ggtt, so default case will fall through.
> > >>
> > >> Because we still don't require locking in i915_vma_unpin(), handle this by
> > >> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> > >> unpin, which only fails if we race a against a new pin.
> > >>
> > >> Changes since v1:
> > >> - aliasing gtt sets ZERO_SIZE_PTR, not -ENODEV, remove special case
> > >>   from __i915_vma_get_pages(). (Matt)
> > >>
> > >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> ---
> > >>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
> > >>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
> > >>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 403 ----------------
> > >>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
> > >>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
> > >>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
> > >>  drivers/gpu/drm/i915/i915_vma.c               | 444 ++++++++++++++++--
> > >>  drivers/gpu/drm/i915/i915_vma.h               |   3 +
> > >>  drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
> > >>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  12 +-
> > >>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
> > >>  11 files changed, 424 insertions(+), 492 deletions(-)
> > >>
> > > <snip>
> > >
> > >>  }
> > >> @@ -854,18 +1233,22 @@ static int vma_get_pages(struct i915_vma *vma)
> > >>  static void __vma_put_pages(struct i915_vma *vma, unsigned int count)
> > >>  {
> > >>         /* We allocate under vma_get_pages, so beware the shrinker */
> > >> -       mutex_lock_nested(&vma->pages_mutex, SINGLE_DEPTH_NESTING);
> > >> +       struct sg_table *pages = READ_ONCE(vma->pages);
> > >> +
> > >>         GEM_BUG_ON(atomic_read(&vma->pages_count) < count);
> > >> +
> > >>         if (atomic_sub_return(count, &vma->pages_count) == 0) {
> > > Does this emit a barrier? Or can the READ_ONCE(vma->pages) be moved
> > > past this, and does that matter?
> >
> > It's not that tricky, and only there because we still have to support unlocked until patch 13, patch 15 removes it.
> >
> > From the kernel doc:
> >
> >  - RMW operations that have a return value are fully ordered;
> >
> >  - RMW operations that are conditional are unordered on FAILURE,
> >    otherwise the above rules apply.
> >
> > so READ_ONCE followed by a bunch of stuff that only happens when cmpxchg is succesful, is ok.
> >
> > At the beginning of vma_put_pages(), we hold at least 1 reference to vma->pages, and we assume vma->pages is set to something sane.
> >
> > We use READ_ONCE to read vma->pages before decreasing refcount on vma->pages_count, after which we attempt to clear vma->pages.
> >
> > HOWEVER, as we are not guaranteed to hold the lock, we are careful. New pages may have been set by __i915_vma_get_pages(), using xchg.
> >
> > In that case, we fail, and _get_pages() cleans up instead.
> >
> > After that, we drop the reference to the object's page pin, which we needed for the pages != vma->obj->mm.pages comparison.
> 
> Ok, I can buy that.

Maybe I'm late, but this stuff needs to be documented in a comment right
above the barrier, e.g.

/* atomic_sub_return provides *exact type of barrier, e.g. if it's
 * conditional or whatever* which orders thing_A against thing_B. The
 * counterpart barriers is found in function_C()
 */

Ofc function_C() then needs to have a similar comment. Ideally the comment
explains anything else that needs explaining, like we need to order
thing_A against thing_B, the above is just the absolute bare minimum.

This is required (and yes we've been extremely bad at not doing this) per
kernel coding style, so not just i915 rules.

If we don't have it (because patch landed already, I'm horribly burried)
please add it these comment in fixup patches.
-Daniel

> 
> >
> > >> -               vma->ops->clear_pages(vma);
> > >> -               GEM_BUG_ON(vma->pages);
> > >> +               if (pages == cmpxchg(&vma->pages, pages, NULL) &&
> > > try_cmpxchg? Also can pages be NULL here?
> >
> > cmpxchg is correct here. We don't need to loop, and only need to try once. The only time we can fail, will happen after at least one get_pages() call, and that would have otherwise freed it for us.
> >
> > > As an aside, is it somehow possible to re-order the series or
> > > something to avoid introducing the transient lockless trickery here? I
> > > know by the end of the series this all gets removed, but still just
> > > slightly worried here.
> >
> > The locked version would actually be identical in this case.
> >
> > I removed the locking because it didn't add anything. The same ops would be required, only with additional locking for something that is using atomic ops for a refcount anyway..
> >
> >
> > >> +                   pages != vma->obj->mm.pages) {
> > >> +                       sg_free_table(pages);
> > >> +                       kfree(pages);
> > >> +               }
> > >>
> > >>                 i915_gem_object_unpin_pages(vma->obj);
> > >>         }
> > >> -       mutex_unlock(&vma->pages_mutex);
> > >>  }
> >
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
