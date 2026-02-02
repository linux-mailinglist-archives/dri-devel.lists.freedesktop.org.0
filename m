Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIgPKqlqgGkd8AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:13:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCBC9F7A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06F10E3D2;
	Mon,  2 Feb 2026 09:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlDSALWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9521C10E3C9;
 Mon,  2 Feb 2026 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770023590; x=1801559590;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vXOTW8XU61f4CbGPL3gcpzwdMcHgirqYXw8QOj4FO6Q=;
 b=XlDSALWRYMUKW4j+HxjIDI9ObLAz31I45q0kCZzp49/HJ3GzTNJSre4j
 bgjRb/4oNzlx4ylbwFlXOF0Ss/VUqTZ11pPC3XVyn2WoiTeJE+3XyQWwJ
 VD65YSF9G1lY2Hayunfl3vOW8GUMItcucA+trK/DCCcV/YiADZv1WAhLx
 cMxAReGGz3U03MkbipfR+uPoPQERtUwka/+Empf0ZXVKodI8waWtE4ddW
 6bdeEFKMY7vZSU+0jgdIlQW8thEoGRL7LzHPbedK3tweb8K0bFyGUXpKq
 DLf8dDw2A6UBYJB6YvRrkXwrs+Av4JVH2N417iYBT7sXhfmcB3FanBeEQ Q==;
X-CSE-ConnectionGUID: l6S4zNbVQI2UE+Xwl+WcAA==
X-CSE-MsgGUID: Oe9yRMI9TiehGHOVAlrJQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71160140"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71160140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:13:09 -0800
X-CSE-ConnectionGUID: +NriBRTqQlOEiLyPxWQibQ==
X-CSE-MsgGUID: TSSK///DRCO7TAWUDBX7mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213570159"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 01:13:06 -0800
Message-ID: <a459f147b461c6e6e806282956b7931f74a0aa93.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org,  Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,  Jason
 Gunthorpe	 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 	stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Mon, 02 Feb 2026 10:13:03 +0100
In-Reply-To: <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 2EDCBC9F7A
X-Rspamd-Action: no action

On Sat, 2026-01-31 at 13:42 -0800, John Hubbard wrote:
> On 1/31/26 11:00 AM, Matthew Brost wrote:
> > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellstr=C3=B6m wrote:
> > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellstr=C3=B6m
> > > > > <thomas.hellstrom@linux.intel.com> wrote:
> > > > ...
>=20
> >=20
> > > I'm also not sure a folio refcount should block migration after
> > > the
> > > introduction of pinned (like in pin_user_pages) pages. Rather
> > > perhaps a
> > > folio pin-count should block migration and in that case
> > > do_swap_page()
> > > can definitely do a sleeping folio lock and the problem is gone.
>=20
> A problem for that specific point is that pincount and refcount both
> mean, "the page is pinned" (which in turn literally means "not
> allowed
> to migrate/move").

Yeah this is what I actually want to challenge since this is what
blocks us from doing a clean robust solution here. From brief reading
of the docs around the pin-count implementation, I understand it as "If
you want to access the struct page metadata, get a refcount, If you
want to access the actual memory of a page, take a pin-count"

I guess that might still not be true for all old instances in the
kernel using get_user_pages() instead of pin_user_pages() for things
like DMA, but perhaps we can set that in stone and document it at least
for device-private pages for now which would be sufficient for the
do_swap_pages() refcount not to block migration.


>=20
> (In fact, pincount is implemented in terms of refcount, in most
> configurations still.)

Yes but that's only a space optimization never intended to conflict,
right? Meaning a pin-count will imply a refcount but a refcount will
never imply a pin-count?

Thanks,
Thomas
