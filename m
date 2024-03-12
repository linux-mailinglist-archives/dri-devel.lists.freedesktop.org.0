Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FE879F2D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 23:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3898E10E4C1;
	Tue, 12 Mar 2024 22:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVfJdQFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B010E4C1;
 Tue, 12 Mar 2024 22:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710284305; x=1741820305;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ukkPFrP252p6tnNOVGokSVNGdO6R4LHtpfyY8Ur9V9g=;
 b=GVfJdQFKi7HFZ1TUiPlVGFo3oZd4uZVD4ri34Lh5eCIEzy8Nr4PuQacK
 LIwBKVxecoBpw8a0OKdBcBXIFLpKqIFAYv4dI4X8pq43ObyrXuLRUaBeT
 iTtcM2Y3eir0Dpnwnx1yzQvkShXpYjKwQWw67qXEuRWTe0AumkLeB/MPB
 dQXzo6KWHHbwG1MRki0gqOzahPk9L6EBTRpyKIVdQ4OlTmaTo6FhnB7N7
 KUgCz16XuMcEpYXW3zbGT11uoWNpgTA54GyeGWyDFOYbc7Wq2sEnSylcX
 QTkYzCcMkEE6lDbVBlidglGvTP3hklwR/zX+s4uc6lw/L+dQ7oOp52xxR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8799610"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8799610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 15:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12293715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 15:58:25 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 15:58:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 15:58:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 15:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXH00udfbvY4ziEV2WN/NVLvbE2WgQYEaIocw2UTb5i4bESXEWQrK5Y9qHDf+pk4IVV3UrpatwKWMkPTqx4Ndc0vDIPkZG3ovWSBAJp0kphSemRk4gtzEJ+G9yP7KFmOBYKVtICuMN2HHmts7Ei+/Qehn3EXV9gEdOVBamj6bTjChemkoQJd31/REK4Gl2/PLLet7CYETSt0NManH206rdydvbLFJWbx+ruprz7h/cYaSilsdswOZc1soMiIrDJtGKm1cwRyNLx4EG7LzPH5BemjF0OW3JyKNQ6r5Bi2WbVVO7FF5Nrsd+8Vqov3iLVhCEa/6jNQcfnNaQdbcsSaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/eRsctq+Y45lrRwpK5JTiHonNBVORMUTdJ/mzbl87E=;
 b=Ax2mDNsReQCovOVaGKpnaclWtA6rjjedATQhB2ZGR9qlPV9en8qOHLm0U7PtQwYLOruo7YbnM/C4043TSWOn9bgYFpt24OIPA7BFp8GPAYROWVDVkROoJn3cD4ZZBAqJx3uwwQZZVfMN1J8gsXAWc0OVF8/YWpw2IixZHoBJV+MYtpRQYH7fpvxbypnvwJIGshuetHJ5BeuTyRaffnqR8kLCc2TTZqQy4TUHYegKw/I1z41eSym0W/MGG+Ls8rgDemwi7e0nYS4KPAlYy1W1x1ZC4wQs2aZ3FTiMT+k5U+R8jHDvZUSHnOb+Xk5WmVnKCzdCiUHsEwLr2T1M6oq0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4723.namprd11.prod.outlook.com (2603:10b6:5:2a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 22:58:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 22:58:22 +0000
Date: Tue, 12 Mar 2024 15:58:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/i915: Drop dead code for xehpsdv
Message-ID: <20240312225819.GN718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306193643.1897026-1-lucas.demarchi@intel.com>
 <20240306193643.1897026-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306193643.1897026-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: f63a28e5-d71a-4aca-7b08-08dc42e7ea8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzTphXFmluLB44q9J9yrPGBww4C1Z7h/a3kIc2b9rl5duIFIzznxH0Jkx8Gwkfji3GzoU+08jA/UcQKTzcXX9YiC8Q6wOkF2wVjbh2ThR4VRBSS6xYr2HYkCRPt+6p6QeI7y/87IBn3+ZyJOrybfkSuxU8jMmU06MG99+E4PLPA/EiISrpUOic3g+08x8EaBWsQcLL0GmapIXMO/sl1ulCYgDJDPGUN64132rb44UvKX3u6WWnISo/MEoXYpHmygihSnoJJFm9WpfiUxS2lLnIXAXfbWjamnGnzz/0bu0JKPosmicd0EMj8vMCe1E9Xul/csbcd+Z2XhdVz+PZ8eqE96inSM9YIz3LPl8Iyr/LSRVySC3ofxJ5FTKz56rjrNDv0pwSc0QqVIvTA81vvYQzsb/Auu8JDj6U7N/TDzxWn4wxTh3E14s3X40Mb5xIuFimawfD+5iAhIsLSweUxDwgSUGC56+lrjoThUs9lK2iN3phaYmdXGZjSBNC1NsPSBqsCxUgeHSkHWa7fPFjSLxEso4v/YNudDxLqTfUDLZCltXNUR5lFu8C8lgFzUzBFF4+MMG1TV6rSs1+3iXFfXmEo6h3PZ53u/pMQFtaZO+68FspT5x5D8oov7VJ6i4gTNc0h02OGKfPcLoDNfE+7/1DH5eGynyEE95VUXm/r95RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2YnIhj/cWe6EFECDKZHhSU0m/sPjRcbVGfDOOU6+lKAXu7mQPtc9nKtSz7Ee?=
 =?us-ascii?Q?5ycHZ36smYIwpwRJdyyBmEW6arREQEstNrCSQSVgf2qIWuq/yvdp3A86L7IF?=
 =?us-ascii?Q?JW3CvDEA1dt1iuCc82BRMW5OKv87Bax6vlL8L4eea/ayROKY1uMxlhdiy/dm?=
 =?us-ascii?Q?dsq7cqtnrwEU9wrr7CwIX+IH0KgFZThMFwdk/nkLDD2N0lg3nZAnN8s/cjOx?=
 =?us-ascii?Q?+l9QAQsAMW7YVVu8GF8LxVmeIGUz/ijbmisbqjwPhOAFUAhTPD6hE/y535DR?=
 =?us-ascii?Q?dG2GpxYTYWUzPPU2gjdyD8wp3GI3TLddEFf+75MSQkOPkfG8zd2SrxDwtSIq?=
 =?us-ascii?Q?hz8Lq0dwtTc6VQz2z1kP0UmBrhlimQnNB6p+/CAjkKfs4hD5xLNuZNsPT3ek?=
 =?us-ascii?Q?jkZPeF3iHzmlqWA0vhFuxxxbMh55fSEj24Dm7cwGRP/dgctCb9dn4mgOvpLN?=
 =?us-ascii?Q?OmVHGhKCiuNYKXVILdJFpI6COHjmzVg+z/eXcaaIGFkbGjgCBcJhK6p93NNQ?=
 =?us-ascii?Q?T2VjUM+rvnqykeKK0nLTErFjBuWU6mEqHZ+zTJ/fBM3/84LQhPAjBEFJ4jHo?=
 =?us-ascii?Q?OpYEEYJbdp5cX+QzuAzfIDnOOFRLyom9Qp7w9hwB1CO5aviiZrJy6KdpjlEE?=
 =?us-ascii?Q?ogcu9/ciWTMlaEADuNdAF/j6v0ydx/FRvq33PzlgD/oBmf66ertqkcNA3k4U?=
 =?us-ascii?Q?uUCXDV7hvRAaWRF4CZ7g4VWxVqJxiQoh7xjcU0wWzpBBEgtz+lzETe49I/pq?=
 =?us-ascii?Q?SpvlG7D/CInca3i8GnlVOHxZJGZyOTrE7kKi9/Szh392CYygYydtpBqV1zyv?=
 =?us-ascii?Q?mtZQ93smSdos6vvogZ9oL5I8YDr/41PCBl/PtQ9OMUkKCeI0bmXPtMd/GNww?=
 =?us-ascii?Q?TjB0mFdi+trWgywtuWnc9sK159vPzOYccvIgWAqi3Mbnh9FsAbK0nfj0Clm4?=
 =?us-ascii?Q?r5+36WqIAac8X8pe6CQUYocPDqLHeVdtx+2GSEXKp0rmz5NtW4H/gPE2by5Y?=
 =?us-ascii?Q?gLuWdXkrIF7Hnm4e5mbLsey4HlFv0t0N6DnzPDold2akBLpREX9te0HQoQU/?=
 =?us-ascii?Q?25P5we+Hrr2dGZ9tsDpGHRg/EXfV3UQSz5oY77xsNLmqEk3LYHBR936jsNYL?=
 =?us-ascii?Q?iH6uZ0+DCDT/15ypuMeqdUqt81A56q65clMLIo+GNa9w9r80jx/d1cFGnOOp?=
 =?us-ascii?Q?nB4vx+1QnL8GZl2ny4t9yfj4D9Fauhej7NcGz3c/7Qh+nZsQ9TuHgYOxD0wn?=
 =?us-ascii?Q?KZoI8Bh9wyljascg2hTN4v+pKhriLE60hk+Kaw5va3ky+/4vc8dnD32nHbUv?=
 =?us-ascii?Q?g0X0Sk43m//121/jAU1rUwNvedWcXMBlhcX+h2qcy/8SWHSWn4zCvWGB/auD?=
 =?us-ascii?Q?IkxMY/fFNkk19+HV6Dxla1a1nIJ4JYwPdxcZsq3jl3e+00Kzi6UtDhJ9G8lx?=
 =?us-ascii?Q?qSVDPEzj0Vb319h307hQy8pmK0FHRXnIXPkd9SaslGDCAZ/1bfRAOOUoshsV?=
 =?us-ascii?Q?QHioxG3s+Yj8TRn6Tj7OGpnN4Ug0bQkO1H/bPxsoI8B/bNkYOsEx5BUMuUAt?=
 =?us-ascii?Q?P41G8d+hBopa65AJxpOg0ddhUbqufe+2lw0pzAYNy08+SHqhLRBj7eu5c9T1?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f63a28e5-d71a-4aca-7b08-08dc42e7ea8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 22:58:22.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2OC3na7dpf0TwYLUrFhY+Qp7QVWD6ixWwQY4LdaZresosyEmPJRWjp24oByrbyTGh4RaQUjmlOCGsN5HKaCDF+rBs5QwIJVLOt52760CqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4723
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

On Wed, Mar 06, 2024 at 11:36:40AM -0800, Lucas De Marchi wrote:
> PCI IDs for XEHPSDV were never added and platform always marked with
> force_probe. Drop what's not used and rename some places to either be
> xehp or dg2, depending on the platform/IP checks.
> 
> The registers not used anymore are also removed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> Potential problem here that needs a deeper look, the changes in
> __gen12_fw_ranges. Some ranges had comments saying they were XEHPSDV so
> I removed them, but it needs to be double checked with spec and CI
> results.
> 
...
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 76400e9c40f0..4f1e56187442 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1536,17 +1536,12 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
>  	GEN_FW_RANGE(0x13200, 0x13fff, FORCEWAKE_MEDIA_VDBOX2), /*		\
>  		0x13200 - 0x133ff: VD2 (DG2 only)				\
>  		0x13400 - 0x13fff: reserved */					\
> -	GEN_FW_RANGE(0x14000, 0x141ff, FORCEWAKE_MEDIA_VDBOX0), /* XEHPSDV only */	\
> -	GEN_FW_RANGE(0x14200, 0x143ff, FORCEWAKE_MEDIA_VDBOX2), /* XEHPSDV only */	\
> -	GEN_FW_RANGE(0x14400, 0x145ff, FORCEWAKE_MEDIA_VDBOX4), /* XEHPSDV only */	\
> -	GEN_FW_RANGE(0x14600, 0x147ff, FORCEWAKE_MEDIA_VDBOX6), /* XEHPSDV only */	\

We can't just remove ranges in the middle of the table since that breaks
the "watertight" table requirement that our selftests check for.  We
need to either roll the now-unused ranges into an adjacent range, or add
a new "reserved" range.

>  	GEN_FW_RANGE(0x14800, 0x14fff, FORCEWAKE_RENDER),			\
>  	GEN_FW_RANGE(0x15000, 0x16dff, FORCEWAKE_GT), /*			\
>  		0x15000 - 0x15fff: gt (DG2 only)				\
>  		0x16000 - 0x16dff: reserved */					\
>  	GEN_FW_RANGE(0x16e00, 0x1ffff, FORCEWAKE_RENDER),			\
> -	GEN_FW_RANGE(0x20000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
> -		0x20000 - 0x20fff: VD0 (XEHPSDV only)				\
> +	GEN_FW_RANGE(0x21000, 0x21fff, FORCEWAKE_MEDIA_VDBOX0), /*		\
>  		0x21000 - 0x21fff: reserved */					\
>  	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_GT),				\
>  	GEN_FW_RANGE(0x24000, 0x2417f, 0), /*					\
> @@ -1627,10 +1622,6 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
>  		0x1f6e00 - 0x1f7fff: reserved */				\
>  	GEN_FW_RANGE(0x1f8000, 0x1fa0ff, FORCEWAKE_MEDIA_VEBOX3),
>  
> -static const struct intel_forcewake_range __xehp_fw_ranges[] = {
> -	XEHP_FWRANGES(FORCEWAKE_GT)
> -};
> -
>  static const struct intel_forcewake_range __dg2_fw_ranges[] = {
>  	XEHP_FWRANGES(FORCEWAKE_RENDER)

We can drop the macro here now and just make this a normal table like
everything else.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
