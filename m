Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D53D12C1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C466E860;
	Wed, 21 Jul 2021 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C296E860
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:47:41 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id i18so3830831yba.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4Cp4NuHROQYq6rh6+QQpfdOUWIhFZ+71f9w2Yiu1P0=;
 b=X+8gMfTyYUG96h1CkNk2rnjRAu9/qEw8INLjoNcfDhDslmcVaebnTMARN7YC3ik0Cg
 RqN8JUKHT5zdKgkkb6jLGt1oudCYYOVOixYKZ0d7Xv9NKoBqVp0kxSHtL+LjULqqsTY7
 H4a7y8Bw9y8E6kX88Yq7kp+X9gEbyf57OUNIqLe8Vkzsd2V3tMe6BE/jpvP2puSlTeps
 6Wjxp+RgjDZQu7WNgD0enRx4O7kqBcq83MR9Rk5iBQMkWy3jOUrye+UmRXanxu76fCxe
 HnihZswYlUg0Ph5zvI7Sg62iUyFZTC2+b+BBbk0wIjFS2XgJ3lUiA3LjTlfyZCbdvOeW
 UDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4Cp4NuHROQYq6rh6+QQpfdOUWIhFZ+71f9w2Yiu1P0=;
 b=fgNwQy0zLYhGIEwDR6+XOq3Dkn0/7D47Ou6/QxYoe6eJVsvAHQt1n194l6nnGMyAfS
 5lFKY5Qe6qUnIxfJ5V34zDfD4be1NEnjCZ4DoJCyKIChKQ2dWsuXqDb4x1TSFenQU167
 r51LT4u49b6wfNzUAzjMprGSlgOdNdnum5jej99b2+uB3Fpnk36mC//knWldj9Y4acQX
 wDFpouCddQm0N2tavzq9vrgaMzx+A0VF7uTK89pebhZuFfPrP+7Lx0G1RBwokZ3aSKfm
 KLczweF0SK73s/4AkJCc3ThEkpHjyO/Pubg+7HuztgHagVKzR6UZKu3y0C6vm4qTFEtd
 +n6A==
X-Gm-Message-State: AOAM533pTXMfr52JYd1thNMuvPo/n/TQ6WaKevtdOualvBe7KOPEYN59
 2D6e4UOb6FCvHZr5F1UsTeUA8qNTeO6Rv3PzNeTuuA==
X-Google-Smtp-Source: ABdhPJwh64CWSLAEysv3vYh7YmQaM1zcgEdgn+VaymmtdTDiCk2wkKAQU7Oqe/1J3gUGUzq0XVyKPqIpkOczrwcrHCs=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr47285683ybi.241.1626882460706; 
 Wed, 21 Jul 2021 08:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-4-jason@jlekstrand.net>
 <CAM0jSHPKaFkT=U-Ra1V8HS88ciAKhQ32ZZtBDkHutH74P5i8BQ@mail.gmail.com>
 <CAOFGe96dsX4x6CFYL+CT+b11Lwkv6a-Pn=MKJqgtbPBC+nZ60w@mail.gmail.com>
 <CAM0jSHMMN6neG5DtiqWb54ZA46gh4iCmB94i7ZJCH=YTS8t=bg@mail.gmail.com>
In-Reply-To: <CAM0jSHMMN6neG5DtiqWb54ZA46gh4iCmB94i7ZJCH=YTS8t=bg@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Jul 2021 10:47:29 -0500
Message-ID: <CAOFGe97n5i7YR0ik1cP4Cvp5x48Z15Muo8pHY1EjnyD7uKO-wg@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/i915/gem: Unify user object creation
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 3:25 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Tue, 20 Jul 2021 at 23:04, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Tue, Jul 20, 2021 at 4:35 AM Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > >
> > > > Instead of hand-rolling the same three calls in each function, pull them
> > > > into an i915_gem_object_create_user helper.  Apart from re-ordering of
> > > > the placements array ENOMEM check, the only functional change here
> > > > should be that i915_gem_dumb_create now calls i915_gem_flush_free_objects
> > > > which it probably should have been calling all along.
> > > >
> > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > ---
> > > >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 106 +++++++++------------
> > > >  1 file changed, 43 insertions(+), 63 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > > index 391c8c4a12172..69bf9ec777642 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > > > @@ -11,13 +11,14 @@
> > > >  #include "i915_trace.h"
> > > >  #include "i915_user_extensions.h"
> > > >
> > > > -static u32 object_max_page_size(struct drm_i915_gem_object *obj)
> > > > +static u32 object_max_page_size(struct intel_memory_region **placements,
> > > > +                               unsigned int n_placements)
> > > >  {
> > > >         u32 max_page_size = 0;
> > > >         int i;
> > > >
> > > > -       for (i = 0; i < obj->mm.n_placements; i++) {
> > > > -               struct intel_memory_region *mr = obj->mm.placements[i];
> > > > +       for (i = 0; i < n_placements; i++) {
> > > > +               struct intel_memory_region *mr = placements[i];
> > > >
> > > >                 GEM_BUG_ON(!is_power_of_2(mr->min_page_size));
> > > >                 max_page_size = max_t(u32, max_page_size, mr->min_page_size);
> > > > @@ -81,22 +82,35 @@ static int i915_gem_publish(struct drm_i915_gem_object *obj,
> > > >         return 0;
> > > >  }
> > > >
> > > > -static int
> > > > -i915_gem_setup(struct drm_i915_gem_object *obj, u64 size)
> > > > +static struct drm_i915_gem_object *
> > > > +i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
> > > > +                           struct intel_memory_region **placements,
> > > > +                           unsigned int n_placements)
> > > >  {
> > > > -       struct intel_memory_region *mr = obj->mm.placements[0];
> > > > +       struct intel_memory_region *mr = placements[0];
> > > > +       struct drm_i915_gem_object *obj;
> > > >         unsigned int flags;
> > > >         int ret;
> > > >
> > > > -       size = round_up(size, object_max_page_size(obj));
> > > > +       i915_gem_flush_free_objects(i915);
> > > > +
> > > > +       obj = i915_gem_object_alloc();
> > > > +       if (!obj)
> > > > +               return ERR_PTR(-ENOMEM);
> > > > +
> > > > +       size = round_up(size, object_max_page_size(placements, n_placements));
> > > >         if (size == 0)
> > > > -               return -EINVAL;
> > > > +               return ERR_PTR(-EINVAL);
> > > >
> > > >         /* For most of the ABI (e.g. mmap) we think in system pages */
> > > >         GEM_BUG_ON(!IS_ALIGNED(size, PAGE_SIZE));
> > > >
> > > >         if (i915_gem_object_size_2big(size))
> > > > -               return -E2BIG;
> > > > +               return ERR_PTR(-E2BIG);
> > > > +
> > > > +       ret = object_set_placements(obj, placements, n_placements);
> > > > +       if (ret)
> > > > +               goto object_free;
> > >
> > > Thinking on this again, it might be way too thorny to expose
> > > create_user as-is to other parts of i915, like we do in the last
> > > patch. Since the caller will be expected to manually validate the
> > > placements, otherwise we might crash and burn in weird ways as new
> > > users pop up. i.e it needs the same validation that happens as part of
> > > the extension. Also as new extensions arrive, like with PXP, that also
> > > has to get bolted onto create_user, which might have its own hidden
> > > constraints.
> >
> > Perhaps.  Do you have a suggestion for how to make it available to
> > selftests without exposing it to "the rest of i915"?  If you want, I
> > can make create_user duplicate the placements uniqueness check.
> > That's really the only validation currently in the ioctl besides all
> > the stuff for making sure that the class/instance provided by the user
> > isn't bogus.  But if we've got real i915_memory_region pointers, we
> > don't need that.
>
> Yeah, I guess the concern here was duplicated placements(that would
> change the meaning of n_placements > 1), and then ofc regions not
> supported by the device. Also maybe stolen which doesn't have a TTM
> backend yet.
>
> If this is just for the selftests, doing what the mman selftests do
> with create_region + set_placements would be one option. Otherwise
> maybe just add  __two_underscores and a big comment, for why you
> should be careful when using this?

I've added __two_underscores and some kerneldoc.  I also looked at
adding some validation to that function.  I'm happy to do so if you'd
like but didn't want to add overhead if you thought __ and a big fat
warning were enough.

--Jason
