Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB19601F1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 08:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCE510E282;
	Tue, 27 Aug 2024 06:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DDQi5Tjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68010E278;
 Tue, 27 Aug 2024 06:38:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyj26XYCyMev8XLGlmSg9aLodOsaijxA9DwPiygC06+pB09Nut8BCgIXXRvmUiCv3bFMGriyYIGQbRGtVv1CBKrgF/vWRwkRdg0ejBj6aLjjGkyIUDISqpXvwoBH8hCPvZvzUNRv5tuDobE2xHGAcZKfqVue7crzL/XMtOoszZR1MhrT6LLOGHjgsOvWcC6jSRHDi6l3hhk0K+1mVoC9CT9u/U97/GYXsVsDxjZjzHwIbYQ0nBn/P1jm99q0Yn2nEJZabx7gmFmFQg1CZ8Uf1xUJrJ3REhT2NaOxjV58BxYsSyjK2fRbIINOK7r4JvOW5WjF+3Tds+4r9wIAroMedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9HQOsRYpQxIkM68swOkZ28NLpa3PKT7ZTVig3yUNq4=;
 b=bjwEutq2Z0sfKpQjI6B9W7iSfcu1EOpQkJaUYwJ9bF2scUtnkRPqhd9Hif49BgbawdBKmAIddoOvxJ4Iz0RqDgO4wv1wVNPi9kVs+mYwndxO7pJclyyMD92iXMdVClhXiimTwMWoFM1Ba4wDipVGcHR0t5gMIfnuPnyfx2eopQR3ZXU/cevppWazlVy5OB1f2k0Z4nHuFaCPebmj7ceZDVhqXqVZpmCz8uzTAow94Cdb9ZEoymTe2BOoXr/bo1RZy219sBvzxZvpCSR3XUpIXo7Zh+/Ks8kZlcZsjriVMfuzQXAAKyr//mhppcVAjNDeeK7F+yO0kU/KrIC0g3Fhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9HQOsRYpQxIkM68swOkZ28NLpa3PKT7ZTVig3yUNq4=;
 b=DDQi5Tjv4Da8ybFRWNrbRcZyKeveDpgeAjtGq131Ys/xNvxUVe5/T8EgkRMEJAmYTLVYUto6fukZYazleM1AlOt6fuPr+Ns7/hq6vgK1WLUz0ngxBLtmyUYhDDBrdYRWEUk4bv0L/JLwilV83qg2VnOP0qk65RisBPxFgrin0t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 06:38:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 06:38:01 +0000
Message-ID: <52a68584-daee-4415-8ea0-7ebc737f8e10@amd.com>
Date: Tue, 27 Aug 2024 08:37:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dma-buf: Split out dma fence array create into
 alloc and arm functions
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 sumit.semwal@linaro.org
References: <20240826170144.2492062-1-matthew.brost@intel.com>
 <20240826170144.2492062-2-matthew.brost@intel.com>
 <aebe8cee-8674-42f0-b112-439da1ef7073@amd.com>
 <ZszWJaX9I3sh5jxZ@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZszWJaX9I3sh5jxZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bd1b82-90f1-454f-c1bb-08dcc662cc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGN6ZHFOYXdtZ3BTNE5waUdYRTV6SUJBQ2dmN3ByOHhqUEE0RlkvZDZhN0xh?=
 =?utf-8?B?ZnBla25GUU5LWW1nWmVRbWFlZkx3SlpwSEpmNUcrMC9mU05WdHQzR0JEOERz?=
 =?utf-8?B?LzhSVkhPY2xLeXd0dDZIVTVxd3l2TnpwWXFDMm9PdHBnYTN5QzBRa2JUK1Jl?=
 =?utf-8?B?cTh6SnhyUUU5K0RwUzQ4ellIb0FmbGJ1V3p2QXhlYjNWR1VjSFdtY29pMDZs?=
 =?utf-8?B?TDZZOXRJWDNaMzdLNHhyczZidW03ZG1oeno1NmlPQ0hoK0dPckxKWEdiSEhu?=
 =?utf-8?B?L1dpQ3lHSHBuTTBuNWJ3ZG91aXVheG1hNDh1ODRUT3pxUTJaZkpyK0t3MXFH?=
 =?utf-8?B?b084RDF1ejd4anNhck8wOW94T2lKQXk1SHQ4cTZ1cTQzUXp6ZERGSUV1RmNB?=
 =?utf-8?B?cVBpckdHdXhmSkllNmZpa3JMR2w1VHdYd0lQcWhTWG0zWnh3UkpPS0Q1aitk?=
 =?utf-8?B?TGhXdlkyU0FMY2swS3ZCM3BoYVlLRGxmTnh0OTBXYzdTemtndU84b001dXZo?=
 =?utf-8?B?cFpJMHAySjJjSTVRRTJsbVFQT2krT1I1MG9DTkduc1EwZVBIWko2TW92aWcv?=
 =?utf-8?B?TzAvYkZRZVRxRHFWOUlGTm5sR29qdnNRdDk5eWUvUUIzQ3hzaUZVdGFrVHZ1?=
 =?utf-8?B?VGFGNnZDMlFmWnk0T1pjY0ZXeFRZRjdmRkNZbXp2bEp6cS9nREdyUVcvV3Bz?=
 =?utf-8?B?Z2NTYm8wZkV2VUI3Sm5IZUJ0dnpkdDBqU3VKckErQlp6Rjg3aEJHRkUzQVp2?=
 =?utf-8?B?ZEVMSUcvVkVLbzZaTjlFNFllVmVpQ0JhY0xsdE0rTko1Q2IzV0tGamhEa0NF?=
 =?utf-8?B?b0s4Z0NNT3ZwZnJCZU95UkE0RkNkb3llMlZQTk9UcDVVY1d2dVBxQlQ4RTQ5?=
 =?utf-8?B?V3IzenlyOTUva0FIN1ZTQzNzeWIrY0phRVpzb1M0ZE5ueDZDcFliejIzQWNW?=
 =?utf-8?B?bmVHSlJtRUp6ck9oV2MyeUsvT1VKeFk1S2dWYVpzcHkzakVrblcvME9MNldu?=
 =?utf-8?B?MXNteHRvMkhLWVVwWXQ0TzRnZ3pkdWdwdU13L0Jya2hnc2JtUHRMcDVVS3lw?=
 =?utf-8?B?ak5zd3QxcmpoSmxURFBaaGZ0dFdOUG80NFVhTUFwSlR0WTA4cGh0Z0VGd2Ft?=
 =?utf-8?B?Y1BEV3lpcnpIZ1lZZFNYNFdhSEIzY3JsMHltM1J0YjFuSmlNTWpmZFVaWW5J?=
 =?utf-8?B?Z291VUoyNlNKQVRydVFvSmNmZHpHMlhTQ3lGMmU2OGVpNy85VnBJdEgrdEY0?=
 =?utf-8?B?eUVVclBXeGF4ek1RZEJwS1ZZajcrVDlKcWxPV3pTTmQrTXlxWXBpZ1lhUzdx?=
 =?utf-8?B?NnkyaG5nSFE2MDJoSmtXaEJtTXdpUEt3eVErQ3hybzRlcVpXY0liRjgyTnh5?=
 =?utf-8?B?MWxHc25VU2tRRWU0Y0xrMk4weUhLSHRmc2NjbHVrcjJPOUtjT3MySFVOcmps?=
 =?utf-8?B?T09pNDZINk9rZ3FyQWtLbjRjRUJtb3Rnek5MczRuWW1yS2NZS3JDaUJqVy8r?=
 =?utf-8?B?NXFXenlEWThRQVFXRFJKbTZwbzhIWlY5bnQ4Q0hxUzAvZFFZcUh3ci9XSU9t?=
 =?utf-8?B?cSs1THBDbzdvMzd4QVBxN3NybTkxZUlBQmtWZU5YaGFRMUNDTElRd2JYb3lq?=
 =?utf-8?B?bWY4TVJkR0tqdkxWRTZiQUNvSkpaT0VIOWd0WTNPWm5CUVZndU5iU2hjMHJi?=
 =?utf-8?B?Z3phWlFySDJpNjRKcHR1ZlJWeUI4ekQ1UGJWU2l4NVpQZU1PVWU5ZDdtbGh2?=
 =?utf-8?B?SjF1NlpjRUJIdlFIOXNGM3VSMkhFNjlJTTR0NmZ3Sk1BTUlEVjdmR09aYmJK?=
 =?utf-8?B?U2lNZy9RRDBrWFk4WDZLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG92cDc5MWNNYThESFNjdDQybEpWRkJTMTA4VjBnK0hwWDZCVFVOaUljK1pK?=
 =?utf-8?B?MW8rZkM1d0laajdzZ1RuOFZCRHdWSExtVFdxTTIyUkh0MFgrMmtzTEN3MUVC?=
 =?utf-8?B?OC9YK1pyYnVmSVE4ZkdGc1doaVdEbXVhRmNveDNmNDJVZHU4enk2d0ZHYzZL?=
 =?utf-8?B?VEZidUNNMXozUXpNaEdVc3dyNng0SFcyZTV3a0kvMzNRSWNJTnZDS2Vqc0dD?=
 =?utf-8?B?N2dKMElRZjU3NlIvYWlQcjJmYUZJTnF5RU9aZVdWazdFVmE2bGdjK2VTYzBs?=
 =?utf-8?B?WkFkTGxUb204QW9tWE9YNXhQSlYza1VCcW0vd3A5NVpTeHg2V3M5TThqWG1I?=
 =?utf-8?B?N29jWGxmSVRpOU90cnBmVklFZzk4WWtEQ2FBQ2d1bGJ1NGJqbUEzQ3Z4V2VV?=
 =?utf-8?B?UnBTbzVLQVJzbUgyZ21LOEVQWlczeEZHVkp6bUtMUWErdnJaRFZzQ0E5dUpo?=
 =?utf-8?B?bzBsWTJxL0pvS1Q0bEVyY0V5Z3R2MjMwVGRDYldDNk81dmhvVzkyR3J5Qlp1?=
 =?utf-8?B?dUtBeGE0Z0hnNE5LcHQyNjA5TXpkUDVzN2ZrZ0pOSmtURGYwWXJhODM1OHFM?=
 =?utf-8?B?UHp3S2VsNWo4SnU4dFFJMnVaNGJ3bTRXZzdyUFBMOEZzMExBVXJwSC9HOGpQ?=
 =?utf-8?B?WVVoMndhelRsLzFUOXVTK1BydldzMjdqNVRReit1WE1mRm1BbGI4c3Nwai9x?=
 =?utf-8?B?SXh2RCtRNmRCUVpIN2xVUjZ3SC9XbWtHQmVoYzc3YmFxRVlWRnI0T3NMeUp5?=
 =?utf-8?B?UW9MeGtvVEJzZElSZ1EwUFlteVgxQWJQQVBLTFRpN0Z5MGQvWldGazM0VjJY?=
 =?utf-8?B?WVdDUGNLUjcvNkJPMDhUN2pwUE04MWI1aFQyeVVsbHdXOWNiWE5saTRMS2Uz?=
 =?utf-8?B?cWVQUlMycUFZUWh1NE1GY25Jd1ViMkhiSy9Gck1KSjQ3akc5WFB2TVZRZyt5?=
 =?utf-8?B?Q0tmSUR0eHdrbzN1WHNINUdFb2RVL3BISlU4Z3hrMWpZZm5KOHAzZkxhZHF1?=
 =?utf-8?B?ZkNrRXkySjRVZk1HVkdUWHgvcWJZak5vMlhVRU44VFJyVWxkcVVKKzE5a2E5?=
 =?utf-8?B?cEQ4THhxd1ByNGppTGVtalAwQS8xZVZTbHlhWURZeDV1TEhyOFU4ZnhwOTNG?=
 =?utf-8?B?YURUKzFUbDRybHl3d3VOeHloVW8yK1hZTGFYWS9LRWhVTy9BR1lwKzdMU3h6?=
 =?utf-8?B?ZDFMQVdnR0NTTU1QdVBlWS9QeFJFdWpkNlIxUVEzcS9PUW84NGdNVk1rbEJh?=
 =?utf-8?B?cVBpd09vamswZ05qejlPaWVLNnYxTC9WcWtNcG5WL0JvYmdwV3p0aFBubDFD?=
 =?utf-8?B?OVJEQ0o1TFhHVmo1T1ZSaThmY08xanNOYjZDZmV3SjN4L2Q5K0JCdzF4dmhV?=
 =?utf-8?B?UmR1L3BmODhzUG16WlpJdE5PZkFodUpBSXhTcDA3UmF2SVJTWjhKaWh6K2J6?=
 =?utf-8?B?bXVEdUt5WHpEWTdDMlFyS1dHRkh2aVFUTTZmNFRVRTJGY3pxdDh0bXArRW1r?=
 =?utf-8?B?QklWY2I4MW56STlaT2hGcUdVOFk5RUt0N0pZa1RublpYV0Q5b0YvUzdseFNH?=
 =?utf-8?B?WEpSU1VKU1RNSUtsK2cxRGU3Z0JnQ0UrZGNCZ1QzcjBSSnhUanVCLzR0OHhD?=
 =?utf-8?B?Z1hmV3BQYzRKeHZ3NXZIRVU5Rld4OG01bGdDUUUxcU4xSnVjeXExS1oveGhL?=
 =?utf-8?B?NXRTbDdrSzRtUmFvVkRvRm40eHhwMWRpQWk3NVZiN0xOSTdNRVE0TXlHZ291?=
 =?utf-8?B?bk83RWNPWG54MGZQeFJxcXF4WW9NVTYwYU9ZK1dsRkFsR0tPcjZydkdoaWJp?=
 =?utf-8?B?T0V1Sk9VTzRIb0NhVUcxRUEvUlhVcWQwYi9RaVZ5M20rOWFJM2hQYVNUV1po?=
 =?utf-8?B?cXVSVWRuZzN1NjJSRjlsazJFU0pQcHZucS8vTUpiVGE0RGRiZW9rdGM1bkE4?=
 =?utf-8?B?Zys3Tk1KZzBoMUE3cnhNRFBQeXQ4ZGpid3RvbjB2MVlBQ1lseHZJM2UyV00v?=
 =?utf-8?B?M2NsRDR3RUg1OEZIUW9CeVhjbkhJYVgwZ294NXVxT2p0NGFlaVdONHJaYk5k?=
 =?utf-8?B?dHBOcStLdXMzRW1kMnRPVlpNckg1R0M3aDRHQmt3UFpGMmVmTTdmemsrem1V?=
 =?utf-8?Q?zbKA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bd1b82-90f1-454f-c1bb-08dcc662cc32
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 06:38:01.5904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7YI1wkgoCRur/yYVdfTcj6hDKAsfVjsSt+QOSKYsZ7Exg9UmLBpGQncn/0/0RuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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

Am 26.08.24 um 21:23 schrieb Matthew Brost:
> On Mon, Aug 26, 2024 at 07:57:07PM +0200, Christian König wrote:
>> Am 26.08.24 um 19:01 schrieb Matthew Brost:
>>> Useful to preallocate dma fence array and then arm in path of reclaim or
>>> a dma fence.
>>>
>>> v2:
>>>    - s/arm/init (Christian)
>>>    - Drop !array warn (Christian)
>>>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thanks for the review.
>
> Unfamilar with the merge flows to dma-buf subsystem. Do you merge this
> into a dma-buf branch that we can then pick up in 6.12?

I can push the patches into drm-misc-next or alternatively you pick them 
up through an XE branch.

The change to the dma_fence_array is small enough that it probably won't 
cause any conflict, so both approaches works for me.

Christian.

>
> Matt
>
>>> ---
>>>    drivers/dma-buf/dma-fence-array.c | 78 ++++++++++++++++++++++---------
>>>    include/linux/dma-fence-array.h   |  6 +++
>>>    2 files changed, 63 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>>> index c74ac197d5fe..0659e6b29b3c 100644
>>> --- a/drivers/dma-buf/dma-fence-array.c
>>> +++ b/drivers/dma-buf/dma-fence-array.c
>>> @@ -144,37 +144,38 @@ const struct dma_fence_ops dma_fence_array_ops = {
>>>    EXPORT_SYMBOL(dma_fence_array_ops);
>>>    /**
>>> - * dma_fence_array_create - Create a custom fence array
>>> + * dma_fence_array_alloc - Allocate a custom fence array
>>> + * @num_fences:		[in]	number of fences to add in the array
>>> + *
>>> + * Return dma fence array on success, NULL on failure
>>> + */
>>> +struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>>> +{
>>> +	struct dma_fence_array *array;
>>> +
>>> +	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_alloc);
>>> +
>>> +/**
>>> + * dma_fence_array_init - Arm a custom fence array
>>> + * @array:		[in]	dma fence array to arm
>>>     * @num_fences:		[in]	number of fences to add in the array
>>>     * @fences:		[in]	array containing the fences
>>>     * @context:		[in]	fence context to use
>>>     * @seqno:		[in]	sequence number to use
>>>     * @signal_on_any:	[in]	signal on any fence in the array
>>>     *
>>> - * Allocate a dma_fence_array object and initialize the base fence with
>>> - * dma_fence_init().
>>> - * In case of error it returns NULL.
>>> - *
>>> - * The caller should allocate the fences array with num_fences size
>>> - * and fill it with the fences it wants to add to the object. Ownership of this
>>> - * array is taken and dma_fence_put() is used on each fence on release.
>>> - *
>>> - * If @signal_on_any is true the fence array signals if any fence in the array
>>> - * signals, otherwise it signals when all fences in the array signal.
>>> + * Implementation of @dma_fence_array_create without allocation. Useful to arm a
>>> + * preallocated dma fence fence in the path of reclaim or dma fence signaling.
>>>     */
>>> -struct dma_fence_array *dma_fence_array_create(int num_fences,
>>> -					       struct dma_fence **fences,
>>> -					       u64 context, unsigned seqno,
>>> -					       bool signal_on_any)
>>> +void dma_fence_array_init(struct dma_fence_array *array,
>>> +			  int num_fences, struct dma_fence **fences,
>>> +			  u64 context, unsigned seqno,
>>> +			  bool signal_on_any)
>>>    {
>>> -	struct dma_fence_array *array;
>>> -
>>>    	WARN_ON(!num_fences || !fences);
>>> -	array = kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
>>> -	if (!array)
>>> -		return NULL;
>>> -
>>>    	array->num_fences = num_fences;
>>>    	spin_lock_init(&array->lock);
>>> @@ -200,6 +201,41 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>    	 */
>>>    	while (num_fences--)
>>>    		WARN_ON(dma_fence_is_container(fences[num_fences]));
>>> +}
>>> +EXPORT_SYMBOL(dma_fence_array_init);
>>> +
>>> +/**
>>> + * dma_fence_array_create - Create a custom fence array
>>> + * @num_fences:		[in]	number of fences to add in the array
>>> + * @fences:		[in]	array containing the fences
>>> + * @context:		[in]	fence context to use
>>> + * @seqno:		[in]	sequence number to use
>>> + * @signal_on_any:	[in]	signal on any fence in the array
>>> + *
>>> + * Allocate a dma_fence_array object and initialize the base fence with
>>> + * dma_fence_init().
>>> + * In case of error it returns NULL.
>>> + *
>>> + * The caller should allocate the fences array with num_fences size
>>> + * and fill it with the fences it wants to add to the object. Ownership of this
>>> + * array is taken and dma_fence_put() is used on each fence on release.
>>> + *
>>> + * If @signal_on_any is true the fence array signals if any fence in the array
>>> + * signals, otherwise it signals when all fences in the array signal.
>>> + */
>>> +struct dma_fence_array *dma_fence_array_create(int num_fences,
>>> +					       struct dma_fence **fences,
>>> +					       u64 context, unsigned seqno,
>>> +					       bool signal_on_any)
>>> +{
>>> +	struct dma_fence_array *array;
>>> +
>>> +	array = dma_fence_array_alloc(num_fences);
>>> +	if (!array)
>>> +		return NULL;
>>> +
>>> +	dma_fence_array_init(array, num_fences, fences,
>>> +			     context, seqno, signal_on_any);
>>>    	return array;
>>>    }
>>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>>> index 29c5650c1038..079b3dec0a16 100644
>>> --- a/include/linux/dma-fence-array.h
>>> +++ b/include/linux/dma-fence-array.h
>>> @@ -79,6 +79,12 @@ to_dma_fence_array(struct dma_fence *fence)
>>>    	for (index = 0, fence = dma_fence_array_first(head); fence;	\
>>>    	     ++(index), fence = dma_fence_array_next(head, index))
>>> +struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>>> +void dma_fence_array_init(struct dma_fence_array *array,
>>> +			  int num_fences, struct dma_fence **fences,
>>> +			  u64 context, unsigned seqno,
>>> +			  bool signal_on_any);
>>> +
>>>    struct dma_fence_array *dma_fence_array_create(int num_fences,
>>>    					       struct dma_fence **fences,
>>>    					       u64 context, unsigned seqno,

