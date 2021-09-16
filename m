Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2087040E46A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E5B6EBFE;
	Thu, 16 Sep 2021 17:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4576EBFE;
 Thu, 16 Sep 2021 17:24:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286305704"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="286305704"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 10:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="509439066"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2021 10:24:04 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 10:24:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 10:24:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 10:24:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR4ZWSaaEWLsYEMkWWpGRnxz9EhSsO4FdUOhJ4zDgNXGv3Fav9IsNkO3+EQOgMmZbAitPCvfIByXvYI27ZvOldIapgtJPfzNmGVzda4ixWdXIdGWlYQ+c7/Hc52O6EyeOnJCHxhiCzWf4JTdiBxDST0c6mBpJIvbRQ5SruEZ31k6MKvZR9WUBgFHuuCja65shPr0ip7VffjhFXIoQNhUFU6ggyYTT/Q5X9Xjz8oPOeNvs4EJAl5LEK+Z8oM7Vvrlsj9MUI6fnQ8INkx4ftlBcS/kueOhuOgYh5uJPJyqiRQWIjK1zvIlvXvx9c3ekSWMHfFFQaYyLPiHImm9osgyyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=v2s/Ix9sPDS9EDz1ZDZtiHRMfru+xKPYp+Atunm3wzw=;
 b=mHtkt1iM60cqVLLXjawFEeiCLKzxju2IbdT+Qsrne1W+wBVcfwga3sPFsoXSwb7QLyErGb/6MqR/cIwwYnzSp0iVYkoUxB4JOgexB0zX74aJVefXu27g2dtIrKtmd7pZctHyQGT7H+D70fkYtH/Z0qObht1LBKZ0U69rV3dXPydWEawNgrWbpxM2z5/0MU/luEun8JNeV/yFoo4cQ1muHfEAl+dOSyS6XXMjLbgSchlEE/YmUPX7o71Q02MLNaefiNbIfjob8UtkwjOXB2Endbeq+YKC4jfB7cY2ERlv44VS9rHQ6usygCXm81lg2ahPDVveFpHUKcmOIBUVZ7ysgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2s/Ix9sPDS9EDz1ZDZtiHRMfru+xKPYp+Atunm3wzw=;
 b=lCIdPzjPOaH7Q5VqSo34tAU1UV3cf3QB5vMOp+XzusTBD5KhOja64AEQuQzEkHR59hQKVhPbh7iamwhNav5S7WjxO06kl03WtC/iVfb0rVker8F1W9nC9PrZmpHFr+dUmccCruTTAHCpH2Azi350ALeDi2XVEJkxH76ZR5xvZC8=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 17:24:02 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 17:24:01 +0000
Subject: Re: [PATCH 4/5] drm/i915/guc: Enable GuC submission by default on DG1
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <thomas.hellstrom@linux.intel.com>
References: <20210916162819.27848-1-matthew.brost@intel.com>
 <20210916162819.27848-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <9e3c5b1f-7056-8f73-2d24-649fd19764d8@intel.com>
Date: Thu, 16 Sep 2021 10:23:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210916162819.27848-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:104:7::21) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR04CA0119.namprd04.prod.outlook.com (2603:10b6:104:7::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:24:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f451b6b3-ced0-4b33-d55a-08d97936c6a2
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB564327A3A7CBFDC62C627EE3BDDC9@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKE8zivuoUrbxnxaAbh8Y28HEWNQ4H1iIkcEAaaV44LM3rpo9RssmvZlmz2R3fJ0kXz/xyr4ULEIvNw/56uZT4eiH7FxvltP60P1IL+tyOitUoTTNDVvzhJq3lVB3jeeLiswIzUr7KxK8qdjnC7B1T67d8eAFR02H0qx78Vott4kYu6PcIbpVEccl7E+VioFLhuT0Dk0uWMraIMF0nmHXekDIYmSG87lPgzCOR/KAVl6biC4r4cYQur+KM1WXW41bzB5i/LTucJi8MhTFZe8uWHo0rxVBySTVi7P+BsaxLSzp/fiJXTWk+XdNdHvIWz3lSxff2I4xX42oLvXzEbS7Hw80ieqobr76m+J892w1Pf2ZwMc34IFByFgIhvGrP98rnIrP+QMc6dBGpQ3lJQLiqRrKrkoYszCHPa461iIwwC7ZhOvuvBry83RwZZc/6bCUPuAkzXJSwFXTPGIZjgkYlLJWrrjM3UxzBEfONW450QPsrjapOgToxA5G0dfU7teJEPGlEI7HQF2C7xmadfVGEEFaFDNWJkuFHeGHXNx0CD6N2jEpZP48L8z0SKoOVE6+VBY3E2oqL4yrrm/hgbN8vLfKuDD+uu3HwSZNhn77eJlDiI3816aXiNnaTKLaGwTPNhCXWPQP8Dz3ozC+vg4UB8qmKpIZCDNRWo5E6ba2Sugsw97HxBPd5uAWQJqpR7ADHKXuzXIzXiCnPBWIJNMJsTp28QWTAb6YsBvZlSH2fWnWmRHZpvwvwoo92Ax6PAD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(38100700002)(4744005)(2616005)(66556008)(316002)(16576012)(36756003)(31696002)(86362001)(478600001)(6486002)(8936002)(8676002)(26005)(5660300002)(53546011)(186003)(83380400001)(4326008)(2906002)(66476007)(66946007)(31686004)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9NdW9OSHZINHdnVE9GSUtFMmlJSTZoR3FVR0xSOFZGU0cwREs4Myt4OVJj?=
 =?utf-8?B?Q3k1elpLYU1oK2FHYXRtVXZtSkJZNjRRN2Ryc1FFREhvVXBYTEVDUG5zK0hK?=
 =?utf-8?B?SmZ5M0FQYlJ4R2Z3dFEwWHBIZ2lhYXU1ZUYrbnFwUEJlMDJWek1zVzBlK1Ar?=
 =?utf-8?B?d2hhdWxlZC8xL2dGZ244ZVoydWwybkE5NnJOQ0xwd1F4VW1mWURXb1FHU0ZT?=
 =?utf-8?B?dmRnMmJabmk5Vm9LMWhDQkZ1TCtuTGw3MGplS2ZUYUpDVzZQUW9RQjd5VStO?=
 =?utf-8?B?cWM1SHFBSkhyZ3JWbHRTN2hZZ09sVGlkNm5pZkVpdXBFWFNxZE1pNTNjYjlv?=
 =?utf-8?B?UFNWekV6c3p5WmdHanpIY29LcXhDdzc5Tk44c0x2ajNDZG1ZN1ZMazlXRFdy?=
 =?utf-8?B?K1o3K2xGWmZJOHlvME5VUCtSNC9CaDlRSElzb1ZocEhiRk0zTVdUNWJnN0dq?=
 =?utf-8?B?VHkvUzUyM3IzZytYSEJtRnNSVnFBd1JheDZQbHZmbXBKVXV1UmJKdGhxcEJJ?=
 =?utf-8?B?VjZEckRQTHpROVR6MTQxZDUxSkZoVTJBT2RicGprenY2aHF2dEFlMm1Uaitj?=
 =?utf-8?B?Ni95Mzd4eHlnYkpoYWFwbzRZMStsVTdXaWFVM0p1SDZnOGpLNEgxSDVjTEE1?=
 =?utf-8?B?Y0wxNUFtOGtYK1lzMG5OaWlMV005dWxvYjhhbHBZME02aFE1bUk5QlExVjNx?=
 =?utf-8?B?blVnaFlEMmNXQUQ0TzJZSHVIKy9RaDA5SXN6RnZnK3FZdWdnY3NiMjVpcjdC?=
 =?utf-8?B?MUx6SWcrMFl2cHpqTWY0STRNM2wyL2ROTmF5bU1xUE5VRERHUUtlcmFGK21P?=
 =?utf-8?B?VVU5aHdUQmRqK0g0U0ZaVEFyTTBTWFAzeUJJWExXa0RNZVpqMWMwZ1JyMExZ?=
 =?utf-8?B?NTlTUExnWkdFYWY4V3AzRVljZjRva0JobHFZaGYrSHFMckU2b3lRY1lCYVVM?=
 =?utf-8?B?NWVqKzJJS1Y3STcvZWFoVXYzekdRVXRQaXEySEJJcTVXdjdIci81MHArTWRi?=
 =?utf-8?B?NGdGRzNHcms0b3pEMnR5Q0w2eGpYVDduS0pZSEJPSk5ZSlBuTFZnWEJIS1Jl?=
 =?utf-8?B?ZU03Ny9abDBkeEE2dHRSM3RHN0xsN01tOE84Yk5hU05vUkErWHdLOWZvYnNY?=
 =?utf-8?B?WGNoclV2cDJEc2ExeENsM2Q2MkpNd3RwWXczMkVvVldyTUJQY2pTR0MwcS91?=
 =?utf-8?B?WmphQXk0Y0wxL2hFMDdueWNNVFRoTGRPeTNkSVpVcDl5cWhSVXZXRjRoUmRs?=
 =?utf-8?B?NWpKT1Z4Sm1BTVhtSTRzdDdQc2YrdnRUTTRCVWJOTWVqc2lmMUNhaWU0MUcz?=
 =?utf-8?B?NjNuVFNSRkh2SkFEeW0xc0UveWQ4dmx0SVJIQTAvTFpFZVVNbE1TWCtsRWVK?=
 =?utf-8?B?bzZWekMxSkhsK2dGUk1YemdPMndrdVpkcW5GZzVRd2pWekUrNEVsVC9SUEZT?=
 =?utf-8?B?S0dMQm0vZTJ1SzM3dXY5WlRrQXhtS3BicTYrU2hrYkQ2QlViSlNpcFp1L2xL?=
 =?utf-8?B?dzd5aFBZYlJsR0tQMXVWWjdOV0JrdmJacW5vM3p4U0MvaUJpcHlwWGppUVNT?=
 =?utf-8?B?SW9IdHJwbmlXeE96clVLci9paUlZMm5ZdS8rV1Y3Vm12MkpmSVcwMXdTZ29s?=
 =?utf-8?B?a2pnQ01Rd3lOSmtNQzkxbG1jbUlFTEJPa1Yxd1dHWGJtUmxXSGgyRU15cXJa?=
 =?utf-8?B?ckxIaXRDYzF5cUhkeXA0cmNTVUt0dzJuN3VidTRJQ011RC9GSGtSK0RvZDFn?=
 =?utf-8?Q?4XKADv6B8GiWZe/1xWLbuZnKK8gg/JznhQcpKWz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f451b6b3-ced0-4b33-d55a-08d97936c6a2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:24:01.8535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7s3UB79K3dYsAbQ1lixjzebcYV0TvyKMC/uGNoqPsH+WsYdiGuwrnhAo5Oc4jjGjC522QRnca5c2XS/JUYOPG0N8tkH7yp0vpCcNIeqUNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
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

On 9/16/2021 09:28, Matthew Brost wrote:
> Enable GuC submission by default on DG1
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 86c318516e14..2fef3b0bbe95 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -35,7 +35,7 @@ static void uc_expand_default_options(struct intel_uc *uc)
>   	}
>   
>   	/* Intermediate platforms are HuC authentication only */
> -	if (IS_DG1(i915) || IS_ALDERLAKE_S(i915)) {
> +	if (IS_ALDERLAKE_S(i915)) {
>   		i915->params.enable_guc = ENABLE_GUC_LOAD_HUC;
>   		return;
>   	}

