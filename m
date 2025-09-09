Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DFB4A363
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4592310E081;
	Tue,  9 Sep 2025 07:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFi7FdjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6B510E081;
 Tue,  9 Sep 2025 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757402547; x=1788938547;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=OV3TPH5CAyU2wfxphMOJxMCno9fd1tJvrGT3c3M0VWk=;
 b=YFi7FdjCr3q538jfKrxavqCNF3wnZhtXkR5RYODTp2RKywG9AgJla+rU
 tZgL+PPkPJIezs8T0DJOy4Ol7N7pF4NRyVBuQQ5ob09U2TnVA1VW5CRab
 lsSKFN2tHay6Ty6/bDMRiTXu+Tdtgudk2pCZ73QoRnkWoNvYUGolB9sVc
 svMlP/7iO9EnCU9M+WR4AIIRtA7txi/uuQSIm88fNNbAQPLWw81Ax6Q6A
 4VTFOLNZM/M0fe4N5Y2DPBW5Qc863FUTzsd29L/d/F3J1NC57oPqOTOHH
 c3X/GZyZfqSzYMT7AcEb9slWePdQYl2KGz6sgjt9WmatgcztSs6KaS/CI A==;
X-CSE-ConnectionGUID: SvdSZCtoTJeSj5Pgqjbc8Q==
X-CSE-MsgGUID: ghhQoq2TQe+xpQPD7e6aKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70296694"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="70296694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:22:27 -0700
X-CSE-ConnectionGUID: OSo87CHdSRikeuXpz0FwnQ==
X-CSE-MsgGUID: QhaSReL1Qs+3GmLk5rUCgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="203787145"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:22:15 -0700
Message-ID: <108ed59e07faaaa78167045670cea803d58f7127.camel@linux.intel.com>
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 09:21:54 +0200
In-Reply-To: <c14bb417-276c-471b-9737-0f814af69d06@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
 <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
 <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
 <c14bb417-276c-471b-9737-0f814af69d06@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Mon, 2025-09-08 at 17:16 +0200, Christian K=C3=B6nig wrote:
> Back to this topic again :/
>=20
> On 22.08.25 10:51, Thomas Hellstr=C3=B6m wrote:
> > > > We would still need some form of refcounting while waiting on
> > > > the
> > > > struct completion, but if we restricted the TTM refcount to
> > > > *only*
> > > > be
> > > > used internally for that sole purpose, and also replaced the
> > > > final
> > > > ttm_bo_put() with the ttm_bo_finalize() that you suggest we
> > > > wouldn't
> > > > need to resurrect that refcount since it wouldn't drop to zero
> > > > until
> > > > the object is ready for final free.
> > > >=20
> > > > Ideas, comments?
> > >=20
> > > Ideally I think we would use the handle_count as backing store
> > > the
> > > drm_gem_object->refcount as structure reference.
> > >=20
> > > But that means a massive rework of the GEM handling/drivers/TTM.
> > >=20
> > > Alternative we could just grab a reference to a unsignaled fence
> > > when
> > > we encounter a dead BO on the LRU.
> > >=20
> > > What do you think of that idea?
> >=20
> > I think to be able to *guarantee* exhaustive eviction, we need
> > 1)=C2=A0all unfreed resources to sit on an LRU, and
> > 2) everything on the LRU needs to be able to have something to wait
> > for.
>=20
> Yeah, completely agree.
>=20
> > A fence can't really guarantee 2), but it's close. There is a time-
> > interval in betwen where the last fence signals and we take the
> > resource from the LRU and free it.
>=20
> Correct, yes.
>=20
> > A struct completion can be made to signal when the resource is
> > freed.
> > I think the locking restriction in the struct completion case (the
> > struct completion is likely waited for under a dma-resv), is that
> > nothing except the object destructor may take an individualized
> > resv of
> > a zombie gem object whose refcount has gone to zero. The destructor
> > should use an asserted trylock only to make lockdep happy. The
> > struct
> > completion also needs a refcount to avoid destroying it while there
> > are
> > waiters.
>=20
> Exactly that's the problem, as far as I can see we can't do that.
>=20
> See imported dma_resv objects needs to block waiting on the dma_resv
> lock in the destruction path. Otherwise we can't cleanup their
> mappings any more.

Ugh, yeah that is a problem. Unless we make an exception for imported
dma-buf and push out the final dma_buf_unmap_attachment() until after
signalling the completion. We're not directly freeing any pages anyway
since that's done if evicting the exporter.


>=20
> > So what do you think about starting out with a fence, and if / when
> > that appears not to be sufficient, we have a backup plan to move to
> > a
> > struct completion?
>=20
> Well we need to start somewhere, so grabbing an unsignaled dma_fence
> reference sounds like the best plan for now.

True. A good starting point. Although I have a feeling it will turn out
to be not fully sufficient.

Thanks,
Thomas



>=20
> Regards,
> Christian.
>=20
> >=20
> > Thomas
> >=20
> >=20
> > >=20
> > > Regards,
> > > Christian.
> >=20
>=20

