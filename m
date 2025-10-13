Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15600BD2252
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE8C10E1E3;
	Mon, 13 Oct 2025 08:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRH6lrvS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9170C10E1E3;
 Mon, 13 Oct 2025 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760345346; x=1791881346;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=r+MPMRJY/aF4Q1mjygThXbzbTjg7DdkJ//V0KplO9/Q=;
 b=JRH6lrvSQ1+Le3IMieGzq4BbSmb0XaUaEUlZ+nkR8umOPcIBvB/HLGAJ
 Fo/IYSRwVrDV0RwLaZOyrSw0wGf5Y1ZEBaoPr3DU8IZBodKC2wkwhyaFo
 7plJzTON2iTX8tfwMYV0xWbEacBKhF1+lnrq9nm/ia3QsGCe/FHDHM9WA
 jVjjQlW17RoOPNyUV/Tu8FF+TEJwOkEoK3FTnX8ffnyKxpG/esa+fdYaJ
 9g2zxp2EYYTZE9hkTEG5EaWrz7iochMMqbLw0MUq7/CwjUrN1fFOFSiYD
 zzQ9sHMtzKQcXS4x+4Tw+zzL2Cwjgr5ntKcIUQroGS2v+RjH1E4DgWlnJ Q==;
X-CSE-ConnectionGUID: VRN69HqUSZi7K31FSUhoGQ==
X-CSE-MsgGUID: cIAkXw5NR/eUi4PLWthGdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="72735970"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="72735970"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:49:05 -0700
X-CSE-ConnectionGUID: vnbBbYx1ReWI+f+nqUrw7w==
X-CSE-MsgGUID: 1ll9Y6HsSzKnNUeY+EIFYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="186838467"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.64])
 ([10.245.244.64])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:49:01 -0700
Message-ID: <a0ff3751a71eab1f8f1c105e84b88b12cd43d65f.camel@linux.intel.com>
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
Date: Mon, 13 Oct 2025 10:48:57 +0200
In-Reply-To: <69279852-e1ed-4caf-a92b-a352ba4b613b@igalia.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
 <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
 <9bb3c06e-25c1-43d8-a4e8-e529c53ff77d@amd.com>
 <45973012f925dbbfdf0636c10f9d051c34f97e2e.camel@linux.intel.com>
 <a300e417-c9df-4e2b-a75f-319aab384b44@igalia.com>
 <d3c56f60ab638891d3d78200876ea11780f5ec21.camel@linux.intel.com>
 <69279852-e1ed-4caf-a92b-a352ba4b613b@igalia.com>
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

Hi, Tvrtko,

On Sat, 2025-10-11 at 09:00 +0100, Tvrtko Ursulin wrote:
>=20
> On 10/10/2025 15:11, Thomas Hellstr=C3=B6m wrote:
> > On Thu, 2025-10-09 at 09:53 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 08/10/2025 15:39, Thomas Hellstr=C3=B6m wrote:
> > > > On Wed, 2025-10-08 at 16:02 +0200, Christian K=C3=B6nig wrote:
> > > > > On 08.10.25 15:50, Tvrtko Ursulin wrote:
> > > > > >=20
> > > > > > On 08/10/2025 13:35, Christian K=C3=B6nig wrote:
> > > > > > > On 08.10.25 13:53, Tvrtko Ursulin wrote:
> > > > > > > > Disclaimer:
> > > > > > > > Please note that as this series includes a patch which
> > > > > > > > touches
> > > > > > > > a good number of
> > > > > > > > drivers I will only copy everyone in the cover letter
> > > > > > > > and
> > > > > > > > the
> > > > > > > > respective patch.
> > > > > > > > Assumption is people are subscribed to dri-devel so can
> > > > > > > > look at
> > > > > > > > the whole series
> > > > > > > > there. I know someone is bound to complain for both the
> > > > > > > > case
> > > > > > > > when everyone is
> > > > > > > > copied on everything for getting too much email, and
> > > > > > > > also
> > > > > > > > for
> > > > > > > > this other case.
> > > > > > > > So please be flexible.
> > > > > > > >=20
> > > > > > > > Description:
> > > > > > > >=20
> > > > > > > > All drivers which use the TTM pool allocator end up
> > > > > > > > requesting
> > > > > > > > large order
> > > > > > > > allocations when allocating large buffers. Those can be
> > > > > > > > slow
> > > > > > > > due memory pressure
> > > > > > > > and so add latency to buffer creation. But there is
> > > > > > > > often
> > > > > > > > also
> > > > > > > > a size limit
> > > > > > > > above which contiguous blocks do not bring any
> > > > > > > > performance
> > > > > > > > benefits. This series
> > > > > > > > allows drivers to say when it is okay for the TTM to
> > > > > > > > try a
> > > > > > > > bit
> > > > > > > > less hard.
> > > > > > > >=20
> > > > > > > > We do this by allowing drivers to specify this cut off
> > > > > > > > point
> > > > > > > > when creating the
> > > > > > > > TTM device and pools. Allocations above this size will
> > > > > > > > skip
> > > > > > > > direct reclaim so
> > > > > > > > under memory pressure worst case latency will improve.
> > > > > > > > Background reclaim is
> > > > > > > > still kicked off and both before and after the memory
> > > > > > > > pressure
> > > > > > > > all the TTM pool
> > > > > > > > buckets remain to be used as they are today.
> > > > > > > >=20
> > > > > > > > This is especially interesting if someone has
> > > > > > > > configured
> > > > > > > > MAX_PAGE_ORDER to
> > > > > > > > higher than the default. And even with the default,
> > > > > > > > with
> > > > > > > > amdgpu
> > > > > > > > for example,
> > > > > > > > the last patch in the series makes use of the new
> > > > > > > > feature
> > > > > > > > by
> > > > > > > > telling TTM that
> > > > > > > > above 2MiB we do not expect performance benefits. Which
> > > > > > > > makes
> > > > > > > > TTM not try direct
> > > > > > > > reclaim for the top bucket (4MiB).
> > > > > > > >=20
> > > > > > > > End result is TTM drivers become a tiny bit nicer mm
> > > > > > > > citizens
> > > > > > > > and users benefit
> > > > > > > > from better worst case buffer creation latencies. As a
> > > > > > > > side
> > > > > > > > benefit we get rid
> > > > > > > > of two instances of those often very unreadable
> > > > > > > > mutliple
> > > > > > > > nameless booleans
> > > > > > > > function signatures.
> > > > > > > >=20
> > > > > > > > If this sounds interesting and gets merge the invidual
> > > > > > > > drivers
> > > > > > > > can follow up
> > > > > > > > with patches configuring their thresholds.
> > > > > > > >=20
> > > > > > > > v2:
> > > > > > > > =C2=A0=C2=A0=C2=A0 * Christian suggested to pass in the new=
 data by
> > > > > > > > changing the
> > > > > > > > function signatures.
> > > > > > > >=20
> > > > > > > > v3:
> > > > > > > > =C2=A0=C2=A0=C2=A0 * Moved ttm pool helpers into new
> > > > > > > > ttm_pool_internal.h.
> > > > > > > > (Christian)
> > > > > > >=20
> > > > > > > Patch #3 is Acked-by: Christian K=C3=B6nig
> > > > > > > <christian.koenig@amd.com>.
> > > > > > >=20
> > > > > > > The rest is Reviewed-by: Christian K=C3=B6nig
> > > > > > > <christian.koenig@amd.com>
> > > > > >=20
> > > > > > Thank you!
> > > > > >=20
> > > > > > So I think now I need acks to merge via drm-misc for all
> > > > > > the
> > > > > > drivers which have their own trees. Which seems to be just
> > > > > > xe.
> > > > >=20
> > > > > I think you should ping the XE guys for their opinion, but
> > > > > since
> > > > > there shouldn't be any functional change for them you can
> > > > > probably go
> > > > > ahead and merge the patches to drm-misc-next when there is no
> > > > > reply
> > > > > in time.
> > > >=20
> > > > I will try to do a review tonight. One thing that comes up
> > > > though,
> > > > is
> > > > the change to ttm_device_init() where you add pool_flags. I had
> > > > another
> > > > patch series a number of months ago that added a struct with
> > > > flags
> > > > there instead to select the return value given when OOM. Now
> > > > that
> > > > we're
> > > > adding an argument, should we try to use a struct instead so
> > > > that
> > > > we
> > > > can use it for more that pool behavior?
> > > >=20
> > > >=20
> > > > I'll be able to find a pointer to that series later today.
> > >=20
> > > Found it:
> > > https://lore.kernel.org/dri-devel/20241002122422.287276-1-thomas.hell=
strom@linux.intel.com/
> > >=20
> > > Glad to see in that thread it isn't just me permanently slowed
> > > down
> > > by
> > > "false, false" and similar. :)
> > >=20
> > > I considered using a struct too and I guess there wasn't too much
> > > of
> > > a
> > > sway that I went with flags. I thought not to overcomplicate with
> > > the
> > > on
> > > stack struct which is mostly not needed for something so low
> > > level,
> > > and
> > > to stick with the old school C visual patterns.
> > >=20
> > > Since you only needed a single boolean in your series I suppose
> > > you
> > > could just follow up on my series if you find it acceptable. Or I
> > > can
> > > go
> > > with yours, no problem either.
> >=20
> > It seems yours has the most momentum ATM. I can follow up on yours.
> > It
> > would be great if we could perhaps change the naming of
> > "pool_flags" to
> > something more generic.
>=20
> Do you have a name in mind? For ttm_device_init pool_flags made sense
> to=20
> signify they relate only to the poll.

Well, what I had in mind would have been "flags" or
"device_init_flags".

Really one could change this once flags starts to have other meanings
as well, like the return value change I was proposing.
But the reason I was suggesting to do this now is to avoid yet another
added parameter to ttm_device_init, since obtaining an ack from all TTM
driver maintainers is typically time-consuming if at all possible.

When adding functionality to allocation functions, for example the use
of the ttm_allocation_ctx has proven easier to use since it's easily
extendible typically without changes to drivers.

Thanks,
Thomas



>=20
> I need to respin anyway since I forgot to include the new header from
> unit tests.
>=20
> Regards,
>=20
> Tvrtko
>=20

