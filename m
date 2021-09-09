Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17B405FBE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D3A6E942;
	Thu,  9 Sep 2021 22:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32846E93F;
 Thu,  9 Sep 2021 22:51:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="281948601"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="281948601"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="696682847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2021 15:51:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:51:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:51:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:51:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APp/cdYIcrjgQvxrMGocsGuluy9tQ75xSq6sZgkjlgZr4UkKvxArkhLGRH18Hwt3PMVq/ZS9DkeRE1KsvHkOAhrCnfzJeVYk1HX1v6mURmAUC/9wT3M2jjEnZ7K2vzMv2PtbvuQUHKcVv0I15UMA/bim4TP2XPoUPqYgv9j4d4aKXxgRiSHpoH/lqzKeOZBmjqKGJp236gd/vJmv6m6WrhNRvMYGrEsu/zT7c6UKd5c/74Bx6IV6S3WZ31jafnldA61F0F7JHuTc/hU94SmrvkAsifQzH5F4xBXJdTtreg4eouZgnlVRA535FI1vpcgDRReJmFl4624brplmL/veZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/Hn5KFho6Mamd2vm0HE+BlToE9/vHNE7z4UUFNaOQHk=;
 b=FWsJhcn4LtFufGxG7UbG6d2Gc54E0MpMgQen73CqcDjz9mEfN+gCHhRhdc6XKBZKdJhu8dTE7qZhQVpaJakQ83Ubd3/ItjQ4xwLJAihhfATsMAIZcBaQsHgGgS03bTcx0vrtM1jYyJ6ObsEJWuCrkAYX7ymwkLqFiajO5iwYahUX1UKaPrIDO6XVnFiQCfOs/NH0/kjzJ2Jx01a7mUY1pfbtEGAPJYtJHawHHv4RuoVBPNsaWvnoL2c6hj7gIF6UuSiE6fMtTZ5n9DXQXhuqdJ2br/ytSt9WsU1iiDBSprVu5pkF2Imz6GTAn0oDht/Se3X3UYZMVPHMsLV9MN+Iwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Hn5KFho6Mamd2vm0HE+BlToE9/vHNE7z4UUFNaOQHk=;
 b=pe9av0CUOkIPKUsoQFbVcK+8c3k3GN5BbStHTbIUmw7e41sOSdxt34giYyBQwbsJpwQAB6EQPsegQxgE8jzS/GFBHtntZN4zzYisrNacQ20sNrWeJRmgnjT3n7rrx9ZW2VZJHZZKeSkAVD67hQeEVwIvQ1QzMbob/k98F+Ao514=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5639.namprd11.prod.outlook.com (2603:10b6:8:24::15) by
 DM4PR11MB5567.namprd11.prod.outlook.com (2603:10b6:5:39a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Thu, 9 Sep 2021 22:51:41 +0000
Received: from DM8PR11MB5639.namprd11.prod.outlook.com
 ([fe80::813c:c498:c3a2:7309]) by DM8PR11MB5639.namprd11.prod.outlook.com
 ([fe80::813c:c498:c3a2:7309%7]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 22:51:41 +0000
Subject: Re: [Intel-gfx] [PATCH 07/27] drm/i915/guc: Don't call
 switch_to_kernel_context with GuC submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-8-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
Date: Thu, 9 Sep 2021 15:51:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-8-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR14CA0006.namprd14.prod.outlook.com
 (2603:10b6:300:ae::16) To DM8PR11MB5639.namprd11.prod.outlook.com
 (2603:10b6:8:24::15)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR14CA0006.namprd14.prod.outlook.com (2603:10b6:300:ae::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Thu, 9 Sep 2021 22:51:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e16560a-4693-443e-457e-08d973e45da3
X-MS-TrafficTypeDiagnostic: DM4PR11MB5567:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB556786BC339741CFEABBC93EBDD59@DM4PR11MB5567.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Lb5vcRSHJmk41s0omidQ7GAqg9/xogHz/SucNSXgBgHsfTgl9InbVmN6cJxKpf95D+tUomBj6CRHq3/R1WHukQprRnk1eBxYqqZj8s8120V79y+AqH6lpygPmS1QPPzW8SYJvHXsSYZvLRiAaQ1DW6FmIaXlWmMFgUZeWHXfrzryGa0XGZYkQbEq84LQkHUsdSKT6oANpu8/4gdyXGwEt9+mei/KgiVBGspd8vQO3Y8TNpjK6WZHnbf1WFfladvDafc9uoEl32+yw7jsFJoumYgjJ5r2nhCuNcfjvmSR6QppI87xQKL8+HZWAFHSCmBP3YUx83ejKPPcqX3O9+ms8b5kFEr4gT2dfm3WArFABDi2bnKyZNKK76ccyL8X7t+unzSqHLEkVlueWG0gFSAa7twznT54bzNjFuBJVJbwA/uzyB7SOx7BjYIqv6ejDsv35rWvcdqSsh85hRXn2QwBricdYjp94dpLRIQNCy1l88H2c6cH3Wy/w9/10W64UZ3tuOsBQQrvAqP7mcjfV/JSgORTdvULByiJqNAPif6avwSQO0eu5kqvDUmJyr+VX3APz7LWCFD92HhCnLHS4icLDU3HlFg35UJXZ1tlwSBNniJFYGjJyEzlR8W3auLS7x7pA13p4G4TlouWcNmrWCAypIU6cJBRsNptI5o93DEul0YF9T20pw1kuBhR7TUw9VOopiwJtkgi0ICoNQ3X6d/qGwZ6OyFZESmqMWWIlhfRlTepWKyL/XAA0Q8zBmWGGJp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5639.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(5660300002)(6666004)(86362001)(2906002)(36756003)(31696002)(8676002)(16576012)(38100700002)(66946007)(316002)(2616005)(4326008)(956004)(186003)(53546011)(26005)(8936002)(66556008)(66476007)(83380400001)(31686004)(6486002)(478600001)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDhydGZBY2JTeWIrQzR0VzlXSDBEVG5IKy9rRjlmWnM1MUN6OHVpUytSbzNQ?=
 =?utf-8?B?VDF5OWE0VUpzZkV6N2ExL0FKRVluTFBhUnQ2NGsydEFMZmVlbEZ1eHN3WFRU?=
 =?utf-8?B?LzU5eVlQZXQyVGNzY2xiQnlmaE1jUzJtWEQxOXBSZHJiUEpaYldtOWxaSzVo?=
 =?utf-8?B?YWdkb204RmltbzBoQW1Ta2c0dVlSY2wyUlBWNndJMzEzV3QvVUZDNlpjVHk3?=
 =?utf-8?B?enFMblpMUmFrNHdwTTlpTkxXR0huSC9mWVJzcVdJRnJXZGV3cFdaWDdTNkU4?=
 =?utf-8?B?K0FvMjdQMk5CUUtUOWlCWWg1b1RwTkFQZmRNb0gxaVgzanpiSGhJYWZCWWJv?=
 =?utf-8?B?Q2tNRHd6RWMrbFV2TENocjkvNG13R01JNjh4dG52SXN4cnBSMmJlSVBiblF2?=
 =?utf-8?B?UE5NNWtNYXAxbFNWODloeGVCcjJzMS9FcSsweTFGalE5NVV2OHFuSldGVC8r?=
 =?utf-8?B?N1ZUNjJDVm9VQTd1K1ZqTGlwNTBFOHZFcFJYQWVUUC8weHJ1dTFKWmJnTlhE?=
 =?utf-8?B?Z3U1QkdZeXk1eUx6OVlYb1BhNFhnbi9PV1c5ZnJHelVPR2xsTkFrdTQ5bmV5?=
 =?utf-8?B?cXkwUFJ5c3BaR09SMkkrOWFkRUxDVElvZEc5aFg4WFkxbWxVejV5TGQ2Z0hL?=
 =?utf-8?B?TDNqVDZJS205MnpuMmFtZjFkWXZZQ2JtajJ0RHMrTmVuWldPL3JxRWV0U0Jh?=
 =?utf-8?B?ZUY0NUpwdFhsclg5TVlNN051UzFkY0FKK29DWllBN2p3b212Zlg1TGZzUTVX?=
 =?utf-8?B?QXYvcC9ld3ZQR1NjclhRUjhwWDJJTzNEVytBdTJZYjdvRDRBUGV0YW9Zb3Vk?=
 =?utf-8?B?bHhKd2trVEV2YjhQM3dCcHB6cFRybkJQajhUeW5lUDJQVDVBQUlQbHVJUE9a?=
 =?utf-8?B?S3hmSzQ5TnBPdnJjaWUrUWpoNFZBcDJoT3h1MUxHdlBZRTJBYlVnNzZnNzA4?=
 =?utf-8?B?cEI5UjJaV0dhWEp2ZTdNdjZ3U2RpR1VOOWlwc2lEZTh0a0JZS0JKa0N6SVRO?=
 =?utf-8?B?aTRIdDFiMVJCLzN1eWFWeld3Wk9maE9kTUdXN1JNdlRyMk9sc2VnQkpWV09w?=
 =?utf-8?B?QTA0bGwxeHF4b1ZGdU4wbWtsQTFpSlg1d1RjcW1GTHFuU2RSSVBEamVEZmpF?=
 =?utf-8?B?VkxnOVFjSEdkMGdLMXBqQXNPNllEVmRnSnRSZ1UwUnNhV1EwRGhKMVlZQ3Ja?=
 =?utf-8?B?eTY0N0NIeEgzUWJtb1U0c1dWVUFHZ2t4VTB6MDYrMTVWTzIyYlYwTjNEVG1Y?=
 =?utf-8?B?MXhlSXgwZkNNY3ZFUWRUL25SdlVaWWZNQ0dXZkRaenFZUUoxbDFHbnEwNm1K?=
 =?utf-8?B?dmVnUDhBajRxVzlGNUNtdW1oemd2SVNTblQ2bGh6a3dmMWFydEI1UUt2c3Az?=
 =?utf-8?B?clRMM0tSQjF0cDhWR0VhOHB0cnd3TXI0L2M3RXp1QUhQM3R3b05FVUx4Sm44?=
 =?utf-8?B?Q0lLZi82YS9nZlNsdjJFa0s4S0M1U1YvdithaHNGRHhzeklrTjRJTVR6TDJO?=
 =?utf-8?B?VVFudURqcGtubEcxN0tqbWt6VzBsMFp5MFYrTVh1Y0Juc1U4UEtWeVhFOUor?=
 =?utf-8?B?Z0JrWEdXYS83bmNSdjYxVithRUpjRG9EZFNRVTNjU2luZVJ0YmcvMFhXWlNF?=
 =?utf-8?B?akJlTTVwaFNGdHVOMkMrMWhGem1mdHoyNUZyMTRkbFNuZVFxM21EaWY2WXlM?=
 =?utf-8?B?azhHTW5tNm9NSmJOZ1NDc0RZanFUOFFvWEpFT3BGNkRiUnhpaDI5Z01reHFD?=
 =?utf-8?Q?tUK60gAt3reAetbMLVZrbvKsLOt4bgGByue/9z+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e16560a-4693-443e-457e-08d973e45da3
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5639.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:51:40.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao/reP0uh928in2fkKO1OdJPa+l75kbhsvxvpK2CV4ZrAszYamPoNezd8UFKqe0GW6LRtYYBDYFFr13xiVgIF3svPUGajNm/JIQlWXq3Ons=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5567
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Calling switch_to_kernel_context isn't needed if the engine PM reference
> is taken while all contexts are pinned. By not calling
> switch_to_kernel_context we save on issuing a request to the engine.
I thought the intention of the switch_to_kernel was to ensure that the 
GPU is not touching any user context and is basically idle. That is not 
a valid assumption with an external scheduler such as GuC. So why is the 
description above only mentioning PM references? What is the connection 
between the PM ref and the switch_to_kernel?

Also, the comment in the code does not mention anything about PM 
references, it just says 'not necessary with GuC' but no explanation at all.


> v2:
>   (Daniel Vetter)
>    - Add FIXME comment about pushing switch_to_kernel_context to backend
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> index 1f07ac4e0672..11fee66daf60 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
> @@ -162,6 +162,15 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>   	unsigned long flags;
>   	bool result = true;
>   
> +	/*
> +	 * No need to switch_to_kernel_context if GuC submission
> +	 *
> +	 * FIXME: This execlists specific backend behavior in generic code, this
"This execlists" -> "This is execlist"

"this should be" -> "it should be"

John.

> +	 * should be pushed to the backend.
> +	 */
> +	if (intel_engine_uses_guc(engine))
> +		return true;
> +
>   	/* GPU is pointing to the void, as good as in the kernel context. */
>   	if (intel_gt_is_wedged(engine->gt))
>   		return true;

