Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93683AA96F9
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02510E3D9;
	Mon,  5 May 2025 15:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq4mMkcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DE510E321;
 Mon,  5 May 2025 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746457682; x=1777993682;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WvHbPWU4w+t8/9R+mHJVDlKLP/ah/9c0CxFrhJR3L+U=;
 b=Oq4mMkcJi8QBK89TDXH6XlfHsftxfH3m5570yod/TAd3LUVUrGdMXl3U
 2qIbK7A/B9CF8PqydGhTBxp0ZsTTotKas0ebLSo1cN2TGa110iJb2tZP8
 hJJlE4wDf30jzwJuOh3QOe/66XMlRASnnUPwlNcGJWmGnb+50RuwxXoGS
 tm/nBvhZYF5rHqSuVjw2Pd4hDZQhd4x78Ld2zq+Yup7x0jTSspMmyUPTc
 OuTncvN0A6bje/9dIG7lqIxZxvgabm7aSRPN6UB9GqvCjSluHBP+2RGVl
 Uzxugjv88fdS3Qp9JTKUm5qP778w/g6IcjsJYfoMbohBCxif68NbB8T5V g==;
X-CSE-ConnectionGUID: i7KDL7mSTIOuJbFgP6U9VA==
X-CSE-MsgGUID: d8CzvhzvT6SGj5cFX15OUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48211833"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="48211833"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 08:07:56 -0700
X-CSE-ConnectionGUID: 5SO/PJC3SjWZZSg1Jvcgrw==
X-CSE-MsgGUID: +0hcAS10TceIo9ZxRGK4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135180036"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 08:07:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 08:07:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 08:07:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 08:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6csXJOhx0bv6u147y446JLrh71exrr6L0501YDPkGyQg8Nu1piNHFBJv+Y1zMX1qTWXBpBjq4XGg7zmXl4+BoZnLHzh9Yepw+tGWCFGW8WxgOzpzT1J0cwvG9L7mHiPYvIFMfRMofKStQobyjAl31ZFS0aFHYfremUS7LpJ/aoJACRYVENT6mF1V6M1FKcb5jpVXLzQeTwNMS11oiiT1jzum+FBlr38HmvCl9Rx6jx76BjrTiwVsYMA9ojVERx/A769dYPzjiYuQR5hiC8ueW/fVBz8TQytkTRKK7tIj8xqnvRYbwUGzO0gHJf9Wjg2KtnVUZbjznlZ+fp+QEpK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONGVs4j/lUzPy9euFMeVGS0XcmMyXvzw8yJWVh0KtXw=;
 b=a0AGoFDYRwIO7gTKJiKegXeeVSPtL7cj5ciYRx+luYTOvE4xsxeIzYSlm2+6hbQ68EnhxdIfnQv089KLJqgWz+JkWHl2VILwyFBL4cBP3eGx/vchjRNJgKMPuSeVAu3hY/GYPx0vV6yUXNCDZFYkHF6QwwIUN9aMj0Fp48sFx8zY4DBSVTb/WmcU2lWXTxjiQ3hoP7yye4P5lhFp3Ck0MvkCfw+GNqWC8TZ5XEDErgzdbg9FsimMPRR5IWvwg1fc1xqEatDOfFEKzBP/8Xd1WLAx4E8PpFZnT6OThtUd5REgKrNkG4MrF5vcprSlPMvEaqS7I3OICGtI46urq38gRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 15:06:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 15:06:57 +0000
Date: Mon, 5 May 2025 08:08:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Fix ttm_backup kerneldoc
Message-ID: <aBjUZS7Oek/od3CW@lstrano-desk.jf.intel.com>
References: <20250502130101.3185-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502130101.3185-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: da66d63f-cd6f-4218-a9eb-08dd8be67a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?uOVX0qoekdCXdUvtsQFNUUgwibj+NwQDJVdWFSqhfNGdabAtpe6eoOJCAn?=
 =?iso-8859-1?Q?UIZvmbThCJnMfo2oEqnIqvM3qw39yjivDzgWk8kkMZ8cqG6waKfrVaw9Nk?=
 =?iso-8859-1?Q?RfanHkVQptPz0uG9Nqa9YYweebFPuwkp3E7EGaCzdq7SCU69Wz3PVhV1HX?=
 =?iso-8859-1?Q?UZ0HMhgYpM+LyuKhFhVgMhVk4Ppu8/Y7aF1c7PrwndwwMTO6FBXWcr8Oz5?=
 =?iso-8859-1?Q?G0iMJ3CuIxHRdv+YNwwh4om/YXtlzSzgxfAUoC7CEvRMawdh7g3Q/s9hU9?=
 =?iso-8859-1?Q?+gWWv2UtvlgWy/8ndZh5j8plTnBtR6cYcBkdKihzq8GaXNbL7xwKi6Sm7n?=
 =?iso-8859-1?Q?nCIQvAT35Ts49HpXkSzqYlCh+s5AZipayiC2kcwvfeNhr2fWKfMpkB5Kg1?=
 =?iso-8859-1?Q?nHbxKMeXVymyY87V3TyyYwroeWp4Bs93YwLi8KrqsVDTPSXbFQEX/9fmMz?=
 =?iso-8859-1?Q?1BH/RVLRzxF46aJ9D8pRSmyBcq0NIHg0EiDky0MMicP6ePLrp+t3Ehyvja?=
 =?iso-8859-1?Q?VxK1RdhJ2k+UMeN08bVDofEBLp3w7NMNq+30hJZUY0A4FZ/eS7HQhTQuLW?=
 =?iso-8859-1?Q?mgEVNcaxiSzcWbYms169fGj1ER4d4C5oBALRN2C0geCEcPhziKcGzsDcBW?=
 =?iso-8859-1?Q?xdDLDrSuyOdKBrCv5XdaDEwpHndnPgg0eZeKqlfirv+ZHaEZnYa/TFsnaR?=
 =?iso-8859-1?Q?5hvmbtpuHDfXQRLHFSpySAX3VV/MHHMTFaduAsJqyBnRUxIMWiYWfucErp?=
 =?iso-8859-1?Q?6m/+Cr2Js/r7bcvRb+DpKuZV7g5E5t+crYjwF9LuBfVYCVMUIlfxVfgL3z?=
 =?iso-8859-1?Q?WkXswVHjW8lu1eEMMBYmz7ZCSwEpsvPTw3E/WFeyxWGacNCpuK2zJ0znY0?=
 =?iso-8859-1?Q?Igi/UCO8AdR4bm7jV6QaASka+j+BXxtPcgURN8bsXVPuXwHOGm2ZBF4Lbm?=
 =?iso-8859-1?Q?UHhgpuQnNSh9Q7FHcM05Dip5k/BdRdgcQ3tKJyHSdMqKs9ZF9jxZOIjoBH?=
 =?iso-8859-1?Q?j8Bw77xk6bh3/0qBfGbXmTCjqCyj+Xx5/wnnV5xQuG+vaUvKfdAEPnf/x7?=
 =?iso-8859-1?Q?w5Fj9vP8bShumsl1CXAGJOIYeWE5ZZIPZlmdqj1MZNTlLb5MRpztsvYtco?=
 =?iso-8859-1?Q?ZTZ8pos2zSflfLpfP1uop9I2HU4Hx1MO0sc8R+4ck2zVBaEhU4WWn03Tmw?=
 =?iso-8859-1?Q?fRGVZTvcHvg/4q7/aLOShTHY/tcCBRmG7Bvwc/wPhLTYFIDJvp0DEliG1s?=
 =?iso-8859-1?Q?dN6iuxpe2W88oyjtViMBUF0cC4/fuW3gY27G3I7MVkCh7FEbhJfUVtYRV9?=
 =?iso-8859-1?Q?jf31nT5eUxDiM98NUVEAN4U237xKYaGVZsn3LSQIup848L9fK+B4FPdh9R?=
 =?iso-8859-1?Q?NDuexcHK5dmlRC50eKQ2FdCQrwm4ZF1dIJT7lF0nWY1V7jg6mskvqcXRah?=
 =?iso-8859-1?Q?CjRT1A2ufEWlBX7DbGCIC5IdZw56eILLRuLkjTmDVgquk7YKxfZHDCsMTZ?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0/B2/irBaWrXeLVkEtOHt/Z3YswGC/116g+cctwzDZ2SH9VgXEGUAjpBwF?=
 =?iso-8859-1?Q?5/GkPnnpaxdE3cck6UM45yQw7ya82wGXP4pS1zNiLO6GlYXDbez1pySIz7?=
 =?iso-8859-1?Q?RYkci0O4yvcBAxlrdBn/9GLocUVCjE2pwDNzbXfL/Jq91VkjoZ96IEdj8O?=
 =?iso-8859-1?Q?ZzhZe+xfe75LoSiyptPgywnPEvV+DTsSSfevn7kPQkCgZ9J8T76hSs0TdJ?=
 =?iso-8859-1?Q?gyXZebLi8UWkyd3WprZHE1gjFFJxgRQa6UCOtQr6NiCmpEW2Fbr+78zmyw?=
 =?iso-8859-1?Q?L+XCxg2tgFbOwEEKu03XUrEOEGupcF2O+MxTyOkbg18l/ENwdNsYMm6Uwa?=
 =?iso-8859-1?Q?vIrkzb8CDcoKLB9waeGL3jHbFeqmKIiCfVGM5DC48IDN1LbLRSWxVvl43f?=
 =?iso-8859-1?Q?LDOuXhpRUbEHqgR4wU7SItyhNw0i8HDNp0Mp6QmkgTaPjpzKvDrpn2YsUs?=
 =?iso-8859-1?Q?8OcLi4Yg+eEdYwI/i0Tqnk/Eme0AcHJb8t4v3exH9xyxVH3fY9Xf32w2u5?=
 =?iso-8859-1?Q?qEccsYrs4NYGK/ahpjnqLMnGsU4OCaTVd7zTpso9/pEgefRw9SxFDL56oa?=
 =?iso-8859-1?Q?HHS/Ol4wVVOwkQoPl/bk3L1ydq+SHbsU4wl7GWREyvMmDYIpVo/uHEc4it?=
 =?iso-8859-1?Q?w4RuLrdTPhk7lzfM918TUzgTMKtDfz1ZLZ2LZc/T6UiEBjC/n1jRohUp27?=
 =?iso-8859-1?Q?JOg21zDOvH7MnXbvADjZRv6JMGsaurie3MtsH2Ykbo/D/6NsEgw94gnXDj?=
 =?iso-8859-1?Q?QVgQbHeMsXEVBq84p9dDNVbQsHnBYIFFYntZ3Dlqou/IB5pniUwT3WrPSt?=
 =?iso-8859-1?Q?VzuRvmZVut3zJlFKzpuxsjJCWEyqFDRdEUvlQmCV/xyqBEaxPsXk7AdCvY?=
 =?iso-8859-1?Q?QX+8nkqvw3iqrG+AuifMGvWN7JdNSa+r49WknzGmDaEmZVvu5+vcVOcoIJ?=
 =?iso-8859-1?Q?RES2x1bJscH+FPItn+t1Tg4CMazA34iiO1lEm1yuzfSMaLRkr9WObJoAok?=
 =?iso-8859-1?Q?2vj3fIcpjw5YHR3Dv6N0+S+nv6ZikMnD49TEdxkAuO0Rb5Oi5jhQKBJmpJ?=
 =?iso-8859-1?Q?GzE/1472e9qdrLNjgBpjeO6jIPrrTlOpDsIf0KnQ0xiKBvuBydX9ySfxWH?=
 =?iso-8859-1?Q?9mPntTteEB82fGU0H2HRi/GUlbg3+eKwoegB/owTxPjdZI9RhXUzZcEKgP?=
 =?iso-8859-1?Q?/X7iCvPuIDZ0J4O50HSVnIgT/jucDNHEWD+/79NlwvGhh9YqySAls07Hr+?=
 =?iso-8859-1?Q?ezFr+kjOJaZjjbJDHzWZn30ALk0AtjJsiA7+Rq4ofXgKAyZBbOsf+zF2dU?=
 =?iso-8859-1?Q?4C8VC38lp55FCKnKcR9jUIQU9kGcNl2wZTrDoFgBTrHhrAy+YqYHgzbSU/?=
 =?iso-8859-1?Q?B/QdrEsOThsWl0TBuIrz0s9uSunz5oogR+3zujQRFV4ofMmPIg8DOMWhZJ?=
 =?iso-8859-1?Q?qiVSVe9a+HxcC88pZiUPQwaOe73+eddPP3FV/akDnOiWO/k5yzA7OlQbFe?=
 =?iso-8859-1?Q?tqFXbqdacewRDwR7oTb5mn9WKVOgY33H0m4fXpaZwVcYwWKOJLFlsJHXB+?=
 =?iso-8859-1?Q?aNdI1rgEwvOnbwPjMvH0U52SPKvYQiH7MIHuNgYbAdL77Lz47MgenHsx1l?=
 =?iso-8859-1?Q?9rwyhg83JFMn5nWIhn4MmLBkOPP0/iSCOIYh10HvAZ2Nz6WCQloN6igw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da66d63f-cd6f-4218-a9eb-08dd8be67a9a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:06:57.4936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvmPc6bjtd/Lp9pjXQiMiP95C9FHPeG7sLF5/QTsW9IswiYgRm51cM8k8Phul79offPriyI1OxXkj/Rj66DpUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
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

On Fri, May 02, 2025 at 03:01:01PM +0200, Thomas Hellström wrote:
> The docs were not properly updated from an earlier version of the code.
> 
> Fixes: e7b5d23e5d47 ("drm/ttm: Provide a shmem backup implementation")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_backup.c | 2 +-
>  include/drm/ttm/ttm_backup.h     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_backup.c b/drivers/gpu/drm/ttm/ttm_backup.c
> index 9b3b5624c3eb..9e2d72c447ee 100644
> --- a/drivers/gpu/drm/ttm/ttm_backup.c
> +++ b/drivers/gpu/drm/ttm/ttm_backup.c
> @@ -41,7 +41,7 @@ void ttm_backup_drop(struct file *backup, pgoff_t handle)
>   * @backup: The struct backup pointer used to back up the page.
>   * @dst: The struct page to copy into.
>   * @handle: The handle returned when the page was backed up.
> - * @intr: Try to perform waits interruptable or at least killable.
> + * @intr: Try to perform waits interruptible or at least killable.
>   *
>   * Return: 0 on success, Negative error code on failure, notably
>   * -EINTR if @intr was set to true and a signal is pending.
> diff --git a/include/drm/ttm/ttm_backup.h b/include/drm/ttm/ttm_backup.h
> index 4da7c825088f..c33cba111171 100644
> --- a/include/drm/ttm/ttm_backup.h
> +++ b/include/drm/ttm/ttm_backup.h
> @@ -14,7 +14,7 @@
>   * @handle: The handle to convert.
>   *
>   * Converts an opaque handle received from the
> - * struct ttm_backoup_ops::backup_page() function to an (invalid)
> + * ttm_backup_backup_page() function to an (invalid)
>   * struct page pointer suitable for a struct page array.
>   *
>   * Return: An (invalid) struct page pointer.
> @@ -43,8 +43,8 @@ static inline bool ttm_backup_page_ptr_is_handle(const struct page *page)
>   *
>   * Return: The handle that was previously used in
>   * ttm_backup_handle_to_page_ptr() to obtain a struct page pointer, suitable
> - * for use as argument in the struct ttm_backup_ops drop() or
> - * copy_backed_up_page() functions.
> + * for use as argument in the struct ttm_backup_drop() or
> + * ttm_backup_copy_page() functions.
>   */
>  static inline unsigned long
>  ttm_backup_page_ptr_to_handle(const struct page *page)
> -- 
> 2.49.0
> 
