Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B45B1EE3C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 20:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4335810E032;
	Fri,  8 Aug 2025 18:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HO2Lrbh1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474B510E032
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754676497; x=1786212497;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bpg8QqBot6ttqOhl+ruiWyM4GU0YTeS4NDUpx9jqut8=;
 b=HO2Lrbh109HtXxWrY4dTFR/JWI4mMqmExMdpa0KT/AiMVDiudQDwsfNJ
 WzMWeIN7UdiSWOrm5HzkdTL77z9TEJfyquvDT4TCIxlTO7OwVCjbmION1
 A+QCDJUdZKFK9RTGSV2CVtTbVzZCFj1dzCB2Ew7CW8lt8RgtNziP9CYNI
 KVMq6XhSib1swkqeHtHbZsJjK879zm4Du8XH/Keup2GUkcWQZK7M6ZOro
 PFiGkgHWln3gThAiLRz417uU1Vvcmp7hi/FwD6NxLIkSrJO7wE5f3NcqJ
 hfesqx2/hLW7OJTrkKEurILTmnO4XrhFrF6yy48R2Hh1J+PiJJeXIkQHs w==;
X-CSE-ConnectionGUID: 21DAF1zeRcSG2V4PeU2WfA==
X-CSE-MsgGUID: ARQwq+CzSWivee18Wr82uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="74611860"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74611860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:08:17 -0700
X-CSE-ConnectionGUID: 4lBF126cTYWARl8nU6vJ7Q==
X-CSE-MsgGUID: XZ6V+MnpSPWM/0hDR2rZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165393098"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 11:08:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 11:08:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 11:08:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 11:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X78uwp7z/yNwrxCmXqOKKOhuoY4j8ixvwLEtZVk3btEfafqP+nXHN59v1WricpoyBPIw+oKGyrM0reP3JnvBh+hAVXOwyeUwmoaDcNvGSUVQkamXKjo7aDyHS76uKRAX2G4kMZSdJ13gXz5UNXADgo41u8xaZP8Z3BPqemdbNlhEZtKRuy8a7ePuKFZt/wsGlAQiFsLV4Ox/LXHHwhgbY0/QOsr8jW+zoEUUggG1zpmg/Kvp7euGWcb+ymIPqvC+WebcS6HJCJfo2bIEVers4GIwxplNqkvYBMwZxv8F/CWODPtKbJ1tLW4+Ug0xYRy/uyBXS0YdQ1YKbtn5iq5gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QIXjeX2aXaRGt1XMp9uXsbXZvL3Bv4VC42oDH1dajA=;
 b=CFWVRwhTN3AsEZgirPLQzKmSXm1V5XsjXjaY7lM+nKwqpft4eK3S8foqDFSXDqQdeem2g8jaSLoxGRlWG7BaLsDf/yiEE2pct6cPDqXW7/0dUVcSDTq+RQFpSoyCFw0ZNnHAU38IVGHW6MZJDnSLS2B5v3xgZKa173WngfaHOgqHtPzN0Uq/k7uWm/nhRO2KVzBV5Ha5G1/Lfn4cykEJcOeccK88Cpp/FBD1zDroF8C8b/bI+uR6QtROH3ARsQ2xqWGzmYHKikL4SXsbm3zVhvF9jxqZgsR7iPf8qhDPsx69mxoBSWDbMx/mke8FnOIv9s+CPZPaoWJkL8YTSsOYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 18:08:13 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 18:08:13 +0000
Date: Fri, 8 Aug 2025 11:08:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: <boris.brezillon@collabora.com>, <thomas.hellstrom@linux.intel.com>,
 <aliceryhl@google.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] MAINTAINERS: entry for DRM GPUVM
Message-ID: <aJY9CfRMR3NFBfej@lstrano-desk.jf.intel.com>
References: <20250808092432.461250-1-dakr@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808092432.461250-1-dakr@kernel.org>
X-ClientProxiedBy: MW4P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: eea60dba-16ed-435f-f5a1-08ddd6a68a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e5R5hvlE4XiH8EqS6T7DPMwi0/jJ8oLVioZoAnCso6BTBUvw6NEcYzJLrf?=
 =?iso-8859-1?Q?OQrq9I1zq4SsXqrdt3ebptJFuvu1cmHEDo3+Q/SN5ptdB5zzweL8g9aus9?=
 =?iso-8859-1?Q?vY/73zZIUjsG9ersp8f+6KnPi0rOAB0ZgOeU4r/U3USB/ky8h7so4hgoVU?=
 =?iso-8859-1?Q?xT10EHVItfCZzEVJxH2rkv7Sy6nsNBaOy8NEAeCiGZXIvz/jMC7jV5qOGf?=
 =?iso-8859-1?Q?Dy3AE2sYGsyu6P6xV1D6jQcovBSWFlXbD8a4/00NF8US4+sadKou+QR2sy?=
 =?iso-8859-1?Q?l0u3i/N7Gsw4NqKOdR6jg8n/2ZXKAN13KHtPIQTSrIOturASOXSVbIEvEf?=
 =?iso-8859-1?Q?lc/HO1PE29hEfuCwxaqFo6syFnTHZz8keJVvyjbge+9tcl7WraALps+2AV?=
 =?iso-8859-1?Q?vtJqVW43NoCqRACCwGgW3yHPUmcG0vcL1mh7OUKKr3N2hvLdkJjpCJVdbJ?=
 =?iso-8859-1?Q?CEXLdHGt7VW19q/zXfsMY6qfWN06bU63teXQzoBahIqqbj+wt0f2RDI+45?=
 =?iso-8859-1?Q?4ltZujrIdQiG4AeyoLAIU1L+B2bgHA0qH8MhNDSyByRI/BqMkttyk6nm0r?=
 =?iso-8859-1?Q?anNSHHrivKEPFVRRCBxrMJcNE7kA4BnXbgq0Py6O7S8TAxHgrFB90SF+sR?=
 =?iso-8859-1?Q?Lr9amWEQ/Q6puavb1inoan4xPN7cqkMXX8IAatDx+9o4Xzas2MF3CAqQEs?=
 =?iso-8859-1?Q?WQM5YdVshlZjCE5py1l6we/HRn0eN24UQ/ZmEWzhUq5PqRvRblzJRmWQXP?=
 =?iso-8859-1?Q?chqLWho0pd6PAGb3op2qnoAAwMKRTNOrLoX9yKgjvJxROJLDSUu0hHfuWX?=
 =?iso-8859-1?Q?+8gH9YNtz0A/n1G2TevgkjkOk6uYMbQXarQf4KA9h7JGXc9zcV1sTj45hI?=
 =?iso-8859-1?Q?Q/RshjtQ9zzYjivTHyxT0rvyMTdSImOvGVjQS1j64QCjZcBmNZ1KlHlYoy?=
 =?iso-8859-1?Q?vIxFo7S/TA26/vD9qpeR/xezQolBtQgKPnAYlNGqe1xdFzZ/2SCv4klHRN?=
 =?iso-8859-1?Q?JaDyy3M3KZVWGEO6fbV3/yS3AhM1Y8WZgB7fY1A6mclxQiaGqOftqMJPrH?=
 =?iso-8859-1?Q?tHzgGqv8hTMShnmydtHAVvcO0dvtVZJOa4/uWh427eSURluRMuKOEV63aU?=
 =?iso-8859-1?Q?KU8RYOd8OK1CcnWbhSwCKbKw1INg3mWCfivxCG7igbXAW7kDzg8PVzuTAJ?=
 =?iso-8859-1?Q?OEWppRFOBOkl6gWVeMwP5xAV2nUeTwrG7wJ1qABWrG3umyxU8GB0xcHTMC?=
 =?iso-8859-1?Q?5ROZbMnMFBSpiY6y81l/NdNj6Da9CAOPJ3TRNKCaZIzowbvvODTQnWrCEA?=
 =?iso-8859-1?Q?JAPcILaKRnvbdQ+WpFiwUmvpafRP6g/01Wpyg59zZrckPK4+tXfIS2Kszz?=
 =?iso-8859-1?Q?7jQ9PhaXzfECq040n85x1Yps8+Q8jGKax3FhTHNo4CRuF2KNpxv/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?60rfDUVxmYH4v5VoHeBYKPNra/C01wqEZR5Dg8hURnnTstBz3cyfkqlr60?=
 =?iso-8859-1?Q?XdQzLUi8ttqMowlMqX0zeky57CyCQV2azKIlDEzyZER63/5/1C1lMgS+C+?=
 =?iso-8859-1?Q?bW9PMoAvW+5eoLeeTDptimMUYlyAuL0CETv6XRux/MI7GdpANQbNF9gQDE?=
 =?iso-8859-1?Q?0KdwO2MidsGydtL8f2gaKWs2og8QH5uQKG7EgumZBPeH1uutZV7dk5HCMr?=
 =?iso-8859-1?Q?IpUH/G1+q+TaO2l5J6QNkwfQXMvqGgcfI65iK0OV6Q/UDLwHgbjGQ7FaYc?=
 =?iso-8859-1?Q?/8rL/Lg21hLVhZd5J+wO4FZHL15DinrJRYziUK/wllgjlodk678Mm7ze7F?=
 =?iso-8859-1?Q?MOa42uUKWRAbNO76ZOL2JyjHzVcz8cxaysPG2V87pWdpEHGdR3NyXS8uBj?=
 =?iso-8859-1?Q?llj9VxszqFuadEVqVLI4moQ55DSBd9gcw+KCLwO2408Xk125YQt/BmmkRO?=
 =?iso-8859-1?Q?A9I68143FiO8EOd9OCgw2VcEtZ1srKfsjOniDQb1ExxFCU9LiAzAf9gmly?=
 =?iso-8859-1?Q?CBo5zbpEuf4rIAoEwM2barCnt1P1UGgvaAOMCHG56b7UHxmpzpsffCrC4d?=
 =?iso-8859-1?Q?f7uifwOgGpi1XBS52FqUt8yxTXkbv4GXZT1avqnZS36CYHmYcadcsTlSPw?=
 =?iso-8859-1?Q?cfZ1/EdbOOd9ysSRfvTzqCpSwuwvOkVVw3kc8ZHTYa7mk4UueMjTm1o1R6?=
 =?iso-8859-1?Q?WF5fpIvKFN6t4WunUU1x9EBrW9I0hJWEKSILcR+eftTjrIfNJg96JVwLz+?=
 =?iso-8859-1?Q?7Qr0EzvKS6Sb2CvAAEk9E0Sap8hv74PTkt8VqwrSVV0PSLHR+/uoyUVPAc?=
 =?iso-8859-1?Q?0BZc16ETczQXj+27n5RzWL/F59bvTGXZokIJZlRjpghGzcL0mmiPCleB7R?=
 =?iso-8859-1?Q?xImbCfedTbc8adt52VMFiojRj3Z9K23P5cUOMLacf5QiGtKR8899JfadWS?=
 =?iso-8859-1?Q?AyXbOzN/uiCRPzT8uFHBPNqmE114mNR/jOJmlRA50Gu5zMLiN5hrXvcHhn?=
 =?iso-8859-1?Q?LPP4pDBwoFQ76TaZaF8NoU38vx3Eb2y/5b32+nFsK49AXHLrwfAqNygePk?=
 =?iso-8859-1?Q?fldKj0waHoYV6B6dyhhTEsRWF7S8Wtt0csi4oMkDLK4uca5Wxpo+Ns3G7F?=
 =?iso-8859-1?Q?B33v+dsQrqaGz46h5ZKSutkfm8tmUTrVG+tAdAB4jOUwzRXmP/r+JF3GFe?=
 =?iso-8859-1?Q?YWvxL3IbEuH/FjNhgVGOI/2lQ0zZoSNhUNEZPtXBDmEHWpr4bsoCGDEm7e?=
 =?iso-8859-1?Q?ia6h8O/U5Q+nzm1yXN8K4Wh4NvqEU7gC61UEw5aR7CfKf9nnER8fTmpTEc?=
 =?iso-8859-1?Q?vRnGM1EDFSzukSSr9ON62FyKuNa1LIiEmRlIK+eq9sjB9SWCd6myMucKGC?=
 =?iso-8859-1?Q?GPN/+nGVNzOvnUpOyUpuO6VkACFUYbkWDtAhY3JyTjeM1+rxyfmZ1cWWWt?=
 =?iso-8859-1?Q?bGoEeaSHFEuwZbd4QQ2ZibDvZ4MmzH1esOKs9lVQqK7FuBnSDQhh351ze3?=
 =?iso-8859-1?Q?NwBA5CO0MLoeFMtZkYliAoyo/B8oIQxanBSkOEYDgbGj6I+vkKKXhX9Scp?=
 =?iso-8859-1?Q?apkjGUQig0hYSip8hIId7nyp/djFeibyBG+N9rL6i/oeJDuQCzHk5cCJVS?=
 =?iso-8859-1?Q?LY4gBsuKwHA4tibdnd+MIfXVaFRS3AC13iUORInrA0FQOzRbkYXGjQXg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eea60dba-16ed-435f-f5a1-08ddd6a68a56
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 18:08:13.2150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TMHq5k8eV/nTHa1xtGaPX/vEOlwoIiyFxvyjtErKikF3gVdGbUdA0A6NrYWKcOpmDQHF//5r0P9WCicHk0DDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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

On Fri, Aug 08, 2025 at 11:20:49AM +0200, Danilo Krummrich wrote:
> GPUVM deserves a bit more coordination, also given the upcoming Rust
> work for GPUVM, hence add a dedicated maintainers entry for DRM GPUVM.
> 
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> @Boris: I think it'd be good to add you as well, but haven't heard back from you
> so far, hence I did not add you to the entry for now.
> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd62ad58a47f..ea42a43851cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8426,6 +8426,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/scheduler/
>  F:	include/drm/gpu_scheduler.h
>  
> +DRM GPUVM
> +M:	Danilo Krummrich <dakr@kernel.org>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
> +R:	Alice Ryhl <aliceryhl@google.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_gpuvm.c
> +F:	include/drm/drm_gpuvm.h
> +
>  DRM LOG
>  M:	Jocelyn Falempe <jfalempe@redhat.com>
>  M:	Javier Martinez Canillas <javierm@redhat.com>
> -- 
> 2.50.1
> 
