Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21E8993E5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 05:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDEE113817;
	Fri,  5 Apr 2024 03:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAuspdTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC63113816;
 Fri,  5 Apr 2024 03:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712287997; x=1743823997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=leDocnW2Ec7u1ew3QptOYdBQ10w7+eKCaIaVI/evbE4=;
 b=XAuspdTrNPDlXwcHQdjLDJQs73MJ3uqRu99jP6eryUoYYcsiFdiPQyG+
 2KfwCZTVMo/KhTq/Sl/YOdXuZ77zvBUGD2YCIgx9z60EXqD5hlW5FfYZc
 0OPpP8gbek1OtjVJVXD31gzQivMxKIRMdWzdafK1nrgb92/V3sW81qXRo
 1ZlSKufKCvSohcSk+Go3mpLQc46Mh/PS3u3Eg5yECRTtw4tBS1SYoqX8e
 Kep3QdppN+CFlwekvMyUsDHQHk2XPUgiUsHOwzjNJFDwASwYHIfJVIOPy
 SZuwbFatqBMUGh1CzKa9qCIZNb0UNgB5pYASAh6N0dl7BvFDbmweSICOA Q==;
X-CSE-ConnectionGUID: GKr6LHIcR56xe0wvcdf4Dg==
X-CSE-MsgGUID: 0UcSFNz8TwazQAXGo5kDlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="10577627"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="10577627"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 20:33:16 -0700
X-CSE-ConnectionGUID: Gi5S5sToQk6E6AkJOwRYRQ==
X-CSE-MsgGUID: 0rJ40LE9ToyiNf7J62Rnog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19027831"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 20:33:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 20:33:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 20:33:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 20:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpFkNBGT6f2AZR+4gfWW8QZ3nwbkWLktjuUVHmS5hx9+RkUKkU4MqUa9z9LKmjJDxUajtqGXGjIZOQF/0rjye3QRD5Y7yjhE4morRFQPL9ufY7LEVAWJqYmV9KckcIIKjWqB/l2Ll8rsLp9+wUYPT98V1e2sx1tkOmLg+lFsvYpnAxhh2NTrD1qY3r2q67IhK9sUJW1rpUlAOwQc6LcHlJa+9ycAyPjjWHXG9zNuWaUjecP1tDZjd6la02fOYcb2ndt5XrAZ7H2ZFtyyXJ8V0IC34cfp3uOHqw7F8qx0uv1hiwFUkbD+bJ03LE2RzIOz3p9KE8FWVkAnzNmayh1ngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQRfSh3qpwRjvbJ/1TtuLwM79AAO3yeih1B9VoxeXdQ=;
 b=PuKOxkfAArn1cyg+2M66dBv0nw1c3l8a44bKUU9RKO7806IibPGxKwrpIsxXRPARymlGq0lvgvpYo77oXgNmdO0CJczGuDSXGymdi3K+z3rIlbCpkimGdICLBIH3RcWfO6Y0JgLdln3asqOah9+ras3ITLpdvbQQrXOAaRdusXRWXoJ+1oRiqrm9OUlZat5z4KAzVqZjcjygHdcxyT1tmH+hktiMvn3jUDPxS+tFFiaIJ6o8qkYJWFFUSIH8G+VIY3Azyp1ECfs5dAjRcuboQlcTvt/9SX9g7e8adtkvmZ/sRCuzCo967hk4pTJod0cr7NUxk1nnNg2cUv/RJfftcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB6044.namprd11.prod.outlook.com (2603:10b6:8:63::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Fri, 5 Apr 2024 03:33:10 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 5 Apr 2024
 03:33:10 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fA=
Date: Fri, 5 Apr 2024 03:33:10 +0000
Message-ID: <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
In-Reply-To: <20240405003927.GA11940@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB6044:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MqTVf8ShlLrUn00UFkCptbJwhRcXnONuYBhqvt4VElQKRavYALM5oT9vzki9+40gVC+1A2b7laC0bwP71EbC26p4lqg9v5O72IzVXZ6tCqExBqLq33Kyqk8RVRy1Nu1eCE9nNXOwqEsPeZvsPXh8TDSDd5kfngxoxwjPBbdl0O/ySfFCEt25AB09E4UiG1jqRbCL7gsajjIUj0FYAbcVOAbBrW2cceSQHKbd6yI2hObwv5lBZLoloKaFMqTRU+vFRK09hhkW9rxibACiAyzUrw2ZZkFV7dKChdFeM1oLinsf1GOWdMxEJkT80PHVJPbtDKtfulhsp7hGHm6uZ9GWlMZnEMpff/ABMzPQ3ZxM7Y1gJCkq33LFEla9UKwtb022L+14AZtJJSk5OSH/5lc5UW6M6yIx+R2yT/0AUzWJ88OMrM74D7FiYzGHWhRlTIHsIqI65GpvQiSCMbTj89JnKgyWeZrci3ie/n3ufQ4XXNn/VnFCA11W7/lmy29SO694nHO+z71WyKfZVsHFkloIQdYztlYuO4DW2flPsgRJZPZoJUoqf4j8Cy1HOFWudMQf68gNDUyrLZZOIoGn5M3tvmaz2TctnaGqRDnovBPI2vf08AFnBPklxbeV4xScODJ2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K1CrkmS6PcXabk6rgP1whH91PpxpNvZkT0dnvsUcirsb9JnfzWZWEi+FKe3H?=
 =?us-ascii?Q?Fyc2cfZwEuWHB0GS+R4cR+IzWZ+cddCQD+fKSHG92AhfXoe4XK02sQFT7nSL?=
 =?us-ascii?Q?lohumTLq7ScSnfPSCxWHzyWGU51loYXLLrK3NWCYO4Pv3pgFTI9oooUZoL5R?=
 =?us-ascii?Q?VG/6hueV2iWA1C25EBYxneBehnb0qJZ50og1K/GX048Mrhh7wlrkgvfCslpb?=
 =?us-ascii?Q?267wgfxE/dFn4zGXi28qdRjLZudD41Fi+3DV2JL2MHBDYj5+1RWXrxQStjr2?=
 =?us-ascii?Q?421pU8OrOoAzFjlCHPgT/lE4ClPTMdPP5vcDAsF2elapOBej8SFcRAHVdpqH?=
 =?us-ascii?Q?Y9Wx3MAiy8cENlotrKi/fBFPeTic0Zkw4bU37AGAlaxRgy6PZu+i3h7hnHO9?=
 =?us-ascii?Q?I95pMlkQmaViFo6BUqbEAi1PmV3GThgGZxS7+3Y8nmfSOK+5Xo451egwqwF2?=
 =?us-ascii?Q?VIfQiwbT1X1EjT6uuRz/1x2/voWwrTpVGkxB+N+wuS6xWSrKnuldtCgyiRV+?=
 =?us-ascii?Q?dQdJcxHWMQ3fn6AYKOR090/fYyWiXwuakJH3ht6GD4qFWrrjn87oSgS3OGqO?=
 =?us-ascii?Q?7gYlICYXz4Ug3Ajmng+DlSapSDDKioCh8Lq2tKIprZ/kgpcXOUe3eVUsF/bX?=
 =?us-ascii?Q?gpqxTyBoBC84TbKcI+3oAYFxAqYwY/MUKkoAdZeN1e5zl2hKYaOc/LFOysd5?=
 =?us-ascii?Q?ianH17/mydPWZlQdoEaz3MQ5Wo8cml+WRY02nkumpmoFG8zAYVSsl/gII7Zx?=
 =?us-ascii?Q?pmSBWlmbuq51U5u7FDuKHbwKux96/s62DZji+x5NfHN8G/71Sb8NHK3W28OX?=
 =?us-ascii?Q?MV7IgUHVVToWLg8x0EOkXR1OeVcRpC8j/mCFh85UbBGxz/bKRavFYO2TEEiX?=
 =?us-ascii?Q?/IV1XJuhDbgy6qPizWyWmlEtudayFd4BPyV95gYuGHRwA6bfl4NVy8q0sbMT?=
 =?us-ascii?Q?JpZvnMRdOvcQy43NeQV7WgsVoWHFWM+oYLdHOpfyyWt9pPg1N84EZj4cXpvc?=
 =?us-ascii?Q?an70MvlmmSzkRZokgHsnCIHctPmpW711EAU0gJHHB0JpZISMJJZyMxK9TcCW?=
 =?us-ascii?Q?QpJ6jxKBX/iAoEgvJ3HFG4anm5hIWLoeN5878cyQMINHHsgE4sbt4AI1rCky?=
 =?us-ascii?Q?0slMIkfpUZTtM/HtJ311yzUTAU88P1k7chGouDEn9Wr3EVMMG3WI/wlYg3lb?=
 =?us-ascii?Q?mTcLmNriO9Eo1+seLeYTsGwgFAsEplY6b5lk3ufO7x6p66PUC7XpvJgHGCQA?=
 =?us-ascii?Q?3YPZbJ+g25HmgKfAzWXhdPHhjVLqfwTosQxAvLut6eNzsxml8N2oJCsmDr3j?=
 =?us-ascii?Q?7y//l5MEv8+ztjFwveEO394XQ2tT186eJreuBeefBnJbVj2txpV0kpLxleVH?=
 =?us-ascii?Q?CD0dapvVSIP06N6Hx2cvpv8BMAgI4Tx27Hm22HsIQBXx+C5SvkKVDqsprjbg?=
 =?us-ascii?Q?Hjtu+d1JbtxlXWDEqwni79PYkHAudfxXMXjK6OvUOiAv4A0UYnA4yntp04FI?=
 =?us-ascii?Q?0gVVKEIAlYjH6g8hkRzmjCUo3pvC3QXCfYiW5uo0D7IPPuyiwM0fBdQK4QyD?=
 =?us-ascii?Q?27FbEi7D8pRWWCt8iwA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f78fcc2-3b6b-4173-39ca-08dc55211e28
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 03:33:10.7964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Jq/eI06BuDOZkejpR7beiblGoILBtYnbbhB2LcoyO5acmIkGZjcr7n9i8PFQhRZtgVyB3MoH+aKmz+ORqL/0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6044
X-OriginatorOrg: intel.com
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

Hi Jason,

> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 4, 2024 8:39 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Bros=
t,
> Matthew <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty, Brian <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le from
> hmm range
>=20
> On Wed, Jan 17, 2024 at 05:12:06PM -0500, Oak Zeng wrote:
> > +/**
> > + * xe_svm_build_sg() - build a scatter gather table for all the physic=
al
> pages/pfn
> > + * in a hmm_range.
> > + *
> > + * @range: the hmm range that we build the sg table from. range-
> >hmm_pfns[]
> > + * has the pfn numbers of pages that back up this hmm address range.
> > + * @st: pointer to the sg table.
> > + *
> > + * All the contiguous pfns will be collapsed into one entry in
> > + * the scatter gather table. This is for the convenience of
> > + * later on operations to bind address range to GPU page table.
> > + *
> > + * This function allocates the storage of the sg table. It is
> > + * caller's responsibility to free it calling sg_free_table.
> > + *
> > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > + */
> > +int xe_svm_build_sg(struct hmm_range *range,
> > +			     struct sg_table *st)
> > +{
> > +	struct scatterlist *sg;
> > +	u64 i, npages;
> > +
> > +	sg =3D NULL;
> > +	st->nents =3D 0;
> > +	npages =3D ((range->end - 1) >> PAGE_SHIFT) - (range->start >>
> PAGE_SHIFT) + 1;
> > +
> > +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < npages; i++) {
> > +		unsigned long addr =3D range->hmm_pfns[i];
> > +
> > +		if (sg && (addr =3D=3D (sg_dma_address(sg) + sg->length))) {
> > +			sg->length +=3D PAGE_SIZE;
> > +			sg_dma_len(sg) +=3D PAGE_SIZE;
> > +			continue;
> > +		}
> > +
> > +		sg =3D  sg ? sg_next(sg) : st->sgl;
> > +		sg_dma_address(sg) =3D addr;
> > +		sg_dma_len(sg) =3D PAGE_SIZE;
> > +		sg->length =3D PAGE_SIZE;
> > +		st->nents++;
> > +	}
> > +
> > +	sg_mark_end(sg);
> > +	return 0;
> > +}
>=20
> I didn't look at this series a lot but I wanted to make a few
> remarks.. This I don't like quite a lot. Yes, the DMA API interaction
> with hmm_range_fault is pretty bad, but it should not be hacked
> around like this. Leon is working on a series to improve it:
>=20
> https://lore.kernel.org/linux-rdma/cover.1709635535.git.leon@kernel.org/


I completely agree above codes are really ugly. We definitely want to adapt=
 to a better way. I will spend some time on above series.

>=20
> Please participate there too. In the mean time you should just call
> dma_map_page for every single page like ODP does.

Above codes deal with a case where dma map is not needed. As I understand i=
t, whether we need a dma map depends on the devices topology. For example, =
when device access host memory or another device's memory through pcie, we =
need dma mapping; if the connection b/t devices is xelink (similar to nvidi=
a's nvlink), all device's memory can be in same address space, so no dma ma=
pping is needed.


>=20
> Also, I tried to follow the large discussion in the end but it was
> quite hard to read the text in Lore for some reason.

Did you mean this discussion: https://lore.kernel.org/dri-devel/?q=3DMaking=
+drm_gpuvm+work+across+gpu+devices? This link works good for me with chrome=
 browser.


>=20
> I would just opine some general points on how I see hmm_range_fault
> being used by drivers.
>=20
> First of all, the device should have a private page table. At least
> one, but ideally many. Obviously it should work, so I found it a bit
> puzzling the talk about problems with virtualization. Either the
> private page table works virtualized, including faults, or it should
> not be available..

To be very honest, I was also very confused. In this series, I had one very=
 fundamental assumption that with hmm any valid cpu virtual address is also=
 a valid gpu virtual address. But Christian had a very strong opinion that =
the gpu va can have an offset to cpu va. He mentioned a failed use case wit=
h amdkfd and claimed an offset can solve their problem.

For all our known use cases, gpu va =3D=3D cpu va. But we had agreed to mak=
e the uAPI to be flexible so we can introduce a offset if a use case come o=
ut in the future.

>=20
> Second, I see hmm_range_fault as having two main design patterns
> interactions. Either it is the entire exclusive owner of a single
> device private page table and fully mirrors the mm page table into the
> device table.
>=20
> Or it is a selective mirror where it copies part of the mm page table
> into a "vma" of a possibly shared device page table. The
> hmm_range_fault bit would exclusively own it's bit of VMA.

Can you explain what is "hmm_range_fault bit"?


The whole page table (process space) is mirrored. But we don't have to copy=
 the whole CPU page table to device page table. We only need to copy the pa=
ge table entries of an address range which is accessed by GPU. For those ad=
dress ranges which are not accessed by GPU, there is no need to set up GPU =
page table.

>=20
> So I find it a quite strange that this RFC is creating VMA's,
> notifiers and ranges on the fly. That should happen when userspace
> indicates it wants some/all of the MM to be bound to a specific device
> private pagetable/address space.

We register notifier on the fly because GPU doesn't access all the valid CP=
U virtual addresses. GPU only access a subset of valid CPU addresses.

Do you think register a huge mmu notifier to cover the whole address space =
would be good? I don't know here but there would be much more unnecessary c=
allbacks from mmu to device driver.

Similarly, we create range only the fly for those range that is accessed by=
 gpu. But we have some idea to keep one gigantic range/VMA representing the=
 whole address space while creating only some "gpu page table state range" =
on the fly. This idea requires some refactor to our xe driver and we will e=
valuate it more to decide whether we want to go this way.


>=20
> I also agree with the general spirit of the remarks that there should
> not be a process binding or any kind of "global" character
> device.=20

Even though a global pseudo device looks bad, it does come with some benefi=
t. For example, if you want to set a memory attributes to a shared virtual =
address range b/t all devices, you can set such attributes through a ioctl =
of the global device. We have agreed to remove our global character device =
and we will repeat the memory attributes setting on all devices one by one.=
=20

Is /dev/nvidia-uvm a global character device for uvm purpose?

Device private page tables are by their very nature private to
> the device and should be created through a device specific char
> dev. If you have a VMA concept for these page tables then a HMM
> mirroring one is simply a different type of VMA along with all the
> others.
>=20
> I was also looking at the mmu notifier register/unregister with some
> suspicion, it seems wrong to have a patch talking about "process
> exit". Notifiers should be destroyed when the device private page
> table is destroyed, or the VMA is destroyed.=20

Right. I have dropped the concept of process exit. I will soon send out the=
 new series for review.

Oak

Attempting to connect it
> to a process beyond tying the lifetime of a page table to a FD is
> nonsensical.
>=20
> Jason
