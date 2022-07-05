Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D8F567179
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C469814AF23;
	Tue,  5 Jul 2022 14:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E1A14B293;
 Tue,  5 Jul 2022 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657032507; x=1688568507;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=efP950ZFHohOD2R/RWS0IuWYi2exBeNgpmvgA1vkPn8=;
 b=WzLqdQ/5Ii0Pmpy34ElHUTsYZgD4aBuZTTjfxWtFz3Dk3kgjTg7dj1PG
 H+g2heiyPFQyqZBfMqWrAfigSeJGUwXdDge0MHsmM0MD4Ah5KIDJKjEaN
 LbLTAIIPWO+eFCAZUiNBQR+9KYQXI75DuPKgyTv9DUxd/OEfqW2ssWE1H
 hHKeNtxO8lzbfi0a8wxVSiYryC/f8cQbRecpX15OZTzoJp584j4ztCvZ5
 alry2bfZRTTPFXSfPZzbT1jfl+a2rVobAH6CsBZrsToX3tVng/KuThh3D
 +2JYnPVLiKd4GTkhgKwQamidwNodSkgjNw7T0INpjdXoa/ftDKNKc0VId A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="283398938"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="283398938"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:48:25 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="619858044"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:48:23 -0700
Date: Tue, 5 Jul 2022 16:48:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 3/7] drm/i915: Check for integer truncation on
 scatterlist creation
Message-ID: <20220705164819.5d3d7c18@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-4-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-4-gwan-gyeong.mun@intel.com>
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

On Tue,  5 Jul 2022 15:24:51 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> From: Chris Wilson <chris@chris-wilson.co.uk>
>=20
> There is an impedance mismatch between the scatterlist API using unsigned
> int and our memory/page accounting in unsigned long. That is we may try
> to create a scatterlist for a large object that overflows returning a
> small table into which we try to fit very many pages. As the object size
> is under control of userspace, we have to be prudent and catch the
> conversion errors.
>=20
> To catch the implicit truncation as we switch from unsigned long into the
> scatterlist's unsigned int, we use overflows_type check and report
> E2BIG prior to the operation. This is already used in our create ioctls to
> indicate if the uABI request is simply too large for the backing store.
> Failing that type check, we have a second check at sg_alloc_table time
> to make sure the values we are passing into the scatterlist API are not
> truncated.
>=20
> It uses pgoff_t for locals that are dealing with page indices, in this
> case, the page count is the limit of the page index.
> And it uses safe_conversion() macro which performs a type conversion (cas=
t)
> of an integer value into a new variable, checking that the destination is
> large enough to hold the source value.
>=20
> v2: Move added i915_utils's macro into drm_util header (Jani N)
>=20
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_internal.c | 6 ++++--
>  drivers/gpu/drm/i915/gem/i915_gem_object.h   | 3 ---
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c     | 4 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c    | 5 ++++-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 4 ++++
>  drivers/gpu/drm/i915/gem/i915_gem_userptr.c  | 5 ++++-
>  drivers/gpu/drm/i915/gvt/dmabuf.c            | 9 +++++----
>  drivers/gpu/drm/i915/i915_scatterlist.h      | 8 ++++++++
>  8 files changed, 33 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_internal.c
> index c698f95af15f..ff2e6e780631 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -37,10 +37,13 @@ static int i915_gem_object_get_pages_internal(struct =
drm_i915_gem_object *obj)
>  	struct sg_table *st;
>  	struct scatterlist *sg;
>  	unsigned int sg_page_sizes;
> -	unsigned int npages;
> +	pgoff_t npages; /* restricted by sg_alloc_table */
>  	int max_order;
>  	gfp_t gfp;
> =20
> +	if (!safe_conversion(&npages, obj->base.size >> PAGE_SHIFT))
> +		return -E2BIG;
> +
>  	max_order =3D MAX_ORDER;
>  #ifdef CONFIG_SWIOTLB
>  	if (is_swiotlb_active(obj->base.dev->dev)) {
> @@ -67,7 +70,6 @@ static int i915_gem_object_get_pages_internal(struct dr=
m_i915_gem_object *obj)
>  	if (!st)
>  		return -ENOMEM;
> =20
> -	npages =3D obj->base.size / PAGE_SIZE;
>  	if (sg_alloc_table(st, npages, GFP_KERNEL)) {
>  		kfree(st);
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index a60c6f4517d5..31bb09dccf2f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -26,9 +26,6 @@ enum intel_region_id;
>   * this and catch if we ever need to fix it. In the meantime, if you do
>   * spot such a local variable, please consider fixing!
>   *
> - * Aside from our own locals (for which we have no excuse!):
> - * - sg_table embeds unsigned int for nents
> - *
>   * We can check for invalidly typed locals with typecheck(), see for exa=
mple
>   * i915_gem_object_get_sg().
>   */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i=
915/gem/i915_gem_phys.c
> index 0d0e46dae559..88ba7266a3a5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
> @@ -28,6 +28,10 @@ static int i915_gem_object_get_pages_phys(struct drm_i=
915_gem_object *obj)
>  	void *dst;
>  	int i;
> =20
> +	/* Contiguous chunk, with a single scatterlist element */
> +	if (overflows_type(obj->base.size, sg->length))
> +		return -E2BIG;
> +
>  	if (GEM_WARN_ON(i915_gem_object_needs_bit17_swizzle(obj)))
>  		return -EINVAL;
> =20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/=
i915/gem/i915_gem_shmem.c
> index 4eed3dd90ba8..604e8829e8ea 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -193,13 +193,16 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
>  	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>  	struct intel_memory_region *mem =3D obj->mm.region;
>  	struct address_space *mapping =3D obj->base.filp->f_mapping;
> -	const unsigned long page_count =3D obj->base.size / PAGE_SIZE;
>  	unsigned int max_segment =3D i915_sg_segment_size();
>  	struct sg_table *st;
>  	struct sgt_iter sgt_iter;
> +	pgoff_t page_count;
>  	struct page *page;
>  	int ret;
> =20
> +	if (!safe_conversion(&page_count, obj->base.size >> PAGE_SHIFT))
> +		return -E2BIG;
> +
>  	/*
>  	 * Assert that the object is not currently in any GPU domain. As it
>  	 * wasn't in the GTT, there shouldn't be any way it could have been in
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 50a02d850139..cdcb3ee0c433 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -815,6 +815,10 @@ static int i915_ttm_get_pages(struct drm_i915_gem_ob=
ject *obj)
>  {
>  	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
>  	struct ttm_placement placement;
> +	pgoff_t num_pages;
> +
> +	if (!safe_conversion(&num_pages, obj->base.size >> PAGE_SHIFT))
> +		return -E2BIG;
> =20
>  	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
> =20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_userptr.c
> index 094f06b4ce33..25785c3a0083 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
> @@ -128,13 +128,16 @@ static void i915_gem_object_userptr_drop_ref(struct=
 drm_i915_gem_object *obj)
> =20
>  static int i915_gem_userptr_get_pages(struct drm_i915_gem_object *obj)
>  {
> -	const unsigned long num_pages =3D obj->base.size >> PAGE_SHIFT;
>  	unsigned int max_segment =3D i915_sg_segment_size();
>  	struct sg_table *st;
>  	unsigned int sg_page_sizes;
>  	struct page **pvec;
> +	pgoff_t num_pages; /* limited by sg_alloc_table_from_pages_segment */
>  	int ret;
> =20
> +	if (!safe_conversion(&num_pages, obj->base.size >> PAGE_SHIFT))
> +		return -E2BIG;
> +
>  	st =3D kmalloc(sizeof(*st), GFP_KERNEL);
>  	if (!st)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 01e54b45c5c1..795270cb4ec2 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -42,8 +42,7 @@
> =20
>  #define GEN8_DECODE_PTE(pte) (pte & GENMASK_ULL(63, 12))
> =20
> -static int vgpu_gem_get_pages(
> -		struct drm_i915_gem_object *obj)
> +static int vgpu_gem_get_pages(struct drm_i915_gem_object *obj)
>  {
>  	struct drm_i915_private *dev_priv =3D to_i915(obj->base.dev);
>  	struct intel_vgpu *vgpu;
> @@ -52,7 +51,10 @@ static int vgpu_gem_get_pages(
>  	int i, j, ret;
>  	gen8_pte_t __iomem *gtt_entries;
>  	struct intel_vgpu_fb_info *fb_info;
> -	u32 page_num;
> +	pgoff_t page_num;
> +
> +	if (!safe_conversion(&page_num, obj->base.size >> PAGE_SHIFT))
> +		return -E2BIG;
> =20
>  	fb_info =3D (struct intel_vgpu_fb_info *)obj->gvt_info;
>  	if (drm_WARN_ON(&dev_priv->drm, !fb_info))
> @@ -66,7 +68,6 @@ static int vgpu_gem_get_pages(
>  	if (unlikely(!st))
>  		return -ENOMEM;
> =20
> -	page_num =3D obj->base.size >> PAGE_SHIFT;
>  	ret =3D sg_alloc_table(st, page_num, GFP_KERNEL);
>  	if (ret) {
>  		kfree(st);
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i9=
15/i915_scatterlist.h
> index 12c6a1684081..c4d4d3c84cff 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -218,4 +218,12 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const =
struct drm_mm_node *node,
>  struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource=
 *res,
>  						     u64 region_start);
> =20
> +/* Wrap scatterlist.h to sanity check for integer truncation */
> +typedef unsigned int __sg_size_t; /* see linux/scatterlist.h */
> +#define sg_alloc_table(sgt, nents, gfp) \
> +	overflows_type(nents, __sg_size_t) ? -E2BIG : (sg_alloc_table)(sgt, (__=
sg_size_t)(nents), gfp)
> +
> +#define sg_alloc_table_from_pages_segment(sgt, pages, npages, offset, si=
ze, max_segment, gfp) \
> +	overflows_type(npages, __sg_size_t) ? -E2BIG : (sg_alloc_table_from_pag=
es_segment)(sgt, pages, (__sg_size_t)(npages), offset, size, max_segment, g=
fp)
> +
>  #endif
