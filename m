Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B0958BD5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 18:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCE810E3F9;
	Tue, 20 Aug 2024 16:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzB3NWdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00E10E3F9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724169660; x=1755705660;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J5eCfYdobz8gf84jAlN/xsjOooHWbbVWKeLY/n2Pc8w=;
 b=ZzB3NWdFjTaQ+RVC+LBXVSYxur94ZM+vPIqRq2RxHMbsGkh2tAc/Tgrw
 VObt0bkg0bqgIwJHA94NRqdGGtiXovsf9BiMo5LXSsbgjIm9i90M0eLgm
 Z2XsJGNuO4MXzZ2qzUNpvMfjl20frad2hvX3lMc71sQdMcrcHYTm2ZViz
 5W+oTl66+UARuO0+l2IYaMbsweqeAvq83jIf+R0ifFotBicg95XAuvPJd
 xwYQKcX2Qh9jOKcPWrH+jsaWkk93TtHXJd70VdVJapQRGqTMdtLOm2MBD
 JRL7AmXgr8NqI/WClo77ha3CrW+cmt0KSQu9n9EqtARuatFNsz8f/G7Uv g==;
X-CSE-ConnectionGUID: zN+QSNviTvCmBNE+HTwp+A==
X-CSE-MsgGUID: GQ/rJNq3RyeA9n+6DPEjDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33050047"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33050047"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:01:00 -0700
X-CSE-ConnectionGUID: 3oqu4+1lR2Ou/wBCLuZ7Kg==
X-CSE-MsgGUID: bleLifXZTPaCvaPqi9ckvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65122039"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.74])
 ([10.245.245.74])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:00:58 -0700
Message-ID: <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 20 Aug 2024 18:00:55 +0200
In-Reply-To: <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Tue, 2024-08-20 at 17:45 +0200, Christian K=C3=B6nig wrote:
> Am 20.08.24 um 12:37 schrieb Thomas Hellstr=C3=B6m:
> > Hi,
> >=20
> > On Mon, 2024-08-19 at 17:26 +0200, Christian K=C3=B6nig wrote:
> > > Am 19.08.24 um 16:14 schrieb Daniel Vetter:
> > > > On Mon, Aug 19, 2024 at 01:38:56PM +0200, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > Hi, Christian,
> > > > >=20
> > > > > On Mon, 2024-08-19 at 13:03 +0200, Christian K=C3=B6nig wrote:
> > > > > > Am 06.08.24 um 10:29 schrieb Thomas Hellstr=C3=B6m:
> > > > > > > Hi, Christian.
> > > > > > >=20
> > > > > > > On Thu, 2024-07-11 at 14:01 +0200, Christian K=C3=B6nig wrote=
:
> > > > > > > > Am 10.07.24 um 20:19 schrieb Matthew Brost:
> > > > > > > > > On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian
> > > > > > > > > K=C3=B6nig
> > > > > > > > > wrote:
> > > > > > > > > > That is something drivers really shouldn't mess
> > > > > > > > > > with.
> > > > > > > > > >=20
> > > > > > > > > Thomas uses this in Xe to implement a shrinker [1].
> > > > > > > > > Seems
> > > > > > > > > to
> > > > > > > > > need
> > > > > > > > > to
> > > > > > > > > remain available for drivers.
> > > > > > > > No, that is exactly what I try to prevent with that.
> > > > > > > >=20
> > > > > > > > This is an internally thing of TTM and drivers should
> > > > > > > > never
> > > > > > > > use
> > > > > > > > it
> > > > > > > > directly.
> > > > > > > That driver-facing LRU walker is a direct
> > > > > > > response/solution
> > > > > > > to this
> > > > > > > comment that you made in the first shrinker series:
> > > > > > >=20
> > > > > > > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4=
c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> > > > > > Ah, yeah that was about how we are should be avoiding
> > > > > > middle
> > > > > > layer
> > > > > > design.
> > > > > >=20
> > > > > > But a function which returns the next candidate for
> > > > > > eviction
> > > > > > and a
> > > > > > function which calls a callback for eviction is exactly the
> > > > > > opposite.
> > > > > >=20
> > > > > > > That is also mentioned in the cover letter of the recent
> > > > > > > shrinker
> > > > > > > series, and this walker has been around in that shrinker
> > > > > > > series for
> > > > > > > more than half a year now so if you think it's not the
> > > > > > > correct
> > > > > > > driver
> > > > > > > facing API IMHO that should be addressed by a review
> > > > > > > comment
> > > > > > > in
> > > > > > > that
> > > > > > > series rather than in posting a conflicting patch?
> > > > > > I actually outlined that in the review comments for the
> > > > > > patch
> > > > > > series.
> > > > > > E.g. a walker function with a callback is basically a
> > > > > > middle
> > > > > > layer.
> > > > > >=20
> > > > > > What outlined in the link above is that a function which
> > > > > > returns the
> > > > > > next eviction candidate is a better approach than a
> > > > > > callback.
> > > > > >=20
> > > > > > > So assuming that we still want the driver to register the
> > > > > > > shrinker,
> > > > > > > IMO that helper abstracts away all the nasty locking and
> > > > > > > pitfalls
> > > > > > > for a
> > > > > > > driver-registered shrinker, and is similar in structure
> > > > > > > to
> > > > > > > for
> > > > > > > example
> > > > > > > the pagewalk helper in mm/pagewalk.c.
> > > > > > >=20
> > > > > > > An alternative that could be tried as a driver-facing API
> > > > > > > is
> > > > > > > to
> > > > > > > provide
> > > > > > > a for_each_bo_in_lru_lock() macro where the driver open-
> > > > > > > codes
> > > > > > > "process_bo()" inside the for loop but I tried this and
> > > > > > > found
> > > > > > > it
> > > > > > > quite
> > > > > > > fragile since the driver might exit the loop without
> > > > > > > performing the
> > > > > > > necessary cleanup.
> > > > > > The point is that the shrinker should *never* need to have
> > > > > > context.
> > > > > > E.g.
> > > > > > a walker which allows going over multiple BOs for eviction
> > > > > > is
> > > > > > exactly
> > > > > > the wrong approach for that.
> > > > > >=20
> > > > > > The shrinker should evict always only exactly one BO and
> > > > > > the
> > > > > > next
> > > > > > invocation of a shrinker should not depend on the result of
> > > > > > the
> > > > > > previous
> > > > > > one.
> > > > > >=20
> > > > > > Or am I missing something vital here?
> > > > > A couple of things,
> > > > >=20
> > > > > 1) I'd like to think of the middle-layer vs helper like the
> > > > > helper has
> > > > > its own ops, and can be used optionally from the driver.
> > > > > IIRC,
> > > > > the
> > > > > atomic modesetting / pageflip ops are implemented in exactly
> > > > > this
> > > > > way.
> > > > >=20
> > > > > Sometimes a certain loop operation can't be easily or at
> > > > > least
> > > > > robustly
> > > > > implemented using a for_each_.. approach. Like for example
> > > > > mm/pagewalk.c. In this shrinking case I think it's probably
> > > > > possible
> > > > > using the scoped_guard() in cleanup.h. This way we could get
> > > > > rid
> > > > > of
> > > > > this middle layer discussion by turning the interface inside-
> > > > > out:
> > > > >=20
> > > > > for_each_bo_on_lru_locked(xxx)
> > > > > 	driver_shrink();
> > > > >=20
> > > > > But I do think the currently suggested approach is less
> > > > > fragile
> > > > > and
> > > > > prone to driver error.
> > > > >=20
> > > > > FWIW in addition to the above examples, also drm_gem_lru_scan
> > > > > works
> > > > > like this.
> > > > a iteration state structure (like drm_connector_iter) plus then
> > > > a
> > > > macro
> > > > for the common case that uses cleanup.h should get the job
> > > > done.
> > > Yeah, completely agree. It basically boils down to which one
> > > needs to
> > > pack a state bag.
> > >=20
> > > In a mid-layer design it's the driver or the caller of functions,
> > > e.g.
> > > the much hated init callback in the DRM layer was a perfect
> > > example
> > > of that.
> > >=20
> > > In a non mid-layer approach it's the framework or the called
> > > function,
> > > examples are how the fence iterators in the dma_resv or the
> > > drm_connector, plane etc.. work.
> > >=20
> > > One big difference between the two approach is who and where
> > > things
> > > like
> > > preparation and cleanup are done, e.g. who takes locks for
> > > example.
> > So what in your opinion is an acceptable solution here?
> > The "get next object to shrink" approach won't work, since it's
> > subject
> > to the old TTM swap problem now removed:
> > If shrinking fails we will get the same object upon subsequent
> > calls.
>=20
> But and that is expected behavior. If shrinking fails just going to
> the=20
> next object is invalid as far as I can see.
>=20
> That's why I was so puzzled why you tried to apply the walker to the
> TTM=20
> shrinker.
>=20
> Or why exactly should shrinking fail?

A common example would be not having runtime pm and the particular bo
needs it to unbind, we want to try the next bo. Example: i915 GGTT
bound bos and Lunar Lake PL_TT bos.

And again, all other drm bo shrinkers do this. We just want to do the
same.

>=20
> > If we bump LRU we could end up with infinite loops.
> > So IMO we need to be able to loop. I don't really care wether we do
> > this as an explicit loop or whether we use the LRU walker, but I
> > think
> > from a maintainability point-of-view it is better to keep LRU
> > walking
> > in a single place.
> >=20
> > If we return an unlocked object, we'd need to refcount and drop the
> > lru
> > lock, but maybe that's not a bad thing.
> >=20
> > But what's the main drawback of exporting the existing helper.
>=20
> Well that we re-creates exactly the mid-layer mess I worked so hard
> to=20
> remove from TTM.

It doesn't IMO. I agree the first attempt did. This affects only the
LRU iteration itself and I'm even fine to get rid of the callback using
a for_ macro.


>=20
> > > > > 2) The shrinkers suggest to shrink a number of pages, not a
> > > > > single bo,
> > > > > again drm_gem_lru_scan works like this. i915 works like this.
> > > > > I
> > > > > think
> > > > > we should align with those.
> > > > Yeah that's how shrinkers work, so if we demidlayer then it
> > > > realls
> > > > needs
> > > > to be a loop in the driver, not a "here's the next bo to nuke"
> > > > I
> > > > think.
> > > Hui? Well that's not how I understand shrinkers.
> > >=20
> > > The shrinker gives you the maximum number of objects to scan and
> > > not
> > > how
> > > many pages to free. In return you give the actual number of
> > > objects
> > > to
> > > scanned and pages freed.
> > >=20
> > > As far as I know the number of objects are in the sense of SLUBs
> > > or
> > > rather different LRU lists.
> > >=20
> > > So for BO shrinking we should probably only free or rather unpin
> > > a
> > > single BO per callback otherwise we mess up the fairness between
> > > shrinkers in the MM layer.
> > Hm. AFAICT all drm shrinkers use pages as objects, and the docs of
> > nr_to_scan says it's the number of objects to scan and try to
> > reclaim.
> > I think this strategy has had a fair amount of testing with the
> > i915
> > driver.
> > In any case, I don't think TTM should enforce a different way of
> > shrinking by the means of a severely restricted helper?
>=20
> Well, as far as I can see that is exactly what TTM should do.
>=20
> I mean the main advantage to make a common component is to enforce=20
> correct behavior.

But if all other drivers don't agree this as correct behavior and
instead want to keep behavior that is proven to work, that's a dead
end.

/Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20

