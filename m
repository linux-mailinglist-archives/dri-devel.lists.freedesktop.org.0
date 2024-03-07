Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06CF875826
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EFD10ED39;
	Thu,  7 Mar 2024 20:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEB927+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B146610F71C;
 Thu,  7 Mar 2024 20:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709842732; x=1741378732;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aOAp7Z8jhylGr3dhSjP0Hj80gP9C0dQqq21asdev8GQ=;
 b=bEB927+vGrhIJH9x2g692Ba1VdqZDp5o0XWFfzgY6kEd8GdCPyeZPWnC
 Xe7Y61SPGOwF1tRf/Reid1SI6aFrZxGRxmhetGbTlNlvkye8UWDRtJxeW
 M7YlFG2K3uVWZW1tbsLxD8s0JvUClZIzQX6i4raO3t94/OUa53qIb51VV
 vva0HE9xrrSf3gY6T8pcdpbgwF+CIjGlJLADU5ym7hRkVvFwfky2zXEwa
 wCH9iCNyEFVv6HQUcKiV5HwHiF+6eGIj9rWTSb+2/QWXd4iUMNPRD49K6
 xKNzflsNeAPXIcPPZuoclL9an8XgeP+btv1+eFD0lebSaXBcmOLdKYecW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4710948"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4710948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:18:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="14796441"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 12:18:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 12:18:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 12:18:50 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 12:18:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGo72lnZv8nwhUc/0Hp2V/8ErCYfBcLpUgFABYUyvpFbEVt+OihYGo/16ZhKhnsgW5hC6v0tR4fndW3/RnV8g3gSYeKvrVnrYSU/9vm1CQkTgUW55B0khYzvDLgDHFkkc06zG5a3FazVjahZduQgPE/VdWEt5kuk6D0cWsfTrX1O/XsPiCAOj6nhfqiO06JqAvdF1gzTNUf3cWZOU8p88XyFaSllhOtqXzV56tcz1N7c6avaAzXvHwy9lM5O75UMAJPreiaWxmag6wwpHJotLcSFNeu/SuFu3ShPX2njh0OEjgB/3qtOUACTs6h8wzyFrdV70Agmd0CwoseBDf/HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahHUqmiqcq1OWPiuwr7AFMQlRhUeVoTr65iscxDpceo=;
 b=JGjxGyxDWsCuOKm+WKzpCBBT7dXO0p1g8HNN2DfJAmUjdvJ+BbtedXGEDJvxvsgLbCxTXO9mGcJnnBIF7ccrpC+2dNtlRtgXw5GbOvsYnCbMB0iLvGggOShH4PTE3VhZhKBSHMk73AMGvEDy21PYwCc379ovdiT8rKP7Q2dOXwpbCxI1St9vTEvJBCa7MLddKv6TSClQ2ZF7gYpWZUCfP+tuD88TzmacLGFIFjdsG5qsNcUdQbZb6OIUuahuHIs4DPjxURB0ehZlSg8JDgTIV5b/6MlPBQej+doSuD39SKo2krg6JjHiedpOAgiRhQCHfMI7/mA18WI87sqgZShnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 20:18:48 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 20:18:48 +0000
Message-ID: <11146c2d-726a-4b13-98a6-2360dbe77c3b@intel.com>
Date: Thu, 7 Mar 2024 12:18:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/i915/gt: Disable HW load balancing for CCS
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <stable@vger.kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240306012247.246003-1-andi.shyti@linux.intel.com>
 <20240306012247.246003-2-andi.shyti@linux.intel.com>
 <20240306234609.GF718896@mdroper-desk1.amr.corp.intel.com>
 <ZeodSUrgZXL_pjy0@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZeodSUrgZXL_pjy0@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 25441e2e-1361-4cab-6207-08dc3ee3cc13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EV5aQQHnpoBYTNGJgSfhYWSgT5XIWJN7YYIUYGCbE+XN/IvMeCJNrg0cyPxATfBr4sDEGHocIlJAjx4z81uvk5vi39AHk6QlOO5ypFkM0OVtrzhYSnBIzAHZU9dpA94IsklqGVNQvzky1sjGJkPBkfsFIbCMfU7TL/KDoz9LvqN+PQrS2GqFvUeshRwvrk1T5Ts+iwqPZCrxdJBqhVYNH5HoFQ3+CF9L0ddXlKpJRwayCItJ6Z//uf1V5vL7fDjQPDcL8lKs1eDgIe1qUGgI1yL2Y6nBcPAvMVy+/2qNwcXVAUVBWH9Xnsv5fuCWOwM7ikkJ2zrF6laPgNUsO4y24kBaGILPSYwTR4P7BXbtWwJC2xgahu35zdJ7qW1QE/8ycTjp15wJViKkMrLMx3jZfdeNuxQjKrl0Sgl4XfmS6W2uLOqcgZlVHftti+Ba+obeFTf9Y3XTL6IbD+UpASClxe52BDmGwTmF+YF1eeTM7s/GAFScIWSvxpzGy+DLSdGIZ94ACBJ6v0IGk8Airtew2qfSFPS5kRCaxKY6FjabtBNMeyaExciZKKf2wJ9ijJC61ZMQbKLcTAIT4Q9mChxEBG0mlBScFGPUAbEl/yKHUMtZIkYdybzlUNu+R/jGQymCSm1iGYWgNCPz48VUnijU01/M2u3qx+NHsrqlJoPk85s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?allpdVluK0Y1UUt6SXQ0OVFaZW9mWXVxUWliQS92NEdoVHFzNjlXSWZWWUZY?=
 =?utf-8?B?TzNYOXhLT1NnSCtLc2dXRnRIN1VZOUp2SldqZGtHODZVZmxCQUI5R1ZWL2kw?=
 =?utf-8?B?QmRGdWh2eHpXS1Z6YmZxZ0I4akZ0OXA0ZE54ZFJKSGIzMU9jTnR6RG96bEd6?=
 =?utf-8?B?eEY5WlQ1ODFDMUc1TFpaSHI2aEtOSWFTRTVUaCtaelNkQmJjblg0VGdWYStw?=
 =?utf-8?B?RzhkTEVVTXlQQ0NhWllSQWNzMHgyOHV5QmI5RW9uYXovbi9keVo3cXBpb2ZJ?=
 =?utf-8?B?bC9tNFFDUFUvTHAxNnd1cUxyVlowclUxWnlCdUYrSThhNldsNDd2ZHEzbzhD?=
 =?utf-8?B?M3lIcEpYMlBHOE0ycFVrZFpQRTIrRlZtbm52R2IxRzRhSnk0OGJZUjVMc0Rw?=
 =?utf-8?B?N3ZCNkZEK3lHZFo1bFpqSUV1TnRTRXd5Um5XY2FHcDRGTm1XRGhBL3RNb1Fl?=
 =?utf-8?B?NmhwMFBlaFRpSk9mMTVqOVluT09uVUVkN2JZejQwRThnTDhiaGIwWjVpYmdZ?=
 =?utf-8?B?d1ZpM3IvVTRNNDRPb08yOXhrM3ZlYUMwOFJtdUlRRDEyTVlTSTMyV3B3N29s?=
 =?utf-8?B?Q1c2OWhOTWN0bHh5UjBsMDAvemwzemlJQU03QmtscUpvVXd1Y0R4enMvUlVh?=
 =?utf-8?B?b1VyMjZKSkNPQ2hMY2RtMndpYjQ1c280QVVxRENTVk51cVo1SlVVTGJkdERt?=
 =?utf-8?B?dFN6OXVCSFQ2YlZwbzF4M2hrUkhzdjArS2RhTnF3ZDg1N3d5WWZ3QmhDa1Q4?=
 =?utf-8?B?a2hnVFIyajFNRVpHNGNla0ZaNGNnTzJxQ3hCRjBnamlTd3lWRUxNZTdIeTlV?=
 =?utf-8?B?V0pJNHNzSjF5YXI5dXBQQ3RWdE5jV3JEd0RzSGI2bkxTSDZ2UFd5TFh0Y2Jv?=
 =?utf-8?B?MzE1THozUTE2REZYbVA4c01rUStJY1RHTlg4dXRsQ3phR3drSnQ4ME9zbFk0?=
 =?utf-8?B?NkFzQVVRa216RldhY0NWbHRKYVFxdEtyTXlSeVljK2FxbDAwZE11cS8yVHVT?=
 =?utf-8?B?aEkyQ2VXRU9DVkxZc2wyN0ZPd3RNYzl2Um0xQU5jUUVrQ1VSd2tNYXdPTlFY?=
 =?utf-8?B?N3NuVUp0dm5MS1ZCdHBxdFF0UTUrU2Z3aHFZV1FWYTFZYXZubTV0dVlJN1Rv?=
 =?utf-8?B?RFNWdXl3ZUVabFpjT1VyL0ZNNWNrTmFUZ1VKODFodXFoVmFZRUdBVmpMTi8w?=
 =?utf-8?B?aDlsWk1JNDhpekNBVFRCcVJQaDh6aXI1RGtDWlA1NTF5L3NtUFJHYWJlcFR3?=
 =?utf-8?B?SkRsZnNIRHFCSEpMRjZodkx3bVVZa2YrRGoxbkdERmFJV04xNUFMTkF0ZDUy?=
 =?utf-8?B?WHVHZHE4aHpHeElZYlU4NFcxQ2l1ZDZGRFRLejlqa2JFc1FPV25CTzhKOEpY?=
 =?utf-8?B?aU5IVHJNZm56L2xuZDBJUnAxL0RHeFI4eUVNMW1EVkRGS1ZraWNNQXN4Y0tK?=
 =?utf-8?B?YU1jeWtMM0lNNDRMYVdBMjl3QlFiUXB6MUVML3ZVdlE4Z3pqdXh6YWN6ZENC?=
 =?utf-8?B?Zm5MNi9qVzB1NjdzeDdvSXBDVzZBMjRXSitpNEpQOC9LSXJnNzY1eHl6NHZ0?=
 =?utf-8?B?VVZYREwvM1AwTTA1T29EZm5GeVcrTnZhcFJ4WExmc3BlaEp5a1NOT2JZVVQ4?=
 =?utf-8?B?WlpFWmtJRDczTWxJWXZsODE5bWRDYk5ocytpQkdXbUFrdGViVHlJdnpFaHND?=
 =?utf-8?B?d1c2aVI3U0VESkRPQjhKNTQyc0ZnaTR0NHR6a1ZSUkM1R2dkdHZoNEpLR0g0?=
 =?utf-8?B?MDB2ZXUzTkN5dWMvUEswVFBHL2lINTdOcWVicW9Wdk9hWTlnTGozY3dXZlRL?=
 =?utf-8?B?d0lFaXcrbjg0T2o3TlJKaXhqN0s2aEwzUVlHTlJ1UTZXU3dJRDIydExPMzdn?=
 =?utf-8?B?cHl2MFhlWnMraGt1QmdsVHRnVDIyNmVnZlJadjc1T2hmMXJCZWYxeHIraVNI?=
 =?utf-8?B?VEQ1OUlHLzZXM3V0RFJPQ0I4QS9wTC9IM1lmR25CWVpUUG5wVzJwQTkxV1J4?=
 =?utf-8?B?blY4Vi9RRmhyWFAyKzcwaVlVVy9PdTF0dElvUXlSMWo2cTF2dWhTa2hXTjcv?=
 =?utf-8?B?NE5pcXV6a21wQ1Q4TXhTdGpJcERSeGhpcWRtSFpmUGpMMDd5UlE3YTJVZEc5?=
 =?utf-8?B?dWtWYmtOOEpiMWFZSkY1aE9KUjVSYm1lMFFtSjlmdU9kWGNlR0lya0ZYRFpl?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25441e2e-1361-4cab-6207-08dc3ee3cc13
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 20:18:48.3615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOfvOko2dG6ftjDN8nuCVjZMyqtVSiAZEAME5JNePUDvP16dtIecTwsIcpBHW8kamysgt026jIP4AmHmc4XVHlljaehyHhxG17gOolwb+oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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

On 3/7/2024 12:02, Andi Shyti wrote:
> Hi Matt,
>
> On Wed, Mar 06, 2024 at 03:46:09PM -0800, Matt Roper wrote:
>> On Wed, Mar 06, 2024 at 02:22:45AM +0100, Andi Shyti wrote:
>>> The hardware should not dynamically balance the load between CCS
>>> engines. Wa_14019159160 recommends disabling it across all
>>> platforms.
>>>
>>> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.2+
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
>>>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> index 50962cfd1353..cf709f6c05ae 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>>> @@ -1478,6 +1478,7 @@
>>>   
>>>   #define GEN12_RCU_MODE				_MMIO(0x14800)
>>>   #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
>>> +#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
>>>   
>>>   #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>>>   #define   CHV_FGT_DISABLE_SS0			(1 << 10)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>> index d67d44611c28..a2e78cf0b5f5 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
>>> @@ -2945,6 +2945,11 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>>>   
>>>   		/* Wa_18028616096 */
>>>   		wa_mcr_write_or(wal, LSC_CHICKEN_BIT_0_UDW, UGM_FRAGMENT_THRESHOLD_TO_3);
>>> +
>>> +		/*
>>> +		 * Wa_14019159160: disable the automatic CCS load balancing
>> I'm still a bit concerned that this doesn't really match what this
>> specific workaround is asking us to do.  There seems to be an agreement
>> on various internal email threads that we need to disable load
>> balancing, but there's no single specific workaround that officially
>> documents that decision.
>>
>> This specific workaround asks us to do a bunch of different things, and
>> the third item it asks for is to disable load balancing in very specific
>> cases (i.e., while the RCS is active at the same time as one or more CCS
>> engines).  Taking this workaround in isolation, it would be valid to
>> keep load balancing active if you were just using the CCS engines and
>> leaving the RCS idle, or if balancing was turned on/off by the GuC
>> scheduler according to engine use at the moment, as the documented
>> workaround seems to assume will be the case.
>>
>> So in general I think we do need to disable load balancing based on
>> other offline discussion, but blaming that entire change on
>> Wa_14019159160 seems a bit questionable since it's not really what this
>> specific workaround is asking us to do and someone may come back and try
>> to "correct" the implementation of this workaround in the future without
>> realizing there are other factors too.  It would be great if we could
>> get hardware teams to properly document this expectation somewhere
>> (either in a separate dedicated workaround, or in the MMIO tuning guide)
>> so that we'll have a more direct and authoritative source for such a
>> large behavioral change.
> On one had I think you are right, on the other hand I think this
> workaround has not properly developed in what we have been
> describing later.
I think it is not so much that the w/a is 'not properly developed'. It's 
more that this w/a plus others when taken in combination plus knowledge 
of future directions has led to an architectural decision that is beyond 
the scope of the w/a.

As such, I think Matt is definitely correct. Tagging a code change with 
a w/a number when that change does something very different to what is 
described in the w/a is wrong and a maintenance issue waiting to happen.

At the very least, you should just put in a comment explaining the 
situation. E.g.:

  /*
  * Wa_14019159160: This w/a plus others cause significant issues with the use of
  * load balancing. Hence an architectural level decision was taking to simply
  * disable automatic CCS load balancing completely.
  */

Ideally yes, we would get an officially trackable software only 
workaround number or something created and just use that. But in the 
meantime, just clearly explaining the situation seems reasonable to me.

John.


>
> Perhaps, one solution would be to create a new generic workaround
> for all platforms with more than one CCS and put everyone at
> peace. But I don't know the process.
>
> Are you able to help here? Or Joonas?
>
> Thanks, Matt!
> Andi

