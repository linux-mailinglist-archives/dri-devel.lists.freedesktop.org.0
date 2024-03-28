Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851188FA6E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 09:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0156010F480;
	Thu, 28 Mar 2024 08:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOgbVmSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03410F480;
 Thu, 28 Mar 2024 08:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616061; x=1743152061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4W7Zmh4p4B9bjYdNZZ84vuQxylS/6ubM4Yj1Fw84jAU=;
 b=XOgbVmSb3KdgoN5fWF5TrZ0j9DXHDH1uYQ6rvpdZJ+jDr4FJ94x78HyC
 9swQEXR0n0KJHZGgphs20OWmw7cSN8XkKCR2YKVOfmtpYBcV1y03SNTSO
 PDsZJp4IZmUWJCVuG+Z44obLhhvtGt4HRgjt59/48NNHe+QJKH0/FIo7g
 vN7080l/udVPCptKITKH9w/n7q8K0USs7UAMH75lXHrHV9+i0MAJ3e7d2
 dPxF90Egpj02+lA7Wy1kfQMcUXPjB+jxx76ec+8nPHu9UvGcyCWmfgPf1
 EJALeclBS1rvGY55rA5LRGX8DMpzWmIB59C35Ueg40p2XL4dlBDd1t3R7 w==;
X-CSE-ConnectionGUID: RAyBKnQpQVCjJYIKl4FzQQ==
X-CSE-MsgGUID: TB/+L+tFTRSQrML3EQVJqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6975909"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6975909"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="54025420"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 01:54:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:54:20 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:54:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 01:54:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 01:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1rW6tpPJ7YX7zAsloO5b4SuRMfHZoz5S0Vjl21HNHtP1SXJHQqes2Qmb39NyjqyrIG+t/p6vKsKnM76thVOmtKlvcFDlmWd8fvPBWBUF9zeTdC5lEy0VgP2dOjp5QBUws2ou90zPSAC9A/9MqBR5fO55KbxtRaHgSPAar+hWq+kcS1KCSbVPzoE2Y2VHH5+OkJ75uw0JD3ZWBnXZ4HCehxjaSmSOyKarCESvNFgk1KHPuclU2MwRDJF0qLS5jk1pWVp7yrjar+rW2LQSNe6cYVfq05ysEgU2VXxb4Rmnfetu/gx+hjjyTpwZskoxFGPHfahjC//dSwJyur6RNfj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gnaaXPGW53Q1GOif/5ptnn6If9plXsJ+NbOq6iz0oY=;
 b=CGARRaUPHW4lz/1RoOE0THk54D7vugNxsUU4mexEfEANzPaZujjMVNsjpdlt8A5J7oSxem/R1jTs1zW16E26Rk6pSuB8+9d88wD6I4NNRDjzKtBtmwlAQKuheJE5wCzAO1aIj4CUEXx/UuIYD3tHNZGjEM6dg5c+tRNEeBOlCbKiEQbQuN4dTg8Dj3lX4urpsFK1a5aZphooB98kTiXMDsyjExNbubjSI1LpdM/0RQJbz5n5wY5lFD298PMbn0LDB9igDNyKfmMSXVKNFHqYvc/YboaJ3qRSi2cY8U2yei6j+S9mQw/TR+y+lTz+BoBW5Gx418l1nowDbj9lp4370Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Thu, 28 Mar 2024 08:54:17 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::a8f5:a774:62a3:dd1e%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 08:54:17 +0000
Message-ID: <692791d8-8f6d-4f3b-8ade-dc23879809c3@intel.com>
Date: Thu, 28 Mar 2024 09:54:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: Limit the reserved VM space to only the
 platforms that need it
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Michal Mrozek <michal.mrozek@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, <mateusz.jablonski@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, "Chris
 Wilson" <chris.p.wilson@linux.intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
References: <20240327200546.640108-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20240327200546.640108-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0360.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::28) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: ac046b13-c505-4818-8ec7-08dc4f04a6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8fo7gUrmOlNwmqMqIZh3HB+Lvn4UgaEi0Nq9+kGo9na7+M7TCIikoTKhKGEx8pXz8SDwykeZSAt1FmB6ZHXMfxfU/oz57+cTQks4WwWQdZnt3wFeHerptuCmrgCVTLIQwULCeD5QWWHf/xa2PhDIMLEtl1j+asNv/9JGVN5lAuW7mh8na9XPGdGTaDI+adGVAh2H2hSrEDGTrGTu9czDjydnJaDRI2Iw92Gsfp59NPNBKVtilRMmC4SSiOJxJ5v+z1xwtU45SiB+FD2enMPLOtCJcAmyEZdVtexaKrHt1EPc6KYMGzjtDRMoIhuW3Dw+FxXQALbNBzOwv20OZZnrJ92Afhb1tXdxewK+o9WnPQ0iThg4GGmeym+yfq/wc/aQk2UyWtRuOogXjQeRx8ZgzZoPfRnPNuXlRN0LcmlpxEqLDubAl1cPx+vnboT2pRQ2//XDRl9JZqN9g562xGGnSP9hL4q+LaZeLEBZmiweTaJ89LsZSLTZEjO0JIwBXnThMC5hPFakptEihuVINkAbca9iO8CaLSD1hWDC9quD0GExI7+9ddsY4twkxHJHTjWmpoxvb3xGanrL5fR33N8LG6OZ8WQaZyO068VnFupCSK8hufSCaDTVLe9zU2Eb3uM2tUUryzPnIlmeaH5yYXAb0ikV1bYxty0+ZT2ZJpeHnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3M2YXYwbnFjNjBjdlFYZHhCQ0FkSS8wTHpURGUzOWhxRWFHTHYxeTZPVFF0?=
 =?utf-8?B?RjRwbUEySmhreVQrY010dVVwSFRZVUdWTllSa1RyTzIyMUZMR09mbXZpRGRs?=
 =?utf-8?B?UFptYlpvaFNEYmVGRVh6RndXTjg3c1BiWVR3eXRnVU9uNG4vTWlQQTZtSzRV?=
 =?utf-8?B?R2Y3YmhkWXZOQjJLVVBMb0ZPSGE3cnBoRnNsM0hOa1luRXliM012R08rZDhE?=
 =?utf-8?B?MVBmNFBMS2l0UHVXMjhXVVdsZDF1NVNaZ3lvSWdHTy9GYTFFTU9uYmpRaklZ?=
 =?utf-8?B?OGgwREdYUW9LSE44Y2czdmV1d2FrUFdQcStXZ2ROZnh1WC90V08rN2MxWkY2?=
 =?utf-8?B?V25wcGNyM051VFl5M0pmK0lOMUx5c1Y0dVlBcGZLTmpEWTJkYWtvaVFVR21S?=
 =?utf-8?B?bEx0WHRlYlVTN2hjbVhLUGl4eUdtc0F0b2ZxZkdMRStneXZoODZpb05mU2t3?=
 =?utf-8?B?VEdZRWI4L2tRVDBBdVFqS0pGZWUvNjFadVhjZ3l1c1pxWWluaUIvZ1drUWd5?=
 =?utf-8?B?Z214bk5XNlo5ZGIwcnBac3lSSS9OYlpXZy95UDZXL0JmSDhROVFlQUIzSmd5?=
 =?utf-8?B?S1RoVy9weDhabGlVRGZBQ1EyT3dwbUJGeU8ra0I5aVdnWHZZSXlJQmZXME1y?=
 =?utf-8?B?YjhMbVJYYmlGUzZ2VGVBZTl5elBYK2lVcCsxd2lGQ1ZBTEYxSzFYSmJHc2Zj?=
 =?utf-8?B?LzZpT0hvUFdoREs3V3BPZlFoT3BzYU5Xb2RhSWdzQnVMdENsOE1PdXA5UmRG?=
 =?utf-8?B?QjNLYWFDMkVwajQyNGJNTzR3b2hlSW1JSGhsRmhrSCt0L1g3RVRvaHFlVmFn?=
 =?utf-8?B?Qm00Smh5TWkvdEZ0dnZuV1lkZlpUdUVid2FVdXM3a3JqT0JhT0hVdkRRNHY0?=
 =?utf-8?B?NjhqUFF4c0QrUEVOSUJxQ2hBQnhuNHVxVWVmRDZ3L00veVhaRDc0a1NSTHpW?=
 =?utf-8?B?V21MRkRqRFNqSlZ0YXBRUVhZYkY0UnNqbmo5RVNnZCtjSmtWNlBQS1NoYWJa?=
 =?utf-8?B?bnRuUmdjei9aSGYzMFdjb2VsNlMvS3owS3BxMEZLVzM5aGtibEp5Yit0QzE0?=
 =?utf-8?B?QVA3dU5lN1FwUG4rc0NBSk92T04xK2dXSW5pbnphTHlHTnhQVUNEbndUVkhv?=
 =?utf-8?B?RDh2VUExOHd0aWtJd0dvMG5MT1JjU2JtcTlaM1lvKzl6UUhXSkp5V2hjckZz?=
 =?utf-8?B?YVpIRDlrU09tbFFxY3FqZ3FmMGdhc1RDYTdIUjJwVy8yWDREaUR2OXY3dUNh?=
 =?utf-8?B?UW1lS1hQbEt2dXBPQ2lIdjFxWi9SQmpUWFgxOEJiRlZNTGZDdWpzU3h4azhv?=
 =?utf-8?B?aHVEbHN2dFpta01tMFRQMUZ4UXZMa1pxUjRid3hma1o5cWtJWHlsY01ueFBZ?=
 =?utf-8?B?Z3o5ODMxUDROeGJTMUdDR0FKTGtpcWVLeFBqY05vWWpWM1JxSGNRWmJhNklG?=
 =?utf-8?B?VmZkbEhHN25VNUxMdFViTXV3RXN6SUNxc3l3Q0wxK2lxUnlrbDNEVzJWWm40?=
 =?utf-8?B?VWxScjhINW8wTEdZa1pCTEZVbFZHc2xGT3JnM2JTejhKelVEU0kxTG5vNXZ4?=
 =?utf-8?B?cTlKVThJU1BBcnlVOEVDcVVVMU1FcDdyRG9JNE1qNnI1dFNBQTlkdkVta3g0?=
 =?utf-8?B?ZTcvQlBpMENoZUlvbnhxbHFRUDAyQ1pPZTQ2dVJSbG4yVVkyS2NsUWNnc21K?=
 =?utf-8?B?TFcwYnJwN3M0dk5UOGd3bUlSWEhYSnBBYkdhUjVDS0Rpc1drVDJuSnhwZnRW?=
 =?utf-8?B?amlGTWU2SnhyblpkeWxLeWxPb05PaTBudnZwYkZlZkpjQkRQMHA2bGIwZ3J5?=
 =?utf-8?B?bG9sRlpTaGt3cHNyODZXVnkvak81bDdXZzNQaTMveUtoYkF3UllKcGhFZ20w?=
 =?utf-8?B?U1RUZ1NZUUF1Q2pKUkNSQjZ4SDdpcDBwQmRZSE1XelQ3WTl2TjlzeW1OeHVX?=
 =?utf-8?B?MmNQY08xTDhCTHVPSENEdi8wTVpQL3pLd2JxaE0vWlU1RWRaeDBWU2duZVdp?=
 =?utf-8?B?V3hkQzlmZ0ZWbFZYYU0ybkNvOXhiWnZGcHRiNU8rdWNwckg4NVhkU2UwcDJ0?=
 =?utf-8?B?RDdBVzAvWURZbEN1YmorTzJlcVhBMFZPT0xNaXdVaHZJUzh5bjB0TUduaE4y?=
 =?utf-8?Q?htNs1hG1+AHXlYIv/JwCopYpi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac046b13-c505-4818-8ec7-08dc4f04a6b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 08:54:17.7504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twiVU+nHoBGK43DiVHowXLLRSR8Lh/ke/0J55XZfZ8JjJrkGlHl7rxf/uX7kQVxjLFDroAa8R3fvXNwkmzWapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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

Hi Andi,

On 3/27/2024 9:05 PM, Andi Shyti wrote:
> Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
> vm") reduces the available VM space of one page in order to apply
> Wa_16018031267 and Wa_16018063123.
>
> This page was reserved indiscrimitely in all platforms even when
> not needed. Limit it to DG2 onwards.

I would use "Limit it to platforms that need WAs" as those WA are only 
needed till 12.71,  otherwise

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>
> Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 +++
>   drivers/gpu/drm/i915/gt/intel_gt.c   | 6 ++++++
>   drivers/gpu/drm/i915/gt/intel_gt.h   | 9 +++++----
>   3 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 1bd0e041e15c..398d60a66410 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -961,6 +961,9 @@ static int gen8_init_rsvd(struct i915_address_space *vm)
>   	struct i915_vma *vma;
>   	int ret;
>   
> +	if (!intel_gt_needs_wa_16018031267(vm->gt))
> +		return 0;
> +
>   	/* The memory will be used only by GPU. */
>   	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE,
>   					  I915_BO_ALLOC_VOLATILE |
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 2c6d31b8fc1a..580b5141ce1e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1024,6 +1024,12 @@ enum i915_map_type intel_gt_coherent_map_type(struct intel_gt *gt,
>   		return I915_MAP_WC;
>   }
>   
> +bool intel_gt_needs_wa_16018031267(struct intel_gt *gt)
> +{
> +	/* Wa_16018031267, Wa_16018063123 */
> +	return IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 55), IP_VER(12, 71));
> +}
> +
>   bool intel_gt_needs_wa_22016122933(struct intel_gt *gt)
>   {
>   	return MEDIA_VER_FULL(gt->i915) == IP_VER(13, 0) && gt->type == GT_MEDIA;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 6e7cab60834c..b5e114d284ad 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -82,17 +82,18 @@ struct drm_printer;
>   		  ##__VA_ARGS__);					\
>   } while (0)
>   
> -#define NEEDS_FASTCOLOR_BLT_WABB(engine) ( \
> -	IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 55), IP_VER(12, 71)) && \
> -	engine->class == COPY_ENGINE_CLASS && engine->instance == 0)
> -
>   static inline bool gt_is_root(struct intel_gt *gt)
>   {
>   	return !gt->info.id;
>   }
>   
> +bool intel_gt_needs_wa_16018031267(struct intel_gt *gt);
>   bool intel_gt_needs_wa_22016122933(struct intel_gt *gt);
>   
> +#define NEEDS_FASTCOLOR_BLT_WABB(engine) ( \
> +	intel_gt_needs_wa_16018031267(engine->gt) && \
> +	engine->class == COPY_ENGINE_CLASS && engine->instance == 0)
> +
>   static inline struct intel_gt *uc_to_gt(struct intel_uc *uc)
>   {
>   	return container_of(uc, struct intel_gt, uc);
