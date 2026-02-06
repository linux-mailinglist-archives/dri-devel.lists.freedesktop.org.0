Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABw1J+3fhWnFHgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:34:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA0FDA49
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 13:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083F210E0C5;
	Fri,  6 Feb 2026 12:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Np9GgyJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DFD10E080;
 Fri,  6 Feb 2026 12:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770381288; x=1801917288;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IcUfAOUSUFNyHPM6Y/fPeBYAY5LYq5UNYR347KZZK/k=;
 b=Np9GgyJ80hQrfLNd7UWQodY2uAI0GBA3WrXSmT0sLeq0mMuMTXe26kZq
 T5YOiSCuwwUFcMtoUI+Pwz/pcVpwllFMrPRygKdVx/hWAT2+kL/AFMV4p
 gZFdJDlD4jdpf+yvnK3LAf7r1pidn8ezQATu7F4V/AEDeEJ2qnPMw6nfW
 NVQmHH5ZmeCCUVtg+6ISwq/SkvnjpqeojfJ5X2HIkyzYC1TOOkr3PsT3l
 ylV6uo5IBzeNOqzZOoER2TbeYg1NhlPrLmTaV1y+26s/eUhcvjUameLUu
 fOFRWviXL6cfkxwTJevBLBx6X76YgLOu8VNi+TeU4BDImLY1HFgLFalxy A==;
X-CSE-ConnectionGUID: 89WqImQNTYi43cc4sp1iAw==
X-CSE-MsgGUID: WywlQYpFTKKM2QY5BvPTcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71767282"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71767282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:34:48 -0800
X-CSE-ConnectionGUID: ZOMW6nBoSp6N85LUae9TSg==
X-CSE-MsgGUID: yV+S9u0vTrGX6+SBwb5+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248478770"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.244])
 ([10.245.244.244])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 04:34:42 -0800
Message-ID: <93f01b083861f180838f662fc81a74b14dd17fca.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/sa: Split drm_suballoc_new() into SA alloc
 and init helpers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, 
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Date: Fri, 06 Feb 2026 13:34:39 +0100
In-Reply-To: <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-6-satyanarayana.k.v.p@intel.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: F0EA0FDA49
X-Rspamd-Action: no action

+ dri-devel, Christian

On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> drm_suballoc_new() currently both allocates the SA object using
> kmalloc()
> and searches for a suitable hole in the sub-allocator for the
> requested
> size. Since kmalloc() may take internal locks, performing memory
> allocation while holding the sub-allocator mutex can trigger lockdep
> deadlock warnings.

... As Matt mentioned, This is to be able to suballocate under a
reclaim-tainted lock: Allocation can be done outside the lock, and init
inside the lock.

>=20
> Fix this by splitting SA allocation from drm_suballoc_new(),
> separating
> object allocation from sub-allocator initialization and hole
> selection.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

This must be CC'd dri-devel as well and AMD maintainers.

Below is in addition to MBrost's comments.

>=20
> ---
> V1 -> V2:
> - Splitted drm_suballoc_new() into drm_suballoc_alloc() and
> drm_suballoc_init() (Thomas).
> ---
> =C2=A0drivers/gpu/drm/drm_suballoc.c | 135 +++++++++++++++++++++++++-----=
-
> --
> =C2=A0include/drm/drm_suballoc.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 =
++
> =C2=A02 files changed, 112 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_suballoc.c
> b/drivers/gpu/drm/drm_suballoc.c
> index 879ea33dbbc4..6f21f9e048d6 100644
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
> @@ -293,45 +293,75 @@ static bool drm_suballoc_next_hole(struct
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
> + * @timeout: Time to a wait suballocation to become available.

I think we should split out the timeout to a separate patch, since that
is not really related to the problem of the lockdep splat, and it would
require a separate motivation, since typically the CTRL-C in
combination with fence timeouts are sufficient. We need to explain why
that's not the case for this particuar use-case.=20

Also that would make the -fixes patches for the reclaim lockdep splat
smaller.


Otherwise LGTM.
Thomas


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
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool intr, size_t align, signed long ti=
meout)
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
> @@ -339,6 +369,8 @@ drm_suballoc_new(struct drm_suballoc_manager
> *sa_manager, size_t size,
> =C2=A0
> =C2=A0	spin_lock(&sa_manager->wq.lock);
> =C2=A0	do {
> +		long t;
> +
> =C2=A0		for (i =3D 0; i < DRM_SUBALLOC_MAX_QUEUES; ++i)
> =C2=A0			tries[i] =3D 0;
> =C2=A0
> @@ -348,7 +380,7 @@ drm_suballoc_new(struct drm_suballoc_manager
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
> @@ -359,34 +391,75 @@ drm_suballoc_new(struct drm_suballoc_manager
> *sa_manager, size_t size,
> =C2=A0				fences[count++] =3D
> dma_fence_get(fences[i]);
> =C2=A0
> =C2=A0		if (count) {
> -			long t;
> -
> =C2=A0			spin_unlock(&sa_manager->wq.lock);
> =C2=A0			t =3D dma_fence_wait_any_timeout(fences,
> count, intr,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> MAX_SCHEDULE_TIMEOUT,
> -						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL);
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout,
> NULL);
> =C2=A0			for (i =3D 0; i < count; ++i)
> =C2=A0				dma_fence_put(fences[i]);
> =C2=A0
> -			r =3D (t > 0) ? 0 : t;
> =C2=A0			spin_lock(&sa_manager->wq.lock);
> =C2=A0		} else if (intr) {
> +			spin_unlock(&sa_manager->wq.lock);
> =C2=A0			/* if we have nothing to wait for block */
> -			r =3D wait_event_interruptible_locked
> +			r =3D wait_event_interruptible_timeout
> =C2=A0				(sa_manager->wq,
> -				 __drm_suballoc_event(sa_manager,
> size, align));
> +				 __drm_suballoc_event(sa_manager,
> size, align),
> +				 timeout);
> +			spin_lock(&sa_manager->wq.lock);
> =C2=A0		} else {
> =C2=A0			spin_unlock(&sa_manager->wq.lock);
> -			wait_event(sa_manager->wq,
> -				=C2=A0=C2=A0 drm_suballoc_event(sa_manager,
> size, align));
> -			r =3D 0;
> +			t =3D wait_event_timeout
> +				(sa_manager->wq,
> +				 drm_suballoc_event(sa_manager,
> size, align),
> +				 timeout);
> =C2=A0			spin_lock(&sa_manager->wq.lock);
> =C2=A0		}
> +		r =3D (t > 0) ? 0 : !r ? -ETIME : t;
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
> +	err =3D drm_suballoc_init(sa_manager, sa, size, intr, align,
> +				MAX_SCHEDULE_TIMEOUT);
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
> index 7ba72a81a808..cff0e14556d1 100644
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
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t align, signed long timeout);
> +
> =C2=A0struct drm_suballoc *
> =C2=A0drm_suballoc_new(struct drm_suballoc_manager *sa_manager, size_t
> size,
> =C2=A0		 gfp_t gfp, bool intr, size_t align);
