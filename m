Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB2F86766E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 14:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1927010F1AD;
	Mon, 26 Feb 2024 13:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgE541y/";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069810F1AC;
 Mon, 26 Feb 2024 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708953954; x=1740489954;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=acCQ+uzERijUwQhbMVYc0IKaCLSSRgJwtXZjsenasnY=;
 b=HgE541y/OO0FPYnqYEGWqjS81TE29Ho1bBIqnzPfolkPGoj5coqVvVox
 tC/FdLaC5+oo9t0/01XquMbMPu4JeT7YHBMJBVo0t1/QBMzNfi5tp+K+R
 UlxoE0/at247PX+uHDg3rBn9Su1k0V1TDzgLZCMKX9/B4gI1OR9uKFcql
 LxyhLQOeCVdViFDaYJhVYfIbTRgMhvUK6VIsGqNTOS1fCJMPuDSnQWay3
 si7Z/+MIKcToLkQT6teaZqO2M5zwToEnbBQ/DINp8pZnSbv+MPd9MUqXO
 rBXXgAW+s8WE0MQsvdkLLilHAGPTysFTolBJe8Sw+MQOJI/VeSo4622f5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14671877"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14671877"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 05:25:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7016062"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 05:25:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 05:25:52 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 05:25:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 05:25:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/tzSCcaBth4vr3rRCt3j6zTEdjCI2aOIDb2tD7L/7NtfZpx/fraPYF2qj3deGyLk5L8yP9gvdvkGNdjRFv8HjWFALwHlwO9KXu7nlVfmhk70+Lbqp+AoJM4tQmH/AbeVRx2y6plJccc1SNQDZsU+YCdAzGsh19vpNYmpUh3yjOmB2JASjli/lhhsAXCTZT7RxJEE56GwgI5LCFx9FDqaQL9EEXtrVQ7/1utlyjAFzH8hHvP1glWwAarj971YjWtM6m5natGsTeL4adeYI64arBWjKtrADjkujjb8hlZIBxW8N/NJFHWhs4ZS92yKp/SmP4my7D+HBrz/glqPUJsYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnUwFKGA7OMCQer3jpsaGRRb6YdvxlUfvF9rljLnTn0=;
 b=gllnkDycp8ke1Ypmcqq20uBJJW9nlCjgwa74eAgZ9dN4jo0JONdylbQ7ia4Q4CtpsHuf+/OC/thw2ZSf3pT58RltqTO0YbQFBP+jheqeNOquiTPHGELDzn4fPAZ0dg1ysXh18XEr2vWz9XUkd9UOUaO750o0oRziokZZB+8/ns5/CgW4eF/FTG4VL1XljzinjPDd2AHRZQ754cxp/ja2aDLkSF/qJpjALUWhuChP4zBgtVdhUjhbzSWm5CGTpgF3S1PxKAWxJREd2Ls9zSh687nzyqnNjyDkpaXw3jOb+E39hGHoxPAXOGVzn6Npdkh4iqRTz57enAX7lkTh0g6pIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 13:25:49 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 13:25:49 +0000
Message-ID: <c60e319a-e328-482a-a89d-7d55003306a3@intel.com>
Date: Mon, 26 Feb 2024 18:55:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/i915/guc: Enable Wa_14019159160
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240104180541.2966374-1-John.C.Harrison@Intel.com>
 <20240104180541.2966374-4-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240104180541.2966374-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: a590cc0d-8820-4b5e-def3-08dc36ce72bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cPNsDWBHphA7n1KWgeIO9cpfBYJSQu5EcWh7TveVP6FdRCzjW6QrXYTH2WK5sjVljdEZmYBLjZPLZgYJVzMWNtFn4/mq3G9ccYoWabWnqH097B7Pvx8fBX97i83MCBuAeXD7W/Hfl6TlgKcAqRyzpZjF/jAenT+UeDqY/vUNll5M2izDSlvy8ls3mRlF43swgoHPlkTohn69v9SRzll0ADLUM3/S4nxwZ8aNInYvGJwOXrpKBDKxBSz2D1UEUwBOyCWx6dspwYs2f+nTIkY0pOBw41mvmRsuBF34etOCgUX4rASCteIv2GlUeRDkO02O+/bPtcgKgRsZtgXuUXdKMz3CtnAC/iIuOKeTOgWjQPuf2URKyobXUOnvsiljm1/SSgcGANx7q/aMDEtcCWbQ+BsTb99pW0kYtVXxphlcdG1k+glrZgHAVWJcNWW7IIOPhfSUrTdy+NC3D5JMsjvHT9NIejDFFcsyDSLKAsQS7Z3hJOG2jQT/syU5nh+2NAseGsmV1ZWiUVV5sIrzD8JF4DbkebCG9HZ0j3FPJbCI2HFbInmm86fC/lGK2j4URRwHccdT92M4u8YpAQHUoBsZRBM8dGsDOFyWi+GnxTjQQwNJhDmIfkMC3LPBRXH5ZKej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTFrRGhJWG5aaDZKajVPNlk0UnAwRE5vVjBTZWdYWEN4NFBQMTlndTNOZUht?=
 =?utf-8?B?aW8xUFFiWnFOWGE2cXhjZ2JpNDM2d0tKTTJ1eTJQYUN5Z0kzNXUxMnRNVlpK?=
 =?utf-8?B?ZUc2VnBzbzhXNWkzL28yWEhrMXRia1UvZnYzMHBXTXZQWTQvZWFCeHdhOEta?=
 =?utf-8?B?bnRVUVRNekY0SjFwYXhpQ0lMWHhkcFNnWWJIUGJjSWRIUk9aNE1aMXpXaGxy?=
 =?utf-8?B?ZDVpVVcraFhudW9HOHNsbXM4NUQ2NUo3aTZiSVVNaWtvVXBaU0xPa2hUSXc3?=
 =?utf-8?B?VGluNnQvaDVlR0FYSlFxcGZxME5LT0tkTW03cDFPOWtheStDcUhUbHZMSk1k?=
 =?utf-8?B?a3p1WEFZNDVuNitoTUNSQnQxYmt3bFlZUGRqNzlSWkJrclkrcW1zRHErVjhO?=
 =?utf-8?B?cGUxNnZpaHNqMVEyT29ZejJGN3ZDWnJ4Q3FYaE5QTW5WR3BLZnNjaUhsNGcw?=
 =?utf-8?B?UEVHTE1NZGxiY2hxc3cvUGEydDRjU3krVWphZHVTTlIwQnZOTUpZZlJNeVR1?=
 =?utf-8?B?bll4NmtWUEU5OVVWaXIvbktCc3lraWhJdy9UMFFCS2pKU3UvbmQxc1dKVURW?=
 =?utf-8?B?SGxzWXd1VUtDL1YvUjFZTHNoM2ZxeXlaSGRZeWJGcGQzMkcwNWZ1cEpLdFQ2?=
 =?utf-8?B?VDJXVDRCWU9vSXBMM3VqTjhrYXJIelBQWExwd3hmYTkzMHBXK1JXSGovSDBp?=
 =?utf-8?B?MGdGRmNJK2Y3SWt0V1EyeW9zdWptcFZ1dGpGcUFuakdZZ1hyNWlURC85MDB1?=
 =?utf-8?B?UUJCVGtTUThqcjVqNG1LcDJuNURhb2wzK1NNYlJWWVlhUlIzNGRuU3VoeEJE?=
 =?utf-8?B?OTNoeGxlVWRiU09yM0dEdnpTVkxJekxKK29sMWwzKzlnOWdHcXVOMTJTL3kr?=
 =?utf-8?B?Nk8vV1dURmZFQU9DV1VVbW90R1ZIUVRSSmw0Q3VvaFJ2MUtid29LRWNVWjA0?=
 =?utf-8?B?R1dnV2J4NUY2dEF6T1gwNXE4My85QWhRRHpuNzVZWXRCVm15Q25tZFFFaG5r?=
 =?utf-8?B?Ym5MaEJDRmRnZXhtbVYzamQ2YTBzQXUzcUtDaTQwc1BrZm9FbjdnTDU1U2c5?=
 =?utf-8?B?cmRUa2hiL2U3YWh1WWU0L3J5WTZwV25ML2lyRzhOMkJqMkNFUXp6M0NpbG1T?=
 =?utf-8?B?QTNpRnNBcHZmUURtT0RuaEExMTFPQkdYbTY3Qm5XcjhtYVlaM1dMZFV4cUFQ?=
 =?utf-8?B?VXY2UDJvYUY4SDFvbkxwanhWT1RrTkM4bUFwL2R6VXZ0UEtXcktEbnJVNWRO?=
 =?utf-8?B?R0hXTDY0Y3BGOFVKNTRUWVAzSTRnR3FyVWxFeG9tVFJzckEvZDliOXNDNGFX?=
 =?utf-8?B?azNIVUlaWGVDTVJSVldvZ1pNaDhnbXdjMkpaQW9Yd3M1RW5XNmpJeis1VEVZ?=
 =?utf-8?B?ME12QVF5cnBzSlJsR1FzNmRPWTNTUkpxZys0Znh0eHpnYWpMbG1YNTA0Q2ZQ?=
 =?utf-8?B?TkVTVzVlN1lmd2tOR1VDc3M4cG5Sa3dXT2FxVFpxdThQSXBjYk9oRjl0ZWoy?=
 =?utf-8?B?ZWpvYW1pVFhjOFFUOEhkaWF1ZVh2VnhBL0x4SEl5NllpVW5FeHoySW9mMnZ1?=
 =?utf-8?B?QndUblJmNlVoL0RRNjNqQkwrRUNWR1k4U0xyMjB4a2VkK1FMd0ZWL00wS3JV?=
 =?utf-8?B?ejNwN3BVelp4NlRlMnFyakZDcWhhTUltRldieTUwZndFOS9Ydkt3VFlXcmV1?=
 =?utf-8?B?S1NOa29YelZLbit6T2lnalhyMjZ3cGZOK1NKL3lrVGI1Z1IycGNJNEJHSHR6?=
 =?utf-8?B?d25QdmhCQmxGL0xPUmFLb3Yyd2RMLzZpUDR3UHg2YkEwTlduK0duYmVHdWlG?=
 =?utf-8?B?TS9DU29YYnFOS0IvOU4zR204N1M3N2RGSTlJNFV2YjIwU3dSTTJtbEZMRnJv?=
 =?utf-8?B?M0tKNHVlUEphTis5Z0trMlBhbUpDMkZtUVVya0dPNWw0bWYvaXNkQ2ZYTFVG?=
 =?utf-8?B?c1BlMTVnYVBnQWlmQkpRNHQyQ3ZpVXBydGh1ZU5aVzhKVzA5M2xZMWZLRjJX?=
 =?utf-8?B?ZThPTHpuSTh1MTNIRFZzeG4rQ2VPalV1amhkeFZPc2NiTkJ1VUFZbTVaeUdn?=
 =?utf-8?B?cGFWemJxSWxLb1lqNmxtWDgva0Jud0JNVElQcU5HQUo4V2szaHk2T0w5aFpZ?=
 =?utf-8?Q?RZlF91XdFqTTX+wjAse+w0oQu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a590cc0d-8820-4b5e-def3-08dc36ce72bf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 13:25:49.8886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0bqT6Tisg/NYhiAKrjKf2G9/CEg0RSxd4aNYE0lgaRitOwD8fAP9SFPZmRgjmIvwzyD0uhFlvJBzXPQTnxDVKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
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

Hi John,

On 04-01-2024 23:35, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Use the new w/a KLV support to enable a MTL w/a. Note, this w/a is a
> super-set of Wa_16019325821, so requires turning that one as well as
> setting the new flag for Wa_14019159160 itself.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  3 ++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 34 ++++++++++++++-----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 +
>   6 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 9cccd60a5c41d..359b21fb02ab2 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -744,6 +744,7 @@ static u32 *gen12_emit_preempt_busywait(struct i915_request *rq, u32 *cs)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   #define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET	0x540
>   static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   {
> @@ -753,6 +754,7 @@ static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   static u32 *hold_switchout_emit_wa_busywait(struct i915_request *rq, u32 *cs)
>   {
>   	int i;
> @@ -793,6 +795,7 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   
>   	/* Wa_14014475959:dg2 */
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */
>   	if (intel_engine_uses_wa_hold_switchout(rq->engine))
>   		cs = hold_switchout_emit_wa_busywait(rq, cs);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index b519812ba120d..ba55c059063db 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -697,6 +697,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
>   
>   /* Wa_14014475959:dg2 */
>   /* Wa_16019325821 */
> +/* Wa_14019159160 */
>   static inline bool
>   intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 58012edd4eb0e..bebf28e3c4794 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -101,4 +101,11 @@ enum {
>   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>   };
>   
> +/*
> + * Workaround keys:
> + */
> +enum {
> +	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
> +};
> +
>   #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index d5c856be31491..db3cb628f40dc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -295,6 +295,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>   
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */
>   	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>   		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index 6af3fa8b92e34..68d9e277eca8b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -815,6 +815,25 @@ guc_capture_prep_lists(struct intel_guc *guc)
>   	return PAGE_ALIGN(total_size);
>   }
>   
> +/* Wa_14019159160 */
> +static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
> +{
How about making this function generic by passing KLV id as arg?
> +	u32 size;
> +	u32 klv_entry[] = {
> +		/* 16:16 key/length */
> +		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
> +		FIELD_PREP(GUC_KLV_0_LEN, 0),
> +		/* 0 dwords data */
> +	};
> +
> +	size = sizeof(klv_entry);
> +	GEM_BUG_ON(remain < size);
> +
> +	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
Otherwise preparing and adding klv entry can be wrapped in generic 
function.

Regards,
Badal
> +
> +	return size;
> +}
> +
>   static void guc_waklv_init(struct intel_guc *guc)
>   {
>   	struct intel_gt *gt = guc_to_gt(guc);
> @@ -830,15 +849,12 @@ static void guc_waklv_init(struct intel_guc *guc)
>   	offset = guc_ads_waklv_offset(guc);
>   	remain = guc_ads_waklv_size(guc);
>   
> -	/*
> -	 * Add workarounds here:
> -	 *
> -	 * if (want_wa_<name>) {
> -	 *	size = guc_waklv_<name>(guc, offset, remain);
> -	 *	offset += size;
> -	 *	remain -= size;
> -	 * }
> -	 */
> +	/* Wa_14019159160 */
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> +		size = guc_waklv_ra_mode(guc, offset, remain);
> +		offset += size;
> +		remain -= size;
> +	}
>   
>   	size = guc_ads_waklv_size(guc) - remain;
>   	if (!size)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b09b97c9cd120..80da3573706fa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4385,6 +4385,7 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   			engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>   
>   	/* Wa_16019325821 */
> +	/* Wa_14019159160 */
>   	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
>   	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
>   		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
