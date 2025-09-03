Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB1EB4202B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C3610E84A;
	Wed,  3 Sep 2025 12:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHFu21Zn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB88810E84A;
 Wed,  3 Sep 2025 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756904218; x=1788440218;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=P7y4rxcEmnkPyvqalWo+DCK6I3OZbrNSHV44uG0z3aM=;
 b=LHFu21ZnfJ1azNBbELajAJuWv6+E/UWaM1jhzdnZQaPuspceKAdmNRkM
 kmgqG5uZ5QKiyCYBdIFCkc1ZycjnUHFJDypGKvjNJkeuaZhupxaaV13eS
 lr4GHwCVXatZPbD6JKSqMWmB00/I5joVRssnLAefw8JTn5GMcNYxwr4Gt
 n3fo5cNSosJDwY1YuRfzl3EFrhr+bipYB/fMmvfSE+QAeOg4uko+yGxp8
 vzQgSnwfVoFAsu9tuoiuqWItBDb+mQaSa8AXSUiA8ewrpsi2sSiagQqRj
 KfifWX0V9rzL2OL5iPx9CJOqfSY5/oYblSCor0fUCuKm1xMk4Hf+NnQKv A==;
X-CSE-ConnectionGUID: TxWHcY/SQGWW/4FincIgwQ==
X-CSE-MsgGUID: L0O7R73FTqSjOjotTF9yiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="46789852"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="46789852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:56:56 -0700
X-CSE-ConnectionGUID: ECe5td89Suizr/8TBzjWNg==
X-CSE-MsgGUID: GnUpQBeWRj2KsY7nFJI38g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; d="scan'208";a="171139910"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.191])
 ([10.245.245.191])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 05:56:54 -0700
Message-ID: <1a47196a82c4d0644e2dae3af5d3f9f33bfc8fd8.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton
 <akpm@linux-foundation.org>,  Simona Vetter <simona.vetter@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Date: Wed, 03 Sep 2025 14:56:49 +0200
In-Reply-To: <20250821114626.89818-2-thomas.hellstrom@linux.intel.com>
References: <20250821114626.89818-1-thomas.hellstrom@linux.intel.com>
 <20250821114626.89818-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

Hi,

@Jason, @Alistair, Gentle ping, could you have a look and R-B, Ack if
OK?

Thanks,
Thomas


On Thu, 2025-08-21 at 13:46 +0200, Thomas Hellstr=C3=B6m wrote:
> GPU use-cases for mmu_interval_notifiers with hmm often involve
> starting a gpu operation and then waiting for it to complete.
> These operations are typically context preemption or TLB flushing.
>=20
> With single-pass notifiers per GPU this doesn't scale in
> multi-gpu scenarios. In those scenarios we'd want to first start
> preemption- or TLB flushing on all GPUs and as a second pass wait
> for them to complete.
>=20
> One can do this on per-driver basis multiplexing per-driver
> notifiers but that would mean sharing the notifier "user" lock
> across all GPUs and that doesn't scale well either, so adding support
> for multi-pass in the core appears to be the right choice.
>=20
> Implement two-pass capability in the mmu_interval_notifier. Use a
> linked list for the final passes to minimize the impact for
> use-cases that don't need the multi-pass functionality by avoiding
> a second interval tree walk, and to be able to easily pass data
> between the two passes.
>=20
> v1:
> - Restrict to two passes (Jason Gunthorpe)
> - Improve on documentation (Jason Gunthorpe)
> - Improve on function naming (Alistair Popple)
>=20
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Cc: <linux-mm@kvack.org>
> Cc: <linux-kernel@vger.kernel.org>
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0include/linux/mmu_notifier.h | 42 ++++++++++++++++++++++++
> =C2=A0mm/mmu_notifier.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 63 ++++++++++++++++++++++++++++++----
> --
> =C2=A02 files changed, 96 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/linux/mmu_notifier.h
> b/include/linux/mmu_notifier.h
> index d1094c2d5fb6..14cfb3735699 100644
> --- a/include/linux/mmu_notifier.h
> +++ b/include/linux/mmu_notifier.h
> @@ -233,16 +233,58 @@ struct mmu_notifier {
> =C2=A0	unsigned int users;
> =C2=A0};
> =C2=A0
> +/**
> + * struct mmu_interval_notifier_finish - mmu_interval_notifier two-
> pass abstraction
> + * @link: List link for the notifiers pending pass list
> + *
> + * Allocate, typically using GFP_NOWAIT in the interval notifier's
> first pass.
> + * If allocation fails (which is not unlikely under memory
> pressure), fall back
> + * to single-pass operation. Note that with a large number of
> notifiers
> + * implementing two passes, allocation with GFP_NOWAIT will become
> increasingly
> + * likely to fail, so consider implementing a small pool instead of
> using
> + * kmalloc() allocations.
> + *
> + * If the implementation needs to pass data between the two passes,
> + * the recommended way is to embed strct
> mmu_interval_notifier_finish into a larger
> + * structure that also contains the data needed to be shared. Keep
> in mind that
> + * a notifier callback can be invoked in parallel, and each
> invocation needs its
> + * own struct mmu_interval_notifier_finish.
> + */
> +struct mmu_interval_notifier_finish {
> +	struct list_head link;
> +	/**
> +	 * @finish: Driver callback for the finish pass.
> +	 * @final: Pointer to the mmu_interval_notifier_finish
> structure.
> +	 * @range: The mmu_notifier_range.
> +	 * @cur_seq: The current sequence set by the first pass.
> +	 *
> +	 * Note that there is no error reporting for additional
> passes.
> +	 */
> +	void (*finish)(struct mmu_interval_notifier_finish *final,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range *=
range,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq);
> +};
> +
> =C2=A0/**
> =C2=A0 * struct mmu_interval_notifier_ops
> =C2=A0 * @invalidate: Upon return the caller must stop using any SPTEs
> within this
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 range. This function can sleep. Return false only if
> sleeping
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 was required but mmu_notifier_range_blockable(range)
> is false.
> + * @invalidate_start: Similar to @invalidate, but intended for two-
> pass notifier
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callbacks where the callto @i=
nvalidate_start
> is the first
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass and any struct
> mmu_interval_notifier_finish pointer
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 returned in the @fini paramet=
er describes the
> final pass.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If @fini is %NULL on return, =
then no final
> pass will be
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 called.
> =C2=A0 */
> =C2=A0struct mmu_interval_notifier_ops {
> =C2=A0	bool (*invalidate)(struct mmu_interval_notifier
> *interval_sub,
> =C2=A0			=C2=A0=C2=A0 const struct mmu_notifier_range *range,
> =C2=A0			=C2=A0=C2=A0 unsigned long cur_seq);
> +	bool (*invalidate_start)(struct mmu_interval_notifier
> *interval_sub,
> +				 const struct mmu_notifier_range
> *range,
> +				 unsigned long cur_seq,
> +				 struct mmu_interval_notifier_finish
> **final);
> =C2=A0};
> =C2=A0
> =C2=A0struct mmu_interval_notifier {
> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> index 8e0125dc0522..fceadcd8ca24 100644
> --- a/mm/mmu_notifier.c
> +++ b/mm/mmu_notifier.c
> @@ -260,6 +260,18 @@ mmu_interval_read_begin(struct
> mmu_interval_notifier *interval_sub)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
> =C2=A0
> +static void mn_itree_final_pass(struct list_head *final_passes,
> +				const struct mmu_notifier_range
> *range,
> +				unsigned long cur_seq)
> +{
> +	struct mmu_interval_notifier_finish *f, *next;
> +
> +	list_for_each_entry_safe(f, next, final_passes, link) {
> +		list_del(&f->link);
> +		f->finish(f, range, cur_seq);
> +	}
> +}
> +
> =C2=A0static void mn_itree_release(struct mmu_notifier_subscriptions
> *subscriptions,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm)
> =C2=A0{
> @@ -271,6 +283,7 @@ static void mn_itree_release(struct
> mmu_notifier_subscriptions *subscriptions,
> =C2=A0		.end =3D ULONG_MAX,
> =C2=A0	};
> =C2=A0	struct mmu_interval_notifier *interval_sub;
> +	LIST_HEAD(final_passes);
> =C2=A0	unsigned long cur_seq;
> =C2=A0	bool ret;
> =C2=A0
> @@ -278,11 +291,25 @@ static void mn_itree_release(struct
> mmu_notifier_subscriptions *subscriptions,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 mn_itree_inv_start_range(subscriptions, =
&range,
> &cur_seq);
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub;
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub =3D mn_itree_inv_next(interv=
al_sub, &range))
> {
> -		ret =3D interval_sub->ops->invalidate(interval_sub,
> &range,
> -						=C2=A0=C2=A0=C2=A0 cur_seq);
> +		if (interval_sub->ops->invalidate_start) {
> +			struct mmu_interval_notifier_finish *final =3D
> NULL;
> +
> +			ret =3D interval_sub->ops-
> >invalidate_start(interval_sub,
> +								=C2=A0
> &range,
> +								=C2=A0
> cur_seq,
> +								=C2=A0
> &final);
> +			if (ret && final)
> +				list_add_tail(&final->link,
> &final_passes);
> +
> +		} else {
> +			ret =3D interval_sub->ops-
> >invalidate(interval_sub,
> +							=C2=A0=C2=A0=C2=A0 &range,
> +							=C2=A0=C2=A0=C2=A0
> cur_seq);
> +		}
> =C2=A0		WARN_ON(!ret);
> =C2=A0	}
> =C2=A0
> +	mn_itree_final_pass(&final_passes, &range, cur_seq);
> =C2=A0	mn_itree_inv_end(subscriptions);
> =C2=A0}
> =C2=A0
> @@ -430,7 +457,9 @@ static int mn_itree_invalidate(struct
> mmu_notifier_subscriptions *subscriptions,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_r=
ange
> *range)
> =C2=A0{
> =C2=A0	struct mmu_interval_notifier *interval_sub;
> +	LIST_HEAD(final_passes);
> =C2=A0	unsigned long cur_seq;
> +	int err =3D 0;
> =C2=A0
> =C2=A0	for (interval_sub =3D
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 mn_itree_inv_start_range(subscriptions, =
range,
> &cur_seq);
> @@ -438,23 +467,39 @@ static int mn_itree_invalidate(struct
> mmu_notifier_subscriptions *subscriptions,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub =3D mn_itree_inv_next(interv=
al_sub, range))
> {
> =C2=A0		bool ret;
> =C2=A0
> -		ret =3D interval_sub->ops->invalidate(interval_sub,
> range,
> -						=C2=A0=C2=A0=C2=A0 cur_seq);
> +		if (interval_sub->ops->invalidate_start) {
> +			struct mmu_interval_notifier_finish *final =3D
> NULL;
> +
> +			ret =3D interval_sub->ops-
> >invalidate_start(interval_sub,
> +								=C2=A0
> range,
> +								=C2=A0
> cur_seq,
> +								=C2=A0
> &final);
> +			if (ret && final)
> +				list_add_tail(&final->link,
> &final_passes);
> +
> +		} else {
> +			ret =3D interval_sub->ops-
> >invalidate(interval_sub,
> +							=C2=A0=C2=A0=C2=A0 range,
> +							=C2=A0=C2=A0=C2=A0
> cur_seq);
> +		}
> =C2=A0		if (!ret) {
> =C2=A0			if
> (WARN_ON(mmu_notifier_range_blockable(range)))
> =C2=A0				continue;
> -			goto out_would_block;
> +			err =3D -EAGAIN;
> +			break;
> =C2=A0		}
> =C2=A0	}
> -	return 0;
> =C2=A0
> -out_would_block:
> +	mn_itree_final_pass(&final_passes, range, cur_seq);
> +
> =C2=A0	/*
> =C2=A0	 * On -EAGAIN the non-blocking caller is not allowed to call
> =C2=A0	 * invalidate_range_end()
> =C2=A0	 */
> -	mn_itree_inv_end(subscriptions);
> -	return -EAGAIN;
> +	if (err)
> +		mn_itree_inv_end(subscriptions);
> +
> +	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static int mn_hlist_invalidate_range_start(

