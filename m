Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E374E81298B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 08:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247C410E8E8;
	Thu, 14 Dec 2023 07:38:25 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F7910E8E7;
 Thu, 14 Dec 2023 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702539497; x=1734075497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=HK45JebfOtUTINda1+wistXmNlZvWD7H+mIl9/MA3gA=;
 b=Td0je4hGSNvAEDrZ3QjWfFFo/ujwg9ngzY8OR18e998CKBjkn5kljN2e
 mrpUnhoAPCg+mgW5EEi4F/tevPtjMIsi/T6F3FmdHgzGG/ljyBH4XPJjN
 VUuIVGP7gwBnhVNC/4WGK5RhpFnBEf5ErQZYPluO5Ve973xMAnKIggOLn
 v41huiCwsvrPb3wjUHZKgFmlIZQYa0NS/q+oZlALkopbZxdTUdezMHH8u
 EB98s/lmHEtsFJCmEq1T5HhGUB6jmxjyMT8/m1Ni/WsE6q3kqCqHfcx5S
 Ltm/yQfZ1BTh5ykB/lfhuCOgSgJLHC3xIqdC25mNMVW6kbaNtNDDCcZjH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459403196"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
 d="scan'208,217";a="459403196"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 23:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864932301"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
 d="scan'208,217";a="864932301"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 23:37:10 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 23:37:09 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 23:37:09 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 23:37:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiNoLFyKy2vDvLHJQ9MgXFOG3YLgsS5rBr8N0EYlzS7+kZriNqH6DG2ygqspge80ULkt9UK7s83jcYX2dNcjdKwBE5Xk7gg+vj8KqPIfQtqMwtN1ePW/V6DRoP6GofPrBAevX71SCj8OK9fZ8KofnMJLfgdfiKmojr4q+LAPM7CQQjBn4KFsuMBwunlEFpsdfRppFMEe3vWnrOVRT92KtnbYlKQ1FANYgksEHZ1iXWR6OxYLBGHl1/QBe4EnFKHoayOvZ3E5tQLbmbd34Fs5nRErqdlcYZndWwNWK8LplqE72bIhe9PJT24KUq+OMuGdYwNaG41Ad7uuTG2WeU2Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aLplbdHj86JcvTrkl0/nTBU8fQPr5/GheIj/3kb9YA=;
 b=JV0icuACqT5JRqOvqertzMttPlI2PDyvt+3flzhLFZx/+SIzwkKdTRwO7fYlrJMOs8EFv21HpkgjjUc1Aqadh+Qpoe1f1hvbNFs85L/pRbs2TM9Qc8RzJnypl3ONH/Y/8yfh9udFyVOKQL95G50GH7Q3N0QjzmcCFj6suCMZp8FNjNUywf6zrxE5Iv6HPT/z7qgyqT5rpzz00c5PQsBBymoQ3GFLA+3To/6KknZKWpDIulftcIHcvvUiNQWVGtxj5XavN3qkDt3ic0G8ooBpdU5PEAycTQouVmpEv2HNu6HR076WJZ6Gkdo4MRigxcc/TzexhEEicVVndP5g40mESQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 07:37:05 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 07:37:05 +0000
Content-Type: multipart/alternative;
 boundary="------------76SSMq6OORy6hVkS9YlY7TlU"
Message-ID: <82779dfc-5853-4823-9ecc-423f02e79a6c@intel.com>
Date: Wed, 13 Dec 2023 23:37:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v2 1/4] drm/i915: Enable Wa_16019325821
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
 <20231027211814.2696398-2-John.C.Harrison@Intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231027211814.2696398-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|CY5PR11MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: ae8b4594-c612-485f-84ff-08dbfc77786a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: axXhQAYbTmj5uh3nRKlT3q8UODPQ/HGKmRJhxP3zs1WJltinOaojsHyTw+2jwKQZLnKZKRfeMjVlRyfjxwXY+aytrkF/uMg+9/hFEu3bz3cr7AkKlOlr1yJS0Ox+VIA5H9UbOd5kySW84jw8RFrkmRUmqrRSOLYVfCk4SoIZ7lNOjPTYT94noHEfD+qbWAZm6hKkOFYdfPhB+OU6ugpCXpGOIK/csmvXAFko2gExhMy4AFNDJnrxIE6ukRdpnjcjMib71ndHUmC8zBOFD8l5+9lMU0IguNQceoI9W1HagCyZaFf3YiuBdoXht5PD2YcQJfvLKZdjLcPGDdHnRazQGEXOZmKz4YT5WPr0lCY4baqgU+ikw4STjSfcoawmTqmL7lzETixIoGT6qm3D27CsBLYUF4AOLnEyigW8odUk/m2lLnTJDZfcJt3NvO9oSGFyCY0Kz3tbREV3rbSsWSHjeOKl6g5JjQXRjYVf1eSHqj2zl2EdmZiq23EBg+7OPVxR+HHCgLrC8rm8rrJZgl1cDBT/azf1TZ3GpAtRUWpIIUulyZpxoC6rkgkP++g2yU/FWCNO4/FSnOG0l4vBDhZTedP4YgHWvNejdoRsnq0jwvk2vtFc4WqLxEedIgViyigYlu6ck0kjmBwuKcFvNkYTGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2616005)(450100002)(4326008)(8936002)(8676002)(316002)(26005)(478600001)(6486002)(33964004)(82960400001)(38100700002)(53546011)(6512007)(66946007)(66556008)(66476007)(6506007)(5660300002)(36756003)(31686004)(83380400001)(30864003)(2906002)(86362001)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWVhUTNiNjRBSnRra0VyUmQ3QVRQbTJDZG9FWXZEQlpwZTJOcldFeGdEeHA4?=
 =?utf-8?B?and3TlBKS09odklQa01iYkdxVlhiMG1zMEZXazJENzk4RkM1bCtTd3pQVzJI?=
 =?utf-8?B?K05PTEJqdjc1L0NFQ00rUk1uMXhUbXUrbGZ4aUhuWkd4Ky9CUTlvazJ1LzlD?=
 =?utf-8?B?T3BqR1pPd25STVdIdDVkNnRNRFk5WTMvcXZQbGRaeDhkWWd6Mm1ka0dRanp4?=
 =?utf-8?B?UVY2L3hPOGx2SG1nZUJnS0dYL1JWWjY4REN6aHZpaXFGV2lOMjNkRUhrUDNI?=
 =?utf-8?B?Qnk0Ums3dVpWaEhnMkxXcUpOVGpiYXNXbDUzcVVOVmp6UkdITjFaVi9VdnZV?=
 =?utf-8?B?UFFxMHpRMkNwMVAvMVBIMGlVdG5ZU2krb250TElaV2ZLRTRUT2JZN0J1UldT?=
 =?utf-8?B?TWpnVWxxWHNyUFZ2cWtXcFVaYlE0YVlEcy9FVGdiRGpzcTdjQVFoSXdqUEkx?=
 =?utf-8?B?eFFKWHUyc1BLUERvWDVsUllHTVhyeTh0bExZbGl2K0xxYk1kaDBFdG13Q2xa?=
 =?utf-8?B?OEI5NHZiWUVhTXBiTUluY1E0bU1ETjRaNlpJNGZvNzVocHJEdDB6Z3lJYVlN?=
 =?utf-8?B?dUxidklyZHhrNmlQWWR4V3N4SEVKbVkvaDBWcnRrNHV5cmxkcjNBTm9GRktz?=
 =?utf-8?B?OGc3MTVPYUZWZEcyS3JDc3ZyRjZRbEZwWGFUNC9GRlJpSEEyOHRYeFdpNmJE?=
 =?utf-8?B?Y1hNK0syQWgwTkZtVCttV1NaUkNsY2oveElPQUhocUlNb1JNMllFa290aFBU?=
 =?utf-8?B?d25JRGErVzVOMDBVOWFUSHJZT3lpVjlUeHBmSGZLZ0s4TWtwei9KamFNT0RE?=
 =?utf-8?B?cWxsd1hUTWx6WmN3QWNRS29XQlVidXl3ZEcxODhQU2xXemtNWFI0cWpqRHBD?=
 =?utf-8?B?ZmptRDdaUEdXc1hWN0NJbHhXcjVVT282UGVYM0prekhMWnBNUXlMZThtdFRF?=
 =?utf-8?B?YUVIOEMzSkRmRy9ja04zNkZTNnNJKzY0VG92SVNSc1JnSW1hRDE1eUVJQWhN?=
 =?utf-8?B?RXB3emlMZXQyTmZqNGZuK1l6QjJnRTZxVzRhRDhHcDFBelJaWmc4NVVFTHpB?=
 =?utf-8?B?YnhzaFFmZDhKNCtRd0hrOFBKWFpYMVBGaGZQVmFFaytHSGtaRlpEN2NZQWl1?=
 =?utf-8?B?RitPTGdxUkJpenNMM2UxNXVhUnJiYWlBVzRWajFLVGJnVXR0OUs0L1lIRjV5?=
 =?utf-8?B?NmlzUHpLK3hDWkM2Y0Nvc01LVEJvSHA1ODBOSkF4ZjBuUW83VTlJZWZXUUJD?=
 =?utf-8?B?QkhCanN4a296Y1lSQm0zOGZlZ1pGclVLaTIwY0g3WlNrQTlaQ1B2emJjK0lu?=
 =?utf-8?B?cjlPallRVTFaaGdkK0h6Z0hFamI3WlFZTUpoR0NnL2ZQVUdWaWdIVzNXQ0F0?=
 =?utf-8?B?QmczZjRUbm9jcjJidGJaeVRNRUowYWgzTWVJbHltN1pLNlRsS2FLckdOS3Zu?=
 =?utf-8?B?SHN4QmVweFkxeS9RUDNOdllCUmpxUHNpQ3pjQnF2WkMwREI1Qi8wdXFxTkVG?=
 =?utf-8?B?aHN2bmROSU1PaWN0K0xCUEw3azd6Ky85MHAvWW5XSHNDbWYrKytnbzROVUNP?=
 =?utf-8?B?K2V0UjNFbkpHdUJwVXNTQnJGR1FoY25Ia3VHdmtydEhYQlE0c3NDMnFoL3hI?=
 =?utf-8?B?WEpHR0ZTTUt0S1BST0RhT0Q1SmhWTDd4cklMY3VUaHhra3VFamYva01lT2wv?=
 =?utf-8?B?L1RMQmk1VnNpejVqaWVRVmRXMng4dkc0TVZjOWdTb2ZJbVJ4WEhDOVF6THFn?=
 =?utf-8?B?MXB4YW4vUjJHOFl5TmJCNmR6WS9wRWhTT0tCTy9zUW9HTWgvWEtXdng4ZE9a?=
 =?utf-8?B?YkNEN1dYbCtPMXVubzhyeDE4bUZ6Wk45SFh1QlF5Vks0c2ZUZ3VIM3prTzBS?=
 =?utf-8?B?akcvOCt4QXJNcUF5SE8yMGVsTzV4eTViK3BrOXNSa01NeHlqa2w1RnNpbUti?=
 =?utf-8?B?b0J1RHNLOG9yeHI5NlVVL2x6WjdGWnNTQWQ3OHhVU0FxM2VxQzRUTmdpN0NU?=
 =?utf-8?B?TGwvd3MxM0lVczloWWZwVkpoVUhtZHdwZjVUcDNQZTdLOUNpNFZOdnJ3WWJs?=
 =?utf-8?B?WmFQZENteTJsOVQ1ZEpVcUd5L2JKSmVOK2FDMS9ObFdvNXkrZ3k4QVNLSXFi?=
 =?utf-8?B?dEVUeXdkcGRLVkh6RDFvQWYvT1k5Q2twRy9GMzNMRkJNVi9jWG9nU09QTUZF?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8b4594-c612-485f-84ff-08dbfc77786a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 07:37:05.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMxCqMPyVdvqXLLkQNKra+ZsbBWSJrM5S9o3FzVQTKV1fX2PgAoFHAfy1+TX8I0gD60DwFqXXWtg7wSlZOsgfz99E+Drb9dv8hJK41Z3ZQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6342
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

--------------76SSMq6OORy6hVkS9YlY7TlU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/2023 2:18 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison<John.C.Harrison@Intel.com>
>
> Some platforms require holding RCS context switches until CCS is idle
> (the reverse w/a of Wa_14014475959). Some platforms require both
> versions.
>
> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++++-
>   5 files changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 86a04afff64b3..9cccd60a5c41d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -743,21 +743,23 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   }
>   
>   /* Wa_14014475959:dg2 */
> -#define CCS_SEMAPHORE_PPHWSP_OFFSET	0x540
> -static u32 ccs_semaphore_offset(struct i915_request *rq)
> +/* Wa_16019325821 */
> +#define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
> +static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   {
>   	return i915_ggtt_offset(rq->context->state) +
> -		(LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
> +		(LRC_PPHWSP_PN * PAGE_SIZE) + HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET;
>   }
>   
>   /* Wa_14014475959:dg2 */
> -static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
> +/* Wa_16019325821 */
> +static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   {
>   	int i;
>   
>   	*cs++ = MI_ATOMIC_INLINE | MI_ATOMIC_GLOBAL_GTT | MI_ATOMIC_CS_STALL |
>   		MI_ATOMIC_MOVE;
> -	*cs++ = ccs_semaphore_offset(rq);
> +	*cs++ = hold_switchout_semaphore_offset(rq);
>   	*cs++ = 0;
>   	*cs++ = 1;
>   
> @@ -773,7 +775,7 @@ static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   		MI_SEMAPHORE_POLL |
>   		MI_SEMAPHORE_SAD_EQ_SDD;
>   	*cs++ = 0;
> -	*cs++ = ccs_semaphore_offset(rq);
> +	*cs++ = hold_switchout_semaphore_offset(rq);
>   	*cs++ = 0;
>   
>   	return cs;
> @@ -790,8 +792,9 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   		cs = gen12_emit_preempt_busywait(rq, cs);
>   
>   	/* Wa_14014475959:dg2 */
> -	if (intel_engine_uses_wa_hold_ccs_switchout(rq->engine))
> -		cs = ccs_emit_wa_busywait(rq, cs);
> +	/* Wa_16019325821 */
> +	if (intel_engine_uses_wa_hold_switchout(rq->engine))
> +		cs = hold_switchout_emit_wa_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);
>   	assert_ring_tail_valid(rq->ring, rq->tail);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 8769760257fd9..f08739d020332 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -584,7 +584,7 @@ struct intel_engine_cs {
>   #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
>   #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
>   #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
> -#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
> +#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
>   	unsigned int flags;
>   
>   	/*
> @@ -694,10 +694,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
>   }
>   
>   /* Wa_14014475959:dg2 */
> +/* Wa_16019325821 */
>   static inline bool
> -intel_engine_uses_wa_hold_ccs_switchout(struct intel_engine_cs *engine)
> +intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>   {
> -	return engine->flags & I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
> +	return engine->flags & I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>   }
>   
>   #endif /* __INTEL_ENGINE_TYPES_H__ */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 3f3df1166b860..0e6c160de3315 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -294,6 +294,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   	    IS_DG2(gt->i915))
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
> +	/* Wa_16019325821 */
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
> +
>   	/*
>   	 * Wa_14012197797
>   	 * Wa_22011391025
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 8ae1846431da7..48863188a130e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -96,8 +96,9 @@
>   #define   GUC_WA_GAM_CREDITS		BIT(10)
>   #define   GUC_WA_DUAL_QUEUE		BIT(11)
>   #define   GUC_WA_RCS_RESET_BEFORE_RC6	BIT(13)
> -#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
>   #define   GUC_WA_PRE_PARSER		BIT(14)
> +#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
> +#define   GUC_WA_RCS_CCS_SWITCHOUT	BIT(16)
>   #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
>   #define   GUC_WA_POLLCS			BIT(18)
>   #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d37698bd6b91a..bdb321d8e265d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4380,7 +4380,12 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	if (engine->class == COMPUTE_CLASS)
>   		if (IS_GFX_GT_IP_STEP(engine->gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
>   		    IS_DG2(engine->i915))
> -			engine->flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
> +			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
> +
> +	/* Wa_16019325821 */
> +	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
> +	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
> +		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   	/*
>   	 * TODO: GuC supports timeslicing and semaphores as well, but they're
--------------76SSMq6OORy6hVkS9YlY7TlU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/27/2023 2:18 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231027211814.2696398-2-John.C.Harrison@Intel.com">
      <pre class="moz-quote-pre" wrap="">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

Some platforms require holding RCS context switches until CCS is idle
(the reverse w/a of Wa_14014475959). Some platforms require both
versions.

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 19 +++++++++++--------
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  7 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  3 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  7 ++++++-
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 86a04afff64b3..9cccd60a5c41d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -743,21 +743,23 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
 }
 
 /* Wa_14014475959:dg2 */
-#define CCS_SEMAPHORE_PPHWSP_OFFSET	0x540
-static u32 ccs_semaphore_offset(struct i915_request *rq)
+/* Wa_16019325821 */
+#define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
+static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
 {
 	return i915_ggtt_offset(rq-&gt;context-&gt;state) +
-		(LRC_PPHWSP_PN * PAGE_SIZE) + CCS_SEMAPHORE_PPHWSP_OFFSET;
+		(LRC_PPHWSP_PN * PAGE_SIZE) + HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET;
 }
 
 /* Wa_14014475959:dg2 */
-static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
+/* Wa_16019325821 */
+static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 {
 	int i;
 
 	*cs++ = MI_ATOMIC_INLINE | MI_ATOMIC_GLOBAL_GTT | MI_ATOMIC_CS_STALL |
 		MI_ATOMIC_MOVE;
-	*cs++ = ccs_semaphore_offset(rq);
+	*cs++ = hold_switchout_semaphore_offset(rq);
 	*cs++ = 0;
 	*cs++ = 1;
 
@@ -773,7 +775,7 @@ static u32 *ccs_emit_wa_busywait(struct i915_request *rq, u32 *cs)
 		MI_SEMAPHORE_POLL |
 		MI_SEMAPHORE_SAD_EQ_SDD;
 	*cs++ = 0;
-	*cs++ = ccs_semaphore_offset(rq);
+	*cs++ = hold_switchout_semaphore_offset(rq);
 	*cs++ = 0;
 
 	return cs;
@@ -790,8 +792,9 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
 		cs = gen12_emit_preempt_busywait(rq, cs);
 
 	/* Wa_14014475959:dg2 */
-	if (intel_engine_uses_wa_hold_ccs_switchout(rq-&gt;engine))
-		cs = ccs_emit_wa_busywait(rq, cs);
+	/* Wa_16019325821 */
+	if (intel_engine_uses_wa_hold_switchout(rq-&gt;engine))
+		cs = hold_switchout_emit_wa_busywait(rq, cs);
 
 	rq-&gt;tail = intel_ring_offset(rq, cs);
 	assert_ring_tail_valid(rq-&gt;ring, rq-&gt;tail);
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 8769760257fd9..f08739d020332 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -584,7 +584,7 @@ struct intel_engine_cs {
 #define I915_ENGINE_HAS_RCS_REG_STATE  BIT(9)
 #define I915_ENGINE_HAS_EU_PRIORITY    BIT(10)
 #define I915_ENGINE_FIRST_RENDER_COMPUTE BIT(11)
-#define I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT BIT(12)
+#define I915_ENGINE_USES_WA_HOLD_SWITCHOUT BIT(12)
 	unsigned int flags;
 
 	/*
@@ -694,10 +694,11 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
 }
 
 /* Wa_14014475959:dg2 */
+/* Wa_16019325821 */
 static inline bool
-intel_engine_uses_wa_hold_ccs_switchout(struct intel_engine_cs *engine)
+intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
 {
-	return engine-&gt;flags &amp; I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
+	return engine-&gt;flags &amp; I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 }
 
 #endif /* __INTEL_ENGINE_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 3f3df1166b860..0e6c160de3315 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -294,6 +294,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	    IS_DG2(gt-&gt;i915))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
+	/* Wa_16019325821 */
+	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
+
 	/*
 	 * Wa_14012197797
 	 * Wa_22011391025
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 8ae1846431da7..48863188a130e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -96,8 +96,9 @@
 #define   GUC_WA_GAM_CREDITS		BIT(10)
 #define   GUC_WA_DUAL_QUEUE		BIT(11)
 #define   GUC_WA_RCS_RESET_BEFORE_RC6	BIT(13)
-#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
 #define   GUC_WA_PRE_PARSER		BIT(14)
+#define   GUC_WA_CONTEXT_ISOLATION	BIT(15)
+#define   GUC_WA_RCS_CCS_SWITCHOUT	BIT(16)
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index d37698bd6b91a..bdb321d8e265d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4380,7 +4380,12 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 	if (engine-&gt;class == COMPUTE_CLASS)
 		if (IS_GFX_GT_IP_STEP(engine-&gt;gt, IP_VER(12, 70), STEP_A0, STEP_B0) ||
 		    IS_DG2(engine-&gt;i915))
-			engine-&gt;flags |= I915_ENGINE_USES_WA_HOLD_CCS_SWITCHOUT;
+			engine-&gt;flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
+
+	/* Wa_16019325821 */
+	if ((engine-&gt;class == COMPUTE_CLASS || engine-&gt;class == RENDER_CLASS) &amp;&amp;
+	    IS_GFX_GT_IP_RANGE(engine-&gt;gt, IP_VER(12, 70), IP_VER(12, 71)))
+		engine-&gt;flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;<span style="white-space: normal"></span></pre>
    </blockquote>
    <p>LGTM,</p>
    <p>Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a><br>
    </p>
    <blockquote type="cite" cite="mid:20231027211814.2696398-2-John.C.Harrison@Intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	/*
 	 * TODO: GuC supports timeslicing and semaphores as well, but they're
</pre>
    </blockquote>
  </body>
</html>

--------------76SSMq6OORy6hVkS9YlY7TlU--
