Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356B809847
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512010E9BA;
	Fri,  8 Dec 2023 01:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165B510E247;
 Fri,  8 Dec 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701997223; x=1733533223;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=spT6NcJQTddgjFH3rL4fyuzJuLJLtgiZv+Xh2IufNMM=;
 b=hk6VJ5uFIfzSnk36oBGRgYHgiIrPm2LPCaOhrbIzJz+/mZbGe/vp+igA
 /EB/4ItTS8JOj/elWt1B3uAdVDL4ypkFjYJir9s53Inv+YsmDPbLaEhn3
 5QOnR+pjLHvqY2zZ/+W0ewUaA+0sfw9fQt27v+0AOEgY9Wma1UfeZ96dZ
 OiXzS2MSGZ7LuHWxuB0uOEbFquMqJpz4rXKcl4kqLQwtm6dksLmQr4uFb
 hJ00h8AG+e8TIzJKCZrR1rx9SUGEMmTEOuumJ6/9KkB5KZztPyY7dRso3
 8ELFeS6UDCsmssZO0OXWfwq9r8e2AwDsw07pRXakwIiDL8gec9WV7I6Wv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394076777"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="394076777"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 17:00:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019161965"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208";a="1019161965"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 17:00:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 17:00:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 17:00:08 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 17:00:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCPBN5F/3VWUVtuIKFsreIPPYaReB4YUZlhptC1x+ZPe5QmDcCyMWakzhLPmj9hwWTOEpiEJM2If4NHTuLWNUw5MpE2VtbTWz6E8vL/vx/ifLd6/uyZ9bdJGz3zLcmRLd1UMCeFw9D/rqLPcI/iOla31Kz3Iolf7J1xdipZ8pPXpAlMXjEs+F94WIj0a2d9XBknGpVnCFUyMUR4VYgN/CdMDweNnmGRrgZ3uAgCKUJClkDSTp5iKps7oKbtARXdFhyRVxB1lNMJLY8F3c0KzhKUdA4lrwcI+H1vhqqBJutuCiZhJ1nM+0ox61WbZwcB3V7gwFh1wC/ajF6gqPwdkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTICjuwJUONLvDyxx7K7H+T4fpER8U08HyZZOaRPT6k=;
 b=nns/rgfZU6JIkF81uB4E2DHL0YydcQdfifq6KatV2rRgHJHAl7SSIYfOOZxgL9QQbFs1OOhTRl2HuuR8KrpPQ6LWDtIk5V5mYonsNM2f41HYYu+wOcX/1GtG5G2DGRSnbsIfBZhR3HB+zzIsiSfW4yN4F1glBzwO9IvAOdLdqAd3u0OxYcNhNNPxMFQMrN2fbMvpuRGQN8WuqoJw09QYoxOAZ+VfvSb/nTPWljcWaQ15Nf+OCFuz4Y/iT5BiK0zjQ3I92vbp0qpjXWFXo9MINhg34iQ8avOcQ7ipKO1pd9EQqpCbJlG32/Mpr9P8Xh37gOFZctFXjFasJwPTNrC9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 01:00:05 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::9ec5:f5c2:d277:63eb]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::9ec5:f5c2:d277:63eb%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 01:00:05 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "pazz@chromium.org" <pazz@chromium.org>, "Ursulin, Tvrtko"
 <tvrtko.ursulin@intel.com>, "Hajda, Andrzej" <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] [v2] drm/i915/display: Check GGTT to
 determine phys_base
Thread-Topic: [Intel-gfx] [PATCH] [v2] drm/i915/display: Check GGTT to
 determine phys_base
Thread-Index: AQHaKHTXu7JlAZ14EUuGn948QxQhRbCektaA
Date: Fri, 8 Dec 2023 01:00:04 +0000
Message-ID: <1d6b9ffa093404631ca8218f3b5b72057a7da6a6.camel@intel.com>
References: <20231206184736.3769657-1-pazz@chromium.org>
In-Reply-To: <20231206184736.3769657-1-pazz@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4620:EE_|MW3PR11MB4668:EE_
x-ms-office365-filtering-correlation-id: 7bde9081-28be-431f-b329-08dbf78903da
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Bw9QszO8+50k4XdV65JVBcB9hktwT6Nc7d0CMHjBnwgcNNOJolBhnR+H6KC8we0A57AptfQ2mjvfb5RLoeeTlhYP9Kg+41zY2rcyxMLMTMAFJx57l8M/g8AaNY3LNH/XcHKpYq4/XU3aK6UagmS6gHxhTv6RS8fF3SXNVwQMpRla50vj/UcEJpSH+VfYetgMP5KihcRyJR8NevepQ41/c+N2Mdy6Utx6ugVuqB8PLF5eyY66jvC1Krzpidf3LJU2POrU+RdkEAvIqNyme7RgGkJaWsyD84BkfbaigCb//s55N3013tODbpdjF8Wv+cM4tsSYAtJ8E+skXNc+7wEwa7roUEZv61HHqtxt6F+pw3UfeLJDf7TJwVYNkaswkPLYV4mI1TZySwfqMU0uqBwMMZj5Ucy7+YCBjCyThG0HxwN1G4NXtXuyr6iln1ZXbsgjjbabXL2pdL38fKD8AOGpxYB2Jn/ogfritOX6+TXFj00fKdEiTTIrtYRQo3M7Vm8lZF8gKDdohSRmeKCLERuh4cFQy1/ODUYsZv5S2DIOdsmsTD4SMY6hr5n0UaKxsK/7m38nXF6XZp6sNUmp0mEAn35p1vgSgNnoPhfDlsKSG5pq5NUtbcEfl/J80UIxZCv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(71200400001)(6486002)(478600001)(86362001)(41300700001)(6512007)(6506007)(36756003)(316002)(54906003)(8676002)(66446008)(66946007)(66476007)(64756008)(2616005)(6636002)(26005)(66556008)(76116006)(110136005)(82960400001)(83380400001)(122000001)(38100700002)(38070700009)(8936002)(4326008)(2906002)(5660300002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?KIZQaR16Pjuo5qCNXSJFfAV1FylAK4WAnulLtbTk8Oh8tVNNlppUs5vLz?=
 =?iso-8859-15?Q?kN2Ertmy8uKYeeDL7jAtoqPMGfZ+hl6ewfy7Bb3y97N4ziG2N/5UxyHaT?=
 =?iso-8859-15?Q?+x0ca+mQaUXKKVnqraWnXpSsRoKh8xqdQ8rVkLN2cYYW1yaipGuDH3NgD?=
 =?iso-8859-15?Q?fdY4WOZfrxiMxuBeh4v6O3iy39M0bFb7pkcNeWYkPn1Mj3AL8BV/8pBsi?=
 =?iso-8859-15?Q?Hc2ENvEOsOe4RzEiks7POfkZh8qHhinXfjmtD8cz10oSS1ER8S7jS0BaX?=
 =?iso-8859-15?Q?SrPCG9/7MfVXoKvjPwVOOW8IB0fIUBjOOAXbOJZSiu4wCAkdrdcfHf67t?=
 =?iso-8859-15?Q?Q/ici05/CYOtGUD3QZl/XEYYfkjH2/YUBDJp7qYe8Rb8MJrfLi52D79uG?=
 =?iso-8859-15?Q?8XTmuhRGj98YX0VulfOKPJXqIFom1POap0q671ZAPWP/Nv98ICnvEVixT?=
 =?iso-8859-15?Q?5qC+yOCXT1OU42BfkxNOCMBL5XknjzOaqNJKI5jFbSSMmomga4kJMVjME?=
 =?iso-8859-15?Q?qgJZCY4LZ9ZSyF7qCkbXolFd6g/4rxHWAeWsRQRzskCytyW3tZkp3k/6R?=
 =?iso-8859-15?Q?6iBjZcEhe8K+54uclUnKjmMlYvn4Oruo3pU22EWld3pOXjekuMVOd+BOq?=
 =?iso-8859-15?Q?or9ZrKSH+ety9wdAVnwDsXmGcrgkhHWmJTU8G/Glb6SEbiCMh9ivocll6?=
 =?iso-8859-15?Q?1CGmxXdoMo9kRJ4QrjAKL3iGA6x3S6GqBvsjZ5W6JtkIhUik18X0ktN7g?=
 =?iso-8859-15?Q?JFpIGNajRJJ0jTFd0jWBvkO3Cvnaf2Utn7r4kteEPG5diSDPhVnWhSfOo?=
 =?iso-8859-15?Q?V2mtoJV9Wd85PvewRRdZYcTa7758rE3xYXMrRuskehNkiJXl30BCQGhb6?=
 =?iso-8859-15?Q?+iDwOINc3BhuqBQ8XAV5vatxp3UmDUrFd2qgdQOKaFGi3qKd10H1kOBMS?=
 =?iso-8859-15?Q?dwEJpsjPiYwylKnbG+5vI7XhLSLLzEL/DauEspJ+hxw95jRTfxeG8NPY4?=
 =?iso-8859-15?Q?p0BRYgGfpfy6LlVr0yY+MezNECizPwiNOiHyWqJIQ13DPVO0h+07vDDLY?=
 =?iso-8859-15?Q?XnSuYADAkjPPkRwGh50OXlaCMFuevqI61ZPg2pVCVVgiG/Ho1hM68h+NT?=
 =?iso-8859-15?Q?Jb2T5v+S5RrwbXFDuACUwR1FIId1jhbN+1NWjn70os2TXVQKBMIyU5Z9p?=
 =?iso-8859-15?Q?7egikRFp1sqadY7EWnwCHyMeoGjBRRiTMiltP6lA7i+KR+5heSn6TDT7/?=
 =?iso-8859-15?Q?nXyy4QlacQAxKkC3vw35FgdEDkzELtIiZTGrSy4fXvI6yoJNGxunojYMY?=
 =?iso-8859-15?Q?4c+EOeKgwDEaAOMY3eCDOF44krxJKm46SprwmCWTaFiasVGFAq1jCgXg1?=
 =?iso-8859-15?Q?MHO4scOZIOuuALOxlKWjSHnCaq4ER56DFKkhvr3eswJamnU39O5EcLYL3?=
 =?iso-8859-15?Q?2wM63MEd+1OTSRm85NtGZKflNxt78gQLBARxC8OvEfskaAdlgrXvY+aUO?=
 =?iso-8859-15?Q?ESXbN9+m6JMAr3tbWc8KaR14Bi5SKhlllQ+PP8khCOKUbpWWLvPQJmq6C?=
 =?iso-8859-15?Q?0yrv+QaytYT2s1GHJxMCafy5/EeXA3pMrcv72ixfiY5Xv8uYnh8G61jGW?=
 =?iso-8859-15?Q?+Ohpe3Oc/C4r26cMMjgsqygehEjvFZ+r2mYvcOr1sG3xWbz3Voin4h1Q0?=
 =?iso-8859-15?Q?fnkMxNCWf/RXe+FofbjUtBlqRruSSh/N0QHQh78S+QdePfU=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <4E099362E089D24ABE337BCC7B201A1D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bde9081-28be-431f-b329-08dbf78903da
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 01:00:04.9904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jUrfDFQ/8o87ZS71AhrOmQ2gwwvfya5lposfIIv3X9xmYht3yRr974nbj6QF7h9KVyNrmuQWEiyk6We89jS/M45p2iP1CuTaVcMsXWnWmR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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
Cc: "Banik, Subrata" <subratabanik@google.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mwojtas@chromium.org" <mwojtas@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "ddavenport@chromium.org" <ddavenport@chromium.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank You for the patch. We noticed a break in the customer board with
the latest GOP + this patch.


Thank You
Khaled=09

On Wed, 2023-12-06 at 18:46 +0000, Paz Zcharya wrote:
> There was an assumption that for iGPU there should be a 1:1 mapping
> of GGTT to physical address pointing to the framebuffer.
> This assumption is not strictly true effective generation 8 or newer.
> Fix that by checking GGTT to determine the phys address on gen8+.
>=20
> The following algorithm for phys_base should be valid for all
> platforms:
> 1. Find pte
> 2. if(IS_DGFX(i915) && pte & GEN12_GGTT_PTE_LM) mem =3D
> i915->mm.regions[INTEL_REGION_LMEM_0] else mem =3D i915-
> >mm.stolen_region
> 3. phys_base =3D (pte & I915_GTT_PAGE_MASK) - mem->region.start;
>=20
> - On older platforms, stolen_region points to system memory, starting
> at 0
> - on DG2, it uses lmem region which starts at 0 as well
> - on MTL, stolen_region points to stolen-local which starts at
> 0x800000
>=20
> Changes from v1:
>   - Add an if statement for gen7-, where there is a 1:1 mapping
>=20
> Signed-off-by: Paz Zcharya <pazz@chromium.org>
> ---
>=20
>  .../drm/i915/display/intel_plane_initial.c    | 64 +++++++++++----
> ----
>  1 file changed, 39 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index a55c09cbd0e4..7d9bb631b93b 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -59,44 +59,58 @@ initial_plane_vma(struct drm_i915_private *i915,
>  		return NULL;
> =20
>  	base =3D round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
> -	if (IS_DGFX(i915)) {
> +
> +	if (GRAPHICS_VER(i915) < 8) {
> +		/*
> +		 * In gen7-, there is a 1:1 mapping
> +		 * between GSM and physical address.
> +		 */
> +		phys_base =3D base;
> +		mem =3D i915->mm.stolen_region;
> +	} else {
> +		/*
> +		 * In gen8+, there is no 1:1 mapping between
> +		 * GSM and physical address, so we need to
> +		 * check GGTT to determine the physical address.
> +		 */
>  		gen8_pte_t __iomem *gte =3D to_gt(i915)->ggtt->gsm;
>  		gen8_pte_t pte;
> =20
>  		gte +=3D base / I915_GTT_PAGE_SIZE;
> -
>  		pte =3D ioread64(gte);
> -		if (!(pte & GEN12_GGTT_PTE_LM)) {
> -			drm_err(&i915->drm,
> -				"Initial plane programming missing
> PTE_LM bit\n");
> -			return NULL;
> -		}
> -
> -		phys_base =3D pte & I915_GTT_PAGE_MASK;
> -		mem =3D i915->mm.regions[INTEL_REGION_LMEM_0];
> =20
> -		/*
> -		 * We don't currently expect this to ever be placed in
> the
> -		 * stolen portion.
> -		 */
> -		if (phys_base >=3D resource_size(&mem->region)) {
> -			drm_err(&i915->drm,
> -				"Initial plane programming using
> invalid range, phys_base=3D%pa\n",
> -				&phys_base);
> -			return NULL;
> +		if (IS_DGFX(i915)) {
> +			if (!(pte & GEN12_GGTT_PTE_LM)) {
> +				drm_err(&i915->drm,
> +					"Initial plane programming
> missing PTE_LM bit\n");
> +				return NULL;
> +			}
> +			mem =3D i915->mm.regions[INTEL_REGION_LMEM_0];
> +		} else {
> +			mem =3D i915->mm.stolen_region;
>  		}
> =20
> -		drm_dbg(&i915->drm,
> -			"Using phys_base=3D%pa, based on initial plane
> programming\n",
> -			&phys_base);
> -	} else {
> -		phys_base =3D base;
> -		mem =3D i915->mm.stolen_region;
> +		phys_base =3D (pte & I915_GTT_PAGE_MASK) - mem-
> >region.start;
>  	}
> =20
>  	if (!mem)
>  		return NULL;
> =20
> +	/*
> +	 * We don't currently expect this to ever be placed in the
> +	 * stolen portion.
> +	 */
> +	if (phys_base >=3D resource_size(&mem->region)) {
> +		drm_err(&i915->drm,
> +			"Initial plane programming using invalid range,
> phys_base=3D%pa\n",
> +			&phys_base);
> +		return NULL;
> +	}
> +
> +	drm_dbg(&i915->drm,
> +		"Using phys_base=3D%pa, based on initial plane
> programming\n",
> +		&phys_base);
> +
>  	size =3D round_up(plane_config->base + plane_config->size,
>  			mem->min_page_size);
>  	size -=3D base;
