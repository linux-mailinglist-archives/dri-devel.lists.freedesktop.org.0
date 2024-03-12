Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1071879FC2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 00:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F8110E966;
	Tue, 12 Mar 2024 23:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlPxU8Lb";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55C10E966;
 Tue, 12 Mar 2024 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710286994; x=1741822994;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0/381i7KUEQSdOn2CvIvaPIfmuRoNcVHd4UA7+NhQE=;
 b=VlPxU8Lb34pbH3InY1TU+U+Hj5oz0MjFpXDBjqVACXvokH5Ns5GQuIDh
 0xqsZXyx+dEZXD5Sn7JNt+TkXBTPNrksDuS1J6I/CBsHBJg1mUBLJBMdt
 4mH70VsUf6LqV/ePC9tp0oA86OJxwZ1rRSQo8yG5FLc+ISdttBTYd9tCs
 hJk8j3QBeNCNx1r8PBzVdFNd1Oi4TV5SGhYPEvSCy/ifKAKL7RlARw5s0
 Xpv+yyLiZthCDKf4EDD4Xavkt0ZoxyQQbtq5kMGUC8jIO6d495n81antF
 ZAfpdNYpVQ8Im5KBWAvbqvuMS7ZzBcf30/DtM9Dc7HxElgaxxptQJAW1V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22482315"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22482315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 16:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16304646"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 16:43:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 16:43:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 16:43:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 16:43:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0NIYWdpo1si9lPZm8phEfdHD5uazYeEtQnna+BN66uT0LiBaneSlrR0rd6435wSA+0oeg7ZRo9Ugq/p3vl0qC5wXSf5H0tWba7LGEDf7rOOqJkLNEdiPRfVdHfha2iXGxQMlobv8A59VxK7DEWoTFP6UpAIyUKK8T6H7Imv6RM1UBkmx5x5aNUnHnNRM1+EgUIDqIqHI6aSqWUlFq93LGO1YhtfrY/Q+hdIbYj7yy9qtRNuPul7bKgYa3+TetTFa0TxQkbNbIrH/iGowoqYi4Zyu+SP8SFhBttpj9qqv+/RQqtHw3QQl1DqX47zynTd9C3T66Ov0hbarNTXv8C20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxQfiUejm2QbHfphkc72xSkCYay2nNv10fXE9hSUllg=;
 b=VAAjgIHlBzygIoT0mRTF622GQ4VcM/dVzuydwG7KR8ewC89RQ2mQ2eIm3MYj2sQIY5p4L8YSfWyjHTkqq8JSSIqraWbxQvm1CayLdTGZOrw7tFgegfuv4OFKRZmQEgoHwNypvF4Yy9lo+n+jNOOtxfT5XYc0Xve6uTcgQmrdd/AiynzV6F5ndreFGwGb2aFYhZRO1MxHnstPgHSjL2I+40Q8xHJ/gX2/sH5ev+StFLHta5umiGk1aY+0oGPBKKlfutjw2GW1BjuLTbsCX9IXGU7vUonSdJDLBNbd38oCX6kKMgSS9C+hl/2iL9MHIGvjhX6VsNS8DZMIKENfjRh5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 23:43:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 23:43:09 +0000
Message-ID: <5d68e959-7c4f-44ec-94b4-51489f3dfdc7@intel.com>
Date: Tue, 12 Mar 2024 16:43:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/guc: Update w/a 14019159160
To: Matt Roper <matthew.d.roper@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
References: <20240308020129.728799-1-John.C.Harrison@Intel.com>
 <20240312162449.GH718896@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240312162449.GH718896@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0108.namprd03.prod.outlook.com
 (2603:10b6:a03:333::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: ba29a63c-840f-4458-7772-08dc42ee2c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUnKEAj9al1baPjZH4KPMKcvZ7oyoBVsmpTz9PL5tr2i49gHNBmzRZdYNk1uxxq4+UMDnk0pf7eH8geqrPKsSQy42mZdTnydMDmVsC9q9ce1hqMrk1TTIOrQ2NYFOqf2b8vk6RflqDQzB+bIt1yUiiS+BdrZfOnjukQtPh2+gpt9m5wJ81SbKb/Qd7zeBpmsp/DZJnuqGuKHw0+S9SncddNvedDNn4uOQdSomR0Z9Llc9cLiEjqBA09uY7nMuOgknRXelvKkVxFp9NR8GmOokQP/+XceZ6CLzFroVpE0VilBqlg/iLDZbiLIt5ucbaXjvfGm+kF8BWkueB1YM89YtyaXxxwKeXApbVH2r3JcmeNIRODfSsAYMQH0MtWVQ1eUGOgNvagU1lkM7cAsb7f1bR0p08PWXn8nPb4BhAt7h5bqcylgcA3e5S+ra1VJmISDvYLrpAJNzXe7LQNgqqW6gu7mnB6RAZwEy+WjzgxRt97qIUmddinm1uKgHb4NKsybXbuMsw0xvCHbPeAOCNLmvQWWOhwHNvjUEtuFKNVADelwth6j5SZ+eG7Z6yD9KEkX+wKIAaJbmBCieIt9l6Hxxf1miWUsFfQQLT5VFq7jGmyLGbtQMNNPgSftD3gHv3p/Hvi7To1E9pX225eXcYKf21ExJFLONt2KvJmofxyycV4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVQQVg4SnlPUm15bWxGU3FucTNUNWZMem95ODF0d3MvbEdmRSsxeVJxVC84?=
 =?utf-8?B?SnNqUCtNQzZ2dCtnOWFONld5cERnbHZxRWthK1J6SStadmMvcHVaVmQ1cnZ4?=
 =?utf-8?B?b1BvbHhzZE9YOHJzNUk4UkR5VjFlaGh4VlBTNHZqMUltOEo3V0ZmY282VzZU?=
 =?utf-8?B?N2N6NlBVZWd1N0RoU1BGQUJrWGplYVBpUXJCdlZvNS9ncHpQeEF3TUx3SVcr?=
 =?utf-8?B?bTRiZnB2ZkhSVmZ1WUdsWld1MlVYZVh2UzZKbDRValgzSm1MbjZBV1dIeU11?=
 =?utf-8?B?NjZwdlIxeDRwaUdpYXNodGUvMzFubTNLa1puY05RRkIyTVdOU3FJNFlXKzh1?=
 =?utf-8?B?N1Y2dW1PODBtMEZMd0tiM1dlbTYrbzhlRlM3dk4vaWZiQnVaZVJrMFpXRlZ5?=
 =?utf-8?B?ZWx4aFlIMzVLNHlFK2VveGd5bW9XVklxU1VsdGo0QVk4c0QvTFB1MWtMV3hJ?=
 =?utf-8?B?b1FGNWdWMTRwQW9wOHppMlRYaUIxb29zNUREUUJYdU91cEppdDQ1NkRzK1lR?=
 =?utf-8?B?N0E2VmZkOFJPWUJtd3BqL2RibllzNEdTaEZac3JTN0pBZmF0V2pDWmxlUks5?=
 =?utf-8?B?ZndiQTlZR3BVYTQyVlVIaGlpc0xMUlN6cHY0ZS8yaWpVZ3ZGSTdUam1IQlNw?=
 =?utf-8?B?MGhKMkN5c1R6SFphSHBSS2p0Q28yQ1VhRnFiV2Z2bGR4SGR4TzFXamt4VzBI?=
 =?utf-8?B?aHIyOWpMNE13NS8xVUdqTzFpRldFbkVTNXFWUUlIL2VRa3dhUWo2L0tGRjls?=
 =?utf-8?B?UlF1N0toSWFqeWNQS2JVNEZtS3lWOGgyVVR2Uks2VGd5R3p5MmQyM1E2cDNL?=
 =?utf-8?B?OHQ4ODdLZjdoZEZpcUN0TGw5b0Q0emJzaUFlNEtWNTZwb1dHckdMOGh6RWpt?=
 =?utf-8?B?VFIzNUNCVUtlQlQzQUxlRXVHSSt0b2szZmM3TFRZY3B1cWlOM1orTTBUUFpi?=
 =?utf-8?B?OVZlOWhXWktBZDBadjIxRzQvSGozL1M4RkJUY252VFJlUFFpalhHdGIvWm8x?=
 =?utf-8?B?eEsrdC9TZjh6blVpdHdseE1NSnNzN0lEN0hVZjhmMy9aU2JHcWZqeWhRVDNp?=
 =?utf-8?B?UFRESnc5cDhQY1h1ejMzM3liMUc0YWhOSHA2SVRvalJaejRuTDZmM3VTTmlG?=
 =?utf-8?B?NEU0cW1GcjN0OTQzektmbTRiN2tCK1dVUDFaK3pQaUJjT1lSWE9NcWRZSldt?=
 =?utf-8?B?LzZyMUNRZlU4Zk0xQVVieHlNR2krRm80RnViVjMxN2wzc3JjcXNKaFZjaXda?=
 =?utf-8?B?VEhOeWhOenNZa09NVlQrRnJOc0dvZUdETDRpMGVJanI0UHdXbVAvUjUrbnds?=
 =?utf-8?B?cEJsSFIzQUhqVy9iU3hha01OSHRoeUhLOE9OL2RmcktIUzhvUXFqRVpjc2w5?=
 =?utf-8?B?RUxVVVl0THluYWJhRjJ3eW0rR29FNENwK1VGOUM1bllwU1VaZzAxOUl3MnpL?=
 =?utf-8?B?VEpROTYwSXdjcytHWm1lc0JUUmNsNWFvY0VkUFFEcXM4dm83VG91RjRQdkoy?=
 =?utf-8?B?L3d4a0o5SjNQMnUrdXNsaUkzMnBaajR0NVhyQkE1U3V4ekN1cVhDVGJMczNa?=
 =?utf-8?B?ZHh6czRhYVdQNFp6amNiMnUwbUtVeEY1a0hYTytLbE5pS0w0OVkwemhRMFE5?=
 =?utf-8?B?UzUzd2Jzelk1aFdiVEk1aHI4QktFRXFIc1dRY3g4TkwrZk9LeDVEV3JsYnpQ?=
 =?utf-8?B?UjAxcFNLWHNDZlZwZWUzckJtMVhWRjBXMU5Zb1N4dG8zNENxQVhSMC80eWhj?=
 =?utf-8?B?U0xnMldja1hnL0t3Qy92WktLMGdQYzUzQWc2aDdXY2FqV1FMT2E0dVdUVXRD?=
 =?utf-8?B?VHByamU1S2piU0tqSk1RZWZtRG1BeGdrOFdiR0FkVXdpaHNQQ3hQRnFyRlAv?=
 =?utf-8?B?ZHJJbFpYNG5USGJJSklxNjNQd1hkeHREZStWcUs4ZndRZmlUcVdGUmZoQ3V4?=
 =?utf-8?B?SjJ6bWp2WDlNcmRNNm1sQkp0VWZwbEM1Slloa0hPQVdUT1pRRDYySHpHT0o5?=
 =?utf-8?B?eVE3ZjI4MStKUGRqNVNPZ2V5NUR3T1ZDOW5hL3NURFJ3UUNLRzBqSXk1cnA2?=
 =?utf-8?B?Q0swLzI3UHNrNzRKNUhVWXhobDE0S1NCTzlJdWFBcXJ3QXNTbFY5Q1VBbXVN?=
 =?utf-8?B?OC9YYkZ3QktDT3k5RStTOGhzV3c5OE5rdUJWeFJsL0o0YUZRclFwcFVVTlBp?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba29a63c-840f-4458-7772-08dc42ee2c4b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 23:43:09.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VW6DEg0tyLckSlY6VOp9mevQgQ41LIYD0+rw+iJnt73G42xhbA/C4Z/GSEdBaJ7JEYnKpsHD63lkUP8MFDECr9yPbERY9WoFrMxK5MiWMm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
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

On 3/12/2024 09:24, Matt Roper wrote:
> On Thu, Mar 07, 2024 at 06:01:29PM -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> An existing workaround has been extended in both platforms affected
>> and implementation complexity.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  3 ++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  3 ++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 21 ++++++++++---------
>>   3 files changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> index bebf28e3c4794..3e7060e859794 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
>> @@ -105,7 +105,8 @@ enum {
>>    * Workaround keys:
>>    */
>>   enum {
>> -	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
>> +	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,	/* Wa_14019159160 */
>> +	GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE			= 0x9006,	/* Wa_14019159160 */
>>   };
>>   
>>   #endif /* _ABI_GUC_KLVS_ABI_H */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 0c67d674c94de..4c3dae98656af 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>>   
>>   	/* Wa_16019325821 */
>>   	/* Wa_14019159160 */
>> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
>> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
>  From what I can see, this workaround is also needed on Xe_LPG+ (12.74)
Isn't that an Xe platform? Or is 12.74 just ARL?

John.

> now.
>
>
> Matt
>
>> +	    IS_DG2(gt->i915))
>>   		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
>>   
>>   	/*
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index 5c9908b56616e..00fe3c21a9b1c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
>>   	return PAGE_ALIGN(total_size);
>>   }
>>   
>> -/* Wa_14019159160 */
>> -static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
>> +static void guc_waklv_enable_simple(struct intel_guc *guc, u32 *offset, u32 *remain, u32 klv_id)
>>   {
>>   	u32 size;
>>   	u32 klv_entry[] = {
>>   		/* 16:16 key/length */
>> -		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
>> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>>   		FIELD_PREP(GUC_KLV_0_LEN, 0),
>>   		/* 0 dwords data */
>>   	};
>>   
>>   	size = sizeof(klv_entry);
>> -	GEM_BUG_ON(remain < size);
>> +	GEM_BUG_ON(*remain < size);
>>   
>> -	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
>> +	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
>>   
>> -	return size;
>> +	*offset += size;
>> +	*remain -= size;
>>   }
>>   
>>   static void guc_waklv_init(struct intel_guc *guc)
>> @@ -850,10 +850,11 @@ static void guc_waklv_init(struct intel_guc *guc)
>>   	remain = guc_ads_waklv_size(guc);
>>   
>>   	/* Wa_14019159160 */
>> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
>> -		size = guc_waklv_ra_mode(guc, offset, remain);
>> -		offset += size;
>> -		remain -= size;
>> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) || IS_DG2(gt->i915)) {
>> +		guc_waklv_enable_simple(guc, &offset, &remain,
>> +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE);
>> +		guc_waklv_enable_simple(guc, &offset, &remain,
>> +					GUC_WORKAROUND_KLV_AVOID_GFX_CLEAR_WHILE_ACTIVE);
>>   	}
>>   
>>   	size = guc_ads_waklv_size(guc) - remain;
>> -- 
>> 2.43.0
>>

