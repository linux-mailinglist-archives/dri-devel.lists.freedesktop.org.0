Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E320B3F6CDA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 02:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99881898F1;
	Wed, 25 Aug 2021 00:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A76898F1;
 Wed, 25 Aug 2021 00:58:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="196997035"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="196997035"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 17:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; d="scan'208";a="685881074"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2021 17:58:51 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 17:58:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 24 Aug 2021 17:58:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 17:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBdoVAXQW3elDdKGTxbb7oJYgGIqqVZ74QgzRp0SpKXI7mo7ZEQqGlf0uDajbnUbWmgKxdyJwsTg8QTd4omqk8SfxCS6PpoNgVtcg8ptxd1hsCriKMMnrYVTPnrQhTVxPWmaMrRjA83YBPuG/raAd7Ir/R8zhcPbMqlrvquCmbmLCVYM2np+LNj+6zoAIMtXv7vp4gYxDx0koxD8/1dBghcsfE8pIF3of50LBQVF7NDmQnA+zd2K7P/G3ScOkK2su5+rP7g4HLzRxX8baDeXns1X1EesmpLcwVSCJAQ/1IgeZQvWNxQKDU96fs8f1lAR8RajT4acetzYa3QCUloFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFxKoGCi/2xEsb05BW4m9uhzdPg4YM0dHYxOtpvbK3s=;
 b=BoN5jhrTLDLv7/Vs+CMaL2zhc6QegsEul1jQn/1FuE6Fnu+nM1Xrp6e1VIvBhfPI4nS53e5vW1/bKxI/A+ZeuQEGUjmbs8Q092ga192NqCPyJybBFX/vxbxVeq5Rg6z4JbBVweaN//3wPRXdCphvFbKu9vOiIHCQ9IEcXt0H9C1X7nH+/b37DbABK6IWOi37G7hKNewgQjQAMOg5QSRN/y83PcnMcZbNOFtbDAEaDWNCZsQN0ldPXCWO5ivCa/ZKMC8iICEO3MwboG2jIfkj2ufq4x+jmNPn3kFwLMKFAGMHfkOa1uzxI0NipOcRDFFlHUVpTEpZARydN2pcZp//aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFxKoGCi/2xEsb05BW4m9uhzdPg4YM0dHYxOtpvbK3s=;
 b=tsr0iBIP/2DyhIGP0PLKezI8ND8+2hiOvky2yctGer6hR2Nw8lXU5Ifhd/KHqAflLpnpr/+xNz+TgDrdCFeV5/kX+Tkq4gohfMhzSWZoZtsUUn+8dMUfGoFD/Daj3FPQunDATLb+SHCCLyqo4BHlq5jIYjGwm1bW7RFW1O+4l5U=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21)
 by CH2PR11MB4295.namprd11.prod.outlook.com (2603:10b6:610:3f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Wed, 25 Aug
 2021 00:58:49 +0000
Received: from CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e]) by CH0PR11MB5475.namprd11.prod.outlook.com
 ([fe80::e5ff:a40e:c7d1:570e%9]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 00:58:49 +0000
Subject: Re: [PATCH 12/27] drm/i915/selftests: Add initial GuC selftest for
 scrubbing lost G2H
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-13-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <7bcf8faa-9b1d-77d3-61b3-29236d7b5c0b@intel.com>
Date: Tue, 24 Aug 2021 17:58:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR21CA0070.namprd21.prod.outlook.com
 (2603:10b6:300:db::32) To CH0PR11MB5475.namprd11.prod.outlook.com
 (2603:10b6:610:d6::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR21CA0070.namprd21.prod.outlook.com (2603:10b6:300:db::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.1 via Frontend Transport; Wed, 25 Aug 2021 00:58:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89397c5a-c160-4cc0-89d5-08d967637f78
X-MS-TrafficTypeDiagnostic: CH2PR11MB4295:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR11MB4295BD37C834DB69E412DB9FF4C69@CH2PR11MB4295.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EiGvXQsayQeOlthG4M1h3SXaUMQpK9m/2ANsqRe2yhWBfXs+92JLxJ34VkPAwQHCMCKMeUtBOCE5DOT4UoSV6jFoiOPmr14Sti/2vR1PvPoNYOKlZdyW7e7qCw5WMYYCO2jruN4rcjPyt1SH/gSY9CNc3mvJKOeq1H9hGDwWtulo638ViNi703Vv3gE4kzeBvagF53nOJG3xa3GZKMzQ6vYpqW6sme+29DD3PEAx8gTdgj0B/qBZsmtv78SUCy+n2xcGaDCbLOlasVY0k/IsS719/+lWmJy02jMAaE4U5em1IABZrMafR4ZJuSku7fjSgicvcM0yXpeQBgNXUrx8dSRFJZSuwh62Zl/qRzdd0pzFXByN66zaIR1huGLCMH6rW386Gww28qPwHk5Uxpcx+C/e0SYIrpZN62OfJE0TbKrH8H23ydF1pqWynxmT0CTgsYsDQUuWp4nWqHObA1hQ9iWaW/WC0VbiLt87DP5QBMAxN5v3j8h/p5TsokYz2Ct5njWu9jMgq/pscbulG0OiKLZ14lPmLI9h3CDc8pkDCzbGkDoc4sXyEfaok/1fzEd1CQQMBEAa16sQkCvSUtwo3jDQG8i1wjxwjQrea808jdSoy3QEoQs1/LXu88uAIkBbya+m1wlGkcURR5NnLbG+rBrTHJJcoytu5OHa9P0btjS1HEigO1e8w8/QGleZM9VnBFvKrdbs2MddKtBGFnTaOLgyBhBBH6fm+Up8cQuheVi597cZqqvduacR+XD467DG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5475.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(36756003)(5660300002)(66476007)(478600001)(38100700002)(86362001)(26005)(83380400001)(53546011)(2906002)(66556008)(6666004)(316002)(4326008)(16576012)(31686004)(186003)(66946007)(8936002)(8676002)(6486002)(2616005)(956004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnEvalVlNVBaSXlKTGNaL3hqNURRbTVoa3YrS2doYUdxZ0JwWnZxLy83OVdC?=
 =?utf-8?B?RUNnNFZkNDF1OThZTkNOSFFDWXRNZEVYcGhNT3JwSWMrKzdXZklzNFJ6REpB?=
 =?utf-8?B?ckFRZDRJamNVMEN1ZXRRc1NKbDkxSlAwZmFPWCtxV3VsU0VFVUlPc0J6V216?=
 =?utf-8?B?OVBhdzcvWm9FM1AxRW83RndBSVBNMHQvd2FKSHh0VUxFQTV0cWNKVUpZRjJa?=
 =?utf-8?B?cHpRNTB1UHM0blQ2SGk3enJKT0pVS00xYnB6cHl1UU0yUFIwalpQVW5LK0hP?=
 =?utf-8?B?YkRCT3R6cVFNZ1hFdTZpRGIxakorR1JveDU3c01LbVJnMUVmMlZRNUdPSGtS?=
 =?utf-8?B?d1pnL1luRUZhOHlMVWpQZUNBNFZyT1BObGxmd3M0U0dCYXhUWFdtWUE5ekRj?=
 =?utf-8?B?TFUyL29tWGdUbEJlYzYyQUg5czg5RU9pRVRlUWZmNnNVc29PQVhOSVRYY00y?=
 =?utf-8?B?RlZmdkNWamJHRDFSR2YzcmJTUExJVFA0YUpickZMUWprYTRrdlk5WHpOSC9D?=
 =?utf-8?B?VndBbWJyNGk5bUJyS0RkSUxiVjh1YzJIVUV1OFZNM2J1MGRtY1l6Y25xbnJC?=
 =?utf-8?B?NjRYMWduNEwrSHdtZkNNYXFLVUYzSENydXFjU2ZPTHIyU0swQW9aRUNScnJw?=
 =?utf-8?B?di9TV3JMMCtQSUUvMXIzTjZieHd0aVlVaVZKb1ZEZ3R1K05tVE1LVHJGbU1M?=
 =?utf-8?B?TFY3WGsvK2FxT2thcjgrVWlpS2RsZWtWUG5uaDJvQlFWZlhDdy9yTzVjaDJN?=
 =?utf-8?B?Qy9NdWdjM1VvMlppb2lKNFdjb1RmclRLRnhSZDB0alAyWnduWWhZL3EzeW13?=
 =?utf-8?B?UmNpNWdOc2E0KzVsdjdoUHd0VC8rUk5EOStIUGUvYUtyVUd2QUlSK2tKQnZJ?=
 =?utf-8?B?N0xmbXNYSG1TYUp4d3U5ME9wM0N2NklRYkJCZVN2TFRTKzdRaXhJWWxuRFZ0?=
 =?utf-8?B?S0ZKZ2hZZGJ0QTNxL0VhVkFsMG9zTnVQOHpxbkFKcUlpbGk1dnZTbktkWTVk?=
 =?utf-8?B?bGdZNFNFTlVMNWlFN1dScWxZU3BvajZHOUU0NFlQdy81K0ZvMlNsWnI3bXBC?=
 =?utf-8?B?TjJKWmN6VU8yY1NSbkdYaUd1eEpyNHVic0QvSXF6QVYzRG1PN1F2Y2tNVGpq?=
 =?utf-8?B?WXo2d3liU0dRRlh6TmE3WDhoS3JHY2pLL2ZOdFFpTnFGT04wMHZ0c1YwaFpQ?=
 =?utf-8?B?QmhKWkF0eEd2dnd1NWNCT1kzdHNjZHZGU05MNU9paktrYXBSam1FMW5KdmFY?=
 =?utf-8?B?WFpOazBXWE93Q0hmSCsrSXptT0pIaVhjb2dTM0g1OXcyMVAzaUtNZnJjM09t?=
 =?utf-8?B?MmVpZS9VbHZkOHdxb3B5RDVBT2trVGs1b0ovSlVZOEdPMG5xVloyZ09NQzNX?=
 =?utf-8?B?aEFtZzhURk9Gc0xIQlRDb3FrbGErL1NzdzV0NGhwWjNmbE82NzliUmVYcy9h?=
 =?utf-8?B?KzEyV1NJWGdiN2gwUWljMzQxdGhNL2pwL2FyTGFkQ3hZRUdlbkZ2L0dRaUZT?=
 =?utf-8?B?Vnd0VVVOazdqSkhsRkNBbnM5amQ1dE5TaDdDakRYVkUvdFpSUFFtdHowNjBM?=
 =?utf-8?B?MUVSTS9mVlFnVFZuTVVlWGhHWS85TWRXUUNUVzdiYSsrb2JjMWNtTHc4L01X?=
 =?utf-8?B?Mk5DQnJsbW9TdFF0eWx2MHlWc1kxbGxtUWtnNmJEVUVTTzZsRWJyWXNXaTdN?=
 =?utf-8?B?MFBpT3JaSVNYdkZsKzNvNW1xNmYzcmxxU25RNTlEcTBRd0VYRjdiRFI5L3Rr?=
 =?utf-8?Q?sVnlg2MzlzHOLP21gosUP5LuBXKDUu2wRDumCNe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89397c5a-c160-4cc0-89d5-08d967637f78
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5475.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 00:58:48.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X84vhRRNxkFrqBzkdCLWOAjNUwCUYTrXGcvXQZ36oAkyplGD39xq6iRUfMOyTfvlrd2io7QJUFJnFPrQncRMnhRjQKBr6tAYjuvn1tJXl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4295
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> While debugging an issue with full GT resets I went down a rabbit hole
> thinking the scrubbing of lost G2H wasn't working correctly. This proved
> to be incorrect as this was working just fine but this chase inspired me
> to write a selftest to prove that this works. This simple selftest
> injects errors dropping various G2H and then issues a full GT reset
> proving that the scrubbing of these G2H doesn't blow up.
>
> v2:
>   (Daniel Vetter)
>    - Use ifdef instead of macros for selftests
> v3:
>   (Checkpatch)
>    - A space after 'switch' statement
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  18 +++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  25 ++++
>   drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
>   .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>   .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
>   .../i915/selftests/intel_scheduler_helpers.h  |   2 +
>   6 files changed, 184 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e54351a170e2..3a73f3117873 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -198,6 +198,24 @@ struct intel_context {
>   	 */
>   	u8 guc_prio;
>   	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> +
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	/**
> +	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> +	 */
> +	bool drop_schedule_enable;
> +
> +	/**
> +	 * @drop_schedule_disable: Force drop of schedule disable G2H for
> +	 * selftest
> +	 */
> +	bool drop_schedule_disable;
> +
> +	/**
> +	 * @drop_deregister: Force drop of deregister G2H for selftest
> +	 */
> +	bool drop_deregister;
> +#endif
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e53a4ef7d442..e0e85e4ad512 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2635,6 +2635,13 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   
>   	trace_intel_context_deregister_done(ce);
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +	if (unlikely(ce->drop_deregister)) {
> +		ce->drop_deregister = false;
> +		return 0;
> +	}
> +#endif
> +
>   	if (context_wait_for_deregister_to_register(ce)) {
>   		struct intel_runtime_pm *runtime_pm =
>   			&ce->engine->gt->i915->runtime_pm;
> @@ -2689,10 +2696,24 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   	trace_intel_context_sched_done(ce);
>   
>   	if (context_pending_enable(ce)) {
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +		if (unlikely(ce->drop_schedule_enable)) {
> +			ce->drop_schedule_enable = false;
> +			return 0;
> +		}
> +#endif
> +
>   		clr_context_pending_enable(ce);
>   	} else if (context_pending_disable(ce)) {
>   		bool banned;
>   
> +#ifdef CONFIG_DRM_I915_SELFTEST
> +		if (unlikely(ce->drop_schedule_disable)) {
> +			ce->drop_schedule_disable = false;
> +			return 0;
> +		}
> +#endif
> +
>   		/*
>   		 * Unpin must be done before __guc_signal_context_fence,
>   		 * otherwise a race exists between the requests getting
> @@ -3069,3 +3090,7 @@ bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>   
>   	return false;
>   }
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> +#include "selftest_guc.c"
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> new file mode 100644
> index 000000000000..264e2f705c17
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright �� 2021 Intel Corporation
> + */
> +
> +#include "selftests/intel_scheduler_helpers.h"
> +
> +static struct i915_request *nop_user_request(struct intel_context *ce,
> +					     struct i915_request *from)
> +{
> +	struct i915_request *rq;
> +	int ret;
> +
> +	rq = intel_context_create_request(ce);
> +	if (IS_ERR(rq))
> +		return rq;
> +
> +	if (from) {
> +		ret = i915_sw_fence_await_dma_fence(&rq->submit,
> +						    &from->fence, 0,
> +						    I915_FENCE_GFP);
> +		if (ret < 0) {
> +			i915_request_put(rq);
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
> +	i915_request_get(rq);
> +	i915_request_add(rq);
> +
> +	return rq;
> +}
> +
> +static int intel_guc_scrub_ctbs(void *arg)
> +{
> +	struct intel_gt *gt = arg;
> +	int ret = 0;
> +	int i;
> +	struct i915_request *last[3] = {NULL, NULL, NULL}, *rq;
> +	intel_wakeref_t wakeref;
> +	struct intel_engine_cs *engine;
> +	struct intel_context *ce;
> +
> +	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
> +	engine = intel_selftest_find_any_engine(gt);
> +
> +	/* Submit requests and inject errors forcing G2H to be dropped */
> +	for (i = 0; i < 3; ++i) {
> +		ce = intel_context_create(engine);
> +		if (IS_ERR(ce)) {
> +			ret = PTR_ERR(ce);
> +			pr_err("Failed to create context, %d: %d\n", i, ret);
> +			goto err;
> +		}
> +
> +		switch (i) {
> +		case 0:
> +			ce->drop_schedule_enable = true;
> +			break;
> +		case 1:
> +			ce->drop_schedule_disable = true;
> +			break;
> +		case 2:
> +			ce->drop_deregister = true;
> +			break;
> +		}

Would it be worth making the drop bitmask?

#ifdef CONFIG_DRM_I915_SELFTEST
	/**
	 * @drop_g2h: Force drop of selected G2H for selftest
	 */
	u32 drop_g2h;
#define I915_SELFTEST_DROP_GUC_SCHED_ENABLE BIT(0)
....
#endif


So in the test instead of a switch you can use:

     ce->drop_g2h = BIT(i);


Not a blocker.

> +
> +		rq = nop_user_request(ce, NULL);
> +		intel_context_put(ce);
> +
> +		if (IS_ERR(rq)) {
> +			ret = PTR_ERR(rq);
> +			pr_err("Failed to create request, %d: %d\n", i, ret);
> +			goto err;
> +		}
> +
> +		last[i] = rq;
> +	}
> +
> +	for (i = 0; i < 3; ++i) {
> +		ret = i915_request_wait(last[i], 0, HZ);
> +		if (ret < 0) {
> +			pr_err("Last request failed to complete: %d\n", ret);
> +			goto err;
> +		}
> +		i915_request_put(last[i]);
> +		last[i] = NULL;
> +	}
> +
> +	/* Force all H2G / G2H to be submitted / processed */
> +	intel_gt_retire_requests(gt);
> +	msleep(500);
> +
> +	/* Scrub missing G2H */
> +	intel_gt_handle_error(engine->gt, -1, 0, "selftest reset");
> +
> +	ret = intel_gt_wait_for_idle(gt, HZ);

I think here we could use a small comment where we explain that the GT 
won't go idle if the scrubbing was not done correctly.
With that:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	if (ret < 0) {
> +		pr_err("GT failed to idle: %d\n", ret);
> +		goto err;
> +	}
> +
> +err:
> +	for (i = 0; i < 3; ++i)
> +		if (last[i])
> +			i915_request_put(last[i]);
> +	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
> +
> +	return ret;
> +}
> +
> +int intel_guc_live_selftests(struct drm_i915_private *i915)
> +{
> +	static const struct i915_subtest tests[] = {
> +		SUBTEST(intel_guc_scrub_ctbs),
> +	};
> +	struct intel_gt *gt = &i915->gt;
> +
> +	if (intel_gt_is_wedged(gt))
> +		return 0;
> +
> +	if (!intel_uc_uses_guc_submission(&gt->uc))
> +		return 0;
> +
> +	return intel_gt_live_subtests(tests, gt);
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index cfa5c4165a4f..3cf6758931f9 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -47,5 +47,6 @@ selftest(execlists, intel_execlists_live_selftests)
>   selftest(ring_submission, intel_ring_submission_live_selftests)
>   selftest(perf, i915_perf_live_selftests)
>   selftest(slpc, intel_slpc_live_selftests)
> +selftest(guc, intel_guc_live_selftests)
>   /* Here be dragons: keep last to run last! */
>   selftest(late_gt_pm, intel_gt_pm_late_selftests)
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> index 4b328346b48a..310fb83c527e 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
> @@ -14,6 +14,18 @@
>   #define REDUCED_PREEMPT		10
>   #define WAIT_FOR_RESET_TIME	10000
>   
> +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt)
> +{
> +	struct intel_engine_cs *engine;
> +	enum intel_engine_id id;
> +
> +	for_each_engine(engine, gt, id)
> +		return engine;
> +
> +	pr_err("No valid engine found!\n");
> +	return NULL;
> +}
> +
>   int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>   				 struct intel_selftest_saved_policy *saved,
>   				 u32 modify_type)
> diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> index 35c098601ac0..ae60bb507f45 100644
> --- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> +++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.h
> @@ -10,6 +10,7 @@
>   
>   struct i915_request;
>   struct intel_engine_cs;
> +struct intel_gt;
>   
>   struct intel_selftest_saved_policy {
>   	u32 flags;
> @@ -23,6 +24,7 @@ enum selftest_scheduler_modify {
>   	SELFTEST_SCHEDULER_MODIFY_FAST_RESET,
>   };
>   
> +struct intel_engine_cs *intel_selftest_find_any_engine(struct intel_gt *gt);
>   int intel_selftest_modify_policy(struct intel_engine_cs *engine,
>   				 struct intel_selftest_saved_policy *saved,
>   				 enum selftest_scheduler_modify modify_type);

