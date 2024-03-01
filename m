Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49B86E391
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 15:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E6E10F0B5;
	Fri,  1 Mar 2024 14:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isgZTc7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D9C10F09F;
 Fri,  1 Mar 2024 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709304100; x=1740840100;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UCKe9ysGo3hTH2MAgwTYYUpHEchtr52t7WdIei/w92U=;
 b=isgZTc7mp4zYy7Fn7NFIwgA2uq9rbjwelJc3tMkPMGc37P+xvc4V5V2X
 4pZQP5mRB5qL6hj+UxmuyDYXpqRuuxWkYikhpdpKyA+7UHJGUC58gf7DO
 7iwsB7SQHhDvGxcpu1O5onsl5rZS5G7hrwhFPr7wRDXqh21tWgFUUkILw
 2Em0kJoHlg3MkA8C8Y1wYZZrucdlIdsOac79qsOtO/6+RfMa2IJqPhTKp
 zp/qFewzH6ASIfAGAuSj7lnM3j5U8RnImBdlSEW8wL/6cj7zqLNHhjAPd
 O3ffcPc21ka9+jSk+7IfCB1Ngyi1m5H5KLcwedpDRf0zHyPX/tzDDhRFQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4015806"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4015806"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 06:41:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8614174"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.26])
 ([10.249.254.26])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 06:41:38 -0800
Message-ID: <d9919f0653a859e26acf7b7c7fc8a910c4731a1c.camel@linux.intel.com>
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
Cc: dri-devel@lists.freedesktop.org
Date: Fri, 01 Mar 2024 15:41:35 +0100
In-Reply-To: <0314e74c-cd07-417e-96f4-0b84076f7245@amd.com>
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
 <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
 <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
 <c2e29b31a1654625ef316264e2335a0158b3a228.camel@linux.intel.com>
 <f00b415e437f0a7955ca6759c30bdf0d3444e21f.camel@linux.intel.com>
 <0314e74c-cd07-417e-96f4-0b84076f7245@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Fri, 2024-03-01 at 15:20 +0100, Christian K=C3=B6nig wrote:
> Am 01.03.24 um 14:45 schrieb Thomas Hellstr=C3=B6m:
> > On Thu, 2024-02-29 at 18:34 +0100, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Christian.
> > >=20
> > > Thanks for having a look.
> > >=20
> > > On Thu, 2024-02-29 at 16:08 +0100, Christian K=C3=B6nig wrote:
> > > > Am 16.02.24 um 15:20 schrieb Thomas Hellstr=C3=B6m:
> > > > [SNIP]
> > > > > > My approach was basically to not only lock the current BO,
> > > > > > but
> > > > > > also
> > > > > > the
> > > > > > next one. Since only a locked BO can move on the LRU we
> > > > > > effectively
> > > > > > created an anchor.
> > > > > >=20
> > > > > > Before I dig into the code a couple of questions:
> > > > > These are described in the patches but brief comments inline.
> > > > >=20
> > > > > > 1. How do you distinct BOs and iteration anchors on the
> > > > > > LRU?
> > > > > Using a struct ttm_lru_item, containing a struct list_head
> > > > > and
> > > > > the
> > > > > type. List nodes embeds this instead of a struct list_head.
> > > > > This
> > > > > is
> > > > > larger than the list head but makes it explicit what we're
> > > > > doing.
> > > > Need to look deeper into the code of this, but it would be nice
> > > > if
> > > > we
> > > > could abstract that better somehow.
> > > Do you have any specific concerns or improvements in mind? I
> > > think
> > > patch 1 and 2 are pretty straigthforward. Patch 3 is indeed a bit
> > > hairy.
>=20
> Yeah, seen that as well. No idea of hand how to improve.
>=20
> Amar should have time to give the patches a more in deep review,
> maybe=20
> he has an idea.
>=20
> > >=20
> > > > > > 2. How do you detect that a bulk list moved on the LRU?
> > > > > An age u64 counter on the bulk move that we're comparing
> > > > > against.
> > > > > It's
> > > > > updated each time it moves.
> > > > >=20
> > > > >=20
> > > > > > 3. How do you remove the iteration anchors from the bulk
> > > > > > list?
> > > > > A function call at the end of iteration, that the function
> > > > > iterating is
> > > > > requried to call.
> > > > Thinking quite a bit about that in the last week and I came to
> > > > the
> > > > conclusion that this might be overkill.
> > > >=20
> > > > All BOs in a bulk share the same reservation object. So when
> > > > you
> > > > acquired one you can just keep the dma-resv locked even after
> > > > evicting
> > > > the BO.
> > > >=20
> > > > Since moving BOs requires locking the dma-resv object the whole
> > > > problem
> > > > then just boils down to a list_for_each_element_safe().
> > > >=20
> > > > That's probably a bit simpler than doing the add/remove dance.
> > > I think the problem with the "lock the next object" approach
>=20
> Stop stop, you misunderstood me. I was not suggesting to use the lock
> the next object approach, this anchor approach here is certainly
> better.
>=20
> I just wanted to note that we most likely don't need to insert a
> second=20
> anchor for bulk moves.
>=20
> Basically my idea is that we start to use the drm_exec object to lock
> BOs and those BOs stay locked until everything is completed.
>=20
> That also removes the problem that a BO might be evicted just to be=20
> moved back in again by a concurrent submission.

Ah, yes then we're on the same page.


>=20
> > > =C2=A0 is that
> > > there are situations that it might not work. First, where not
> > > asserting
> > > anywhere that all bulk move resource have the same lock,
>=20
> Daniel actually wanted that I add such an assert, I just couldn't
> find a=20
> way to easily do this back then.
>=20
> But since I reworked the bulk move since then it should now be
> possible.
>=20
> > > =C2=A0 and after
> > > individualization they certainly don't.
>=20
> Actually when they are individualized for freeing they shouldn't be
> part=20
> of any bulk any more.
>=20
> > > =C2=A0 (I think I had a patch
> > > somewhere to try to enforce that, but I don't think it ever got
> > > reviewed). I tried to sort out the locking rules at one point for
> > > resources switching bos to ghost object but I long since forgot
> > > those.
> > >=20
> > > I guess it all boils down to the list elements being resources,
> > > not
> > > bos.
> > >=20
> > > Also I'm concerned about keeping a resv held for a huge number of
> > > evictions will block out a higher priority ticket for a
> > > substantial
> > > amount of time.
> > >=20
> > > I think while the suggested solution here might be a bit of an
> > > overkill, it's simple enough to understand, but the locking
> > > implications of resources switching resvs arent.
> > >=20
> > > But please let me know how we should proceed here. This is a
> > > blocker
> > > for other pending work we have.
> > Actually some more issues with the locking approach would be with
> > the
> > intended use-cases I was planning to use this for.
> >=20
> > For example the exhaustive eviction where we regularly unlock the
> > lru_lock to take the bo lock. If we need to do that for the first
> > element of a bulk_move list, we can't have the bo lock of the next
> > element when we unlock the list. For part of the list that is not a
> > bulk sublist, this also doesn't work AFAICT.
>=20
> Well when we drop the LRU lock we should always have the anchor on
> the=20
> LRU before the element we try to lock.
>=20
> This way we actually don't have to move the anchor unless we found a
> BO=20
> which we don't want to evict.
>=20
> E.g. something like
>=20
> Head -> anchor -> BO1 -> BO2 -> BO3 -> BO4
>=20
> And we Evict BO1, BO2 and then find that BO3 doesn't match the=20
> allocation pattern we need so only then is the anchor moved after
> BO3:
>=20
> Head -> BO3 -> anchor -> BO4....
>=20
> And when we moved inside a bulk with an anchor we have already locked
> at=20
> least one BO of the bulk, so locking the next one is a no-op.
>=20
> > And finally for the tt shinking that's been pending for quite some
> > time, the last comment that made me temporarily shelf is was that
> > we
> > should expose the lru traversal to the drivers, and the drivers
> > implement the shrinkers with TTM helpers, rather than having TTM
> > being
> > the middle layer. So I think exposing the LRU traversal to drivers
> > will
> > probably end up having pretty weird semantics if it sometimes locks
> > or
> > requiring locking of the next object while traversing.
>=20
> Yeah, I was just yesterday talking about that with Amar and putting
> him=20
> on the task to look into tt shrinking.

Oh, we should probably sync on that then so we don't create two
separate solutions. That'd be wasted work.

I think the key patch in the series I had that made things "work" was
this helper patch here:
https://patchwork.kernel.org/project/intel-gfx/patch/20230215161405.187368-=
15-thomas.hellstrom@linux.intel.com/

Making sure that we could shrink on a per-page basis (we either insert
the page in the swap cache or it might actually even work with copying
to shmem, since pages are immediately released one by one and not after
copying the whole tt).

Sima has little confidence that we'll find a core mm reviewer to the
patch I made to insert the pages directly into the swap cache.

https://patchwork.kernel.org/project/intel-gfx/patch/20230215161405.187368-=
13-thomas.hellstrom@linux.intel.com/

/Thomas


