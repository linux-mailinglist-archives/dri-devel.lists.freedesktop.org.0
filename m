Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6649E39CF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 13:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FD10E4A7;
	Wed,  4 Dec 2024 12:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ifpl5CX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5FC10E49E;
 Wed,  4 Dec 2024 12:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733315056; x=1764851056;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3lYBnQXxxj1PmJTsVxH4CL0OhpGmi98GQwy5QH6VFnU=;
 b=Ifpl5CX5e1JP4g/L1RsbjFfm61H7luCdF8UsI/vucx0a8Qu4z7k6ceB2
 DelSFbxTP9IAz427bvsDoMqzUhA8JSrCVvQzwOyxsuEP/oKP8aQIU6HM1
 y8L+E89UfB+lkACFpdFZy5v0qO/A0Uq6YoSAfjqOkhCLqTf7PSYlBiQt7
 ZdKPImiG3Dn5295iMVnXmTK2yOu7VJjId35JtjXp77hAUpcPCMfhtfzFW
 3JRDAlnvZZ4M458QB3AR1WfUo33CNhY4CUH/VnSh0hWKs542BffTb9f99
 Ua7Lw08eGp9dfG2JLATW6VbNx8fMkXO7G89cipF9VTxGcT72cbHTdlCY/ A==;
X-CSE-ConnectionGUID: Im1VD7E6TwScEraXRak3jA==
X-CSE-MsgGUID: ag48df2gSSOrLflIAyaXNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="58992069"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="58992069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 04:24:15 -0800
X-CSE-ConnectionGUID: wytXcv5DSO2ZQiCXZXIz5A==
X-CSE-MsgGUID: kdbykQURTE2sxng4HexJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93835088"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.221])
 ([10.245.246.221])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 04:24:13 -0800
Message-ID: <4d71459d05a5b34acd3c911c80afbb52cc2cc527.camel@linux.intel.com>
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, Matthew Brost
 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 04 Dec 2024 13:24:10 +0100
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
>=20
> What exactly do you need this pre-allocated struct page-pointer array
> of=20
> 1 << MAX_PAGE_ORDER for?
>=20
> Sorry, I must really be missing something here.

It was like a year or more ago since I put this patch together, so TBH
I can't recall the details, other than I'm pretty sure I tried that and
decided against it. Could have been that the changes were too invasive,
and it's pretty easy to break this code even without invasive
changes...

However with an accessor function for the old page pointers and one for
the new ones I imagine it should be possible.

I'll give it a try and see what can be done.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Thanks,
> > Thomas

