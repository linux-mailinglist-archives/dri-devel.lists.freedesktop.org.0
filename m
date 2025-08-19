Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E7B2C096
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF96C10E5AF;
	Tue, 19 Aug 2025 11:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJtBahJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D55E10E5AF;
 Tue, 19 Aug 2025 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755603363; x=1787139363;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X1c185vBC7zQgj386+/kF62TICuFR+WWxJ/wPp8NWAg=;
 b=nJtBahJ+neBcFVcU6IWdBKSM5npNH9iU8OsmuNIish47jFmuzUHiZNQE
 DuaVWwZy4Ldhip38+y63EghAvnf7qBJr6+/PWMrWUJuom6LOuu+BTAnms
 aZwAEtprYPtXZuyEY4BB+Yg84askCikCOdorRs2OEklrbaaqujqnKVn3s
 /yCjizffK0Qz8+MFtOEGu4cGaSVO/8rb6RC/aGzec5XT3/G/g9EhlN6bz
 5+OKdJK1/KG3u+imr+VBLyu7Y+SG6Wp06KWZpnctypccAJHjze+4jtAy4
 wCCQuMqUuuL4jrGtW8BzNF6B4FpStOK3NsNRmwc8hoBtClI/yuyd9rbno A==;
X-CSE-ConnectionGUID: pIv1AJ3eTcGBAk4+ZGRVag==
X-CSE-MsgGUID: mlkJGnwiQ0qq2yxe9pwRnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57911960"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57911960"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 04:36:02 -0700
X-CSE-ConnectionGUID: IX16e6KpTAGkOepuMfSyMQ==
X-CSE-MsgGUID: P6LfZn5KSCyshVEKZaKc+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167010154"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.175])
 ([10.245.244.175])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 04:35:59 -0700
Message-ID: <680b87587664165439fea47c5275aef930f7ac49.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: intel-xe@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Andrew
 Morton <akpm@linux-foundation.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie	 <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 	linux-kernel@vger.kernel.org, Matthew Brost
 <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>
Date: Tue, 19 Aug 2025 13:35:56 +0200
In-Reply-To: <yzgn3nbaeftrthqwddwt3gap4uni4api2r2uik2gxoimnpdiy7@hty77udv6un2>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <yzgn3nbaeftrthqwddwt3gap4uni4api2r2uik2gxoimnpdiy7@hty77udv6un2>
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

On Tue, 2025-08-19 at 20:03 +1000, Alistair Popple wrote:
> On Sat, Aug 09, 2025 at 03:51:32PM +0200, Thomas Hellstr=C3=B6m wrote:
> > GPU use-cases for mmu_interval_notifiers with hmm often involve
> > starting a gpu operation and then waiting for it to complete.
> > These operations are typically context preemption or TLB flushing.
> >=20
> > With single-pass notifiers per GPU this doesn't scale in
> > multi-gpu scenarios. In those scenarios we'd want to first start
> > preemption- or TLB flushing on all GPUs and as a second pass wait
> > for them to complete on all gpus.
> >=20
> > One can do this on per-driver basis multiplexing per-driver
> > notifiers but that would mean sharing the notifier "user" lock
> > across all GPUs and that doesn't scale well either, so adding
> > support
> > for multi-pass in the core appears like the right choice.
> >=20
> > Implement multi-pass capability in the mmu_interval_notifier. Use a
> > linked list for the additional passes to minimize the impact for
> > use-cases that don't need the multi-pass functionality.
> >=20
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Cc: <linux-mm@kvack.org>
> > Cc: <linux-kernel@vger.kernel.org>
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0include/linux/mmu_notifier.h | 30 ++++++++++++++++
> > =C2=A0mm/mmu_notifier.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 67 +++++++++++++++++++++++++++++++-
> > ----
> > =C2=A02 files changed, 88 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/linux/mmu_notifier.h
> > b/include/linux/mmu_notifier.h
> > index d1094c2d5fb6..1107a8eafd8a 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -233,6 +233,32 @@ struct mmu_notifier {
> > =C2=A0	unsigned int users;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct mmu_interval_notifier_pass - mmu_interval_notifier
> > multi-pass abstraction
> > + * @link: List link for the notifiers pending pass list
> > + *
> > + * Allocate, typically using GFP_NOWAIT in the interval notifier's
> > first pass.
> > + * If allocation fails (which is not unlikely under memory
> > pressure), fall back
> > + * to single-pass operation.
> > + */
> > +struct mmu_interval_notifier_pass {
>=20
> If we limit the number of passes to two maybe call this
> `mmu_interval_notifier_finish()`? ...
>=20
> > +	struct list_head link;
> > +	/**
> > +	 * @pass: Driver callback for additionall pass.
> > +	 * @additional_pass: Pointer to the
> > mmu_interval_notifier_pass structure.
> > +	 * @range: The mmu_notifier_range.
> > +	 * @cur_seq: The current sequence set by the first pass.
> > +	 *
> > +	 * Return: Either a pointer to a valid
> > mmu_interval_notifier_pass for
> > +	 * another pass to be called, or %NULL if processing is
> > complete for this
> > +	 * notifier. There is no error reporting mechanism for
> > additional passes.
> > +	 */
> > +	struct mmu_interval_notifier_pass *
> > +	(*pass) (struct mmu_interval_notifier_pass
> > *additional_pass,
>=20

>=20
> > +		 const struct mmu_notifier_range *range,
> > +		 unsigned long cur_seq);
> > +};
> > +
> > =C2=A0/**
> > =C2=A0 * struct mmu_interval_notifier_ops
> > =C2=A0 * @invalidate: Upon return the caller must stop using any SPTEs
> > within this
> > @@ -243,6 +269,10 @@ struct mmu_interval_notifier_ops {
> > =C2=A0	bool (*invalidate)(struct mmu_interval_notifier
> > *interval_sub,
> > =C2=A0			=C2=A0=C2=A0 const struct mmu_notifier_range *range,
> > =C2=A0			=C2=A0=C2=A0 unsigned long cur_seq);
> > +	bool (*invalidate_multipass)(struct mmu_interval_notifier
> > *interval_sub,
>=20
> ... and then this could be called `invalidate_start()`. That might
> address some
> of the concerns with naming.

Makes sense. I'll have a look at that.

/Thomas


>=20
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > mmu_notifier_range *range,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > mmu_interval_notifier_pass **pass);
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct mmu_interval_notifier {
> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> > index 8e0125dc0522..dd6af87db103 100644
> > --- a/mm/mmu_notifier.c
> > +++ b/mm/mmu_notifier.c
> > @@ -260,6 +260,22 @@ mmu_interval_read_begin(struct
> > mmu_interval_notifier *interval_sub)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
> > =C2=A0
> > +static void mn_itree_additional_passes(struct list_head
> > *additional_passes,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > mmu_notifier_range *range,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq)
> > +{
> > +	struct mmu_interval_notifier_pass *p, *next;
> > +
> > +	while (!list_empty(additional_passes)) {
> > +		list_for_each_entry_safe(p, next,
> > additional_passes, link) {
> > +			list_del_init(&p->link);
> > +			p =3D p->pass(p, range, cur_seq);
> > +			if (p)
> > +				list_add_tail(&p->link,
> > additional_passes);
> > +		}
> > +	}
> > +}
> > +
> > =C2=A0static void mn_itree_release(struct mmu_notifier_subscriptions
> > *subscriptions,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm)
> > =C2=A0{
> > @@ -272,17 +288,32 @@ static void mn_itree_release(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0	};
> > =C2=A0	struct mmu_interval_notifier *interval_sub;
> > =C2=A0	unsigned long cur_seq;
> > +	LIST_HEAD(additional_passes);
> > =C2=A0	bool ret;
> > =C2=A0
> > =C2=A0	for (interval_sub =3D
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 mn_itree_inv_start_range(subscriptions=
,
> > &range, &cur_seq);
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub;
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub =3D mn_itree_inv_next(inte=
rval_sub,
> > &range)) {
> > -		ret =3D interval_sub->ops->invalidate(interval_sub,
> > &range,
> > -						=C2=A0=C2=A0=C2=A0 cur_seq);
> > +		if (interval_sub->ops->invalidate_multipass) {
> > +			struct mmu_interval_notifier_pass *second
> > =3D NULL;
> > +
> > +			ret =3D interval_sub->ops-
> > >invalidate_multipass(interval_sub,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 &range,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 cur_seq,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 &second);
> > +			if (ret && second)
> > +				list_add_tail(&second->link,
> > &additional_passes);
> > +
> > +		} else {
> > +			ret =3D interval_sub->ops-
> > >invalidate(interval_sub,
> > +							=C2=A0=C2=A0=C2=A0
> > &range,
> > +							=C2=A0=C2=A0=C2=A0
> > cur_seq);
> > +		}
> > =C2=A0		WARN_ON(!ret);
> > =C2=A0	}
> > =C2=A0
> > +	mn_itree_additional_passes(&additional_passes, &range,
> > cur_seq);
> > =C2=A0	mn_itree_inv_end(subscriptions);
> > =C2=A0}
> > =C2=A0
> > @@ -431,6 +462,8 @@ static int mn_itree_invalidate(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0{
> > =C2=A0	struct mmu_interval_notifier *interval_sub;
> > =C2=A0	unsigned long cur_seq;
> > +	LIST_HEAD(additional_passes);
> > +	int err =3D 0;
> > =C2=A0
> > =C2=A0	for (interval_sub =3D
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 mn_itree_inv_start_range(subscriptions=
,
> > range, &cur_seq);
> > @@ -438,23 +471,39 @@ static int mn_itree_invalidate(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub =3D mn_itree_inv_next(inte=
rval_sub,
> > range)) {
> > =C2=A0		bool ret;
> > =C2=A0
> > -		ret =3D interval_sub->ops->invalidate(interval_sub,
> > range,
> > -						=C2=A0=C2=A0=C2=A0 cur_seq);
> > +		if (interval_sub->ops->invalidate_multipass) {
> > +			struct mmu_interval_notifier_pass *second
> > =3D NULL;
> > +
> > +			ret =3D interval_sub->ops-
> > >invalidate_multipass(interval_sub,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 range,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 cur_seq,
> > +								=C2=A0=C2=A0
> > =C2=A0=C2=A0=C2=A0 &second);
> > +			if (ret && second)
> > +				list_add_tail(&second->link,
> > &additional_passes);
> > +
> > +		} else {
> > +			ret =3D interval_sub->ops-
> > >invalidate(interval_sub,
> > +							=C2=A0=C2=A0=C2=A0 range,
> > +							=C2=A0=C2=A0=C2=A0
> > cur_seq);
> > +		}
> > =C2=A0		if (!ret) {
> > =C2=A0			if
> > (WARN_ON(mmu_notifier_range_blockable(range)))
> > =C2=A0				continue;
> > -			goto out_would_block;
> > +			err =3D -EAGAIN;
> > +			break;
> > =C2=A0		}
> > =C2=A0	}
> > -	return 0;
> > =C2=A0
> > -out_would_block:
> > +	mn_itree_additional_passes(&additional_passes, range,
> > cur_seq);
> > +
> > =C2=A0	/*
> > =C2=A0	 * On -EAGAIN the non-blocking caller is not allowed to
> > call
> > =C2=A0	 * invalidate_range_end()
> > =C2=A0	 */
> > -	mn_itree_inv_end(subscriptions);
> > -	return -EAGAIN;
> > +	if (err)
> > +		mn_itree_inv_end(subscriptions);
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int mn_hlist_invalidate_range_start(
> > --=20
> > 2.50.1
> >=20
> >=20

