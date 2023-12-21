Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9E81B1F9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 10:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706610E341;
	Thu, 21 Dec 2023 09:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C652510E056;
 Thu, 21 Dec 2023 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703150398; x=1734686398;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t7yZwmXoGUpML8KQkThGq8l0H2PJ1/h+WUASPwBntDk=;
 b=L1VtlBdkvnVzkkAudTOknExqvrkvsBsrfdbArVThHzTUmOq+G1NotD/E
 hXgExqGdNwtdVEPgbm+lOpndfDxjj3mXsphTC8+am6aOqeNYvM5z8B60P
 1d1WrfJ6GaC8vSpwzOV4DdCIRv9pZ4qgs/oVSYr+xk8pw8bFodp9Xd+Jy
 vTOOziMdV3tzm1aAO93i2WbFICJVf9EbEnRJnpwr4QMRJJfEa4ybbDEFs
 2ejl4JQsE/6PS8qsUiL5H+2GB1NBmRX662qqdo9MQRidGBw3+P3ngvGlI
 t6iOZcvy2XKEmmMAFUgEnL8vvBnQ8KyWbUNbixt1DGxp2jmzkDtMtfU+Y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2781423"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2781423"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 01:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="769891197"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="769891197"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 01:19:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 01:19:51 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 01:19:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 01:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1imWdbag6rJgN2Lbk5r1U8MYo3ncENWXYrYT02UNriJrxJwUBeh1k3ZxCBo6X57vDQHYhwnB/5c+wibqkQxZGDWsjLAHczBLbKYI6KrS80EDBIT4+GPb96tCppmIJlokGVR6dCuYogpT0qyUV1yMOKvvS36nRm7VtsrBKBUC5Nb/0zRuGNJKRuqRPd5+Oq1syzMtR8fjTuedBFRgWdEhjCIoZso78KMNTwBgIUYl2AIo7Eq/YhWCsHYfAGDg5473RPTkBdnWZ6sI2D6ly8fm6W/o52R0Sle1+kn1VtZ6p8oBSLaLwtAt5NIVjLnQgo+icyCHXVG3YTKTqqukCKwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftoygJqU0BKMd5NH8HdGh5GOtJHrNc7FX2qbJSUoCgA=;
 b=Tk+qDZVCPFEoxdp6NbowtAn+yQxseUE4Nm0ZpdRYfJioB1w6DNhjJZdOoTY3U272yWaUuYNTE2gyBiA6uHjKgDI8DLkWB6voDwCLBETxtyjR1PvjhJv6u20+rQfG6mx43kcDHZ6UlMWG6pq1V0P/AuSC0eqjyZOrIZmXZeICglp2T+p45NvRrt6dXBJXxDG8wpypjJF1wa1bGpHj1+a4B9xwIOFJzdLx+o1T9RSWFjB2ZNJJvZwOoa6iMmNCoEyzBpOc16TDUnjIVY2dkxiQikEbIq4Cvnw9l68tELAs6TdjVgCoTMfU8//gqXFBRBWXE8kr2eezGgbZhNBVd6k7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by MN2PR11MB4696.namprd11.prod.outlook.com (2603:10b6:208:26d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 09:19:50 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::c4b8:c08:c263:c2cb%5]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 09:19:50 +0000
Message-ID: <04add51f-8886-4f12-acf3-5cb518dad18a@intel.com>
Date: Thu, 21 Dec 2023 10:19:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm/i915/gt: Create the gt_to_guc() wrapper
To: Andi Shyti <andi.shyti@linux.intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
 <20231206204644.105064-2-andi.shyti@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <20231206204644.105064-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0064.eurprd06.prod.outlook.com
 (2603:10a6:10:120::38) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|MN2PR11MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eab1e22-8763-4a42-2b82-08dc0205fb1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: coNZiUcHW9SvTO7TiyuMAypuqeQadFuWgQM0GbbTGAhLXWvQq6khd51NIT6+6EsJzWNt7ssq/gxB12I4Xd2kx7fEtxWkXG3CKgd9qnCypbxtaPUSx4os/IM5Ce3n5N8ctqgSncnukCQUEXatIR/wF8djvMWs3TNiNaIzM48OdG5Vj7J7yd96zV4E6j6a/qY4ySQo4GNTvwqh9rkZUV8EBN4LLnbLCre4r1Jf1JZlL21lPAIroKJZw4YDcMHyoUH+XUXs8Jhsn16hikCcsjroalAtbNchm+xkyc5Bo9fc+7162aGowrxFD6izjskAHWcW8huZjuTjsy3wrJK7bcXmF86nGWBQoWlJ0d3OBKln+XkteJcv2su4IyaS/PTGgW8534BLDRcYodgC8dgSo4z+DZs0s97FzkLVOCLsATjkJI1afeVV0XsSVSE9yItZxzNrmLd61W3Q/vWQIZLy/hGr4zEZuX9c2gnayRWe8AtwS++B6cNSGki77Lg+7snqOWNiBTA4r9NFmUtt29PH4YFtNZ5x2a/oYnlVnETbCGSMKz1mW0ro3LPlbY3v4xBHtXwk7yCtb3rDPKN8OHhXnBUF7ERbmNVbe3zpgWFM+5ncShIPLLjovzQMvTpl0l4Wd7IAtPUEdxzLVaX/pyXz0XLHzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(6636002)(6486002)(66946007)(66556008)(66476007)(53546011)(6506007)(6512007)(6666004)(478600001)(31696002)(36756003)(31686004)(83380400001)(26005)(2616005)(2906002)(30864003)(5660300002)(316002)(110136005)(54906003)(8936002)(8676002)(4326008)(44832011)(86362001)(38100700002)(82960400001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckRteTVoRFY1QWw4Njl3T1pkNW9IYXc1VE9FSVJZVmZrcDdUWGVGQUFiRXhZ?=
 =?utf-8?B?T3owTGt4ZmVtb29WcXlYOXc1cEVKMUVNa2tmb0tweit5MjQ3QlBkZWgrSkl3?=
 =?utf-8?B?VFVTTi9hajhYMGdLeG02bWRZdHpRU1pyN3g1bWVpQ3BreUZUalpiSjN3Wkx1?=
 =?utf-8?B?ZjFBaXBmSXc3a0hleFE3SmI1QkRpQlJqeitFQzNkUVZIOU9FTzFKOUIwTEdv?=
 =?utf-8?B?MklzZEJNaVZXZjMya2ZlS1VMNitEUnFBYkJucU5GVFZoYkxVZzdZWEMraXpS?=
 =?utf-8?B?OUJkRWVnbzZDOGxDOEVFT2JxL0JpLzVwS1BaMG9KK0hxUzJabGlXMXhqTUhU?=
 =?utf-8?B?aytySjBscnQvOGtiMkk5SGtBMC9Jd3BPL0Z3U2J5aGJNOUlzcXk4bHYxbWFm?=
 =?utf-8?B?cERSbGxoY1pPVm54UXhmVHd3dDBuL3hBcGdBSmo3bzVFeFNuMVlmWXlaZTR5?=
 =?utf-8?B?SkpFVmNIMERHYnZsaytFeDdiVUlUYzZFaHN0UUNzYWkwOUtJSDFteVNSY0pP?=
 =?utf-8?B?RmphRis5QXFMK1NJREc2M1VUYTRDVUFXQ1RGYTVqVURtdmM3b0ZRUW1zOCtS?=
 =?utf-8?B?YVoyeVZwT3dnSU1va3F4RmtXTTcvYjBNNTJuSTlyWmhTOGJ1Qi9FV0ZFM05j?=
 =?utf-8?B?VVl4SXVVWXRvNCtYVXd1OVhWVmoxRHdYdlhyZ3NUcTFvQjExOEZwMDFBVmxU?=
 =?utf-8?B?UURnR1Zna01NM24wcUNWejVNeXJ2eExVbDU3UlRaM2RxdlByZzRUS3NNdU02?=
 =?utf-8?B?WDlxRG5wTjJadUdCTFpKQTRJUUZIYUYyVERaa25Rc1NxUjV5UHdJb3o2VUFX?=
 =?utf-8?B?Smpzd09HcnVJOXV2aEFOWGZMNWNBNFpITFNDWmQxdzZhY045RnBUd1NzMVNV?=
 =?utf-8?B?c3ZvZkIrQkg5dzREOUE1a2NobTMrZmhZMnRtTjNTMlRUVXdPak90RHZ0WW9F?=
 =?utf-8?B?V0JTQzZRVm40M1prZTl2OXF0cDhlUk5KTE5TS0NtN05zMkVWaFJ3enhjV0Jy?=
 =?utf-8?B?Y2dUZ0g5RmpHZFJFMFRIYlJoZ052Vmhmd01TMjhETHVGVzh3QnlVSmVSY3FH?=
 =?utf-8?B?Y01wd0NlZ2gzT3FzT1VQZW0vQlQ5OTlnbzExUlpHN2FHL1MvQ1dUdmZ5WjVZ?=
 =?utf-8?B?VHk1ejh1bWR4OE5ieXRqOEdDWkFtWUtZQnBuMEx1bWxoSTVTQnVjSlJJUWU4?=
 =?utf-8?B?Y0FOSTdjaFNiaHNmRlZxZXh5OHAvNGY5a0FUTys0QXRFZCtNUGhEdFdVTy9E?=
 =?utf-8?B?YzNzTlNuOEVKdVVPZERLbCtXSHRoS3A2eTBuek42NWFmQlhHQS9NejJ3a043?=
 =?utf-8?B?bTQwb2t2Z0U3ampJcEhGMGtDa3l1Mk9rcWFtQlR4MWppL3Z6L1cxRWdLQk5J?=
 =?utf-8?B?SU4yL2JiYXZkOEtFYXphWkhZV2U2TVR3OW4yS3NwTmdocVhzY29TYm5Uc3FD?=
 =?utf-8?B?a1FTbzJnYjk0M3NDWVlVUkxFV0djbVNIL2ExNTlmN1FreC8rOU1wZ0JENmRn?=
 =?utf-8?B?NS9oM0U0bjJBaCtEcHk5Q1BaQU13YWkrYlBCKzk3dnRzcGM1SkEzUG14YnZi?=
 =?utf-8?B?VTJ6YksrenV5R1cxa1ZBZm1DLzk3UlJKSkZnR1BES2xyM0pvM1NmeE5tVVJt?=
 =?utf-8?B?SFNPYTJTc1ZpQ1FqTXgyMmFqNC9vOHpmTGFTY01zTDJkbjNpc1N3MlptbE9i?=
 =?utf-8?B?VXBpS3M0UE1oU255WHNBVXM3N2ZOUm1GenRSaE5yOTRpTDBGdm8wSlpsendJ?=
 =?utf-8?B?OS9UcWdlM3IxVFRFenI0ZUVERUt6OElMcEtXUWZxVzBRbXFHRUhTcWZDekNF?=
 =?utf-8?B?ekRTTGwrbitVaDJFYmVNUWRQQnRaZWMzbTBuSTdRODdtUWhucTRtYnNKeXlB?=
 =?utf-8?B?ZFlYcU5pbVdlcmE3OGRBcmFqS0VxR0JBdlJJbG81M2NOSnBSZ3RUODE2RHZu?=
 =?utf-8?B?SDRzR0tjS1A5aXYwdlFnNnZRMG9yMERmY3FQbVdVZ3lFdnhyQWszYUZKN0dK?=
 =?utf-8?B?Wm9lb29YRTJLUXBuZ1dlSkxDTXZZRHVnRWJ4QVRZUmpTaERiQ0ZpSnUyM1l4?=
 =?utf-8?B?Ri9tcnNHMGoyY0hEYlpPSmN3T0VhVVNpQzdvbFRhZjRJVG5JQmdhV2FOZHNW?=
 =?utf-8?Q?K1JUp7byEQpBcrVIqySSHlT0+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eab1e22-8763-4a42-2b82-08dc0205fb1a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 09:19:49.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53WfHDyX2LyxToTAFIiAOXD6vFV5F2lICLzFGcYrfk3xIAL2e4HtOpl55QEjaIVbszFfi1DGXtBjLSPIVFrGxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4696
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/6/2023 9:46 PM, Andi Shyti wrote:
> We already have guc_to_gt() and getting to guc from the GT it
> requires some mental effort. Add the gt_to_guc().
>
> Given the reference to the "gt", the gt_to_guc() will return the
> pinter to the "guc".
>
> Update all the files under the gt/ directory.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 4 ++--
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 9 +++------
>   drivers/gpu/drm/i915/gt/intel_gt.h            | 5 +++++
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 6 +++---
>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 8 ++++----
>   drivers/gpu/drm/i915/gt/intel_rc6.c           | 4 ++--
>   drivers/gpu/drm/i915/gt/intel_rps.c           | 2 +-
>   drivers/gpu/drm/i915/gt/intel_tlb.c           | 2 +-
>   drivers/gpu/drm/i915/gt/selftest_slpc.c       | 6 +++---
>   10 files changed, 25 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 40687806d22a..bede7f09d4af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -589,7 +589,7 @@ u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, u64 value)
>   	 * NB: The GuC API only supports 32bit values. However, the limit is further
>   	 * reduced due to internal calculations which would otherwise overflow.
>   	 */
> -	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +	if (intel_guc_submission_is_wanted(gt_to_guc(engine->gt)))
>   		value = min_t(u64, value, guc_policy_max_preempt_timeout_ms());
>   
>   	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> @@ -610,7 +610,7 @@ u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs *engine, u64 value)
>   	 * NB: The GuC API only supports 32bit values. However, the limit is further
>   	 * reduced due to internal calculations which would otherwise overflow.
>   	 */
> -	if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
> +	if (intel_guc_submission_is_wanted(gt_to_guc(engine->gt)))
>   		value = min_t(u64, value, guc_policy_max_exec_quantum_ms());
>   
>   	value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 21a7e3191c18..aa1e9249d393 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -230,11 +230,8 @@ static void guc_ggtt_ct_invalidate(struct intel_gt *gt)
>   	struct intel_uncore *uncore = gt->uncore;
>   	intel_wakeref_t wakeref;
>   
> -	with_intel_runtime_pm_if_active(uncore->rpm, wakeref) {
> -		struct intel_guc *guc = &gt->uc.guc;
> -
> -		intel_guc_invalidate_tlb_guc(guc);
> -	}
> +	with_intel_runtime_pm_if_active(uncore->rpm, wakeref)
> +		intel_guc_invalidate_tlb_guc(gt_to_guc(gt));
>   }
>   
>   static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
> @@ -245,7 +242,7 @@ static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
>   	gen8_ggtt_invalidate(ggtt);
>   
>   	list_for_each_entry(gt, &ggtt->gt_list, ggtt_link) {
> -		if (intel_guc_tlb_invalidation_is_available(&gt->uc.guc))
> +		if (intel_guc_tlb_invalidation_is_available(gt_to_guc(gt)))
>   			guc_ggtt_ct_invalidate(gt);
>   		else if (GRAPHICS_VER(i915) >= 12)
>   			intel_uncore_write_fw(gt->uncore,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index b0e453e27ea8..d7c859039828 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -118,6 +118,11 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>   	return container_of(gsc, struct intel_gt, gsc);
>   }
>   
> +static inline struct intel_guc *gt_to_guc(struct intel_gt *gt)
> +{
> +	return &gt->uc.guc;
> +}
> +
>   void intel_gt_common_init_early(struct intel_gt *gt);
>   int intel_root_gt_init_early(struct drm_i915_private *i915);
>   int intel_gt_assign_ggtt(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> index 77fb57223465..ad4c51f18d3a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
> @@ -68,9 +68,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
>   	struct intel_gt *media_gt = gt->i915->media_gt;
>   
>   	if (instance == OTHER_GUC_INSTANCE)
> -		return guc_irq_handler(&gt->uc.guc, iir);
> +		return guc_irq_handler(gt_to_guc(gt), iir);
>   	if (instance == OTHER_MEDIA_GUC_INSTANCE && media_gt)
> -		return guc_irq_handler(&media_gt->uc.guc, iir);
> +		return guc_irq_handler(gt_to_guc(media_gt), iir);
>   
>   	if (instance == OTHER_GTPM_INSTANCE)
>   		return gen11_rps_irq_handler(&gt->rps, iir);
> @@ -442,7 +442,7 @@ void gen8_gt_irq_handler(struct intel_gt *gt, u32 master_ctl)
>   		iir = raw_reg_read(regs, GEN8_GT_IIR(2));
>   		if (likely(iir)) {
>   			gen6_rps_irq_handler(&gt->rps, iir);
> -			guc_irq_handler(&gt->uc.guc, iir >> 16);
> +			guc_irq_handler(gt_to_guc(gt), iir >> 16);
>   			raw_reg_write(regs, GEN8_GT_IIR(2), iir);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 7114c116e928..37e8d50c99ed 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -538,7 +538,7 @@ static bool rps_eval(void *data)
>   {
>   	struct intel_gt *gt = data;
>   
> -	if (intel_guc_slpc_is_used(&gt->uc.guc))
> +	if (intel_guc_slpc_is_used(gt_to_guc(gt)))
>   		return false;
>   	else
>   		return HAS_RPS(gt->i915);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index f0dea54880af..8b7813cac33e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -456,7 +456,7 @@ static ssize_t slpc_ignore_eff_freq_show(struct kobject *kobj,
>   					 char *buff)
>   {
>   	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   
>   	return sysfs_emit(buff, "%u\n", slpc->ignore_eff_freq);
>   }
> @@ -466,7 +466,7 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>   					  const char *buff, size_t count)
>   {
>   	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   	int err;
>   	u32 val;
>   
> @@ -587,7 +587,7 @@ static ssize_t media_freq_factor_show(struct kobject *kobj,
>   				      char *buff)
>   {
>   	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   	intel_wakeref_t wakeref;
>   	u32 mode;
>   
> @@ -618,7 +618,7 @@ static ssize_t media_freq_factor_store(struct kobject *kobj,
>   				       const char *buff, size_t count)
>   {
>   	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   	u32 factor, mode;
>   	int err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 7090e4be29cb..ee14d376ca7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -109,7 +109,7 @@ static void gen11_rc6_enable(struct intel_rc6 *rc6)
>   	 * thus allowing GuC to control RC6 entry/exit fully instead.
>   	 * We will not set the HW ENABLE and EI bits
>   	 */
> -	if (!intel_guc_rc_enable(&gt->uc.guc))
> +	if (!intel_guc_rc_enable(gt_to_guc(gt)))
>   		rc6->ctl_enable = GEN6_RC_CTL_RC6_ENABLE;
>   	else
>   		rc6->ctl_enable =
> @@ -569,7 +569,7 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>   	struct intel_gt *gt = rc6_to_gt(rc6);
>   
>   	/* Take control of RC6 back from GuC */
> -	intel_guc_rc_disable(&gt->uc.guc);
> +	intel_guc_rc_disable(gt_to_guc(gt));
>   
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>   	if (GRAPHICS_VER(i915) >= 9)
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index 4feef874e6d6..9c6812257ac2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -52,7 +52,7 @@ static struct intel_guc_slpc *rps_to_slpc(struct intel_rps *rps)
>   {
>   	struct intel_gt *gt = rps_to_gt(rps);
>   
> -	return &gt->uc.guc.slpc;
> +	return &gt_to_guc(gt)->slpc;
>   }
>   
>   static bool rps_uses_slpc(struct intel_rps *rps)
> diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
> index 4bb13d1890e3..756e9ebbc725 100644
> --- a/drivers/gpu/drm/i915/gt/intel_tlb.c
> +++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
> @@ -132,7 +132,7 @@ void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
>   		return;
>   
>   	with_intel_gt_pm_if_awake(gt, wakeref) {
> -		struct intel_guc *guc = &gt->uc.guc;
> +		struct intel_guc *guc = gt_to_guc(gt);
>   
>   		mutex_lock(&gt->tlb.invalidate_lock);
>   		if (tlb_seqno_passed(gt, seqno))
> diff --git a/drivers/gpu/drm/i915/gt/selftest_slpc.c b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> index 302d0540295d..4ecc4ae74a54 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_slpc.c
> @@ -53,7 +53,7 @@ static int slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 freq)
>   static int slpc_set_freq(struct intel_gt *gt, u32 freq)
>   {
>   	int err;
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   
>   	err = slpc_set_max_freq(slpc, freq);
>   	if (err) {
> @@ -182,7 +182,7 @@ static int vary_min_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>   
>   static int slpc_power(struct intel_gt *gt, struct intel_engine_cs *engine)
>   {
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   	struct {
>   		u64 power;
>   		int freq;
> @@ -262,7 +262,7 @@ static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps,
>   
>   static int run_test(struct intel_gt *gt, int test_type)
>   {
> -	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	struct intel_guc_slpc *slpc = &gt_to_guc(gt)->slpc;
>   	struct intel_rps *rps = &gt->rps;
>   	struct intel_engine_cs *engine;
>   	enum intel_engine_id id;
