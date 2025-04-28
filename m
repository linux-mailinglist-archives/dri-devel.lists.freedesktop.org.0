Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBBA9E5DD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 03:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1B010E0B7;
	Mon, 28 Apr 2025 01:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcCjM5Z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5274010E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 01:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745804374; x=1777340374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aOBOySVabWjs6mnpANTXC8tzOF9dkA0fMvhPTJQzm44=;
 b=YcCjM5Z+GN+ozM44T0Qr12EnmPoUNlalTKTuc2aPwmm+hDsBUTc87Qdm
 0ndmBn++IGG1P7f6qeJ2JeqyhNiZa0sczQIYqpvPGAps2usnPasVeqvQ+
 +NKBmNQt7GG5Gw4mviVbqeray1RjBUtwYXsRZZv72UA0c2nNZZxdkI78x
 7/9o9ySpe//C3+ds2qQCuSuIBhXdM8IMFHLJyyRNEmChRg/f44wSWRtSc
 KcRiAUZPB+aWjt3p+OvEGroGlDVVgUY0a8Qr1kiqNj/Ue1fmNekEtcPE/
 QjW8UC/jOBoLmjSN2bJifUm1X7NjVbSnkZjzgrUDW6Bup38xUXFeLMYr2 g==;
X-CSE-ConnectionGUID: NHlL8s8RQJWb6P3NtSVWWQ==
X-CSE-MsgGUID: MQ+7bWmaTWe6OZkNOXdwUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50035192"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="50035192"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:39:31 -0700
X-CSE-ConnectionGUID: kUCVH38OT3+xB3tWtBwUBQ==
X-CSE-MsgGUID: lMXKZx4ATV6OCv1BLBSi7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="164345877"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 18:39:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 18:39:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 18:39:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 18:39:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay5ldpcw/OG28ssaZPJzhkRYQc3RQugVdZ38hUa/fzYbV+SOf/rI8BCQHiR/c2LDDbYixucyQgdJXi3mYWtNJSQks6eiyeqPnX4yQLgSkt6+GiMV09BLeOynLA53G2R457+iYjgPZKXgqCA19dBlNyLPGaqnW2uhe3YBIyR8iPo9wUpZaY1AWQNK/WKmxvOlErIPMAKFxCpwCC1qoIsi1QPaaI/A8ofzN16TIwdWRDiWSB3GRYNEa3CeMTEflSMRbAH6ih1w+rXjXeBoir5zM5YhbWDVr4h3MJy5JHs1HNa1kpkaE7FFRZ7iql4zjp92sDyc0aUbCvAeWpBb6s9b1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H2/8YHaRyE8KH4beZHXaHGbdZ1wlKoFqzmfBZ6S7jk=;
 b=aaDdBUjkTGZHKE9YZpHa+A5Vz4xlD4Grr2yS028c09xl9gK5LuxGwov7AsidJE4VcYH8BsT6qlmdUH8KqkJ5fj48YjLntNGDOnxwQ3+LHn0ta0pmMbbaS61mP2bqM9tbVZbbOfYoSKphRRM8qrLZzYEm6Bz9xlxZHDeXfNXtokHu5GeaWQ1fvMIWRVo0w1Nw7qfsuYB5bvz9qjEtao1xYgQkxQlTg9BXgiYZlJjk841dmENltWwt9/vamUMZLThl8ZBiKYrqI0+svhPJOj30r4Lt/OBzQ4+uHx/R+aMehrmM6YLHeneB/CDPnc9P22DFNvetfbZ+CHfCIUaAFMaMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 01:39:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 01:39:00 +0000
Date: Sun, 27 Apr 2025 18:40:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm/xe: drop unused force_alloc flag
Message-ID: <aA7chuFumC3Q9lqL@lstrano-desk.jf.intel.com>
References: <20250423022920.27701-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250423022920.27701-1-airlied@gmail.com>
X-ClientProxiedBy: MW4PR04CA0265.namprd04.prod.outlook.com
 (2603:10b6:303:88::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 391aac1a-8913-4a24-9bad-08dd85f57306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8pNRW2mW49SiIp9YfcSLDKTGyGCdDXgWnNBnXKnR2skN7HPkfN1ki8fG7k5P?=
 =?us-ascii?Q?GOgVYV/Fud0tpuEbOm7+X6uIpFR7WLdkc74ozUintXwi9cbG0J3123PJpGin?=
 =?us-ascii?Q?E6HNkp9ffPqSWK0aHKq8gnDrmbO6wNfODjjRm2KZWS64dEjWtVwzBI2nwTLM?=
 =?us-ascii?Q?x97KXsQscwrKbQafQ2Hs2OOCODPpZq8Q+hgCF2mi4B9gE4lTLo+Ca+1WMTG/?=
 =?us-ascii?Q?C0uXaQvTR+PQa2C8vp/BH4ncfXZL+58jerC6V5sPsxMBJPFUSWejchiUKkwU?=
 =?us-ascii?Q?LFodDeS/lrqIflzTKWxiXS2+bO1UCeUIHjjgCgLroQAGSZw0XsLfseiOaTyl?=
 =?us-ascii?Q?F0bg/5Gkjha3PdeOAWzKnEaUa6nOtap61CpynNR90jPaj8P6qUCRqyt5otaS?=
 =?us-ascii?Q?s+Odhv5JSVBcrh7tG/E5rgV36Bho1EuH3Aaaf6dDSvVUwBxMFJ8I+XWbM5Wk?=
 =?us-ascii?Q?pySbTIYKcnU+bpR9qDkoxwA6h+pycpbYbA31I33Pon5THhdDkxLviUW8sb+b?=
 =?us-ascii?Q?VI03n6LsATlCbD9KNur2elQYHQuPYJI9GtJ0Pmmd73KMyzhDiSkTqd1K0hBl?=
 =?us-ascii?Q?C4aO/c+8C8R8YRJ7ibw9rC4GGbQiJNUzRoyyDtAUFWOBn0MzAxZLY1aJxKqn?=
 =?us-ascii?Q?p8mmY+h12EFm5MQNYWKHB5R+8jnDI6v25CrJqIHlL/Icb4wigZN9eMIZZlcg?=
 =?us-ascii?Q?16KFjr/TCS2Tv80MD7/0vsq8EARLEyaXZsuSqKbXJZKg/YjFZOrC7Y/8XdUF?=
 =?us-ascii?Q?XhnadOfovIfzJHr3TPXzZEEncNHjymDcdzgz4o/Ez7Wji83QuN7MKkmTsdsh?=
 =?us-ascii?Q?KCrHdh1Ye5sSm2YkNkEfBRdkXSD+e9Oufsr4Okcapbvu/g2oApyir94aHqbk?=
 =?us-ascii?Q?2BRDc6mEvzWsecCnhgKBth0LLamAUC5fx9MN/yRZ5Ass4XiPRbg/ZjlfG1zH?=
 =?us-ascii?Q?D4RbylV9h1d7aYlQ532I1zImtcJWKiaK52qENiCXmEK7Agq9Y9Hykrnp92T3?=
 =?us-ascii?Q?qjZGHByHswHL0at1Vq3I98C4PF4SyAPV/cm3vfekc9d7DjlH1EQ+Vo9MowYt?=
 =?us-ascii?Q?le/n/MIxRhxIo4doOskxVnYXAHNlO9X9q5f4BrlM32CbsvcTPryCUwoK/Axe?=
 =?us-ascii?Q?JX+M4iA01PF+/tH/xIuGaIQq/uDstQD1lxnL89HM6UtmvduSBiJe+uy9Dl3h?=
 =?us-ascii?Q?nzy37iFh127VYA2A/Gro0beW2mVhwcItj6QIaf/ErvAkqV8AAmmD0lphEbCY?=
 =?us-ascii?Q?tQRK8QvrqUjNUCk/QxoC6mGeJpPzgeukKepWqaULHKsiZlm4k+Srr+nHP3gM?=
 =?us-ascii?Q?6ytFkZxE5XjBMo22i57KU78uJJHAhAjEWE1uo92HYg/sAzkrS3/ptw3R7e0R?=
 =?us-ascii?Q?8BtcqoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o8Tgc9DRU2aC8Shyblprh2tHtAwkgYDXgsVscsrNZBkPC72K+bKKb9Q8jb0U?=
 =?us-ascii?Q?BKNqQZNg/E1dpb1HwqflkDz0UOLjq/tsGW+toTh5CxwQBQb6gFAs0F1TLt2s?=
 =?us-ascii?Q?5hoKOwAEzj64jh9knEo/XNjoY2loFZ1IeIR/bD56PrV8Gwf4i6HH9gVE/kUG?=
 =?us-ascii?Q?7S2L0cBC0Zr3RrHxrtWyrEKedusUyZCSQ39G6nq/fYVMPeqdi5U/LQpYAfHp?=
 =?us-ascii?Q?aJ3YBMHDjBT0TbP3fK9FCTXMMAV6Edo7K8WvuXyt6QLjcEl4VM8XJWJotU6o?=
 =?us-ascii?Q?hucaARArmHYs2wWrFkUUyoO7Hm7XGsCJOWAu7ZURAVlCuYfI/XA1Q7aKW31v?=
 =?us-ascii?Q?A7l2Tfxy/Kj0iIbMtpsHWnhlOR5/Ca6sRAh4p5LR57kndR44GliDILwPZguR?=
 =?us-ascii?Q?wWrf0M4vxic1IQI25JqEhqKF+V+oWVrmk+N7nHCG8JFQfjYl0uLV7yL0p/yN?=
 =?us-ascii?Q?8/CYGTbZm4sUR2fdK5jQ1uWa4ZWhd/reVlNOuvi4hs06Wi4M3zYYcfPn1/Ck?=
 =?us-ascii?Q?VUE6+vBrskSkuP93JhhJhVhSk0iuNHymd1ias+xih7WAYal16pW1pW1OsJZH?=
 =?us-ascii?Q?jyV+OZO8Qqvhzg2lTJODQb6QMDjnYwCjmT70LjoMjY/FPTg9SvrjLj4h1V6M?=
 =?us-ascii?Q?vlU9CAxKOR44QIL5CM+JdYr+Gz4YT2geF1brm4xj93ngJUHn3Z6gUAPOnCXk?=
 =?us-ascii?Q?GLlIY1w+cTJpHw49VViaEt31abFSt3xS6qq0s+c9hezaZSdTSuXcNh/uOC4u?=
 =?us-ascii?Q?AeBx/AcEd6Sdcdu+uNl2aj96SINQuoUF1N9mxf6YmIXvyVn0iCpjp/FLzg1r?=
 =?us-ascii?Q?P1myuM7Yxk+U7z0Uvv6EzEH2jokTvTjTUPXhdDPD6eE9I8DcGwYPAZxstt1j?=
 =?us-ascii?Q?8rfbU+DUHisstj3I+roeMBwqz1vjn/Zfr37oX9PzGuk0I/gcIx2oYc65/oTd?=
 =?us-ascii?Q?CwSM0wZaEL9zY0PMjLQgybRPVN7Fe7qNN7d73iFwyXz18iBvL91sddwZns9I?=
 =?us-ascii?Q?ZRS5ILNOevTWQwEl5eXqfGDe31nql0FoH2nDOmEUeySyFdVJnKgqrdKJt8mq?=
 =?us-ascii?Q?XVnUeesYjvbiBYApKCV/a81cbizmPBr6lXJW77L4VP2pt7gLhel7EukXu5R5?=
 =?us-ascii?Q?c5hzx4BFdNvkLDJ7EkC0mrmCKZdKCvcpk6XbjW0qX/jhvexfXG6T3vvSGYy5?=
 =?us-ascii?Q?UtYgtNQSLFk9Bq6fun3N1Nyjk7c0JCw8WWTwYzo900FoXD7gBuSsf8dqxeqd?=
 =?us-ascii?Q?OSntZAKCAzK0wcwsY5rRm5L1bmKMTNGlIp8vbf5lUEHmc36uYc1+c8YB5mhq?=
 =?us-ascii?Q?NReR39hzzhTzCePbz/3ahDkVrHaSshxDubafq5HY6ip6tnGvNIYfOw4zl+Tw?=
 =?us-ascii?Q?E+V630Lv0PEC2R1iQUIIJGUhbCsjhcIO6Rxqnu3h7E+uonfYJW2y/TdKBZcD?=
 =?us-ascii?Q?TBJJrGkNA1sqi+AbnbhI1GYF4cW1U52Xt2MyppTuB6WcQH1W7jn7n1i5MQrV?=
 =?us-ascii?Q?v3xJAHNUM5Tf6KT+p+22XjY6OcyrP/vqPO+JjXsZTi7BmuOBoKyJ2tGB14kP?=
 =?us-ascii?Q?bHrs9hiihaqhkYy9vuhid4570etCYH6A4EDZorHGUAoNXHWWAKf2R6+Mfa3I?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391aac1a-8913-4a24-9bad-08dd85f57306
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 01:39:00.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVTmCOBkoP5yxA9JuAlUTjKwzpAB6H/BuBGcJY4lChtkrVzKevpBl1u7hR1sX8VLlErBkTHXT12lzbgfx/LeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
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

On Wed, Apr 23, 2025 at 12:29:20PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This flag used to be used in the old memory tracking code, that
> code got migrated into the vmwgfx driver[1], and then got removed
> from the tree[2], but this piece got left behind.
> 
> [1] f07069da6b4c ("drm/ttm: move memory accounting into vmwgfx v4")
> [2] 8aadeb8ad874 ("drm/vmwgfx: Remove the dedicated memory accounting")
> 
> Cleanup the dead code.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Opps, this broke Xe's selftests [3] - see the kunit failure. My bad on
the RB, always forget about those. Anyways, easy fix which I posted but
maybe going forward CC intel-xe list to trigger our CI.

Matt

[3] https://patchwork.freedesktop.org/series/148313/

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c    | 1 -
>  drivers/gpu/drm/ttm/ttm_resource.c | 1 -
>  drivers/gpu/drm/xe/xe_bo.c         | 4 +---
>  drivers/gpu/drm/xe/xe_bo.h         | 2 +-
>  drivers/gpu/drm/xe/xe_dma_buf.c    | 2 +-
>  include/drm/ttm/ttm_bo.h           | 2 --
>  6 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..bdfa6ecfef05 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -220,7 +220,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		struct ttm_operation_ctx ctx = {
>  			.interruptible = true,
>  			.no_wait_gpu = false,
> -			.force_alloc = true
>  		};
>  
>  		ttm = bo->ttm;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7e5a60c55813..769b0ca9be47 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -548,7 +548,6 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = true
>  	};
>  	struct dma_fence *fence;
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..32a5a6390f62 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2759,19 +2759,17 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
>  /**
>   * xe_bo_evict - Evict an object to evict placement
>   * @bo: The buffer object to migrate.
> - * @force_alloc: Set force_alloc in ttm_operation_ctx
>   *
>   * On successful completion, the object memory will be moved to evict
>   * placement. This function blocks until the object has been fully moved.
>   *
>   * Return: 0 on success. Negative error code on failure.
>   */
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
> +int xe_bo_evict(struct xe_bo *bo)
>  {
>  	struct ttm_operation_ctx ctx = {
>  		.interruptible = false,
>  		.no_wait_gpu = false,
> -		.force_alloc = force_alloc,
>  		.gfp_retry_mayfail = true,
>  	};
>  	struct ttm_placement placement;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index ec3e4446d027..1a3734d9f8be 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -271,7 +271,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
>  bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
> -int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
> +int xe_bo_evict(struct xe_bo *bo);
>  
>  int xe_bo_evict_pinned(struct xe_bo *bo);
>  int xe_bo_restore_pinned(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index f67803e15a0e..f06961575d8a 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -236,7 +236,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  	struct drm_gem_object *obj = attach->importer_priv;
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> -	XE_WARN_ON(xe_bo_evict(bo, false));
> +	XE_WARN_ON(xe_bo_evict(bo));
>  }
>  
>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..cf027558b6db 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -172,7 +172,6 @@ struct ttm_bo_kmap_obj {
>   * @gfp_retry_mayfail: Set the __GFP_RETRY_MAYFAIL when allocation pages.
>   * @allow_res_evict: Allow eviction of reserved BOs. Can be used when multiple
>   * BOs share the same reservation object.
> - * @force_alloc: Don't check the memory account during suspend or CPU page
>   * faults. Should only be used by TTM internally.
>   * @resv: Reservation object to allow reserved evictions with.
>   * @bytes_moved: Statistics on how many bytes have been moved.
> @@ -185,7 +184,6 @@ struct ttm_operation_ctx {
>  	bool no_wait_gpu;
>  	bool gfp_retry_mayfail;
>  	bool allow_res_evict;
> -	bool force_alloc;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
>  };
> -- 
> 2.48.1
> 
