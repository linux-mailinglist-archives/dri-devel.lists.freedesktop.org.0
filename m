Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235A7DA234
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 23:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3810EA4D;
	Fri, 27 Oct 2023 21:12:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9FE10EA4A;
 Fri, 27 Oct 2023 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698441151; x=1729977151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h3wcVwpqnHrPOeiJTNP/rZmnJ1T4dpNe8uOV+y/7OA0=;
 b=AjeAf2KJqomm62Z8xyusZAU8TPxOOLmzk2MNu+MWL1pkaMmTv132eRVu
 UsBeYl6Kw0FiQnjsc/yn/kKeLn4iLTt8b1rkT7Z8PxbsWJMz3hAyKGL8+
 raVfhASZOAEC4rsxeOTvsDiGmJQSm2+1pz2mbfvQe+mi3oVNVT0eTa9sq
 anKFhpWPU7WWh7wEm6RZiRrJjWb1t/UlKWmImeX95HQgMPYbavz/RLdC0
 kqTT0nuBj9vO0zyGjXSkuUUGVp4eEj56vQl98XHBcEFuV8jo6yIW+oLnM
 mslS68gIFw4cQenxJmfBY7oVjzlDOkx0LyKHfCpgfXr9HWDmdLdkES+pp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="368065956"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="368065956"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 14:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="753237291"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="753237291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Oct 2023 14:12:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 14:12:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 14:12:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 14:12:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqCOefLzuc7mneXngvJ9qXtzXz7ZsPFXj/Q8ZMw8CvQJdDtkhghTQc2u9/gcjA1Upc0x8bLS0YubPNnSHute1TT6TI84Owk5OFY79awYRWnjLgnOIoI7MMF4DpiTrYO8LxL/4A3YfqxOzByTHBboHdsM8jk8orSPQ+DBK/E+va0wFSUzALk4AAYV4DMXjeIWeDLK1PrL5dqef/irtxSlm+Ey6WdC+3dEvHB3wSad852uKN4H2qnZMxnawrDqhZ/bSSC+2WfW6KGTKs+nzA31Tknisu3AhEc57udyYoi8qqQZtSpX1PSrxxlkshHL6TfvXIqf7nWng1z3MRWoAoxoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMSIk0d6Ya9gGZol7tuEEqYfYi+hn8vcyfdYZYG83oE=;
 b=KquOLoy4uY0vzXXfu0JKn7ZiNIoWe8ovFod+KzVriux9gYJGJCh2mJUz0ghcbmf1YG4IJlwrTlTS8VD+x2+AzRL+iHtYlvw2BIo7R5DfJoWaCT8BDOvA1v+c5RiogaKSTmZQCPPuMxzH9C5oRfiB5PnJMDqfDsf6yfYNKQcpgWpCJDhlq6en8UWYj3jLCysSxtel2xKG6WaDsRqcjkTnHBy275CrctTDpBZwJS56i5ikgt6GZKI+ZdB2SKcXBa3NaFb8QFIgROPQnu6zIBgAuvW3SgYHYpT82C70GaRpbifZM6PoimucKQIDioO0U59npzKkayUMTtwre2dUIMpvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CYYPR11MB8330.namprd11.prod.outlook.com (2603:10b6:930:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29; Fri, 27 Oct
 2023 21:12:27 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::28f3:390e:28da:a67f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::28f3:390e:28da:a67f%4]) with mapi id 15.20.6933.022; Fri, 27 Oct 2023
 21:12:27 +0000
Message-ID: <947e7b1b-131d-407a-92d8-14ca32cbde85@intel.com>
Date: Fri, 27 Oct 2023 14:12:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915/guc: Add support for w/a KLVs
Content-Language: en-GB
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230915215537.220331-1-John.C.Harrison@Intel.com>
 <20230915215537.220331-4-John.C.Harrison@Intel.com>
 <629195b0-c056-1826-2548-39a983637e3b@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <629195b0-c056-1826-2548-39a983637e3b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0382.namprd04.prod.outlook.com
 (2603:10b6:303:81::27) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CYYPR11MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 317dfeb2-f6f5-48dc-89a5-08dbd7316c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/dLzhchvDyfgCZKPtNkthjspPgSigCodw+dQXwV6AqawTFJysU2A/7oOHAf44v4Yvfvt5ymgvMGNi3isVFB5iGJIu7ynEgeIX2zohk5iHmv24jWVsdKMP2STDEpPfLKYvfqEXKnQAdjHZOT3C3fjHPDpZU7T38q4OXIl8VjEORvzvT6fr5gaqkAWMbybdyLzJLiB+51sd94bsJE0ySOc3lnsst91Odyfnrn0ktqMDgZHCFRZCfWB2+59qBNjHosfHwJNZKIdDhWw7WOC/o9uqSc/Dgbdrp32/IP4banzy535bpPJOQcb9fAHb17joAQQTnP+06QpP5xnxuu3S2j/ZwJAaf2ZhQYKrqlipOPE0qfD4GyfYfB167r2O5NjH7WJW1QJJiq8wiOZRgrBC7JOsfqeDWzrvbLgOnAC+rh5nbh/1EfqbQni7ouWPq6wcaZiiaibkyNOXtX54xA0tg27cr+bwfw78vPjlbfpWLmMvOvLznigFAAPdI+fRT7UJ81p7qkLWSORvWfoZ/779cxgdzo/ImKQAbsOvlJ5aSdSz3O3TyfBhYzcuwS1o1iJz26C/J6yxqWLuugw8Mobvq6v8bK1God21GTftuZMfDrPdwJ0maoqPg8sFfbG53K1UfMbJxqNoHpTUeDc7kFrh8wmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(26005)(31686004)(38100700002)(86362001)(2906002)(41300700001)(450100002)(31696002)(5660300002)(8676002)(36756003)(8936002)(2616005)(478600001)(4326008)(6512007)(66946007)(66476007)(66556008)(82960400001)(83380400001)(6486002)(316002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1FzelY3MVZhU0ZwNktiRG1SblJGL3YyR082eGZyYzhyY2xFUk40ZC9PVVBq?=
 =?utf-8?B?ZmlvcGI2VU80VHBmMWJKNU43WWpOZXlCcWU3bXZNR2twaHJvUldvNURqSm9i?=
 =?utf-8?B?T0NUWGhsWk5JbGZNVi9IVHc3cTltOWhHbERmL1JvS3phWUtzNFdDdmNKK2c5?=
 =?utf-8?B?RFNMK29YZzhjRzFiSitMb0Q2UXhTamFqSUlaeUszc2VMSnNNVDFxdGxXVVJT?=
 =?utf-8?B?Qml3ZFFiL0dwbVEzTFFMWTV0VEJVN2JTd3FSRGZ0TFZtNjZpLzZZK2xmbE5y?=
 =?utf-8?B?YUtnNkIyM2FDeFBjM2U1SEtpaVVRNXZrWStDcm5VTUZqMzNqOEpMVlM0R20v?=
 =?utf-8?B?bjluQzgrcDIvT2N1UVd3M1hhdVQra0Uxek1tYThFQUl3SkRWMFkrYittdVBE?=
 =?utf-8?B?eDd6cHdMRmVDS25ERE1VdkNqRDlVeURHdStaVFpnUkNmU1F2Mk1mcDRwekhi?=
 =?utf-8?B?ZGVVeWRQTEU1WUIyMTk5aFpFSmpzUEdWTGJ3UzZQblhIclN6NGFPMTduRnR0?=
 =?utf-8?B?ZGVkYnVIbGtVZFBtdXhiUGRGQXM4cWFxZWFyRklZQVArREs0SllOcHBEdFgx?=
 =?utf-8?B?NW9hczlGYXgyRnAra3cybVdRVlM1bSttTENCM2FTOFpPN1JsQTBYazRUbVo4?=
 =?utf-8?B?QVpmd3BZckZROHByNFhwOWZsWE96TDZlRDVKMkxRNVB2bC9VdzlTVnZWazMz?=
 =?utf-8?B?QkZmWEp2cWhJYzdPQzVOQmlqbEEvMGZBY2ZQRjZCbnRYNFdqVnJKVlhnUlQ4?=
 =?utf-8?B?aWRvellUa3lnNUxoTXFjV1NTdGI3NW9nQXNhdjkzUXlqQzFoRzQ2Y3FkNHBT?=
 =?utf-8?B?TVhuUElzWm1oVTdzbUZzU0ppYnlJTSt4cnhROUF0dDB3TXQxU3A2dWI5cmtq?=
 =?utf-8?B?K2JTQnE4bysrb0lEVEFKakpCOGcxTDkrQVhlblZ3UXhCUHJoYStSRHZyclQw?=
 =?utf-8?B?YkRaNlVua21ZcmlxemJBU1JqL1VJT1VoQjJqQWs5SkZWOWR6U1ZjMWVyUjdK?=
 =?utf-8?B?VE11Zkt5aUYvN05zRSs4UGRDZ1IxaTJ1Q2hPaGRHSFZEa0VKZ1dpVTJ0RjZ6?=
 =?utf-8?B?QjMwenZpQkViZWxIOGVWUElPbEsrME5GaW1oVmFCaG4zWGsrSW9NcVpOUUlX?=
 =?utf-8?B?RVJoTHFaNkQrUWRqTy9kdkpISUpEQ3BwdVlrbE1tRm9leXh0VktLMlpOZHJV?=
 =?utf-8?B?bVRvdXRqT21kSFZwZXRZSEtmTExFdzk3U3cyODMxZjFYbW9BRStPem9BMDl0?=
 =?utf-8?B?cldmVjgrT1YyVCtsMWxvNmZaQkxUdkx0ZVJ3Vld4Nm52STE3ZjNVOHJaZElu?=
 =?utf-8?B?aWhidjZhdnRCeEIvOEZZaEhuZVNhSHlZQkhLb3ZHWm1teHlmSUlRZFJWYXZJ?=
 =?utf-8?B?RHR3Nkx2UW9XUFdGQnMwQVJuMGpkNmFvbFlSdGVTbE5IYTVrcTZzQk9VYzdt?=
 =?utf-8?B?cTc2Nmc3ZWNqa0hsRi85Qjc1dnVQdUV2T2xJVkZmbmxMYmxySGpjK2t1NjNX?=
 =?utf-8?B?bnVNaStpeVpSdWg2Qk5pdWI2c29UV2hzWFlKMFUwZVlNRlh3R1JLV2hNeFlI?=
 =?utf-8?B?cFFzL3NlYzZLWGE5UFJRUEdhY004RlVCbEVWTWtNOHlxWjBPd2JMbHRVd3Zi?=
 =?utf-8?B?dEVTQVJZek5rcEZYeXhKOFBiWDdPNkF2SkZSZUhybU9sTVhjQUxkcWxxY2JH?=
 =?utf-8?B?akg2RnA4aE9yRVcyNEFVTTRRVE1kbGFtRlNFVTVqL1dTYk0vTklsb0JOQklH?=
 =?utf-8?B?amRndXUvK3lVZi9NWnBNS2JhVnNLSXg5Y1hxanJ6RTJjOFkxSkNHaFBZcUd0?=
 =?utf-8?B?RWZId3NpYjRXdWZLVFBnZUZGc3ZIekRwcW1QVU9EMDdocCt4Tk9zMGxqd25q?=
 =?utf-8?B?WVZKNkpVSzVKV2lOUnp5c2hsbXZnZS9LUnY0enV1RExuQ1pPV1l1ZTdvZkJT?=
 =?utf-8?B?NFBYRWxUNGFzZDlZTXJLNDBnMWZ6Q1AwN25DeTJNN05nOTB5dCtWRDl2eno3?=
 =?utf-8?B?cEVsV1l4c29iQTZFL3d0WHdMa2N6ODgwRm9xVXhzaGlZai9aZnllYjNseHZU?=
 =?utf-8?B?djVNdnZxaGt6eWpVaFZFcXg2RTlPR0J0RUM2bDFZVjdQaCt6U0wwcWd6Vy9h?=
 =?utf-8?B?ZVRHNE5Xa1M2RWVneE1jTFN1RGduZDlQSDBxNEhFSm5lTTZOV0V1czdRMG5y?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 317dfeb2-f6f5-48dc-89a5-08dbd7316c31
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 21:12:27.3025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWeaOVFijrx4tDuNhvbQA4lVRILrDeGK0gaAskv3bsbJipYQ9E1XmaDoGHqRbpbFTxRuONm10eTVeomqene9AiLiC2tJmRmMlvMIN10rifo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8330
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/6/2023 17:38, Belgaumkar, Vinay wrote:
> On 9/15/2023 2:55 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> To prevent running out of bits, new w/a enable flags are being added
>> via a KLV system instead of a 32 bit flags word.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  3 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 64 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  5 +-
>>   5 files changed, 77 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
>> index dabeaf4f245f3..00d6402333f8e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
>> @@ -36,6 +36,7 @@ enum intel_guc_load_status {
>>       INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_START,
>>       INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID                 = 0x73,
>>       INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID   = 0x74,
>> +    INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR        = 0x75,
>>       INTEL_GUC_LOAD_STATUS_INVALID_INIT_DATA_RANGE_END,
>>         INTEL_GUC_LOAD_STATUS_READY                            = 0xF0,
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 6c392bad29c19..3b1fc5f96306b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -186,6 +186,8 @@ struct intel_guc {
>>       struct guc_mmio_reg *ads_regset;
>>       /** @ads_golden_ctxt_size: size of the golden contexts in the 
>> ADS */
>>       u32 ads_golden_ctxt_size;
>> +    /** @ads_waklv_size: size of workaround KLVs */
>> +    u32 ads_waklv_size;
>>       /** @ads_capture_size: size of register lists in the ADS used 
>> for error capture */
>>       u32 ads_capture_size;
>>       /** @ads_engine_usage_size: size of engine usage in the ADS */
>> @@ -295,6 +297,7 @@ struct intel_guc {
>>   #define MAKE_GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 
>> 8) | (pat))
>>   #define MAKE_GUC_VER_STRUCT(ver)    MAKE_GUC_VER((ver).major, 
>> (ver).minor, (ver).patch)
>>   #define GUC_SUBMIT_VER(guc) 
>> MAKE_GUC_VER_STRUCT((guc)->submission_version)
>> +#define GUC_FIRMWARE_VER(guc) 
>> MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
>>     static inline struct intel_guc *log_to_guc(struct intel_guc_log 
>> *log)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index 63724e17829a7..792910af3a481 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -46,6 +46,10 @@
>>    *      +---------------------------------------+
>>    *      | padding                               |
>>    *      +---------------------------------------+ <== 4K aligned
>> + *      | w/a KLVs                              |
>> + *      +---------------------------------------+
>> + *      | padding                               |
>> + *      +---------------------------------------+ <== 4K aligned
>>    *      | capture lists                         |
>>    *      +---------------------------------------+
>>    *      | padding                               |
>> @@ -88,6 +92,11 @@ static u32 guc_ads_golden_ctxt_size(struct 
>> intel_guc *guc)
>>       return PAGE_ALIGN(guc->ads_golden_ctxt_size);
>>   }
>>   +static u32 guc_ads_waklv_size(struct intel_guc *guc)
>> +{
>> +    return PAGE_ALIGN(guc->ads_waklv_size);
>> +}
>> +
>>   static u32 guc_ads_capture_size(struct intel_guc *guc)
>>   {
>>       return PAGE_ALIGN(guc->ads_capture_size);
>> @@ -113,7 +122,7 @@ static u32 guc_ads_golden_ctxt_offset(struct 
>> intel_guc *guc)
>>       return PAGE_ALIGN(offset);
>>   }
>>   -static u32 guc_ads_capture_offset(struct intel_guc *guc)
>> +static u32 guc_ads_waklv_offset(struct intel_guc *guc)
>>   {
>>       u32 offset;
>>   @@ -123,6 +132,16 @@ static u32 guc_ads_capture_offset(struct 
>> intel_guc *guc)
>>       return PAGE_ALIGN(offset);
>>   }
>>   +static u32 guc_ads_capture_offset(struct intel_guc *guc)
>> +{
>> +    u32 offset;
>> +
>> +    offset = guc_ads_waklv_offset(guc) +
>> +         guc_ads_waklv_size(guc);
>> +
>> +    return PAGE_ALIGN(offset);
>> +}
>> +
>>   static u32 guc_ads_private_data_offset(struct intel_guc *guc)
>>   {
>>       u32 offset;
>> @@ -791,6 +810,40 @@ guc_capture_prep_lists(struct intel_guc *guc)
>>       return PAGE_ALIGN(total_size);
>>   }
>>   +static void guc_waklv_init(struct intel_guc *guc)
>> +{
>> +    struct intel_gt *gt = guc_to_gt(guc);
>> +    u32 offset, addr_ggtt, remain, size;
>> +
>> +    if (!intel_uc_uses_guc_submission(&gt->uc))
>> +        return;
>> +
>> +    if (GUC_FIRMWARE_VER(guc) < MAKE_GUC_VER(70, 10, 0))
>> +        return;
> should this be <= ?
No. GuC 70.10.0 is when w/a KLVs were introduced. So we want to skip on 
any version that is prior to 70.10.0.

>> +
>> +    GEM_BUG_ON(iosys_map_is_null(&guc->ads_map));
>> +    offset = guc_ads_waklv_offset(guc);
>> +    remain = guc_ads_waklv_size(guc);
>> +
>> +    /* Add workarounds here */
>> +
> extra blank line?
The point is that the comment is a place holder for where the w/a KLVs 
will be added. This is just the prep patch so that whichever w/a 
actually gets implemented first (there are still issues with the current 
options), the w/a patch is only added the w/a itself and not a whole 
bunch of infrastructure as well.

>> +    size = guc_ads_waklv_size(guc) - remain;
>
> Hmm, am I missing something or remain is already set to 
> guc_ads_walkv_size()?
You are missing the actual w/a to be added above :).

John.

>
> Thanks,
>
> Vinay.
>
>> +    if (!size)
>> +        return;
>> +
>> +    addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
>> +
>> +    ads_blob_write(guc, ads.wa_klv_addr_lo, addr_ggtt);
>> +    ads_blob_write(guc, ads.wa_klv_addr_hi, 0);
>> +    ads_blob_write(guc, ads.wa_klv_size, size);
>> +}
>> +
>> +static int guc_prep_waklv(struct intel_guc *guc)
>> +{
>> +    /* Fudge something chunky for now: */
>> +    return PAGE_SIZE;
>> +}
>> +
>>   static void __guc_ads_init(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> @@ -838,6 +891,9 @@ static void __guc_ads_init(struct intel_guc *guc)
>>       /* MMIO save/restore list */
>>       guc_mmio_reg_state_init(guc);
>>   +    /* Workaround KLV list */
>> +    guc_waklv_init(guc);
>> +
>>       /* Private Data */
>>       ads_blob_write(guc, ads.private_data, base +
>>                  guc_ads_private_data_offset(guc));
>> @@ -881,6 +937,12 @@ int intel_guc_ads_create(struct intel_guc *guc)
>>           return ret;
>>       guc->ads_capture_size = ret;
>>   +    /* And don't forget the workaround KLVs: */
>> +    ret = guc_prep_waklv(guc);
>> +    if (ret < 0)
>> +        return ret;
>> +    guc->ads_waklv_size = ret;
>> +
>>       /* Now the total size can be determined: */
>>       size = guc_ads_blob_size(guc);
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> index 0f79cb6585182..a54d58b9243b0 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
>> @@ -115,6 +115,7 @@ static inline bool guc_load_done(struct 
>> intel_uncore *uncore, u32 *status, bool
>>       case INTEL_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>       case INTEL_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>       case INTEL_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>> +    case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>>           *success = false;
>>           return true;
>>       }
>> @@ -241,6 +242,11 @@ static int guc_wait_ucode(struct intel_guc *guc)
>>               ret = -EPERM;
>>               break;
>>   +        case INTEL_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>> +            guc_info(guc, "invalid w/a KLV entry\n");
>> +            ret = -EINVAL;
>> +            break;
>> +
>>           case INTEL_GUC_LOAD_STATUS_HWCONFIG_START:
>>               guc_info(guc, "still extracting hwconfig table.\n");
>>               ret = -ETIMEDOUT;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index f97af0168a66b..3266842d925e6 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -429,7 +429,10 @@ struct guc_ads {
>>       u32 
>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 
>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>       u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>> -    u32 reserved[14];
>> +    u32 wa_klv_addr_lo;
>> +    u32 wa_klv_addr_hi;
>> +    u32 wa_klv_size;
>> +    u32 reserved[11];
>>   } __packed;
>>     /* Engine usage stats */

