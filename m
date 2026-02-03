Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLkYDHHAgWm7JAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:31:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C63BD6C90
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6186810E5A0;
	Tue,  3 Feb 2026 09:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkruFm8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25D110E59B;
 Tue,  3 Feb 2026 09:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770111084; x=1801647084;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9ZCbCekETf/Hc7H9g6zabuW31iHCCcdMboCzlVHoOOY=;
 b=dkruFm8LB1uWUa5bOHOo3MeXo3fyiKK70ai+X2MEfxhjVloYoww2DqEt
 bTvTQnWKmkoeE5/P3ml9Sr6PdznKujPR7vk1CkLlIsDQUzUykzfRav1fK
 iF4pr3e9S6Le/EzBiWxO2DMZoPhdsBEFzdjxjS3BKMIXWOUTBvMBnRQ6a
 v6HaBtNKxK9hbAcnfBfkwXR3danRlLE5S6NpIUkYl47sVlzmwT1gfchoe
 HU2dIeeNKvg/pPfbmqv3vDZ7zbYOcLYzCYYbyRKEnj3XDva6Hlt2Asqq9
 z1l36LB2KFQCiCTwctNtpbJC7q1n+ISH2BtgZYKREl/wsvWRuAJ4oXN5N g==;
X-CSE-ConnectionGUID: LGk++OysTiuuB0EGmnRzTg==
X-CSE-MsgGUID: lBdpCon7R2yVlFrs3+9DZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82385812"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82385812"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 01:31:23 -0800
X-CSE-ConnectionGUID: lG5quSw+RHGTOlWRbhDFtw==
X-CSE-MsgGUID: lZ/yXG0gRkCAAQSG3/jopw==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.55])
 ([10.245.245.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 01:31:20 -0800
Message-ID: <9a9853a320a30802ff35803a574aab037aa2fd92.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org,  Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,  Jason
 Gunthorpe	 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 	stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Tue, 03 Feb 2026 10:31:04 +0100
In-Reply-To: <a5b71dbc-9e3a-4098-8821-21a9a02ec235@nvidia.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
 <a5b71dbc-9e3a-4098-8821-21a9a02ec235@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3C63BD6C90
X-Rspamd-Action: no action


On Mon, 2026-02-02 at 14:28 -0800, John Hubbard wrote:
> On 2/2/26 1:13 AM, Thomas Hellstr=C3=B6m wrote:
> > On Sat, 2026-01-31 at 13:42 -0800, John Hubbard wrote:
> > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=C3=B6m
> > > > > > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > > > ...
> > >=20
> > > >=20
> > > > > I'm also not sure a folio refcount should block migration
> > > > > after
> > > > > the
> > > > > introduction of pinned (like in pin_user_pages) pages. Rather
> > > > > perhaps a
> > > > > folio pin-count should block migration and in that case
> > > > > do_swap_page()
> > > > > can definitely do a sleeping folio lock and the problem is
> > > > > gone.
> > >=20
> > > A problem for that specific point is that pincount and refcount
> > > both
> > > mean, "the page is pinned" (which in turn literally means "not
> > > allowed
> > > to migrate/move").
> >=20
> > Yeah this is what I actually want to challenge since this is what
> > blocks us from doing a clean robust solution here. From brief
> > reading
> > of the docs around the pin-count implementation, I understand it as
> > "If
> > you want to access the struct page metadata, get a refcount, If you
> > want to access the actual memory of a page, take a pin-count"
> >=20
> > I guess that might still not be true for all old instances in the
> > kernel using get_user_pages() instead of pin_user_pages() for
> > things
> > like DMA, but perhaps we can set that in stone and document it at
> > least
> > for device-private pages for now which would be sufficient for the
> > do_swap_pages() refcount not to block migration.
> >=20
>=20
> It's an interesting direction to go...
>=20
> >=20
> > >=20
> > > (In fact, pincount is implemented in terms of refcount, in most
> > > configurations still.)
> >=20
> > Yes but that's only a space optimization never intended to
> > conflict,
> > right? Meaning a pin-count will imply a refcount but a refcount
> > will
> > never imply a pin-count?
> >=20
> Unfortunately, they are more tightly linked than that today, at least
> until
> someday when specialized folios are everywhere (at which point
> pincount
> gets its own field).
>=20
> Until then, it's not just a "space optimization", it's "overload
> refcount
> to also do pincounting". And "let core mm continue to treat refcounts
> as
> meaning that the page is pinned".

So this is what I had in mind:

I think certainly this would work regardless of whether pincount is
implemented by means of refcount with a bias or not, and AFAICT it's
also consistent with=20

https://docs.kernel.org/core-api/pin_user_pages.html

But it would not work if some part of core mm grabs a page refcount and
*expects* that to pin a page in the sense that it should not be
migrated. But you're suggesting that's actually the case?

Thanks,
Thomas

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a101a187e6da..c07a79995128 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -534,33 +534,15 @@ static void migrate_vma_collect(struct
migrate_vma *migrate)
  * migrate_vma_check_page() - check if page is pinned or not
  * @page: struct page to check
  *
- * Pinned pages cannot be migrated. This is the same test as in
- * folio_migrate_mapping(), except that here we allow migration of a
- * ZONE_DEVICE page.
+ * Pinned pages cannot be migrated.
  */
 static bool migrate_vma_check_page(struct page *page, struct page
*fault_page)
 {
        struct folio *folio =3D page_folio(page);
=20
-       /*
-        * One extra ref because caller holds an extra reference,
either from
-        * folio_isolate_lru() for a regular folio, or
migrate_vma_collect() for
-        * a device folio.
-        */
-       int extra =3D 1 + (page =3D=3D fault_page);
-
-       /* Page from ZONE_DEVICE have one extra reference */
-       if (folio_is_zone_device(folio))
-               extra++;
-
-       /* For file back page */
-       if (folio_mapping(folio))
-               extra +=3D 1 + folio_has_private(folio);
-
-       if ((folio_ref_count(folio) - extra) > folio_mapcount(folio))
-               return false;
+       VM_WARN_ON_FOLIO(folio_test_lru(folio) || folio_mapped(folio),
folio);
=20
-       return true;
+       return !folio_maybe_dma_pinned(folio);
 }
=20



>=20
>=20
> thanks,
