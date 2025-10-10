Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C72EBCD698
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F0210EC12;
	Fri, 10 Oct 2025 14:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y54n5UwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB72610EC12;
 Fri, 10 Oct 2025 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760105491; x=1791641491;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8rjZbzyrLCgl4VxTo9j4FhjPzSX6DqjULJPg+Z9QT4M=;
 b=Y54n5UwVZEbaYK9iqaE9H6fWu5AJFUAtbTyugLMTXRpC9NlfTIQ1C0lh
 zOQnO4sB5BN1WNKsmNs7cXlvN5usmJEJUsa81auo9Grwg+UGdqYQGr9JN
 6zY643ZJTCTzo9b7ow2W147zqRmyrVSyGK+MXIReIQ9ll3ZPReOu+1nf1
 C0pciRFgEKWkj+QWpWMV/YLWx/X9Hao3199PSla3m1Bmd+j9iQRh+jpXu
 8UR9vS23D1ihMDeKfH6Vt1XtppvOnVgQ041SvrUe7fYNbLynJuAU5bABg
 M1bL8gUHxcuhIyaynbP/0+c83jjSGlPhiNc5PYzvEsn3C/KL9JRopG8Up Q==;
X-CSE-ConnectionGUID: wvVaIrIsTPKweXQfYR8JGw==
X-CSE-MsgGUID: Jp0I/KfwTfKfGOMAUnGjKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="79967965"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="79967965"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:11:30 -0700
X-CSE-ConnectionGUID: mqu1WWsvTVGO/xeXIET6Jw==
X-CSE-MsgGUID: xeJvZAbcTrSt9r43lr6tMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="180672554"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.154])
 ([10.245.245.154])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 07:11:26 -0700
Message-ID: <d3c56f60ab638891d3d78200876ea11780f5ec21.camel@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Improving the worst case TTM large allocation
 latency
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Lyude Paul <lyude@redhat.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>, Thadeu Lima
 de Souza Cascardo <cascardo@igalia.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 10 Oct 2025 16:11:15 +0200
In-Reply-To: <a300e417-c9df-4e2b-a75f-319aab384b44@igalia.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
 <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
 <9bb3c06e-25c1-43d8-a4e8-e529c53ff77d@amd.com>
 <45973012f925dbbfdf0636c10f9d051c34f97e2e.camel@linux.intel.com>
 <a300e417-c9df-4e2b-a75f-319aab384b44@igalia.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Thu, 2025-10-09 at 09:53 +0100, Tvrtko Ursulin wrote:
>=20
> On 08/10/2025 15:39, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-10-08 at 16:02 +0200, Christian K=C3=B6nig wrote:
> > > On 08.10.25 15:50, Tvrtko Ursulin wrote:
> > > >=20
> > > > On 08/10/2025 13:35, Christian K=C3=B6nig wrote:
> > > > > On 08.10.25 13:53, Tvrtko Ursulin wrote:
> > > > > > Disclaimer:
> > > > > > Please note that as this series includes a patch which
> > > > > > touches
> > > > > > a good number of
> > > > > > drivers I will only copy everyone in the cover letter and
> > > > > > the
> > > > > > respective patch.
> > > > > > Assumption is people are subscribed to dri-devel so can
> > > > > > look at
> > > > > > the whole series
> > > > > > there. I know someone is bound to complain for both the
> > > > > > case
> > > > > > when everyone is
> > > > > > copied on everything for getting too much email, and also
> > > > > > for
> > > > > > this other case.
> > > > > > So please be flexible.
> > > > > >=20
> > > > > > Description:
> > > > > >=20
> > > > > > All drivers which use the TTM pool allocator end up
> > > > > > requesting
> > > > > > large order
> > > > > > allocations when allocating large buffers. Those can be
> > > > > > slow
> > > > > > due memory pressure
> > > > > > and so add latency to buffer creation. But there is often
> > > > > > also
> > > > > > a size limit
> > > > > > above which contiguous blocks do not bring any performance
> > > > > > benefits. This series
> > > > > > allows drivers to say when it is okay for the TTM to try a
> > > > > > bit
> > > > > > less hard.
> > > > > >=20
> > > > > > We do this by allowing drivers to specify this cut off
> > > > > > point
> > > > > > when creating the
> > > > > > TTM device and pools. Allocations above this size will skip
> > > > > > direct reclaim so
> > > > > > under memory pressure worst case latency will improve.
> > > > > > Background reclaim is
> > > > > > still kicked off and both before and after the memory
> > > > > > pressure
> > > > > > all the TTM pool
> > > > > > buckets remain to be used as they are today.
> > > > > >=20
> > > > > > This is especially interesting if someone has configured
> > > > > > MAX_PAGE_ORDER to
> > > > > > higher than the default. And even with the default, with
> > > > > > amdgpu
> > > > > > for example,
> > > > > > the last patch in the series makes use of the new feature
> > > > > > by
> > > > > > telling TTM that
> > > > > > above 2MiB we do not expect performance benefits. Which
> > > > > > makes
> > > > > > TTM not try direct
> > > > > > reclaim for the top bucket (4MiB).
> > > > > >=20
> > > > > > End result is TTM drivers become a tiny bit nicer mm
> > > > > > citizens
> > > > > > and users benefit
> > > > > > from better worst case buffer creation latencies. As a side
> > > > > > benefit we get rid
> > > > > > of two instances of those often very unreadable mutliple
> > > > > > nameless booleans
> > > > > > function signatures.
> > > > > >=20
> > > > > > If this sounds interesting and gets merge the invidual
> > > > > > drivers
> > > > > > can follow up
> > > > > > with patches configuring their thresholds.
> > > > > >=20
> > > > > > v2:
> > > > > > =C2=A0=C2=A0 * Christian suggested to pass in the new data by
> > > > > > changing the
> > > > > > function signatures.
> > > > > >=20
> > > > > > v3:
> > > > > > =C2=A0=C2=A0 * Moved ttm pool helpers into new ttm_pool_interna=
l.h.
> > > > > > (Christian)
> > > > >=20
> > > > > Patch #3 is Acked-by: Christian K=C3=B6nig
> > > > > <christian.koenig@amd.com>.
> > > > >=20
> > > > > The rest is Reviewed-by: Christian K=C3=B6nig
> > > > > <christian.koenig@amd.com>
> > > >=20
> > > > Thank you!
> > > >=20
> > > > So I think now I need acks to merge via drm-misc for all the
> > > > drivers which have their own trees. Which seems to be just xe.
> > >=20
> > > I think you should ping the XE guys for their opinion, but since
> > > there shouldn't be any functional change for them you can
> > > probably go
> > > ahead and merge the patches to drm-misc-next when there is no
> > > reply
> > > in time.
> >=20
> > I will try to do a review tonight. One thing that comes up though,
> > is
> > the change to ttm_device_init() where you add pool_flags. I had
> > another
> > patch series a number of months ago that added a struct with flags
> > there instead to select the return value given when OOM. Now that
> > we're
> > adding an argument, should we try to use a struct instead so that
> > we
> > can use it for more that pool behavior?
> >=20
> >=20
> > I'll be able to find a pointer to that series later today.
>=20
> Found it:=20
> https://lore.kernel.org/dri-devel/20241002122422.287276-1-thomas.hellstro=
m@linux.intel.com/
>=20
> Glad to see in that thread it isn't just me permanently slowed down
> by=20
> "false, false" and similar. :)
>=20
> I considered using a struct too and I guess there wasn't too much of
> a=20
> sway that I went with flags. I thought not to overcomplicate with the
> on=20
> stack struct which is mostly not needed for something so low level,
> and=20
> to stick with the old school C visual patterns.
>=20
> Since you only needed a single boolean in your series I suppose you=20
> could just follow up on my series if you find it acceptable. Or I can
> go=20
> with yours, no problem either.

It seems yours has the most momentum ATM. I can follow up on yours. It
would be great if we could perhaps change the naming of "pool_flags" to
something more generic.

Thanks,
Thomas


>=20
> Regards,
>=20
> Tvrtko
>=20

