Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E8466D50
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 23:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CC86FD43;
	Thu,  2 Dec 2021 22:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9946FD43;
 Thu,  2 Dec 2021 22:55:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="234371698"
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="234371698"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 14:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,283,1631602800"; d="scan'208";a="746320456"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 02 Dec 2021 14:55:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 2 Dec 2021 14:54:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 2 Dec 2021 14:54:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 2 Dec 2021 14:54:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVYtZoZZEAflm2+wGvbqe/HyV08RKfsbd7VKCb5Pc+6s3IvgJo5klCH1hBdm9niLiFgANbnoR/KmaOGfysOFFPi9P/R88162sTlklQ8XG+eU59L+G4Gr5+zdPr209hVogUCrOoVTKsSdvMXCy6qMHQTY7OZ79M9WzwzPceUzeydtAZc29sifHR2oqsw7O9QRQMgbPsXwclFDkPdGUPUc5YR6YlOvy6Bj3XSfpb8VY+e0LcRhznhIK8gb0ALhIwXdCFvaDOnLPqd8oPBqoSV2LkKrVDq+ytVfIdp5nFm5kcZo8pDqTi0bA/7vf8QbSsF04br3fmxVEk2ZKDaKaQSS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmL4BjzupU/GiltbpyRMJ9nGbtXb+3UQBSd5F7GIY/U=;
 b=H/9PiiKUVEQTFJ7QOkssTXfoRXtV76YGFLFTFUdEokvya9iqMsKnAFKLv/rPqdNO5mVugaPem+HEGxmc0GQ7KzlA9icua4mQYcEU24EVsKM92OmhoqZg3wi5G4niq9X/wDUhBXg+3p4IAWYwCYQVNCQuje2FwEr2BOpViMYJwxTqynNHZXZXzxtfNRP/ENjQPL0x4WEQYQb8NcKWXtiYOMVpLJqlICxk9xLCsPFrhAdzjBv9OVdAKt3NUWhsJvXZZ4wF82bEfGKrv5r2BvQw/UdTHDfcRCbMTxk+Z9pVXahM28bExayqTiSItZVwfe1mSMuLJD0WA/Vu0w3wHUs36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmL4BjzupU/GiltbpyRMJ9nGbtXb+3UQBSd5F7GIY/U=;
 b=QauWAPWGi/WPvsZV1j1QFCCez+AogRRTY2rxwlj65RoJidswTOwUUq7tHjhojXl9amgz5tfReLlBOHKgAcQJxePqSrzJT/v6WQOoFQ5b3mIoLFk69tX1zJJ3m25Py6nqOOB+5Kr/AFoG2U74aqFzcK2/BaULL8X+IHPmQBeVWxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:14b::23)
 by BN7PR11MB2562.namprd11.prod.outlook.com (2603:10b6:406:b4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 22:54:57 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::de6:9953:b777:39f1%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 22:54:57 +0000
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/i915/dg2: Add Wa_16011777198
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-4-matthew.d.roper@intel.com>
From: Clint Taylor <Clinton.A.Taylor@intel.com>
Message-ID: <3ab69480-abf2-dccf-4e62-878214ec3df1@intel.com>
Date: Thu, 2 Dec 2021 14:54:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20211116174818.2128062-4-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0268.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::33) To BN0PR11MB5711.namprd11.prod.outlook.com
 (2603:10b6:408:14b::23)
MIME-Version: 1.0
Received: from [10.254.63.148] (192.55.52.200) by
 SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Thu, 2 Dec 2021 22:54:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621353f4-4998-406f-f458-08d9b5e6c2f9
X-MS-TrafficTypeDiagnostic: BN7PR11MB2562:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN7PR11MB25624B7DD9E0DC7630738F76CE699@BN7PR11MB2562.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sZfrs9swOyewJb3i+5biJ8gaKnGSdlqeCowHla7ZTLTtd8Nk/1vmTipr4TpDxJbvcukxpH5XNxRisFGi0lnRvM4xrByQiLaOTvLlCEWSPENhCDSQMbw/CgwVvy8ncOkVrxnY8BUxmyol58ie1W4Ik8zv7ZPE2YI7PNesMgkkBxOPNEFkia4cTagnJwb5lWahNK5I5FKgpxARKBbmjzhHfofWR9v1tZfByptgWW/h/hsWTs4jbdgg+YkeP8gdbVANz6sJ85CSc2GW6NF0ztM4eAQbTbsnQBXUrxDqnOFSN1muNPDG8yE9vJ266zSaMT1XAvprxL5iz9dVAvJPWmBhM7E2rNNjnpGtI72EEb9qEFlxWgBBAFwOtjdvMiCHng21seQTN0kne6TpsSn9LGdugKJF7BNC8Y+lJRbp18h4y27lBK3WiSdZ51f948d1TY8Un5G93g6GO8JALEUqeZXjmGvtKvrDCiFHtkm8SD/cjTeiKPTSgkvkfncMNjhDLTmiiiXGTB5vs7yqCnlIvRRuFJmcCEfXVKvmn71y+zUe4/elQS+sz8Ifcw661ihjHaDZrPJvuV3k6y2yWl0GCR5NYVH72/ygPB7h0Vz8EwQBT8HWLGO6IzLLLoWnJxBg9jdzEFIrsTaLxSZcLsXxqXg9EqgRWdREuKtUj5mbJjN2x5KkJ7NhXJF5vRx+kaiTgMBwF/HtDZYfGqOFLDWHhnDTuB7OJ2lAnszS8ptFNziyvOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(82960400001)(956004)(2616005)(2906002)(66476007)(66946007)(66556008)(53546011)(186003)(5660300002)(83380400001)(450100002)(8936002)(86362001)(8676002)(36756003)(38100700002)(4326008)(16576012)(26005)(316002)(508600001)(6486002)(31696002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2w2Y3RFb29lbnc4QjhSNkdoN2IwOCtFTDh0djlBdUxydzBsMlBqRDc3eVcw?=
 =?utf-8?B?TUpuaUVmamFtMkREZmNkS25vL0sraDUycy96Y3RUVE9PSWNjYnhaZWV5MFR3?=
 =?utf-8?B?WjBKaFhZUEpNSGJmOE9Xb1UwNDBhVitzeVNzZ0RVeEVzdDF5WENkWjdrRHJL?=
 =?utf-8?B?djVkMVdWYk5JdFVIc1czS3FHc1liNnpjbVpQdjlVZ09VSE5FdGZhRGczSG5D?=
 =?utf-8?B?T3BzL2dYTHFEaDFvcTZ3MzVKcTFBQnR1VDRGTWx3Ylh1bnJFZWM0RUIwUENx?=
 =?utf-8?B?dkFxaXBZQ2V1TzFpelRNZTN1TGUyY1RTQUhRRjVnMlFNNW5Td1AwSy9MY2Uv?=
 =?utf-8?B?VFFraVhiOVJET3Q1V2k1VGFET1NvNW9ETC84cS9SdkpOem8wblBzSWlvdnJW?=
 =?utf-8?B?VWVoWmdGWVhjY3JXWVQ1MHp1dEYzSzhSRnNkNXJtT3RTYWF4RnBtV2lqRjk0?=
 =?utf-8?B?alR2V2tjSVpOR1lJdzB5aUpuK3RUdGlTdWYwNDVwUDUvY3liOWNzUmRYSWxz?=
 =?utf-8?B?WTEvWEl3YUQ0Y2prZUk1aVY3ZW5IL1JRS2s3QzdjL2JtYXgydHlzV3FFaHFs?=
 =?utf-8?B?bHV0UHd5dXFZR00wdkxLdVk4aytzeWMxUnA4WnVWN3MxMUFxUFJBVE8rUVlt?=
 =?utf-8?B?c2tVajlFdnQwaHQyOGZNUk9UUEU5d3FqeUhuaW1EZ3NIVzJtSU41a2kzTElL?=
 =?utf-8?B?ZlJqeVNma2UrSENPM3dwa0VZSVhXVXYrQmdjc3p4NWFDb3dENnZ3SFF3dmUr?=
 =?utf-8?B?MUVvdnNscHNaWm42Zi83YXNKakdJZXF6anptNmErbkJqWUI0d2JiM1h3UTdD?=
 =?utf-8?B?VGpxeE45SFNkQkR3Ujc2RnJBNkdnMk5EbFAxbTlwcE5KSDJOVmpYLzBSSkk5?=
 =?utf-8?B?R09FZ2pram9sUWpHS3UydTdwdDd4UzJ5VmxLSFIwc3VIR0dRejRmSlJjTHlF?=
 =?utf-8?B?SXVxbVM2ZVdadTFyY1FXMENQTGo2Yk1iNGlTbU1XbDAydVNramZCcmsxanRV?=
 =?utf-8?B?MmE0K0xjLzhIQ3RzTFZ5dlNKcUNhRHZkaER1VVJDRm9CQjY5NmdNY3lJTnpD?=
 =?utf-8?B?SkdEbHlXYkJYbysxdkVHZCtBenlCdjF4NEdvQm9CbzJkR1hDTG5TbENkVE1Z?=
 =?utf-8?B?QlpoVW9oT2xVYVJOME5vNUVYSVpnSy9EdE5ENXBIbW9YWDRVZGNwRlM0VUNH?=
 =?utf-8?B?QXlhNlhIbmtneklad1ZrRHVyMWNGYWJxaEpONUYzWjlIRTdsRTBFaFdJMlNP?=
 =?utf-8?B?NGZuNSszS2N1dU8yNHA0Zkp1QmdaUEVPT1BlWWg4NDl6U3dlL0phN3BaY2M1?=
 =?utf-8?B?SUNvOEZkRHMyd3MyVFgwR3VOeGUwM0dQN04zeWhHS0NvaVZnZ0p2TXNrZWF2?=
 =?utf-8?B?dmpMUHVXcllOVkYvazBtRkdMdzQvbHpZODgvT0NnTE1OYUlvZDhqcU82VUcz?=
 =?utf-8?B?YmZsbE5MdGtGTnlTVlFudkFiRnFmcnFQWkNRcldxclhwUXY4R2xmR0VrcGp5?=
 =?utf-8?B?Sm02aDM1aGxlOXBRN01rNGxkUms5d1crRElZRnVFWWZPbGhmT1duOGJpbzNU?=
 =?utf-8?B?c3dZcVNlQzJSR0lVUXNxNjBOR3RwWkVWaVk2c3B3bHNWMmlBMzVPZ3o1VllW?=
 =?utf-8?B?Yzh5RUFRUVZLZXlSQTg5T1kxSXhqaTl4eGcyTDJOcTZrTnZJK0prSE8rcXRE?=
 =?utf-8?B?Y3NZTW9iR2sxTzh3eGc3SDFsbHgxV3IzOE95T25VdFJEMGkrU29zdFgwd3VO?=
 =?utf-8?B?T3JBQzZLUnRhcHRubFd3T0tmYXlIblpLcTRoVEJyZlZ3b2RZNWNEYnhjeWNa?=
 =?utf-8?B?TEYwUzhjblMrTHRhZWY5dEhhU1RPcm9rTXBKZnNDYXNMOGNvWU1yTzJVaThC?=
 =?utf-8?B?VTRGaFliVjdDdFVlSDNuaUtpUHZtS2RQa0ErR2NzbkdTaW5MaXZweUxNcXYv?=
 =?utf-8?B?aFd5M2lCekJFYTlUaDFqWDFFbnMxYkZYclJ1akhEWm5uWGU0R1o3enZvd0Nm?=
 =?utf-8?B?WitMcG9yNGRuQTAvUjZ0SUF0bTVLallXOSsvdE52VVpKSHp6MXJDOG5LeitE?=
 =?utf-8?B?RWhpaHIvWUdYNkdrZlFzTjJFa05vOVZ6MXVDVTZuWHF6ZTZkVlg0NUpBL1ZY?=
 =?utf-8?B?NngzWXdLMWZGRlh3VkQ1UFZBWHpvejZ5VjRKcjdhRHRhaVIwL05OY3c3L1pk?=
 =?utf-8?B?di9PczRGS0xGb3RNVGV6NldEcVVFVVRhT3RwSk5SbU52S3NyR0svb3VnQm1y?=
 =?utf-8?B?WmhXdU1tdVFQUmxJMkRjMUthcmRnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 621353f4-4998-406f-f458-08d9b5e6c2f9
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 22:54:57.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vx43SzBn1LZTQd3evYvxxeJi8v/o2skWZguRczglxHgDdlTTg7VeGFUuwxIHejrx3F9qUNaIr7v6p3Ev6DFyWFR0HdGT5jz2CFkdFV7g1y4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2562
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct,

Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>

-Clint



On 11/16/21 9:48 AM, Matt Roper wrote:
> Coarse power gating for render should not be enabled on some DG2
> steppings.
>
> Bspec: 52698
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rc6.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 43093dd2d0c9..c3155ee58689 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -117,10 +117,17 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
>   			GEN6_RC_CTL_RC6_ENABLE |
>   			GEN6_RC_CTL_EI_MODE(1);
>   
> -	pg_enable =
> -		GEN9_RENDER_PG_ENABLE |
> -		GEN9_MEDIA_PG_ENABLE |
> -		GEN11_MEDIA_SAMPLER_PG_ENABLE;
> +	/* Wa_16011777198 - Render powergating must remain disabled */
> +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_C0) ||
> +	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0))
> +		pg_enable =
> +			GEN9_MEDIA_PG_ENABLE |
> +			GEN11_MEDIA_SAMPLER_PG_ENABLE;
> +	else
> +		pg_enable =
> +			GEN9_RENDER_PG_ENABLE |
> +			GEN9_MEDIA_PG_ENABLE |
> +			GEN11_MEDIA_SAMPLER_PG_ENABLE;
>   
>   	if (GRAPHICS_VER(gt->i915) >= 12) {
>   		for (i = 0; i < I915_MAX_VCS; i++)
