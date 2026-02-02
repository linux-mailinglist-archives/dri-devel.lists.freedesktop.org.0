Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GL1qJKaBgGnE8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:51:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6097CB380
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E738410E42F;
	Mon,  2 Feb 2026 10:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkwFxinw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B2A10E420;
 Mon,  2 Feb 2026 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770029474; x=1801565474;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=CU+EqcrQo41HxY+mJmIJYrt/CzhgHVJ/Cwyd+zcgbdA=;
 b=nkwFxinwDXclib1KMlN+Ys2mUHYfZQFDVMwZ3RDl6dng47g0NgpG/90S
 FGQwptlK2E/WDkxZtekKjyyyX39hKTnd2mtE12pDmlJxK9aRae7djkxD3
 l1NEhzbrpQ3qwiG/4PmNYnXgyD0A1iKMOYyxEgy6qCQN3nck15d20LiYA
 +XziNYM7hwZgUb5xubc7l9Qa4Pzlk6xBh/tMdtiqyCdMXVD2MLMdCHyy/
 8Xh3l1Lwr9QRKRgsNauDoixQn+oY2+737v4K1qZyezDeKV8YPArhOjjJe
 bkepGD4opg+xOrJDi83qiI/z2SXSAj85qLWpzFZzEc5FpAu4eNoBcEleH Q==;
X-CSE-ConnectionGUID: tR1EYOcwQcu8EOfmYQ0B5A==
X-CSE-MsgGUID: lpc3zg20TKS8g+7LRKRNPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="81497369"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="81497369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:51:13 -0800
X-CSE-ConnectionGUID: bdUGNwPTRgCA1JyWkJ5CRQ==
X-CSE-MsgGUID: VxeTC3hDSnaok3tgirY+DQ==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.223])
 ([10.245.244.223])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:51:10 -0800
Message-ID: <6a6e054bb6efe76c439b3329702829dbc75b9060.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Matthew Brost
 <matthew.brost@intel.com>,  Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	 <leon@kernel.org>,
 linux-mm@kvack.org, stable@vger.kernel.org, 	dri-devel@lists.freedesktop.org
Date: Mon, 02 Feb 2026 11:51:08 +0100
In-Reply-To: <nm4qa6fz2kecodhtt7yfcnfx77ik7pr7332amfqvgyhgs5xwqf@v2v6coz5genz>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
 <nm4qa6fz2kecodhtt7yfcnfx77ik7pr7332amfqvgyhgs5xwqf@v2v6coz5genz>
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: E6097CB380
X-Rspamd-Action: no action

On Mon, 2026-02-02 at 21:34 +1100, Alistair Popple wrote:
> On 2026-02-02 at 20:13 +1100, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote...
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
>=20
> Having just spent a long time cleaning up a bunch of special
> rules/cases for
> ZONE_DEVICE page refcounting I'm rather against reintroducing them
> just for some
> ZONE_DEVICE pages. So whatever arguments are applied or introduced
> here would
> need to be made to work for all pages, not just some ZONE_DEVICE
> pages.

That's completely understandable. I would like to be able to say if we
apply the argument that when checking the pin-count pages are locked,
lru-isolated and with zero map-count then that would hold for all
pages, but my knowledge of the mm internals isn't sufficient
unfortunately.

So even if that would be an ultimate goal, we would probably have to be
prepared to have to revert (at least temporarily) such a solution for
!ZONE_DEVICE pages and have a plan for handling that.

Thanks,
Thomas


>=20
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
> > Thanks,
> > Thomas
> >=20
