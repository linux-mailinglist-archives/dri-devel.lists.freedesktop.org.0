Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47289804D47
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08A410E4C1;
	Tue,  5 Dec 2023 09:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FBC10E4B5;
 Tue,  5 Dec 2023 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701767481; x=1733303481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AP3SrK4Fko9Q99SIxYqNt4W81qnPyc5JXrDC8eovuZ8=;
 b=jTD6Ttf2sti66FftT6gLbnsVPNZBNNC3J84LA1mUlYPluxPa7Orj8RK5
 ygD7tvQgRY2/xx6Edwjfls2uQoYCkey2ktM/EcZxqbfVGDOfbjr0SkrIp
 wsvH7SatcQPQfxISOa0OGDApyX3cwt4u921muPx0Plm2grO9sfLGAOIir
 vtIyASoeM1kllPOlpxGVR7RK+Si4nwIJTPcGMan4RjQtP2KQMGcLLpT4v
 /EYGDRUl5vmGe0zH8fed84jBBvjcoXQ+PMHvG+CtR77ll0IzQmJiflHLZ
 D4rs1zxiW0rMzXBkbMkAYzAmEuFDaiQA3BjWTaEP0Uz2Fq/W2jqkUNHLE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="927579"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="927579"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="770839064"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="770839064"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 01:11:03 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 01:11:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 01:11:03 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 01:11:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clSUV6I51gNWmpsMHloW3SglNDQrdC3ZtiBZhbg+XGgc5hlKP4sYh2MnuLgrwdsvN0ANFBiYQCMewy5HFfstRrl+SL5IwK66JjfimCw8t37k1HVT+0tHlPOOQMtrjYvsRjzf/DHlEmBX4BJxK7tbzCc1918J9pSXUTOFYxhKoWDDOLOUHckhTb/lF8AonuGE2l76c9VXm6GUbUnPyyVqLK/z6YxkTSJfvwqxtU+TuuG8bzPfmx2xAthxXcDVEv7+5UsUDfO8V5VSpUdgky2a6d+a1DHQvOzZgUmIvbFW/nQLDz/QjN2mmvFHRa7UmVw925VWMiqdGHOsRXt+ahGMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDqrlwVbXjOlDXFRLHCIpetWD4wwKvrLgH52Zysf738=;
 b=JK8nIcheAhQZBNQYmEixxGFR+2qWRIHaO1EctkggMC3rXUsD3q0de7DqvgYTxGX7kSOhzPv+KOWwO940i9zfki8u/u+W6FcBkBpaEQOHwppWUlrN1+xTehA+Gtj4/L9oAcBZ6MC+EoUbzYmXAnFAe5M+eLcG2EPAOEcM/U1n/o+2idwu2JVwZ7atNYdOfNxTUahv9OgbVw9Lxj5kfmH2HffnV+04iFm82GYATwcW1lDjiNTb+usRKOC8TVrkquSnegOXhKjVtwwMKTEbbMWAkhM0ajdoir+1Dk/qS3aJXiRR09XWE9jBTcocOTZYk9rU3Dh6DnWu6sqThdV8j5quhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 09:11:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 09:11:01 +0000
Message-ID: <40875e9a-3729-4153-8de2-69d0ce586442@intel.com>
Date: Tue, 5 Dec 2023 01:10:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/gt: Convert reset prepare failure log to trace
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20231205085248.2577-1-nirmoy.das@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231205085248.2577-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: bae92f3e-0005-4e3d-69d5-08dbf57219ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VjWJr5He+/IEbGgdN3t8nc1nrzMggO3FHxeG3NxIKu0UljT8bUN9tZix1UJEiV81VTUaOENBq4r0zB5HiqN0yjaX1jBbTEhPvDca+1imqyPcoYSBM7H1bod3Lz8gAa6PoE6t2fDvNvWtTLOuPj/ulybfmh9/CFUyC3Q3ugnXXxGSZI74ONwUfN09ZfV8F/LhZppeD5Ny8suvNTSXC0txar/Z6DeWMEYZf52vpCr+Un8mcePuJ73AvEjVUSHucoAqR+KMve6e+4TzZzra+6yWHsGFasqPlGJRluQ21g5Q5CAW+Cmb/k3/d7O8JE5gvXw2SaOwg/yN6OnbHVfwr+BSxDBfXvFxrlEfKinpnZkJsIB5UaRwGti7NjbIYDtnMGe0172xqwm0HttL48wjk76NQGDKU/t0x5O54+YbZl1mJSM2nJ9BusjstPYQt45LSbkTNfgVne97ratwReN9GG/HDcItXySLSUgUwfDHA6QKDUsNyGYPbNrtc3BWZwJsLDObK2xx7N9Wx0NQjVK3ZRE0CkBtGVd+3y2CzSwpJiqh4XyZVh3I9B8SEKeVIZNQM0DqtNCfKEkb3FKGubQOla3MFcrQiWGTU5BE+jG9heOht71z5cxkvBfDIXN073bu8xUy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(346002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(966005)(83380400001)(478600001)(6512007)(2616005)(53546011)(6506007)(26005)(6666004)(316002)(66476007)(54906003)(66556008)(8676002)(66946007)(86362001)(36756003)(41300700001)(8936002)(4326008)(2906002)(31696002)(5660300002)(38100700002)(31686004)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHRoQ3JOWWpicVY4NzFyVE10SEJSU1Q4ODVpdlBNM0lKMWJSU0UyOG5Kbzdz?=
 =?utf-8?B?aHNNYzFCY0wxS0RRam1LcmF5WTZNL05Wc1V2Q0NiRmMwdDNzM1BrWmJUcXpk?=
 =?utf-8?B?VEhTVS95Qk5mRXptejZhYUF0dDZMZDVSV2p4NDVvTXJJNG5wVTVCU3RxTVN2?=
 =?utf-8?B?bktWbVBCT2k0bEJtOFhqcDFidVVBQm05UzRtR0lvT2dzd0Iya0dyZDIzVEM3?=
 =?utf-8?B?djZtYVV1L2h5M1NBb2kyUkl2MFo1dXZaQWRPOURMRlpKSUpJdk5IckJ3cDdI?=
 =?utf-8?B?SkhMNXJtWWs4Z0M4eXg3UkFLc09WalNRVXBRanRkYXFSaHRVT1crblZzeUFu?=
 =?utf-8?B?dkdVb1l6TW5ZL3VaN2prTVhpQnRDejBhYytoVXQxZmlUUCtlQ2psS3pqZzF1?=
 =?utf-8?B?MmJGbTRadDJkT1JHdnl3UnloblF3c0NXdGt0Y3FMRmtQV3c2Qnhqak81Y2dl?=
 =?utf-8?B?enlWNGZXYVNrdDJZcXY2TVU5VXE2TGxoYnZQN1Y5emZ4TVhPRTJ3TFpuaUha?=
 =?utf-8?B?ZzNZRklLYUl0ajgwRC83RklqNlh3ankzSU1vRWdFblFHbjFqOFk1OEcxK0ph?=
 =?utf-8?B?Q3I1UU1FdzM2NEV0d2N3d09uVVJ3aFZtY3JRRUFMb2I1d1dXQWo0bGs4bkZw?=
 =?utf-8?B?bmRLMEpBdXFWTWJ0SXFCVzlkQS9tcERUbjh3REppNGppQnFsMXltY1lUUDlT?=
 =?utf-8?B?V1J3dC9sdkdIVDg5YmtkcFA4eC8ySVMrcjdGWUlFRDZJVG5MOXJ5YWRCaW9m?=
 =?utf-8?B?aVF5WldIczlINmcrWnpudzlzUThlWXZHZDU1Wk1lNjhZbGVuN1dZaXQ3RGZ1?=
 =?utf-8?B?ajQ0cFdHT1R4UGpmWGloa2tZUkpFbmkzVUs4V2VaV3RobHVXemY2MStXd0Jj?=
 =?utf-8?B?d013K0RGNlkvMFlxTWVHNEJ5UzJ3cnl6VGM0VGIwNVpiSElNWlUweTdFTkhj?=
 =?utf-8?B?bnc5K0F6d0VVVFpTeDk2OFlJbWZxcnN5b1plZGV3OHUrTHJQUGsxY0MrZ05U?=
 =?utf-8?B?Q1ZuQkdGSGtENVQxaGlpV1FMNGh0LytiOUpMMWpQR1JnNkQrQ2FBNmFyakZV?=
 =?utf-8?B?dnpMWnhsb0pqaEpERmZXSjQvWWFlVWI0UElydTBVUXZmUGxzazZld0pteUJj?=
 =?utf-8?B?VEhra1JFYkpuNU9Odm5YYTlJekRBUit3Q2c5U0EvaXZSaHE5MGtDMlJySlpx?=
 =?utf-8?B?aFkyRmZMTjZ4a0QyTWVRalNSei90RE5CYVgrdFFTc2YrWkt6UnlndlNtRUVF?=
 =?utf-8?B?MU44SjFWcG5hQzVDdmQreHVvNnNWTFJBSkFHaVdsV0QzaWd5UHo3VDUxeXpr?=
 =?utf-8?B?Z0xoMFZwZDdCOG1lUEhjbkxISThTMTRKVDQzL3BBTm9qaWwxU2pFajB6YVlZ?=
 =?utf-8?B?QkEwYXBYV1QzMHorRlRpNFZiL3ZwOUVNb0c0N2ttei9tbk1tQmpPbVlmOHhO?=
 =?utf-8?B?Z0liVTBRckhIUEE5RzlFUGJkc085MlUxWkt1dnQ1VjJsZitmVGNjZU1xSS9i?=
 =?utf-8?B?MnFTaGdkM0lxcS83N01yRlVPV25KbVdoU0RpdkpYclNNcmZzSW5UZVdvd2hN?=
 =?utf-8?B?SEt5b0o3VWpLdmxjMHRyaEljaTRjckVrRkhBRmk4L09DNlIwUjFnN0dWZjR0?=
 =?utf-8?B?V2tQZFpWU2E4bWNPZndhSTVrWmg0bm1lQ0FzK0VUc1FNS05qNUplVXRzQ3d0?=
 =?utf-8?B?aTFsVkZ1djlCVkhETXFxd0hXdTFORzlsVW13ZzBmSmNraCtjVXUra3MwUXV3?=
 =?utf-8?B?VUFUUXlpSmRuUXZIRSsxb3VFSGJaNkZZUWJtVHc0SjVIUjJmdG1nQXlrZG1N?=
 =?utf-8?B?NGNSVk5ISnFuMVZDTFdqNTlGNUNjbU9lSXhoRU9wMHlJQlFCbE02L3lpWXM4?=
 =?utf-8?B?TVF5L3h3TUlUUU13eFVxR3M4SVMzUzM2T01NL1RjbThsV3pBV0N4VEVCenpw?=
 =?utf-8?B?aitpYzVKeitDN0J0OGRFRFdvclBwaXgvREMzNWE4Yit1TFIveDZKd1c5enBm?=
 =?utf-8?B?NThrU3NkZUs0c0hwRFhqYTJZYzRRSit5MkhieWUybTJueEFUOFRtaDdwV1Qz?=
 =?utf-8?B?alRwWDVPRG5mUnk4eVNCdW5TdHRhZWRSTENXMjFXTWhuM2pnZGIrSXZCdXFa?=
 =?utf-8?B?NE5obVVQcFY4bkhON0xHdEpOUGpESkFFLzAwaUlCREpvQmVwbms2Mm9Vd2tw?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bae92f3e-0005-4e3d-69d5-08dbf57219ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 09:11:01.2793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKpugAFu4lwpJEpmbKKFoSuP4HODaCAXK2XfraMyooLrHnLAi7nxN6Cz2+9ssDiJa8K6M0p68iMu6bvJ9b+6+B/Bk+5piRx6T/ZERTpHJ90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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
Cc: Andrzej
 Hajda <andrzej.hajda@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/5/2023 00:52, Nirmoy Das wrote:
> gen8_engine_reset_prepare() can fail when HW fails to set
> RESET_CTL_READY_TO_RESET bit. In some cases this is not fatal
> error as driver will retry.
>
> Convert the log to a trace log for debugging without triggering
> unnecessary concerns in CI or for end-users during non-fatal scenarios.
I strongly disagree with this change. The hardware spec for the 
RESET_CTL and GDRST registers are that they will self clear within a 
matter of microseconds. If something is so badly wrong with the hardware 
that it can't even manage to reset then that is something that very much 
warrants more than a completely silent trace event. It most certainly 
should be flagged as a failure in CI.

Just because the driver will retry does not mean that this is not a 
serious error. And if the first attempt failed, why would a subsequent 
attempt succeed? Escalating to FLR may have more success, but that is 
not something that i915 currently does.

John.


>
> v2: Improve commit message(Tvrtko)
>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5591
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_reset.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index d5ed904f355d..e6fbc6202c80 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -593,10 +593,10 @@ static int gen8_engine_reset_prepare(struct intel_engine_cs *engine)
>   	ret = __intel_wait_for_register_fw(uncore, reg, mask, ack,
>   					   700, 0, NULL);
>   	if (ret)
> -		gt_err(engine->gt,
> -		       "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
> -		       engine->name, request,
> -		       intel_uncore_read_fw(uncore, reg));
> +		GT_TRACE(engine->gt,
> +			 "%s reset request timed out: {request: %08x, RESET_CTL: %08x}\n",
> +			 engine->name, request,
> +			 intel_uncore_read_fw(uncore, reg));
>   
>   	return ret;
>   }

