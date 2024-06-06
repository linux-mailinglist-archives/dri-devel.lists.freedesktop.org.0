Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA58FF3AA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 19:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1590B10E159;
	Thu,  6 Jun 2024 17:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMFEAPKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365EC10E159;
 Thu,  6 Jun 2024 17:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717694783; x=1749230783;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aeZj7/ORxIPPIvX1Mozpk4aopUxR5DP6VRwrEOcWV6g=;
 b=fMFEAPKys9HhgFdCdT8ojAqzPKJT8ije+N6jzMeUWvivZgRfZs4tugQP
 9jrM+vYQoOQlfbw5rAbdcRNyXqi+7hZQTaASovZtTZq3oDC4dHi/LctnM
 52DKCp4OdAiPfa3h4eorSu/GYVCLkSIQoIC9QdOhubHdOYKWlMWiGv/A7
 lZ7F0LCh6dpo5g/o93FnPwXnp5JhhADdMOYWcp05TpB8R6UE0OxjJJBck
 wMmwFXu8/9gtnOb6SPMGfvCfe2ycrjMwgEEz739//k4Cif0d3a6c7ktnN
 WBa3GQaOPmZklznNALspinhOB+p1cr7Iz3kg+Aj5ho8/X1Fy3KRY6gCfe w==;
X-CSE-ConnectionGUID: PIt0intATBmPuzYHMOuZ8A==
X-CSE-MsgGUID: I9pM4u2JSuiOTe63E0fm8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14565612"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14565612"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:25:31 -0700
X-CSE-ConnectionGUID: 9cNLORL7TjSfkjfAnEgR9g==
X-CSE-MsgGUID: 4efz5ptZSUqo1bg+yzoijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61249490"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:25:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:25:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:25:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:25:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:25:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBPRvjZJfbsy/218XVjHGGZhqO2pVNLFmt5GiL0QQ9/osEB0ZctfbUs+cl21FkpBu0yaQecxd44BuwcH42wPtQYyAEkyHg8gVRPfsDaC7CqlmXmzNmYjjNBaB05yahftAuXFv2novtf4au7bjRyqxUFK2TLzhbrjFM2zADFgJwoihJhZX+5uvfhwds15vG0c0GNuxU4GuFdo8P2pvGqaR49PzP3hr+vPqID9UCNzikRV2WqY+SIB4AxlG1bPF9rSpDw1K8sDMeRbYaii4T+pon79YwqUnMvTc6Ro3LrlC1ifs0XTf8vP1jJyNuGspwIbibYVuxckbiqU/7aNeREzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR8umxfN8FdZCpwmQ7wFyeBDBSNU3ILQ6K7EyXhfiTs=;
 b=dytUbne4wiOZVSOA2y7iapKiPf89Fg7pA2ppF2rKN1ZOK4o5xxBaaLDpXZNx9qxRN3RTrTDtcRIRMD/jcSZRopa2WLzcSU4Ye/dWLBEeyWy5/vLXRIZCovX25rfcttqqdQEffzQpgGthRWbLYAhUvz28tLtSKlej78edDcm2SurIPlfqwPBZTT6ekH8blJeCV7H9zqY0jEnTphXXaYl8i/ViPIbD6I7ixR7aaQuWolidY/dz4vugB20nbFwD0ice6aL7llm40EqSoSAHYAq6VgtMqxx+cnfSxMkgU7QH3OF0bx9z5pGoLM3Fes+c8s+lnBHG724bDhB+4E5hS8gn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH0PR11MB8191.namprd11.prod.outlook.com (2603:10b6:610:181::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 17:25:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:25:27 +0000
Date: Thu, 6 Jun 2024 13:25:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use drm_device managed mutex/mm init helpers
 in GGTT
Message-ID: <ZmHxBSZBi2vwQr1L@intel.com>
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
 <20240524133518.976-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524133518.976-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0041.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::16) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH0PR11MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b398b2f-dd2b-44d8-8fa3-08dc864da811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FYm5U1POQE7w22bHQkyFrtp8uKVZJK4eY8h3dQSIkwnSbsETMVZSIs8WFp?=
 =?iso-8859-1?Q?YbBGg4Bk1ZN+xRNsJ3NlITdPNecsWRhwcAazDyMVEEVQfE+L2BIwujoRBz?=
 =?iso-8859-1?Q?rKGx/9g6EligPBzrOYFHWF8pNbsvkkj5uoLLw9k9SGxf4kbHsslQjWLalK?=
 =?iso-8859-1?Q?oK8Z2dj2Jg/+27kuMX55pLMmwyCR1hFbPYCE+LwFtcfG57csQxRNcB/4RR?=
 =?iso-8859-1?Q?IdhM0JZBc+L7PYVBHC8a6lyAfW1YwsUyMw1WoYPs6JGe6v07RIv6jHrglA?=
 =?iso-8859-1?Q?KTSRQwtqWnIqdzpIxjS3AKSxqSzY91oJYOI0VfZW+74AcFgr6WzmsTsPgv?=
 =?iso-8859-1?Q?uhp2OVeDDdpMDFfVcfj7ZMNU9TCiGl86m8vIq/BpJqtwFnhQ8aw8Q9OOJC?=
 =?iso-8859-1?Q?DucL51WE/cL08hl2vEHMBP+iGqNycfXjpe/vVX21nvdVnaZQ/Wl7NkQ7+q?=
 =?iso-8859-1?Q?+iVLd3vOf7b3acZPbo6C4EGUqu5rUXEan37E0H7fEZFdMDuBlNrgYXLTmm?=
 =?iso-8859-1?Q?+rvDJbGzY67euu/ol2g1h2fSUjr9ufY2s1ZcpUqOpFw39OBGUI/V3Cy0Sv?=
 =?iso-8859-1?Q?gq4UV0r22x97qsJhjlHg5ZweYExnWGuIAPZlvl4XJGKcE4f6OcWiLHDv+d?=
 =?iso-8859-1?Q?DFYUL7sIykdZmpgEPfc3JvXys7EUnBbmxuz9oXVohPeDJ+Rm4d9gA3GhzQ?=
 =?iso-8859-1?Q?sv3NPjZavLzks9ytDiosViRlqcTEWOsMrmTstoeSYvmTYeY42enL+uA8PX?=
 =?iso-8859-1?Q?6UvE3ySvgdGXYTZWk1Wb/DM0Sz2OyJ00H90wz9/m7iBpDZt1eAuc40ol4B?=
 =?iso-8859-1?Q?D5MhNF9/V+yrFSIxfVYDZaZfmByEp5AS3RkHIVDS6LzoQGBx1nrvFWWLFn?=
 =?iso-8859-1?Q?lLE6vADxyl9uQXMXT5g5EYdhx9rxCxKbBrrwAGqq2VQ0bC4AJpmSZuaBwx?=
 =?iso-8859-1?Q?tGaGiI1f5O2th1ff1rMN9aWsT/WMW2n43PjWW/DKsuFevvOsOPuTJbhp44?=
 =?iso-8859-1?Q?IBE5uOQ+ssI/1Rv4KDDB1fThAjl2DUN75K/9lrVgpiUNNd15VDLW+c6/im?=
 =?iso-8859-1?Q?R7Xs1pXGuITfMUi7/J2Gc2hHkkrw2xmJ3knNnfV2QYXofrohRwReuVD0jh?=
 =?iso-8859-1?Q?hUUHrbuXqewJdt/EvDA4dg6UmrWhU74ilXVI9beH/h7F0SNvFq/iYLjmek?=
 =?iso-8859-1?Q?IwW//XWziv27nxlc8wKbHDw0ovqIWI8Bv/Y0hx4jpNmrNk0Epn3rDaURJ2?=
 =?iso-8859-1?Q?DtKlELsXiWLSvOxrWv8/JF2ZQphh9ZC4/jBM5RXneKFxat8EZDBNqTd9IE?=
 =?iso-8859-1?Q?Iqat9xTmsKbKV+XRyi/Wi9fxyaQjbTIHY4apxWu5AVTjmI8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?r8+MlAXwUuVxXWT1C+ZQrcqzLOHCdKSPaMnvRt7QQHydIbY+0urW3/By49?=
 =?iso-8859-1?Q?P/fX0VAEIBx7g4blm3xfGvB9sgx2kJzRWYfsGMSYwKYQiBvDUHlcFctEJE?=
 =?iso-8859-1?Q?bqCOrW2YpJsBMH0VPCVFgz5wjxUcKrDB3ass8hsBnfY7QYhkvjbQ58MZxl?=
 =?iso-8859-1?Q?srODKRUCgK/dDLavrw44GpLNejwUq/XXDtMTejiwccCsx9TTFr3JPdtzaI?=
 =?iso-8859-1?Q?gOZ9mdfFB1dj36Bcc678Asweol/n3Ufm+yfN75nyU2bii2teL2p/X6hov8?=
 =?iso-8859-1?Q?5XnMdqw9jkyKcUDvo7gd/Ie2hUwfck24xVylPmPSK1AUYAiianM1OuL1lx?=
 =?iso-8859-1?Q?4jRH5NrsRsWMG84KAQ2jlIcAYyvzOoXfOdDW0fZJ+Jhfn6ijt7tFk+PLhv?=
 =?iso-8859-1?Q?6VQlB1obHYR2kMcH692n/SfmmGtpAGzJ9zzca1QycRkQ3QA2CA8hKbCRpB?=
 =?iso-8859-1?Q?nlURtxKovFkMyyt3QaRdq7q4Vxg1z8vylmW0SVtpbZQ+BdTaTIYOmo3VQ1?=
 =?iso-8859-1?Q?hmee56yiN83OdxpXXHU1rAShokaKymiKToBC1aLOw8PNoR6G8MJhIf5PuU?=
 =?iso-8859-1?Q?6QVpEa9A77QFfNA4i42cLt1ie1BOolzcw+fyKZaHJ2srmIhJk+0Bffxb1M?=
 =?iso-8859-1?Q?GjifoM02vuHD9Je9wxFu07cHRHXDzrB1QiVCJDo9CO5ihqmuNOcVtGnnK6?=
 =?iso-8859-1?Q?j0zsa4l2MlLO/lbBTqtWJjT8dj+CdKlU+RrXI3AgSNuiXtyPmFALYRjlgL?=
 =?iso-8859-1?Q?IVcshKKkl2cyM6BAGWmwFKsmgrPlwKFuuEKk2kxYueVmrXFx+wPEDwMsgj?=
 =?iso-8859-1?Q?kxPw1SoqjcNjJFcMbMsM3t1/6NCY/w4Z0d0eLiu2syWCX5Aolo8+TfZaQQ?=
 =?iso-8859-1?Q?sU2ZqMH5qx+N2eisLSpFAk+66iPahUUH1F/6WVHclsFH6ms9wJajDGykGw?=
 =?iso-8859-1?Q?/26CODLUhUsd1rUFt+PHQvTPobBymFHJFOxCzLBvOCMFr486OgablGYny9?=
 =?iso-8859-1?Q?C/0Rj3Rb0ZT2ji7k1zBykP48R6IOhOjgQ9M2wwoX35acKAzOgPazNbAYBA?=
 =?iso-8859-1?Q?jn0IQirMqfTxem4Who4b02IIcO0VkJPIeCAmbiTwcPaeNn5Q2pTEHWEbqu?=
 =?iso-8859-1?Q?gycw6o2clVpze6fn1RZPwTZM0ziSksQD8zGtlAda50L4tDyNMviqX+oYyY?=
 =?iso-8859-1?Q?K6YV0JmBQYgfvbdOKqph+2rRW4NP7ScFcCeJeaLHPz6hahoqglHImo+Mcj?=
 =?iso-8859-1?Q?B9BSs0ocZmUTjI098DFh26EO24tT9EgXXS43pqnUPa3q6kyK/cFKAIlssA?=
 =?iso-8859-1?Q?yIFHuhDZKssgHObDZbDJp5Pt6pptWVzn7kOerfqEZ8XUmfpec5zWpiuT3J?=
 =?iso-8859-1?Q?EFSlhSfXL5uXjdfbTNNJsCSNxIL0hWd9Fys8F/JGggM4fj+UAJLAtcUKzp?=
 =?iso-8859-1?Q?9yjH7uiZAIt63B1F/HC0q+he9k2StCOcEKCaV/P6U9i/MWc2NsldQASYGR?=
 =?iso-8859-1?Q?UMBP4TE0rt1MAQc03PtLA+05cQWHa3nRhOOJlTkXQVZbTqA7ZaaQUqMArE?=
 =?iso-8859-1?Q?8UFCUHVnEusuUKF6hDjcrR8CxA9Lo59z8K0fzpkJ2Ikq9lzXDyJXoqPW6s?=
 =?iso-8859-1?Q?hI1FRiq3pqQxB3kTXvrFXXr0wUVp4MR3v/HBwcTDs/3FXFagsy2RcTQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b398b2f-dd2b-44d8-8fa3-08dc864da811
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:25:27.2615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdahXJUfNLEe30F8TBeTyp0boEu+lvqGXruhQsS7nyA6VLrHbUNqe3bJxgEDlXWSgHqrafr3IHOOGcNcYt7P5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8191
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

On Fri, May 24, 2024 at 03:35:18PM +0200, Michal Wajdeczko wrote:
> There is not need for private release action as there are existing
> drmm_mm_init() and drmm_mutex_init() helpers that can be used.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 17e5066763db..7c91fe212dcb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -96,14 +96,6 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>  	}
>  }
>  
> -static void ggtt_fini_early(struct drm_device *drm, void *arg)
> -{
> -	struct xe_ggtt *ggtt = arg;
> -
> -	mutex_destroy(&ggtt->lock);
> -	drm_mm_takedown(&ggtt->mm);
> -}
> -
>  static void ggtt_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_ggtt *ggtt = arg;
> @@ -141,6 +133,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
> +	int err;
>  
>  	if (IS_SRIOV_VF(xe))
>  		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> @@ -189,12 +182,18 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	else
>  		ggtt->pt_ops = &xelp_pt_ops;
>  
> -	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
> -		    ggtt->size - xe_wopcm_size(xe));
> -	mutex_init(&ggtt->lock);
> +	err = drmm_mm_init(&xe->drm, &ggtt->mm, xe_wopcm_size(xe),
> +			   ggtt->size - xe_wopcm_size(xe));
> +	if (err)
> +		return err;
> +
> +	err = drmm_mutex_init(&xe->drm, &ggtt->lock);
> +	if (err)
> +		return err;

My first impression here is that we would have a bug here if drmm_mm_init
works, but drmm_mutex_init fails, but we are likely safe because the
probe will also entirely fail if this mutex init fails.

> +
>  	primelockdep(ggtt);
>  
> -	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);

But my question here is, why drmm and not devm for this ggtt case that
only makes sense if the hardware/device is up and not about the module
or no reason to keep it alive after the probe failure or device removal.

I know that the question is orthogonal to your patch. But if we decide to
change the course later and move this towards devm, then we need to
get back to the exit function and perhaps regular mutex.

I mean, really nothing against this patch itself, specially if we are
confident that drmm is the way to go with this ggtt. So, I'm not blocking
here:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	return 0;
>  }
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> -- 
> 2.43.0
> 
