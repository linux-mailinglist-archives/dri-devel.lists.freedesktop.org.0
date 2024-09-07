Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B5D970365
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 19:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ECD10E02A;
	Sat,  7 Sep 2024 17:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqMvVFYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B43E10E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725730619; x=1757266619;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uY4wDrzOFZDH921p9W62Ou3WZmWToNnu/NxrsRKcVHU=;
 b=bqMvVFYayrDrpthwLtJ9i6M2WhHUsVtYxAeRiw6MNiBKHAID4IrZY/EJ
 PxP2YjwRtIpZIVTCVpg24RLQpLIefM4GMHT9/gK5EwH5QHp+4TxqRC6pM
 vyqIMfqbGSYvNMZUw1Yra3QXlVBOD4TERL3Le3PE2KHiXExJiks9RoMXN
 tD/xTEw/K2yF4HS2HTPUW2STHOvOotZDlYHxn20PLmHX6b4u9meWgdxz0
 SHnaqLWFs5Ngjf5zmo2y6b3vFbeqYxe0TS91lX0FPxRvg4is/JcOK6xEw
 d9/mBbSzE8bGcEi2vPZYk3lwWMqYAjQGJ+OlbQr0zelIOEbAfK4EDxiqP g==;
X-CSE-ConnectionGUID: pq0IvZgzQICILCPT05AqOA==
X-CSE-MsgGUID: GV7VQTe3RwGzpPOroh/Dsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24619887"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="24619887"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 10:36:59 -0700
X-CSE-ConnectionGUID: bwjIfir7R7G5wFeVnsR0qw==
X-CSE-MsgGUID: /iLUhz0cQTWowcNvSWPWLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="66276155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2024 10:36:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 10:36:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 10:36:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 10:36:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 10:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJilAXFKiFuQFK4Sg27VakudCKhV14fh8iJgqxCjIDsSOGp3dGPWeMTS+5d8CKA9BIrTISUqkzEedU1gEJrVbIjiqi+diytHwE7C2b6EhZYjeBcu70mHbRh4H5eaJwMGTZobJRJKlmes1RffeCLG5UBc49tOR6YQ/9arQ7hf/1MdTC25fJsZcC6aRUOvx8x/ytxHcShK1HLaj0Gmk1wLRO/fNDSfAiM4M/s5mc4WRmm2if50kOvD80AFtYYCue3uN5A6J3eBD6NjDpg3jf0HorkPO8W3ccnS4Is+bfrpuMWhuLiOxbBATbv4ILdVI95/+lbWZuZjsHDMBPuSntjxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddjwCOYyLkQDG+vUUWponb8/SSYXYB6Jcurp37b+SiI=;
 b=GaqoGGlHodJLz1dm2Sbnt5p1JJ2I64IYuAWOZzQYAyMaNi41aXPYOyQRJk0nmPqF1J+2odQcmx7VCUMr1iIlek0WnRGKHFTBgJm7cqV9hoo2bELr/ZI+2lzgGIpece6WbKSj3YFNiceAMQQyMJCuAcd7o6q2QAmvDJyhGTr5kSn03PxP1edQAyEPD4/0tR5EutCEBL3+kFqiRQJ0BgbIhZLG2I8ytd8R2+teEwGtq1HTheV9VjBzlrJXaZBQF6Hjn7AdvW2LgJeoHWdMNZX+hIXazj/a0Ci9tLHTOtLzaVLBfqy+aNt18qYnOohS/SEiS8AVTK/1HQocwa2BDqQNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8566.namprd11.prod.outlook.com (2603:10b6:a03:56e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Sat, 7 Sep
 2024 17:36:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7918.024; Sat, 7 Sep 2024
 17:36:52 +0000
Date: Sat, 7 Sep 2024 17:34:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Min-Hua Chen <minhuadotchen@gmail.com>
CC: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH for-next] drm/ttm: make ttm_swap_ops static
Message-ID: <ZtyOuDQtWHU4Phr7@DUT025-TGLU.fm.intel.com>
References: <20240907033643.1513301-1-minhuadotchen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907033643.1513301-1-minhuadotchen@gmail.com>
X-ClientProxiedBy: BYAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:74::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b35785-e834-4fd5-eaf2-08dccf63a8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9y7LozvlAEwayCF3SooPNeLXR1PQZBTBTb04sJklwOMU1ppKkANOUPj61lho?=
 =?us-ascii?Q?tGJ4rVAeT4c4/+66tx0+Dxd3K+i5HU47ZKbAfD46+Co0SCk6o+ULkmPnEHOE?=
 =?us-ascii?Q?bnsOVDO2sUysvsU2GSgS1VHGxRAsz0mnEbKml37l1X9ROmsqgzKrWLku6w5g?=
 =?us-ascii?Q?4yLR3gxdQoyGBi+r4PP8AuzXCudYMyb8+US9xO7vlpkxn3ZXcOR2rzfKHe9P?=
 =?us-ascii?Q?2kcJdIGXMlHuPZCrkkjXXJJk2/QCuSE3kIUlhzPUgSmgt5Fi87yi4SKvK2fn?=
 =?us-ascii?Q?6QHqNFE/dbRJin/qynGdDQMdLwWoYh22UbY9d92c74cr5U2oqHndNMdNSnQQ?=
 =?us-ascii?Q?HzU8LapXivZ54vAJAUfkdAzewWfjMFOcJCDjZdE00tDmyVFAF2a0KHlXNFtQ?=
 =?us-ascii?Q?FrBBi10wF0fkuN1GL2t4nH0Vl0htVFqd0b/R/sRDMnu35TGuITHLApHv9l35?=
 =?us-ascii?Q?lWIggcemGc3GQc0DJLMKUn+l1t1TKW5AimgY8wiIXEeaI5yTbbMajSo1kJzU?=
 =?us-ascii?Q?9/GSPMOwMzpGVhHFjGYeviq3RU/+jUaIDaR/lbKvhC1q8NZPF/PJJPtAO7HI?=
 =?us-ascii?Q?QXLNey9MW9J+J5cfXtsSkqLyjAWQWyUvTAdPROB8FviBotvWSg+qDFHoH8eO?=
 =?us-ascii?Q?Ro6tAmrvklmK4zcLQbVD7GtE6Yj1yIqeRc7mg1ahQD1MdA4m43BRpdbpS3AR?=
 =?us-ascii?Q?gBstoZJWZecoH6GMTV2gjYPgjBOhCnQjVPox1t3woGRTiSifzeK0Zlkcf4kx?=
 =?us-ascii?Q?+StuFVZOgXLCVSAPraUVrruNa2INN6JiILrtqrGwK1l+vZFmdQISJSpea5p1?=
 =?us-ascii?Q?vQFODw7ROYaLwAAMTg9o8rKFhXEhCgHS9SpD62I4a3R6Wyu/Wxb6ycGd+3B3?=
 =?us-ascii?Q?DeVco98vjbD1OhMb7IJM6JKYBSlMeqUsiMeQWfpUFz/L5v99rKPxMG5aesIy?=
 =?us-ascii?Q?JW8Qe9bGU1P3jp43w4krbZFY0Tv0gSCeYJ8ZyIHopaJZ5RPMFQg8ySRzQLPy?=
 =?us-ascii?Q?lxGHopyQXgWsOz90Clthhn/7RXcgRTz1WoASCnnqUeGK1skoduhcmtEN8YqX?=
 =?us-ascii?Q?g7OWL7Jk4foPRDJtPPjlfj3axUDt7bzpWaMhS/rzRFbmpnpi2tx2YfJvACsQ?=
 =?us-ascii?Q?wMs4tL7fpt/hFh0uEHs0AsOIMeZUTBkPH2TIBbqiWCeW0he6sZe6kAqtDWm2?=
 =?us-ascii?Q?sEpCjEW5hjnY7oWK+P2fMwfLwSD+a5ZAwtjH+V4xuift0YxqhJmKB9O9xZrj?=
 =?us-ascii?Q?49VVtGIe3EGyC4faiNQp4moRsJ7+rMyIS6VsTVeDd367CxPvO4bZ4E5KOYdd?=
 =?us-ascii?Q?TLwh+ab2deIL8girA1K1W0lKIDXdU7wgIdw3yqtPasKBvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFqfGktBaT00kpGjAWzhealSQg6NNO62/n3ABQYN1AdcdeS7rkUZOxSMFDn6?=
 =?us-ascii?Q?jKChwBlCHAEcFi7RMqP8PME+41SSiEs5E6gJDoukWsLj33AMTM0CMrTwbmFd?=
 =?us-ascii?Q?nbkJCT8yN3X1SSXzVDXSfdxT+cYKOqHMrAmSRZJxJouFKsHBVlx2q8s3GXYi?=
 =?us-ascii?Q?QiNx+BMjb49YHOxvJiYZUuMq10kHKhIDwS/eZPXmX61yWNuIpv7MnUmODBpu?=
 =?us-ascii?Q?pPt0CaCFBvXX3WDFGVzSxI710ar7Id8U38qxTD/df1AMCcXXarhB4nYCeKhI?=
 =?us-ascii?Q?1FoGIldyF/P1UIxODnv0Bhsd0i9twDeHQh4T2VtvFAiYG+9VuLMZKuiHpBVJ?=
 =?us-ascii?Q?ULZvmaquMW9rYRbl2Ay0j5U416scT5lwUsfhBVq97x/tM6M/QtaE1+cqiQnX?=
 =?us-ascii?Q?V/F00jj4nxJDRJpY+8pPR3J5bQw3RwAmGU3Vdd2YOsPynLhqYyUkcneAwF6a?=
 =?us-ascii?Q?w21aqerwb10TkFb/VC6aKOg/nXS2Gz8bm6iNUiMe7uhYqUYyKfiGosiu9S1Q?=
 =?us-ascii?Q?7yE1quJYrYR8bv2tFdiqwLYyrmNnC6QolRfxAI3eCmhT16VrneNqeATKY4VW?=
 =?us-ascii?Q?DjgmN3CvoV6gN7o8hI9plqZBs0mqE6cey6wZ+CNv3VgNmVcuIPaGIYogIqhc?=
 =?us-ascii?Q?CFmBe8NMnaZT+lxEJmlmFSR8FZO7GmfnBqhWdH4soonDc9yL6WtuUcjXfB2o?=
 =?us-ascii?Q?gaRcyX2yEIMGJJKkM5iSG/5oJKBjijaz0ABp2avUPvxekokHOj7rKKFQttQ1?=
 =?us-ascii?Q?UT/qr0UCQQuxUQMSdikX2NziX4XHxaHG4ca5zuQKQA6qIGrBZj78T6ZE81pa?=
 =?us-ascii?Q?CbwU+ikjI93IT1NDhF+ivCko34QpXHY1Bm6oN+Sv0/VWplAGyQc0MEu6jszI?=
 =?us-ascii?Q?i1J4T/ym9+XUsUAnbgpwh95AeA72Mrm7cMB/gx0eSS5SCe4y0WnV8y4h6aqB?=
 =?us-ascii?Q?jFiWcrM2Q2QD1nf+koNBMXW55g12e3nAo/WhlAH1Rrb7pqQE0et8ogdPCPtZ?=
 =?us-ascii?Q?VpMVkqJ5qbQeuN9ndSS5Ng+1HI4FDAGHeWLPFN/nbuMTQKCz56KrUhSyRGQ2?=
 =?us-ascii?Q?k1nENFui02fkKqctZmLqjtuFRMLcUREFa/31s1hE8Gef+uHJb5/Jg82mO7sz?=
 =?us-ascii?Q?oZiJeTeFaPVbwGLxVqa1ofWyS7lqF2h5XWQ49NCm2lfGb4VNnDiyG64jmfqC?=
 =?us-ascii?Q?46v35/kwSxF7rxBVdALmK8CgTmzUoVWKlTFFFqWO08qf0nRRI15DhQd0Kb3U?=
 =?us-ascii?Q?abgemhhSFDq8zmZAeX7ZrmtbSyRJ4gwsw0x/J18wls/hS89rrpnTPT53bGgC?=
 =?us-ascii?Q?vMgeOhvhpiteXz2CTWv2NlycPu36mVbjx3ev0l1wl2JF+vOGVvuH/ZjMXDhT?=
 =?us-ascii?Q?/CyNcBD8o0NMqcjy9SSZtS0rnxcvA8iI7rZJputW2AzZWPqP2wprgxnvxMEM?=
 =?us-ascii?Q?pCotFlraCt9NgEp4tekfTN/xcxBZiqYr07Ywo6T4/xgGZYAP/dWrc4QTkxQC?=
 =?us-ascii?Q?6W3jy5p38yIEjh17M68eNaLbjYT1KPMF67Amx2pqys5dIi9Mgu58/anVzYOj?=
 =?us-ascii?Q?UarakPZh4gXYvC62IG8Bikt7x41pdG4nx9czpNVc+HEZptvuv99a1t27fTtE?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b35785-e834-4fd5-eaf2-08dccf63a8c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 17:36:52.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hszDAzYXrEPA5D9csEuqFwRjnMCAFcpCXVziGQxw5RtonDaKfccFy7JLrDyG22yVjh60FozEt3ktxvkqtcs+fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8566
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

On Sat, Sep 07, 2024 at 11:36:41AM +0800, Min-Hua Chen wrote:
> make ttm_swap_ops static to fix the following sparse warning:
> 
> drivers/gpu/drm/ttm/ttm_bo.c:1142:31: sparse: warning: symbol
> 'ttm_swap_ops' was not declared. Should it be static?
> 

This looks correct. I'd drop the 'Should it be static?' from commit
messge though. Assume a maintainer of TTM can drop at megre time.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Fixes: 10efe34dae79 ("drm/ttm: Use the LRU walker helper for swapping")
> Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..1aab30767e41 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1139,7 +1139,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  	return ret;
>  }
>  
> -const struct ttm_lru_walk_ops ttm_swap_ops = {
> +static const struct ttm_lru_walk_ops ttm_swap_ops = {
>  	.process_bo = ttm_bo_swapout_cb,
>  };
>  
> -- 
> 2.43.0
> 
