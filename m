Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40E95DDFD
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 15:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C40210E03F;
	Sat, 24 Aug 2024 13:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RaM2r+Oy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EEF10E03F;
 Sat, 24 Aug 2024 13:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724505035; x=1756041035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jAjd4vBG0OXA2Wn8Dq9P9dBlsDpmPLWnyluoDfA6GUo=;
 b=RaM2r+OyT7skqHm64vYDGJrBIhIlXP2lD7kljESax2PxHXzbc+IyeEVb
 KqyVnoSIyNg5MFaYfBXTNeYir0/lmQi+yz3F20Pg/1ReDFddYMiyn3D6I
 4n9vI9gJBgJd69rOupAwuy2MHX6r+cLH60xv5FFfZi4EG8nsrDW9o8WVC
 o8HRUatOW1As2lkeREURlKGn6JdEHmLTBW6SBjyMuLOtT/T30DQP9FhAP
 UDTszM/Z141kmY2SF3MaOinO3NPA+8fo9oDGrA42fu1/tq3YsxMKpYbgq
 uEpc6g0KoFgN+3vYvL+yYPH/3xJBCoROYYrTeAQ8bHHqFaQyHiTKjwGqK g==;
X-CSE-ConnectionGUID: jl5yveKhSfu/F5wmTehqfg==
X-CSE-MsgGUID: Gx4LvfGMTIaHis371BE3Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34352805"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; d="scan'208";a="34352805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2024 06:10:34 -0700
X-CSE-ConnectionGUID: PdPYB/PcTaijSJVwZhOzdA==
X-CSE-MsgGUID: P2n0gDyhQLSkd5I+1K4TYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; d="scan'208";a="62370550"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Aug 2024 06:10:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 24 Aug 2024 06:10:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 24 Aug 2024 06:10:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 24 Aug 2024 06:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikN6f9K9bS3kUjspK+6PJX11RIoZnNwAsYIJSve0dFH3n4v2urbHZxbL8c6ieUhimAWSsvfNgD3r6KP+LeQ5tjer1YRMEz/V46bCxT8KCYeOzjqXrALw8lm9hAUTE17KIGGB9v9Gw3aBPyegL72wWR18CVBegCwn91IBK2QgHy+flTQipd6/uJa8AgI+TwyeS0dw5DbCNyY9KfI8Lsekb6uH1WItR6HbUf3gv3pq9WaoiVPcjbSt9CUX1wNLYQAWWRULfv1lkPp0ncx13kyYkUfQCLZM0UO0ZkWFKOc/S4uVxIBL3fJ2UfHwMfJGkB+u/ebtda7ycgWv2ERpFbfNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwF9SH1TyBc2rcMa05k6ttK7kG70fq+hoFZKdqss6cs=;
 b=QjA5n6cFNhPfYsge8KOY61Jmihu0aKn3z+9NbXeByCEbg8bmRf/Y3plJz/QBChxU403kp5mRTljXlfzDToAJitKv6toapUr6kzV2hhcEnX17kRc5ZvhQCgrUKnRzu9PQj1/vYc218kECUigQ+C2O0FPBqezF/Ty/DVPxjQlA13hq8XV2yiZ+zBEQSMnJICRFSzBnQWaLZpFMan2zrkQE0+0tTMkqgSYVHEs9lGq3xi7oLg7bEGU2B96rGtFc0uc8f2M4cClt07/ChUMrFxkbxaYCe8nXaRW03DZy+kwsEvF4mtm+PxNE4XdCrct4Dlt//A3v7uMbMocQAcYtmP9VKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 13:10:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 13:10:26 +0000
Date: Sat, 24 Aug 2024 08:10:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <llvm@lists.linux.dev>,
 <patches@lists.linux.dev>
Subject: Re: [PATCH] drm/xe: Fix total initialization in xe_ggtt_print_holes()
Message-ID: <dkr63qrs6ij7ntowx3q2pattve5ty5nsvtzmd2n5ivvairxy2w@wnviziertbg2>
References: <20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-v1-1-12b02d079327@kernel.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-v1-1-12b02d079327@kernel.org>
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: e26ebd02-7965-48f2-0ddf-08dcc43e1e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mNHECbldweCNVouWe9fArjlb9iP/Nuqi/ceTHtM0oWus6A0Y2hzs40Dx7Asd?=
 =?us-ascii?Q?6CwP4apHbTL4Ch/5l8i1UcN5fMBO46vXRnT201V3TmZuqsEChPOFE4mLd2QA?=
 =?us-ascii?Q?CvulyCYaE9zOUscUc2ygc2zbKoNhB7SztrYiqt7Yly3R5bqOVRqHNjPziigO?=
 =?us-ascii?Q?Mp7qejIOPgLOk9AU89i3rh09G7N4tTZEiRJAZRFrYzCGvkH6septVDWAO7j8?=
 =?us-ascii?Q?Sb2L5I4QHOt1v+zy9ssByVT8709IzSV4RiuJnHaY1nYwv8wjYCXDRp7Y8M3j?=
 =?us-ascii?Q?xs7lmQRKwMn4RXxrsQgbPXdkcavne5Y1lNSRwe+ff1BdyI/Wk1sfgSvYIhm9?=
 =?us-ascii?Q?Y+rD70Tt3FXcEvjo1VdUmqnrn0PZwQZzie1I3oPxpGE0Yi5kih3uC12o061u?=
 =?us-ascii?Q?hj2vBCRMPQy3kYgjrGb0qHtuP/DGPnjF3NyNs7hUfZVKkRAwJSItqO9k0Pb6?=
 =?us-ascii?Q?sdP00muP1r+r7vFEuqo2g027VEii5bj3HiSnt8VdcwPc6Mk0V3RhBISk5qz6?=
 =?us-ascii?Q?cnqMrJfckBeokFwnRV/NBvMFYVVT/Zlmq1eRWu7kwe3RXTkm9fBCn8LOYPCw?=
 =?us-ascii?Q?QTqWUoIn2SVQt5Kf7PlHNq2NmrNykbV5qBBO2oH5MIBiL92MquHI+TPZTF5m?=
 =?us-ascii?Q?EP79tqk7FgNdwEiQNe1Pkdj+1hwPlAAZG750p2VakRGUIZxuIVo0wkVivYHY?=
 =?us-ascii?Q?JatPQTSdpdoy2MhWFjBzDJ5/0I77a9eLaHI1fheZGEwa4K1VRj7hu0i/hJ7w?=
 =?us-ascii?Q?57A6G6iliPHKi+wZxAptS1kQbAf84IcbtgV7pPI43r2ADEcWxRpxoMxDyVwl?=
 =?us-ascii?Q?EEkeJQYPalP/0ytGbKn5pt2IsYopd/0DvFgEjDo6X8tgTWDMdsk5Cl5JdAQl?=
 =?us-ascii?Q?OhsPlKa9nesbEpzj+9S16nhPt0y7oXg5mw654+pZR/8NlXFm7g7juqlgUWCR?=
 =?us-ascii?Q?xVDb0b8apU6EzP2ddBiXCvbJNcI7bUS2Hg/X2j70u/mTehAKXRpoQZ3bxm+C?=
 =?us-ascii?Q?s9Y5/kKJuxv1LgZwwlb+Uk48d9ajrlsKFz5PS0nDuINWJkDOBiFiQo3hHKdQ?=
 =?us-ascii?Q?5pLGiblHkkisqrl4NgsNJzXeWSNvXX5bpKpZpvGH4GI3iEA7pTwCSqvVipl+?=
 =?us-ascii?Q?ApUgvDliALc625TFjWa/yurdK04wYEDWiBhEsRIIHQcK3zSKZhyhmEFCK1/B?=
 =?us-ascii?Q?+Z5uJdY569m6sF4PueAMDiwramLCtqtB+yXFfhCwNtrN3R1AnD1XjKPRJu4O?=
 =?us-ascii?Q?AW0sTRWVOvWig6sqeXlX51/5zJtFX7su/2cb/oPgyOkfuid1u4JDkbFMcYNX?=
 =?us-ascii?Q?R8wNDONrBk9GGM1CQj/J2mjKIFiYCCJcW2FFwggqUgXKxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Ap6mGxPSIf1NGTTp7glWUewyPNO1aiLF8kO6o0+PO9kx6bV5PYqQK46C0Pf?=
 =?us-ascii?Q?Bm+xDT+5lLLrHfllCV+VDG2khVmVr/JUvrQEpYjxtugrdXzacBpCy3URxCVU?=
 =?us-ascii?Q?O8HnuDifZ+gstWr9D2IgDhaKmnq8uXXdFgptZ3SmNWVhSICB/aYAP75o4D7T?=
 =?us-ascii?Q?KPZ+pnm9Jh+feBXmYtlJQ5Xx1BcQEdmG4+yV1k6U/bp68u5sb8LZprSnE84e?=
 =?us-ascii?Q?rIM7hmwZkoA/XByS6xP/6lIoLtvfM95vQXZ5mh/+RFIxRTKIsw9eHZw+loXX?=
 =?us-ascii?Q?jQjF6sCwOP1GeaKYTUn3cf5O96vROlYNqQ2rbWrhZgvUAFtMUAa2sust2N0T?=
 =?us-ascii?Q?b9MO9movA2SEahDaz8r5RTmMI2ivvwTASeZfKLTCZWxy0KAHeCK5yIN/bQEt?=
 =?us-ascii?Q?owqz7v1ac45Zen+lClEx+HVbapkdenC+l/i3oRl0x1NgCX0hscKQIZk7Xitp?=
 =?us-ascii?Q?sQ/Pm1Qp1e2E/5fx2oV8laenCUq5r6b8lP5nIrX4XCKFANxLuYV5SxpP3qwI?=
 =?us-ascii?Q?33+/eiVfmC6eBPwxgENg9ZQtdPQPra2ADEiteyqUTNrSlnLYtZrIDiRmIJym?=
 =?us-ascii?Q?shGLgqh+7IOHgSlnXjloCMcv3zmLPa6MH68i4VfgDw5qZG0oHWX56u3j76Jh?=
 =?us-ascii?Q?3+UgkRZuKpB86U7FUV0N6hH+6THC03x1HMjXzJ7VfLrAylB8C+ZpZ9T9qSWE?=
 =?us-ascii?Q?UwXaCYt6ZIaEa4l8mn/3+kgMp79aYK4eX81kJdZBZoEgJCw1yXQtCEOx+b++?=
 =?us-ascii?Q?gPvLM0VR6/iNmk/oB5bx4zVApbZo1PJXUrdYjst5H9b9Q56MPXxuftHCSXZI?=
 =?us-ascii?Q?qD9FS5Ijlt/5fwjwXuRIuyArOBINqu4KtMuRpgb5MCo7RejE1N/XczVTYWDr?=
 =?us-ascii?Q?DsKgCcXqTQUVlwSSs4UTQUAJWLpBWRgTPNu1qMqWLxlLHnH8vInNmr0EkqD7?=
 =?us-ascii?Q?0S696zXjqhB/P70IelURbQY6R6Q8zw0ABt2VzBHSKDC+Pq/jqlyCBoZwrKAy?=
 =?us-ascii?Q?i1kTPuiUVUTeHkpmHConILfYa7tO0VuQGeTJVgTiq8VB8hg66UErqlmmLFjQ?=
 =?us-ascii?Q?kyAU52DXB7KCensObyZfcvOrfSQSl0OMuGuuvPHeEzHwhmukM23rI5Ejb4B8?=
 =?us-ascii?Q?yV60c5JyBlBuIbuuaeoRrb36q/7dTBsPDX3Se0Mu8KN+l/uC2CMtjISrrWeh?=
 =?us-ascii?Q?slbMZ5bBy/3aqdJDsguhX8g1yahHhUYiWaorwuSCIXiV1zcZDGeK0GfYPPd5?=
 =?us-ascii?Q?QW3Dl4K+vuAxotYhozB937tSpL+ZDp58WAFg0Imgt1rhXArMD5qnPrM7tdJU?=
 =?us-ascii?Q?wnlo67d75tn0mIefI7Lfr5tYrTKLA1+lf/1n/cJgwpWEkEO0Ouq9MqhhXZd8?=
 =?us-ascii?Q?4b7DJQor6AuD0P/bGFC3A0fYwDw7vjEpGk5pKe25Nh+CRLUypkFXiVGUAGsO?=
 =?us-ascii?Q?TiL+KE1NBGHuxntrReG54AWZmfziCn4ochmIVxjkjvRaUNC1hlyDCucArOuc?=
 =?us-ascii?Q?N9LLIlBxmhmCVk+YpNzktGosBDEacmhpNht6E5gCfwxh8xJP29uJg/SZIjtm?=
 =?us-ascii?Q?IlE1mLwGQl15M7eKHH2d/roa6oTfPbovlcfvcesnxTi3PBLstcqQQqhh/29x?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e26ebd02-7965-48f2-0ddf-08dcc43e1e7f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 13:10:26.0428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFmnZpxlsD8XBIn+Qgg6m/Mez7nc75hY7Qwu+D5+uYUxavAtLdsTyW6XHbGFMINFGcZesDUtkbGCaHJB6rhAbfkJkxBHahNqXEuDtMjhwI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
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

On Fri, Aug 23, 2024 at 08:47:13PM GMT, Nathan Chancellor wrote:
>Clang warns (or errors with CONFIG_DRM_WERROR or CONFIG_WERROR):
>
>  drivers/gpu/drm/xe/xe_ggtt.c:810:3: error: variable 'total' is uninitialized when used here [-Werror,-Wuninitialized]
>    810 |                 total += hole_size;
>        |                 ^~~~~
>  drivers/gpu/drm/xe/xe_ggtt.c:798:11: note: initialize the variable 'total' to silence this warning
>    798 |         u64 total;
>        |                  ^
>        |                   = 0
>  1 error generated.
>
>Move the zero initialization of total from
>xe_gt_sriov_pf_config_print_available_ggtt() to xe_ggtt_print_holes() to
>resolve the warning.
>
>Fixes: 136367290ea5 ("drm/xe: Introduce xe_ggtt_print_holes")
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will push it soon to drm-xe-next, thanks.

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
> drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index a3ce91decdce..86fc6afa43bd 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -795,7 +795,7 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
> 	const struct drm_mm_node *entry;
> 	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
> 	u64 hole_start, hole_end, hole_size;
>-	u64 total;
>+	u64 total = 0;
> 	char buf[10];
>
> 	mutex_lock(&ggtt->lock);
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>index c8835d9eead6..41ed07b153b5 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>@@ -2110,7 +2110,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
> {
> 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> 	u64 alignment = pf_get_ggtt_alignment(gt);
>-	u64 spare, avail, total = 0;
>+	u64 spare, avail, total;
> 	char buf[10];
>
> 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>
>---
>base-commit: 66a0f6b9f5fc205272035b6ffa4830be51e3f787
>change-id: 20240823-drm-xe-fix-total-in-xe_ggtt_print_holes-0cf2c399aa2a
>
>Best regards,
>-- 
>Nathan Chancellor <nathan@kernel.org>
>
