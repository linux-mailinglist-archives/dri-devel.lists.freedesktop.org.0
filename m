Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJO+EED9pWnvIgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:12:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1121E2006
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 22:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361E810E5D0;
	Mon,  2 Mar 2026 21:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCuzW5io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BEC10E5C6;
 Mon,  2 Mar 2026 21:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772485947; x=1804021947;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=e9qgGxTXyKZXvSTGsfRVSDjwwJy5ffmmFv4ZhQLLvXE=;
 b=iCuzW5ios0aff4yoi90Ub9olzDvqxT1vqa9Ce0DR2/RVtb2OFFr/SVG8
 zwRu7xis6A9Q/L1LqAiixPj+F/wWZ4n5BQ/jPgqzJ4bYSRGdvUP1uZNIT
 vKW/6KghP+CbX5CZMIMSB6Fg3jdsv+i6ayjFwguEFIDrWVSvUMGtTI8GQ
 fqWMAjVNN1ANiE2BniPsTznN9p9BHZg9f/iL1dUiGFohzk71LfSgjsbNZ
 qFQGIDPxICnt1vM6ZCUm32TXkbGAPUSB/nm2LdIeXf8ZJaFupucmIADlm
 1nJWEKS4/aIsFa1G7t003mc9hZoJpTxAfOLdQ5/L6O55EpZKMQb3JABD4 A==;
X-CSE-ConnectionGUID: wHnuwBMtTtKXyrS3JhPUhA==
X-CSE-MsgGUID: IgxeeIQnQ7eU8C7ormIlhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73376341"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73376341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:12:27 -0800
X-CSE-ConnectionGUID: bZECGHLFQtaQhGl1NqFoQA==
X-CSE-MsgGUID: 6pvBMChqQv6fCsLO+LqgTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="255644179"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.183])
 ([10.245.244.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:12:24 -0800
Message-ID: <16bd843b09103e2b427b78bfd39aab2606f8627e.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/4] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>, Andrew
 Morton <akpm@linux-foundation.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dave Airlie	 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>
Date: Mon, 02 Mar 2026 22:12:21 +0100
In-Reply-To: <aaXpgCUVXAKCfVCK@lstrano-desk.jf.intel.com>
References: <20260302163248.105454-1-thomas.hellstrom@linux.intel.com>
 <20260302163248.105454-2-thomas.hellstrom@linux.intel.com>
 <aaXpgCUVXAKCfVCK@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
X-Rspamd-Queue-Id: 7D1121E2006
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,kvack.org,vger.kernel.org,amd.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,intel.com:dkim,intel.com:email,ffwll.ch:email,lists.freedesktop.org:email,linux-foundation.org:email,ziepe.ca:email]
X-Rspamd-Action: no action

Hi, Matt,

On Mon, 2026-03-02 at 11:48 -0800, Matthew Brost wrote:

Thanks for reviewing.

> On Mon, Mar 02, 2026 at 05:32:45PM +0100, Thomas Hellstr=C3=B6m wrote:
> > GPU use-cases for mmu_interval_notifiers with hmm often involve
> > starting a gpu operation and then waiting for it to complete.
> > These operations are typically context preemption or TLB flushing.
> >=20
> > With single-pass notifiers per GPU this doesn't scale in
> > multi-gpu scenarios. In those scenarios we'd want to first start
> > preemption- or TLB flushing on all GPUs and as a second pass wait
> > for them to complete.
> >=20
> > One can do this on per-driver basis multiplexing per-driver
> > notifiers but that would mean sharing the notifier "user" lock
> > across all GPUs and that doesn't scale well either, so adding
> > support
> > for multi-pass in the core appears to be the right choice.
> >=20
> > Implement two-pass capability in the mmu_interval_notifier. Use a
> > linked list for the final passes to minimize the impact for
> > use-cases that don't need the multi-pass functionality by avoiding
> > a second interval tree walk, and to be able to easily pass data
> > between the two passes.
> >=20
> > v1:
> > - Restrict to two passes (Jason Gunthorpe)
> > - Improve on documentation (Jason Gunthorpe)
> > - Improve on function naming (Alistair Popple)
> > v2:
> > - Include the invalidate_finish() callback in the
> > =C2=A0 struct mmu_interval_notifier_ops.
> > - Update documentation (GitHub Copilot:claude-sonnet-4.6)
> > - Use lockless list for list management.
> >=20
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
>=20
> I thought Jason had given a RB on previous revs - did you drop
> because
> enough has changed?

Yes. In particular the inclusion of=20
invalidate_finish() in the ops, although IIRC that
was actually suggested by Jason.

> =C2=A0
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Alistair Popple <apopple@nvidia.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Cc: <linux-mm@kvack.org>
> > Cc: <linux-kernel@vger.kernel.org>
> >=20
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6 # Documentation only.
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0include/linux/mmu_notifier.h | 38 +++++++++++++++++++++
> > =C2=A0mm/mmu_notifier.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 64 +++++++++++++++++++++++++++++++-
> > ----
> > =C2=A02 files changed, 93 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/linux/mmu_notifier.h
> > b/include/linux/mmu_notifier.h
> > index 07a2bbaf86e9..de0e742ea808 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -233,16 +233,54 @@ struct mmu_notifier {
> > =C2=A0	unsigned int users;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct mmu_interval_notifier_finish - mmu_interval_notifier
> > two-pass abstraction
> > + * @link: List link for the notifiers pending pass list
>=20
> Lockless list?

Sure, Can add that.

>=20
> > + * @notifier: The mmu_interval_notifier for which the finish pass
> > is called.
> > + *
> > + * Allocate, typically using GFP_NOWAIT in the interval notifier's
> > first pass.
> > + * If allocation fails (which is not unlikely under memory
> > pressure), fall back
> > + * to single-pass operation. Note that with a large number of
> > notifiers
> > + * implementing two passes, allocation with GFP_NOWAIT will become
> > increasingly
> > + * likely to fail, so consider implementing a small pool instead
> > of using
> > + * kmalloc() allocations.
> > + *
> > + * If the implementation needs to pass data between the two
> > passes,
> > + * the recommended way is to embed struct
> > mmu_interval_notifier_finish into a larger
> > + * structure that also contains the data needed to be shared. Keep
> > in mind that
> > + * a notifier callback can be invoked in parallel, and each
> > invocation needs its
> > + * own struct mmu_interval_notifier_finish.
> > + */
> > +struct mmu_interval_notifier_finish {
> > +	struct llist_node link;
> > +	struct mmu_interval_notifier *notifier;
> > +};
> > +
> > =C2=A0/**
> > =C2=A0 * struct mmu_interval_notifier_ops
> > =C2=A0 * @invalidate: Upon return the caller must stop using any SPTEs
> > within this
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 range. This function can sleep. Return false only
> > if sleeping
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 was required but
> > mmu_notifier_range_blockable(range) is false.
> > + * @invalidate_start: Similar to @invalidate, but intended for
> > two-pass notifier
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callbacks where the call t=
o
> > @invalidate_start is the first
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass and any struct
> > mmu_interval_notifier_finish pointer
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 returned in the @finish pa=
rameter describes
> > the final pass.
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If @finish is %NULL on ret=
urn, then no final
> > pass will be
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 called.
> > + * @invalidate_finish: Called as the second pass for any notifier
> > that returned
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 a non-NULL @finish f=
rom @invalidate_start.
> > The @finish
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pointer passed here =
is the same one
> > returned by
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @invalidate_start.
> > =C2=A0 */
> > =C2=A0struct mmu_interval_notifier_ops {
> > =C2=A0	bool (*invalidate)(struct mmu_interval_notifier
> > *interval_sub,
> > =C2=A0			=C2=A0=C2=A0 const struct mmu_notifier_range *range,
> > =C2=A0			=C2=A0=C2=A0 unsigned long cur_seq);
> > +	bool (*invalidate_start)(struct mmu_interval_notifier
> > *interval_sub,
> > +				 const struct mmu_notifier_range
> > *range,
> > +				 unsigned long cur_seq,
> > +				 struct
> > mmu_interval_notifier_finish **finish);
> > +	void (*invalidate_finish)(struct
> > mmu_interval_notifier_finish *finish);
>=20
> Should we complain somewhere if a caller registers a notifier with
> invalidate_start set but not invalidate_finish?

Good idea. I'll update.

Thanks,
Thomas


>=20
> Matt
>=20
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct mmu_interval_notifier {
> > diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
> > index a6cdf3674bdc..38acd5ef8eb0 100644
> > --- a/mm/mmu_notifier.c
> > +++ b/mm/mmu_notifier.c
> > @@ -260,6 +260,15 @@ mmu_interval_read_begin(struct
> > mmu_interval_notifier *interval_sub)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(mmu_interval_read_begin);
> > =C2=A0
> > +static void mn_itree_finish_pass(struct llist_head *finish_passes)
> > +{
> > +	struct llist_node *first =3D
> > llist_reverse_order(__llist_del_all(finish_passes));
> > +	struct mmu_interval_notifier_finish *f, *next;
> > +
> > +	llist_for_each_entry_safe(f, next, first, link)
> > +		f->notifier->ops->invalidate_finish(f);
> > +}
> > +
> > =C2=A0static void mn_itree_release(struct mmu_notifier_subscriptions
> > *subscriptions,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm)
> > =C2=A0{
> > @@ -271,6 +280,7 @@ static void mn_itree_release(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0		.end =3D ULONG_MAX,
> > =C2=A0	};
> > =C2=A0	struct mmu_interval_notifier *interval_sub;
> > +	LLIST_HEAD(finish_passes);
> > =C2=A0	unsigned long cur_seq;
> > =C2=A0	bool ret;
> > =C2=A0
> > @@ -278,11 +288,27 @@ static void mn_itree_release(struct
> > mmu_notifier_subscriptions *subscriptions,
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
> > +		if (interval_sub->ops->invalidate_start) {
> > +			struct mmu_interval_notifier_finish
> > *finish =3D NULL;
> > +
> > +			ret =3D interval_sub->ops-
> > >invalidate_start(interval_sub,
> > +								=C2=A0
> > &range,
> > +								=C2=A0
> > cur_seq,
> > +								=C2=A0
> > &finish);
> > +			if (ret && finish) {
> > +				finish->notifier =3D interval_sub;
> > +				__llist_add(&finish->link,
> > &finish_passes);
> > +			}
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
> > +	mn_itree_finish_pass(&finish_passes);
> > =C2=A0	mn_itree_inv_end(subscriptions);
> > =C2=A0}
> > =C2=A0
> > @@ -430,7 +456,9 @@ static int mn_itree_invalidate(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier=
_range
> > *range)
> > =C2=A0{
> > =C2=A0	struct mmu_interval_notifier *interval_sub;
> > +	LLIST_HEAD(finish_passes);
> > =C2=A0	unsigned long cur_seq;
> > +	int err =3D 0;
> > =C2=A0
> > =C2=A0	for (interval_sub =3D
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 mn_itree_inv_start_range(subscriptions=
,
> > range, &cur_seq);
> > @@ -438,23 +466,41 @@ static int mn_itree_invalidate(struct
> > mmu_notifier_subscriptions *subscriptions,
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 interval_sub =3D mn_itree_inv_next(inte=
rval_sub,
> > range)) {
> > =C2=A0		bool ret;
> > =C2=A0
> > -		ret =3D interval_sub->ops->invalidate(interval_sub,
> > range,
> > -						=C2=A0=C2=A0=C2=A0 cur_seq);
> > +		if (interval_sub->ops->invalidate_start) {
> > +			struct mmu_interval_notifier_finish
> > *finish =3D NULL;
> > +
> > +			ret =3D interval_sub->ops-
> > >invalidate_start(interval_sub,
> > +								=C2=A0
> > range,
> > +								=C2=A0
> > cur_seq,
> > +								=C2=A0
> > &finish);
> > +			if (ret && finish) {
> > +				finish->notifier =3D interval_sub;
> > +				__llist_add(&finish->link,
> > &finish_passes);
> > +			}
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
> > +	mn_itree_finish_pass(&finish_passes);
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
> > 2.53.0
> >=20
