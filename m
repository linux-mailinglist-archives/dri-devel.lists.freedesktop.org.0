Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF698AF64A7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 00:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380F110E794;
	Wed,  2 Jul 2025 22:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGe0Ci9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197310E794;
 Wed,  2 Jul 2025 22:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751493649; x=1783029649;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1C+ZvN4RboOMPH5CDK7BVBobYActUUuXl0ShpsAuBjs=;
 b=NGe0Ci9hbgAzn8W8MqT93j1QMtafSCo1jxwSFBVaT0/+pjRrTIvNT+XW
 CaKui1MslFnhylmIp1x4BDWU8V8aZZzPyeAAt7TB8mEKnY7vp2bDSUqKk
 8f5a1RklXGO77QMz4U+4ufZWrmAbVs5l7DrZy0jOjAhCSkh/m4lx9qmuM
 4YTeENbLc9jba35Aw2U1CrOUT0rONwrPqTgjzr9B91aWI01sBN8DZiSrG
 STTOVCwxvsIwH6BEM5hqPu8sTuUP8Mmug4cE9ULlvmZrkuONvsfqPfGSo
 /I07Dhvs7DWLhKwUcVOW11q8PEGFD+m+qCfChGdbNz7ZIzI2whYMDf4sJ Q==;
X-CSE-ConnectionGUID: nDmSM7aeTKqZWVLiD3+OOg==
X-CSE-MsgGUID: qK3A2WaWQfqNhfYJa1cpmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53670573"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53670573"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:00:45 -0700
X-CSE-ConnectionGUID: 1hQL3OwaSF2rDdBTdAM4NQ==
X-CSE-MsgGUID: 97OiypiSS5WS58ZXMnf/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154550758"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:00:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:00:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 15:00:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEd4R2HUrNG/hF/nNe0TRzHXoXdVcjxYPZ3TGzPiufI1xrOU6VWUJNFSV9F8HoocaL3sIWGqetUO9e0jkybqSi1VbVwz9IQoeAoY8K2qj1dT5BGKuN0fncPmcxShTSjWkXX0F3d+Jilq80OeG76/9wWQqjm0BCR1a5g33Fg3gma6EkrXrqkB/R4UIULuSMkDIBxmSu8cS28d149OA7ax59n2z3notYzc9y8MBVRrTX9pSLRR8dXDkQDo93nwLHtq99ij0sLbdI3FfCMjJ3+Dw0V0ID6cYfYwDkUX5LQmnmM4/HjxOlYyThwzMEWlBc6GpPu3YTmmo1yJkqLII/MUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM/M9GIu1YXGYJ3+zUJgALi3G8de4doxGKHGaM6UR6E=;
 b=VHL+2frHZb16PBd8blZPA1S0xXhgoQNsYoL8xAAoShkUjyRtvBEFuGSEbbkwjH7xJQkcDI11wsQArsThejKjxKKnjk6PRFAlbpHgABObefUylY+Rha0OBBLjHypSuq3X9kAV95j3TttH47lbmnAZ5fIctWADzVebXuKzdwVGHMZ4kdAdgqhpXv0yzLiMSi0oa3dZSFaRSBe8W4QowlaEuviYVpdnle2H0meClglwlk7lTc0SJMx+FG0vLdBNZ84iWxc813IY7o7Snaf934l7pB2Ol3AbhmPsLvX+36fdlK6sMrKgr0IRMW/xqI+263xfkzBNHE/MdUVOnRa2ikwaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 22:00:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 22:00:13 +0000
Date: Wed, 2 Jul 2025 15:01:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/ttm: rename ttm_bo_put to _fini
Message-ID: <aGWsVBA45EVO/yhM@lstrano-desk.jf.intel.com>
References: <20250702110028.2521-1-christian.koenig@amd.com>
 <20250702110028.2521-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702110028.2521-2-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: eec31ff9-2366-4bd7-3137-08ddb9b3d266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZfNb3oB1i2vHAZEAuC6DdYT8sQX8YqNysrz4SfaF78dHi2GKB0kNDM4kpB?=
 =?iso-8859-1?Q?h21bnWWe+MaP8ALjqrOF2Ib08pseslSilucMTh7F16vJAUgrE9zPsobyyp?=
 =?iso-8859-1?Q?xlRGX0O5oXxap08cqGQf7LtkIBoJLWZwYojqmISuIXnyzB047CYg6MUorw?=
 =?iso-8859-1?Q?Zj3azhaeHt6vUQp5XcZ+pA3nj3eHeHQOR/x8A69Cds/TSrj+4Kkps7vgFj?=
 =?iso-8859-1?Q?MTBSOZJmD2QBZa8aieSKyozUmXLasl0pVGbwYYBccntZ4jr3lwQmbidX1m?=
 =?iso-8859-1?Q?/9BWbpE31qtlxhAN2XNexSQw4ETMrKlMBN5b7zJFnrz9YusH/3dghCIUNJ?=
 =?iso-8859-1?Q?4HK6Yfi7rIQ6ED6vDUPqtWVNgECzhvgwkJ5A4MFjd7TUlB97SGnVIIZMzo?=
 =?iso-8859-1?Q?SqXYCIBdtmxkg4/mqM8Vnux2VqfZkbi9bUYR4wyLVfw4Erax+4tbC37uF2?=
 =?iso-8859-1?Q?QtlOJzFoCKYbpvElEd4/cNCvylTWPMofpU1OvXk8hwm/bbvgjs3YcEXqLa?=
 =?iso-8859-1?Q?PiMKz29Gv0p6PgnhFAF9sGshBmkdzLWv5RKLU3vxkUywKA3/UO/Pl0A8oC?=
 =?iso-8859-1?Q?/EsnXHeED1bh6u4m4fKGvh8Okq2vV/Wpe8rKnyZyW1ZYlnH0iPo1e7gRn9?=
 =?iso-8859-1?Q?gKq0T0KQDdnl4EKUDN8GcfAJQzolIRPU92tBfSJ59OTuMdV9xvOWcwS4V5?=
 =?iso-8859-1?Q?9tDSLld8CtifmqRJIL+jLbx8zS+9EpHCdReke0y22kGdTHQ/OpYybeICi1?=
 =?iso-8859-1?Q?KPQEfn0VgskJjFHMoyemiHdXpq+XpGzvsmo5nwRRaB/TXcLRzS9VwyXzdA?=
 =?iso-8859-1?Q?vTjvFUceebrLxNk9R1HGZxvKRPYsD89kqhaRBk2erWnB//mHq7v4kV4kjP?=
 =?iso-8859-1?Q?efV6cPxBd//hmP5xCW3YFq+vfyiBa0uFT6aWPWjtI7GZfjtKuJqnfsG42n?=
 =?iso-8859-1?Q?ksb1hU8DN0G62eVzH61bujBzZjYdWGLTrrVnxw3nYi002ebiI5MjzjV7kE?=
 =?iso-8859-1?Q?ZiPIKzZ40m6+SFc81kTHcteo5K162vkvUmX+nOQGOHmDuW/buss7QP2Mcl?=
 =?iso-8859-1?Q?nhSOEo+z6BbhTR7/yvcXmWqUwor/X4c1mqiC4VAPe3HB27+YDri78tOnDW?=
 =?iso-8859-1?Q?uxC/fnwxmg/xynSD4z3INCZgfTXk3ki4clauMGp1Kz1r2vw0E8jlQYU+4g?=
 =?iso-8859-1?Q?k8ey8SaAstsozVoQRB2IsLqUSyjWp3Am+7NYb7UiDf3r/p+3LkvqpVwH5L?=
 =?iso-8859-1?Q?bFeEkks2WNuEYXx4xrJnVNpUubGFAki59lxM08Gze94gel65dyuBhl/wAo?=
 =?iso-8859-1?Q?R6mSZDx8xK4j7DsSVKSBRQAqf6Y3SB5c9rtVs+02/0iVrvJCV0+ALPwsSL?=
 =?iso-8859-1?Q?cHCGFPPFHXLo2Ao4Hq6fVNNmTD0VbOro8Rxt5k4oTS/5KMvQTwrn0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?T1LgTqW3IKxGuIbz0G+5g6HBgyVX/QjkwqUNqYeNmdZaLbNZsC0a27OXjx?=
 =?iso-8859-1?Q?VujyPva2ytUGI+M2iVGw26YW6SgF2FovoTdp4yoAUV7p7MbI0XSpmTFfdo?=
 =?iso-8859-1?Q?PylEcITzCU8MFxDQcTkAZZuP5RxIMV1NkOeIKEAQWu7kFt1qXpTOjdqyBw?=
 =?iso-8859-1?Q?PUQPVqRhRz2+BUZOs7IaJG2l6HZ1sRA+75IqCdIMzWWJy/q/wM4Uyr+5VH?=
 =?iso-8859-1?Q?IK6/ptPRqCTMG6AtYb/U2FwFnz2wurcaYjLzy6wJCeitAuaxfS/K91b/xa?=
 =?iso-8859-1?Q?sCDTG4W67XdR9hiNu43ydDMeKPLri35Z3bqpsRvFtMyw+uXxDrGeUQK5v/?=
 =?iso-8859-1?Q?S2OF3dyu49JmLobhtf7T9TFYHto7eyMWxGqvC5MqL4T0BKryK+xz45DGb2?=
 =?iso-8859-1?Q?BhGCPR8zmfne7U0dkZ3vBQ6M3/l1bohKoDEbUTtZKn2EKMCoLKWfX6mPWu?=
 =?iso-8859-1?Q?gUtSTAuItxtGl59hoKpQKChFa4DkYK+Nq3qVk93yB1TE3tYGRx9RLsDEFc?=
 =?iso-8859-1?Q?0fHHxESTm/B5SIWCwDpeeLS8OyPMma04rR0os6vg2yB9Ihiwnq9zn9rX8m?=
 =?iso-8859-1?Q?PwJiQjUtdRsU06JdAsvClccG++y2yiUOQRHrVmgaVRdAdsVHUBZ1RPH0gU?=
 =?iso-8859-1?Q?3S3tlEDAeC308ovYPGf07i2Tvi88zqsMHc3w4tXB0O+VXZmDOdBDpWR1dC?=
 =?iso-8859-1?Q?5YP/vbX4iY+/eiW8jGYPlPsynE96DMfZnCyQI2alg27erUXR4UnSIGJw4t?=
 =?iso-8859-1?Q?rXZzChgih91kFF1Hr21Dj5TL7cp0ndzp8i0hh/MJMhJvy3ihzdVC/na1Br?=
 =?iso-8859-1?Q?59lrPkNtla+sTrDdIH6avXhaMzOWn0II1DPldGOMScQ90GGULLH8sXVsUg?=
 =?iso-8859-1?Q?F+sKTsTNXBKpu8Z5DwXitL4IvKGXFvqQzkgdWJ9jCr6swrriWf/tPMOSTm?=
 =?iso-8859-1?Q?6dmY7jvaN6V3X7eS82QKWcwb6Zix9RZog6ZLUdyBEH0jOSJvFIO7Ir1NHk?=
 =?iso-8859-1?Q?f87YRo8glCH2DP17c+mlm4eJjnRHlLE3UY7FTmy+kL1CPZZdyGKEg6BBpX?=
 =?iso-8859-1?Q?kC1Waq5DmsI829BEKbdN+dmSeet/bBQrpuEopBgXLQPkjrqn9BWD3BYBUt?=
 =?iso-8859-1?Q?qQa11ezDBKCSDUujpUmemucad6nWycdbTlCyYrMrn20nMCsnhOd/ZKVkdU?=
 =?iso-8859-1?Q?/3xFUC51H1b4z1o7tdmzo9QSeasvEmUBCgsAJ1+kOT7RzNoL9xqSdu1LPV?=
 =?iso-8859-1?Q?3V+0u/nFTWtoiYEdgQX3Xy7Z/SyDAG193UYSTn5v16+zgKH21zePWakiA8?=
 =?iso-8859-1?Q?tu5HWlVEDYgKCAFZt27vqaN4zG+5xa9dHz2cVE74Gd7IxHrMeaDn1uJBoN?=
 =?iso-8859-1?Q?qWDPN61WAxuZe1mJ6dCZ/4Ye/Xymi5qKZMgqjNXhnUJaPvZB1YtjzdFP8H?=
 =?iso-8859-1?Q?5IUdnowTzLxP8akpjg/+eoMYPLEiitNZVoubWCIqtxVzvjN3PmuzGddO6B?=
 =?iso-8859-1?Q?U7peOH6oc3obsI7PBGn8vCToV1QyG3RoiGBO9AFozgutIVHwjAFLVJc/Ln?=
 =?iso-8859-1?Q?VVtjZfApdn238hlve6r7bH61Bc0TK2OSx5MEEfjjXmLkEp1RX3+pEyYlXN?=
 =?iso-8859-1?Q?3DSIRCbQl77w2nJ3jJ51YZ0YbA2sA3gGRWwQr7WbwGfFI5rqnnuUhCTQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eec31ff9-2366-4bd7-3137-08ddb9b3d266
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 22:00:13.8958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUGrmnN3GK85I30zIhfHI74EbzOIe06GR8eC27jmk+DIABdx3D7PKzqwHI656A6enPQnQwYj68JkmudOhSQThA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
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

On Wed, Jul 02, 2025 at 01:00:27PM +0200, Christian König wrote:
> Give TTM BOs a separate cleanup function.
> 
> The next step in removing the TTM BO reference counting and replacing it
> with the GEM object reference counting.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  4 +-
>  drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
>  drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 12 ++--
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 64 +++++++++----------
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 21 +++---
>  drivers/gpu/drm/ttm/ttm_bo_internal.h         |  2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  include/drm/ttm/ttm_bo.h                      |  2 +-
>  14 files changed, 64 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index e5e33a68d935..9a2a8496eea3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -198,7 +198,7 @@ static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
>  	amdgpu_hmm_unregister(aobj);
> -	ttm_bo_put(&aobj->tbo);
> +	ttm_bo_fini(&aobj->tbo);
>  }
>  
>  int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b04cde4a60e7..90760d0ca071 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -107,7 +107,7 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>  
>  static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
>  {
> -	/* We got here via ttm_bo_put(), which means that the
> +	/* We got here via ttm_bo_fini(), which means that the
>  	 * TTM buffer object in 'bo' has already been cleaned
>  	 * up; only release the GEM object.
>  	 */
> @@ -234,11 +234,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
>   * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM object
>   * @gbo:	the GEM VRAM object
>   *
> - * See ttm_bo_put() for more information.
> + * See ttm_bo_fini() for more information.
>   */
>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
>  {
> -	ttm_bo_put(&gbo->bo);
> +	ttm_bo_fini(&gbo->bo);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_put);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 1f4814968868..57bb111d65da 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1029,7 +1029,7 @@ static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
>  {
>  	GEM_BUG_ON(!obj->ttm.created);
>  
> -	ttm_bo_put(i915_gem_to_ttm(obj));
> +	ttm_bo_fini(i915_gem_to_ttm(obj));
>  }
>  
>  static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
> @@ -1325,7 +1325,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>  	 * If this function fails, it will call the destructor, but
>  	 * our caller still owns the object. So no freeing in the
>  	 * destructor until obj->ttm.created is true.
> -	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
> +	 * Similarly, in delayed_destroy, we can't call ttm_bo_fini()
>  	 * until successful initialization.
>  	 */
>  	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..22d0eced95da 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -57,7 +57,7 @@ static void lsdc_gem_object_free(struct drm_gem_object *obj)
>  	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
>  
>  	if (tbo)
> -		ttm_bo_put(tbo);
> +		ttm_bo_fini(tbo);
>  }
>  
>  static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 690e10fbf0bd..395d92ab6271 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -87,7 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
>  		return;
>  	}
>  
> -	ttm_bo_put(&nvbo->bo);
> +	ttm_bo_fini(&nvbo->bo);
>  
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
> diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
> index fc5e3763c359..d26043424e95 100644
> --- a/drivers/gpu/drm/qxl/qxl_gem.c
> +++ b/drivers/gpu/drm/qxl/qxl_gem.c
> @@ -39,7 +39,7 @@ void qxl_gem_object_free(struct drm_gem_object *gobj)
>  	qxl_surface_evict(qdev, qobj, false);
>  
>  	tbo = &qobj->tbo;
> -	ttm_bo_put(tbo);
> +	ttm_bo_fini(tbo);
>  }
>  
>  int qxl_gem_object_create(struct qxl_device *qdev, int size,
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index f86773f3db20..18ca1bcfd2f9 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -86,7 +86,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
>  
>  	if (robj) {
>  		radeon_mn_unregister(robj);
> -		ttm_bo_put(&robj->tbo);
> +		ttm_bo_fini(&robj->tbo);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 6c77550c51af..5426b435f702 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
>  	dma_resv_fini(resv);
>  }
>  
> -static void ttm_bo_put_basic(struct kunit *test)
> +static void ttm_bo_fini_basic(struct kunit *test)
>  {
>  	struct ttm_test_devices *priv = test->priv;
>  	struct ttm_buffer_object *bo;
> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
>  	dma_resv_unlock(bo->base.resv);
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);

Intel's CI [1], see Kunit tab, is indicating an issue with the
selftests. Unsure if this suggestion would fix the kunit failure, but
would it not be better to just ref count gem BOs in the kunit tests and
create a mock drm_gem_object_funcs ops in in which free calls
ttm_bo_fini? Then in selftests replace ttm_bo_fini with
drm_gem_object_put?

Matt 

[1] https://patchwork.freedesktop.org/series/151064/

>  }
>  
>  static const char *mock_name(struct dma_fence *f)
> @@ -423,7 +423,7 @@ static const struct dma_fence_ops mock_fence_ops = {
>  	.get_timeline_name = mock_name,
>  };
>  
> -static void ttm_bo_put_shared_resv(struct kunit *test)
> +static void ttm_bo_fini_shared_resv(struct kunit *test)
>  {
>  	struct ttm_test_devices *priv = test->priv;
>  	struct ttm_buffer_object *bo;
> @@ -463,7 +463,7 @@ static void ttm_bo_put_shared_resv(struct kunit *test)
>  	bo->type = ttm_bo_type_device;
>  	bo->base.resv = external_resv;
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_pin_basic(struct kunit *test)
> @@ -616,8 +616,8 @@ static struct kunit_case ttm_bo_test_cases[] = {
>  	KUNIT_CASE(ttm_bo_unreserve_basic),
>  	KUNIT_CASE(ttm_bo_unreserve_pinned),
>  	KUNIT_CASE(ttm_bo_unreserve_bulk),
> -	KUNIT_CASE(ttm_bo_put_basic),
> -	KUNIT_CASE(ttm_bo_put_shared_resv),
> +	KUNIT_CASE(ttm_bo_fini_basic),
> +	KUNIT_CASE(ttm_bo_fini_shared_resv),
>  	KUNIT_CASE(ttm_bo_pin_basic),
>  	KUNIT_CASE(ttm_bo_pin_unpin_resource),
>  	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 3148f5d3dbd6..4553c4e0e0f1 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -144,7 +144,7 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
>  				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> @@ -186,7 +186,7 @@ static void ttm_bo_init_reserved_mock_man(struct kunit *test)
>  				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -221,7 +221,7 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
>  	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
>  
>  	ttm_resource_free(bo, &bo->resource);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_basic(struct kunit *test)
> @@ -265,7 +265,7 @@ static void ttm_bo_validate_basic(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->placement,
>  			DRM_BUDDY_TOPDOWN_ALLOCATION);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
>  
> @@ -292,7 +292,7 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_failed_alloc(struct kunit *test)
> @@ -321,7 +321,7 @@ static void ttm_bo_validate_failed_alloc(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -353,7 +353,7 @@ static void ttm_bo_validate_pinned(struct kunit *test)
>  	ttm_bo_unpin(bo);
>  	dma_resv_unlock(bo->base.resv);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
> @@ -403,7 +403,7 @@ static void ttm_bo_validate_same_placement(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, err, 0);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  
>  	if (params->mem_type != TTM_PL_SYSTEM)
>  		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
> @@ -452,7 +452,7 @@ static void ttm_bo_validate_busy_placement(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>  	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
> @@ -495,7 +495,7 @@ static void ttm_bo_validate_multihop(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> @@ -566,7 +566,7 @@ static void ttm_bo_validate_no_placement_signaled(struct kunit *test)
>  		KUNIT_ASSERT_TRUE(test, flags & TTM_TT_FLAG_ZERO_ALLOC);
>  	}
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static int threaded_dma_resv_signal(void *arg)
> @@ -634,7 +634,7 @@ static void ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
>  	/* Make sure we have an idle object at this point */
>  	dma_resv_wait_timeout(bo->base.resv, usage, false, MAX_SCHEDULE_TIMEOUT);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  }
>  
>  static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
> @@ -667,7 +667,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	dma_fence_put(man->move);
>  }
>  
> @@ -752,7 +752,7 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>  	else
>  		KUNIT_EXPECT_EQ(test, bo->resource->mem_type, fst_mem);
>  
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo);
>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>  }
> @@ -801,8 +801,8 @@ static void ttm_bo_validate_swapout(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo_small->resource->mem_type, TTM_PL_SYSTEM);
>  	KUNIT_EXPECT_TRUE(test, bo_small->ttm->page_flags & TTM_TT_FLAG_SWAPPED);
>  
> -	ttm_bo_put(bo_big);
> -	ttm_bo_put(bo_small);
> +	ttm_bo_fini(bo_big);
> +	ttm_bo_fini(bo_small);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
> @@ -856,8 +856,8 @@ static void ttm_bo_validate_happy_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type, mem_type);
>  
>  	for (i = 0; i < bo_no; i++)
> -		ttm_bo_put(&bos[i]);
> -	ttm_bo_put(bo_val);
> +		ttm_bo_fini(&bos[i]);
> +	ttm_bo_fini(bo_val);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -901,12 +901,12 @@ static void ttm_bo_validate_all_pinned_evict(struct kunit *test)
>  
>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>  
> -	ttm_bo_put(bo_small);
> +	ttm_bo_fini(bo_small);
>  
>  	ttm_bo_reserve(bo_big, false, false, NULL);
>  	ttm_bo_unpin(bo_big);
>  	dma_resv_unlock(bo_big->base.resv);
> -	ttm_bo_put(bo_big);
> +	ttm_bo_fini(bo_big);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -965,13 +965,13 @@ static void ttm_bo_validate_allowed_only_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo_evictable->resource->mem_type, mem_type_evict);
>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 + BO_SIZE);
>  
> -	ttm_bo_put(bo);
> -	ttm_bo_put(bo_evictable);
> +	ttm_bo_fini(bo);
> +	ttm_bo_fini(bo_evictable);
>  
>  	ttm_bo_reserve(bo_pinned, false, false, NULL);
>  	ttm_bo_unpin(bo_pinned);
>  	dma_resv_unlock(bo_pinned->base.resv);
> -	ttm_bo_put(bo_pinned);
> +	ttm_bo_fini(bo_pinned);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
> @@ -1022,8 +1022,8 @@ static void ttm_bo_validate_deleted_evict(struct kunit *test)
>  	KUNIT_EXPECT_NULL(test, bo_big->ttm);
>  	KUNIT_EXPECT_NULL(test, bo_big->resource);
>  
> -	ttm_bo_put(bo_small);
> -	ttm_bo_put(bo_big);
> +	ttm_bo_fini(bo_small);
> +	ttm_bo_fini(bo_big);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
>  
> @@ -1074,8 +1074,8 @@ static void ttm_bo_validate_busy_domain_evict(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type, mem_type);
>  	KUNIT_EXPECT_NULL(test, bo_val->resource);
>  
> -	ttm_bo_put(bo_init);
> -	ttm_bo_put(bo_val);
> +	ttm_bo_fini(bo_init);
> +	ttm_bo_fini(bo_val);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
> @@ -1119,8 +1119,8 @@ static void ttm_bo_validate_evict_gutting(struct kunit *test)
>  	KUNIT_ASSERT_NULL(test, bo_evict->resource);
>  	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC);
>  
> -	ttm_bo_put(bo_evict);
> -	ttm_bo_put(bo);
> +	ttm_bo_fini(bo_evict);
> +	ttm_bo_fini(bo);
>  
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  }
> @@ -1177,9 +1177,9 @@ static void ttm_bo_validate_recrusive_evict(struct kunit *test)
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
>  
> -	ttm_bo_put(bo_val);
> -	ttm_bo_put(bo_tt);
> -	ttm_bo_put(bo_mock);
> +	ttm_bo_fini(bo_val);
> +	ttm_bo_fini(bo_tt);
> +	ttm_bo_fini(bo_mock);
>  }
>  
>  static struct kunit_case ttm_bo_validate_test_cases[] = {
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index f4d9e68b21e7..3ea27c9707ef 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -49,6 +49,14 @@
>  #include "ttm_module.h"
>  #include "ttm_bo_internal.h"
>  
> +static void ttm_bo_release(struct kref *kref);
> +
> +/* TODO: remove! */
> +void ttm_bo_put(struct ttm_buffer_object *bo)
> +{
> +	kref_put(&bo->kref, ttm_bo_release);
> +}
> +
>  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>  					struct ttm_placement *placement)
>  {
> @@ -318,18 +326,11 @@ static void ttm_bo_release(struct kref *kref)
>  	bo->destroy(bo);
>  }
>  
> -/**
> - * ttm_bo_put
> - *
> - * @bo: The buffer object.
> - *
> - * Unreference a buffer object.
> - */
> -void ttm_bo_put(struct ttm_buffer_object *bo)
> +void ttm_bo_fini(struct ttm_buffer_object *bo)
>  {
> -	kref_put(&bo->kref, ttm_bo_release);
> +	ttm_bo_put(bo);
>  }
> -EXPORT_SYMBOL(ttm_bo_put);
> +EXPORT_SYMBOL(ttm_bo_fini);
>  
>  static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
>  				     struct ttm_operation_ctx *ctx,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> index 9d8b747a34db..e0d48eac74b0 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -55,4 +55,6 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
>  	return bo;
>  }
>  
> +void ttm_bo_put(struct ttm_buffer_object *bo);
> +
>  #endif
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index 7057d852951b..e564d071f40b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -37,7 +37,7 @@ static void vmw_gem_object_free(struct drm_gem_object *gobj)
>  {
>  	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gobj);
>  	if (bo)
> -		ttm_bo_put(bo);
> +		ttm_bo_fini(bo);
>  }
>  
>  static int vmw_gem_object_open(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 7aa2c17825da..c4aa3eaba2a2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1649,7 +1649,7 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>  	 * refcount directly if needed.
>  	 */
>  	__xe_bo_vunmap(gem_to_xe_bo(obj));
> -	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> +	ttm_bo_fini(container_of(obj, struct ttm_buffer_object, base));
>  }
>  
>  static void xe_gem_object_close(struct drm_gem_object *obj,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 894ff7ccd68e..21dac074b94d 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -391,7 +391,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
>  int ttm_bo_validate(struct ttm_buffer_object *bo,
>  		    struct ttm_placement *placement,
>  		    struct ttm_operation_ctx *ctx);
> -void ttm_bo_put(struct ttm_buffer_object *bo);
> +void ttm_bo_fini(struct ttm_buffer_object *bo);
>  void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>  			  struct ttm_lru_bulk_move *bulk);
>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> -- 
> 2.34.1
> 
