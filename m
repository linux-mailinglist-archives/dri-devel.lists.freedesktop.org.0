Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJzjNOgfi2lBQQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:09:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C111A8F2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65D010E56E;
	Tue, 10 Feb 2026 12:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TStOXcDw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EBE10E569;
 Tue, 10 Feb 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770725347; x=1802261347;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mIs10ri53RIRtIo23znmc4Rxf/xSTJkvL3K5V0NIbQk=;
 b=TStOXcDww89QBdAPvEr2X+8AKFrmBgtd0Cs+7ZSf89bUDLGmw6x2xuep
 IlhYrBa1prPSlg9FHJWEUka6fhEXlcVvTOx4e0m6RLTifJU+zGsVxF4ie
 4Q+OXJB3Zgaaem5sZOY4putDJXGi79/xC3eDGBLzrwkVOtvTGopaffJk0
 D3DUiVV9+OMgS8fz/Yg1R6s37IEeIT0w0A529pV9eOtWEXt3qTbZjtTza
 KhHtoPtleXkooAEZ2GYs2XnmuXTT2lWbo6Z5OFkcXm9AtFR9tQPuKiTH7
 BAT42M2654Rngxd3sL77+Ny+b1eQ13rMDnZQQcrCplO7bROKg3972JvDe A==;
X-CSE-ConnectionGUID: 2WQtOFtnQfuC5M6dfA936w==
X-CSE-MsgGUID: NDkerYTmTUOY7tIuPqH6dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71894612"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71894612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:09:06 -0800
X-CSE-ConnectionGUID: FoPOwjcSRv2wBN8hUblHGw==
X-CSE-MsgGUID: leKGzMZCTvqRN6hlyf/g1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216434815"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.80])
 ([10.245.244.80])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 04:09:05 -0800
Message-ID: <e8ecbbc26d195868bd56825da4aca503521300df.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Date: Tue, 10 Feb 2026 13:09:01 +0100
In-Reply-To: <20260210105929.4089794-6-satyanarayana.k.v.p@intel.com>
References: <20260210105929.4089794-5-satyanarayana.k.v.p@intel.com>
 <20260210105929.4089794-6-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E97C111A8F2
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 10:59 +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using
> kmalloc()
> and searches for a suitable hole in the sub-allocator for the
> requested
> size. If SA allocation is done by holding sub-allocator mutex, this
> design
> can lead to reclaim safety issues.
>=20
> By splitting the kmalloc() step outside of the critical section, we
> allow
> the memory allocation to use GFP_KERNEL (reclaim-safe) while ensuring
> that
> the initialization step that holds reclaim-tainted locks (sub-
> allocator
> mutex) operates in a reclaim-unsafe context with pre-allocated
> memory.
>=20
> This separation prevents potential deadlocks where memory reclaim
> could
> attempt to acquire locks that are already held during the sub-
> allocator
> operations.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org

LGTM.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> ---
> V2 -> V3:
> - Updated commit message (Matt, Thomas & Christian).
> - Removed timeout logic from drm_suballoc_init(). (Thomas &
> Christian).
>=20
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
> =C2=A0drivers/gpu/drm/drm_suballoc.c | 110 ++++++++++++++++++++++++++----=
-
> --
> =C2=A0include/drm/drm_suballoc.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 =
+++
> =C2=A02 files changed, 97 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_suballoc.c
> b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..b97ffcd98d45 100644
> --- a/drivers/gpu/drm/drm_suballoc.c
> +++ b/drivers/gpu/drm/drm_suballoc.c
> @@ -123,7 +123,7 @@ static void drm_suballoc_remove_locked(struct
> drm_suballoc *sa)
> =C2=A0	list_del_init(&sa->olist);
> =C2=A0	list_del_init(&sa->flist);
> =C2=A0	dma_fence_put(sa->fence);
> -	kfree(sa);
> +	drm_suballoc_release(sa);
> =C2=A0}
> =C2=A0
> =C2=A0static void drm_suballoc_try_free(struct drm_suballoc_manager
> *sa_manager)
> @@ -293,45 +293,74 @@ static bool drm_suballoc_next_hole(struct
> drm_suballoc_manager *sa_manager,
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_suballoc_new() - Make a suballocation.
> + * drm_suballoc_alloc() - Allocate uninitialized suballoc object.
> + * @gfp: gfp flags used for memory allocation.
> + *
> + * Allocate memory for an uninitialized suballoc object. Intended
> usage is
> + * allocate memory for suballoc object outside of a reclaim tainted
> context
> + * and then be initialized at a later time in a reclaim tainted
> context.
> + *
> + * @drm_suballoc_release should be used to release the memory if
> returned
> + * suballoc object is in uninitialized state.
> + *
> + * Return: a new uninitialized suballoc object, or an ERR_PTR(-
> ENOMEM).
> + */
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp)
> +{
> +	struct drm_suballoc *sa;
> +
> +	sa =3D kmalloc(sizeof(*sa), gfp);
> +	if (!sa)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return sa;
> +}
> +EXPORT_SYMBOL(drm_suballoc_alloc);
> +
> +/**
> + * drm_suballoc_release() - Release memory for suballocation.
> + * @sa: The struct drm_suballoc.
> + */
> +void drm_suballoc_release(struct drm_suballoc *sa)
> +{
> +	kfree(sa);
> +}
> +EXPORT_SYMBOL(drm_suballoc_release);
> +
> +/**
> + * drm_suballoc_init() - Initialize a suballocation.
> =C2=A0 * @sa_manager: pointer to the sa_manager
> + * @sa: The struct drm_suballoc.
> =C2=A0 * @size: number of bytes we want to suballocate.
> - * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
> but
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the argument is provided for suba=
llocations from reclaim
> context or
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 where the caller wants to avoid p=
ipelining rather than wait
> for
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reclaim.
> =C2=A0 * @intr: Whether to perform waits interruptible. This should
> typically
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 always be true, unless=
 the caller needs to propagate a
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 non-interruptible cont=
ext from above layers.
> =C2=A0 * @align: Alignment. Must not exceed the default manager alignment=
.
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If @align is zer=
o, then the manager alignment is used.
> =C2=A0 *
> - * Try to make a suballocation of size @size, which will be rounded
> - * up to the alignment specified in specified in
> drm_suballoc_manager_init().
> + * Try to make a suballocation on a pre-allocated suballoc object of
> size @size,
> + * which will be rounded up to the alignment specified in specified
> in
> + * drm_suballoc_manager_init().
> =C2=A0 *
> - * Return: a new suballocated bo, or an ERR_PTR.
> + * Return: zero on success, errno on failure.
> =C2=A0 */
> -struct drm_suballoc *
> -drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
> size,
> -		 gfp_t gfp, bool intr, size_t align)
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_suballoc *sa, size_t size,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool intr, size_t align)
> =C2=A0{
> =C2=A0	struct dma_fence *fences[DRM_SUBALLOC_MAX_QUEUES];
> =C2=A0	unsigned int tries[DRM_SUBALLOC_MAX_QUEUES];
> =C2=A0	unsigned int count;
> =C2=A0	int i, r;
> -	struct drm_suballoc *sa;
> =C2=A0
> =C2=A0	if (WARN_ON_ONCE(align > sa_manager->align))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
> =C2=A0	if (WARN_ON_ONCE(size > sa_manager->size || !size))
> -		return ERR_PTR(-EINVAL);
> +		return -EINVAL;
> =C2=A0
> =C2=A0	if (!align)
> =C2=A0		align =3D sa_manager->align;
> =C2=A0
> -	sa =3D kmalloc(sizeof(*sa), gfp);
> -	if (!sa)
> -		return ERR_PTR(-ENOMEM);
> =C2=A0	sa->manager =3D sa_manager;
> =C2=A0	sa->fence =3D NULL;
> =C2=A0	INIT_LIST_HEAD(&sa->olist);
> @@ -348,7 +377,7 @@ drm_suballoc_new(struct drm_suballoc_manager
> *sa_manager, size_t size,
> =C2=A0			if (drm_suballoc_try_alloc(sa_manager, sa,
> =C2=A0						=C2=A0=C2=A0 size, align)) {
> =C2=A0				spin_unlock(&sa_manager->wq.lock);
> -				return sa;
> +				return 0;
> =C2=A0			}
> =C2=A0
> =C2=A0			/* see if we can skip over some allocations
> */
> @@ -385,8 +414,47 @@ drm_suballoc_new(struct drm_suballoc_manager
> *sa_manager, size_t size,
> =C2=A0	} while (!r);
> =C2=A0
> =C2=A0	spin_unlock(&sa_manager->wq.lock);
> -	kfree(sa);
> -	return ERR_PTR(r);
> +	return r;
> +}
> +EXPORT_SYMBOL(drm_suballoc_init);
> +
> +/**
> + * drm_suballoc_new() - Make a suballocation.
> + * @sa_manager: pointer to the sa_manager
> + * @size: number of bytes we want to suballocate.
> + * @gfp: gfp flags used for memory allocation. Typically GFP_KERNEL
> but
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the argument is provided for suba=
llocations from reclaim
> context or
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 where the caller wants to avoid p=
ipelining rather than wait
> for
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reclaim.
> + * @intr: Whether to perform waits interruptible. This should
> typically
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 always be true, unless the =
caller needs to propagate a
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 non-interruptible context f=
rom above layers.
> + * @align: Alignment. Must not exceed the default manager alignment.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If @align is zero, th=
en the manager alignment is used.
> + *
> + * Try to make a suballocation of size @size, which will be rounded
> + * up to the alignment specified in specified in
> drm_suballoc_manager_init().
> + *
> + * Return: a new suballocated bo, or an ERR_PTR.
> + */
> +struct drm_suballoc *
> +drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
> size,
> +		 gfp_t gfp, bool intr, size_t align)
> +{
> +	struct drm_suballoc *sa;
> +	int err;
> +
> +	sa =3D drm_suballoc_alloc(gfp);
> +	if (IS_ERR(sa))
> +		return sa;
> +
> +	err =3D drm_suballoc_init(sa_manager, sa, size, intr, align);
> +	if (err) {
> +		drm_suballoc_release(sa);
> +		return ERR_PTR(err);
> +	}
> +
> +	return sa;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_suballoc_new);
> =C2=A0
> diff --git a/include/drm/drm_suballoc.h b/include/drm/drm_suballoc.h
> index 7ba72a81a808..b8d1d5449fd8 100644
> --- a/include/drm/drm_suballoc.h
> +++ b/include/drm/drm_suballoc.h
> @@ -53,6 +53,14 @@ void drm_suballoc_manager_init(struct
> drm_suballoc_manager *sa_manager,
> =C2=A0
> =C2=A0void drm_suballoc_manager_fini(struct drm_suballoc_manager
> *sa_manager);
> =C2=A0
> +struct drm_suballoc *drm_suballoc_alloc(gfp_t gfp);
> +
> +void drm_suballoc_release(struct drm_suballoc *sa);
> +
> +int drm_suballoc_init(struct drm_suballoc_manager *sa_manager,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_suballoc *sa, size_t size, b=
ool
> intr,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t align);
> +
> =C2=A0struct drm_suballoc *
> =C2=A0drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
> size,
> =C2=A0		 gfp_t gfp, bool intr, size_t align);
