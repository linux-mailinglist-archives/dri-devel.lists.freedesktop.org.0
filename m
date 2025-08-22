Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63CB31243
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 10:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2A10EA92;
	Fri, 22 Aug 2025 08:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpOyenzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C4E10EA92;
 Fri, 22 Aug 2025 08:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755852681; x=1787388681;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=XGfgUR0Yp2JSTN0GjEwhbyPDIVTkGzLeE2RkQgd4X6E=;
 b=dpOyenzWoj9wTsNCUQ09fJjF/0xqw+AwbdAghR/6vGS1nz8woUlpeso/
 yCb199V5Mhb5AfEab97pkeKhllGEwleQltNC3Yl45KLqVEWxNgL9864u7
 Z4Ls+Uwi4SQpy0mpQCDqDxBp4V4UTFCJomeen9gZP6KjjHa6klS+YLPgH
 nbUF1izNQ1Q63JEUUw4V1rI1uEW9E8VmxBUN1/7o3XDF2N2gu6S34JdN6
 190+UBP7vPMFYTuevkwXT/E62+8Rn6uTyuZBmLlalFgAxET2u3C4DgFQR
 xOGz15pFPhSg272eoJcOgE8clxnc2fbCdAoVrDacNjtASlidzFexkSWki g==;
X-CSE-ConnectionGUID: uV9IVc34QZOm7MHhB6cW7g==
X-CSE-MsgGUID: OMEWtpwtRKKupK2lxwAonw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58081468"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58081468"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 01:51:20 -0700
X-CSE-ConnectionGUID: RN6pmHqbS8+/LFBefDIVLg==
X-CSE-MsgGUID: n6FQwpkBTp67qaPoFMc3nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="172923511"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 01:51:18 -0700
Message-ID: <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Fri, 22 Aug 2025 10:51:13 +0200
In-Reply-To: <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
 <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
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

Hi

On Thu, 2025-08-21 at 16:59 +0200, Christian K=C3=B6nig wrote:
> On 21.08.25 16:06, Thomas Hellstr=C3=B6m wrote:
> > > What are you referring to?
> >=20
> > https://lore.kernel.org/intel-xe/a004736315d77837172418eb196d5b5f80b74e=
6c.camel@linux.intel.com/
>=20
> Thanks, that one never made it into my inbox as far as I can see.
>=20
> > A couple of questions on the design direction here:
> >=20
> > IIRC both xe and i915 has checks to consider objects with a 0 gem
> > refcount as zombies requiring special treatment or skipping, when
> > encountered in TTM callbacks. We need to double-check that.
>=20
> I think I've found all of those. The one in i915 were actually not
> TTM specific but try to catch the same problem on the GEM refcount.
>=20
> > But I wonder,=20
> > first this practice of resurrecting refcounts seem a bit unusual, I
> > wonder if we can get rid of that somehow?
>=20
> I was also going back on forth if that is a good idea or not as well.
>=20
> The usual solution to such kinds of issues is to use two reference
> counts, so that you got a multi stage cleanup approach. E.g. backing
> store and object, like what mm_struct is using as well.
>=20
> The problem was simply that TTM/GEM ended up having *four* reference
> counts for the same object, each was doing something different and
> they didn't worked well together at all.
>=20
> > Furthermore, it seems the problem with drm_exec is related only to
> > the
> > LRU walk. What about adding a struct completion to the object, that
> > is
> > signaled when the object has freed its final backing-store. The LRU
> > walk would then check if the object is a zombie, and if so just
> > wait on
> > the struct completion. (Need of course to carefully set up locking
> > orders). Then we wouldn't need to resurrect the gem refcount, nor
> > use
> > drm_exec locking for zombies.
>=20
> I had a similar idea, waiting is already possible by waiting for the
> BOs work item.
>=20
> But I abandoned that idea because I couldn't see how we could solve
> the locking.
>=20
> > We would still need some form of refcounting while waiting on the
> > struct completion, but if we restricted the TTM refcount to *only*
> > be
> > used internally for that sole purpose, and also replaced the final
> > ttm_bo_put() with the ttm_bo_finalize() that you suggest we
> > wouldn't
> > need to resurrect that refcount since it wouldn't drop to zero
> > until
> > the object is ready for final free.
> >=20
> > Ideas, comments?
>=20
> Ideally I think we would use the handle_count as backing store the
> drm_gem_object->refcount as structure reference.
>=20
> But that means a massive rework of the GEM handling/drivers/TTM.
>=20
> Alternative we could just grab a reference to a unsignaled fence when
> we encounter a dead BO on the LRU.
>=20
> What do you think of that idea?

I think to be able to *guarantee* exhaustive eviction, we need
1)=C2=A0all unfreed resources to sit on an LRU, and
2) everything on the LRU needs to be able to have something to wait
for.

A fence can't really guarantee 2), but it's close. There is a time-
interval in betwen where the last fence signals and we take the
resource from the LRU and free it.

A struct completion can be made to signal when the resource is freed.
I think the locking restriction in the struct completion case (the
struct completion is likely waited for under a dma-resv), is that
nothing except the object destructor may take an individualized resv of
a zombie gem object whose refcount has gone to zero. The destructor
should use an asserted trylock only to make lockdep happy. The struct
completion also needs a refcount to avoid destroying it while there are
waiters.

So what do you think about starting out with a fence, and if / when
that appears not to be sufficient, we have a backup plan to move to a
struct completion?

Thomas


>=20
> Regards,
> Christian.

