Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A019742DB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 20:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911E310E8F9;
	Tue, 10 Sep 2024 18:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlVWWyKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C316010E8F9;
 Tue, 10 Sep 2024 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725994665; x=1757530665;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sngCqDXufygTAJcpwEA7hV5Ke4xjq5Ybf1VZL/j93Lg=;
 b=VlVWWyKU8ZTm4+ZtIZFt3hDrYmqtfKZvDNkCesFySx+5qKw5rAdOPdMy
 tYKIRnWWEhof1sb4Jh8vWj8k89qSD8Y7LpQ46gqtshP1nWCzL0Lr4+HwT
 TJGltcITqilSxZMrcTpCOuj1g5eWfWerJwzcdSZF0IDtvBVXjXlAI59ly
 +ULsO2dJSPrTowTdpIXVz/Mxms9pX1aI/bnSbT8h4TkURspDlsTgpNrCA
 g4nbVDFcjS2xMUoCXl6ZpLdpySND6Pjau4kaMPuQFFCZKWs89Q6Zjzdl6
 6ZnpbkwjCM/N7RBlTKQQFkjIav1h+lJY7yLSl/je6LX/cmihW1+8tajTj A==;
X-CSE-ConnectionGUID: bmwPp/CBTE+BhJMe67NUpw==
X-CSE-MsgGUID: 06rwD0FQTpu39wJF+53cUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24908910"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="24908910"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:57:45 -0700
X-CSE-ConnectionGUID: g1f2kpLcRXSiH4WtgmtCoA==
X-CSE-MsgGUID: 3WrKf6TKRGyceL5edJx/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="67641592"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:57:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:57:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:57:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Py88ZfIlO4mnIWQnMXJLNy00Op9KnbqOrfYSNTCIpnUBX2EvzxZ7/JKSiyhX+y+ivVXhPaKU+oh1KxGQqZygkZbZ1yHe3KjFqQfW4/LyLXkzJsFTWIfaVVnou+/wlJru2rJGdHZx1gejtAk1pKzcD6GGlYL4gA/v3eKIjPtRGwoln0SLAk3iWRARVtraDt28Tav5Uc4PHZRVEoI0RecEOstuz8OBmgJo+ZMuTcJGODLEplHqb2tix82l/IhpK5yc72tJwEwnJWS9cHSmRJ2Jjwe9nKTvigB6fZbniniCXdDHOulFogADY5eLFZcVQVCJMpRX43kRRF4NfbDQe8Lk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BK4iWOY87o63t7DPSvTw3yuyOa6T/vYq97LHI2KQjeo=;
 b=NhNCcOiLvyf8YDiaElEI6thFiGbz1J58Eq0uEEi8/U89JNm8TvEKoAWAs5H8P/5iP7AyaJMHe3skfd8P0bzoOqAW8tlkaAkH2lZfe8Ptpcjn8BFzVqZ6ULZYSNY3aoS+HqZrUsq7Cp1oTZ0FLyuW8gm9DlHHJKvvoNcw7qXFhbVtKGbjm2ciW73+2ox1rRSBFaSrGhzuXm+/HP4I+is/L1p4hqQIpo1XrYiL8C9mZV17DQ31QSAnXtGVzqrj/UR2w0/28JhAWHTC/DITGujwXCKiRlM6e+coSf/GX4U2i9Wvo6iv2khWYUe0aesjSJLc1jjg5lxnvjn+KpGIDyqEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SA3PR11MB7487.namprd11.prod.outlook.com (2603:10b6:806:317::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 18:57:40 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:57:40 +0000
Date: Tue, 10 Sep 2024 14:57:36 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: He Lugang <helugang@uniontech.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: use devm_add_action_or_reset() helper
Message-ID: <ZuCWoP1LeqlRPvaQ@intel.com>
References: <BE0644D06348D90D+20240907065439.1661032-1-helugang@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BE0644D06348D90D+20240907065439.1661032-1-helugang@uniontech.com>
X-ClientProxiedBy: MW3PR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:303:2a::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SA3PR11MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f0d3ab-f880-4667-1f2e-08dcd1ca71c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zbKyhBz6orCnJANG0lHJgPwdOD1kToDjaV1zE+B9USIzqRbRirMcJn+ZZ02J?=
 =?us-ascii?Q?GDMZV3euXVEFh6SAz8nZ158yh1czaTwijBG212zxcJJilcrC8/+aYvl+nsrg?=
 =?us-ascii?Q?4G0EheCZfhWcpQmroxkzNGJRJsvghwgKn2rhVhVLvsewGx9MdvpWVKKr1uc+?=
 =?us-ascii?Q?QuHm4Lfc4NtH+Eyu4kZ2mGx/sVNRMZeOfLWreXlF5/pWYhogpyIb1tLCj1A5?=
 =?us-ascii?Q?xyKnTrWL7BqIz1Z9ENesAW+61JVX34IssOacy0KUxbuMQ8nlBR+N7FFWg1Ri?=
 =?us-ascii?Q?ySnFnhrqs9qq59nlS2DppGVhpMeAW3B8W/THewNfW2hja50/3Hb5zsKT0lCU?=
 =?us-ascii?Q?r5sx6FjoKyRPIgRJ2i7hSeOCTLbjqcLHMNde4Ix/bys+dRvHZcgL81yggzIb?=
 =?us-ascii?Q?DZ3wFsGlsaJfreFS1SvGYKshts0GQ9DKTa9bIXNqDoj18VUTyhJaUsiwX2d/?=
 =?us-ascii?Q?KFlzxUCmfxO+8Zeg3rNtGOZuDuu6YkxFZMNiIXWFURhpi6Lxsj9hH/0RxgRh?=
 =?us-ascii?Q?SicXJ+OW6p3LI2ESFV7QUJeFY2tjwdv3G1Uv+VFz76mhbsssuyB+eF2cqzn1?=
 =?us-ascii?Q?1zmSIJgVsWHLSi6boSS1QRvfzA+wXlmLk01/EBSHAF5BHGgu84ovMWnKqLZC?=
 =?us-ascii?Q?DuOIs9/h+DWVpF+2z23biDsUs4dDwrNgyc4vbIBQeEZ6fhoh4fhWA3bx9aGw?=
 =?us-ascii?Q?TO2c32A0NFuIgrS5JEITN/gd+1KkwLPB5H/Hnc28ogdpnV/ishO97GwDwAPq?=
 =?us-ascii?Q?QR/kX7RBUWWIVNm/dwoBgfjPL0CwnwjnYLnSbkWiADsdj6HKAvo7scTBSJMS?=
 =?us-ascii?Q?d/JFoxroU8L5kxoP6JSk5Oyw7iZM3CgMo5V7WfG9TE4HSavbuDW2cIqPw6AZ?=
 =?us-ascii?Q?JBQxRquVHqeyR1gd3spvONh8x4b8rE1uQKGFufPoCDzIdEtYKPNgurlUi7MG?=
 =?us-ascii?Q?tCRpiSTY3EAB1cjAPaDLK8MO4YnVDcds9Je5YMjIE6RiqYKqQp1tuUq/Ooaa?=
 =?us-ascii?Q?NcUn/HMhjtInpAxBd1GF1YSjLE4JFru2yh0Y78uiUsDmqmOsdaVFmI9bQaFM?=
 =?us-ascii?Q?6SyJtt0uFQxIZi5YABMRUO2a43GAAWerJe4l5aVs+UKFEJbNlrIenQzEsJ1p?=
 =?us-ascii?Q?oLoqWRbwQ3ww3KirYorb5kAM1k9sb3Hm5h12WRIyQmUbyvDQp5HoxjQVERws?=
 =?us-ascii?Q?qv1sV/gs4k1K9cV0E9uChx9nmGg3B7od5PtRr+0vXoJMNcYW3sjLv6PP7CDO?=
 =?us-ascii?Q?HpDrSTPHkVCir0VvurqGm0mjkKv8jLUWnkispUMZkHplHk+nx9GA6Kst8zIJ?=
 =?us-ascii?Q?GkT8UdDBFOqs8vzQmb4e6A1ib7ELmP0cQpNLtmwDPRrIZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gbfRQ2IzgpRYeGxly64PZ48FPWbpUxZO/spvJb7oEcDg+fgYpOyQzzVqzbK9?=
 =?us-ascii?Q?ZTA4ja1Qkg33P/pL1YSP/XrVH2areNJ2dBbhRYmOPmVjQCJ15zCHkLqL+Am/?=
 =?us-ascii?Q?vp/q2bmiqSLP5sOwKkuFJahk+2ppDkw38bioSOn2JVm5SJQaznpG227FaG/X?=
 =?us-ascii?Q?4Amo1UjMM77y55F0JkY+HdgYEp/sauAeOGQeBzVXWZEEj1WhFHwYAsWrxOnx?=
 =?us-ascii?Q?minFzL52ZIeeTY2bhKAcvGx2ZlooyxbN6bPtpqXxwpOcmKoidLsO7pNema9X?=
 =?us-ascii?Q?TDrXEigifiQWhjhWBWywQldQ3RTxktAXvmQBECi+M3/1Z+BM+04Fue+HvaLR?=
 =?us-ascii?Q?uzfyOpJsHPP7DPNksXatelERD9P/iEPWqrb3YyRLxx6I5skxBg7/HZVDchnp?=
 =?us-ascii?Q?q1eqRmmZDbwhQMOY6KqiA5OcVWDQgBT/lfpKk23SxxlrxKs9Mv1EGTZOjQRR?=
 =?us-ascii?Q?LLtfulhEsVPGhMHZ6jXJO0p0pIa+knvIhjlVVFH8S/0fcnIikMLnfVp75gC+?=
 =?us-ascii?Q?Ueb8G1RVdUZoRm03zKTobeakCzkLZHRusxzTvfITxql3TUWBOgwOiOD8AbYN?=
 =?us-ascii?Q?1Bvgz0ZHwK0nFkAJ1JsMcXB3T2S9v9wMf6vF6IlO3jilmI0rM/ghj5gx9lqi?=
 =?us-ascii?Q?aeBjLCxTZHXbNSjZ5kt/bCfs8+8Mm9n+KH9/zATfiDt08jr2Vcp0RPfGXYCa?=
 =?us-ascii?Q?dpSlX5dYXrrxCqEOzpDF6bJqJ2ZsNpu96eareh231mHiDvJs+l1ixtzLuAhR?=
 =?us-ascii?Q?PiQGG9oZ9Ez4pWoISjLs47WU0nImBPx10mmhj0Yk1ToVhgSdhX8BhEKilr5B?=
 =?us-ascii?Q?8l1pUTMw20joeXhwF2NFdxdmPd+qOt4TUhAUcGE6MDentkE9pmG3d8/0DJBw?=
 =?us-ascii?Q?nbXex9ixOF8iE7exOxLp6l1DajVkQIiSbruafxMPpioeLSqIFmULQIA5Ex3P?=
 =?us-ascii?Q?muwk/ge+FLn6bvSZODd7iD9b9yf5nsNrHjtGxyysoPC4cUa1mraINY8FQson?=
 =?us-ascii?Q?91QvLw8A7wfAJrWkBJwpbAwcy8szA+ibuzID8jrd/NTGo/W9VlEsgoAqBCFX?=
 =?us-ascii?Q?3vXx8RDtXKtD3b/rqKdy6VRVpP7y7cnWbu5CFE/Z6qDEtUQ1ydfPiDw1+Dfb?=
 =?us-ascii?Q?vPKqtl392QzFpM49k68vq4EXptagF7HXmjEH9YJfZsupbePvRSna6tekFkLB?=
 =?us-ascii?Q?jJTqcm0eU4f3dAKuh8obNv6OjgLOyAu7caSxHOFkNx9kwTLxju2R7cOoh3aL?=
 =?us-ascii?Q?Y1RlXI3FtYtfFlWn7gxw//+JrMEic2I3DSQXjDt4n3N1IC6K1BvrzIkFgupJ?=
 =?us-ascii?Q?gvF734rNtzwVaDsdOegZzbyixE1W92LbhZEdoVMJ5rs4aBlxaHiRE81EDpiu?=
 =?us-ascii?Q?eiHbrCjnwC+1jmKyPqHR78Gdd7UkpssFaBPxPhPDjz0V0J+NpEh9ZWyJVtOi?=
 =?us-ascii?Q?4jK3nVw4dGmHW90Th7B8uG55VdmbkYTqV85AGhQnfefLvkpGMJDzuKFw7XPk?=
 =?us-ascii?Q?g2h2WccRnjVcbgU1BVChiZ/TIh8C/g7fkRB365fuFgHIDwHpGYWWsEY4solr?=
 =?us-ascii?Q?ZFLFnVJ8wES/aXM+Ho2M9SbzBg8XUU4OPCOHFn3putZlYEAjbdX6LzNBcq5T?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f0d3ab-f880-4667-1f2e-08dcd1ca71c0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:57:40.4294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiJ+lADXWDBQZwgk94w4b1TTteMdgXArp7k1bObGcXPeJdr7QRmgxmc4a7jvzHV3UoRAICfol6NY3M0kVz54sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7487
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

On Sat, Sep 07, 2024 at 02:54:39PM +0800, He Lugang wrote:
> Use devm_add_action_or_reset() to release resources in case of failure,
> because the cleanup function will be automatically called.
> 
> Signed-off-by: He Lugang <helugang@uniontech.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c  | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 68a5778b4319..71bcd60d0866 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -237,7 +237,7 @@ int xe_gt_freq_init(struct xe_gt *gt)
>  	if (!gt->freq)
>  		return -ENOMEM;
>  
> -	err = devm_add_action(xe->drm.dev, freq_fini, gt->freq);
> +	err = devm_add_action_or_reset(xe->drm.dev, freq_fini, gt->freq);

you need to move this to a lower point then...
otherwise fini function will try to remove the sysfs files that
hadn't been created.

>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index a05c3699e8b9..ec2b8246204b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -51,5 +51,5 @@ int xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> -	return devm_add_action(xe->drm.dev, gt_sysfs_fini, gt);
> +	return devm_add_action_or_reset(xe->drm.dev, gt_sysfs_fini, gt);

this one looks right indeed.

>  }
> -- 
> 2.45.2
> 
