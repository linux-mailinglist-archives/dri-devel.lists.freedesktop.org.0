Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0742CFC2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 03:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85266EC14;
	Thu, 14 Oct 2021 00:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802846EC12;
 Thu, 14 Oct 2021 00:59:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227857183"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227857183"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="481035931"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 13 Oct 2021 17:59:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:59:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:59:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:59:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:59:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdHvZKmYK0bvt9p5Xq3A5rXOZx3M+sXXuZc3wq26gDyFzUv/YalFZcEWVG+GHi962zn9MHaKofYuIu0cBZoGS/hwNdWjIJiNqprEmUtZsGjXUmj3UMpRJUkl+p2W+TXHVDy/HxwrBB7PSlNfPrU6edY2NqNEM+tDdhPSwYRh9I9duXmfo5t8tnGt8mUjr33F6uTYppAm23MSwLWLbhqGVFyy4B1Oh6gmP2t6FKgxfBLQUdn9Zug79dgIr61SVJJEivmslsd/NFicMSTZoFKewOZp7AZ3TegatraRiy0TaewWQh11+DPpEXFVk4GeAs2ObLqOOhgMLpyLq/2PBCyr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9ycBd3CCIlLCIq8Ye9pNVX19glAhBxw4zpeLfMga4M=;
 b=l0q3Qkfu6B7uOe+RRGWaLibBjyrkdK1tKzgkIu8nOUDMd/Z9FeDCJygwMSil0/qtmx/Qi5A713vqFWUxmorS8iDHPLKGK+2wUDgWM23goBM2VwgpRgyEfV+8iYBN4NTBwf22kPStQ6EFtz/3C/UJWMC1GDZzaue1g8D95QHUO6GOp9DM//x4iemm0bOzZySqwrM/Zvzn4VzmjkbJi70MMnvwRIoVpDVTsndmXE1trL2DJ8e1rJG6tEnjhntnsoDq8XA57mpPJllKMzdu73m54EckTP0XFK8YDHCUHtoBHkctM/toXt1xTZxM/xd0RX4x3H8UH0qDPJevC7n65Atmuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9ycBd3CCIlLCIq8Ye9pNVX19glAhBxw4zpeLfMga4M=;
 b=hdfDrbitFwo6VaEXmWrZdCXhdWDg5VE9vaDQsDjE1meaZY+m5HmR5ByRapRwYROQGrOOuYoWHMTC4sIxPhXVHA147IZgK+uw58Cw61cvwtjxG3zINOzYtxNKy5myiKaNyJyql7dxRjZekdpIcjKePJHQeaW6C01figB/8jo3T1o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5625.namprd11.prod.outlook.com (2603:10b6:510:ea::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 00:59:53 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:59:53 +0000
Subject: Re: [PATCH 22/25] drm/i915: Make request conflict tracking understand
 parallel submits
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-23-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <e561024c-9b38-0b1a-fb8d-31cae8b83670@intel.com>
Date: Wed, 13 Oct 2021 17:59:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-23-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR10CA0013.namprd10.prod.outlook.com (2603:10b6:301::23)
 To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR10CA0013.namprd10.prod.outlook.com (2603:10b6:301::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 00:59:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42cf9e0e-79b3-4706-af8f-08d98eadeebb
X-MS-TrafficTypeDiagnostic: PH0PR11MB5625:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56251EBA35A63119AF165A50BDB89@PH0PR11MB5625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YyHH9qBPzA/7qxwsN0kqZN4mhGUbA8R0ff3U0jfPivqoayHTNfKx3uQ4AGU0SCynTwq5CPLf4yaj2/veFFO5sjVweABjLRcD1599F1LZ90f99mCB7TlUNm62AOWYHhVPj4YYYp+H9n9dZT+XBGuWwd3rVABnTJ9FtG6zSlMO0BRGIlTZnWkUdNyFmznVp0dPu3ZblsddYVS2o8vIdsf5uTAZVarhsZUXDfmVxtkGtTta6ZNrSzO7Lnma6kJKYzZpvfAr0yi+F923qO5fBDtJz1Uhx+k67OVg0W9lP/Td/6e1fLB+LYGO6pIN7gSBZPJvRjBH6HAQJsoe+qiAAk4BDeBeZHcQu4+2um8h+Mtdy0jOgG0rzdljOjKJCMp0wXn8GgLWzGv6pEuSIyntKcOAWxJypaSKyYcBl+Z/L0ASGnxfbacPrpY2L8jYk2+xbjjQGmcI+FFGrDSEGfvyMKqPAR3FyjL2z+v1HVUEF+1wg/HS4XJ7JVnVaqUFWHvOPm/1niyiEKcwRgdCmY4+oAi4DpUjNpBKQUmFcPt0Y8YH5i4gmU2zZypkGz7fxkZydikTlbw4wznWj6UwneUI3je+VA7q8nImi//0nK+HqBjs1FxzQMLcBR3eUJHCNpXLLNcZvr1kBGgAnNYpfDT5tlF18W86ibnc7Vb1QLi36XzKHd/uPJA0PCuVwkG1uoq8hKnJHrbIn0Oq8DLQgnZ77lPXevMAv9vnu966AbocPwXe4dE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(450100002)(8676002)(5660300002)(66476007)(66556008)(8936002)(66946007)(316002)(956004)(86362001)(2616005)(53546011)(38100700002)(2906002)(31696002)(26005)(31686004)(83380400001)(6486002)(186003)(36756003)(508600001)(16576012)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjhpL0NvLzVnVHd4cFRrZGpBUlpFT3Bod1daRVhYSFl1dWZINVhQZ01Kbit4?=
 =?utf-8?B?YUEyU2Q3ci92bnQ2RmU1M1hxcUxpWnNLUmJTZDRGZnlDNnB3T1U5UWpuYWpZ?=
 =?utf-8?B?RHl1bnNPbWxGSXA3WEZpV3FhVTFCNGFSMDRaTkhjTkI2VU53RFA1ek1JVWhD?=
 =?utf-8?B?Rks4UzFLV3lDdFFmeDNzWXdERzZKbFM4M3ZERmo1MW9SOGxzTTNsY2ZGaSsv?=
 =?utf-8?B?UEY2ZStiYUNHeXdiWjU3a2pnc3h6bFZxVHhmQkp0U0FvWEY5ZTBFMDdiVzhk?=
 =?utf-8?B?RWZWTUgrbGVRK3hkTm9RRVZ5Vk1DZ2RRVmIxTkFJRmlsTUI0WnRhSEQ2N0x1?=
 =?utf-8?B?MUV5TU5FMWRWVmlOWHA0cG5QcC9FYTEzNHNzZUJBd0k1MUdXWjVyUCtMNVZH?=
 =?utf-8?B?R1pQajNFaTc2K1d6QTJLVlBDWkc3dGJkeHVrOU10aWFIYXNiTWFZTE5uSzZt?=
 =?utf-8?B?Q3p1aW9YQWdJSCtuS1liQWQrWVo4QnNEekl3U0xsWmZodlBQNXlwdHRmeG1T?=
 =?utf-8?B?bUJKTGorQjNLTUVQUDNta1VtQjlmZDB3TU5tL2N2SVl3UXRvTCtyL2xzSndQ?=
 =?utf-8?B?SC9lb1VCRDlMNC9UOXdDVEdLQ3MrMGxMSTBNKzNhdUYrc1RXbkQ0TzY4aEE5?=
 =?utf-8?B?U0tEdklWTGp0V3h4eEgyTTRoMkk4cXZmK3RtQzQwRUhZVDBWaERwTXRlby9Y?=
 =?utf-8?B?Yzk1YzlpK0dwMnJ5NUlxN3NJVXd3SVZXbHVwbUFVUlNnUUJOUElQY3hLSktq?=
 =?utf-8?B?dnMvM0F6NjlQMVJWdEFDUnZnd3BpQWR3SmxNYVQ4b1RNUVB5Z1JJVkh5aXJs?=
 =?utf-8?B?b0FMM09JY1oxVW5UM1ZXUnhmMktCUVpiUEtKM1NrTmJjTzU1Y2ZZaG5jMnQ1?=
 =?utf-8?B?eWRBT1dTZnRwazhGblVNaEpiQ3p5c0pyNmhDcHFNYTRJTkFXUjZ1QThSeGdk?=
 =?utf-8?B?VUVtelZ3aVNDZFNpZVVDOFh6RXRndXNPQ1JCdStaZGVXRTE0Q0Z5WklTMFYw?=
 =?utf-8?B?R2hJUDc3VmNFajBqMEtrTGE2YlIvZUdVQXQ0WW9VZkdZa2dxWERjYkJYbU9M?=
 =?utf-8?B?cldKVm1ZSnp4ZytmdFdlVjhPalBuQTBobSs5UTd0QjM5c0pJa25ScW0wdW5L?=
 =?utf-8?B?Rk5WWXIvQkRVTkgyYm5wN3BVNldwNUFFS3BkcG1oQjVTRHdTZzZIK2l5L3Rt?=
 =?utf-8?B?Q0V3MXdXd3NGZXNkTWthSXZyTFZyT0ErcWRNWFVOUGt6QXZsYUNybWFWcnVQ?=
 =?utf-8?B?bFRMQlZUV2NiLzFzZGRoeGVHMUNtampRcThNTktkVC8rcXlNRWJUWWc3dHVS?=
 =?utf-8?B?bkFYMEk2VXNwR3pEZEduUXJ2bEpMU1hIRlJHOEY4VHhXY0o2VVl3NVdKc0VQ?=
 =?utf-8?B?cG5JMGI3SDBVTS9lN2N5Y1JtYlhYSS9ob3ZJQVIvN0ZOWTMwbTJGclUwUldN?=
 =?utf-8?B?YnFIUG93WXF4UnBiYkRzS2NNU0k5QWRIMmFYcHREMFpwWm5sMlgyUWpHN3U4?=
 =?utf-8?B?OHdNL0RVR2tQYzdsTTVBbTdPU2YxQy93VVdFVjV4OXRoWVg5QVcrdU9RTUFQ?=
 =?utf-8?B?aGpLRXU1NzdTS1ZFTDNjWWFSdFdhVDVTVENPK3Zvd0dGSjY1OUNkd1NwUTZz?=
 =?utf-8?B?Ui9PS2FPWXIzQS9yY202aEU4N1hiYXNnT1dkNE1uV0pONVdwQzI5UVVWN1NC?=
 =?utf-8?B?TUJzMFNQNUxFK2hES2R6czVqUVZDMU5jcTkwUU5ISTF4aUdFc01BOWc5YjFh?=
 =?utf-8?Q?ZqMcF9e4IsMtTaxlQkdbI3E7Pgz/Cz+Dvufr61/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cf9e0e-79b3-4706-af8f-08d98eadeebb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:59:53.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLeytPpfJOXroMjS1ityeVGcrN2MS8ld1q7D1cqPsq5KVHVPEOi6ld9wfjRtShi1xBJqivvDThE8mi5GbGpBZsog9UocAcb22070Y5AMVMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5625
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

On 10/13/2021 13:42, Matthew Brost wrote:
> If an object in the excl or shared slot is a composite fence from a
> parallel submit and the current request in the conflict tracking is from
> the same parallel context there is no need to enforce ordering as the
> ordering is already implicit. Make the request conflict tracking
> understand this by comparing a parallel submit's parent context and
> skipping conflict insertion if the values match.
>
> v2:
>   (John Harrison)
>    - Reword commit message
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
>   1 file changed, 29 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 8bdf9f2f9b90..820a1f38b271 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1335,6 +1335,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
>   	return err;
>   }
>   
> +static inline bool is_parallel_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_parallel(rq->context);
> +}
> +
> +static inline struct intel_context *request_to_parent(struct i915_request *rq)
> +{
> +	return intel_context_to_parent(rq->context);
> +}
> +
> +static bool is_same_parallel_context(struct i915_request *to,
> +				     struct i915_request *from)
> +{
> +	if (is_parallel_rq(to))
> +		return request_to_parent(to) == request_to_parent(from);
> +
> +	return false;
> +}
> +
>   int
>   i915_request_await_execution(struct i915_request *rq,
>   			     struct dma_fence *fence)
> @@ -1366,11 +1385,14 @@ i915_request_await_execution(struct i915_request *rq,
>   		 * want to run our callback in all cases.
>   		 */
>   
> -		if (dma_fence_is_i915(fence))
> +		if (dma_fence_is_i915(fence)) {
> +			if (is_same_parallel_context(rq, to_request(fence)))
> +				continue;
>   			ret = __i915_request_await_execution(rq,
>   							     to_request(fence));
> -		else
> +		} else {
>   			ret = i915_request_await_external(rq, fence);
> +		}
>   		if (ret < 0)
>   			return ret;
>   	} while (--nchild);
> @@ -1471,10 +1493,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
>   						 fence))
>   			continue;
>   
> -		if (dma_fence_is_i915(fence))
> +		if (dma_fence_is_i915(fence)) {
> +			if (is_same_parallel_context(rq, to_request(fence)))
> +				continue;
>   			ret = i915_request_await_request(rq, to_request(fence));
> -		else
> +		} else {
>   			ret = i915_request_await_external(rq, fence);
> +		}
>   		if (ret < 0)
>   			return ret;
>   
> @@ -1525,16 +1550,6 @@ i915_request_await_object(struct i915_request *to,
>   	return ret;
>   }
>   
> -static inline bool is_parallel_rq(struct i915_request *rq)
> -{
> -	return intel_context_is_parallel(rq->context);
> -}
> -
> -static inline struct intel_context *request_to_parent(struct i915_request *rq)
> -{
> -	return intel_context_to_parent(rq->context);
> -}
> -
>   static struct i915_request *
>   __i915_request_ensure_parallel_ordering(struct i915_request *rq,
>   					struct intel_timeline *timeline)

