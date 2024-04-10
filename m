Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DF89FCB6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 18:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79C610E53E;
	Wed, 10 Apr 2024 16:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASuevCac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046B10E53E;
 Wed, 10 Apr 2024 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712765951; x=1744301951;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8JruKfEFx+biGlPIcX/yKqp0g0wrga0Y9h7oCpoDiMc=;
 b=ASuevCac82EJZziqbgp3ca0nK61UW3JOxE4O5LoGX/okTtyXLE9NZXpP
 kLzBuwq3oLvFgjMx2/7xbI/DCeIYlEZQTHi6q7CuS1KYj4+PFZxY2/THe
 8UMt4cWhcgKrgggP5cEakd5bt0Ps9K3PnSxFHAFdRUjOVnD0DHZ8myyvh
 Mp/+Ia2Y7M4iAhdB9OE3+shUrkcteh6NUkPfXvJsjGh5oKu6Bh+OmIHI6
 vgElIx9mCM/pVxgXCtE4jv7hRj3nJI/Q6Gtz0V//AIzaDKSc6tPqdBBVx
 LE5plF7dMRN5wnbWBciPJf+1XAFOI7N3pafO0GCjR5ECl8YHobl3en50g Q==;
X-CSE-ConnectionGUID: MG4VZnoPTzu96Ca0MYwl0w==
X-CSE-MsgGUID: tKv6foBOSZOfYFfmRYI5sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25589210"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25589210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 09:19:11 -0700
X-CSE-ConnectionGUID: A8zEAPQDRoahvh4id2mR+w==
X-CSE-MsgGUID: n4OZsaLPRy2WdUMaZg56TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20553669"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 09:19:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:19:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 09:19:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 09:19:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 09:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN05J0Uur5yFyufuL2U03LpnID0zzzxwRZywtP7bOFmH6J9B8upjgpqbwS/DrRYS1KSo0FKjlEhT7WaKoCqVOTisIGGJxWkXnqDPvEfBVlbkF1ShN/sCGV/jWYXNGlRLv8PdheGBvG8Y8xkEWPdqShtQ6b0CmOHFJrCl3FpkTWwUemH/Zh2EzvGc2hMFG1lTr/NYPe6OIkzEyn5FS5a/2oF0E2oAavOuWu0wzMKRjinsLq2RetSioRFfKavBBcF6cjTR3UQPuJYLcKSR7Z+XHQIp2g3zsiUrMi9Wd2cCbNu/KUHGGg061HRyQp3DLcVVsbMuA2YDvWDsTSYnO4m/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr7cUw377XPTs6GWZ2f4af+34Y/ZpAeZMo8wNTFdw5U=;
 b=bohHp/gFKx+ctFzcv5vXKjLySaxCzGmwT1a3rEm9U5bi/VKX2JLg5Q3nocblm4FMaLzUfNeMopfJKtogwzQMx0h8wqq+3C8PadSAebS+IgP8qb5FV1NcCcE46hv4s+7+6nAEt5ey3Izk3U9mIBYf9FOsRqBz+RlMfLg75ZlsAgeIcBlrqWUbAnDiPjTXl/3ekYRMut6KpBT2OJsLIaB6WRTvDIdgg9qZPyYiBMtrvHTATMp3f0aw4xjOeSfRkA9DGo1FWlmTSCjZMovytXsaGZ1LZTVxJAUBlCVrahb8E+FAkfs6YnqMRSPfRbIcJi6mCxKZ4wusHgyBCEAyz7TZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 16:19:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 16:19:07 +0000
Date: Wed, 10 Apr 2024 12:19:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <tzimmermann@suse.de>, <mripard@kernel.org>,
 <maarten.lankhorst@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <ankit.k.nautiyal@intel.com>, <jani.nikula@intel.com>, <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/dp: correct struct member name in documentation
Message-ID: <Zha79kKYTltfOtDA@intel.com>
References: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240405065159.439145-1-mitulkumar.ajitkumar.golani@intel.com>
X-ClientProxiedBy: DS7PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7266:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CYxGo5eP8AYPBoyqpXK3sBC5sMYniqK/nu4aCGafm42fOFf3bUaim8t0CDD7/e2zQFz2q5N89Wls8hQqZ/i/69wrs9YAJG/OkhloPE08HD4Q/a91/KkfgqGarJipTMbZXw1JW9BE5C2VvDF0e7/ad6M7AE+mlB4avJuSwQLiGd8wvwvxaxIhqs0v0vlVMWu4kVnXN+b+ScXsikhLwByudW4L12YFSPL+3hf/ss6XqE6Z4WtIlP2MDdaWT/6+wBFWYGDp8eJASG/ONCjseRjB6ZYYhYMqtEOYeUmGJx7NPk2vS70dYvjCGBrbaHHpnvDFHbz+l+9Bewb/3S5MEznoRwA+hjyc9Kc6+MO0dp5nHtU4rMkp6HFqgVMzoPJBS/45uVfsNuh8XOaMqDWF9UwK75fdJyJEdYiYN5MUovlgrx0k0m4E4bdcySQ4a5TzdWKQ40Q3RlNAy9InGxAZ/pA02JHKcEug72RbrC3ubPaERBi733MbPJNutn33Q99rTNsXlY/NBqAa7/Tupvi66gZdBKnytcHpA6UZNe6pqeYVmvSjP1ZVEVI/AfZ+KF3xw8iALAcDlRZqb0FVTYTyXttHZqo6Kc9t1c8du9F1j55pxxfJ6FZCvxniah4Bq710z4LTXFPEPW5QQyQ5DOQYhV2ecA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PL9p/v/s8Q4vL3mcxsPG4lKn5GjroutjUoFu5zF63hnHyGiXmMHiIKp5B91I?=
 =?us-ascii?Q?nGq0Jcw0aYFomN+p0isRy1gLp6QGQLsIVmxNdCM2g7bZM6s0zlrdRyEVFUzt?=
 =?us-ascii?Q?t0JcNdc/xfq6p8djCYUb71V71VOEpg7/yorbQzKtcB2Y4nV/9qjup3ERcyuV?=
 =?us-ascii?Q?X8z5E7TL62XiVq2F3IhO32hisRpd/e49BQa3mmZvdEuLvVKOWMBNQ9+5SCMp?=
 =?us-ascii?Q?Tihy4OzHxhkVhRqls9N4chptMqYD9/HqLTUsZBDxNkbTgSZ4eHcx+2uJ336A?=
 =?us-ascii?Q?cGzyFJlPf1sl9lWUwBfCZo+RmsUG1cHT6QKE4qtUveBXgzl1C2ueSaK1Hi6j?=
 =?us-ascii?Q?ROSeRQqap1yThSNk7qXxEdIspM2twHW1zpU8YCxUFHB86ILwdSE/Dh8gOb8U?=
 =?us-ascii?Q?4Ljxbh91Teo5T7p3++9UE+eaXYJE0ZIhHHWZuNi4fUkbr0SxI5tyAEK1OtZm?=
 =?us-ascii?Q?fBD2EIZPR64wtCko1wkrjpW1yWU5HPcSQXPF1EVsgskGWKcMjcVKaq/t2OMK?=
 =?us-ascii?Q?sAsvIROPQf+zLusEkrD3bDudwTiwn1Es5YT5/GHxqq0of5DsdL+I8ikI5m/o?=
 =?us-ascii?Q?bW5r+zPIgWTYZiwpXmizsJV9Vwiqkffic9hRyPXlARO1TVJ6pQwk2PP4xVUQ?=
 =?us-ascii?Q?ROTKTayqvURr/ZF6AvriCPK+C5iLBUR9DkQosqhvO/2Ii/AYbsRP//oNZ6Kn?=
 =?us-ascii?Q?vQdPv38lm9l4ptqrVTQOUvYCj40U90piRUpmk7UDTSg97UHXp4cjgDIzMUQl?=
 =?us-ascii?Q?C8C4wFLKuF4Mavrh3KMpUjqsZPacQevvFapapSq5qd1w76DrSQboGjIsXg4n?=
 =?us-ascii?Q?OSp4Q5rI/2SPJlMIK5etuxO5kznR6v3bVd4Jfi/GaQ1eO0M0V0y4/jzJgEYg?=
 =?us-ascii?Q?a+UpgpNgkO2PjH6zTW3i0IhZ7qjfJUo62/sQW/yQ86EKN/dAbcfs7yw5eIpH?=
 =?us-ascii?Q?CIhPbYJcTaLJWgojX1hZZAC5T/HJ9AxNhAL0uK1mLmbpJmZOoJiHiuaLQXqI?=
 =?us-ascii?Q?LOyUsX8YpD/l/EKJhHGNdLZBebkBdguqc+OwjesQxyMpZ/Mlmu9+NjIuOXw5?=
 =?us-ascii?Q?9usBzwjxUZ7lrB1owZbKX54rOoCM/jEAjRb3XOg/yNRUvj/gyYflmTS6eBTV?=
 =?us-ascii?Q?mENjDRGcjjAMlfmxzAC3amsZWfN4s1GPkSDEBABy7TQro75jwkg9QhRNU+LO?=
 =?us-ascii?Q?MJ2q8v8uWUkYvB3P1H498fM1OwTxqFFcP3X2JE7bSagBy4uCskcVmD/ljX+n?=
 =?us-ascii?Q?ot40UJnv3M1ZYXcgningG/Aj7xcih3nOYNMvJwvC/RNwq8Fb/rF4pG1/waol?=
 =?us-ascii?Q?tO1HVQnWqAiBCIBDjFerTUWOZuPzI8JFEqHHI8IscC7zzR3V2UIi3Ko/uDPG?=
 =?us-ascii?Q?xPp3bZMHHG3Ts/OArZG7DpM3NPqGgc4ocd4m2OMGoEefnN4nufEjwRImDt/7?=
 =?us-ascii?Q?/8sZgwRefhTnEhV4Q5cdp7uqhGjtS3xe90YDyI5Sw0WJROZ69fzbRthxb4EQ?=
 =?us-ascii?Q?aXJkEn4uzzm2Vx4egTjw1LR2KS7ev5rYp0UnmdFTOEwuZFsDi7JuNHW6FQec?=
 =?us-ascii?Q?mGxV4Sjiu3zBKlkUstiNmDrot/NI3oBQCsB0xKWR5Vs0La+poRSRRd7nIuiO?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc8b4a6-707f-4b74-88cd-08dc5979f227
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:19:07.1695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xlt1207lyfpmqZLnP6fi7qEQMQHhSPkZIOMg35pUUP5osVWdKn1I0KuAcDDXOzWVioaDlrCroS6S9Mzq2tVgiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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

On Fri, Apr 05, 2024 at 12:21:59PM +0530, Mitul Golani wrote:
> Correct struct member name to 'mode' instead of 'operation mode'
> in 'drm_dp_as_sdp' structure description.
> 
> Fixes: 0bbb8f594e33 ("drm/dp: Add Adaptive Sync SDP logging")

Probably good to avoid this 'Fixes:' tag, and only use that
for real code bugs.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>

drm-misc folks, ack to get this through drm-intel-next,
where the original patch is?

Thanks,
Rodrigo

> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

> ---
>  include/drm/display/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index baf9949ff96f..6799f57d635c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,7 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> - * @operation_mode: Adaptive Sync Operation Mode
> + * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
>  	unsigned char sdp_type;
> -- 
> 2.25.1
> 
