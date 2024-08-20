Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6DA958812
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 15:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FBE10E7DA;
	Tue, 20 Aug 2024 13:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPi4Nx5Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652AD10E7D9;
 Tue, 20 Aug 2024 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724161158; x=1755697158;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TGp+Nr511qgPw1yZE5cNNOP39+SXmD9F9jl0OZBLGI4=;
 b=IPi4Nx5Q7Oz/upWWBeqajzoEjTa44DLp4l7+upWusfoSoJkaiTy1aoD/
 x1WmIXR+SAygre0pq4fOvhufTutppdCFkJNjcFWEpK7pxO28fnlOvNC2G
 REDjdvlOiKr2g0PNrnTpqdV5+3WwQ2UlJveNjgu78XnIST6aO97Lmb44c
 Ar6OeXKKD1bTLg8nhiq1NmMpCNc9xm3C8oKvGp4o0yU5VRxyVoRJ9SynS
 dp+pnlgeEZMU46w6BzxYO6LzMr76R9lii/7LXrdMcfwV4YqfjrYez3QXs
 bGLk1ZAhz6bnCw2HXv2O61rNNmJtHjqdpxG4NX/ZKEi4jKzI4lH7+/ky3 w==;
X-CSE-ConnectionGUID: h9+hi6zjSDyZfJE0hPwhUA==
X-CSE-MsgGUID: hKZ8jSvlRpO1/3ICRYRUQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26211508"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26211508"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:36:50 -0700
X-CSE-ConnectionGUID: sHnFBffLSfm05yhUI/+FxA==
X-CSE-MsgGUID: UPU1VaAgQeK3CDPUDE36qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60420809"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.74])
 ([10.245.245.74])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:36:47 -0700
Message-ID: <77b3e3994036e4fb6874aff6a1ce39543e7eefea.camel@linux.intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe/lnl: Offload system clear page activity
 to GPU
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>,  dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>
Date: Tue, 20 Aug 2024 15:36:45 +0200
In-Reply-To: <b393e5ab-d69c-4bde-9ba2-3801ad8d5b48@linux.intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <20240816135154.19678-2-nirmoy.das@intel.com>
 <5e986e65-6c6a-4243-9804-b9331a6fd9ae@intel.com>
 <b393e5ab-d69c-4bde-9ba2-3801ad8d5b48@linux.intel.com>
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

Hi, Nirmoy,

On Mon, 2024-08-19 at 18:01 +0200, Nirmoy Das wrote:
>=20
> On 8/19/2024 1:05 PM, Matthew Auld wrote:
> > On 16/08/2024 14:51, Nirmoy Das wrote:
> > > On LNL because of flat CCS, driver creates migrates job to clear
> > > CCS meta data. Extend that to also clear system pages using GPU.
> > > Inform TTM to allocate pages without __GFP_ZERO to avoid double
> > > page
> > > clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
> > > TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
> > > clear
> > > on free as XE now takes care of clearing pages. If a bo is in
> > > system
> > > placement such as BO created with
> > > DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
> > > and there is a cpu map then for such BO gpu clear will be avoided
> > > as
> > > there is no dma mapping for such BO at that moment to create
> > > migration
> > > jobs.
> > >=20
> > > Tested this patch api_overhead_benchmark_l0 from
> > > https://github.com/intel/compute-benchmarks
> > >=20
> > > Without the patch:
> > > api_overhead_benchmark_l0 --testFilter=3DUsmMemoryAllocation:
> > > UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D4KB) 84.206 us
> > > UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D1GB) 105775.56 us
> > > erf tool top 5 entries:
> > > 71.44% api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k] clear_=
page_erms
> > > 6.34%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > __pageblock_pfn_to_page
> > > 2.24%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k] c=
pa_flush
> > > 2.15%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > pages_are_mergeable
> > > 1.94%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > find_next_iomem_res
> > >=20
> > > With the patch:
> > > api_overhead_benchmark_l0 --testFilter=3DUsmMemoryAllocation:
> > > UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D4KB) 79.439 us
> > > UsmMemoryAllocation(api=3Dl0 type=3DHost size=3D1GB) 98677.75 us
> > > Perf tool top 5 entries:
> > > 11.16% api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > __pageblock_pfn_to_page
> > > 7.85%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k] c=
pa_flush
> > > 7.59%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > find_next_iomem_res
> > > 7.24%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]
> > > pages_are_mergeable
> > > 5.53%=C2=A0 api_overhead_be=C2=A0 [kernel.kallsyms]=C2=A0=C2=A0 [k]=
=20
> > > lookup_address_in_pgd_attr
> > >=20
> > > Without this patch clear_page_erms() dominates execution time
> > > which is
> > > also not pipelined with migration jobs. With this patch page
> > > clearing
> > > will get pipelined with migration job and will free CPU for more
> > > work.
> > >=20
> > > v2: Handle regression on dgfx(Himal)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Update commit message as no ttm API changes =
needed.
> > > v3: Fix Kunit test.
> > > v4: handle data leak on cpu mmap(Thomas)
> > > v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
> > > =C2=A0=C2=A0=C2=A0=C2=A0 it to xe_ttm_sys_mgr_init() and other nits (=
Matt Auld)
> > > v6: Disable it when init_on_alloc and/or init_on_free is
> > > active(Matt)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Use compute-benchmarks as reporter used it t=
o report this
> > > =C2=A0=C2=A0=C2=A0=C2=A0 allocation latency issue also a proper test =
application than
> > > mime.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 In v5, the test showed significant reduction=
 in alloc
> > > latency but
> > > =C2=A0=C2=A0=C2=A0=C2=A0 that is not the case any more, I think this =
was mostly
> > > because
> > > =C2=A0=C2=A0=C2=A0=C2=A0 previous test was done on IFWI which had low=
 mem BW from
> > > CPU.
> > >=20
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> >=20
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>=20
>=20
> Thanks Matt.
>=20
> Pushed this to drm-xe-next. The series contains a ttm pool change
> which=20
> as agreed with Christian
>=20
> is small enough to not cause any issue so can be pulled though drm-
> xe-next.

I have a question that was sent as a reply-to on that patch.

Thanks,
Thomas

>=20
>=20
> Regards,
>=20
> Nirmoy
>=20

