Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D888591DAAE
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E52B10E164;
	Mon,  1 Jul 2024 08:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjD1Y8Fr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEB910E154;
 Mon,  1 Jul 2024 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719824209; x=1751360209;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2BjaeP94w46H7n1r91rRWwoo5EsLAWvmvbXZeXccQmY=;
 b=DjD1Y8FrgVwRg67m7GzTDJBiMOnzJ1ArB973cJPhg+V1LslIEcAVc8/G
 NDotUcAlttI5qe0QCDvXQakiyOLSLKqJVPgH2TXY10ljh39Ztz2zr8lNu
 zRzII8hGmbgxbN4kZZ0kL/T980XI54tJXZQfL0kUp8h4KLz/oH2Xw2fNs
 4YAozJ2SjjdGRvIa9jaFptHrOImnOlxoq4G9WWSWYZnLMJLIH/MlyC8Ty
 RY14An+L6S+zkXjxVohNYhVdq0slsgnT+wRZfLxr+u8oLaajcPXy8nqc8
 roDeD0LkF6zqR77u2g0pT5hsaJX+5hOvmf+bBq9Rh0yoVs/anYrcQ7fZH g==;
X-CSE-ConnectionGUID: 2W/7UP0XTWKZv1hrQCPN9Q==
X-CSE-MsgGUID: rmtKI4cnScmE6lhPP7A8wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="27615959"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="27615959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:56:49 -0700
X-CSE-ConnectionGUID: GXt4AAnkRE+jbLwAYf14Jw==
X-CSE-MsgGUID: oiwCi+6pTtSSJPxeEC3Ngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="45278246"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.49])
 ([10.245.244.49])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:56:47 -0700
Message-ID: <91cc5e6edbfc09497d9313872af914494f9cb394.camel@linux.intel.com>
Subject: Re: [Linaro-mm-sig] Re: dma_buf_detach lockdep splat
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 01 Jul 2024 10:56:34 +0200
In-Reply-To: <Zn77penjAruTgLMM@phenom.ffwll.local>
References: <40611e5ff8c32b99e7863293a0baac078f323d8f.camel@linux.intel.com>
 <Zn0c8l-yQih3j0NE@phenom.ffwll.local>
 <6bc17415f36c2a9c689010e1cf397fc75a8df55e.camel@linux.intel.com>
 <Zn77penjAruTgLMM@phenom.ffwll.local>
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

On Fri, 2024-06-28 at 20:06 +0200, Daniel Vetter wrote:
> On Thu, Jun 27, 2024 at 02:18:44PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2024-06-27 at 10:04 +0200, Daniel Vetter wrote:
> > > On Wed, Jun 26, 2024 at 05:58:02PM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > Hi!
> > > >=20
> > > > I'm seeing the below lockdep splat 1) with the xe driver in an
> > > > imported
> > > > dma-buf object destruction path.
> > > >=20
> > > > It's not because we hold the dma_resv lock at that point, but
> > > > rather
> > > > because we hold *another* dma_resv lock at that point, and the
> > > > dma_resv
> > > > detach happens when the object is idle, in this case it was
> > > > idle at
> > > > the
> > > > final put(), and dma_buf_detach() is called in the putting
> > > > process.
> > > >=20
> > > > Holding another dma-buf lock might happen as part of
> > > > drm_exec_unlock_all, or simply if the wider vm dma_resv was
> > > > held at
> > > > object put time, so it's not an uncommon pattern, even if the
> > > > drm_exec
> > > > instance can be fixed by putting all bos after unlocking them
> > > > all.
> > > >=20
> > > > Two solutions coming to mind here:
> > > >=20
> > > > 1) Provide a dma_buf_detach_locked()
> > >=20
> > > This smells way too much like the endless headaches we had with
> > > drm_gem_object_put_locked and friends against
> > > drm_device.struct_mutex. Or
> > > I'm not understanding what you're doing, because I'm pretty sure
> > > you
> > > have
> > > to take the dma_resv lock on final put() of imported objects.
> > > Because
> > > that
> > > final put() is of the import wrapper, the exporter (and other
> > > importers)
> > > can still get at that object and so dma_resv_lock is very much
> > > needed.
> >=20
> > Yeah, the TTM final put looks like
> >=20
> > if (!dma_resv_trylock() || !idle)
> > 	queue_work(final_distruction);
> >=20
> > dma_resv_unlock();
> > dma_buf_detach(); <--- lockdep splat
> >=20
> > Here's where a dma_buf_detach_locked() would've made sense before
> > the
> > dma_resv_unlock().
> >=20
> > But if you think this will cause grief, I'm completely fine with
> > fixing this in TTM by always taking the deferring path.
>=20
> Oh I misunderstood what you've meant, I thought you want to do a huge
> exercise in passing the "do we know we're locked" flag all the way
> through
> entire callchains to exporters.
>=20
> If it's just so that the fastpath of bypassing the worker can
> function for
> imported buffers, then I think that's fine. As long as we just punt
> to the
> worker if we can't get the lock.

OK, TBH, the driver would need a drm_prime_gem_destroy_locked() as well
since that's the function that calls dma_buf_detach. But TBH I think
it's worth it anyway since if we just modify TTM to always take the
delayed destruction path, I figure much code will come to depend on it
and it will be invasive to update.

I'll take a quick stab a that to see how ugly it becomes.

/Thomas


> -Sima

