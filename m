Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F123D8275
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9946E0BF;
	Tue, 27 Jul 2021 22:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E3F6E0BF;
 Tue, 27 Jul 2021 22:25:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="298121076"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="298121076"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="498973339"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2021 15:25:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 15:25:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 15:25:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 15:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP9HYqdWHEzriSB0ErHhk2cpeOkHz/hB/hBCjZvmwmHAdmG7qJXfO/mcW0a3A8POzaxnk1GeMXrybKLG/3fFTgJz/Pf8xmSK8hHDILPjyjQOoQRfT/DnhCcHntKW0FzqfQgatdyQrsOC/sCpDzXJ7TXUL4RIo3fKrYU8xLH9xtzeI//DkBxyKTkHAwkXYw7aGPr5xn1StwK1OS5biWw7unnn89hQW5jZ1JJI3JkXEuHmnbmMMKoYLdqKSAOWMSMHYJcf1J19UQMDTfuCPsGuK2XQQKBELLHfzK+zrTSJJzoR6SwdE7HobvgEoMW6/33LFlE54pkcsEfW0amhoOXC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP+pEffQorasWPqs8PTdWzPuhXWsx+tFFaahS28uwxU=;
 b=McovBN3KTEEQq+mBkIaL4CyTQWUnRMXfZTwIytY4J13Cmm2+KkU2l/W6E/lqKsibbFSf+pY4dtf9F6ZB34C+J5oyWp8Poe5MrzviRjdXJ2IXWeeGeqyxRQVCDmfLr8faBp/fFFwbW3sBuu8cx8npi51JWHTIQ/W72JCxGBSCAl78EapmR+dVHM47X5UNG/BUQlbVfXH5zG+CM0e6Rs7ORJkivyx8SQFXQy5SMvUnIpvdp7K8h8Eaadbtz0oaYuj+3ZOmkzPbOs9EiStyVjuetpTP6T5qQrcpufZircJfGvK9G2HLqcr1yVSetgG7VYFdFiB7SUnHms6iHK3fSrK3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MP+pEffQorasWPqs8PTdWzPuhXWsx+tFFaahS28uwxU=;
 b=muh50kJk5YYnHoUC0vwFhx5bmhS/ZKPIcw9cr8AQwzV3FXQWWafoz4YFWiEUuTTTG3BddfUxvsvACdCvaUPCh8zzWdSba9kTVkI6ijdc3K4tcKWTR6BAAaXB8dkdU7sYnAGMgs/7HLkhoN77N3xKu6IbjaeDdwLfVJjv0m95Oh8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 22:25:22 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 22:25:22 +0000
Subject: Re: [PATCH 14/15] drm/i915/guc/slpc: Add SLPC selftest
To: Matthew Brost <matthew.brost@intel.com>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-15-vinay.belgaumkar@intel.com>
 <20210727191656.GA48855@DUT151-ICLU.fm.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <905ee3e8-19e2-569d-eac7-321aa9747ae5@intel.com>
Date: Tue, 27 Jul 2021 15:25:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210727191656.GA48855@DUT151-ICLU.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0143.namprd04.prod.outlook.com (2603:10b6:104::21)
 To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 CO2PR04CA0143.namprd04.prod.outlook.com (2603:10b6:104::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Tue, 27 Jul 2021 22:25:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ef08dd-c3ed-4584-cab6-08d9514d6c53
X-MS-TrafficTypeDiagnostic: CO6PR11MB5652:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5652BAD15533952866C2BE8B85E99@CO6PR11MB5652.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBDoyVEzafKs7x9zzDZmrUdVxMhmgTvS5o1IljyHeN9EZon27h6FcUxCGi03KsUlpto5xtZJA16WRNeoqd9mWDdpL4A/btlQ86+jRimpAHTjkV9be+L8JL4/3BSMtGj2jmqBqAROi6Ro1mcaZRrehiq0H9meQKCMdRHk0kzIA6b3bfwgkdSJYVsse4UbIlQKXnjuiBY/ISdurdx4AdGrllX5/nOlGeMabhOFOHM97sLj7Ynq/KO49QiSLPEiy2x3MUtCZ3qvMQNcMhoQHFDAv4lzpDX6yO1iin5O7vS263nFGsGAJ+2FlsBle3yxXkg5maSd0DBrHWI3ypS9hTcfmo6xY0AY2kbEMf9JfmM70XCTYGEYzdR2s3TY9tqrUPWLDbQjlJFElsBqSa4QyZ9B99eRe2AU5UlYZkCSZa2SRPJZhVrd+lHdCjVa2Qt48Mu240lXXjvDAPk0I6i9h+R+EwLvn7Q8WLe+BfVxkpmYK5MV/QbIAUOSd6uLimNAbFvIBK7ePj8kXCmN98glEVByLkv3jYp9MA48/eWrVTVl8DFK4YVB9/PrveXSAhDHmoBS3Y1nFJcbTCQGPaIqn105M0GDbWkfV7cbbUltF0g7C/UMmTD4nWV472RRCmSO6yRqLhWfo+jBhgeqseKO156YfhSOIZl3xnrKyWTqO6tVty7hV4LI6ob/DYlXh8jaEdvFeG2Gu87kWLuYdGPiHSNUAIqODM0p+FLJ+rXPtiba99hfWo3TUOvC1Sd6zzSceHLR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(26005)(38100700002)(86362001)(83380400001)(5660300002)(53546011)(2906002)(186003)(6636002)(8676002)(2616005)(4326008)(31696002)(36756003)(316002)(66476007)(66556008)(37006003)(6486002)(6862004)(478600001)(8936002)(450100002)(30864003)(956004)(66946007)(16576012)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRpbk1ZblFleEV5UDhwa0ZiNmg3RFVMbVUwc2lhTXM0d2Y0RG9FcHVOVmho?=
 =?utf-8?B?UmhFMGZMTElrUlFFaXZoNUtBZEp4KzJmTzF1UGtGWUZ3TUkrS2dxS0xwYkIv?=
 =?utf-8?B?RUdLN3VKL1lNa042NHBOY0pjdDRuTmsyemdTNUVVZmNjQ25DZ2p6d2MvV1VW?=
 =?utf-8?B?ekcydmpCWDA2RXN0WFRsME5vMzFOdTJ3WDNnUXh4UDFYUTFPNFYzZ25tdXpn?=
 =?utf-8?B?UTVTdTdPWG9QRkxna1grMkw3QTJVRGEwelliSCtkS0h3N0R1N21nbGhzdHhs?=
 =?utf-8?B?VVpsaXdWVWpCSHdORjJsdGErdkNSdWZpTzNHQ3JWWEVJZ1pKR3Z6M0pVOGUv?=
 =?utf-8?B?TDVvWXBMK3dmYlZ6NVZxMkdBU2FGQTZTWGQ2aVZDOUVKd1BiWWhienljOFJW?=
 =?utf-8?B?QjR6aVd1WGtsZlU1OEc3eEFDSFZia3FOVmJOSlQ1ODNFb1QxT2FrNjVrV2N1?=
 =?utf-8?B?LzB0R3QxWmtGNVlSV3hxdnozNllPbTlqekZTMXgwNzZrajlYU3R2b2N3SUxi?=
 =?utf-8?B?SWJQUlhDZ3R0SVViRDFiZXVWR2pybzBlWW9GS1B0QUxURDRzaHVaNmUwQ3BI?=
 =?utf-8?B?QUZVUmFLWE1MZERzaHRUcXpjZ09QeEE4d2hXSkVmSVlUWXBwOEVEek1LeEVB?=
 =?utf-8?B?QTlMa3NJZ2RSUmJ3Tll2U2NXMFgwY0pha0tYQTdnNk5rdU9NTnF4NGlRUFpa?=
 =?utf-8?B?UVBMMHhha281cmZBVE1iaU9aU0I1Titmc0Z0WVJSeUxHR1oyR1NzbXFEVzBY?=
 =?utf-8?B?UklvTHRxN3d2RFQ1WE9aSjVvSFJsSVVXYWhKNWU2bm5Fd2pkNVIwcW1oMkZV?=
 =?utf-8?B?K3FqaXBRTi9CN1NENms3YTU0WmZHeDlZVzJuNkNFREtDbktuVmNLeTg4TDhj?=
 =?utf-8?B?NkpLS2pVTnh3eU5mOGgxNk1qU3BZcjdjM3NjNHB5NTRva0dydzVjZnNWdytY?=
 =?utf-8?B?WWRVTytEMEVBckF6Uys1SnVtL29uVUx1ZlVMT21jOElucjl0RytuN1V4aEtM?=
 =?utf-8?B?QldWWUhWWjNTd3JVc056ZWpTUXNOaWFBcERtVFhDRUt5NGc4cHlsMVMwTjRv?=
 =?utf-8?B?RGpKdVlzMytIdVFIN1M0WWVZYlA3RFY1YWxTb2hWM0t0bFdVUkVGZy9ra0hZ?=
 =?utf-8?B?WUdRQ2tDNUhQaXBHNzBLdkpWQ0dsU2NDQWZ6R0Fmc3FUK2xWaTRkNEpJTjRV?=
 =?utf-8?B?Z0pyUW8zaUJnMjhrZmt1NUdsV2grbC9HdU1oQy9SMXNrTTMzYVhMdXZDdmsz?=
 =?utf-8?B?ZS81N2RhMzhRNkt4VG9Pblo1cE1GOXVWUng1SkFCU2d0b1NiLzc2R0Q1NVJO?=
 =?utf-8?B?N2hlSFNOdndBQWZJUlR5ZS9BVm0rYlBKY3F5S2pJTzBWc0RNczhDM1QveXpP?=
 =?utf-8?B?NGUxNkJETkx1RG9jVzIwVHAxMmVIeTJWaGxJM2xRYVRRMU9Zc3Z5cS9Zei9x?=
 =?utf-8?B?Zm00bmI2U291K1BVeTk5bVJvcUhMaW5jcGNBYkpTQmtQVHBNWlpkU0o1RHpq?=
 =?utf-8?B?T01CUWN0Wk9jOXZ4bklQVllQbjlJaHhmQXdUSmNDMHpid1VhMkt5ZHlzbTB5?=
 =?utf-8?B?b29VZjZwZThHTTZ3ZVBCN0IwSkxRdk1UTWM1TFpkVEMydXlxUmIxZ29ON1ow?=
 =?utf-8?B?VGJvY2hzYTMyZlRPc3JMYzN1ZXNtZDV5a0QwRmlCZWlrUVV4ZWVjODA3WE9W?=
 =?utf-8?B?dUVhUXhEbGlpSFVVeFYySG92WUMzUWVUTzVMbHJhbWZYMWFid1NibitNeVhQ?=
 =?utf-8?Q?ytOPbQHrj+tG6GpfTkb+bchfZoG0CVQa6Ud9kHK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ef08dd-c3ed-4584-cab6-08d9514d6c53
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 22:25:22.2722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFqSZ+cjNmoZ9pQWpkY8nbx2g7hQ4wmtXYmN2HiFtppVDWEdUSUkgFcuak0JkWvYYiYfjmQ9dPI3yhIa5IMQymdeBRMFS4Zmi6+zo31kTZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 12:16 PM, Matthew Brost wrote:
> On Mon, Jul 26, 2021 at 12:07:59PM -0700, Vinay Belgaumkar wrote:
>> Tests that exercise the SLPC get/set frequency interfaces.
>>
>> Clamp_max will set max frequency to multiple levels and check
>> that SLPC requests frequency lower than or equal to it.
>>
>> Clamp_min will set min frequency to different levels and check
>> if SLPC requests are higher or equal to those levels.
>>
>> v2: Address review comments (Michal W)
>> v3: Checkpatch() corrections
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
>>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 311 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/selftest_slpc.h       |  12 +
>>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>>   4 files changed, 325 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/selftest_slpc.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index 48d4147165a9..6237332835fe 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -2318,4 +2318,5 @@ EXPORT_SYMBOL_GPL(i915_gpu_turbo_disable);
>>   
>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>   #include "selftest_rps.c"
>> +#include "selftest_slpc.c"
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> new file mode 100644
>> index 000000000000..5018f686686f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
>> @@ -0,0 +1,311 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include "selftest_slpc.h"
>> +
>> +#define NUM_STEPS 5
>> +#define H2G_DELAY 50000
>> +#define delay_for_h2g() usleep_range(H2G_DELAY, H2G_DELAY + 10000)
>> +
>> +static int set_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>> +{
>> +	int ret;
>> +
>> +	ret = intel_guc_slpc_set_min_freq(slpc, freq);
>> +	if (ret)
>> +		pr_err("Could not set min frequency to [%u]\n", freq);
>> +	else /* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +
>> +	return ret;
>> +}
>> +
>> +static int set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
>> +{
>> +	int ret;
>> +
>> +	ret = intel_guc_slpc_set_max_freq(slpc, freq);
>> +	if (ret)
>> +		pr_err("Could not set maximum frequency [%u]\n",
>> +			freq);
>> +	else /* Delay to ensure h2g completes */
>> +		delay_for_h2g();
>> +
>> +	return ret;
>> +}
>> +
>> +int live_slpc_clamp_min(void *arg)
>> +{
>> +	struct drm_i915_private *i915 = arg;
>> +	struct intel_gt *gt = &i915->gt;
>> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
>> +	struct intel_rps *rps = &gt->rps;
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +	struct igt_spinner spin;
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +	int err = 0;
>> +
>> +	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> +		return 0;
>> +
>> +	if (igt_spinner_init(&spin, gt))
>> +		return -ENOMEM;
>> +
>> +	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> +		pr_err("Could not get SLPC max freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	intel_gt_pm_wait_for_idle(gt);
>> +	intel_gt_pm_get(gt);
>> +	for_each_engine(engine, gt, id) {
>> +		struct i915_request *rq;
>> +		u32 step, min_freq, req_freq;
>> +		u32 act_freq, max_act_freq;
>> +
>> +		if (!intel_engine_can_store_dword(engine))
>> +			continue;
>> +
>> +		/* Go from min to max in 5 steps */
>> +		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +		max_act_freq = slpc_min_freq;
>> +		for (min_freq = slpc_min_freq; min_freq < slpc_max_freq;
>> +					min_freq += step) {
>> +			err = set_min_freq(slpc, min_freq);
>> +			if (err)
>> +				break;
>> +
>> +			st_engine_heartbeat_disable(engine);
>> +
>> +			rq = igt_spinner_create_request(&spin,
>> +					engine->kernel_context,
>> +					MI_NOOP);
>> +			if (IS_ERR(rq)) {
>> +				err = PTR_ERR(rq);
>> +				st_engine_heartbeat_enable(engine);
>> +				break;
>> +			}
>> +
>> +			i915_request_add(rq);
>> +
>> +			if (!igt_wait_for_spinner(&spin, rq)) {
>> +				pr_err("%s: Spinner did not start\n",
>> +					engine->name);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				intel_gt_set_wedged(engine->gt);
>> +				err = -EIO;
>> +				break;
>> +			}
>> +
>> +			/* Wait for GuC to detect business and raise
>> +			 * requested frequency if necessary.
>> +			 */
>> +			delay_for_h2g();
>> +
>> +			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +
>> +			/* GuC requests freq in multiples of 50/3 MHz */
>> +			if (req_freq < (min_freq - 50/3)) {
>> +				pr_err("SWReq is %d, should be at least %d\n", req_freq,
>> +					min_freq - 50/3);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				err = -EINVAL;
>> +				break;
>> +			}
>> +
>> +			act_freq =  intel_rps_read_actual_frequency(rps);
>> +			if (act_freq > max_act_freq)
>> +				max_act_freq = act_freq;
>> +
>> +			igt_spinner_end(&spin);
>> +			st_engine_heartbeat_enable(engine);
>> +		}
>> +
>> +		pr_info("Max actual frequency for %s was %d\n",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min\n");
>> +			err = -EINVAL;
>> +		}
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	/* Restore min/max frequencies */
>> +	set_max_freq(slpc, slpc_max_freq);
>> +	set_min_freq(slpc, slpc_min_freq);
>> +
>> +	if (igt_flush_test(gt->i915))
>> +		err = -EIO;
>> +
>> +	intel_gt_pm_put(gt);
>> +	igt_spinner_fini(&spin);
>> +	intel_gt_pm_wait_for_idle(gt);
>> +
>> +	return err;
>> +}
>> +
>> +int live_slpc_clamp_max(void *arg)
>> +{
> 
> This test is really similar to live_slpc_clamp_min, have you tried to
> combine these into a single function with arguments?

We could, but the for loop in clamp min goes from min to max whereas 
clamp_max goes from max to min. It's more intutive and easy to 
understand if we keep it this way.

> 
>> +	struct drm_i915_private *i915 = arg;
>> +	struct intel_gt *gt = &i915->gt;
>> +	struct intel_guc_slpc *slpc;
>> +	struct intel_rps *rps;
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +	struct igt_spinner spin;
>> +	int err = 0;
>> +	u32 slpc_min_freq, slpc_max_freq;
>> +
>> +	slpc = &gt->uc.guc.slpc;
>> +	rps = &gt->rps;
>> +
>> +	if (!intel_uc_uses_guc_slpc(&gt->uc))
>> +		return 0;
>> +
>> +	if (igt_spinner_init(&spin, gt))
>> +		return -ENOMEM;
>> +
>> +	if (intel_guc_slpc_get_max_freq(slpc, &slpc_max_freq)) {
>> +		pr_err("Could not get SLPC max freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq)) {
>> +		pr_err("Could not get SLPC min freq\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (slpc_min_freq == slpc_max_freq) {
>> +		pr_err("Min/Max are fused to the same value\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	intel_gt_pm_wait_for_idle(gt);
>> +	intel_gt_pm_get(gt);
>> +	for_each_engine(engine, gt, id) {
>> +		struct i915_request *rq;
>> +		u32 max_freq, req_freq;
>> +		u32 act_freq, max_act_freq;
>> +		u32 step;
>> +
>> +		if (!intel_engine_can_store_dword(engine))
>> +			continue;
>> +
>> +		/* Go from max to min in 5 steps */
>> +		step = (slpc_max_freq - slpc_min_freq) / NUM_STEPS;
>> +		max_act_freq = slpc_min_freq;
>> +		for (max_freq = slpc_max_freq; max_freq > slpc_min_freq;
>> +					max_freq -= step) {
>> +			err = set_max_freq(slpc, max_freq);
>> +			if (err)
>> +				break;
>> +
>> +			st_engine_heartbeat_disable(engine);
>> +
>> +			rq = igt_spinner_create_request(&spin,
>> +						engine->kernel_context,
>> +						MI_NOOP);
>> +			if (IS_ERR(rq)) {
>> +				st_engine_heartbeat_enable(engine);
>> +				err = PTR_ERR(rq);
>> +				break;
>> +			}
>> +
>> +			i915_request_add(rq);
>> +
>> +			if (!igt_wait_for_spinner(&spin, rq)) {
>> +				pr_err("%s: SLPC spinner did not start\n",
>> +				       engine->name);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				intel_gt_set_wedged(engine->gt);
>> +				err = -EIO;
>> +				break;
>> +			}
>> +
>> +			delay_for_h2g();
>> +
>> +			/* Verify that SWREQ indeed was set to specific value */
>> +			req_freq = intel_rps_read_punit_req_frequency(rps);
>> +
>> +			/* GuC requests freq in multiples of 50/3 MHz */
>> +			if (req_freq > (max_freq + 50/3)) {
>> +				pr_err("SWReq is %d, should be at most %d\n", req_freq,
>> +					max_freq + 50/3);
>> +				igt_spinner_end(&spin);
>> +				st_engine_heartbeat_enable(engine);
>> +				err = -EINVAL;
>> +				break;
>> +			}
>> +
>> +			act_freq =  intel_rps_read_actual_frequency(rps);
>> +			if (act_freq > max_act_freq)
>> +				max_act_freq = act_freq;
>> +
>> +			st_engine_heartbeat_enable(engine);
>> +			igt_spinner_end(&spin);
>> +
>> +			if (err)
>> +				break;
>> +		}
>> +
>> +		pr_info("Max actual frequency for %s was %d\n",
>> +				engine->name, max_act_freq);
>> +
>> +		/* Actual frequency should rise above min */
>> +		if (max_act_freq == slpc_min_freq) {
>> +			pr_err("Actual freq did not rise above min\n");
>> +			err = -EINVAL;
>> +		}
>> +
>> +		if (igt_flush_test(gt->i915)) {
>> +			err = -EIO;
>> +			break;
>> +		}
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	/* Restore min/max freq */
>> +	set_max_freq(slpc, slpc_max_freq);
>> +	set_min_freq(slpc, slpc_min_freq);
>> +
>> +	intel_gt_pm_put(gt);
>> +	igt_spinner_fini(&spin);
>> +	intel_gt_pm_wait_for_idle(gt);
>> +
>> +	return err;
>> +}
>> +
>> +int intel_slpc_live_selftests(struct drm_i915_private *i915)
>> +{
>> +	static const struct i915_subtest tests[] = {
>> +		SUBTEST(live_slpc_clamp_max),
>> +		SUBTEST(live_slpc_clamp_min),
>> +	};
>> +
>> +	if (intel_gt_is_wedged(&i915->gt))
>> +		return 0;
>> +
>> +	return i915_live_subtests(tests, i915);
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.h b/drivers/gpu/drm/i915/gt/selftest_slpc.h
>> new file mode 100644
> 
> I don't think you need this header as selftest_slpc.c is the only user
> and you need to forward decl these functions. Even if you did, you could
> just forward decl these in the C file.

Sure, will remove.
Thanks,
Vinay.
> 
> Matt
> 
>> index 000000000000..0480e62ed3d7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef SELFTEST_SLPC_H
>> +#define SELFTEST_SLPC_H
>> +
>> +int live_slpc_clamp_max(void *arg);
>> +int live_slpc_clamp_min(void *arg);
>> +
>> +#endif /* SELFTEST_SLPC_H */
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> index e2fd1b61af71..1746a56dda06 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
>> @@ -47,5 +47,6 @@ selftest(hangcheck, intel_hangcheck_live_selftests)
>>   selftest(execlists, intel_execlists_live_selftests)
>>   selftest(ring_submission, intel_ring_submission_live_selftests)
>>   selftest(perf, i915_perf_live_selftests)
>> +selftest(slpc, intel_slpc_live_selftests)
>>   /* Here be dragons: keep last to run last! */
>>   selftest(late_gt_pm, intel_gt_pm_late_selftests)
>> -- 
>> 2.25.0
>>
