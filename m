Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C94A4598B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 10:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B53810E8A0;
	Wed, 26 Feb 2025 09:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPNzbJsf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19210E88B;
 Wed, 26 Feb 2025 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740561021; x=1772097021;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W8h8PWXhwCWJu26Ia63fPNErxtJIVWtVl3xaH9vpsHI=;
 b=kPNzbJsfMTCGoZLjJX6I05KVd8TZKg1NnyBirxToCDtHW1UsSqktKx8A
 qlAve9udIs8cyPwYUd6dmdmMumDZ6IsPeE9iqH6i5pQxAP6mUETkFsgz/
 rDnv30yUYzAZGBYsV1Ca0+xKM8gzUJx7HePsIi5K4MTJlNjg/uvH2sxQr
 KGb+Ai7wRtCt9dxgF/WFIMnx0iLz95y6mQg3zcu3aGPd53EFP2mLdoN1z
 N8SutsoEA4nUYJ45cj4wpXq48yN7BPsypGXLfz6DPooDYcKtv2CpHXwY/
 Vc0h5VVDIMRv4GAqO7oIvgJ2EiLN0RPsEL38+H3zgB4UqMPseh2eZXbZ0 w==;
X-CSE-ConnectionGUID: /1t4efHlTRi/+Sf2y727fw==
X-CSE-MsgGUID: iDpWqlyXQ3W6MEjaTdYiXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58932659"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="58932659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:10:20 -0800
X-CSE-ConnectionGUID: +CgdF6e1T5GGP3e1aSGpPg==
X-CSE-MsgGUID: yg0I5XV+RUCpJNRKnfkGig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120760360"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.81])
 ([10.245.246.81])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:10:14 -0800
Message-ID: <fd5af29d5d7be6b6c7bc8a69545fb2ff090350f0.camel@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/xe/guc: use SZ_4K for alignment
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Cc: jeffbai@aosc.io, Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo
 Vivi	 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Alan Previn	 <alan.previn.teres.alexis@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,  Matt Roper
 <matthew.d.roper@intel.com>, Mateusz Naklicki <mateusz.naklicki@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, Zbigniew
 =?UTF-8?Q?Kempczy=C5=84ski?=	 <zbigniew.kempczynski@intel.com>,
 intel-xe@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kexy Biscuit	 <kexybiscuit@aosc.io>, Shang
 Yatsen <429839446@qq.com>, stable@vger.kernel.org,  Haien Liang
 <27873200@qq.com>, Shirong Liu <lsr1024@qq.com>, Haofeng Wu
 <s2600cw2@126.com>
Date: Wed, 26 Feb 2025 10:09:57 +0100
In-Reply-To: <Z77Y26ZhWpBL9agT@fdugast-desk>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
 <Z76gAbZjF3b0jLb7@lstrano-desk.jf.intel.com>
 <Z77Y26ZhWpBL9agT@fdugast-desk>
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

On Wed, 2025-02-26 at 10:03 +0100, Francois Dugast wrote:
> Hi,
>=20
> On Tue, Feb 25, 2025 at 09:00:49PM -0800, Matthew Brost wrote:
> > On Wed, Feb 26, 2025 at 10:00:19AM +0800, Mingcong Bai via B4 Relay
> > wrote:
> > > From: Mingcong Bai <jeffbai@aosc.io>
> > >=20
> > > Per the "Firmware" chapter in "drm/xe Intel GFX Driver", as well
> > > as
> > > "Volume 8: Command Stream Programming" in "Intel=C2=AE Arc=E2=84=A2 A=
-Series
> > > Graphics
> > > and Intel Data Center GPU Flex Series Open-Source Programmer's
> > > Reference
> > > Manual For the discrete GPUs code named "Alchemist" and "Arctic
> > > Sound-M""
> > > and "Intel=C2=AE Iris=C2=AE Xe MAX Graphics Open Source Programmer's
> > > Reference
> > > Manual For the 2020 Discrete GPU formerly named "DG1"":
> > >=20
> > > =C2=A0 "The RINGBUF register sets (defined in Memory Interface
> > > Registers) are
> > > =C2=A0 used to specify the ring buffer memory areas. The ring buffer
> > > must start
> > > =C2=A0 on a 4KB boundary and be allocated in linear memory. The lengt=
h
> > > of any
> > > =C2=A0 one ring buffer is limited to 2MB."
> > >=20
> > > The Graphics micro (=CE=BC) Controller (GuC) really expects command
> > > buffers
> > > aligned to 4K boundaries.
> > >=20
> > > Current code uses `PAGE_SIZE' as an assumed alignment reference
> > > but 4K
> > > kernel page sizes is by no means a guarantee. On 16K-paged
> > > kernels, this
> > > causes driver failures after loading the GuC firmware:
> > >=20
> > > [=C2=A0=C2=A0=C2=A0 7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (d=
evice ID
> > > 56a1) display version 13.00 stepping C0
> > > [=C2=A0=C2=A0=C2=A0 7.410429] xe 0000:09:00.0: [drm] Using GuC firmwa=
re from
> > > i915/dg2_guc_70.bin version 70.36.0
> > > [=C2=A0=C2=A0 10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load fai=
led:
> > > status =3D 0x800001EC, time =3D 3297ms, freq =3D 2400MHz (req 2400MHz=
),
> > > done =3D 0
> > > [=C2=A0=C2=A0 10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load fai=
led:
> > > status: Reset =3D 0, BootROM =3D 0x76, UKernel =3D 0x01, MIA =3D 0x00=
,
> > > Auth =3D 0x02
> > > [=C2=A0=C2=A0 10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe =
has
> > > declared device 0000:09:00.0 as wedged.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Please file a _new_ bug report at
> > > https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
> > > [=C2=A0=C2=A0 10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio
> > > request 0x4100: no reply 0x4100
> > >=20
> > > Correct this by revising all instances of `PAGE_SIZE' to `SZ_4K'
> > > and
> > > revise `PAGE_ALIGN()' calls to `ALIGN()' with `SZ_4K' as the
> > > second
> > > argument (overriding `PAGE_SIZE').
> > >=20
> > > Cc: stable@vger.kernel.org
> > > Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC
> > > log buffer")
> > > Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and
> > > update ADS size for error capture")
> > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for
> > > Intel GPUs")
> > > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > > Tested-by: Haien Liang <27873200@qq.com>
> > > Tested-by: Shirong Liu <lsr1024@qq.com>
> > > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > > Link:
> > > https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410=
a077b3ddb6dca3f28223360
> > > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > > Co-developed-by: Kexy Biscuit <kexybiscuit@aosc.io>
> > > Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
> > > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> >=20
> > Typo in last reply:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> Nit: in order to improve clarity and to limit potential mistakes in
> the future, you could add:
>=20
> =C2=A0=C2=A0=C2=A0 /* GuC really expects command buffers aligned to 4K bo=
undaries.
> */
> =C2=A0=C2=A0=C2=A0 #define GUC_ALIGN SZ_4K
>=20
> Then use s/SZ_4K/GUC_ALIGN/ in your changes. It would make clear this
> value does not come from PAGE_SIZE or XE_PAGE_SIZE.

I was thinking the same.

But on another topic, From a quick read of the commit message it's not
clear why a 16K alignment would fail, since a 16K aligned bo would also
be 4K aligned?

/Thomas


>=20
> Francois
>=20
> >=20
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_guc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++--
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_ads.c=C2=A0=C2=A0=C2=A0=C2=A0 | 32 ++=
++++++++++++++-------
> > > ---------
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_capture.c |=C2=A0 8 ++++----
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_ct.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_log.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 4 ++--
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_pc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++--
> > > =C2=A06 files changed, 27 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c
> > > b/drivers/gpu/drm/xe/xe_guc.c
> > > index
> > > 408365dfe4eed02336bbd208b60491aea27a8a6e..595873780a5774501f04b2f
> > > 01ebdf8a45c7ac931 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -88,7 +88,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc
> > > *guc)
> > > =C2=A0
> > > =C2=A0static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
> > > =C2=A0{
> > > -	u32 offset =3D guc_bo_ggtt_addr(guc, guc->log.bo) >>
> > > PAGE_SHIFT;
> > > +	u32 offset =3D guc_bo_ggtt_addr(guc, guc->log.bo) >>
> > > XE_PTE_SHIFT;
> > > =C2=A0	u32 flags;
> > > =C2=A0
> > > =C2=A0	#if (((CRASH_BUFFER_SIZE) % SZ_1M) =3D=3D 0)
> > > @@ -141,7 +141,7 @@ static u32 guc_ctl_log_params_flags(struct
> > > xe_guc *guc)
> > > =C2=A0
> > > =C2=A0static u32 guc_ctl_ads_flags(struct xe_guc *guc)
> > > =C2=A0{
> > > -	u32 ads =3D guc_bo_ggtt_addr(guc, guc->ads.bo) >>
> > > PAGE_SHIFT;
> > > +	u32 ads =3D guc_bo_ggtt_addr(guc, guc->ads.bo) >>
> > > XE_PTE_SHIFT;
> > > =C2=A0	u32 flags =3D ads << GUC_ADS_ADDR_SHIFT;
> > > =C2=A0
> > > =C2=A0	return flags;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index
> > > fab259adc380be28c79fae5946e123427359ec60..65e88ad43e8adef75288930
> > > 0abd0197a0ac4a1a3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct
> > > xe_guc_ads *ads)
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
> > > =C2=A0{
> > > -	return PAGE_ALIGN(ads->golden_lrc_size);
> > > +	return ALIGN(ads->golden_lrc_size, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
> > > =C2=A0{
> > > -	return PAGE_ALIGN(ads->ads_waklv_size);
> > > +	return ALIGN(ads->ads_waklv_size, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
> > > =C2=A0{
> > > -	return PAGE_ALIGN(ads->capture_size);
> > > +	return ALIGN(ads->capture_size, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> > > @@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct
> > > xe_guc_ads *ads)
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
> > > =C2=A0{
> > > -	return PAGE_ALIGN(ads_to_guc(ads)-
> > > >fw.private_data_size);
> > > +	return ALIGN(ads_to_guc(ads)->fw.private_data_size,
> > > SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
> > > @@ -183,7 +183,7 @@ static size_t
> > > guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
> > > =C2=A0	offset =3D guc_ads_regset_offset(ads) +
> > > =C2=A0		guc_ads_regset_size(ads);
> > > =C2=A0
> > > -	return PAGE_ALIGN(offset);
> > > +	return ALIGN(offset, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
> > > @@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct
> > > xe_guc_ads *ads)
> > > =C2=A0	offset =3D guc_ads_golden_lrc_offset(ads) +
> > > =C2=A0		 guc_ads_golden_lrc_size(ads);
> > > =C2=A0
> > > -	return PAGE_ALIGN(offset);
> > > +	return ALIGN(offset, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
> > > @@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct
> > > xe_guc_ads *ads)
> > > =C2=A0	offset =3D guc_ads_waklv_offset(ads) +
> > > =C2=A0		 guc_ads_waklv_size(ads);
> > > =C2=A0
> > > -	return PAGE_ALIGN(offset);
> > > +	return ALIGN(offset, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> > > @@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct
> > > xe_guc_ads *ads)
> > > =C2=A0	offset =3D guc_ads_capture_offset(ads) +
> > > =C2=A0		 guc_ads_capture_size(ads);
> > > =C2=A0
> > > -	return PAGE_ALIGN(offset);
> > > +	return ALIGN(offset, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_private_data_offset(struct xe_guc_ads
> > > *ads)
> > > @@ -223,7 +223,7 @@ static size_t
> > > guc_ads_private_data_offset(struct xe_guc_ads *ads)
> > > =C2=A0	offset =3D guc_ads_um_queues_offset(ads) +
> > > =C2=A0		guc_ads_um_queues_size(ads);
> > > =C2=A0
> > > -	return PAGE_ALIGN(offset);
> > > +	return ALIGN(offset, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static size_t guc_ads_size(struct xe_guc_ads *ads)
> > > @@ -276,7 +276,7 @@ static size_t
> > > calculate_golden_lrc_size(struct xe_guc_ads *ads)
> > > =C2=A0			continue;
> > > =C2=A0
> > > =C2=A0		real_size =3D xe_gt_lrc_size(gt, class);
> > > -		alloc_size =3D PAGE_ALIGN(real_size);
> > > +		alloc_size =3D ALIGN(real_size, SZ_4K);
> > > =C2=A0		total_size +=3D alloc_size;
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -612,12 +612,12 @@ static int guc_capture_prep_lists(struct
> > > xe_guc_ads *ads)
> > > =C2=A0					 offsetof(struct
> > > __guc_ads_blob, system_info));
> > > =C2=A0
> > > =C2=A0	/* first, set aside the first page for a capture_list
> > > with zero descriptors */
> > > -	total_size =3D PAGE_SIZE;
> > > +	total_size =3D SZ_4K;
> > > =C2=A0	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
> > > =C2=A0		xe_map_memcpy_to(ads_to_xe(ads),
> > > ads_to_map(ads), capture_offset, ptr, size);
> > > =C2=A0
> > > =C2=A0	null_ggtt =3D ads_ggtt + capture_offset;
> > > -	capture_offset +=3D PAGE_SIZE;
> > > +	capture_offset +=3D SZ_4K;
> > > =C2=A0
> > > =C2=A0	/*
> > > =C2=A0	 * Populate capture list : at this point adps is already
> > > allocated and
> > > @@ -681,10 +681,10 @@ static int guc_capture_prep_lists(struct
> > > xe_guc_ads *ads)
> > > =C2=A0		}
> > > =C2=A0	}
> > > =C2=A0
> > > -	if (ads->capture_size !=3D PAGE_ALIGN(total_size))
> > > +	if (ads->capture_size !=3D ALIGN(total_size, SZ_4K))
> > > =C2=A0		xe_gt_dbg(gt, "ADS capture alloc size changed
> > > from %d to %d\n",
> > > -			=C2=A0 ads->capture_size,
> > > PAGE_ALIGN(total_size));
> > > -	return PAGE_ALIGN(total_size);
> > > +			=C2=A0 ads->capture_size, ALIGN(total_size,
> > > SZ_4K));
> > > +	return ALIGN(total_size, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
> > > @@ -928,7 +928,7 @@ static void guc_populate_golden_lrc(struct
> > > xe_guc_ads *ads)
> > > =C2=A0		xe_gt_assert(gt, gt->default_lrc[class]);
> > > =C2=A0
> > > =C2=A0		real_size =3D xe_gt_lrc_size(gt, class);
> > > -		alloc_size =3D PAGE_ALIGN(real_size);
> > > +		alloc_size =3D ALIGN(real_size, SZ_4K);
> > > =C2=A0		total_size +=3D alloc_size;
> > > =C2=A0
> > > =C2=A0		/*
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c
> > > b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > index
> > > f6d523e4c5feb7f07d695af90f4c44c7a9072c2d..dac51f8720fc6c7d27baa31
> > > a1b5c567f560e8c1f 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > > @@ -590,8 +590,8 @@ guc_capture_getlistsize(struct xe_guc *guc,
> > > u32 owner, u32 type,
> > > =C2=A0		return -ENODATA;
> > > =C2=A0
> > > =C2=A0	if (size)
> > > -		*size =3D PAGE_ALIGN((sizeof(struct
> > > guc_debug_capture_list)) +
> > > -				=C2=A0=C2=A0 (num_regs * sizeof(struct
> > > guc_mmio_reg)));
> > > +		*size =3D ALIGN((sizeof(struct
> > > guc_debug_capture_list)) +
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (num_regs * sizeof(struct
> > > guc_mmio_reg)), SZ_4K);
> > > =C2=A0
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > @@ -738,7 +738,7 @@ size_t
> > > xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> > > =C2=A0	 * sequence, that is, during the pre-hwconfig phase
> > > before we have
> > > =C2=A0	 * the exact engine fusing info.
> > > =C2=A0	 */
> > > -	total_size =3D PAGE_SIZE;	/* Pad a page in front
> > > for empty lists */
> > > +	total_size =3D SZ_4K;	/* Pad a page in front for empty
> > > lists */
> > > =C2=A0	for (i =3D 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> > > =C2=A0		for (j =3D 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++)
> > > {
> > > =C2=A0			if (xe_guc_capture_getlistsize(guc, i,
> > > @@ -758,7 +758,7 @@ size_t
> > > xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
> > > =C2=A0		total_size +=3D global_size;
> > > =C2=A0	}
> > > =C2=A0
> > > -	return PAGE_ALIGN(total_size);
> > > +	return ALIGN(total_size, SZ_4K);
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0static int guc_capture_output_size_est(struct xe_guc *guc)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index
> > > 72ad576fc18eb583110b44b118abeba4c6be936a..a58c58e599122f3e9ebd1e8
> > > 374c17c3b4663a5ed 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > =C2=A0	struct xe_bo *bo;
> > > =C2=A0	int err;
> > > =C2=A0
> > > -	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
> > > +	xe_gt_assert(gt, !(guc_ct_size() % SZ_4K));
> > > =C2=A0
> > > =C2=A0	ct->g2h_wq =3D alloc_ordered_workqueue("xe-g2h-wq",
> > > WQ_MEM_RECLAIM);
> > > =C2=A0	if (!ct->g2h_wq)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
> > > b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index
> > > 0ca3056d8bd3fa37bdb79a7a71ef671270771657..9975005732f645b4735f95f
> > > bae8ebe431e793ebe 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -58,7 +58,7 @@ static size_t guc_log_size(void)
> > > =C2=A0	 *=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cap=
ture logs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > > =C2=A0	 *=C2=A0 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ + CAPTURE_SIZE
> > > =C2=A0	 */
> > > -	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE
> > > +
> > > +	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
> > > =C2=A0		CAPTURE_BUFFER_SIZE;
> > > =C2=A0}
> > > =C2=A0
> > > @@ -331,7 +331,7 @@ u32 xe_guc_get_log_buffer_size(struct
> > > xe_guc_log *log, enum guc_log_buffer_type
> > > =C2=A0u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum
> > > guc_log_buffer_type type)
> > > =C2=A0{
> > > =C2=A0	enum guc_log_buffer_type i;
> > > -	u32 offset =3D PAGE_SIZE;/* for the log_buffer_states */
> > > +	u32 offset =3D SZ_4K;	/* for the log_buffer_states */
> > > =C2=A0
> > > =C2=A0	for (i =3D GUC_LOG_BUFFER_CRASH_DUMP; i <
> > > GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> > > =C2=A0		if (i =3D=3D type)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index
> > > df7f130fb663fc2fd170a94cc1b835b4b4cca167..0f97c6310a3a5696490aaa4
> > > 827eb3aa0d45ea6d6 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -1000,7 +1000,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> > > =C2=A0{
> > > =C2=A0	struct xe_device *xe =3D pc_to_xe(pc);
> > > =C2=A0	struct xe_gt *gt =3D pc_to_gt(pc);
> > > -	u32 size =3D PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > > +	u32 size =3D ALIGN(sizeof(struct slpc_shared_data),
> > > SZ_4K);
> > > =C2=A0	unsigned int fw_ref;
> > > =C2=A0	int ret;
> > > =C2=A0
> > > @@ -1110,7 +1110,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
> > > =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> > > =C2=A0	struct xe_device *xe =3D gt_to_xe(gt);
> > > =C2=A0	struct xe_bo *bo;
> > > -	u32 size =3D PAGE_ALIGN(sizeof(struct slpc_shared_data));
> > > +	u32 size =3D ALIGN(sizeof(struct slpc_shared_data),
> > > SZ_4K);
> > > =C2=A0	int err;
> > > =C2=A0
> > > =C2=A0	if (xe->info.skip_guc_pc)
> > >=20
> > > --=20
> > > 2.48.1
> > >=20
> > >=20

