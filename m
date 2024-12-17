Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1A9F47A0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 10:33:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31710E8BB;
	Tue, 17 Dec 2024 09:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K0mMaxz7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8A110E8B5;
 Tue, 17 Dec 2024 09:33:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeiktXRAo4+mtQSPgiTA6K/09erwgIWMm6xScttMT9xym7/PEwexPpVNgZcVnxlIYNpgFE4bVeYw+Hph/34ZQ+5JQE3s/bqMlptRY8RfyAltgFJprStuI2dklKbIMZt8Od3vuLg3JE4d1RbEhfCVMVeAD0ExJXEAWNPlk8PewaWOZOrHWJz4OYuurgVCLjHr2OICuD1lvkLNZQ//V+7GTQ4cWCdW5Bn+VMgrDb85XTUwPqABUoDAb6LV4Ya3clfw6f4pDaY5LKYSBZrmbQ51W4Nj4HZNjKobZ1TXg5krK3WGcWeE2lVfvJxBnL31nVNuFrzy0XmUcXgAPBqzWe4Qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhYTXPFojQmZ9zZZ354AJ/jCl6rzM0UmBxspiaI7YeE=;
 b=TBVR9Gbjoh9uyqH3vyLQq/1bLX69cV73LQ3PH+wObh71ZbNVaFN9/Dg44aRRivBrCNyEVMFR4PV5q9umnMObrhtKthyXhY5ZrVebyb3jauOEfFYdLtGgdS6H5MSVMjc6FXBdkvHnuiNSpItNQF+EQvWLSphZgF8U+M3WoFYEV7IOgRlVzTf2vp1wmn/ZbQ3Yi4U4RefWGUne7kf6I5lhLEAezqMeDcg+kRoiUUZPq5pmPKinQKL00ln2pwkBJ/UI2bZVd1ZiqiDC89fYzcTV3rxnhNpFGynjhkjTtY77CC7PeVk2TZK+MJaSJmukDlaE8mydrXB8qHJQcxj00SPtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhYTXPFojQmZ9zZZ354AJ/jCl6rzM0UmBxspiaI7YeE=;
 b=K0mMaxz7Ngo2VkalN6Zza1NLS3tKGL/yWABqlvnh0zHgJ8pebZPYoCzz1GSBiluHSoiQB7Mt4T6Hhiotqeqy/r1qwW+z2hDr+PbUumZeeQVi9ByrO9aNpErg6SFU4lhy/LmLaND/E/Hwwjbfdt6aOGm9wNDuXM4f6WgOZcmo5jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH2PR12MB4117.namprd12.prod.outlook.com (2603:10b6:610:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 09:33:38 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 09:33:38 +0000
Message-ID: <a4a5a851-ecfa-47f0-b1cf-b34f620e76ac@amd.com>
Date: Tue, 17 Dec 2024 10:33:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH] drm/amdgpu: Make the submission path memory reclaim safe
Content-Language: en-US
References: <b0498534-0aa6-40eb-ad2c-fcac01df828f@amd.com>
To: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 stable <stable@vger.kernel.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b0498534-0aa6-40eb-ad2c-fcac01df828f@amd.com>
X-Forwarded-Message-Id: <b0498534-0aa6-40eb-ad2c-fcac01df828f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH2PR12MB4117:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7291ab-1f44-4662-b1ee-08dd1e7de23b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdTVFlPUmZpcVVvc0g1bkZDTzFtUlk5Q0p4eTBUK1c2SmlIQ1AweTVvdERo?=
 =?utf-8?B?d2dRTGdRcmw0REQrczlEUXE0OU9SdW9scTRGTUU0c2k0MHNuOGVFdThPYmJ0?=
 =?utf-8?B?NEgxREdsU2RibTgvZ0dsSnA3d0xmWXBiUEpNNnVtOWlaZkNOQ2VrWFBTRUZP?=
 =?utf-8?B?YUtnMHJ2M0N6MGlHUU43UHd3TnRSbG1IYUI1VEFBaTI3RjMxbTdxZGFoTkMw?=
 =?utf-8?B?NUFBNXBBdVhISmtMSDl4STE0OGFqWjdSMHlZTG8wOU0rVGd4djJENEx1cmE4?=
 =?utf-8?B?Zmk4VmdLVXlIZ1N2dndLcnZZQWN2VzlML3dlblEyUjZQeXh2R1BZQzJ5dito?=
 =?utf-8?B?MjVGMG9xN0p2UU42dWRLeGo2TU93QjluQXMzdGxqMml2M0pDS2U1dU1qQ3p4?=
 =?utf-8?B?amVCNnlXZG51b0Vjb2J1ZUJlTkxHc05zQ0xJaGttL2FoQmw3Q2xIQzZvckFK?=
 =?utf-8?B?ZE9GaEZQQ2w5UEs1WXNjRHF6M2hwWDg5VGRHK2dKVnNqMHdZQ0w3V3N1dXJ5?=
 =?utf-8?B?OWhaRFN3OGU1bGgrbnRZL3JDVUcyYUgvNnBZVmJZeEdpV1JtaGtGWXo1YitM?=
 =?utf-8?B?OWJvQlZWZldBTjMxWEFIcUx6SWhCS2o1eUVKZzdUcTdCaGw0dHZXRGwwOUFG?=
 =?utf-8?B?RU1wR1JwTEtTUEpyamxyYURMaG1VTWpwRjZpWHdGc0ZjSE5QM085bmNwMHhX?=
 =?utf-8?B?aVluZWNVTHE4UVFzWWQzNVh3RUIxMWtxVkJTbmxVaU1JeWNGeVVZYTVlcDBT?=
 =?utf-8?B?S3RrdWliMENQbTVTZFg4dXo3WkNDVjR2MmhVYWNNV29UcDA0WTIwbmx4QnBM?=
 =?utf-8?B?TnZZSXBKajgrTkF3Z3Y3S1FTOGppYlcyNDBlaTVyZGdFQmlrRmk3WWFxTTJi?=
 =?utf-8?B?Y056MWZEVE1KV3ZGQi9pS2h4Q095Z1ByWENFS1pGaEVoUDBrQXdtQXAxTktE?=
 =?utf-8?B?VGN5aTVQdmk3UUdwQ1JVQXJHWUtudWk2amR5aitBR09MdEZTZGMxUW9NeWtr?=
 =?utf-8?B?NlVaQXJDZ3NxVTdNbmN1eTRYSDdIVGQrUEpqVnIrUy9RWVNJSVM0NkJFTjNC?=
 =?utf-8?B?WTdxVkhDR21SbUhSZHJaTXRQSm00R01qMms1RDh2TXpHZ0hQdUpuMHVYU0V3?=
 =?utf-8?B?dFBET0ZBckxNanlQdk81WWtXbWdZYnozR0pxdkF5SDJTMjMrc0N4KytwdkhU?=
 =?utf-8?B?V1JZd0pVUEF6MFJVQ0J4aktJTUlkMHdxMnUyTzRldVU4eTJ3bnJEbk02Zlpx?=
 =?utf-8?B?dktMMERveXJXUXRjeEcwejRyMjdZd0tGZjgxSU8zbWc5TXhjMmpzcEJmQWhK?=
 =?utf-8?B?SHFoN2JPSHZXL2V4ZVBSUlZIdmh0blNmNG1FK0o0Y1hsL0FpRTdIUHd4b01W?=
 =?utf-8?B?MzFKQTlNMGNhVnVGZDdaVkRva2ZtaWkzMHZ4VkFrc2J2Vk96bmxhcFBIWk9y?=
 =?utf-8?B?aC9oZU9rM2xPQ0JZZGJJZ0hHdmp6ZFY5czArdjg3YWdDRXQralFPVzZkT2NY?=
 =?utf-8?B?WGJaWFo2MzZBQVExSTF5a3lFblQwdk1lNUxwbU5mZHpxRUxUN2VzWGxqRzZB?=
 =?utf-8?B?dHYrbDNIQi95UHhWSmx1SkpHK1AvMURlTTh5TGYvMEZnSDA1WnFJRWlFY2U2?=
 =?utf-8?B?dVBkY3cxdDBtTDlNZmcvN21TMkJpcW1UUkMyc1JIVzI3RWNQMTI3QjkrUjZC?=
 =?utf-8?B?NWZYUDBBTExNbGRiR0pNWjhDamFrbzRtUU5uY0h2SE9telprRGxWbzdOZVMz?=
 =?utf-8?B?d281YmQwL1RUU3pWekFYL0RXZjlDZHpUVHVWOXRPRVVSYnlYMzRKZ1ZzVE9j?=
 =?utf-8?B?UWJ1eHZpTG5pa2gwMEZVR2lEQVJ4MVJqdGRoSXU2Z0REdHFUVXlQVTBFTnUz?=
 =?utf-8?Q?1xIRHRlek9Qx/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFdYUWxLOGRUcytSWStPdmF1Q0c5Y2dlbElJUVgrdEZzcVM1QmRQaEhERjYx?=
 =?utf-8?B?cjJEWDJkNjVuMFFZLzdCK2RVOCs4Sm9neENTU09LRXd5UGUyMDN5Wi9oeWpw?=
 =?utf-8?B?aUEyMW9CVVBLWUFGdTYrN0NDd0t6eWxza3F0WGhUWlovWnJBd20zMEgva2VO?=
 =?utf-8?B?UzcyaTdKT3ZpWVIzZEpkWlE3dlF6NWhOWE95VWhUMm5IL2E1cHJlSEYvdWVP?=
 =?utf-8?B?THAvSmpQVlQwU0NsOE0zc25PSWJkc3JPQm05NExHTWRONmRlS3lNUUFtWktz?=
 =?utf-8?B?b1p1Q2gwMEQwN05JNjRDTkM3c2JiQXlGcWlVSGlXWFNRNTVmaDFFOVZ6ZXhk?=
 =?utf-8?B?SWtybVNYVXhNcmlWN0V0WVZac0ZxYlo4Q0xVT2tjR0RkWmlkMGU4KzBtdThW?=
 =?utf-8?B?d0FScVN5UXkvM2lHbnFlWVloRVBTbGZ2cml6NGlVODAxQjJISkpuV2xOVlR0?=
 =?utf-8?B?ZmF3OEs2dkdEaWx4OENSY1dCdFhNamFqNnJVZElnamVPK1dSNjY3azhhUS9v?=
 =?utf-8?B?OSt4WncxZUlWN05iY2gxOGtsdDlMZSsxYjRjVk1HSlp4WWIyNVloYnpxdXRK?=
 =?utf-8?B?UzVVUzFrOW03YUduUFFKeWFJdUh5dGIxRjFtbnBXMnpJWTJ4NmhyTkVPUmdl?=
 =?utf-8?B?NnV0WFBic2MrY01YTCs3OVN3dHpMRUdHLzMxQU1hTzQ1d2JUMC82U05OTDBK?=
 =?utf-8?B?QmE4QSs2L0IwTG1uSk1xSkhVVjNUUS9BUTdLQ0xjS08vcjJDRDBlREdwQkIr?=
 =?utf-8?B?c2hXVW9kcHV6SHA0bC9CQTAxNFVYRkpJSGRkSHZ0bEJ4c2JseG1IZlhka3BS?=
 =?utf-8?B?WWo3M0MvTlpQYmczYnpzOWE5Uys3Q0ZBcCtERkVycFpyWWRxWXpodHlPNSta?=
 =?utf-8?B?em5GR04rSG4zWDFuV2ViUHlDUjVLbk80K2hoK0JqbnRCbUI5cjlCak55VTgw?=
 =?utf-8?B?eitxamtrZWVMWHdsVWJZOEZxL2tlRjVseDYvUGVhRWtjVWVpcUxsaEZ6ZUpO?=
 =?utf-8?B?V1cyVjlyRGtkbVJXNXNsOUF4Qmo0dGl6K3Q5UWFUTTQzRVd3UVZ3VG0rUWlK?=
 =?utf-8?B?SkIydk5YT3o4NXVhMDVjbVpRa01wRlBZOHhxMjRtRU0yb1Zsd29CQXdQWHpu?=
 =?utf-8?B?SW5yR05semVPdE8rMndHOFJicTZtQWpLSGJRVWdhVVJNMGt1QXYwVGF0RnFY?=
 =?utf-8?B?RDVLZ0dhbkJUNlMwV2JzOTg4dm9vOTlreDhUeGovQzJoc3ZpV0hkU2t2VWpa?=
 =?utf-8?B?Z0NONGFGTGtVSE11T2Y1T2xia1JGSkVEdEo0bFZlbUFvVmdVKzFHZlNQdnJN?=
 =?utf-8?B?eEdsSTA4MUZuQVo3TDc5M0FHOHZGSEtIcDV2aDBaMHViTG1wdDk5R1F0ZDVQ?=
 =?utf-8?B?ajJsK25KN1N6akFRRWJTaEF4OHRHM3VISFNSNHpaTlVlQUVTdnpacDhSb1gw?=
 =?utf-8?B?Ukp4OXllT0xyNVJtOEM0NFg0YjVOcTR5UDY5MlVlMkNrUVZESzFWSzFZTDQw?=
 =?utf-8?B?UlFTZHc4U2wyWU9hYnRFSkRXSVJHd1p5bHZtRUtHU1oyTU9oT1RaZGJoQ1Z2?=
 =?utf-8?B?TnRVVG0rWnRJUXk0dUxGazdDSm8yVHdZZ2Z3SHliYmN2cG1QaUt4ejlEQUhm?=
 =?utf-8?B?S3lJK3ZEYjh1UXVaRzBqS2Qxb3FvS0tNYUlzUHM5RlhtY0NseTVGbHZqYnpk?=
 =?utf-8?B?aTZZcDc4citwQ0hzc1EyMHE0MW14WXVHa0NvekVEU0MzWDBwM29jVmhnb1RR?=
 =?utf-8?B?NzY5WXhEZG5HZk5udCs4OXd0eDF2b3ZaeXlZcFdzRUJMTWZTUUxTbmxETlkw?=
 =?utf-8?B?dE9FU1lCampOMW1PUVRKb0NjdXlnaUVQbE5FcG00dDl3ZHR2azdqK0FkdC9B?=
 =?utf-8?B?b1ZoeWY3czV2YUR4SmhReW1KVks0MFJub2NZNHpkRWZTNWNCeXQ0Lzc3TmFk?=
 =?utf-8?B?V3JrOHQrTkRVMHp5Z1VDTlhUZ1dwenZScy83WE5nTlY2dWFkRFBsbDUzMzds?=
 =?utf-8?B?V21JU21JeFNZOEFuOFptSlFlTDIrU0xtTEsyb0tVNzNGR0NZR0RLRHlMcFFn?=
 =?utf-8?B?SGVQQ2htdmZleFN4UzdJdFRPdkthV0JFVkRFRk1vUjdoRlgreHdZWHp1QmtC?=
 =?utf-8?Q?B60VGIjM3Fq/NpDmOtAtDMYxO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7291ab-1f44-4662-b1ee-08dd1e7de23b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 09:33:38.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ9e//Xyt+o48lflUvVVW5dmwZVJMzP/HF+4kknHV34WxVPZ1kXvIYRQ9b5/z79V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4117
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

Sending it out to the mailing lists once more because AMD mail servers 
tried to convert it to HTML :(

Am 17.12.24 um 01:26 schrieb Matthew Brost:
> On Fri, Nov 22, 2024 at 02:36:59PM +0000, Tvrtko Ursulin wrote:
>> [SNIP]
>>>>>> Do we have system wide workqueues for that? It seems a bit
>>>>>> overkill that amdgpu has to allocate one on his own.
>>>>> I wondered the same but did not find any. Only ones I am aware
>>>>> of are system_wq&co created in workqueue_init_early().
>>>> Gentle ping on this. I don't have any better ideas that creating a
>>>> new wq.
>>> It took me a moment to realize, but I now think this warning message is
>>> a false positive.
>>>
>>> What happens is that the code calls cancel_delayed_work_sync().
>>>
>>> If the work item never run because of lack of memory then it can just be
>>> canceled.
>>>
>>> If the work item is running then we will block for it to finish.
>>>
> Apologies for the late reply. Alex responded to another thread and CC'd
> me, which reminded me to reply here.
>
> The execution of the non-reclaim worker could have led to a few scenarios:
>
> - It might have triggered reclaim through its own memory allocation.

That is unrelated and has nothing todo with WQ_MEM_RECLAIM.

What we should do is to make sure that the lockdep annotation covers all 
workers who play a role in fence signaling.

> - It could have been running and then context-switched out, with reclaim
>    being triggered elsewhere in the mean time, pausing the execution of
>    the non-reclaim worker.

As far as I know non-reclaim workers are not paused because a reclaim 
worker is running, that would be really new to me.

What happens is that here (from workqueue.c):

* Workqueue rescuer thread function. There's one rescuer for each * 
workqueue which has WQ_MEM_RECLAIM set. * * Regular work processing on a 
pool may block trying to create a new * worker which uses GFP_KERNEL 
allocation which has slight chance of * developing into deadlock if some 
works currently on the same queue * need to be processed to satisfy the 
GFP_KERNEL allocation. This is * the problem rescuer solves.

> In either case, during reclaim, if you wait on a DMA fence that depends
> on the DRM scheduler worker,and that worker attempts to flush the above
> non-reclaim worker, it will result in a deadlock.

Well that is only partially correct.

It's true that the worker we wait for can't wait for DMA-fence or do 
memory allocations who wait for DMA-fences. But WQ_MEM_RECLAIM is not 
related to any DMA fence annotation.

What happens instead is that the kernel always keeps a kernel thread 
pre-allocated so that it can guarantee that the worker can start without 
allocating memory.

As soon as the worker runs there shouldn't be any difference in the 
handling as far as I know.

> The annotation appears correct to me, and I believe Tvrtko's patch is
> indeed accurate. For what it's worth, we encountered several similar
> bugs in Xe that emerged once we added the correct work queue
> annotations.

I think you mean something different. This is the lockdep annotation for 
the workers and not WQ_MEM_RECLAIM.

Regards,
Christian.

>>> There is no need to use WQ_MEM_RECLAIM for the workqueue or do I miss
>>> something?
>>>
>>> If I'm not completely mistaken you stumbled over a bug in the warning
>>> code instead :)
>> Hmm your thinking sounds convincing.
>>
>> Adding Tejun if he has time to help brainstorm this.
>>
> Tejun could likely provide insight into whether my above assessment is
> correct.
> Matt
>
>> Question is - does check_flush_dependency() need to skip the !WQ_MEM_RECLAIM
>> flushing WQ_MEM_RECLAIM warning *if* the work is already running *and* it
>> was called from cancel_delayed_work_sync()?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>>> Apart from that looks good to me.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@igalia.com>
>>>>>>> References: 746ae46c1113 ("drm/sched: Mark scheduler
>>>>>>> work queues with WQ_MEM_RECLAIM")
>>>>>>> Fixes: a6149f039369 ("drm/sched: Convert drm scheduler
>>>>>>> to use a work queue rather than kthread")
>>>>>>> Cc:stable@vger.kernel.org
>>>>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>>>>> Cc: Danilo Krummrich<dakr@kernel.org>
>>>>>>> Cc: Philipp Stanner<pstanner@redhat.com>
>>>>>>> Cc: Alex Deucher<alexander.deucher@amd.com>
>>>>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  2 ++
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 25
>>>>>>> +++++++++++++++++++++++++
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c |  5 +++--
>>>>>>>    3 files changed, 30 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> index 7645e498faa4..a6aad687537e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>> @@ -268,6 +268,8 @@ extern int amdgpu_agp;
>>>>>>>    extern int amdgpu_wbrf;
>>>>>>> +extern struct workqueue_struct *amdgpu_reclaim_wq;
>>>>>>> +
>>>>>>>    #define AMDGPU_VM_MAX_NUM_CTX            4096
>>>>>>>    #define AMDGPU_SG_THRESHOLD            (256*1024*1024)
>>>>>>>    #define AMDGPU_WAIT_IDLE_TIMEOUT_IN_MS            3000
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> index 38686203bea6..f5b7172e8042 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> @@ -255,6 +255,8 @@ struct amdgpu_watchdog_timer
>>>>>>> amdgpu_watchdog_timer = {
>>>>>>>        .period = 0x0, /* default to 0x0 (timeout disable) */
>>>>>>>    };
>>>>>>> +struct workqueue_struct *amdgpu_reclaim_wq;
>>>>>>> +
>>>>>>>    /**
>>>>>>>     * DOC: vramlimit (int)
>>>>>>>     * Restrict the total amount of VRAM in MiB for
>>>>>>> testing. The default is 0 (Use full VRAM).
>>>>>>> @@ -2971,6 +2973,21 @@ static struct pci_driver
>>>>>>> amdgpu_kms_pci_driver = {
>>>>>>>        .dev_groups = amdgpu_sysfs_groups,
>>>>>>>    };
>>>>>>> +static int amdgpu_wq_init(void)
>>>>>>> +{
>>>>>>> +    amdgpu_reclaim_wq =
>>>>>>> +        alloc_workqueue("amdgpu-reclaim", WQ_MEM_RECLAIM, 0);
>>>>>>> +    if (!amdgpu_reclaim_wq)
>>>>>>> +        return -ENOMEM;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void amdgpu_wq_fini(void)
>>>>>>> +{
>>>>>>> +    destroy_workqueue(amdgpu_reclaim_wq);
>>>>>>> +}
>>>>>>> +
>>>>>>>    static int __init amdgpu_init(void)
>>>>>>>    {
>>>>>>>        int r;
>>>>>>> @@ -2978,6 +2995,10 @@ static int __init amdgpu_init(void)
>>>>>>>        if (drm_firmware_drivers_only())
>>>>>>>            return -EINVAL;
>>>>>>> +    r = amdgpu_wq_init();
>>>>>>> +    if (r)
>>>>>>> +        goto error_wq;
>>>>>>> +
>>>>>>>        r = amdgpu_sync_init();
>>>>>>>        if (r)
>>>>>>>            goto error_sync;
>>>>>>> @@ -3006,6 +3027,9 @@ static int __init amdgpu_init(void)
>>>>>>>        amdgpu_sync_fini();
>>>>>>>    error_sync:
>>>>>>> +    amdgpu_wq_fini();
>>>>>>> +
>>>>>>> +error_wq:
>>>>>>>        return r;
>>>>>>>    }
>>>>>>> @@ -3017,6 +3041,7 @@ static void __exit amdgpu_exit(void)
>>>>>>>        amdgpu_acpi_release();
>>>>>>>        amdgpu_sync_fini();
>>>>>>>        amdgpu_fence_slab_fini();
>>>>>>> +    amdgpu_wq_fini();
>>>>>>>        mmu_notifier_synchronize();
>>>>>>>        amdgpu_xcp_drv_release();
>>>>>>>    }
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> index 2f3f09dfb1fd..f8fd71d9382f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>>>>>>> @@ -790,8 +790,9 @@ void amdgpu_gfx_off_ctrl(struct
>>>>>>> amdgpu_device *adev, bool enable)
>>>>>>>                            AMD_IP_BLOCK_TYPE_GFX, true))
>>>>>>>                        adev->gfx.gfx_off_state = true;
>>>>>>>                } else {
>>>>>>> - schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>>>>>>> -                          delay);
>>>>>>> +                queue_delayed_work(amdgpu_reclaim_wq,
>>>>>>> + &adev->gfx.gfx_off_delay_work,
>>>>>>> +                           delay);
>>>>>>>                }
>>>>>>>            }
>>>>>>>        } else {

