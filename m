Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F128A1455
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 14:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B4910F086;
	Thu, 11 Apr 2024 12:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esBdYGWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F510F082
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838055; x=1744374055;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JXcHw+ck47OFFBuVTh4eN7ZG7wB94PA4bel28Xr1wjs=;
 b=esBdYGWOcb0EXpy4OM3Vj3qxCa1JItePQG9jr9pVe80ekiRAluKWwBmh
 7mfLpcFdcrAlQpqfbPI6lqMLGfXV53GCo74oymDWx6RTWKtDEf05gY6UO
 GPE43iO7VwnIyc1lf0lKAxO/MV1WnGgfznlDBGPlsNrBbwY/+gLh2QcWU
 OnlaGNDFEQFWEpStMHUwrzGm7aDN/7pkh9RyS7LKm83gY6Kb4iOC1SASR
 zXsN7wu0CgozQihgDQsq2F7NI9Pt7WOoIK/Fp5jOBNXzdPKoJgRr65vVh
 4/3tHmSsZDprNYsP6ayrg+jNvhLBqNfDn0lf5uzbHX8r3+GCr4GdhN+Ek A==;
X-CSE-ConnectionGUID: fWghu+tQSP+WnrqdoZy8FQ==
X-CSE-MsgGUID: 6eZss7UTT5++KFHT8kFfMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19634680"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19634680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:20:55 -0700
X-CSE-ConnectionGUID: Pp+iIe0cSaWggC2FsCYIpQ==
X-CSE-MsgGUID: gLd7DQIpRq+25MVJQA/POQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25360025"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 05:20:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 05:20:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 05:20:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 05:20:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 05:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2DltkeF3ZD8k8chuWOQ2dUB6ZJAwnLVNrN+6/zgVisGvfSyfMSqOySu2mphVC8+sC0sZOE+cFwQiVLV63JXfZC71gkRiAtuxppXsCIAyzE0kOm+lStXJ24IoQC0NWo31teLE/pyF6WGcZFQBbo3b+8/YiuTr/Ts0wwMp5hiEBtcu7tQUqDhxBvbDUziZh2Lnz+Za+dcz4tpiBpiIfD0I8bxLG8WSoToqjbZH1PVDeSA7N/aVfpOKSh3GKKq8Atsejg7eonRVTlels/zLIJgpKyZRifUKQXZSWBgSlkdwCmcjr8+DJXA1zoDGIjl3hjArClX+Hw/T9WPcOJZ/7Hyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGQd1cH6TwOAd0NU2tsevmFT6vwuzDcU7TUgv5nfrw4=;
 b=SoE8Hs0IVzbllesejS/9MBMU0ersCWJrPX8gm7Nbg+bZwqz+fjstho+j5QokW4ef8gJgj+9OlgerCF1e6Y2N98F2opjFwFB9YhhfJCswJthNrzAIxSHw/tLqNvLAr56xMLTjum9vZGKNmWjneVSsBjok/sH6HTY01MZ6IPMWXHsIVuXMo1AQkKidsZQJaFUZ/eKfCAN5XSMh/yo7NT0e6eBFtEY36dMueQv/BAklIEeJGw7O7854Ym7qfNKnNOdJ1E/yn08KdOToEhsQssfCNgImZ5pDeiK2/8ovyj8YlpDXYa8sVYub8QOtTFixUc7rSvJVv2GHTkqJyA0fyPaGcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 12:20:51 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 12:20:51 +0000
Message-ID: <19f2b2d9-29d4-4e18-ad45-ad7ccad8fde4@intel.com>
Date: Thu, 11 Apr 2024 14:20:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/9] drm/ttm/tests: Test simple BO creation and
 validation
To: Matthew Auld <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Amaranath
 Somalapuram" <Amaranath.Somalapuram@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
 <3fce9308-cba6-4e9e-bcc0-a41aafb3c829@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3fce9308-cba6-4e9e-bcc0-a41aafb3c829@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR03CA0034.eurprd03.prod.outlook.com
 (2603:10a6:10:be::47) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 732e4821-dd24-401c-198e-08dc5a21d3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B+2166PjVJ44euNKyzH/MHVDZ5ty7cCtKoDz4AgkSGPZCCzPqzi+UNxjohCwsb1z7BgFJbqGmGrXLw41W3O+9s3hfD9yUhF4z9yemYD29UNqWenRF6lFv2ZenU9vJilEjuvetB4CxuQ/pnUApFWeGc5v31MGiJkTg+NY4fDayPFdrMcPuUB79c8MR5WiJ022U+VdYy/UpWiN05rK+uyp2HCJ9/QLFaw6cKM2SNjZxX4Hfpawi2f79yWv6CCZ0Myk33Ue+hU65P+uP30ekIfOU2UBKPeLtUkh4m+043hQ1JrcK/t+BOB06mFEipRrVm5zjeM77tNm29+sYrQusMdgS/mMcGeEt1nWPdFCkeS2kE1HMBwJA9+OSH8LbKBZaj/k0O09btrouBeE6RRnG5AdEKXryrOGqjj2pdAE91o6ZveOcZi2A8uh30MrYYrNNLOQyMEIGcQI14wauZH+CIk0AAwPVOeIgcTKi0ZBe533nEq6mg+YTowQXYtSw0qXjdRdAn5qFAhmiVJAW6IMbLtNIDkDPdD731TwqtrX1Lfvzs3XYs5VVTw4nxrmA9wXEFCuzUHjflMmrvlM9E3A/562JRr9FQs1MkB6gk59bh2rP8NB/Ma3LuR+VxAFKPkVj4vHeDooXD+bI0217uLv2mTtaFnTgIALQuhrvN5eAT3GieM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE5vZjNyMW9lWkovRkZXanpEY3JuQzFlWWt3dkNLU0ZoSzNiMUZLbjRqZTdv?=
 =?utf-8?B?TU5UWTZ2d3lFNUI3cHBMRlRERnBJUnpHczJXVG1mSytPeW9zdzlTVjlFM2px?=
 =?utf-8?B?dlM2UUtqVWRIandIcFQvNE5QUTNIWE1udW9LM3Y3V0ladkJXV2l6SFRPbXha?=
 =?utf-8?B?TTFpWVJLaGw2Q21ndFhaNThQdXg3RWF1Mkl1Tnk1QXJHVmI3RmVHeldJRS9J?=
 =?utf-8?B?NlViZXFjS0Jydm8rbGJIT2NFc00zNCtjT0FGQklLTmx2MmdxcnkwS24weHNG?=
 =?utf-8?B?cEtwbVpWZXFlWVN3SFhpN1h1RWFNbXBFQ3ZPZmpubkNZbEIxWXpPKzVDczVu?=
 =?utf-8?B?dmN5akRVcENPVC9NT01zWktXYldjRlZtdjlidnFCOTU3M2hmam1kTmFBL214?=
 =?utf-8?B?eEpFYnlRYzZoTHdZYTlMZG56U1puWGJCNG1OMGd0QktHM1Y4RlZ0QTZmUkVW?=
 =?utf-8?B?M29INCs3WUp1Ump0VmhCaVdtL3pHQzN6WkVoT3JhU25mRHdxS2dHVERsSWtw?=
 =?utf-8?B?M2Rwc25XTGN0b2JJOUdTdTdwV3RDVEtsK3diYWNTM0xJV3orV1dYLzgzRkpW?=
 =?utf-8?B?UHdHSHhEOXlHcHU1SW55ekNuellmZUVCUi9McGVESkFKYnoybHF1UUhIZjk5?=
 =?utf-8?B?YnpFd3VUYnNrN2lXNmljSGExWEpaZEdUZG95dE5KL0xQai9sRDE5UlQwNld4?=
 =?utf-8?B?ZklHRWpqL3pPUU5IOTRRSWdZamRYYktObEhraW81TnAwemY0SXZvMWxneTVE?=
 =?utf-8?B?WDgyZkhEZTMrOVZ2ckVDdDI0cVVHRnRLOHJ3NmdRU0pNUWs1bTJIVFZWS3lQ?=
 =?utf-8?B?Z2tJTkhXRmRXZmFJU21lU212Vk1yUlVSRHJZd0x0bVpxalpzdW0rVmNjeXNm?=
 =?utf-8?B?L2NWWVZYQzc5V1hVL1RNblpBMDloZnQwRnNVckcvb1QvSFFZaXlxNnZOaENV?=
 =?utf-8?B?QjJRYlNIYXNmeGdJK2tpcWhCTFBYaWgvYlZCUUpQbFpQdmxKazFKK1hWb3FB?=
 =?utf-8?B?VU5qMXk4NlpPeGEyZzBWZUFTa2RFWVYwQ3BEY2ljYk9uZ2ZUOW9IVHJ2cGZR?=
 =?utf-8?B?UExmNjcyWGt4YTlBSWptTW5idUpmbUVEOTZnR05peGt0RGk5K0dZRHE4U25l?=
 =?utf-8?B?NVJoVXpINXcxN2ZCek1EcUNmTEtVL2NaaExNaDU1OVBueXFvV2xmUUVyampG?=
 =?utf-8?B?SmRoS2VsOUdFZUZpVmJOWWtPOERwU3JtdFFyYmxFaTNxWnNaWllVcmZmbmo0?=
 =?utf-8?B?akRQb2F3QWcrRHVEem5DUHNsU21QVEcvUms3TzRpaHFXZjA3OURqaFRQblh0?=
 =?utf-8?B?SWVNNVh6UzFoRjNrbHlJUVgySEdWb0ZOV0JKOGtySjdCdjY2SDBhNThyYzBr?=
 =?utf-8?B?aGJ1ZTdtYVFTSkRUQXFNZmNhNnlKL0dZNjdFMzhkejdHbXNMcXlUTVFPVDJD?=
 =?utf-8?B?bFZhTGhsNnBvTFk3bnhVRWVLMnBneUV4TVQrdkFYdnJHcDM4ZmxPVGFMRTcv?=
 =?utf-8?B?YThyMU9ySklOc3hjZm5USTlkZ2dKcGlDMUpqRWdhL3dzWXd6dUcxN2NjQlNT?=
 =?utf-8?B?emNVRjNxWXJSMStteHluTGhlWFpWSVkxL2xZdkNBUzYyYlQrRkNnY082cjI4?=
 =?utf-8?B?SFllZzlRTmxoM29SMG9YdkNyWTBtODI4VXVjd1hSck1GVEo1MVRjMjdsMnNj?=
 =?utf-8?B?bDhLTkdqa2dxMzAvS2t6Zlk1enlubGdBSFE5UXFvL0lxTUlKWXZMdnkwMnI3?=
 =?utf-8?B?L1UrZGJadDJYQ3FjazdoU0VWeUJrc1NOcldXV2Z6V0s1UEpMOEsvSHU4aW9U?=
 =?utf-8?B?eFFuamxvU3lYU1ZyV0N1NXlMbVdGRTRpOVFSQkFoK0ltQXljWU9yVEgzRXJO?=
 =?utf-8?B?YmlvUCtnbUw0dE0zMEhyVXMycVdtRzQvdCtEcTVtWG1tQlVVdi9QWjNrOHhl?=
 =?utf-8?B?eUFwK0pZV0tFTEgzSENXdzFCcEtlWXZoclZRSWE4eCtFZHp5NTFQMXFBSytq?=
 =?utf-8?B?VkVaNzZXTWVqRGhydUo4c1c1NkdqMG1sVlVJU2FRSWdwVEVjYklGdEpBNUlw?=
 =?utf-8?B?VDY5d1RaYnFBTkg3Z3B2VCtMbDBRam1wQ2d2QW9adld6L3dxU0FoeS8wVjRG?=
 =?utf-8?B?L2xTNFBEMkNBbG9uYkUwY0QzdkgxdUdZTWlIRTh0T25CNDFRMTh3eDNGeTds?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 732e4821-dd24-401c-198e-08dc5a21d3cb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 12:20:51.5305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGv10IDXB9APFnEt8srPgk+HqTNWvvK1tZUYuk6shUx0KGvti+3Om8QmOkdQGM6cK32Q7UYy93Fac8+rWAd+Qf2wYxj9lyPy9wt7Tt0Kv88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

On 10.04.2024 16:01, Matthew Auld wrote:
> On 22/03/2024 14:29, Karolina Stolarek wrote:
>> +static void ttm_bo_validate_pinned(struct kunit *test)
>> +{
>> +    enum ttm_bo_type bo_type = ttm_bo_type_device;
>> +    uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
>> +    struct ttm_operation_ctx ctx = { };
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    struct ttm_placement *placement;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    int err;
>> +
>> +    place = ttm_place_kunit_init(test, mem_type, 0);
>> +    placement = ttm_placement_kunit_init(test, place, 1);
>> +
>> +    bo = ttm_bo_kunit_init(test, test->priv, size);
>> +    bo->type = bo_type;
>> +
>> +    ttm_bo_reserve(bo, false, false, NULL);
>> +    ttm_bo_pin(bo);
>> +    err = ttm_bo_validate(bo, placement, &ctx);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_EXPECT_EQ(test, err, -EINVAL);
> 
> ttm_bo_put(bo) ?

Good catch, I'll unpin the buffer and release it, thanks!

All the best,
Karolina

> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
