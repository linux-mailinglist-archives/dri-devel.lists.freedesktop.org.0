Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF34569055
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF80F10F09F;
	Wed,  6 Jul 2022 17:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B341C10EB54;
 Wed,  6 Jul 2022 17:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657127423; x=1688663423;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TbGQzRVjQ1/KRLj9FlG4JIIf1fYkf9EIHFnhf/OkieA=;
 b=nC5ngAI2BM7Wp2Bq7+VL5Zu1ysQ7j1PbzWouAm15GDaOiPMNg2l64CbW
 4T1AgsUf3M9DqBFLrtkXllvHqfagWLrmsjmFCnH2evGuzO1w+NbsLP+Uh
 996OIA7kh9k9vDMSES8v+EOhfUEVJET8B3SFv4OKdqiwmvDepTyi38een
 hd5ZervmJXyjjPfH9L5NZn6poWzhsCKWzGmgY155dkEMMZju10FXs/fOq
 SkHRa0MO5GXA+KrgCzejxcHF9PddpTrzm1GO8arFH1kNlnGPTqNx/YaQ0
 KeCsLJr8FfG/IvTTTmN6uj2irM1LYWgKP9Y1tIkHz6/xWMdptu0HIInqx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284937420"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="284937420"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 10:10:22 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="620412713"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.32.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 10:10:19 -0700
Date: Wed, 6 Jul 2022 19:10:16 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 2/7] drm/i915/gem: Typecheck page lookups
Message-ID: <20220706191016.5108f063@maurocar-mobl2>
In-Reply-To: <f2f2dd4e-c6b5-8d69-3ddc-e1e1bfdd02f3@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-3-gwan-gyeong.mun@intel.com>
 <20220705163508.4dc35087@maurocar-mobl2>
 <f2f2dd4e-c6b5-8d69-3ddc-e1e1bfdd02f3@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 19:33:22 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> On 7/5/22 5:35 PM, Mauro Carvalho Chehab wrote:
> > On Tue,  5 Jul 2022 15:24:50 +0300
> > Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> >  =20
> >> From: Chris Wilson <chris@chris-wilson.co.uk>
> >>
> >> We need to check that we avoid integer overflows when looking up a pag=
e,
> >> and so fix all the instances where we have mistakenly used a plain
> >> integer instead of a more suitable long. Be pedantic and add integer
> >> typechecking to the lookup so that we can be sure that we are safe.
> >> And it also uses pgoff_t as our page lookups must remain compatible wi=
th
> >> the page cache, pgoff_t is currently exactly unsigned long.
> >>
> >> v2: Move added i915_utils's macro into drm_util header (Jani N)
> >>
> >> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> >> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> Cc: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  7 +-
> >>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 67 ++++++++++++++---=
--
> >>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 ++++---
> >>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
> >>   .../drm/i915/gem/selftests/i915_gem_context.c | 12 ++--
> >>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  8 +--
> >>   .../drm/i915/gem/selftests/i915_gem_object.c  |  8 +--
> >>   drivers/gpu/drm/i915/i915_gem.c               | 18 +++--
> >>   drivers/gpu/drm/i915/i915_vma.c               |  8 +--
> >>   9 files changed, 100 insertions(+), 55 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/=
drm/i915/gem/i915_gem_object.c
> >> index ccec4055fde3..90996fe8ad45 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >> @@ -421,10 +421,11 @@ void __i915_gem_object_invalidate_frontbuffer(st=
ruct drm_i915_gem_object *obj,
> >>   static void
> >>   i915_gem_object_read_from_page_kmap(struct drm_i915_gem_object *obj,=
 u64 offset, void *dst, int size)
> >>   {
> >> +	pgoff_t idx =3D offset >> PAGE_SHIFT;
> >>   	void *src_map;
> >>   	void *src_ptr;
> >>  =20
> >> -	src_map =3D kmap_atomic(i915_gem_object_get_page(obj, offset >> PAGE=
_SHIFT));
> >> +	src_map =3D kmap_atomic(i915_gem_object_get_page(obj, idx));
> >>  =20
> >>   	src_ptr =3D src_map + offset_in_page(offset);
> >>   	if (!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
> >> @@ -437,9 +438,10 @@ i915_gem_object_read_from_page_kmap(struct drm_i9=
15_gem_object *obj, u64 offset,
> >>   static void
> >>   i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj=
, u64 offset, void *dst, int size)
> >>   {
> >> +	pgoff_t idx =3D offset >> PAGE_SHIFT;
> >> +	dma_addr_t dma =3D i915_gem_object_get_dma_address(obj, idx);
> >>   	void __iomem *src_map;
> >>   	void __iomem *src_ptr;
> >> -	dma_addr_t dma =3D i915_gem_object_get_dma_address(obj, offset >> PA=
GE_SHIFT);
> >>  =20
> >>   	src_map =3D io_mapping_map_wc(&obj->mm.region->iomap,
> >>   				    dma - obj->mm.region->region.start,
> >> @@ -468,6 +470,7 @@ i915_gem_object_read_from_page_iomap(struct drm_i9=
15_gem_object *obj, u64 offset
> >>    */
> >>   int i915_gem_object_read_from_page(struct drm_i915_gem_object *obj, =
u64 offset, void *dst, int size)
> >>   {
> >> +	GEM_BUG_ON(overflows_type(offset >> PAGE_SHIFT, pgoff_t));
> >>   	GEM_BUG_ON(offset >=3D obj->base.size);
> >>   	GEM_BUG_ON(offset_in_page(offset) > PAGE_SIZE - size);
> >>   	GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/=
drm/i915/gem/i915_gem_object.h
> >> index 6f0a3ce35567..a60c6f4517d5 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> @@ -27,8 +27,10 @@ enum intel_region_id;
> >>    * spot such a local variable, please consider fixing!
> >>    *
> >>    * Aside from our own locals (for which we have no excuse!):
> >> - * - sg_table embeds unsigned int for num_pages
> >> - * - get_user_pages*() mixed ints with longs
> >> + * - sg_table embeds unsigned int for nents
> >> + *
> >> + * We can check for invalidly typed locals with typecheck(), see for =
example
> >> + * i915_gem_object_get_sg().
> >>    */
> >>   #define GEM_CHECK_SIZE_OVERFLOW(sz) \
> >>   	GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX)
> >> @@ -366,41 +368,70 @@ int i915_gem_object_set_tiling(struct drm_i915_g=
em_object *obj,
> >>   struct scatterlist *
> >>   __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
> >>   			 struct i915_gem_object_page_iter *iter,
> >> -			 unsigned int n,
> >> -			 unsigned int *offset, bool dma);
> >> +			 pgoff_t  n,
> >> +			 unsigned int *offset);
> >> +
> >> +#define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(__i915_gem_object_get_sg)(obj, it, n, offset); \
> >> +})
> >>  =20
> >>   static inline struct scatterlist *
> >> -i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
> >> -		       unsigned int n,
> >> +i915_gem_object_get_sg(struct drm_i915_gem_object *obj, pgoff_t n,
> >>   		       unsigned int *offset)
> >>   {
> >> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset, f=
alse);
> >> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_page, n, offset);
> >>   }
> >>  =20
> >> +#define i915_gem_object_get_sg(obj, n, offset) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_sg)(obj, n, offset); \
> >> +})
> >> +
> >>   static inline struct scatterlist *
> >> -i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj,
> >> -			   unsigned int n,
> >> +i915_gem_object_get_sg_dma(struct drm_i915_gem_object *obj, pgoff_t n,
> >>   			   unsigned int *offset)
> >>   {
> >> -	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offse=
t, true);
> >> +	return __i915_gem_object_get_sg(obj, &obj->mm.get_dma_page, n, offse=
t);
> >>   }
> >>  =20
> >> +#define i915_gem_object_get_sg_dma(obj, n, offset) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_sg_dma)(obj, n, offset); \
> >> +})
> >> +
> >>   struct page *
> >> -i915_gem_object_get_page(struct drm_i915_gem_object *obj,
> >> -			 unsigned int n);
> >> +i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n);
> >> +
> >> +#define i915_gem_object_get_page(obj, n) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_page)(obj, n); \
> >> +})
> >>  =20
> >>   struct page *
> >> -i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj,
> >> -			       unsigned int n);
> >> +i915_gem_object_get_dirty_page(struct drm_i915_gem_object *obj, pgoff=
_t n);
> >> +
> >> +#define i915_gem_object_get_dirty_page(obj, n) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_dirty_page)(obj, n); \
> >> +})
> >>  =20
> >>   dma_addr_t
> >> -i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj,
> >> -				    unsigned long n,
> >> +i915_gem_object_get_dma_address_len(struct drm_i915_gem_object *obj, =
pgoff_t n,
> >>   				    unsigned int *len);
> >>  =20
> >> +#define i915_gem_object_get_dma_address_len(obj, n, len) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_dma_address_len)(obj, n, len); \
> >> +})
> >> +
> >>   dma_addr_t
> >> -i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj,
> >> -				unsigned long n);
> >> +i915_gem_object_get_dma_address(struct drm_i915_gem_object *obj, pgof=
f_t n);
> >> +
> >> +#define i915_gem_object_get_dma_address(obj, n) ({ \
> >> +	exactly_pgoff_t(n); \
> >> +	(i915_gem_object_get_dma_address)(obj, n); \
> >> +})
> >>  =20
> >>   void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
> >>   				 struct sg_table *pages,
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_pages.c
> >> index 97c820eee115..1d1edcb3514b 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> >> @@ -503,14 +503,16 @@ void __i915_gem_object_release_map(struct drm_i9=
15_gem_object *obj)
> >>   }
> >>  =20
> >>   struct scatterlist *
> >> -__i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
> >> +(__i915_gem_object_get_sg)(struct drm_i915_gem_object *obj,
> >>   			 struct i915_gem_object_page_iter *iter,
> >> -			 unsigned int n,
> >> -			 unsigned int *offset,
> >> -			 bool dma)
> >> +			 pgoff_t n,
> >> +			 unsigned int *offset)
> >> + =20
> >=20
> > Nitpick: no need to place the function name in parenthesis.
> >  =20
> >>   {
> >> -	struct scatterlist *sg;
> >> +	const bool dma =3D iter =3D=3D &obj->mm.get_dma_page ||
> >> +			 iter =3D=3D &obj->ttm.get_io_page;
> >>   	unsigned int idx, count;
> >> +	struct scatterlist *sg;
> >>  =20
> >>   	might_sleep();
> >>   	GEM_BUG_ON(n >=3D obj->base.size >> PAGE_SHIFT);
> >> @@ -618,7 +620,7 @@ __i915_gem_object_get_sg(struct drm_i915_gem_objec=
t *obj,
> >>   }
> >>  =20
> >>   struct page *
> >> -i915_gem_object_get_page(struct drm_i915_gem_object *obj, unsigned in=
t n)
> >> +(i915_gem_object_get_page)(struct drm_i915_gem_object *obj, pgoff_t n=
) =20
> >=20
> > Same as above: why are you placing parenthesis at the function name her=
e?
> > Just use:
> > =09
> > 	struct page *
> > 	i915_gem_object_get_page(struct drm_i915_gem_object *obj, pgoff_t n)
> > =20
> In this case, the macro and function have the same name. If parenthesis=20
> is not used, the following compile error occurs as the macro is applied=20
> to the c code.
>=20
> ./drivers/gpu/drm/i915/gem/i915_gem_object.h:356:55: error: expected=20
> identifier or =E2=80=98(=E2=80=99 before =E2=80=98{=E2=80=99 token
>    356 | #define __i915_gem_object_get_sg(obj, it, n, offset) ({ \
>        |                                                       ^
> drivers/gpu/drm/i915/gem/i915_gem_pages.c:506:1: note: in expansion of=20
> macro =E2=80=98__i915_gem_object_get_sg=E2=80=99
>    506 | __i915_gem_object_get_sg(struct drm_i915_gem_object *obj,
>        | ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> And all of the parts you leave comments below are cases where the names=20
> of macros and functions are the same.

Don't use the same macro name on a function. This is very confusing
and will prevent ever adding documentation for it, as, for kernel-doc,
macros and functions are handled at the same namespace. So, no
duplication is allowed.

Probably the best here would be to replace the macros by inlined
functions.

Regards,
Mauro

