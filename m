Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBLUDM1PqWmd4gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:41:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E63B20EBA1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D497610EBDF;
	Thu,  5 Mar 2026 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr6rx4O1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AE610EBDF;
 Thu,  5 Mar 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703691; x=1804239691;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2qvm58VUYoOuRXtSihFKCPOXnuEdrSrdpWG97mxkXvE=;
 b=Vr6rx4O1asln4PfkpiPI71RlZZ7wUaXKV6LxPO19Hbc/3I61+yVJOcQ5
 JxuFcNUg6NMODJDiE9s3wyKQUdCV+xJHlf4Yvu3l/gc5EB6+e/3ASJ/lb
 mEtJ/GvuhYZ7BYl5AhjiKIw96eZx1M/+s8dvMBjGLVvyNXXPp+WlpVG7Q
 PL1QjOPByx74q8/PsxHiRDrdBURkG1oCg8ZxKmnZ8Hu22wUvc6euKCQD4
 IVTl+OXg3EW7f2H+fno118i0A8AIAsBg2wdOaniRoj3coCa/esGX8GLNk
 cVV128hGQDJhMtIbCWDjJojiR6TdPwO+Yw4Daua7UDCZ1HMDPbE2IBIWQ g==;
X-CSE-ConnectionGUID: NzbTRIZITEOvh88OQe6Qvg==
X-CSE-MsgGUID: gzLZz47xRhit31p7ypbDvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91176477"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="91176477"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:41:30 -0800
X-CSE-ConnectionGUID: YJs9GVqJTXerL5EoUNoTXg==
X-CSE-MsgGUID: op1wlOsBQL63b3Naw2fmVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="256511713"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.71])
 ([10.245.244.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:41:27 -0800
Message-ID: <1976868a95fc08323100ad3a863695768aaa2152.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/4] mm/mmu_notifier: Allow two-pass struct
 mmu_interval_notifiers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, 
 intel-xe@lists.freedesktop.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton
 <akpm@linux-foundation.org>,  Simona Vetter <simona.vetter@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Date: Thu, 05 Mar 2026 10:41:23 +0100
In-Reply-To: <f8ff2118-73b9-4f2e-ad36-b6de6164ef45@kernel.org>
References: <20260303133409.11609-1-thomas.hellstrom@linux.intel.com>
 <20260303133409.11609-2-thomas.hellstrom@linux.intel.com>
 <f8ff2118-73b9-4f2e-ad36-b6de6164ef45@kernel.org>
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
X-Rspamd-Queue-Id: 8E63B20EBA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[ziepe.ca,linux-foundation.org,ffwll.ch,gmail.com,nvidia.com,lists.freedesktop.org,kvack.org,vger.kernel.org,intel.com,amd.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,linux-foundation.org:email,linux.intel.com:mid,kvack.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,lists.freedesktop.org:email,ziepe.ca:email,nvidia.com:email]
X-Rspamd-Action: no action

On Wed, 2026-03-04 at 20:45 +0100, David Hildenbrand (Arm) wrote:
> On 3/3/26 14:34, Thomas Hellstr=C3=B6m wrote:
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
> > v3:
> > - Update kerneldoc for the struct
> > mmu_interval_notifier_finish::list member
> > =C2=A0 (Matthew Brost)
> > - Add a WARN_ON_ONCE() checking for NULL invalidate_finish() op if
> > =C2=A0 if invalidate_start() is non-NULL. (Matthew Brost)
> >=20
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
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
=C2=A0=C2=A0=C2=A0 | 65 +++++++++++++++++++++++++++++++-
> > ----
> > =C2=A02 files changed, 94 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/include/linux/mmu_notifier.h
> > b/include/linux/mmu_notifier.h
> > index 07a2bbaf86e9..37b683163235 100644
> > --- a/include/linux/mmu_notifier.h
> > +++ b/include/linux/mmu_notifier.h
> > @@ -233,16 +233,54 @@ struct mmu_notifier {
> > =C2=A0	unsigned int users;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct mmu_interval_notifier_finish - mmu_interval_notifier
> > two-pass abstraction
> > + * @link: Lockless list link for the notifiers pending pass list
> > + * @notifier: The mmu_interval_notifier for which the finish pass
> > is called.
> > + *
> > + * Allocate, typically using GFP_NOWAIT in the interval notifier's
> > first pass.
>=20
> Might want to make it clear that the fist pass is "start" and the
> second
> pass is "finish".
>=20
> Two-pass makes it sound like we'd be calling the same operation
> (e.g.,
> invalidate() ) twice.
>=20
> > + * If allocation fails (which is not unlikely under memory
> > pressure), fall back
> > + * to single-pass operation.=20
>=20
> Do you mean that the core will fallback (calling invalidate() ) or
> that
> it's the responsibility of the notifier to behave as if invalidate()
> would be called to then return finish=3DNULL? I assume the latter.
>=20
> Maybe this should be documented for @invalidate_start instead.
> (behave
> like invalidate() if @finish is %NULL on return etc)
>=20
> > Note that with a large number of notifiers
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
>=20
> Is @finish guaranteed to be set to %NULL before the call? The
> existing
> code does it, but is it something notifiers can rely on?
>=20
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
> > =C2=A0};
>=20
>=20
> Nothing else jumped at me, and the idea makes sense.


Thanks. I sent out a v4 addressing the above and to a wider audience.

Thanks,
Thomas

