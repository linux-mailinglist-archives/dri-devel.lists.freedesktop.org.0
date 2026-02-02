Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCeIF6WvgGn6AQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:07:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B7CD236
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015210E2BA;
	Mon,  2 Feb 2026 14:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnBWeuZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D07F10E2AE;
 Mon,  2 Feb 2026 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770041248; x=1801577248;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ZqzrDhj1EDilGK9q5axYNOV/YZlmUYC0LduGT2R5lv4=;
 b=ZnBWeuZmIxSHmKKJ+jQzY2kDBpOsBYQbtlF0MpKNDxQCF9NdLpKZ0tr9
 Qywfyovw5MSwKnRKZxTITF6nNLanNB+5I2oRp0j9t4dfsmx2Z0LyoZZUg
 eEKEyF7Ivp61h2EXURdKeK2BF6Hc2w/2vMkRRJ1NBcuD+d0Dz40zGSrog
 U+UJYxFWtGzZrKhdikq/CldDcAm2OVsjtxQGgtyrdF3xXLp9z2voKT0YB
 mLfq0APqQW+W5vFFQX15Hr6vfLmcR2FGtHtVi64p/YFbYwOPLHn4Jeiqg
 nNOGoWX6A6yLmMr2auV7lifPuLzPAFixSdYPigXEGUgF9PwcyXSvo5qK5 g==;
X-CSE-ConnectionGUID: HKr8iFqeSrC4gMbAayERFA==
X-CSE-MsgGUID: 22qWzwjxQcafk4SdviYTTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70917882"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70917882"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:07:27 -0800
X-CSE-ConnectionGUID: cKEYfzuTR5u4KYjUt9zLbw==
X-CSE-MsgGUID: fsCbwpmqTpOP4g2Rlt202Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="214476189"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 06:07:24 -0800
Message-ID: <43d010966fc99ca480f365220ae8c3615e538b07.camel@linux.intel.com>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>, John Hubbard
 <jhubbard@nvidia.com>,  Andrew Morton <akpm@linux-foundation.org>,
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig	 <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky	 <leon@kernel.org>,
 linux-mm@kvack.org, stable@vger.kernel.org, 	dri-devel@lists.freedesktop.org
Date: Mon, 02 Feb 2026 15:07:21 +0100
In-Reply-To: <nvajpou3j7osyx553ktafdc3qx3v6hisygho42swkzm6xdbwvt@bg6d25otpqj3>
References: <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
 <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
 <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
 <f48e3d818c6e20d6ea7a7fbd6b1741f25df17a78.camel@linux.intel.com>
 <ymg5yawktqtw7vfgt77iciqzxhjlsnqrwnjx3xmkflbjqbmq5s@jcxzcymqq2af>
 <d8c02e59a4cdd2d02b41aa5ce8dcd36a94fbba86.camel@linux.intel.com>
 <ewowxagab6ej5xldwsewfvg4wgpmelps2dgqj7efmcnhks4nqg@nqdhfedzlvjb>
 <aaffa3f1bbb97e61d86c0e4ac474cdc8b983b85b.camel@linux.intel.com>
 <nvajpou3j7osyx553ktafdc3qx3v6hisygho42swkzm6xdbwvt@bg6d25otpqj3>
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
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8E4B7CD236
X-Rspamd-Action: no action

On Mon, 2026-02-02 at 23:26 +1100, Alistair Popple wrote:
> On 2026-02-02 at 22:44 +1100, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote...
> > On Mon, 2026-02-02 at 22:22 +1100, Alistair Popple wrote:
> > > On 2026-02-02 at 21:41 +1100, Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com> wrote...
> > > > On Mon, 2026-02-02 at 21:25 +1100, Alistair Popple wrote:
> > > > > On 2026-02-02 at 20:30 +1100, Thomas Hellstr=C3=B6m
> > > > > <thomas.hellstrom@linux.intel.com> wrote...
> > > > > > Hi,
> > > > > >=20
> > > > > > On Mon, 2026-02-02 at 11:10 +1100, Alistair Popple wrote:
> > > > > > > On 2026-02-02 at 08:07 +1100, Matthew Brost
> > > > > > > <matthew.brost@intel.com>
> > > > > > > wrote...
> > > > > > > > On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard
> > > > > > > > wrote:
> > > > > > > > > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > > > > > > > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John
> > > > > > > > > > Hubbard
> > > > > > > > > > wrote:
> > > > > > > > > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > > > > > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100,
> > > > > > > > > > > > Thomas
> > > > > > > > > > > > Hellstr=C3=B6m
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > On Fri, 2026-01-30 at 19:01 -0800, John
> > > > > > > > > > > > > Hubbard
> > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas
> > > > > > > > > > > > > > > Hellstr=C3=B6m
> > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > ...
> > > > > > > > > > > > I=E2=80=99m not convinced the folio refcount has an=
y
> > > > > > > > > > > > bearing if
> > > > > > > > > > > > we
> > > > > > > > > > > > can take a
> > > > > > > > > > > > sleeping lock in do_swap_page, but perhaps I=E2=80=
=99m
> > > > > > > > > > > > missing
> > > > > > > > > > > > something.
> > > > > > >=20
> > > > > > > I think the point of the trylock vs. lock is that if you
> > > > > > > can't
> > > > > > > immediately
> > > > > > > lock the page then it's an indication the page is
> > > > > > > undergoing
> > > > > > > a
> > > > > > > migration.
> > > > > > > In other words there's no point waiting for the lock and
> > > > > > > then
> > > > > > > trying
> > > > > > > to call
> > > > > > > migrate_to_ram() as the page will have already moved by
> > > > > > > the
> > > > > > > time
> > > > > > > you
> > > > > > > acquire
> > > > > > > the lock. Of course that just means you spin faulting
> > > > > > > until
> > > > > > > the
> > > > > > > page
> > > > > > > finally
> > > > > > > migrates.
> > > > > > >=20
> > > > > > > If I'm understanding the problem it sounds like we just
> > > > > > > want
> > > > > > > to
> > > > > > > sleep
> > > > > > > until the
> > > > > > > migration is complete, ie. same as the migration entry
> > > > > > > path.
> > > > > > > We
> > > > > > > don't
> > > > > > > have a
> > > > > > > device_private_entry_wait() function, but I don't think
> > > > > > > we
> > > > > > > need
> > > > > > > one,
> > > > > > > see below.
> > > > > > >=20
> > > > > > > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > > > > > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > > > > > > > > --- a/mm/memory.c
> > > > > > > > > > +++ b/mm/memory.c
> > > > > > > > > > @@ -4652,6 +4652,8 @@ vm_fault_t
> > > > > > > > > > do_swap_page(struct
> > > > > > > > > > vm_fault
> > > > > > > > > > *vmf)
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 vmf->page =3D
> > > > > > > > > > softleaf_to_page(entry);
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ret =3D
> > > > > > > > > > remove_device_exclusive_entry(vmf);
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if
> > > > > > > > > > (softleaf_is_device_private(entry))
> > > > > > > > > > {
> > > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct dev_pagemap *pgmap;
> > > > > > > > > > +
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (vmf->flags &
> > > > > > > > > > FAULT_FLAG_VMA_LOCK)
> > > > > > > > > > {
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * mig=
rate_to_ram
> > > > > > > > > > is
> > > > > > > > > > not
> > > > > > > > > > yet
> > > > > > > > > > ready to operate
> > > > > > > > > > @@ -4670,21 +4672,15 @@ vm_fault_t
> > > > > > > > > > do_swap_page(struct
> > > > > > > > > > vm_fault
> > > > > > > > > > *vmf)
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > > > > =C2=A0
> > > > > > > > > > vmf-
> > > > > > > > > > > orig_pte)))
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto unlock=
;
> > > > > > > > > >=20
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * Get a page reference
> > > > > > > > > > while
> > > > > > > > > > we
> > > > > > > > > > know
> > > > > > > > > > the page can't be
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * freed.
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (trylock_page(vmf-
> > > > > > > > > > >page)) {
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap
> > > > > > > > > > *pgmap;
> > > > > > > > > > -
> > > > > > > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_page(vmf-
> > > > > > > > > > >page);
> > > > > > >=20
> > > > > > > At this point we:
> > > > > > > 1. Know the page needs to migrate
> > > > > > > 2. Have the page locked
> > > > > > > 3. Have a reference on the page
> > > > > > > 4. Have the PTL locked
> > > > > > >=20
> > > > > > > Or in other words we have everything we need to install a
> > > > > > > migration
> > > > > > > entry,
> > > > > > > so why not just do that? This thread would then proceed
> > > > > > > into
> > > > > > > migrate_to_ram()
> > > > > > > having already done migrate_vma_collect_pmd() for the
> > > > > > > faulting
> > > > > > > page
> > > > > > > and any
> > > > > > > other threads would just sleep in the wait on migration
> > > > > > > entry
> > > > > > > path
> > > > > > > until the
> > > > > > > migration is complete, avoiding the livelock problem the
> > > > > > > trylock
> > > > > > > was
> > > > > > > introduced
> > > > > > > for in 1afaeb8293c9a.
> > > > > > >=20
> > > > > > > =C2=A0- Alistair
> > > > > > >=20
> > > > > > > > >=20
> > > > > >=20
> > > > > > There will always be a small time between when the page is
> > > > > > locked
> > > > > > and
> > > > > > when we can install a migration entry. If the page only has
> > > > > > a
> > > > > > single
> > > > > > mapcount, then the PTL lock is held during this time so the
> > > > > > issue
> > > > > > does
> > > > > > not occur. But for multiple map-counts we need to release
> > > > > > the
> > > > > > PTL
> > > > > > lock
> > > > > > in migration to run try_to_migrate(), and before that, the
> > > > > > migrate
> > > > > > code
> > > > > > is running lru_add_drain_all() and gets stuck.
> > > > >=20
> > > > > Oh right, my solution would be fine for the single mapping
> > > > > case
> > > > > but I
> > > > > hadn't
> > > > > fully thought through the implications of other threads
> > > > > accessing
> > > > > this for
> > > > > multiple map-counts. Agree it doesn't solve anything there
> > > > > (the
> > > > > rest
> > > > > of the
> > > > > threads would still spin on the trylock).
> > > > >=20
> > > > > Still we could use a similar solution for waiting on device-
> > > > > private
> > > > > entries as
> > > > > we do for migration entries. Instead of spinning on the
> > > > > trylock
> > > > > (ie.
> > > > > PG_locked)
> > > > > we could just wait on it to become unlocked if it's already
> > > > > locked.
> > > > > Would
> > > > > something like the below completely untested code work?
> > > > > (obviously
> > > > > this is a bit
> > > > > of hack, to do it properly you'd want to do more than just
> > > > > remove
> > > > > the
> > > > > check from
> > > > > migration_entry_wait)
> > > >=20
> > > > Well I guess there could be failed migration where something is
> > > > aborting the migration even after a page is locked. Also we
> > > > must
> > > > unlock
> > > > the PTL lock before waiting otherwise we could deadlock.
> > >=20
> > > Yes, this is exactly what the migration entry wait code does. And
> > > if
> > > there's a
> > > failed migration, no problem, you just retry. That's not a
> > > deadlock
> > > unless the
> > > migration never succeeds and then your stuffed anyway.
> > >=20
> > > > I believe a robust solution would be to take a folio reference
> > > > and
> > > > do a
> > > > sleeping lock like John's example. Then to assert that a folio
> > > > pin-
> > > > count, not ref-count is required to pin a device-private folio.
> > > > That
> > > > would eliminate the problem of the refcount held while locking
> > > > blocking
> > > > migration. It looks like that's fully consistent with=20
> > >=20
> > > Waiting on a migration entry like in my example below is exactly
> > > the
> > > same as
> > > sleeping on the page lock other than it just waits for the page
> > > to be
> > > unlocked
> > > rather than trying to lock it.
> > >=20
> > > Internally migration_entry_wait_on_locked() is just an open-coded
> > > version
> > > of folio_lock() which deals with dropping the PTL and that works
> > > without a page
> > > refcount.
> > >=20
> > > So I don't understand how this solution isn't robust? It requires
> > > no
> > > funniness
> > > with refcounts and works practically the same as a sleeping lock.
> >=20
> > You're right. I didn't look closely enough into what the
> > migration_entry_wait_on_locked() did. Sorry about that.
>=20
> No worries. I'm somewhat familiar with it from updating it
> specifically so it
> wouldn't take a page reference as we used to have similar live-
> lock/starvation
> issues in that path too.
>=20
> > That would indeed fix the problem as well. Then the only argument
> > remaining for the get-a-reference-and-lock solution would be it's
> > not
> > starvation prone in the same way. But that's definitely a problem I
> > think we could live with for now.
>=20
> I don't follow how this solution would be any more starvation prone
> than getting
> a reference and locking - here the winning fault takes the lock and
> any other
> faulting threads would just wait until it was released before
> returning from
> the fault handler assuming it had been handled. But it's been a while
> since I've
> thought about all the scenarios here so maybe I missed one.

My thinking is that it would be if theoretical racing lock-holders
don't migrate to system, we can't *guarantee* migration will ever
happen. Although admittedly this is very unlikely to happen. If we
instead locked the page we'd on the other hand need to walk the page
table again to check whether the pte content was still valid....


>=20
> > I'll give this code a test. BTW that removal of unlock_page() isn't
> > intentional, right?=20
>=20
> Thanks. And you're right, that was unintentional. Serves me for
> responding too
> late at night :-)

So I ended up with this:




diff --git a/mm/memory.c b/mm/memory.c
index da360a6eb8a4..84b6019eac6d 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4684,7 +4684,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 				unlock_page(vmf->page);
 				put_page(vmf->page);
 			} else {
-				pte_unmap_unlock(vmf->pte, vmf->ptl);
+				pte_unmap(vmf->pte);
+			  	migration_entry_wait_on_locked(entry,
vmf->ptl);
 			}
 		} else if (softleaf_is_hwpoison(entry)) {
 			ret =3D VM_FAULT_HWPOISON;
--=20
2.52.0


Seems to be a working fix.

/Thomas


>=20
> =C2=A0- Alistair
>=20
> > Thanks,
> > Thomas
> >=20
> >=20
> > >=20
> > > =C2=A0- Alistair
> > >=20
> > > > https://docs.kernel.org/core-api/pin_user_pages.html
> > > >=20
> > > > Then as general improvements we should fully unmap pages before
> > > > calling
> > > > lru_add_drain_all() as MBrost suggest and finally, to be more
> > > > nice
> > > > to
> > > > the system in the common cases, add a cond_resched() to
> > > > hmm_range_fault().
> > > >=20
> > > > Thanks,
> > > > Thomas
> > > >=20
> > > >=20
> > > >=20
> > > > >=20
> > > > > ---
> > > > >=20
> > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > index 2a55edc48a65..3e5e205ee279 100644
> > > > > --- a/mm/memory.c
> > > > > +++ b/mm/memory.c
> > > > > @@ -4678,10 +4678,10 @@ vm_fault_t do_swap_page(struct
> > > > > vm_fault
> > > > > *vmf)
> > > > > =C2=A0				pte_unmap_unlock(vmf->pte,
> > > > > vmf-
> > > > > > ptl);
> > > > > =C2=A0				pgmap =3D page_pgmap(vmf-
> > > > > >page);
> > > > > =C2=A0				ret =3D pgmap->ops-
> > > > > > migrate_to_ram(vmf);
> > > > > -				unlock_page(vmf->page);
> > > > > =C2=A0				put_page(vmf->page);
> > > > > =C2=A0			} else {
> > > > > -				pte_unmap_unlock(vmf->pte,
> > > > > vmf-
> > > > > > ptl);
> > > > > +				migration_entry_wait(vma-
> > > > > >vm_mm,
> > > > > vmf->pmd,
> > > > > +						=C2=A0=C2=A0=C2=A0=C2=A0 vmf-
> > > > > > address);
> > > > > =C2=A0			}
> > > > > =C2=A0		} else if (softleaf_is_hwpoison(entry)) {
> > > > > =C2=A0			ret =3D VM_FAULT_HWPOISON;
> > > > > diff --git a/mm/migrate.c b/mm/migrate.c
> > > > > index 5169f9717f60..b676daf0f4e8 100644
> > > > > --- a/mm/migrate.c
> > > > > +++ b/mm/migrate.c
> > > > > @@ -496,8 +496,6 @@ void migration_entry_wait(struct
> > > > > mm_struct
> > > > > *mm,
> > > > > pmd_t *pmd,
> > > > > =C2=A0		goto out;
> > > > > =C2=A0
> > > > > =C2=A0	entry =3D softleaf_from_pte(pte);
> > > > > -	if (!softleaf_is_migration(entry))
> > > > > -		goto out;
> > > > > =C2=A0
> > > > > =C2=A0	migration_entry_wait_on_locked(entry, ptl);
> > > > > =C2=A0	return;
