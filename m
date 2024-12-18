Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6239F625D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBC210EB41;
	Wed, 18 Dec 2024 10:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXlpNPn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC2110EB40;
 Wed, 18 Dec 2024 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734516453; x=1766052453;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7+jZGoWpXFzTjvA7AAPv5PA1iIKyU2ZmT3lpbGdJiTk=;
 b=iXlpNPn2pCovssv9oCjwPt8l/nRpHwQFA6czYOJUyLGaAPWYARRw9K/V
 zuzDrd42vof5ypSMsoqQCYvne4eDHAjzL8/giLOvO4D/vM7dCPULoGeyQ
 VT1IKF9CuxLimhXXGKcdEzy54BTg9V++OwsR5nsjC4AtyoqGndB7tti2S
 V2xRJOtBtTQmhQJbmrmg3Y+Ns5Q9nnsgCYkHp/OliMDUaD4p8nXyPc8ml
 PkoNhiLK3LrSR6j0guyIj+aSlekdpxHi/x7QsvNNoIHAc3ij8RNqiucRm
 48+aUS5+SsSa5VgL3InCcZ+1bnGBmHK6XW1sA/P18tYsOG62zZn9oqzI3 w==;
X-CSE-ConnectionGUID: 3D3oc3clT/66YFNIKvLLgg==
X-CSE-MsgGUID: lit1imT5ROOZt5+r3iFHvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="52503266"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="52503266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:07:33 -0800
X-CSE-ConnectionGUID: 2T5OqQnqQ8igv5xJQi9cnQ==
X-CSE-MsgGUID: q8pw8DrAT2imfrBYE3/xDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97671101"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:07:31 -0800
Message-ID: <e8dc4ae396ed0e432618e7bd40831709a84ec889.camel@linux.intel.com>
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 18 Dec 2024 11:07:13 +0100
In-Reply-To: <3130e373-5dbb-4f4b-a24c-a0015a638c3e@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
 <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
 <cf722b696676b7383a94c2b846f8230e180ee527.camel@linux.intel.com>
 <bc762b0c-4fe3-48ff-b8df-14f741c91939@amd.com>
 <f74a7b678b5013dbcbe090bbff885827d3675247.camel@linux.intel.com>
 <c74e9f5c-3201-4083-8b79-80fdbbd903f2@amd.com>
 <5f3c04297fd6f008cad0415d6b6c04ba8c3b5a8c.camel@linux.intel.com>
 <26747cae-d66a-4bc4-9efb-4fdda4ac766b@amd.com>
 <e7654f8140ce2bd1afdca20b21b139cf810b6070.camel@linux.intel.com>
 <1e378253-57f0-46b1-b6a7-a6b8997d7e1b@amd.com>
 <9e2d75c95a9ed06912490937b1163f2a54d0196a.camel@linux.intel.com>
 <3130e373-5dbb-4f4b-a24c-a0015a638c3e@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Wed, 2024-12-04 at 12:24 +0100, Christian K=C3=B6nig wrote:
> Am 04.12.24 um 12:09 schrieb Thomas Hellstr=C3=B6m:
> > [SNIP]
>=20
> > > > > BTW I really dislike that tt->restore is allocated
> > > > > dynamically.
> > > > > That
> > > > > is
> > > > > just another allocation which can cause problems.
> > > > > We should probably have all the state necessary for the
> > > > > operation
> > > > > in
> > > > > the
> > > > > TT object.
> > > > Initially it was done this way. But that meant a pre-allocated
> > > > struct
> > > > page-pointer array the of 1 << MAX_PAGE_ORDER size (2MiB) for
> > > > each
> > > > ttm_tt. That lead to a patch to reduce the MAX_PAGE_ORDER to
> > > > PMD
> > > > size
> > > > order, but=C2=A0 as you might remember, that needed to be ripped ou=
t
> > > > because
> > > > the PMD size macros aren't constant across all architectures.
> > > > IIRC
> > > > it
> > > > was ARM causing compilation failures, and Linus wasn't happy.
> > > Yeah, I do remember that. But I don't fully get why you need this
> > > page-pointer array in the first place?
> > So the TTM page-pointer array holds the backup handles when backed
> > up.
> > During recovery, We allocate a (potentially huge) page and populate
> > the
> > TTM page-pointer array with pointers into that. Meanwhile we need
> > to
> > keep the backup handles for the recover phase in the restore
> > structure,
> > and in the middle of the recover phase you might hit an -EINTR.
>=20
> I still don't see the problem to be honest.
>=20
> What you basically do on recovery is the following:
> 1. Allocate a bunch of contiguous memory of order X.
> 2. Take the first entry from the page_array, convert that to your
> backup=20
> handle and copy the data back into the just allocated contiguous
> memory.
> 3. Replace the first entry in the page array with the struct page=20
> pointer of the allocated contiguous memory.
> 4. Take the next entry from the page_array, convert that to your
> backup=20
> handle and copy the data back into the just allocated contiguous
> memory.
> 5. Replace the next entry in the page_array with the struct page
> pointer=20
> + 1 of the allocated contiguous memory.
> 6. Repeat until the contiguous memory is fully recovered and we jump
> to=20
> 1 again.

OK so the reason I skipped this previously was apparently because of
inconsistencies, since the the dma_addr array is fully populated it
would look awkward if pages array were only partly populated.

But I reworked this in the latest version to follow the above so now
both are populated once the whole new multi-order page is successfully
read back from backup. The patch becomes bigger, and I also added a
restructuring patch, but OTOH some of the additional additions is
documentation.

The (now small) kmalloc at start of restore is still present, though. I
figure if that fails, restore would fail anyway so it shouldn't be an
issue whatsoever.

On an unrelated issue,
I notice that HighMem pages are skipping cache-transitioning. That
makes sense since they don't have a kernel linear map, but content
added using writes to other cached maps (page clearing, restore, resume
from hibernation) might still remain in a PIPT cache, right? Don't we
need to clflush these pages on wb->wc transition and ensure any resume-
from-hibernation content is similarly flushed?

/Thomas


>=20
> What exactly do you need this pre-allocated struct page-pointer array
> of=20
> 1 << MAX_PAGE_ORDER for?
>=20
> Sorry, I must really be missing something here.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas

