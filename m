Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51E85C533
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF44E10E551;
	Tue, 20 Feb 2024 19:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEkYd7UI";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027DE10E54C;
 Tue, 20 Feb 2024 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708458731; x=1739994731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4QF8SnJ5MG6BFPtnHSKNNo98SptQaeZpK0JGdVLGlR4=;
 b=YEkYd7UId+1d+/yW0cz1kLq+Q/Ztwi2mNv522/u7BYykRG270AhVEOCa
 Snk0d8Sx/jrg1TZxTZiQ072BFA59haxujyvg/nc+qhL/SzNanXYx9Fu+Q
 U7evHtLaYfhNhdmBKzw6euVK1Ht8IXyy39QiG+vTG5BPfiDkp53AHEgJb
 Mn5j60gbRcnx/e9WNdBlAu+Pk9UHKqqOXrttf5PcUX3rGI/g1pmuFlor3
 1kCMjLYESo+0tgBU28S9t/xhJfBQbeLalNHl2AwkBiJjN6kgLN/OrrLxS
 xxx4hYEU+LcXuY8vTfBcliC7znsCHi6VxFatujP+yEEPgHOX583KormVI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2446109"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2446109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 11:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4839938"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 11:52:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:52:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:52:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 11:52:09 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 11:52:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyZMWL1M1CIn2YEs9C+Gk/ZIPv8fekeV0mS0QtmlY0mJn9zLkR7iDITdW6IeGFrQL4jDPGU99/1mIHZOQlMguh69o3j9p3kaA4RtclwpUskcZrXRhq3DpWkkBzBd0cotZNA7yDpoDJUwi3ZBstMlyPWnVqLjhcAsOXAX4hv9TIZ3i+4dLptdKHIGp/JFcrDNuyoIUIafFhpzugweiACYHh62B6AmzCGRbhuVpusgm/zoBsohRcizTI/LzUbJmq6R8cXhWqzq0WZUQtX3gF+zd8iJHQrxQhdKRgMTZaKws5BAzxvX5pLRlh8xTpbWj9HxTM1mfOfC1kb+zkrVkPSjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZheQZ7i3+KUX7XN2EuiyQQTttwY/yXuk4wk8+isaqRk=;
 b=KDsYCxvY5b3jNgjH/nPrOW9QlnFpwwe3UQ0ZiO/CGWzno35vS/MmDylZiZPf60seLD8iYtzpcp9VPgX54XBT3oqghNcsvW5SAbvdK0M5DuMDVE1zxi1J/5vyxKSFfME7VuGv8TPs67s7NNvWUZVDQef8YtAMlc3iqtX9EtGy84lFUZY4rH3/qJUDPdV/1Cq/FYr5vJrThCV50NZowyyq0Sdj78x8c4DngAevcYK+6DUcEQ5952jjC9RVJdYO8LRLfu42wMFiPSV2Vq21Y4ERArcKtvlCW9qxOr6o9EfX58ktgS/rzSt/e6r2dXxgMoA/jSltCuqv2jUPABI0LoyinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 19:52:06 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 19:52:06 +0000
Message-ID: <2ed3c7f6-579c-4ef0-b15a-63350645ba35@intel.com>
Date: Tue, 20 Feb 2024 11:52:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/i915/guc: Simplify/extend platform check for
 Wa_14018913170
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
References: <20240216183841.497768-1-John.C.Harrison@Intel.com>
 <ZdO52xFiDGrfJ_cd@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZdO52xFiDGrfJ_cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::20) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: 174a7b37-3d98-4fa5-5c13-08dc324d6ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wf5RZ+ZopwXwbR8sN3jdY/4spLp8LLwtOcDb3LY7FDtc8B4k7n1+s6phSivEAxjnJUuYiTP4MZiJ9rSEcC71gVN6AMxk5P9PoPtgMlPRaOX+m5K19vrma+r+B4s8Qr32J8s68+3CzIeG5Eaxx3vo3SHaWdud+y5s3ucP3UcKzF1Xw8Ci3AXTBazm63hncpe6NQGJnESOv+lUvYo2nIYRYD5gPRFVUScyk4QPic/rg4yhYZWamaJW9vjm7DougHJrTtPxf8NBgnzwSQ0mufDB3Komi8wO2yivj99Uy0l9P+gDXived9L19/9V6EuVWl0EoNK04j3qxvMickmOQvXe1Ni5NurcmB7B/31wOpaYh4ziFxUNSxI+C43BfMDkZN4OUtbImsKbA8MLuP5yecjXOgwNn3zWOYjRafd3zJOff7+39XwLNQkQ4qPkxt19CSdNl9YzFZj7dZRrglXXrc2oqrDqtOHCX6qTfWqKmO5v649do4T253txigmo3rCCgMpuAhAIGDftMVc6XJl2MmyGBXvEJyG+9vNwGr6yxnIBtRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG1uNTcxSWUzK2NYbnFrMllWcDJJcFc5K0hzRitYZUJkM3YzMXpCR2ZQb0ti?=
 =?utf-8?B?aS9IYVBlR3FQdldDZTN4R3F2Z25ENTk5K1grMjRGQlkrUUVPdWRRVjk5aVla?=
 =?utf-8?B?OGtqNUIvUFRXOUVYQjhoMnNuVllHM3NmQlJudGpoWndaNEdkWXlRN2JUTlZm?=
 =?utf-8?B?QnpUT3dPSUUvSGIvalJnREpqa0xjcEFxQ01ZVEtDYko4TEZBV3lEY1FOUXl6?=
 =?utf-8?B?ZUNTUEV6STl6MGVKajhnZXJjaXdRVjlnelBmODBpNW5Yd0FjUkdKQ0hnbEtR?=
 =?utf-8?B?VDU5U0RjdEFlamdXN3pzVGtnbjMyeTdDL2djNUtidWRuYUJNejZZQml3S2NJ?=
 =?utf-8?B?S1RKWUdRMFplTEkrWXNqYjgyL1BnTmRPQitKbkZ0YW5mNjVnVHBTTGlJQTgv?=
 =?utf-8?B?UnJrQ0tpaVowb3dHN3cwSWFKVkNWWHRxeW16dWs5blpsWjJMNUJnc3ZUa20y?=
 =?utf-8?B?OVJ2ejZWb3UyK1NseVdqWjJSSkVXZ3A5U3ViS3kzRU84TVVWRGJURzJOWW04?=
 =?utf-8?B?UDZ1c0tpMk84dFlQMEtoTkIrenAveFhNQmRJVjd1NHRMNGtUVGgyTHV1THJq?=
 =?utf-8?B?OUpwUGxQTHUvV0VtOEZtMTlMblVMc0ppa25EQS8xdFMxcjVHQmQyYXVSRFg1?=
 =?utf-8?B?eVNtNCtCZUJhcVlhaU9mMzZKNndoVEdSOWExMVZya3JmU2psc1NOWTROSWZj?=
 =?utf-8?B?Z2t3cEtUN1FFakJuUTIreEZaLzc0N29vTzFXV29NdExXWVNlMmZHM2RZM3V1?=
 =?utf-8?B?NlQ5ZGZyQW9YZ2JaZ0VJYjZ5djM3dW12Tm5BQndmWHVyRHBtMTY3Yk5tWGdw?=
 =?utf-8?B?ckhaK0VodS8zYy92T0RtbGlWOHVmRkxMZkNxZk9abTBLVTRUcE1TSlh4YkJi?=
 =?utf-8?B?VjR0dUZLMUNoVm5mcWhvZ2tpdVJPNWQ1Y0pna3BGN1h3aFZuQWRyU2VnVnJp?=
 =?utf-8?B?cDdWOHV6dEN3MG9kVVVWblZtZkh4QzQxOTUyQU0zeWhIYmtYT2plaUlxU1BF?=
 =?utf-8?B?WDZXWkgzRE93SlRPRENnaTJob3NBVWNJREZwRmE5TnlLMkpxRWZrZDV2U2My?=
 =?utf-8?B?cW16R3pJUzFOL2h2eFl0dWxIdEh0UFp5Y2lDeUxjSUJ3NWl4Ym5rc3JYL0dD?=
 =?utf-8?B?K0N4NEFNcUhJaWVnUmZtOThzN3JUVzVVQjBiSG9jekFNYUFBYWdEUTdrbFlR?=
 =?utf-8?B?TklqRVZLM2UzU2ZENVNMNFh6OVpLWlkvQWZ0UEszOTRZZ3k4Tkd2T0F5UUxr?=
 =?utf-8?B?eWo4ZVBsWm9GS1k2QmhJUFpCbWpKRUxaNGxoR0hWYWJ0MkxCREdtcjRmZkxQ?=
 =?utf-8?B?TE95SG9DZWVXd0RiMjhORnpmM2FuemNzeWZOcFJOOTJYc3lQSVEwUW52Wkg5?=
 =?utf-8?B?d3l0KzloNVNyQ2hhaWtjQk9JY2dzNXh1ZEYvRzVFMFJLSm0vOTJVdXpoOXBD?=
 =?utf-8?B?MHMyMXRXYkFEbmw0cmxVVExCbmZxL2FrMGtqdXh5MWlhT1FGdklsM0RoVTRu?=
 =?utf-8?B?ZHczczc1MW1zc0hqWUxQYThSYmJSTDlVTnVqeEticFRQZlI0NHhLL0dxbHlV?=
 =?utf-8?B?RW1WTTR0SjRYSTFaSnFzWHV6L2RVUGhpTjRGSVJEN25GS284OEdBNlJBdkpl?=
 =?utf-8?B?VG9LTm9raEtyc0xpYStMOTZJQThES2xGUjNzcmw1amNZRFozMEgwWWUvOExY?=
 =?utf-8?B?VmsyNzE1T3FKUmJIUU9qcC9PUjU4NXdtRGVzWGo3dWF4RnQwQTI4SytXMUpK?=
 =?utf-8?B?SXdKbVRZQTFJenpuaGlUcmNRODFUdVFoUTRmcWJjNHRYVGlsY0R3azlhUnNR?=
 =?utf-8?B?R2tRSDFTcmNtZkM2NURla0lWelFGVnh0WU9BSGpRdTdMQ2hVVDlrbHRId1J0?=
 =?utf-8?B?T1JxYkwrVkhnYzNXeUdhQXd6bmphK3Y5UVhnSFNodnFwLzJ4RCtTNXpCVUdt?=
 =?utf-8?B?TmQvZklqKzJGb3A0dWpmWEpyWXZPM1RkZ2o5bUtXZk0xYUNIQlc4b2R1MEJI?=
 =?utf-8?B?cGpTU0Zta2d0Mk9HcWFnVzNaOE1YYVNyYXZyWFFUS2tsd1BPUXlMR3RuM3JD?=
 =?utf-8?B?a0xPTk56T2xuT3BQaWl2NmNZNWVWMUYrUHRDV1Q2SVZIVkxNSSs5c3o5amFM?=
 =?utf-8?B?bzFidnJIazB3NkZTYU9YN29zUmRFc1pMcGhjZytIRXNLOTVpVjZZcEM2RkhL?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 174a7b37-3d98-4fa5-5c13-08dc324d6ac1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 19:52:06.6401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeOy02AWf5E2LupfGsV6OgDwan0SJ6iwQL4hl0DVIv/YSUzWkePSKtIIbQ8ZyiJKw6+wwjoATMA9zcIURx0uVKXn2SJq59rNHLFTrK2EeNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

On 2/19/2024 12:28, Rodrigo Vivi wrote:
> On Fri, Feb 16, 2024 at 10:38:41AM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The above w/a is required for every platform that the i915 driver
>> supports. It is fixed on the latest platforms but they are only
>> supported by Xe instead of i915. So just remove the platform check
>> completely and keep the code simple.
> Well, I was going to say that I would prefer a GMD version greater-than
> check to be future proof. However if this code gets used in some other
> new platform a new specific guc support would likely need to be added
> as well right?
There is no future for i915. That's the point. The only platforms that 
have the hardware fix are all ones that will only ever be supported by 
the Xe driver. So if such a platform were to be backported to i915 then 
there would be a lot more work than just adding a new GuC firmware platform.

And going backwards, the bug affects all platforms that have a GuC. So 
if any GuC code is being executed at all, then this w/a is applicable.

>
> Perhaps at least adding a comment in the code?
Such as this?
         /*
          * Wa_14018913170: Applicable to all platforms supported by i915 so
          * don't bother testing for all X/Y/Z platforms explicitly.
          */

John.


>
> with that
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 2b450c43bbd7f..a3662edb42032 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -321,8 +321,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>>   
>>   	/* Wa_14018913170 */
>>   	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
>> -		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
>> -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>> +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>   	}
>>   
>>   	return flags;
>> -- 
>> 2.43.0
>>

