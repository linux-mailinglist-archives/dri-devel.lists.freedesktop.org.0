Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54853A13C79
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CED110E10E;
	Thu, 16 Jan 2025 14:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajLqNI51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A6410E993;
 Thu, 16 Jan 2025 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737038404; x=1768574404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sSMUcfxWe8QTJ1YAvXGZJC+o+Hw5k0mD5k+2Ts9sdqQ=;
 b=ajLqNI51wc53uyD8XG5CHhAxi6+73iEVwuJ77R5JAnOi4BT2vL+38W/n
 CzKQDUIpl1CSH8zibwlYUnJm4cAAwFCUlD7idFqNNx84CWrAYraKC3qf2
 MFXUYH/jPM5AMJ1TRWiEDHGqn/IikqNTqqoYBxT4ed2WmnQ0f67UpQ4Vf
 9wkmUhiJOAwiTQEaybf/aifpQWI/f1P5+ZQE8M80HYvco/MypP6HYuJXD
 cvJuSnHETH58v8NaZwi9SpEwC/wXKdAtEH1/v5u4EooErd5PeJyfnHXsp
 7HB5DOP41zAMmoOzgc8zr1akJLRIB8SvvKgfIVKJxPEzuHLGKEwoYBffk Q==;
X-CSE-ConnectionGUID: s0JB9hUfRU25sVaK8k/W/Q==
X-CSE-MsgGUID: ptPz8vNfQMmFAuMYr4zSsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48426881"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="48426881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 06:40:03 -0800
X-CSE-ConnectionGUID: UtsjycX6T46YgMfiVpLaSw==
X-CSE-MsgGUID: Nl6/SKjLQqSluqoYmjWnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="105664532"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Jan 2025 06:39:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Jan 2025 16:39:57 +0200
Date: Thu, 16 Jan 2025 16:39:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Brian Geffon <bgeffon@google.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com,
 jani.saarinen@intel.com, tomasz.mistat@intel.com,
 vidya.srinivas@intel.com, jani.nikula@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH] drm/i915: Fix page cleanup on DMA remap failure
Message-ID: <Z4kaPYysmAOW-KlZ@intel.com>
References: <20250116135636.410164-1-bgeffon@google.com>
 <Z4kWms-eFWxddspp@intel.com>
 <CADyq12yAG6fgnaaKLoKic+BU5qNBcbsNZxd6Cg+tNjQx2xxjWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADyq12yAG6fgnaaKLoKic+BU5qNBcbsNZxd6Cg+tNjQx2xxjWg@mail.gmail.com>
X-Patchwork-Hint: comment
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

On Thu, Jan 16, 2025 at 09:36:42AM -0500, Brian Geffon wrote:
> On Thu, Jan 16, 2025 at 9:24 AM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Thu, Jan 16, 2025 at 08:56:36AM -0500, Brian Geffon wrote:
> > > When converting to folios the cleanup path of shmem_get_pages() was
> > > missed. When a DMA remap fails and the max segment size is greater than
> > > PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
> > > size. The cleanup code isn't properly using the folio apis and as a
> > > result isn't handling compound pages correctly.
> > >
> > > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> > > Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a folio_batch")
> > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > Suggested-by: Tomasz Figa <tfiga@google.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 13 +++++--------
> > >  1 file changed, 5 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > > index fe69f2c8527d..02ddab5bf5c0 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > > @@ -37,8 +37,6 @@ void shmem_sg_free_table(struct sg_table *st, struct address_space *mapping,
> > >       struct folio *last = NULL;
> > >       struct page *page;
> > >
> > > -     mapping_clear_unevictable(mapping);
> > > -
> >
> > The assymmetry here between the alloc vs. free is a bit annoying.
> > Maybe we can just keep this here?
> 
> If you want, I think this can also be fixed by something like the
> following I believe.
> Ultimately we don't want to put page on non-head pages in a compound
> page. What do you think? If you like this better I can test and mail a v2.

I think having it all in one place would be nicer, if only to avoid
similar oversights in the future.

> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index fe69f2c8527d..b79cd396e878 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -239,8 +239,14 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
>                  * for PAGE_SIZE chunks instead may be helpful.
>                  */
>                 if (max_segment > PAGE_SIZE) {
> -                       for_each_sgt_page(page, sgt_iter, st)
> +                       struct folio *last = NULL;
> +                       for_each_sgt_page(page, sgt_iter, st) {
> +                               struct folio *folio = page_folio(page);
> +                               if (folio == last)
> +                                       continue;
> +                               last = folio;
>                                 put_page(page);
> +                       }
>                         sg_free_table(st);
>                         kfree(st);
> 
> 
> --
> 2.48.0.rc2.279.g1de40edade-goog
> 
> 
> >
> > Or if avoiding the ping-pong actually mattes in the gtt prepare
> > error case, then maybe we should rename this guy into
> > __shmem_sg_free_table() without the mapping_clear_unevictable()
> > and wrap it in a higher level shmem_sg_free_table() that does
> > everything?
> >
> > >       folio_batch_init(&fbatch);
> > >       for_each_sgt_page(page, sgt_iter, st) {
> > >               struct folio *folio = page_folio(page);
> > > @@ -180,10 +178,10 @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_table *st,
> > >       return 0;
> > >  err_sg:
> > >       sg_mark_end(sg);
> > > +     mapping_clear_unevictable(mapping);
> > >       if (sg != st->sgl) {
> > >               shmem_sg_free_table(st, mapping, false, false);
> > >       } else {
> > > -             mapping_clear_unevictable(mapping);
> > >               sg_free_table(st);
> > >       }
> > >
> > > @@ -209,8 +207,6 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
> > >       struct address_space *mapping = obj->base.filp->f_mapping;
> > >       unsigned int max_segment = i915_sg_segment_size(i915->drm.dev);
> > >       struct sg_table *st;
> > > -     struct sgt_iter sgt_iter;
> > > -     struct page *page;
> > >       int ret;
> > >
> > >       /*
> > > @@ -239,9 +235,8 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
> > >                * for PAGE_SIZE chunks instead may be helpful.
> > >                */
> > >               if (max_segment > PAGE_SIZE) {
> > > -                     for_each_sgt_page(page, sgt_iter, st)
> > > -                             put_page(page);
> > > -                     sg_free_table(st);
> > > +                     /* Leave the mapping unevictable while we retry */
> > > +                     shmem_sg_free_table(st, mapping, false, false);
> > >                       kfree(st);
> > >
> > >                       max_segment = PAGE_SIZE;
> > > @@ -265,6 +260,7 @@ static int shmem_get_pages(struct drm_i915_gem_object *obj)
> > >       return 0;
> > >
> > >  err_pages:
> > > +     mapping_clear_unevictable(mapping);
> > >       shmem_sg_free_table(st, mapping, false, false);
> > >       /*
> > >        * shmemfs first checks if there is enough memory to allocate the page
> > > @@ -402,6 +398,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
> > >       if (i915_gem_object_needs_bit17_swizzle(obj))
> > >               i915_gem_object_save_bit_17_swizzle(obj, pages);
> > >
> > > +     mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> > >       shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> > >                           obj->mm.dirty, obj->mm.madv == I915_MADV_WILLNEED);
> > >       kfree(pages);
> > > --
> > > 2.48.0.rc2.279.g1de40edade-goog
> >
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
