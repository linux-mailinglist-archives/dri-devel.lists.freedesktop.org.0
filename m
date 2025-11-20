Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02885C75A71
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D9410E79C;
	Thu, 20 Nov 2025 17:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HShujuMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569CE10E79C;
 Thu, 20 Nov 2025 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763659617; x=1795195617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=564rtOLcrsQtuQElcUFYGRNual6uqXUjofvlXB5I5p0=;
 b=HShujuMaisGOy5aOXUvkZ9HhL5lhbGSxYAqCkX2snwBVkVu87fmXKPKH
 5aT+do8qls//2EeZ84EXHWQCpl/Irfe5KiCF7bL3zPqjGMtBnvXdEBSTe
 9+Iq2f4TTaYnVLMp+ctPU9sOM+DNkqSqhqdhB0Wx3aBP3rjR8C4wCcl1I
 zPJYzCkEBQ1XfZ2Gz/8ejg1DZ9g7e2Z/XW850+5BnIhIAsvzxt9bIIGVh
 wXrDMRw6ZYrDfgvbZh7IVKZ5trwnWt7DYEdKvcajyZIpSFce4wikHtnEe
 pdEe/QU3OuLCa+97T914n2G0XrcJOXhW8wjg74/M6EOdQjcdCYrU535Wg g==;
X-CSE-ConnectionGUID: ChjDtA6ISZCm+XSn33Lp/g==
X-CSE-MsgGUID: xSlK+HTVRQ2dWc0kcN3EIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65768114"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65768114"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:26:57 -0800
X-CSE-ConnectionGUID: 7/uWA9z6SC2HqEU+GPHIsg==
X-CSE-MsgGUID: kLt3ErFrR6SqWgemISFL1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="195729056"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:26:56 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:26:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:26:56 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:26:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwrNp9vIpBw4SVE2NHDG5yyjSWjXCR8IfMMP5KdqZKZLqAhM2I+APhLCgs2n30yEn2f/AZMOZwvPcP4OAlzDIcqnvkp3k0/fX5AQJLNdjZmjFqUYxIM+LW531+snKMMyPzfojKUGwMXWZUQoGl8Z4kaTWDvoP7oTs9kHnZa3a0NMQDs+xCLtU89Z40pVXA688PYgSOi1+qKBPcuJZ6B4G614HdJsVZ51eWGhJSyVp0JTivFNt4fO+F5qmrXt7gFzFqsOA+61AKfWRiBhx/CrW0WB+mXK7Ozl5KhdJ2X0ZgumBcte9HS8XA03uZC2dy1Bu0WeVJl07w6hc6tkIrC3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJBE6yQm9wis92+8L3wqCGtqca3sJ8ogTIzP6ewCeEA=;
 b=X8kpa1A0SZDjKOZ+nCxxGyL1BvQ+oADkuVrITVKba06qCyOYLHTqv6JSmYKL+qvKWP7MFhIGvcJgT3E1mY4JQIqow8SH0UWpq8ubBa+31+/TgzqzL0oL/jFa66m/o6PXDFHUOS1zzjyDyyz9Izo8m7j5/8QT9/DPNLKZ2xWuqHJOfeKpDVyNLTFbopXJ9HHLDPCDHUbS+lRcf2IU32fiY9aBSWN2R8CGGo9X2E4D3m4PbEe+u9u6voLOqDZjlqjOUJm+1kSXB/IDUgtsIPJgR7bML3hcuUjBT1feLsou0rpE2lQUlqfffUA4d3VhVhSmUP3cuVQeq/Z06b2z3DQo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 17:26:53 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:26:52 +0000
Date: Thu, 20 Nov 2025 09:26:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 4/8] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aR9PWZB7Fg-9ve8F@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-5-matthew.brost@intel.com>
X-ClientProxiedBy: BYAPR06CA0059.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::36) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc3163b-e22b-47b2-dc61-08de2859fe6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BVisAfmxROvlUulFNxdydEsm9nUekLyakhNw1fSMcvwLQcghhYgYoatm4fhM?=
 =?us-ascii?Q?u2KdanChDffJqg6WVj3L+i3HrBzPgxcIOQya8dltRC88gi28IRbX+X2DnUWZ?=
 =?us-ascii?Q?ZJWy/8simb1S+Ndl5YjyG1cIT6usEOeBXEDo/Cim3pUtiF9bazoM7megwPAf?=
 =?us-ascii?Q?3SbfuhW8Y/DKAkMjsukXroWjAO8EU1eu66OSMzLKVE7azDsdGa0TirMlUmNL?=
 =?us-ascii?Q?llyEfh9AHZLtOVL5vPw+5r4ikmP1eebvpwoJ2tM/o6gH/D1NGWONiLk8c+Hb?=
 =?us-ascii?Q?tlIb6b/SZAgqZD+2zm6ZTgXeVeMBjYdNecYqye5K9+ty/gX8LA2E4MroLwhb?=
 =?us-ascii?Q?an/4MX5oT3nmsSm8tPXYOccYtDnEjtBpNtSESi0p6bYRpPNuzFZmrdmY7GtQ?=
 =?us-ascii?Q?c58s3OMMDDaIfgH8J2PdsTuDIl171jBw/5kJukx7t20K7brXCZC3G+IFXKAa?=
 =?us-ascii?Q?XiCBdaKeZpW65Osr5awT3erH4uP6E7rCDJFf8Fby7s9XImktnGh6z/gvFteN?=
 =?us-ascii?Q?y3pS1kKOpK/hSAABl2IFIRafVTrquuE4RvJLYtItnY+7giIIMkxZ7fjQhDAz?=
 =?us-ascii?Q?C8S7g7zm1tBbKfN4LvcJ3LWQAIWAQceD8UJKT/eAeerLW1scC1kHp6xQCZSi?=
 =?us-ascii?Q?7bQGZIYfr1fp4J0eOXVxL/E1ohBtN5ijwyRCzouLHViynJcX4ygoSPgKCQ9+?=
 =?us-ascii?Q?NBeksN7Cd4mYotIVspCxyaHeZPkqm+JAlE3nmVN3vxG72Xepdze99MrzlZGO?=
 =?us-ascii?Q?zf12C8ImC2CPsWdn6Fg4v6h/6rRuVigtu9lcLwFMQo6VNqyVEoZzPmhJIqza?=
 =?us-ascii?Q?g34xYAGuwYmF1uDfN5hQqmBL9hlUP0IfJRpVyspHceI50gDL6ziGK1PoOyYp?=
 =?us-ascii?Q?Z0sYiiBaWnCruzmYXi0jX/BKyXXhN3oDMxcEXGjiEiKIjhU4N6+EhKRG5ce+?=
 =?us-ascii?Q?bdDJxwE8jeTmtydkgJ/rmEICw51nbcU6wtasQQ0bUgyT48RaulTQtirF4qYP?=
 =?us-ascii?Q?Pwi/1s7nqgAfCTMATvKYrqTJqa0/jvMfd1SGCRT3suzkfKWfHC0UWm75kHri?=
 =?us-ascii?Q?Rv7sGW3TR3Nry+CPV4+JUBYw1flVNuOP1cNj+BktZt4+FjBxyC1LgQZY3Ldq?=
 =?us-ascii?Q?+k6Ibpw90YRl2Ci61f/YtSKSbFR67P37dVCE5opsO9sXI4cR1g8GFN1sUwI6?=
 =?us-ascii?Q?gmA7VhrWV3TrJf5oioMLu55GA3h8P/yTuyhLlCnfaFDFDRg9h073bcKurVq4?=
 =?us-ascii?Q?llbExsz2gaBjjnwXoJCsr3fm7CyQ3tZt17SbuAAuOzEvMs3kplEzKhY051+6?=
 =?us-ascii?Q?VvuZoEQdiyvqdv2daTVrAQNXtAdrPqUukl29yc5SMtIT2UKPTRNfC7q+LDlZ?=
 =?us-ascii?Q?p8jABKoAGYY4sIGDQPnJMgiDZzllGGYVrS0+i7dr21TxMFjaFpr8ZRuvZuK4?=
 =?us-ascii?Q?GklFB3p8GaMLLmKRfvTbckO9KE2ZUyIO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4otnUoVZJxwS8KfkV9/do3gTwMvwfLYX2yl+z2ccUjfGDbJSWLqxpjXcw8I?=
 =?us-ascii?Q?uk5MAWS1gMzeRp4EPcCpSnQFOVi1Bn1PuIGL48lAzDX/6nBCAkvG4poyI+mz?=
 =?us-ascii?Q?fQVNYcDvpkkTsMMYGvJJMviAy5mARydSRy9etK3dYaBhdSy3l3el32tB44AY?=
 =?us-ascii?Q?Na5p6upCBC/jYy901BZDlXb/e4x/bHUoUa2cfsEtUNdrkCe2VVLtmYVowZIy?=
 =?us-ascii?Q?jJqc95GpvwSG59XU971KJeDp4N8v6XV0nn+NHjdOurCNKSV2DQsMbAW/7Qcc?=
 =?us-ascii?Q?EoEJOaNVhjRpz1wNkfbRNoYGIp9Dorkz77EQNQ/iZoQLqCXgp4fF3rbBQnox?=
 =?us-ascii?Q?gV0US+h4bbDXxnkDRNHCte+FEGVwdWU+T8KIjMcjxLhsY9q1UAec9ROtMotD?=
 =?us-ascii?Q?teXeRo0ZqbpFlTQsL9aH52E8bgrp0qnaMHhpdZc/YdPWNYJQfoCpR4Gm3k6u?=
 =?us-ascii?Q?NkszYJiTU+H7lnwmRyylZLhnqZCF6b4YHYFDvIlxhchPBIBZyyi3G/qoj0jo?=
 =?us-ascii?Q?5sDAULWX2peQffFspy6852U5CjVKh0B18UmAQa7VPDFC6Vuzz5Id3SDHe/ul?=
 =?us-ascii?Q?ZAZXWqBwgz8i0HzgBsJ3lsMYepP+5+VM5jDbLdV6sKJKbAbc71zOF80kvVZJ?=
 =?us-ascii?Q?+6c10JIVEHdxks7DNneFxFI7kjV1GDKzpjEH4XLwYOOm/MvSfukX2ewfDjoO?=
 =?us-ascii?Q?HrNLnYOR5v+RxUX6o0iQsPiO2IzkT/PHaw9+MFLuOr0Tef78f0a/bs8xyVCi?=
 =?us-ascii?Q?OAm0qbMVCX+qWY1MNCPlivxRxISjSOpd3cJsDIlpHqiMsGmZBppQmeVDh3yj?=
 =?us-ascii?Q?hW+b7fmT9RGMLTS0IRESqNgiQmU1WKKMNWxO496UvSNmM6YiJUqusaByyBZA?=
 =?us-ascii?Q?hh1cjJX8XhYB6lchDRwtnD9utInhJPirTS541SWZrwa9v+qpgT+UxaQt9N7t?=
 =?us-ascii?Q?+DyEtGs371RdDnHrLF2c3muqq9zvSa0VW14GykHt/JAej+Pwc8j/0jvJGBeo?=
 =?us-ascii?Q?mI4lzpxdsUZKpqf02z5Fj5tayEuMCApzBV0e1UkSNlcjuWGEnymAYGBctPrw?=
 =?us-ascii?Q?nVt1qQ10zS5UNe8Rle/6lie4cl9bxy34KG/d3+h2ati46kLPwnEGb1Y9iXN6?=
 =?us-ascii?Q?T569GATe0cerUzsKvOLuOEshfchN+VYkGkj6Xw1zdj+RK+mC34nGaxDhne88?=
 =?us-ascii?Q?kkpU7Ls0BraRcWZFhKgaEr8MhI9LXPp6Z9icwUFnXuqQhe0MLvRja8ZK68AQ?=
 =?us-ascii?Q?lw5tYEIyyKO8kgH1UICcR7E+IbW9ij4PD0jO2siZMgVdrNjV+mB3uBV0ZTz6?=
 =?us-ascii?Q?RnB/PDpwWmdkbV5uuEk8Kx3fOrECkotW6icnF+66l0ldQMDeEIt/3GQqqdjf?=
 =?us-ascii?Q?oRaVdtzSFfO1OJMvf+K/3zQxLoBy2knc5o88DJs4lR83b2UU0uDlUKsAQvEU?=
 =?us-ascii?Q?AAkbtlFFzeKc8PX33FQl8IQQkwuWEpKqN5yjPMqcJhSTbTQkzRtoMFAMtTfP?=
 =?us-ascii?Q?tzNUljcoJqbRg8CJtBh8rmeEL7Z5OnBCXwRHIxbaCzCSxT1M8eXRo5d8I1/h?=
 =?us-ascii?Q?tJAN0OQvW8IGt2s3NzwVb/z3o2Bez/6HszLiVn6ECDL9DYLEeGumP5izRDMD?=
 =?us-ascii?Q?hfFpQJfXb5uXrcW6Xo++pXs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc3163b-e22b-47b2-dc61-08de2859fe6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:26:52.1142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPSsoQwXSq8L8xQSDxHtzXhJRGAEYu/xcM1uiQLDHqzG8A/0doe0LHVJAHM0U5Fal08l7EfAVfGkbR2GU+AAW3MqWhyzm55loTD9OUQegbi2UxBBu2dXzqFFcAjpRbM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

On Wed, Nov 19, 2025 at 02:41:02PM -0800, Matthew Brost wrote:
>Use new pending job list iterator and new helper functions in Xe to
>avoid reaching into DRM scheduler internals.
>
>Part of this change involves removing pending jobs debug information
>from debugfs and devcoredump. As agreed, the pending job list should
>only be accessed when the scheduler is stopped. However, it's not
>straightforward to determine whether the scheduler is stopped from the
>shared debugfs/devcoredump code path. Additionally, the pending job list
>provides little useful information, as pending jobs can be inferred from
>seqnos and ring head/tail positions. Therefore, this debug information
>is being removed.
>
>v4:
> - Add comment around DRM_GPU_SCHED_STAT_NO_HANG (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
> drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
> drivers/gpu/drm/xe/xe_guc_submit.c       | 78 +++++-------------------
> drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
> drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
> 6 files changed, 24 insertions(+), 121 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>index f4f23317191f..9c8004d5dd91 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>@@ -7,7 +7,7 @@
>
> static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->base.pause_submit))
>+	if (!drm_sched_is_stopped(&sched->base))
> 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> }
>
>@@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> 	struct xe_sched_msg *msg;
>
>-	if (READ_ONCE(sched->base.pause_submit))
>+	if (drm_sched_is_stopped(&sched->base))
> 		return;
>
> 	msg = xe_sched_get_msg(sched);
>diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>index b971b6b69419..583372a78140 100644
>--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>@@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> {
> 	struct drm_sched_job *s_job;
>
>-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>-		struct drm_sched_fence *s_fence = s_job->s_fence;
>-		struct dma_fence *hw_fence = s_fence->parent;
>-
>+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
> 		if (to_xe_sched_job(s_job)->skip_emit ||
>-		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
>+		    !drm_sched_job_is_signaled(s_job))
> 			sched->base.ops->run_job(s_job);
>-	}
> }
>
> static inline bool
>@@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> 	return drm_sched_invalidate_job(&job->drm, threshold);
> }
>
>-static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>-					    struct xe_sched_job *job)
>-{
>-	spin_lock(&sched->base.job_list_lock);
>-	list_add(&job->drm.list, &sched->base.pending_list);
>-	spin_unlock(&sched->base.job_list_lock);
>-}
>-
> /**
>  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
>  * @sched: Xe GPU scheduler
>@@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> static inline
> struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
> {
>-	struct xe_sched_job *job, *r_job = NULL;
>-
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>-		struct drm_sched_fence *s_fence = job->drm.s_fence;
>-		struct dma_fence *hw_fence = s_fence->parent;
>+	struct drm_sched_job *job;
>
>-		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
>-			r_job = job;
>-			break;
>-		}
>-	}
>-	spin_unlock(&sched->base.job_list_lock);
>+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>+		if (!drm_sched_job_is_signaled(job))
>+			return to_xe_sched_job(job);
>
>-	return r_job;
>+	return NULL;
> }
>
> static inline int
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index d4ffdb71ef3d..3ee35d4873bc 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	struct xe_exec_queue *q = ge->q;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
> 	struct xe_gpu_scheduler *sched = &ge->sched;
>-	struct xe_sched_job *job;
>+	struct drm_sched_job *job;
> 	bool wedged = false;
>
> 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>@@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>
>-	xe_hw_fence_irq_stop(q->fence_irq);
>+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>+		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
>
> 	xe_sched_submission_start(sched);
>-
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>-		xe_sched_job_set_error(job, -ECANCELED);
>-	spin_unlock(&sched->base.job_list_lock);
>-
>-	xe_hw_fence_irq_start(q->fence_irq);
> }
>
> #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>@@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
> guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> {
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>-	struct xe_sched_job *tmp_job;
>+	struct drm_sched_job *tmp_job;
> 	struct xe_exec_queue *q = job->q;
> 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>@@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	unsigned int fw_ref;
> 	int err = -ETIME;
> 	pid_t pid = -1;
>-	int i = 0;
> 	bool wedged = false, skip_timeout_check;
>
> 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>@@ -1395,28 +1388,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		__deregister_exec_queue(guc, q);
> 	}
>
>-	/* Stop fence signaling */
>-	xe_hw_fence_irq_stop(q->fence_irq);
>+	/* Mark all outstanding jobs as bad, thus completing them */
>+	xe_sched_job_set_error(job, err);
>+	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>+		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
>
>-	/*
>-	 * Fence state now stable, stop / start scheduler which cleans up any
>-	 * fences that are complete
>-	 */
>-	xe_sched_add_pending_job(sched, job);
> 	xe_sched_submission_start(sched);
>-
> 	xe_guc_exec_queue_trigger_cleanup(q);
>
>-	/* Mark all outstanding jobs as bad, thus completing them */
>-	spin_lock(&sched->base.job_list_lock);
>-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
>-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
>-	spin_unlock(&sched->base.job_list_lock);
>-
>-	/* Start fence signaling */
>-	xe_hw_fence_irq_start(q->fence_irq);
>-
>-	return DRM_GPU_SCHED_STAT_RESET;
>+	/*
>+	 * We want the job added back to the pending list so it gets freed; this
>+	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
>+	 */
>+	return DRM_GPU_SCHED_STAT_NO_HANG;
>
> sched_enable:
> 	set_exec_queue_pending_tdr_exit(q);
>@@ -2244,7 +2228,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> 	struct drm_sched_job *s_job;
> 	struct xe_sched_job *job = NULL;
>
>-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> 		job = to_xe_sched_job(s_job);
>
> 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>@@ -2349,7 +2333,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> 		 * created after resfix done.
> 		 */
> 		if (q->guc->id != index ||
>-		    !READ_ONCE(q->guc->sched.base.pause_submit))
>+		    !drm_sched_is_stopped(&q->guc->sched.base))
> 			continue;
>
> 		guc_exec_queue_unpause(guc, q);
>@@ -2771,30 +2755,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> 	if (snapshot->parallel_execution)
> 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
>
>-	spin_lock(&sched->base.job_list_lock);
>-	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
>-	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
>-					       sizeof(struct pending_list_snapshot),
>-					       GFP_ATOMIC);
>-
>-	if (snapshot->pending_list) {
>-		struct xe_sched_job *job_iter;
>-
>-		i = 0;
>-		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
>-			snapshot->pending_list[i].seqno =
>-				xe_sched_job_seqno(job_iter);
>-			snapshot->pending_list[i].fence =
>-				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
>-			snapshot->pending_list[i].finished =
>-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
>-				? 1 : 0;
>-			i++;
>-		}
>-	}
>-
>-	spin_unlock(&sched->base.job_list_lock);
>-
> 	return snapshot;
> }
>
>@@ -2852,13 +2812,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>
> 	if (snapshot->parallel_execution)
> 		guc_exec_queue_wq_snapshot_print(snapshot, p);
>-
>-	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
>-	     i++)
>-		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
>-			   snapshot->pending_list[i].seqno,
>-			   snapshot->pending_list[i].fence,
>-			   snapshot->pending_list[i].finished);
> }
>
> /**
>@@ -2881,7 +2834,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
> 			xe_lrc_snapshot_free(snapshot->lrc[i]);
> 		kfree(snapshot->lrc);
> 	}
>-	kfree(snapshot->pending_list);
> 	kfree(snapshot);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>index dc7456c34583..0b08c79cf3b9 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>@@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
> 	u32 wq[WQ_SIZE / sizeof(u32)];
> };
>
>-struct pending_list_snapshot {
>-	u32 seqno;
>-	bool fence;
>-	bool finished;
>-};
>-
> /**
>  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
>  */
>@@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
> 		/** @wq: Workqueue Items */
> 		u32 wq[WQ_SIZE / sizeof(u32)];
> 	} parallel;
>-
>-	/** @pending_list_size: Size of the pending list snapshot array */
>-	int pending_list_size;
>-	/** @pending_list: snapshot of the pending list info */
>-	struct pending_list_snapshot *pending_list;
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
>index b2a0c46dfcd4..e65dfcdfdbc5 100644
>--- a/drivers/gpu/drm/xe/xe_hw_fence.c
>+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
>@@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
> 	irq_work_queue(&irq->work);
> }
>
>-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
>-{
>-	spin_lock_irq(&irq->lock);
>-	irq->enabled = false;
>-	spin_unlock_irq(&irq->lock);
>-}
>-
>-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
>-{
>-	spin_lock_irq(&irq->lock);
>-	irq->enabled = true;
>-	spin_unlock_irq(&irq->lock);
>-
>-	irq_work_queue(&irq->work);
>-}
>-
> void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> 			  struct xe_hw_fence_irq *irq, const char *name)
> {
>diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
>index f13a1c4982c7..599492c13f80 100644
>--- a/drivers/gpu/drm/xe/xe_hw_fence.h
>+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
>@@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
> void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
> void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
> void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
>-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
>-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
>
> void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> 			  struct xe_hw_fence_irq *irq, const char *name);
>-- 
>2.34.1
>
