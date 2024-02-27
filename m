Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A0F8684D9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 01:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1E210EECD;
	Tue, 27 Feb 2024 00:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFu8WZ/F";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65010EEAB;
 Tue, 27 Feb 2024 00:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708992382; x=1740528382;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kVcVs05pXgCbWMpJBeNXDLD6DAfxWoOjn+oaoRcXs0g=;
 b=BFu8WZ/FLWiYF+tjqBXUtlYL0HnmATciFZekBN9Meukfe2z+XwHfSWQR
 utnbgKDvhuuh5AB2cVLibj/U8mwczHXwplzGTx3J3hqESNZNM7Vo5N2nA
 OCW/w9WxN0B8UoqRYZ3y4rZAG/0rbfgeza+kf0tflAQk32UPP7sd0Tuap
 WdVPG2tkRU4XIGDc17bHWQxrHh0OmZ3hgG5pqlJ6gVmQrNbuI+Cc8s4Cl
 NGV1Z+cgeaKjQ09WM3fbqVlfgGyq6XIUFcu7CJlRgkYBmBA7NZ2MQJEGl
 dAC6svHzn6mKXN/ireKY38d6eCDWb5QFZFMeDmvRzeNPgw+IyGmu3uUiV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25778724"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="25778724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 16:06:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7258138"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 16:06:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 16:06:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 16:06:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 16:06:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 16:06:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTSRQphETbVllTKfAdNDS/TxiDrMup2R+2XXFbMJQxTWJOYKQSOkXo4MiJB97wJ3Xz8i/1Z9WfmcA9qlM/ve3BUvn/VLbsvDX4Y9lXC7uhZvRyz5qmniIVY15vOl6OGU2EiRBAD9I3dav0IdlOukkNIVSTggTs0mYTEhid/8gA7xugKTuDa19C9bvuO/DrNZ9XPd/STIRVqYXRD1IAPYRwsTXV8kDOMG/TPYVHKC2fuy16WFxqadPVZJs0mX2cAvaxFpj+jDmj6Cy8ajnxlvMiYt5gbGn9KeA1hHaS2Ed0Ycm3SVsEXDdPfnSbY86LhK2Krw8F35mT4yAH+CPIIzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUTkfWAD22RVrFBEAykbTI2oQkOfwnst1rJRi4WwIc0=;
 b=lWPI25bp+svqqzUzKd6HIAH9sz2fsOILTu7ZnV7Xnm3YIIQv5JRk/Z+kvU2qHXhEAIpWWqfnQvvIMm5fgbLdMC1R2CLn6K/rxQXB8n+FPPTNWl8e+NPaOaFw0K6qQyxS7Kb3G+JP93rg8yAS2a7HUl0IL8sOoH5+2Tg42A7w8BQMR7bqCNuM9g/xh+yY7EhG/xpAWbUyd1WS2/rkpB98zCpkr0t1h6qbZHrobyKnj7cKjAAHozvzzqEnGU/yRkutLJjzEZR88rnTkslwZb5HBdNCb8N5LNe/fEB7r6gWzvYdTcrvo4fcB6AB9s62v7WX7DD1w6kYtCHMIoVTZ4jtRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB7176.namprd11.prod.outlook.com (2603:10b6:208:418::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.13; Tue, 27 Feb
 2024 00:06:17 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7339.023; Tue, 27 Feb 2024
 00:06:17 +0000
Message-ID: <7f88ef24-b1a5-4396-af7f-f61bc174c053@intel.com>
Date: Mon, 26 Feb 2024 16:06:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/i915/guc: Enable Wa_14019159160
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240104180541.2966374-1-John.C.Harrison@Intel.com>
 <20240104180541.2966374-4-John.C.Harrison@Intel.com>
 <c60e319a-e328-482a-a89d-7d55003306a3@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <c60e319a-e328-482a-a89d-7d55003306a3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ab36a9-e9a8-4498-4f4f-08dc3727eb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlkLgUKyI4f9ZLKTYAKtwb9zPTkaNdunzDB0xqRLQ+cIJQL8wnvYWT2Uktwa8gdAYb9IiM6/o0WTvy3UGuiv9UHuww8aeDMWeAO3XZmO+H2svNuzktMEGFp+freMYac1hv1QKnd5JzOuwHUqMvrgBgvxzzBAKs1uM0OkPU2X1l7YzQQ15nTSfmdvE7PWWSeCTi/6IUCi14CrRG+3Oipu4TW/jFKhLmZm6sYq4rkQYYAYvlajNJtn8MPy1Oci5b+dWL/OicI059YBmWSDi6zfi5I6Ou1U/LFOWief5wOP/ahTHPRi6a7/7uWoqMCdriyhXu7IiNnUMZlN8OjBw+TGv0x6LaO+3Yz9dYngevDLlDMoa1PVZuI5qdtQ7QCKUyIU3DvyC4q2UjoHpX5Ny1D61JPzfBveaaGuDfclZwBuexeAsE51yjCeal8Lm8s1j3R2/HK8zZmnJ2rg6aVbt2plh5OT9zZ4A3lj3gweZSRKQ8ckDJ5RfIsSTUhjbCTAExT2qsuyYnd0nKGg6qdpZq8DUzG5IaG69Ie4BhhboRRVr5VtXC6DupOTFg/70h5ix5JvGGeWT3KFHo2VL3Fb29NpdjcRzjF3VUlBm9bzkSWIzvKVqfVXSSfrGlOFTa2csFIm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amtGT3hHU1oxTmZKYm1Ya1RvOEwyNlNLdWlWL2Z6TDdxVVZRQ293blU3a25r?=
 =?utf-8?B?YUtocWYrNTVXUEdBYlRBZlBvSnVLdE11MHJIVHRpRnJEekNNbXBZeXEzUUZ5?=
 =?utf-8?B?NEhLWUFLZEh0VTRGUzZGbjRZajFReU52bmordmpFalh6ZG43UEZ4YktybHpX?=
 =?utf-8?B?OXdaT0haeXU2bzlMUzB2U0g5WDlmeUhkK2hyOHNhNzJqRForV2g0U1RMN1g3?=
 =?utf-8?B?bTRuaFNGUXUrc0FkQ2x1UE5LTDBkL0dWTG5WWE9SeXZTTDA3NTFCVXZjTXpu?=
 =?utf-8?B?RjQ4RlR6Tm52czBYbTY3K21ETGNrT1drZzBNQ3N4TW1UWkNzVm9BL2VjVXpB?=
 =?utf-8?B?QjllVTlCU3IybkI1UldRRk92VXZkOHNWbW5jekcxNmVQa3V0cFRyS3YyWnB1?=
 =?utf-8?B?SjFvOWdMeDd3eXI2V05vN0Y3ZXRTMExlcjczb1luME5zOVdOVnZaTmptblNh?=
 =?utf-8?B?RCtWRmtPTHZzM2NscXg3QzQzYXB1ZmFWLzRTRXArSHRNS2JxdHR3dkVBdC9C?=
 =?utf-8?B?eG5oWEw2M1Vib0xsa1VmSVNBa1c4UjNZUmw0bjRHUzJwRGkzZ09GZ0NZcVJJ?=
 =?utf-8?B?emc3TkpITzBESFVzdUY0OFZHNUhNMGc5ZjdYeUtaNkNMYko5SkhOL1h6eWRm?=
 =?utf-8?B?RXBEU1pZZzdSaUI3VWh5Mis2ampnc1pncDM5YkozZS9OcWk5YWtReXhYNFhD?=
 =?utf-8?B?eEFRcnlIcUJTclJIRFdlWDg4NFJCNC9teU5UYmhiZmR4dXhZSmNJSDVFZTJF?=
 =?utf-8?B?b1pHS2Z5UXB6WEFRa2xNMDR5QnlCZkJEbE1NSW9iVnM0Ky82QWVOVlFCR01T?=
 =?utf-8?B?MENQSVlmRnhYMkdUc0VTQ1RrNGZWY0dBQnJwZVQxeVpCZE9OZW5YTHdCQXRz?=
 =?utf-8?B?MytTUnQ5MlpMMlBhL0gzbjJQYkprRzZoaWNqNkZQSDJhNlArRElIbW8wQ0ZZ?=
 =?utf-8?B?STB6VlV0cEVsZ2RkZG9SNHBndlhpdHBUNGdDdi9MSi9xTEF2ZWw2bWJ1Y0pn?=
 =?utf-8?B?NmJ4Mmg0ZGN2cktCNUVFNjh3NVZJQjhqanJhUWpGMVFreDlWVStlcktibEZO?=
 =?utf-8?B?MldSa0J3ZG9vWW1ueUFrWXh5Q2FERUZpb2ZKaHJVb0RhZTArZTBVT29WMkJF?=
 =?utf-8?B?cHlRNmNGMmlDOVlZTHc1Z2dxUTRoMnZBcGtrRHhycmlLMVpFN0dWSkw3TXI1?=
 =?utf-8?B?K0d2YkpCZWtvYzdITldiK2NPQWxZbzBoM3Vmc2NoUHk1dkdxQk5JWHBqMFdU?=
 =?utf-8?B?QVFnU0c0YWRPRCt1VlNaNEw0Q2VQL2k5U2ZUTDgxdHhhaGdud2ZEdEwreFRa?=
 =?utf-8?B?YWtIQ0MrRkZ4WXNyOUJDdkoxRWJWWXg2RnQ1Qm1TMGgzYjQ3MVhoNmJaK0Jk?=
 =?utf-8?B?MW04bWxNREM5djVyVStGWjZpdzBNRkIxVjRoNzgxMjE2cnRhaWNKejl5OVk5?=
 =?utf-8?B?TGd3NVNZc2ZWcU93eXphL015MDdKQ3hvb2VlY3V6anFJOG5kWDN4alNpa1BC?=
 =?utf-8?B?WHJ1VjJLeHgxTWZNNjBRVDNXVG1WdWd3QW9UWjRHL1Q1MS9HYXFBYUxjZno5?=
 =?utf-8?B?M1l3aUFZdzgwUnIzVXhTdXpCR3RBYUI1MzhodDBKTUw2Ykd3b3VzZ3ZTd3BR?=
 =?utf-8?B?c0VmMUFDU2pTMVJwdWt6QmsrUDdSWWF5Q1o0UHpINjltYmRpZlowMXRBMlJ3?=
 =?utf-8?B?SnY4bTBnYlAzVXVSUVRmUVp0STlBbTNjU3hxdWFwdnlVaS9jQXBNeFN3bnA1?=
 =?utf-8?B?QUZzV2pyVGhjL0pOK0dJclVYZ0dzdU9GNElDa29LcUxzaytYVWg1cjVRU3lL?=
 =?utf-8?B?M1hSUi9YK3ZSUDVWSmZHU3crTlM3NTZWNmxyWkVyL0RXNG52d0tUSEV5cEU0?=
 =?utf-8?B?cGR4VDExNzVPbTJVMEVxUzUzbUFVSzJFOFZNTnJqWVdnVWs1eHFXbXVtaGJL?=
 =?utf-8?B?SXJ0blpyMmowUDFOd1QxRVd4N1dSNjRndE1XV1BwV25OQWp6ZGtNRUdQRHk0?=
 =?utf-8?B?RG8rbTlGa3ZCL3o1SWdla3R2Q0ZmSE5ncUVFOWN5b05mSXNodlBiZFk4ZVdq?=
 =?utf-8?B?Y0FPZWcxRVFsRmZERzM1Z2tZYzRybC9rZHppVll5VXhDWGR1T1RhS0p5QlJo?=
 =?utf-8?B?UWd6bENJTFQ5dWw0U1BwdkpFNkJWK2dLVGhCazBvbVdoUlNjUnVVSmlld1F3?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ab36a9-e9a8-4498-4f4f-08dc3727eb6a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 00:06:17.4369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIb+YFYLeMazqvZf6pczowd2W5PgTV7bjkv3sfe2SNQWDs3TLYJsL+b0WxAzp7mLcZL3EZ4x+GzmX1woNJEaaeSIs8x2TsXFu5THOkx9QeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7176
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

On 2/26/2024 05:25, Nilawar, Badal wrote:
> Hi John,
>
> On 04-01-2024 23:35, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Use the new w/a KLV support to enable a MTL w/a. Note, this w/a is a
>> super-set of Wa_16019325821, so requires turning that one as well as
>> setting the new flag for Wa_14019159160 itself.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |  3 ++
>>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  1 +
>>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 34 ++++++++++++++-----
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  1 +
>>   6 files changed, 38 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> index 9cccd60a5c41d..359b21fb02ab2 100644
>> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>> @@ -744,6 +744,7 @@ static u32 *gen12_emit_preempt_busywait(struct 
>> i915_request *rq, u32 *cs)
>>     /* Wa_14014475959:dg2 */
>>   /* Wa_16019325821 */
>> +/* Wa_14019159160 */
>>   #define HOLD_SWITCHOUT_SEMAPHORE_PPHWSP_OFFSET    0x540
>>   static u32 hold_switchout_semaphore_offset(struct i915_request *rq)
>>   {
>> @@ -753,6 +754,7 @@ static u32 hold_switchout_semaphore_offset(struct 
>> i915_request *rq)
>>     /* Wa_14014475959:dg2 */
>>   /* Wa_16019325821 */
>> +/* Wa_14019159160 */
>>   static u32 *hold_switchout_emit_wa_busywait(struct i915_request 
>> *rq, u32 *cs)
>>   {
>>       int i;
>> @@ -793,6 +795,7 @@ gen12_emit_fini_breadcrumb_tail(struct 
>> i915_request *rq, u32 *cs)
>>         /* Wa_14014475959:dg2 */
>>       /* Wa_16019325821 */
>> +    /* Wa_14019159160 */
>>       if (intel_engine_uses_wa_hold_switchout(rq->engine))
>>           cs = hold_switchout_emit_wa_busywait(rq, cs);
>>   diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> index b519812ba120d..ba55c059063db 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>> @@ -697,6 +697,7 @@ intel_engine_has_relative_mmio(const struct 
>> intel_engine_cs * const engine)
>>     /* Wa_14014475959:dg2 */
>>   /* Wa_16019325821 */
>> +/* Wa_14019159160 */
>>   static inline bool
>>   intel_engine_uses_wa_hold_switchout(struct intel_engine_cs *engine)
>>   {
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> index 58012edd4eb0e..bebf28e3c4794 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> @@ -101,4 +101,11 @@ enum {
>>       GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>>   };
>>   +/*
>> + * Workaround keys:
>> + */
>> +enum {
>> +    GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE                = 0x9001,
>> +};
>> +
>>   #endif /* _ABI_GUC_KLVS_ABI_H */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index d5c856be31491..db3cb628f40dc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -295,6 +295,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>>           flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>>         /* Wa_16019325821 */
>> +    /* Wa_14019159160 */
>>       if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>>           flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index 6af3fa8b92e34..68d9e277eca8b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -815,6 +815,25 @@ guc_capture_prep_lists(struct intel_guc *guc)
>>       return PAGE_ALIGN(total_size);
>>   }
>>   +/* Wa_14019159160 */
>> +static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 
>> remain)
>> +{
> How about making this function generic by passing KLV id as arg?
At this point, there is only one KLV supported. So there is no advantage 
to making the code more complex.

The next patch in the series (not yet posted because this one was not 
supposed to be taking so long to get through CI and merged!) adds 
support for another KLV which is similarly zero length. At that point, 
the helper function is updated to become more generic.

John.

>> +    u32 size;
>> +    u32 klv_entry[] = {
>> +        /* 16:16 key/length */
>> +        FIELD_PREP(GUC_KLV_0_KEY, 
>> GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
>> +        FIELD_PREP(GUC_KLV_0_LEN, 0),
>> +        /* 0 dwords data */
>> +    };
>> +
>> +    size = sizeof(klv_entry);
>> +    GEM_BUG_ON(remain < size);
>> +
>> +    iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
> Otherwise preparing and adding klv entry can be wrapped in generic 
> function.
>
> Regards,
> Badal
>> +
>> +    return size;
>> +}
>> +
>>   static void guc_waklv_init(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> @@ -830,15 +849,12 @@ static void guc_waklv_init(struct intel_guc *guc)
>>       offset = guc_ads_waklv_offset(guc);
>>       remain = guc_ads_waklv_size(guc);
>>   -    /*
>> -     * Add workarounds here:
>> -     *
>> -     * if (want_wa_<name>) {
>> -     *    size = guc_waklv_<name>(guc, offset, remain);
>> -     *    offset += size;
>> -     *    remain -= size;
>> -     * }
>> -     */
>> +    /* Wa_14019159160 */
>> +    if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
>> +        size = guc_waklv_ra_mode(guc, offset, remain);
>> +        offset += size;
>> +        remain -= size;
>> +    }
>>         size = guc_ads_waklv_size(guc) - remain;
>>       if (!size)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index b09b97c9cd120..80da3573706fa 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -4385,6 +4385,7 @@ static void guc_default_vfuncs(struct 
>> intel_engine_cs *engine)
>>               engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
>>         /* Wa_16019325821 */
>> +    /* Wa_14019159160 */
>>       if ((engine->class == COMPUTE_CLASS || engine->class == 
>> RENDER_CLASS) &&
>>           IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 
>> 71)))
>>           engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;

