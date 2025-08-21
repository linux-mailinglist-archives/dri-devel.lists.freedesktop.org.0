Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3439B2F40B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DBF10E8EE;
	Thu, 21 Aug 2025 09:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMRUE834";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721910E8E3;
 Thu, 21 Aug 2025 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755768892; x=1787304892;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6Vk2rNv6sQPb2ve7Pj2mP/GF1p2TJt4JFMI53lJXfL8=;
 b=BMRUE834p0j9cC1X4NMJeQftC3HhAU687stmcTRUyX4ke6Ba+CoOC6Cq
 tUrNFChnAQ+vsbPcFNMl/6SxUfSDSX4ibTJp7BWWybzjUQBSh/Gw/RG6S
 V0mtl6UBv6qIhLChmgwCQlTMWKeMqcfulVQnHmQZQIOs8Wr2MRKdOUKMh
 7n+9vQhlCKsPQEs6BcSWE9p8C1ydhcDuZJpw0nZrFuiDOZfouFq1WhMwV
 B8nbG1iKPsQgdLh3vNpo4y38lkdVWhwQxQTr5wu1T7W0wN03/TwDBSMP/
 /YGVams+vazAcqFyPeBdo/W6yC8zFhE9EEQDdJDZ0q5Q7mpawrUJQlDAl A==;
X-CSE-ConnectionGUID: i+My7hQ7RsC+HkuSwAusmA==
X-CSE-MsgGUID: i9jw2jMFTauQOnT2hxa6CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57978878"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="57978878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:34:52 -0700
X-CSE-ConnectionGUID: Y0heiNaWTYy4UVfXra6P2w==
X-CSE-MsgGUID: N5zt3aWDSC2Q5n+oE/9ILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172786862"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.201])
 ([10.245.245.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 02:34:31 -0700
Message-ID: <05360f1a920afe31ddd743d21f217d7bf8ff1c45.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/6] mm/mmu_notifier: Allow multiple struct
 mmu_interval_notifier passes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 intel-xe@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, 	linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>
Date: Thu, 21 Aug 2025 11:34:25 +0200
In-Reply-To: <aKSZ1JduQwAFSFQn@lstrano-desk.jf.intel.com>
References: <20250809135137.259427-1-thomas.hellstrom@linux.intel.com>
 <20250809135137.259427-2-thomas.hellstrom@linux.intel.com>
 <20250818160726.GH599331@ziepe.ca>
 <aKNT8GUu0r3i4Ikq@lstrano-desk.jf.intel.com>
 <20250818163617.GI599331@ziepe.ca>
 <aKNYUaPS0PiRk/yj@lstrano-desk.jf.intel.com>
 <20250818164655.GJ599331@ziepe.ca>
 <4lsv2lcd7lssyvcjvkqe4t2foubxbhuxrt2ptzee3csymz5gg3@jwrg3xow72lm>
 <e96dcfd4ce7c84a5b66ff9d5f082ea209266ce48.camel@linux.intel.com>
 <aKSZ1JduQwAFSFQn@lstrano-desk.jf.intel.com>
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

On Tue, 2025-08-19 at 08:35 -0700, Matthew Brost wrote:
> On Tue, Aug 19, 2025 at 01:33:40PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2025-08-19 at 19:55 +1000, Alistair Popple wrote:
> > > On Mon, Aug 18, 2025 at 01:46:55PM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Aug 18, 2025 at 09:44:01AM -0700, Matthew Brost wrote:
> > > > > On Mon, Aug 18, 2025 at 01:36:17PM -0300, Jason Gunthorpe
> > > > > wrote:
> > > > > > On Mon, Aug 18, 2025 at 09:25:20AM -0700, Matthew Brost
> > > > > > wrote:
> > > > > > > I think this choice makes sense: it allows embedding the
> > > > > > > wait
> > > > > > > state from
> > > > > > > the initial notifier call into the pass structure. Patch
> > > > > > > [6]
> > > > > > > shows this
> > > > > > > by attaching the issued TLB invalidation fences to the
> > > > > > > pass.
> > > > > > > Since a
> > > > > > > single notifier may be invoked multiple times with
> > > > > > > different
> > > > > > > ranges but
> > > > > > > the same seqno,
> > > > > >=20
> > > > > > That should be explained, but also seems to be a bit of a
> > > > > > different
> > > > > > issue..
> > > > > >=20
> > > > > > If the design is really to only have two passes and this
> > > > > > linked
> > > > > > list
> > > > > > is about retaining state then there should not be so much
> > > > > > freedom to
> > > > > > have more passes.
> > > > >=20
> > > > > I=E2=80=99ll let Thomas weigh in on whether we really need more t=
han
> > > > > two
> > > > > passes;
> > > > > my feeling is that two passes are likely sufficient. It=E2=80=99s
> > > > > also
> > > > > worth
> > > > > noting that the linked list has an added benefit: the
> > > > > notifier
> > > > > tree only
> > > > > needs to be walked once (a small time-complexity win).
> > > >=20
> > > > You may end up keeping the linked list just with no way to add
> > > > a
> > > > third
> > > > pass.
> > >=20
> > > It seems to me though that linked list still adds unnecessary
> > > complexity. I
> > > think this would all be much easier to follow if we just added
> > > two
> > > new callbacks
> > > - invalidate_start() and invalidate_end() say.
> >=20
> > One thing that the linked list avoids, though, is traversing the
> > interval tree two times. It has O(n*log(n)) whereas the linked list
> > overhead is just O(n_2pass).
> >=20
> > >=20
> > > Admitedly that would still require the linked list (or something
> > > similar) to
> > > retain the ability to hold/pass a context between the start and
> > > end
> > > callbacks.
> > > Which is bit annoying, it's a pity we need to allocate memory in
> > > a
> > > performance
> > > sensitive path to effectively pass (at least in this case) a
> > > single
> > > pointer. I
> > > can't think of any obvious solutions to that though.
> >=20
> > One idea is for any two-pass notifier implementation to use a small
> > pool. That would also to some extent mitigate the risk of out-of-
> > memory
> > with GFP_NOWAIT.
> >=20
>=20
> I think we can attach a preallocated list entry to the driver-side
> notifier state; then you=E2=80=99d only need to allocate (or block) if th=
at
> notifier is invoked more than once while a wait action (e.g., a TLB
> invalidation) is outstanding. Multiple invocations are technically
> possible, but in practice I=E2=80=99d expect them to be rare.
>=20
> I=E2=80=99m not sure how much of a win this is, though. On Intel hardware=
,
> TLB
> invalidations are several orders of magnitude slower than the
> software
> steps our notifiers perform. Ultimately, whether to allocate or
> preallocate is a driver-side choice.

I agree we shouldn't enforce anything at this point. But if we envision
a situation where multiple subsystem two-pass notifiers subscribe, the
GFP_NOWAIT memory might be exhausted by the notifiers called first. A
greedy behavior that might eventually cause serialization anyway.

So to behave nicely towards other notifier subscriptions, an
implementation should ideally have something pre-allocated.

/Thomas


>=20
> Matt
>=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > > Jason
> > > >=20
> >=20

