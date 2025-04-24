Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D1DA9B858
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C5810E85A;
	Thu, 24 Apr 2025 19:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXcTEfwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7A10E859;
 Thu, 24 Apr 2025 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745523356; x=1777059356;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xXF/hND7QRC69HS9XgCbqSnRU5zqbtTMyUZsID1Jwkw=;
 b=dXcTEfwJ8dd3KiE6jJJz+RMjxUcllP4csILmA+G/b7uexC3lD3IdxsPu
 CNFcRXKmVHvnjY43wPNuuVoojHxnXqBvFQaYzjcEA1fCRYC2lkna6ZFEJ
 U+f5OllL+KzyD36mqCiVN15xzXfqXv2TEoQlRtp4+NY9MftJWXHoE/7uD
 UzhbCLPWjWB316DUUN/n/MKVQTL6ZhXPpkBzAkLiv3V8I24ydfgHFR2jd
 J4t/IoHSfqvWfVwu9kykpUXwgbUkmnF3MmlxFF85Bv4QKK/Tor9Usy7lL
 d0BrYTE/SkgS5U/3PFFNwUv02f2XxtvDreLBXTX50z2WPEWDZlCMFkpRZ A==;
X-CSE-ConnectionGUID: JHqSDELRQJiwzThZxW8Xtw==
X-CSE-MsgGUID: roalDzJHRhWuyeGMDwcJQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69668510"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="69668510"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:35:56 -0700
X-CSE-ConnectionGUID: Gff48lJHRLKBhN9jkUCvyQ==
X-CSE-MsgGUID: 4kKp8ww0ScCbA0IFrUPZ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="133236694"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 12:35:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 12:35:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 12:35:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 12:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8XJa8XVVjvwc0uTPcCzb9j4c3GvuKmWHrrU77V28R34moEm0X0xp+QnADFRCfOaXFfI/6vpq5fCbpPFACDX4tx9eJ6DzNxTiIkFo7yTl6PYVIdCYHC4JnEPvatkcCy/CQofEnxBRBlfGI0/zfw7wTfGVfrGhZX5adoz6dE3qX5z5D7ofhaJOhMDARHkQ+CF8nzgbUyaHgipkKco/a6vpowMxmbWEHLKO3eG+FJb7NAe3F3Exq6DyzgRWpohpQiu6BgHP+ogyuw1xlrZ5uKkZPN9BBHVioENkiO7NLItea2MKzKAt39yNBnmEDvtVIrJBq9VhiWto1bLwrI7NdaEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kIrniJcC/EW5ZiO+ctQmQc5Amjek3MxrUToCDynRyU=;
 b=G1eNje2lZmytEkizwBNLLmd5SL0DHkmmZ4HQ+r/M1Aop8GVT3Jv7nDgZUMOqRgBw2BK56p5659eMncLwPS0nOBmPF14rU8bVlQBKNxhiNpacXxBDTA4Kh6J2h7/B3RzjPuJAxNMp+hsSFh5V00wDl7m89m574NUZrczDSjT2odEiOaAsTBPdiTk19RVDlfR0mfno77cOlzvkN5wtGvF4ZgbGbH2gHpj/dCHORBhkVOsGaKWKOhgmVfTonPayowFQFFPgYf0vJjtMCx+rpQehPT0pwPxGQXlj4KNAbCylzMYuBvMwBp7WWrSlAq45bkEZb287/C82ZAMs38IgwxwIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7624.namprd11.prod.outlook.com (2603:10b6:8:141::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 19:35:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 19:35:18 +0000
Date: Thu, 24 Apr 2025 12:36:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v22 1/5] drm/xe/xe_gt_pagefault: Disallow writes to
 read-only VMAs
Message-ID: <aAqSxmxU6gob1jj3@lstrano-desk.jf.intel.com>
References: <20250424143812.11210-1-jonathan.cavitt@intel.com>
 <20250424143812.11210-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424143812.11210-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb1aadf-b154-46f2-3b15-08dd836724d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EDW5roy9Ixbu6/NupgJejj+EkU2Mrpi01de5rZd2+g0VUiIDvBGOfE6Y3qCw?=
 =?us-ascii?Q?YLPAp/A+WMRjh3Hcev/ldUVAQDEgmhZj+6oXSNrDo9QX0PhPP4N3TWTy3gPL?=
 =?us-ascii?Q?k2rr1AjdLe0JJluPCnvjY7kuS62LkDmOZovre/dxb3aJEGxOG54n0+idgbGZ?=
 =?us-ascii?Q?N5VxPrIqOdrDlqJtwPnNE+6rWlzkuOSFT2I2B6HxeHmIQhL+EF23QP5Y4wgg?=
 =?us-ascii?Q?XMMUrJGxNnhTeNT+Ft72SVUjzTUkcBhOe845rDs/FFzjovEIFkqfhi+IZ6Bk?=
 =?us-ascii?Q?l4jZWihd+Lz3vqbh1tbdcmAMK3qsbH9BrBztnI3UjJANnrefbzki+aaRHY77?=
 =?us-ascii?Q?YVGmLheJC7Z3hhCLmSTi0f1M/3E/DjarQOLqpzsQy9hcee1njhLLV4G8RoQr?=
 =?us-ascii?Q?Jrzs061Nwn37IxJX2oqVdRTyR9kdRSklz4kYntxsfaryEzqJGGfPFl+f7bqW?=
 =?us-ascii?Q?ndcVdFl2OMTNfJeoFvw17qJXNKZOadij/WNo3fjNlq4ILlmufwEfo2TP11Z/?=
 =?us-ascii?Q?bLUBfX47rV2pGcLjFvAt82pMDvxO4rkH/JVuhaG3RV5R3C82OGvwhwapF9WF?=
 =?us-ascii?Q?iQXWvdg/Pya4pKgUYOb+ej/ZSc9O3nsJzBT5dFYcig3gLEB4PTAbM8HeKlYq?=
 =?us-ascii?Q?qhU3iJCFiVyiFozhSGlAHNThx7w6cITFzX2RDch3gply6WbyVs+C4xST7lOy?=
 =?us-ascii?Q?ykbrkk3/91OxvyrHo8QN1B9S3xUNrn72vH7pzhXnT9im9X1ldVZqk30TpFKy?=
 =?us-ascii?Q?ek6f3tztSSKNu8ukdl3qMNyvcXmeM6/1bIl1fQubUhJQ2SJBmqWNQfDSZ2tr?=
 =?us-ascii?Q?tJN5CiBbCkFSL78UfUM2BJ6MRfKDS9T5VUwEosMeZlMwKTYJLiSZJM0zAPri?=
 =?us-ascii?Q?knf298OVjiJ1V+GKeuNkeYOZIbuFPd3nWZ2wZVCtO5oMnLMHk6mwWgDQTstT?=
 =?us-ascii?Q?qDYBZyl8aoQkI3jzsn2BPy5QgzLi01XpKk3liSr2w/icnHfy2xNIJ6kk51Ef?=
 =?us-ascii?Q?hbE/eUtighruUaeR5kCpbvjwW60jOSUGci80VwkoX75efHRIBWSdXVdKPZaw?=
 =?us-ascii?Q?6t+wOr40VwO+MlEiwjw4SJAbS7+kwrOhjLuUuWnPZjv8Vqq7x4Jwuzr2y5by?=
 =?us-ascii?Q?KkyA01brBpVdxsLpbG/+vchfjISC/417m4XqGA/ka5xESDKleTregt6SsYn/?=
 =?us-ascii?Q?aBbLIG7Nw1hNsJDND7vVyVB7bjHlNjOb9G5dUAqZkWzA9O6iAvw1VLx3L5cz?=
 =?us-ascii?Q?P6wOVbZDKAdo2MLvuglxTwxN1PBgXXflWXy7SoYmchPG7tgyXbyB4miQARou?=
 =?us-ascii?Q?UD269TxJ9w166Kx1rA1c6Vh00Jxr0xp+M73z6pSSYpXKQSJXPhovyYgfSWZs?=
 =?us-ascii?Q?AVINtxwtWwVqLgzArZ6QcNdoxRuAu9PntILarOYhWH3rjXcgSSy2h/Oi+AEL?=
 =?us-ascii?Q?a7OOcOpjuwo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5d3zETXwcIyFLTC1I0DAWT7eNhhMKmvj4PT0YqeOe+d2wt0hxg7dtEIdz7r?=
 =?us-ascii?Q?DgbEh95HRILhbAR0gtLUtUIw29vRypaf5Rxj5q3fo5wYwlE0s4CeJZ6FNVRn?=
 =?us-ascii?Q?RUtnw5jNbvlkoHRPMPJPAv7uEfDmiYf8YICrplT7CD0Q26TV5p03fLcR6cfb?=
 =?us-ascii?Q?K2JzkPByIbGwt8ExNKYLgSVpDpXMEP959OUTrFn61GlhMneumzi04x016gwk?=
 =?us-ascii?Q?wEmrHWEPCe6wX2BXEDLhPo52TfAV0w3kQy8Df0jmCuoZ6dDKwTbEjwWv+wlJ?=
 =?us-ascii?Q?3SEiiUzEGzuYmSU4fRIwLj5YRvwxtuO+LQFDn3TT3kRkcTpZjFjyGdljfMe3?=
 =?us-ascii?Q?dTgcTwEudm+ZCbtMGBIw9ub0DGDlnoY/FF5hPs3OQTpfrnPEJYCYBBRJyyON?=
 =?us-ascii?Q?IqJKmOxuoizm1njumpoNzvAomHf5ExpHL0hzmiy7tqrvXDHiKA8kfFyAQl9f?=
 =?us-ascii?Q?1pW1P1DPlGVLLn7Q91vj1sVSyAyn2W2G/Ctra1dfo7H+ozUjII2JKtLclKQb?=
 =?us-ascii?Q?qbkqbtSFtwGdYau+HdysszjpiDrV7bkgp2yQUDYtmwFbYiros27KlBJC1SLV?=
 =?us-ascii?Q?misfh5PPO7PRB0sQogEppMtVdjACZbJNdnVfoRThB2vUrCmXz7U47qLJoIcY?=
 =?us-ascii?Q?I9OCCZA5ixRwxCtGVi97Rp3PZ0eTyjB1usZqQaO4+722+aDb4j9sklHuerSz?=
 =?us-ascii?Q?Bj1CM3wqlXbg5Olr6vSy0uQAzjBpqDktec4YR04Sefr3kVMZn5PzzP3CO9bF?=
 =?us-ascii?Q?qsr8bA8BLg5J5jyoqS4wNL2qBNZelXLEkPmHJZcYPbWCghcaqF/li8Tqyw70?=
 =?us-ascii?Q?KSMkf+OWVq3KdhuO1mwu91dw50umjZqBgZXDKiHqHwmrGappL4fcuPUUxsow?=
 =?us-ascii?Q?W7IIkdSJbPbdoaEferVInkAs2Lt61OW9K6U2JLB2M9m0g5YuyCQzKLqtpkcO?=
 =?us-ascii?Q?3nQByUg+G4UWNPP2GkNhqjZUwVQDsbNnWYslvVhcGTkzoOmesVMitB2bLX+Q?=
 =?us-ascii?Q?IomwhLGiYIQ84mAN9l/aou+Wn82UBBacDQe5Q5RJjJoFUzE6qpt016G4Xbwk?=
 =?us-ascii?Q?ti2Xy1ItJFlCPjXBLwftkUQ5CX472qvwylB5IjY8GLqqLDvkDLhQ/uIQiEsq?=
 =?us-ascii?Q?vLUubiKhb2wPSocYzJTYTNyn6N43sPmqKZJqIHdckMVp0jhKXyUmjW7I6Xrl?=
 =?us-ascii?Q?vHBxst7VP9hpQwFh+0bGcN/qWm5j/f+1XtwS143ZjIQt/LXNuLKI3YG0ff5u?=
 =?us-ascii?Q?H1uLwp8Al9YlvQaUMPUj2ZrruXZ4o62yKtn4g0JB2tQOrT7lJ2QjTxfcdDz3?=
 =?us-ascii?Q?fEzRb3zr6jI8UKsJM2wmb24QbvZmJXryHJdpOdNzcHMX6ZD+IIgBk2URaydH?=
 =?us-ascii?Q?SV3FIrdCf5UtwG8nqGKgjrr7y7JxK4xjWKh6IABFH2uzr1Fe3MaQDlmmxAv1?=
 =?us-ascii?Q?vcQVJx+sQDu0w2IOW0Y382khtg5DMiWZPdjtzmzmeeqt61MCE+lr8TQMh0rr?=
 =?us-ascii?Q?6voj0sx8hfoO3azy/4bn/oSJg2/nG69/0x2v3QRvwdKzRiLeayV7dJah1geF?=
 =?us-ascii?Q?aaKuM9BnP86fjbvZ9FqyERJp7LqWW3mzTEzZ/zl+a/yIFDzA4YmMralrUYrV?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb1aadf-b154-46f2-3b15-08dd836724d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:35:18.0834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5nyV9o3pzbOIWLEHBlwzYJNTQMbvuRfAssMA5qnsh/E9OegdZKiqKv6rRsknSwqLYo5qGWVTxI8wggW9N8TcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7624
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

On Thu, Apr 24, 2025 at 02:38:06PM +0000, Jonathan Cavitt wrote:
> The page fault handler should reject write/atomic access to read only
> VMAs.  Add code to handle this in handle_pagefault after the VMA lookup.
> 
> Fixes: 3d420e9fa848 ("drm/xe: Rework GPU page fault handling")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 10622ca471a2..d4e3b7eb165a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -237,6 +237,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> +	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
> +		err = -EPERM;
> +		goto unlock_vm;
> +	}
> +
>  	atomic = access_is_atomic(pf->access_type);
>  
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> -- 
> 2.43.0
> 
