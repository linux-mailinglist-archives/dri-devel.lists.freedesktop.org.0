Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ACE42995E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 00:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA56E973;
	Mon, 11 Oct 2021 22:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1E86E973;
 Mon, 11 Oct 2021 22:16:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="250373539"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="250373539"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 15:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="716544197"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2021 15:16:23 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 15:16:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 11 Oct 2021 15:16:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 11 Oct 2021 15:16:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 11 Oct 2021 15:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Py0OpKXUC5PSIZFi/d+d0S74XC5PIpEnsS2wn9rhsIlU4ex2VIhWIIVUInH9mZOp9nEAxPSkZDjeOb4FNvIwEDEIEcFj5lZsOFqy546Q5l4s4tPbXSYRgBcCGfpby01oDIPq6TqzWGPVMu/sov2ZcdpSLcAxWDjBZw5CWg6yiotR1lGaqGNHmQdgyb6ZpQPf7FEavQiPmOxywSuLHDAZmCMTxxO/BdcWz4FizobTxx8cBGy2exc8fN/gpxqIxY0i8ELZqZ1DmOR1Wcr1kLgeArORVj8jafZSwz2LDkPXMN1gYKK7vrvsE3zRWfVV6BFhBB4gt9g3RLhyEY9tbOoZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV9fPLlBs2ywIEcI5hrKoHivaxl18dj40vBqdRuKDO8=;
 b=PjhDy+2je+0MK0wlDdqXV+lM/4tpjWalgVypOK+R4xsgJr+f72s2731qY++JDQuxRvcQN3KzFBkCj0KiDSYq+FhxLIc9BWuT9/j9Fbe+5yArw2lskUrMwKenLUmHPXs8iQHmNhffFpvxQ4kzwHxwUSOio1Azj9T2j8dYQO4Vm47+HLJFCbynIHw6wfRb6AGzXeVqwFLgt8Vt+XDs2JionBfMWKx8+WX/r3MYkL78pT6eO4oOUl++yDf6Bjaz3PMXsJxBKNntZMmkmKdoMX4Z7WmOmHkoyIa/dCg3A6ooXDn418Ehv0PMXd+L/KaFmWKiQlUx9hCidSCpgvSMCp9ahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV9fPLlBs2ywIEcI5hrKoHivaxl18dj40vBqdRuKDO8=;
 b=F9FxU+zBqbYV61ZjMpk0ngL3f74Y2syFfUlrp5qGyvrslMLtuYbav87SZrCcnjZOlkOk2WdPiz3SFdGZyR9+fnXoDXfLZuQ3NHz8LlhaMnVa/j1+qE6LHLKy2rSMpT6vSr3PiU0NASRNgbq23oqcHqgxpPP7rvhM65oEEouU3fk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1852.namprd11.prod.outlook.com (2603:10b6:3:110::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Mon, 11 Oct 2021 22:15:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%9]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 22:15:30 +0000
Subject: Re: [PATCH 24/26] drm/i915: Update I915_GEM_BUSY IOCTL to understand
 composite fences
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <john.c.harrison@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-25-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <bc66a049-4d41-339c-3f33-8cad21e4bab4@intel.com>
Date: Mon, 11 Oct 2021 15:15:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-25-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR05CA0190.namprd05.prod.outlook.com (2603:10b6:a03:330::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Mon, 11 Oct 2021 22:15:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f36855b6-6797-4563-8cac-08d98d04a32a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1852:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB1852CFF421A8A099F5907E88F4B59@DM5PR11MB1852.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FZ0uy/4LHUNxPuEi3waio2fScrp39rZW9rhe153eWU2MqwFe3wRH6MdjUbsRTWUn+p0EENUWrU5yYELlutOP93T+50bfcou2XsUDYyekw/O7GtNgpBXCstn8ubAbt4J0LwzEPByjhSreGb/k01zMv7NF45uznuIyBvhWHp5Y2Skh6QGZCD7NVERhPCezdcgmIIVvKU77SgswSxXMwClK0b9Slu/X8O+zi6yWb50OvdeseWRhTUlK3s+ohY99ZV8Xloy+Oi9sqZlWynjVkA0qwFu+nPANW1YhRiiLob8OSzodBYdXVVDjSp1PPple9+aTpezMHUsq/6699j/ZiJPlHJQxqzbBJRcZ6YH/Y07cklkV+6M5Q2oN83P4Kcj0kXUxsoiS3lwrwwRFKBqubaVl7iaBUoHakrLo2zR+Jbndx10XDJPGYtWUBuBLQHYsMUsLUjL9vMuYn5L24Q1X3+GM52yg+rGaz2xfO/KXTxoDtnL/PLANY+JKt5qBxNKV+8JsBRln0TbTrgSC7GNt0kipyDVdtXbgIWp3K0ldAy7IMXePnKFmkHbuUF4AFaBIwV4S4vG/MTvYoNuro3yOb431sXj552BdEMtvS83JX8AuHbGz3iMyii3v/zqaHiZfPZ73XzZRRIpmd6ES9/bTp0Ws42/zie57B2Yosa+gMpzjua59PX66AggFfHnEQ/n+P49kcm1+dHKZFMrEg1Hvk8xIKhYQBGX7iMY7mT1fc/mjxZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(53546011)(66556008)(38100700002)(508600001)(16576012)(26005)(5660300002)(2616005)(6486002)(8936002)(186003)(15650500001)(36756003)(8676002)(83380400001)(6666004)(107886003)(66946007)(450100002)(2906002)(316002)(31686004)(31696002)(4326008)(86362001)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXFSV25UMDd0amxleDEzaW85ak9iZ2x5WmZjdzV6ZExCcjBaVXcwRER1SUQ4?=
 =?utf-8?B?ZlJzTmhmOGRwK2FPd2JjUDZqZTdBM0F6VTJVMU1wa242dHR3Vnl0OVEvYWlS?=
 =?utf-8?B?ODYrN2xKaUtMMi9WaHZGYTdLeEVFeHlOVWVhR3lBaFpBUndwYzBvdStZdHQw?=
 =?utf-8?B?WmdoS0lmYUJ3SzY4WHltazNNM3BkS2dSUVBFOUp4d3phenNqcjhDc0R1aE1i?=
 =?utf-8?B?RDlkdnZ2YnN4bCtoWW5Oc0lLcFBHNkRkOXlJYnFPbURpMCtGNkpIbXptQllC?=
 =?utf-8?B?QkdkR0NhUnoxQUcyWjRIZVR3Umo2NjUvUEZ2QWVhK1dIMURnb3oveHNwSmZZ?=
 =?utf-8?B?N3ZtZlp1dC9CakZWN3hEbUlseW1GTEI1aUEyUlh5RWVQUHhKMUQrWDlpekxx?=
 =?utf-8?B?cjZNMjdja0ZkWEtPc2ZRSnRmMUVvemFtY2JOcTY3Z1ZNY1V5Y3BzWUlOMWZ0?=
 =?utf-8?B?OXZ4cFZENkF3cVZKR05jYXhLaXE3azF6aS9LU2dzT3lIYVhzSDlmWStEaDAv?=
 =?utf-8?B?UWFsYzh0UG1DcmJFQklUTHFRRnJwQmxsVXNXR0xiZnhPOWl2TnNKWkpLYS9N?=
 =?utf-8?B?MVJzUnJ2d2kvUC9DUjdGRVJCcnN1NzkyZjRkUytiR2pWazZaeFlKUTJ1R3Z6?=
 =?utf-8?B?UTBFUXBEZG9mUVpmTjkvWXJpNXF0VUF3WGdRanpJWWJPRStwcDAxUWhDVW9z?=
 =?utf-8?B?RVlKS1Y5M0MwRllibSs1bWo1blJQbXJWSGdQd2hNOG5JbFQzQUE3ZXV0bGZF?=
 =?utf-8?B?NnBtaHRuVDFuRnEwY1NtcFZoZncrK1dwcEFld1RCUi9rbTUvWG9qaDIyL21R?=
 =?utf-8?B?Um51UHpzUWZKTmpQTEs0RUFjTkc0WFByWURESHJZOTBRM1UydnZoak5pVXFS?=
 =?utf-8?B?OVhrSU13aVZPYjQ3Z20xeENyT3FWQXJiaGEwQ1ptcWdjTkNmUkJ6UGErT0sx?=
 =?utf-8?B?OVVmRWJ3T2UrWWx3M0dpQm96cUM5T09WZnNWUFVHdTFSYzdTSWhaSmQzd3Yr?=
 =?utf-8?B?VnZKT0YxUHpiSVlqeEMrYkRzdGx4dlFzcXhLby81WGNETmNvcVpKdThhRUNz?=
 =?utf-8?B?RVJ1LzQ4TmpscDdyZktrQmpZckNqeWlLakd6VE1Rc3RZTWw5SkVrRGJiVmF2?=
 =?utf-8?B?TkFuNEk5OGxLNlphVk1Ob2krbXZOeXQ2Ymt2TnhSY3l4REJZWFJDNDBPS2dt?=
 =?utf-8?B?ZGh5TEExZFNtSTFveVVicEVXa3V1MWdMMUYyUVNTeDZ2S25RSVRieFVsK3Bv?=
 =?utf-8?B?bVIxTmJkSzFrbE51RGdsTHhVRVRKM1BvL2RXT2pLV2FyazlOcW9HbTd2QTl1?=
 =?utf-8?B?ZkxGUlhLS3g0YnRzYnZVLzlUaGdKRW9YRjRxQjQ4MU5OZTd5QnVlL1dWbFdB?=
 =?utf-8?B?UUdHaGpFZ2lOcUZqS3ArQUtUQ29UZCtaZmxNWDVaSGNaNnZwN1ZLV1FJSmls?=
 =?utf-8?B?OElJRGJhL3JUZ2VCNEJIeUdLOUVCYS9KNWdaUEJXaW83Z3duRGpPOGREdjhP?=
 =?utf-8?B?NEdTWW9Ta2FuTi9VeVpMQlV6SE5pT2NBMkUzeXVoOStFdGFCVUQvR3N0c1Ru?=
 =?utf-8?B?S1UwVC9NQTcrUHcxbGRnelFUMGVveFBOcFdkMWZPY213T3hUb01sS3VlcG1E?=
 =?utf-8?B?bktWcjRaSXpPdTlEZ1VRUzBCWjNDK1ZCNVRRZ2Q2WS9xV3BUd1AzNEYxb1p3?=
 =?utf-8?B?dUtWci94N2JxcXFqUUtWUEUyNzd4NkZsdUxXV2lraFBNUmpGTTNTNFBsVVhN?=
 =?utf-8?Q?0QIniEY8hKWPofvFyzzDtY1y6BRJgM1qIDD3bH6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36855b6-6797-4563-8cac-08d98d04a32a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 22:15:30.7760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aXwgox1gmJN8dZJl8BUnZOtIx4l9FTtMkoRX+ecjKBOFOleqFGGEqIP7Bah3pypsDxpJEJAUl2/HiuaLMzxnwjrt7jJaPVMFvJh2GjWsEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1852
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


On 10/4/2021 3:06 PM, Matthew Brost wrote:
> Parallel submission create composite fences (dma_fence_array) for excl /
> shared slots in objects. The I915_GEM_BUSY IOCTL checks these slots to
> determine the busyness of the object. Prior to patch it only check if
> the fence in the slot was a i915_request. Update the check to understand
> composite fences and correctly report the busyness.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c      | 60 +++++++++++++++----
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  5 +-
>   drivers/gpu/drm/i915/i915_request.h           |  6 ++
>   3 files changed, 58 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..b89d173c62eb 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -4,6 +4,8 @@
>    * Copyright © 2014-2016 Intel Corporation
>    */
>   
> +#include <linux/dma-fence-array.h>
> +
>   #include "gt/intel_engine.h"
>   
>   #include "i915_gem_ioctls.h"
> @@ -36,7 +38,7 @@ static __always_inline u32 __busy_write_id(u16 id)
>   }
>   
>   static __always_inline unsigned int
> -__busy_set_if_active(const struct dma_fence *fence, u32 (*flag)(u16 id))
> +__busy_set_if_active(struct dma_fence *fence, u32 (*flag)(u16 id))
>   {
>   	const struct i915_request *rq;
>   
> @@ -46,29 +48,63 @@ __busy_set_if_active(const struct dma_fence *fence, u32 (*flag)(u16 id))
>   	 * to eventually flush us, but to minimise latency just ask the
>   	 * hardware.
>   	 *
> -	 * Note we only report on the status of native fences.
> +	 * Note we only report on the status of native fences and we currently
> +	 * have two native fences:
> +	 *
> +	 * 1. A composite fence (dma_fence_array) constructed of i915 requests
> +	 * created during a parallel submission. In this case we deconstruct the
> +	 * composite fence into individual i915 requests and check the status of
> +	 * each request.
> +	 *
> +	 * 2. A single i915 request.
>   	 */
> -	if (!dma_fence_is_i915(fence))
> +	if (dma_fence_is_array(fence)) {
> +		struct dma_fence_array *array = to_dma_fence_array(fence);
> +		struct dma_fence **child = array->fences;
> +		unsigned int nchild = array->num_fences;
> +
> +		do {
> +			struct dma_fence *current_fence = *child++;
> +
> +			/* Not an i915 fence, can't be busy per above */
> +			if (!dma_fence_is_i915(current_fence) ||
> +			    !test_bit(I915_FENCE_FLAG_COMPOSITE,
> +				      &current_fence->flags)) {
> +				return 0;
> +			}
> +
> +			rq = to_request(current_fence);
> +			if (!i915_request_completed(rq)) {
> +				BUILD_BUG_ON(!typecheck(u16,
> +							rq->engine->uabi_class));
> +				return flag(rq->engine->uabi_class);
> +			}
> +		} while (--nchild);
> +
> +		/* All requests in array complete, not busy */
>   		return 0;
> +	} else {
> +		if (!dma_fence_is_i915(fence))
> +			return 0;
>   
> -	/* opencode to_request() in order to avoid const warnings */
> -	rq = container_of(fence, const struct i915_request, fence);
> -	if (i915_request_completed(rq))
> -		return 0;
> +		rq = to_request(fence);
> +		if (i915_request_completed(rq))
> +			return 0;
>   
> -	/* Beware type-expansion follies! */
> -	BUILD_BUG_ON(!typecheck(u16, rq->engine->uabi_class));
> -	return flag(rq->engine->uabi_class);
> +		/* Beware type-expansion follies! */
> +		BUILD_BUG_ON(!typecheck(u16, rq->engine->uabi_class));
> +		return flag(rq->engine->uabi_class);
> +	}
>   }
>   
>   static __always_inline unsigned int
> -busy_check_reader(const struct dma_fence *fence)
> +busy_check_reader(struct dma_fence *fence)
>   {
>   	return __busy_set_if_active(fence, __busy_read_flag);
>   }
>   
>   static __always_inline unsigned int
> -busy_check_writer(const struct dma_fence *fence)
> +busy_check_writer(struct dma_fence *fence)
>   {
>   	if (!fence)
>   		return 0;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 5c7fb6f68bbb..16276f406fd6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2988,8 +2988,11 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>   	if (!fences)
>   		return ERR_PTR(-ENOMEM);
>   
> -	for_each_batch_create_order(eb, i)
> +	for_each_batch_create_order(eb, i) {
>   		fences[i] = &eb->requests[i]->fence;
> +		__set_bit(I915_FENCE_FLAG_COMPOSITE,
> +			  &eb->requests[i]->fence.flags);
> +	}
>   
>   	fence_array = dma_fence_array_create(eb->num_batches,
>   					     fences,
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 24db8459376b..dc359242d1ae 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -156,6 +156,12 @@ enum {
>   	 * submission / relationship encoutered an error.
>   	 */
>   	I915_FENCE_FLAG_SKIP_PARALLEL,
> +
> +	/*
> +	 * I915_FENCE_FLAG_COMPOSITE - Indicates fence is part of a composite
> +	 * fence (dma_fence_array) and i915 generated for parallel submission.
> +	 */
> +	I915_FENCE_FLAG_COMPOSITE,
>   };
>   
>   /**

