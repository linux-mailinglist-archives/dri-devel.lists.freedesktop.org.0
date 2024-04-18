Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D18AA5CB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 01:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE410EE10;
	Thu, 18 Apr 2024 23:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzBLYLsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3DA10EE10;
 Thu, 18 Apr 2024 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713482880; x=1745018880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wD8GYn23fFFk+9ioR4kyYJK5lpzBwL4ttmZfNyqOyDY=;
 b=AzBLYLsVDV+XVBdcwoSIPHKDz7S/Rx5y31j0dbG9LlGD+PmUtBj7U1wj
 mIg7pChGqQDQAwHVZhqQDl0iBqwxG9gd3oK/ezSgr8TR9BfE0PPx8og7k
 VRQ4JBg0mnP7xLasORUODTGB428gLLtrTg7yjYjD5np/NJAYzZGBgapNg
 EYC218Mytc6n+oGlKGLD/6KTDuS4zFVsZlDdbvuJ7sasCTOISq4TlyYDB
 evdwjjBjLtizWHc+8jJpntyvF6NfXTHDy+emso7hChOlIyslDhDWiDQJ3
 tw6iZDFVYLixWMAejfgLckfhl/Fy182eHqeGOJmE/05Ttb+Uvsyawyd4V A==;
X-CSE-ConnectionGUID: nZM2uqApSXSLwy0MGVLA/w==
X-CSE-MsgGUID: 8pWKrWWuTYeD42nA0b6tlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12901390"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12901390"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 16:27:47 -0700
X-CSE-ConnectionGUID: Xq2CfnenTh6hX6CHiS0ZZA==
X-CSE-MsgGUID: RIrKCrFQQzu5j+FTRxJFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54067732"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 16:27:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 16:27:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 16:27:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N65Z6MIiXvgnudgPBQNxXwW5cP5q0qBCSly2YddN8pu/Qc4yJ/Umt3OAHYxErKbp4uRTi6B+pEII0nlTI0iLnVazI7vsRchIohz8TkxfcxP16+CQGjIMQuATFdjc/5jbFF7nKxlH83FnEf3+477x6z+pLqC4bdBHhDNL4zx5NjjtRr/g7XiSAN+Qr+Ovx99L0k4ZPBC9o9dCI3rJr9iiya1/ClJqvo/vagchXAlBg2++tCVN8D2cyuJka+Vr1/2RTZ3UALwCq6M3bsOPK/u1UYEzlS6xgCUXzS0aU0j5Od7Ji4DSEnpDHQvbDXlobd1UOPceD6P6WphVe/Rssi8E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es4yjRR1IXfVeo4JsC8R+UnQ/6Al9wf7Ud7OGyBlkCU=;
 b=RDF3EGjnWNCfn33zUZ/RWt+ecUCiAJ+SguHoKOVEad1hhG7kzRAeF04oiqZtppJof0FJJG/NMOQ041AITyuzll659WcocswLYHbUIIpEleiH9Woqla8qIJEjNXpw6ShKDhz9DiLKHxCCcBFS2/OWQXbJAbjiSKhJ9QKI87oSwjILH/8rfXJlQFqOjh5TMlp7CNFA4fdColXJinh5zK6jI8AFkGNsJrrF1gMsi2SxbLhPb9fprlhQn3Ab0wHZfs6BFHYa9RbojL+fiwLsvqDgOHlELgVxzQlbIY2iWMiJrSAseYcO1Oj/hBlNgrBVZQ5dk3SH6E1jlZoQMVDb+KccGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 23:27:38 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::ccc5:e88:3bcf:edf2]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::ccc5:e88:3bcf:edf2%3]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 23:27:38 +0000
Message-ID: <c76fc94d-7759-4908-bbff-9845931234b8@intel.com>
Date: Thu, 18 Apr 2024 16:27:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/i915 Rename intel_engine_reset to
 intel_gt_engine_recover
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240418171055.31371-1-nirmoy.das@intel.com>
 <20240418171055.31371-2-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240418171055.31371-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1c6661-c390-4f59-1210-08dc5fff22d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: pmYRfAfipeKKwzx7QortAhR6lCzttQ6fCxYejNL/zkoQzYHrt8s+kemIlGO+8qj4fA0zGoq/f7arze1cH9eZX2/vYW4/vJ+yxIEdSYviBWv0ISjcGVwFKuZADNCJoDGMY6OrKxy9hFtYhx0t7OyJtjJO4Fje1z+0KzELxSAeowLMvv8CLeUWo88QuUudYzOOy4hvmfPKC/qnlZDE29RC8Ba/F0qx4HEFcZT+2OgfK50J3Twvb+ruPvhexLF5V/X9jxjo194tz4NUxDU3uquG9u8xjT7Mt2QyTueSnyoWrkZ91cEBj1aj8aBYupGFYm0fu/01ceUmlkTpbb9BjVRja6KcX1aADOmVnKn8Op8TKrq6gJG5QXJbQYFHq04+mA9jSnLi/6reicyplzBkjjXnXerDO3REcYrn2zcSIAhrb4wlxVMPCdVxEaCfviXosNUGW6ZGdUWR7bVIggw8H9uY3/8zOcIbX9AgHOsUaGhsBtkiATLeT5aKEIvoOhdg3kvvC/26rjbNStFdz5/w7a4AbQHl/r7MJbKPJAeDcd7Sl2tSsoELy6W7cvNAYDGeJyIVrlSHsKHoidNtMdTW6joNES8AL8VFfyxNSNHlqFcJ4mbXHGTRfd+YPAvqPpBws/FXIFw9XmuEbTZWws55KfrdZg9Kc4b65aiuUEFPI5DiY5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2tZMlZ4cStUMjd4TmRwQzFhd1lBMCtONFkyNGFxSjNlWFpoTjFiM3VBTGs3?=
 =?utf-8?B?M1BRamx0M2FNNk5Za0VBR3NieWNCTmgwMnJhZVpkQWQwK2hmaS9qRDFvVWFW?=
 =?utf-8?B?bG1LQlZ2UlExc2JOT3FLMVRBSGJ5RjNaM2w2d3hYZmszelg5cnF3eTQzaU1G?=
 =?utf-8?B?LzVUa0l1TGJIUnM0Yzc1WkdIRm5wdld3OEo2VUZBd2IzaHVBa1NsdDNodlg1?=
 =?utf-8?B?Z2pnb29sR2ZGTkJvWlE0YmxVaXRqNVg4K0xSZlhHUXFkNUVqelVHV1FZOUZh?=
 =?utf-8?B?NVpDVDh5aEdDN1UrSEpqZHV6Vy9vMkwvNFNqazYxbFdKY3JucWRYRWhsOU8y?=
 =?utf-8?B?TE1sdkFFMkJidVc1RUpJLzBaMm1VVGM5Q0lMWnR3QTM2L1lXc3R1anFIay9I?=
 =?utf-8?B?QjAwNUhXZFdlM2N4c2pDN2Q5S0FlK2hUZ0RuTjVQUHY3RHpUZDdhbmxuUGVW?=
 =?utf-8?B?Wm1LTGNzWTk2eDdMcGc1c0MzTkNCdm9RQWgyVU03MkZNeTUybmt0bzV2WUFL?=
 =?utf-8?B?Vk9JN25VZjdHQlJLbU1DeEJCV0RkZmoxUHZXNkYvZFBnWXBzUU1kNU5LTWJq?=
 =?utf-8?B?c3ZFS3BaNmNyNGZSRUNITFd5K3p6T0ZGR25RSlhoenlsMm5IaGJxSzlCNkQ0?=
 =?utf-8?B?eW9xMmk2YWQ3bTI0T01CcStCQ3ljT2xVMUVFbUtzNVhheURHZVlxc2VDRFNW?=
 =?utf-8?B?U3EwMk8xQXRxSG9HVmlQeVFBQXozYXp0YXNIQ245UTJQWEJKOEw4UXVMN0Vl?=
 =?utf-8?B?VEp2M1VtRHBseTBzcXZ6bUp6NmIyWW8xc2VFWm1jaXBMWDF0Q2FiYnd5UWZu?=
 =?utf-8?B?UmFydDRveEQ3V1VyUU1qeFZRd2xPS3ZRQ2RHL0swTllPajRlamE2dnJvaWRT?=
 =?utf-8?B?akRnak00UEZxSW9OQjVITTFhTndGamV1U1NwbXBzSCs3c1lpc2I4UzNJUzFx?=
 =?utf-8?B?dWphZkdvamZSK2JYZ01Xc3hZNmUwZ1ZGUis4MDBsVnJRRlAyYWpLNjdQdGd0?=
 =?utf-8?B?UlVvOVhxa3g3V051OVJpOFhSeXRwMHpyOEQzeTh6VlV6K3RtWGZGb1ExTFZP?=
 =?utf-8?B?czdHcGh1dHBrRlZxbzR3dTVrQW1EUzhtYkl3dDcwcGxWN2s0MkxFc0FiTCtw?=
 =?utf-8?B?K1B6MzA5d1ZnbUNZemtjck0rbk1nb0ZQRzhXUytaWkd6VzJuOXg4N3pocXdT?=
 =?utf-8?B?U2xyV202aEFmTFBYQjFmWGtEa3Y2b0pUWEJpYUtGN1Rmd2crMENoOE1tUGZs?=
 =?utf-8?B?UnlNMDBlYUlqd0ZKSEhGZ3dBLzBrU3d2dTFQUG9qSnRGVFpiQVQ5ZGtYR3F1?=
 =?utf-8?B?OWxpekRNZjZTc3FKT252NmszUnJFejZXZmxRb3JDckdGZ3o5Z3R4d0lCd3Rr?=
 =?utf-8?B?dUhIL014VGs5WlU3MW05T1A5TWNTYnN0UUFadENzNEtSdHFXTEVWajRJcVR1?=
 =?utf-8?B?SzR2blpRWEZVeCtkRFhLc1pNVUwyaTRJcS9pUnp0dGdwendqandjWnc0eDVt?=
 =?utf-8?B?ZjZJMlgxMGFNTUpKbU41cUl3ZDBzOGx4dGY1OVFwY0RyRGZOVHFFNGxtbmpX?=
 =?utf-8?B?dGQydmZZcTRGRGR5bGdEb21KNDlHTmN5YXJUU3ZNamZGdDVhUk8rYlFBZXJ3?=
 =?utf-8?B?ZVR1SU1SODIzdGpJeThyOVJPaHRuY2lsTVNncVBvY1IwbHNNMlFKdGFoUmJX?=
 =?utf-8?B?aWt3UTZPcTVwN0xiVjF1OVA2and0T1d2RFlxNDF2R0U1L1Y5Q3M4NWExZ01V?=
 =?utf-8?B?RGtXVDdZcldUMlRZa0VIajI1QzR2VkJTdXQreWQ5WU8xUUljdmt2QVJULytO?=
 =?utf-8?B?ME50ZSt6ZFNwSGdTUzU3blQ0cyt2VVd0elBWT1prb2RUYXRQOU5uU1pkRmR6?=
 =?utf-8?B?dFFhbmJWTW93eENKY2F5NzNnOVFFek1qb3hORk00SHJmY2dxY0RWYjhwVnZF?=
 =?utf-8?B?WHdPZFRTaHBQQVluYjJIR3VKaVFMSXBwVjdlWHp3OXpGVlNnVVBJTnlyT1Ez?=
 =?utf-8?B?SUNVTWk4VjZiMkErck9PODJGbXRmR2llSWNhZHRHWEkzWDZtc08wV01NdDlD?=
 =?utf-8?B?TC9ZbFZVSk9JK3FjSmhzbEJzekFqM1VDNFFpRTFMeFNVemhCYUN1RGxkRFpi?=
 =?utf-8?B?b0F5WGIxMmMwYnhHVGFETjRya0hycEJUY21IMTZKMUI4R0p1dExqY3BTb2k0?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1c6661-c390-4f59-1210-08dc5fff22d6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 23:27:38.6267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2ua+1MDqeUsRuZbtWZ56n2HHM5JFtXRPTyW2encnLApZ7AsQ+8N62pwLNZ6DpbXWgDO+KjBqSTQ42G+lmMMvMTvvYNRCauAf5lI1PqzYKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On 4/18/2024 10:10, Nirmoy Das wrote:
> intel_engine_reset() not only reset a engine but also
> tries to recover it so give it a proper name without
> any functional changes.
Not seeing what the difference is. If this was a super low level 
function (with an __ prefix for example) then one might expect it to 
literally just poke the reset register and leave the engine in a dead 
state. But as a high level function, I think it is reasonable to expect 
a reset function to 'recover' the entity being reset.

Also, many of the callers are tests that are explicitly testing reset. 
So now the tests all talk about attempting resets, resets failing, etc. 
but around a call to 'recover' instead of 'reset', which seems confusing.

John.

>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
>   .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
>   drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++--
>   drivers/gpu/drm/i915/gt/intel_reset.h         |  4 ++--
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 20 +++++++++----------
>   drivers/gpu/drm/i915/gt/selftest_mocs.c       |  4 ++--
>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  2 +-
>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 +++---
>   8 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 89d4dc8b60c6..4f4cde55f621 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -1171,7 +1171,7 @@ __sseu_finish(const char *name,
>   	int ret = 0;
>   
>   	if (flags & TEST_RESET) {
> -		ret = intel_engine_reset(ce->engine, "sseu");
> +		ret = intel_gt_engine_recover(ce->engine, "sseu");
>   		if (ret)
>   			goto out;
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 21829439e686..9485a622a704 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2404,7 +2404,7 @@ static void execlists_reset(struct intel_engine_cs *engine, const char *msg)
>   
>   	ring_set_paused(engine, 1); /* Freeze the current request in place */
>   	execlists_capture(engine);
> -	intel_engine_reset(engine, msg);
> +	intel_gt_engine_recover(engine, msg);
>   
>   	tasklet_enable(&engine->sched_engine->tasklet);
>   	clear_and_wake_up_bit(bit, lock);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index b825daace58e..6504e8ba9c58 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1348,7 +1348,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>   }
>   
>   /**
> - * intel_engine_reset - reset GPU engine to recover from a hang
> + * intel_gt_engine_recover - reset GPU engine to recover from a hang
>    * @engine: engine to reset
>    * @msg: reason for GPU reset; or NULL for no drm_notice()
>    *
> @@ -1360,7 +1360,7 @@ int __intel_engine_reset_bh(struct intel_engine_cs *engine, const char *msg)
>    *  - reset engine (which will force the engine to idle)
>    *  - re-init/configure engine
>    */
> -int intel_engine_reset(struct intel_engine_cs *engine, const char *msg)
> +int intel_gt_engine_recover(struct intel_engine_cs *engine, const char *msg)
>   {
>   	int err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.h b/drivers/gpu/drm/i915/gt/intel_reset.h
> index c00de353075c..be984357bf27 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.h
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.h
> @@ -31,8 +31,8 @@ void intel_gt_handle_error(struct intel_gt *gt,
>   void intel_gt_reset(struct intel_gt *gt,
>   		    intel_engine_mask_t stalled_mask,
>   		    const char *reason);
> -int intel_engine_reset(struct intel_engine_cs *engine,
> -		       const char *reason);
> +int intel_gt_engine_recover(struct intel_engine_cs *engine,
> +			    const char *reason);
>   int __intel_engine_reset_bh(struct intel_engine_cs *engine,
>   			    const char *reason);
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 9ce8ff1c04fe..9bfda3f2bd24 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -495,9 +495,9 @@ static int igt_reset_nop_engine(void *arg)
>   
>   				i915_request_add(rq);
>   			}
> -			err = intel_engine_reset(engine, NULL);
> +			err = intel_gt_engine_recover(engine, NULL);
>   			if (err) {
> -				pr_err("intel_engine_reset(%s) failed, err:%d\n",
> +				pr_err("intel_gt_engine_recover(%s) failed, err:%d\n",
>   				       engine->name, err);
>   				break;
>   			}
> @@ -574,7 +574,7 @@ static int igt_reset_fail_engine(void *arg)
>   					    &gt->reset.flags));
>   
>   		force_reset_timeout(engine);
> -		err = intel_engine_reset(engine, NULL);
> +		err = intel_gt_engine_recover(engine, NULL);
>   		cancel_reset_timeout(engine);
>   		if (err == 0) /* timeouts only generated on gen8+ */
>   			goto skip;
> @@ -623,9 +623,9 @@ static int igt_reset_fail_engine(void *arg)
>   			}
>   
>   			if (count & 1) {
> -				err = intel_engine_reset(engine, NULL);
> +				err = intel_gt_engine_recover(engine, NULL);
>   				if (err) {
> -					GEM_TRACE_ERR("intel_engine_reset(%s) failed, err:%d\n",
> +					GEM_TRACE_ERR("intel_gt_engine_recover(%s) failed, err:%d\n",
>   						      engine->name, err);
>   					GEM_TRACE_DUMP();
>   					i915_request_put(last);
> @@ -633,10 +633,10 @@ static int igt_reset_fail_engine(void *arg)
>   				}
>   			} else {
>   				force_reset_timeout(engine);
> -				err = intel_engine_reset(engine, NULL);
> +				err = intel_gt_engine_recover(engine, NULL);
>   				cancel_reset_timeout(engine);
>   				if (err != -ETIMEDOUT) {
> -					pr_err("intel_engine_reset(%s) did not fail, err:%d\n",
> +					pr_err("intel_gt_engine_recover(%s) did not fail, err:%d\n",
>   					       engine->name, err);
>   					i915_request_put(last);
>   					break;
> @@ -765,9 +765,9 @@ static int __igt_reset_engine(struct intel_gt *gt, bool active)
>   			}
>   
>   			if (!using_guc) {
> -				err = intel_engine_reset(engine, NULL);
> +				err = intel_gt_engine_recover(engine, NULL);
>   				if (err) {
> -					pr_err("intel_engine_reset(%s) failed, err:%d\n",
> +					pr_err("intel_gt_engine_recover(%s) failed, err:%d\n",
>   					       engine->name, err);
>   					goto skip;
>   				}
> @@ -1085,7 +1085,7 @@ static int __igt_reset_engines(struct intel_gt *gt,
>   			}
>   
>   			if (!using_guc) {
> -				err = intel_engine_reset(engine, NULL);
> +				err = intel_gt_engine_recover(engine, NULL);
>   				if (err) {
>   					pr_err("i915_reset_engine(%s:%s): failed, err=%d\n",
>   					       engine->name, test_name, err);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_mocs.c b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> index d73e438fb85f..b7b15dd3163f 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_mocs.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_mocs.c
> @@ -336,7 +336,7 @@ static int active_engine_reset(struct intel_context *ce,
>   
>   	err = request_add_spin(rq, &spin);
>   	if (err == 0 && !using_guc)
> -		err = intel_engine_reset(ce->engine, reason);
> +		err = intel_gt_engine_recover(ce->engine, reason);
>   
>   	/* Ensure the reset happens and kills the engine */
>   	if (err == 0)
> @@ -356,7 +356,7 @@ static int __live_mocs_reset(struct live_mocs *mocs,
>   
>   	if (intel_has_reset_engine(gt)) {
>   		if (!using_guc) {
> -			err = intel_engine_reset(ce->engine, "mocs");
> +			err = intel_gt_engine_recover(ce->engine, "mocs");
>   			if (err)
>   				return err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
> index 2cfc23c58e90..9eaa1aed9f58 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_reset.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
> @@ -115,7 +115,7 @@ __igt_reset_stolen(struct intel_gt *gt,
>   	} else {
>   		for_each_engine(engine, gt, id) {
>   			if (mask & engine->mask)
> -				intel_engine_reset(engine, NULL);
> +				intel_gt_engine_recover(engine, NULL);
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 14a8b25b6204..eb7516c7cb56 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -256,7 +256,7 @@ static int do_device_reset(struct intel_engine_cs *engine)
>   
>   static int do_engine_reset(struct intel_engine_cs *engine)
>   {
> -	return intel_engine_reset(engine, "live_workarounds");
> +	return intel_gt_engine_recover(engine, "live_workarounds");
>   }
>   
>   static int do_guc_reset(struct intel_engine_cs *engine)
> @@ -1282,7 +1282,7 @@ live_engine_reset_workarounds(void *arg)
>   				goto err;
>   			}
>   
> -			ret = intel_engine_reset(engine, "live_workarounds:idle");
> +			ret = intel_gt_engine_recover(engine, "live_workarounds:idle");
>   			if (ret) {
>   				pr_err("%s: Reset failed while idle\n", engine->name);
>   				goto err;
> @@ -1320,7 +1320,7 @@ live_engine_reset_workarounds(void *arg)
>   		}
>   
>   		if (!using_guc) {
> -			ret = intel_engine_reset(engine, "live_workarounds:active");
> +			ret = intel_gt_engine_recover(engine, "live_workarounds:active");
>   			if (ret) {
>   				pr_err("%s: Reset failed on an active spinner\n",
>   				       engine->name);

