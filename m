Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF28AFAF4E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6066810E108;
	Mon,  7 Jul 2025 09:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZGQDbroV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6DF10E108;
 Mon,  7 Jul 2025 09:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNqET68vDxbPiGejp0NbXoKJPIKwVUMPqIU+sFVEWq9VVN/QyLswL1/gpGeDRdu/fJUYYWmlsLZij1cEQSVMhnLE5BZzfCgVBZnqsu7U1zBUtGyVF7oVsZyiVjbBNZCpwi3ixARjm0BOYZ6i+/z2a3pnnfUQ772SlmyrcpFPYuvep9ZZuVSNGceqosEOjaJSRxQuPiP1GYTdBU0e9/iEXGAu8Nv/0b+MlDdPHaJdUvDDSTMyZf7EeYGi1h6pofno4PbbY2B4cgONl2QDvCNHoTL/+EXRzI7wr3zjL/7w6f8f16/UWQ6QReHb2uUiaDgRSJ3jtdq6P08s4ty4u0YBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvRdHrAgv7x2YgEWYfy/hj2x9zmt1R/ZGewNCUonygA=;
 b=IEz7mKxIZIq5KvhagLg/sa+f0ofseLi4tVaAPBImow/Zz8kemJ57cAfgWfzmzsiYGybWEwL+IlTP+FyJPtEOspKbngZS/7NFA27WY7YyWMHpBdVdXWphSmLuhAXLcyH1uyOZFOA/CvrP3w4dVmBLI8qF4SIpL5NqMBLwaXjV1YrhnqLJxLlZYMT0fZRGW0UPtC9guJqEQk2YJSKRlizXqm/7XT618/jl5ZKN9Q44blyXJYwZ/qLPPNT1bDjfkNqh3raLQRtCzQeME0HGdDoqVW0epP03ex0mFqX0QBEMU4AAbI2OVzi/Iq/J/xXotdUnMrNaX+3WH6rho3ERgh63zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvRdHrAgv7x2YgEWYfy/hj2x9zmt1R/ZGewNCUonygA=;
 b=ZGQDbroVJqeczXh0+dgc/Kl/kqmZ+RsSeIEF4DlmN0qKC6CZoxqKWf0vY9ZAECUI25SwLk5ce93HwStZYw7jxMMC/Gd3AQpw9IaH6ZXaQOR2VYSHHuOJCk9Y1RFGPSKpTNwbw3UIDS77m8Tph4Q0OtXDwHOqxBCLKeT8ekg4NK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 09:13:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:13:57 +0000
Message-ID: <c3543220-1f26-4938-8abd-73d4467329f9@amd.com>
Date: Mon, 7 Jul 2025 11:13:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/ttm: add ttm_device_prepare_hibernation() api
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com,
 haijun.chang@amd.com, Qing.Ma@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-2-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250704101233.347506-2-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR18CA0016.namprd18.prod.outlook.com
 (2603:10b6:208:23c::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 120c2450-a8a1-4966-cf0d-08ddbd369a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vzc3d1BoeG5rdkRha2N4QUp4UGFHZFplaHJyS1Y4Y3h1RUNud1dzdVRuZ0F1?=
 =?utf-8?B?RUNTdDhYZElxR09weTBCUm80S1FPaityQnNYbW5MQWdlTWFIK3c4Q0pLSVQ5?=
 =?utf-8?B?YmFobzZNOUt0ZForRUxBQW9EcTdrV1E5T2owU0NJT05XaWFkWW9aazNxb0c2?=
 =?utf-8?B?eDZXUUpuc29hMzJndWVydTZmbkw3eUtMZHB1TDNjWkJJSEVReXQwa3VxUjFv?=
 =?utf-8?B?bWNwRFJJejg5a0Y4Z24wMU9aTFd3eHlHN2lFaWhFS2R3Z0pDNmVBMFJVTi9D?=
 =?utf-8?B?dkVMSnNLRG4ydElFL2xoeTRYRGZwQzk0V2pSZ1ZUVzFvUTRZUGtrMERBeXQ0?=
 =?utf-8?B?TnE0S3RHNEs5cGtWRGdGSFlTdEVHc1BYV0hRcnRxV2QzT2F2amUvTzN4ZnUz?=
 =?utf-8?B?ZHF1ZEFVampnWGhVYXlSNUQwYzRzcDlUM3ZFKyt0QmovazQ5SVozMUtRcCtK?=
 =?utf-8?B?cmtBNGd6bWZ1RVV6ckVuU1NGc05mRW95VmFwY1ZWYkZYcHFGZFgrOUpFbUpj?=
 =?utf-8?B?clArWDJsaXd1dTk0OFBWZTk0OVpmWDBXaWRwUkNmdnhKdXUzUHlRbVFPd0tT?=
 =?utf-8?B?cmdWSjdsVnJKZ2EzMC9UYlJhODlqMkZBbEx0bWVIUjBZeWtaM1pGbnl1b2RZ?=
 =?utf-8?B?N0Mya041VWFQZFRuQU1hcDA5Z200ZGRsWkR5UVVHaktCQnQwMlAvN0p6UXNM?=
 =?utf-8?B?V0ZXQzNaSTBMbHQ0VmNIS2NwNGJFY3I3UnhXYzZzU0k4UXE0ZVhqWmozMDNX?=
 =?utf-8?B?L1l6bjdGelBkeVBSZk95aVh2VU1XOVRDcWowTmJTY1hDb3JrNGhsZ1hpOU9o?=
 =?utf-8?B?eHFGRTlibjdwRmtzeWQ4LzBBcWlLWG51K1FTd2tzZzhFSkNrNFZ6WGpra0pp?=
 =?utf-8?B?T0xOVUpBMi96K1NUTUZQU2g3VTNJdlRjcmZJRW41dXZZYVRwVm44STBneUVy?=
 =?utf-8?B?cU1pZDA5QU9nUC9KV1hlb0JVS2JDYkZORFZjcWkvL21jbk10cTdNeDBYZFBM?=
 =?utf-8?B?MlI1MzV6WTQxSi9jYmJTbFY4MENhZHZrQ2trYnpoZFZsU2ZBMlRWRCtaY3FU?=
 =?utf-8?B?RnpzeUw4RjVWelg0TzBMaW1GSTgxRXdHZDVjT2xaQVdoMHZsVzR1TTFkTU9l?=
 =?utf-8?B?WUcyWmZTOVFtQkc1M3ZPbWdGY0Rrdy9yNzBGMkxPV2kyRkNycnpBV3JzVTVL?=
 =?utf-8?B?ZjJqbHZOeHVYc1h1dzBJbmZvZjhYSjhEcUVMRVV5VzhkWS9pYjlZaElZNDVk?=
 =?utf-8?B?Z21PVWVCYTVGZVArRzlTVzh5OWxJMEw0S21SbHNqS2FISTdtTWFBMjdDRktG?=
 =?utf-8?B?K0sxcWorNVJhQVc5ZW5KTzhkekdiYkRhTWlGNGZvUkdOSVhCUHJ0OGxIYTRR?=
 =?utf-8?B?YW90dEI2MnRFT0R3OE5CTEJTVThTVXpUTm5oYms2RnBqYjF5c2VncGV1Z0JN?=
 =?utf-8?B?ZU1PSXk3elB4MmloUFlCQSs1NGlDdXJDZm1hSXlDbW1vYzhsZnYwOGw1b1ly?=
 =?utf-8?B?bld1NCt0ajlEWHpZL3BqdHo0ZEN1U0E4Z3BFZURPa2FieHRxQncxTHdIVmdh?=
 =?utf-8?B?YkF6SjNsTjJsSUl0ZkhERUJyVXpkNFZDZDFyYit1dmlHYWphb2luVGo2dnhO?=
 =?utf-8?B?SDNJejVLdkJyMjdObTdsc3J5aEdEeUczVThGanora1c3UllYYy9od2ZzSmVh?=
 =?utf-8?B?UUlYOU1HZElDb21sSXVMMjJLVmNmRkI2bCtRL1FMT1VoaDVEVXVjM0lxRngz?=
 =?utf-8?B?RTlQK3ZQcUJoSGc2N2tzaUhjbTh3akZjNWlKODVPTyt3UW82SlFNNTJQU0VS?=
 =?utf-8?B?cmVzMVJxQ2FZRTl1YzM3OEdIQVg0dm9qR3ZsQmJ5aXpzdHVtcmtnM09yRDlp?=
 =?utf-8?B?VXBubU9kbEJQTWlqUWUrd29maWVhRkwycXhVZERvWkpkOC9ra1IrdVQ4NUZP?=
 =?utf-8?B?cXZLbE5Ud2hpSmJNV3NhdFlTNWVMMkpIcGVMeG8wRTFKbVIwZllzYjYwVmpz?=
 =?utf-8?B?ZktCMHM2L2JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHgxTDFFSWthRFBXUUJ5dHlrV1UwV0V0L09HWUJ5Qzkva3ArN1UrVzg4dU5v?=
 =?utf-8?B?cGJSRDd6Z21lRDlxOE9BMkxNQWNTNTltYTBydDRZZ3RmQTd5bjRiY2IwbnBR?=
 =?utf-8?B?QTlTOWZRMnN6cE53anNyQndyVWFRNjUvdlduZHZLc2dpdEQ2aWpoTlZ3ZHMw?=
 =?utf-8?B?eG1wOWNWRzBwWlp3Ty9jY2tnNG1rWUVPMmViem05RXd6R0tUaWZUcE9FOGpi?=
 =?utf-8?B?aWJIbytpb1RCL21oSEViUzh4cERtc2J3OTRLdFZlRExYNzF2eTRrYkd2Zk1Z?=
 =?utf-8?B?VlExaVN3MTNOYzkvSjRvM0lWTEk0UTNKOWprVFhTYUpDd2NNRGZjNyszK1A3?=
 =?utf-8?B?akNuSTlKTm9NZjN6ejJjSGZKMFFWcUNGSHY1dU4rbHNzUk4xbmVvZDN5R1g4?=
 =?utf-8?B?eDhTUy9PdG15YXlzVzdJLzdKK1hwUktnQlhMSW9hNXJWUjdrd3l2UzBnMnJu?=
 =?utf-8?B?SWE4c1dmT25ldXZMWDRiU3dmQVBvb0FuMVJkWEl3L2NrbEFWL1hGdVRYNDhj?=
 =?utf-8?B?OEVicCtwZk80RHZtTVpkVjdMeC85UEUxOFE4MnRlMlo0V2hCOEwzUU1SVExM?=
 =?utf-8?B?YThUdmZrZXVGVHZCRGJwVFdQVGxiSENtam5RRjYvRVMyNkdnWm9GTkdORFVF?=
 =?utf-8?B?VE9md3JnWlNIMnJWMXNaaXlwcTlDbFQzSlZ5Z0txU2NNS0ZCNFVpOWl3TzRL?=
 =?utf-8?B?WlJzcDZ2K01aTE1WQWJNbWU4bXlxbmR0SmVNc3k1ZXF3eXlGNkRTQWdUWGRr?=
 =?utf-8?B?OEo0NzdkU1ptdjRKVGxtam9NdkNBbTlMbEZ4SlNGOFBQSHhHTjBGUytYemxW?=
 =?utf-8?B?UllYV3h4dG5aRW5oYkZtNTVVc1IrZElTTS9yUmpIKzBUQjZvN3pyZzkwK1dr?=
 =?utf-8?B?dVFBeFVKWU1yQVNsWEdBUTdLTWRHb2l2MXFEU1pDb0FtenRuUHNQZStodGpC?=
 =?utf-8?B?Nk1LSDJMNVlKOHIwN2RpUWYxc0JkVXdLSHZjblVnMmlkV002S2lsdzBSRGpj?=
 =?utf-8?B?M0Q3NWkxQ0NmeHNkc3BpZVQ2TW5xdjJKYWdZL0tiWmRKUE9OOW85WFRsTGZ2?=
 =?utf-8?B?K3dFT3ovSUVnQ2JEd1F1bms3VjVaK1p5SGJjelBDa21lVG44SHpaaDloeHVO?=
 =?utf-8?B?WnlYaDNYR2s1VXRaY3JLaHR6RC9GWFZpMGx5a0hMTlZzYWRVMnZueFhsY1R0?=
 =?utf-8?B?Qk85ZForRW1LZW9PVGxIR0xZekdINHN6OFZlb2tVaUNYMGJMbWxiY1F2UnBN?=
 =?utf-8?B?TjNJMzhISlk0SVdBcWg5N3N6TjdXZkhZQ2VXNStKbkNlUENxUHg4Zk5rcmJx?=
 =?utf-8?B?dmQrVGJkM0NrWUY1ZjZHRkRlR0ZtTG5vZUVCOGR6UFZhVUFPOVZ5azVSdnV5?=
 =?utf-8?B?TitzWEtBTUQ3OC8xQXN3WnBvR21YSTVFajhrdEFCNHczdTZCMStpSUF5M1A2?=
 =?utf-8?B?ZWk2UFZzc0JoYXlDRGkzaXkvV1lGSnJtc3pweWZrVEdQRTRWMk00d2UwNUZ4?=
 =?utf-8?B?ZUc0Z2k5eVN3UlhkaDIzMkZ1Ymo3YWNyN1l0aTJUdUU4TlpDN1pjWkNqVVM3?=
 =?utf-8?B?M1NQcnJNeWtCU2NVSHpiTHU2RmxCUTNHT1FNdjQwQ2NYYkUySSttZjhGZy9V?=
 =?utf-8?B?TTUwN1BqVSt0N0V2NFhQSE04dm9pTCtqcFZzSkh3SSthUm56UnZxRVZ3T0lX?=
 =?utf-8?B?bk9xcHdUN0NVckFjTnZlL0FuZWFjSjFwRlkzUkR2S0h1bStFYk5kK253OVJl?=
 =?utf-8?B?OWlBcDh4MllZMDlMMHZQS2pDTG9tL0xrbmhQZ0VVQ3pJQW9XaS9HY1FXc2lN?=
 =?utf-8?B?TER0YU5pMnZhckt2dlBHbCtyTExaZklBRGRRZ1g3ZmhrVUo4UFJkdFRhTzM0?=
 =?utf-8?B?aWQvR1Byak5zbVdwa2E3WGNQa0tQUENSQWJTWDc4eStRcFZxNUhWK25uYnp4?=
 =?utf-8?B?TGJ5YVFFRXdSVnZIWVh5NUgzUHgvMmpjNjJNV2MzQ3k4QzNYcWhYV080SGtB?=
 =?utf-8?B?UVJvUkRxS1JTQVZMbkpzNHFaajAzT3YwZkR3VWxmZ2lCZ2R3SmprUzhFck95?=
 =?utf-8?B?eG5CeENRaVpaUUJpdEd5UGhtbWttL2hHcTFOdUxxekMzU2RrNVpaT0VGSTRo?=
 =?utf-8?Q?fH7yTJakY+IWrAy5lLrFBO2uW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120c2450-a8a1-4966-cf0d-08ddbd369a28
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:13:57.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v26Sez7TcPHFgcYlj6UfSqMP3dbTrfogoQ1oXX9l9KONnE6HAFcIgsLy97FJSkg8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863
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

On 04.07.25 12:12, Samuel Zhang wrote:
> This new api is used for hibernation to move GTT BOs to shmem after
> VRAM eviction. shmem will be flushed to swap disk later to reduce
> the system memory usage for hibernation.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 29 +++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_device.h     |  1 +
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 02e797fd1891..19ab35ffeead 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -123,6 +123,35 @@ static int ttm_global_init(void)
>  	return ret;
>  }
>  
> +/**
> + * move GTT BOs to shmem for hibernation.
> + *
> + * returns 0 on success, negative on failure.
> + */
> +int ttm_device_prepare_hibernation(void)

This needs the device as argument.

> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false,
> +		.force_alloc = true
> +	};
> +	struct ttm_global *glob = &ttm_glob;
> +	struct ttm_device *bdev;
> +	int ret = 0;
> +
> +	mutex_lock(&ttm_global_mutex);
> +	list_for_each_entry(bdev, &glob->device_list, device_list) {
> +		do {
> +			ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
> +		} while (ret > 0);
> +		if (ret < 0)
> +			break;
> +	}

In other words call ttm_device_swapout() in a loop for a specific device and not for all devices.

Regards,
Christian.

> +	mutex_unlock(&ttm_global_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_device_prepare_hibernation);
> +
>  /*
>   * A buffer object shrink method that tries to swap out the first
>   * buffer object on the global::swap_lru list.
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 39b8636b1845..b45498b398dd 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -272,6 +272,7 @@ struct ttm_device {
>  int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags);
> +int ttm_device_prepare_hibernation(void);
>  
>  static inline struct ttm_resource_manager *
>  ttm_manager_type(struct ttm_device *bdev, int mem_type)

