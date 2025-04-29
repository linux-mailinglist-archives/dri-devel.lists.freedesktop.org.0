Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3673AAA0481
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E1C10E38F;
	Tue, 29 Apr 2025 07:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LltBqVd8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CB510E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 07:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad4qDV0mu8K/bVwIDlveBqzvF44/xTb16xsQNm5FoUTwiLNrJ2HqFX3F+TUz6tpxtbLZXC6SlHYUgRy63CXGhCC1ksCXvui1OrO6T35iwJcJct0cjhqT1EyZ3g8w0MGERJ0NlHXrUzNC8v7k/l3SsuZ1s+5H1gJTSdwTqOf79K2rwTOwsv3L9+dIUV9lZh9WtdBsz5NBDJ2WuLjDovhAHaC2RuN4Wj9OGPz58dl5b2GcR9x/XApGcn0aXYSxhQbwS1LMzkZea0Ez/den0xB6dPESpz0U0UdMP9HaK1U2IcodyNY6n/ZNXgoJC11sglJCnDt+KFEbGD/DSdiu8Zi4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqIFDnNOd8b4r6dCNiWdNsEona9zx+KIGYIhtXnlpOE=;
 b=xPplDncLi3FDS+JJ0uyinWh1/XKv4D5HxHiruX/Sf6ffnQKB/psRi4MbR1aBfxH37NiCgUQjd4XLRKTdAiYqXPYcvjQOOzIAfckZqaAdN4nPPQ0WYIluLwMCc7+6k9+Fn3b4DPoqlX6FQMWPfSfddMls8QTNdW7KUrc4UvfuvsA6bryazSMh6xDOAYxHXzdgmadZ8Ed4soHBn5RCTLlsGOVPeS+BMSxnb0XXCY9EXmrRxfFh5JiXZjkehGl/FfRqOPGrGQRAaI1UGaEpqieptWuvC2ooXhs+3QjUEKBXIzqQPBLNzrmzmDqL+SgzzTJyk6SYNzoLVJmLMWYKr7Obug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqIFDnNOd8b4r6dCNiWdNsEona9zx+KIGYIhtXnlpOE=;
 b=LltBqVd8EXxUpGZQDkD/9Jnsvl8umUohFPwiGGOmDeu/HkAbVxA4FCNRAeapN2VlS8NQK0ITYLjGS+wTdt5rF48Mcm/1RW9yKlomE8IQ3+1lC/l5KZHbbDCuJ1d+/lBHsodThPNSBlhy/jtbHNjgOtktmE2Y8fgaENX//Dj4WT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Tue, 29 Apr
 2025 07:29:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 07:29:28 +0000
Message-ID: <76bbe552-584c-426e-9067-c1c269004c84@amd.com>
Date: Tue, 29 Apr 2025 09:29:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, cgroups@vger.kernel.org
References: <20250423214321.100440-1-airlied@gmail.com>
 <4bac662a-228e-4739-b627-5d81df3d4842@amd.com>
 <CAPM=9tzVijMmf8P=Kthc-UcaYXK28Gy3e3W+F8i3NKdYzhL_BA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tzVijMmf8P=Kthc-UcaYXK28Gy3e3W+F8i3NKdYzhL_BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5c169c-8e2d-474f-3921-08dd86ef9326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWtWOTFqYkVPeHRNUERBWjZDUS8rV20vbWNad2xFcjY2OXd3K3UvcWNGREtU?=
 =?utf-8?B?NCtSVjlIVWRPcGc5bE82L05aV1h4V3Mwc1hwTHEwYS8zMEMzL3dWY1gyRFFt?=
 =?utf-8?B?L0U1b3pNQ3I2NDYvUzZSaWNCeEt0VjBCL0xEQkFuODc5bU1EdVYvQTZlWUJr?=
 =?utf-8?B?UzVBdGM1NEQ1Zm56cG0zbDE3aGRZV3hTWWMyTTZDaVoybnhTaHB6TFRFbzg1?=
 =?utf-8?B?ZFhqbjQwV0hQNmdKVTZHakJ4WE1tZnNtSy92SllmdHhPMXhPcWZWWitzNFJy?=
 =?utf-8?B?TlhSRzMxOVVlTlBmamhpNmZXME13WjliQzJBWmo2TmJNWmVCNzEvNmU1ZGRO?=
 =?utf-8?B?SEpPU2FQV2JHQ2JjeElXQTRaSHVNbHlOSklCV3h3bi83SFVKakJSczVNU0Z4?=
 =?utf-8?B?M283Wm42S2pOU2FvT0xobWFlbkxPQlhoaVZVQ2ZLMWRwdzU4eWFOYnkxM3o3?=
 =?utf-8?B?Y25GY1lHQWd2UnV6OW9heVR6OGxMcTFtOUdZZ084d0wrTkFPZ1lVa0d0eFEx?=
 =?utf-8?B?UmRhN1pZdWRxOC9aYmVsVzNJajcyeVBHSGhwUFN3TzNRc0ovdTMxSG5menBC?=
 =?utf-8?B?cE95YjBPQzlyUHNqdnhOdW9UTWVuNmRVdXMrV2ZIakVxQmlaaUV5cEtCYmw0?=
 =?utf-8?B?RWt0cUNNcGI2MTZ5dEkyQUNMUFBHaXNCejl2Nmh5Z0x6TmMyVGtXbVk4OVBh?=
 =?utf-8?B?VFhCQWNjU29qb2gyMldQSEwzRXdQUk5tSkk1b0prTDVzTythSDNpait3SFBp?=
 =?utf-8?B?TmJITFVXZ1QzQW9lS2dibG9xRDB3c096Vkw3T3hyRDhaRmZkR1ZqTDJ3VmRZ?=
 =?utf-8?B?a28ya3BaZGs4WGRsSURtdUNPQ2x6cm9NN1YwbTd1MCtGNEhVM3grRlZlcnRM?=
 =?utf-8?B?MGY2YjI4TGtnS25MVEhvbVRmYUhHaG5pVWtpaW1tM0prV1R6a2I1TExkN1o4?=
 =?utf-8?B?YWx5WVk5Z053OUxNWGFKcnZ6bjQ5NXVFUGlVanRWa05lVUxOYkdCbFFkWTky?=
 =?utf-8?B?dTdhOVZWR2szRmRtYWlscWRmbDZSK01ydFp5bk94VkdhTWI2Q2NmK3BDV01E?=
 =?utf-8?B?VmM3YWErQU9DUlA0c204RjJTTE9zNnFIbWVURHM2bEdraWhNeUZEZUNxQjJW?=
 =?utf-8?B?V0p6c1JVc1k1N295b2VnZjBzOWFYai8rVDNQaDRaVE9JSHhkV2lobkFTa3Vv?=
 =?utf-8?B?TjlNNUs3ZkhGMHhZVDZXTVVud1JSUFdpVXEzUFV1cDg5SFVGcHVDeEdHRE1N?=
 =?utf-8?B?aDgwdGV1M2gvL204Q3hKek8xOVBvNUNtMTgzcUFnZEs4eWN1NGlGYWtWa2RQ?=
 =?utf-8?B?L25Edld5ZmhzenJTdCtKOFdnZXI5eEN4d1NnNFdNNlFyZk1YWUs5bTM4OUpG?=
 =?utf-8?B?bmRRYlB4dVdhMUlvNy92WTRCdXN0bzA2UnU2OUMxTWNZU3R6SXd6Ri9PSGFG?=
 =?utf-8?B?Y3JlSmNLNEVCeHZCV2FNWHk1VU1XY1FYUDNTdUxzS2NzTzlDQnVsSkdYdUFW?=
 =?utf-8?B?L0NEUmh0dGc3M05XdFZWREZjM3p3bzF6RDFLQlNiUm9oVy84cUMrbEt0VFRx?=
 =?utf-8?B?cmF0d1VVQXhGK044K3U1TWxIMDVReURDSFZRZk04S2dicEZxNkV0c0dCUFg2?=
 =?utf-8?B?OEd2U2Rwb2szb3F6amtzYnRtMEM4OXQvUC9RV2YzOHVNRExQMUJnZmFKbU9J?=
 =?utf-8?B?czIxbEpVendXdVZ1WkxRR3h4c3BHL1hRV2YydWFiRlVHL0pPd2JPUWRscGNI?=
 =?utf-8?B?Ukh0VkErZ1lYY1dtZzJ0cGxPNkxtQ0tUbGpJK0VaRmg1SE9QZ1ZCbTBxd0Fs?=
 =?utf-8?B?SWNQeHdQQ08vcFJaRkQrZXBtTy92VjJZWU9pSmJ4aWVSS1VKOEJ0ZzJJRFRC?=
 =?utf-8?B?c250blB2eWVCVkRiaHFmWDJIU0pNRGVsa1Y0RVJDOHNGS0xNVEFnWUtPRjdr?=
 =?utf-8?Q?GqSedAn2eZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dld3QVZtS1NzUUN4MEtTSDF0YndQdWwvYlQ2S0tjbEVDS29odW5BQ2VvRHpU?=
 =?utf-8?B?Ui9KLzZXY1ZOTVdyc0lwcjNOQ041NmtqdjYwRnFLMmI3cFdiTndobmh2RHJR?=
 =?utf-8?B?UFJUQ1Rzb2xqRGJCVWZUbi93ZXVFOTJ1ekxyL1RDRCtDVnVLVDdHbnExVEdG?=
 =?utf-8?B?U1NyckpSc3o1M2ZzaGFoWVZMbjF2TE8zYlhLbEVMWkpCUHhubVBxMG5FMzNh?=
 =?utf-8?B?KzJiNVRBaGd1SUxTT1R4bnBacWVuSjlQL1c2MXZwdkM4WCsweFNaK3lpMno3?=
 =?utf-8?B?TjViQ1ZQWGlsaDlEazBsOFNhSHJiaUNoaER4NjkvSmljdU9scGZqalh6eFBv?=
 =?utf-8?B?UzZseTY3QkhYV3ArWFRRcnNoaHBNMy9rNlp4SlVCVjIvWTdFN1o3NXF5bEZi?=
 =?utf-8?B?RDMwYkNwUEdhWGpUWjZUSUt2TWtCaGdrS0hzQ1Y2Vm5LMWdQbEVMTUVkYWE0?=
 =?utf-8?B?UzgxV0VrWGdFc2Zhd0RaOVdza0pkczVYYzZJdVhDdFJQcUZrZTVTbEJmQ002?=
 =?utf-8?B?cFFja3N5WTRvSS9zTWNDNFBrWnM4T1EvS1VxcXVydm1KWkpvdXFmRjRlL1Bz?=
 =?utf-8?B?aFFBeVB2a3hRaThVSk00cjUwRWhPM3k2bVJteUlaSHBTaGxGQjJTSXg3RGE4?=
 =?utf-8?B?a0VrYWFBRDB4MDBxQzhEL3ZyUjJCcGwxSWR3dUtPZWhEUUcrNGttK01lL3Zv?=
 =?utf-8?B?V3BuQ2VnRmp0dVJxWkhPVWNlRXFRY3hNN0pKVmVyRDZjNGIrZFlVbnJjaHFl?=
 =?utf-8?B?SUM5TFBLQys3WldOdFkyYTVHMkVJTlpBUVkyQzlTWXErWjFTUCtvRURuTXlr?=
 =?utf-8?B?SS91K3dNUW5Vd1ZhK3gvNmk4UGkxamN0SEFUUm0xbHBSU1J2RlJNcm8zNTBk?=
 =?utf-8?B?Q3doNVRKOXNLeXA4OHdqZTQ1cUNDY1lSTDJoTnFYVDFNREVhQ2NPYk80dzNW?=
 =?utf-8?B?U29CYkpoaFdXSlBhVU85YnpTb3RwbVdLWndobTF4ZktsR0ljWTNCQkUwbmJi?=
 =?utf-8?B?SUZxN3YrUG1PeTRVZ2VDUkVWblpjVlIvQ01Fc3VDNXdDVFY1dXVYMVNHN2Mx?=
 =?utf-8?B?blNMY0Y0RGwxQnhNTlA0QUpxc0J0cE9rOXJaRmdsN0ZjQ1NaUjQ5RHY1ZmZZ?=
 =?utf-8?B?WmU4MWNaZXpHKzJ6TFA1cU1jRWF6QnRNOW9xSldCc0dYcC96WWZlSUlrdEJs?=
 =?utf-8?B?RDBjU290NHVuekxxeE5ObDh1N29waWlQbTVhellNQ3FSN29JRWhSTDdOYU5J?=
 =?utf-8?B?RWZnNDRIS1BIWTdTakF2cXFBSEQwdkE2Y3Q0Rk14bDEzcjJLOHFpNzhaSm1Z?=
 =?utf-8?B?QUk1RVZjenBxd1h3azZ1VGxtSkZNSjg3ek0wQnBiN3dDZFJITWJwRWRkWEh5?=
 =?utf-8?B?d3hFTExjZEh3bHIvR2ZMUnNBNVY5ajJFQ2lrdzN6Szdaa3JMMjF0THdOanA2?=
 =?utf-8?B?Nmtsb0RMQXczRzgrdW13QnNGbjBWMHRZVzhLSjVQdU9WSTAvekE1bjJmRUNO?=
 =?utf-8?B?ZHRld3dPQi9maE9zOHZtbDhwVll1SVpqcEU4NkhwbXJ6dFZnQ0Jmc0xjWW5C?=
 =?utf-8?B?MmZNRW9zRGRXS2tzeHpNeTZTT3hHL1FKK25BWkk1Lzg2OGh1ZlhPZ2VOd3pW?=
 =?utf-8?B?RTZyVTNGTnpNZGxWSTRCT2xlbjBnQkVNVng2dlFkeWtFMWJwcGkwc0NuS3Rv?=
 =?utf-8?B?SkdTd0NRcWQwdzhmVURqMlU1dUVCK0Fqbi82TDA3VDVLWUZtTlZ1SlF2VkJN?=
 =?utf-8?B?c0FNbVNIQzZsTGgvMlFmTE9MNjFWb0d6V2dsOXJKTXVQT2QxMHdpdFRNMTh0?=
 =?utf-8?B?RHZodHJVajV1Z2dJZ2d0WVV4T0dXVU1Vd29sb1hNdEJkclJxUUlPMWd1MmNJ?=
 =?utf-8?B?bWN5VURZbnJBM0xmVEF1S1VicTQ2bUNVMXUrWTVuWkI5a3ZmWG9uZTZuczhj?=
 =?utf-8?B?ZjAwV0ttVHR6Y2xsZlAyZy9HQjg0YnpUMCt6SmlOZXVqQnhGYlBQc0NpOEJU?=
 =?utf-8?B?c3BnMEV0d3BjT3gwY0JjY05kUG5NS1dqMFFEMG9EeHIwRkVHZC9qMFp1VGd2?=
 =?utf-8?B?WTNrbkFxUXo4ckIzcXpmK0VVbFBOU09SSzFkcDBEL0crMjNuTHAyc3hBY2RX?=
 =?utf-8?Q?B5CYp7KLZHEPgpH3EcxnJgqDq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5c169c-8e2d-474f-3921-08dd86ef9326
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 07:29:28.1912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4KtyWFrXE3cpGMCMIFMAum5C/LTL1ggFz4ajgTwFzPFe92vIdGH52ZEWS3mSpxR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597
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

On 4/28/25 21:31, Dave Airlie wrote:
> On Mon, 28 Apr 2025 at 20:43, Christian König <christian.koenig@amd.com> wrote:
>>
>> On 4/23/25 23:37, Dave Airlie wrote:
>>> Hey,
>>>
>>> I've been tasked to look into this, and I'm going start from hopeless
>>> naivety and see how far I can get. This is an initial attempt to hook
>>> TTM system memory allocations into memcg and account for them.
>>
>> Yeah, this looks mostly like what we had already discussed.
>>
>>>
>>> It does:
>>> 1. Adds memcg GPU statistic,
>>> 2. Adds TTM memcg pointer for drivers to set on their user object
>>> allocation paths
>>> 3. Adds a singular path where we account for memory in TTM on cached
>>> non-pooled non-dma allocations. Cached memory allocations used to be
>>> pooled but we dropped that a while back which makes them the best target
>>> to start attacking this from.
>>
>> I think that should go into the resource like the existing dmem approach instead. That allows drivers to control the accounting through the placement which is far less error prone than the context.
> 
> I'll reconsider this, but I'm not sure it'll work at that level,
> because we have to handle the fact that when something gets put back
> into the pool it gets removed from the cgroup kmem accounting and
> taken from the pool gets added to the cgroup kmem account, but
> otherwise we just use __GFP_ACCOUNT on allocations.

Especially for the user queue case a lot of those allocations are done from a background worker were simply using __GFP_ACCOUNT doesn't work.

We need to track for each BO who created it and either switch to that group before allocations or just account to it directly.

> I've added cached
> pool support yesterday, which just leaves the dma paths which probably
> aren't too insane, but I'll re-evaluate this and see if higher level
> makes sense.

The DMA path is still used quite often, especially on laptops with APUs and limited addressing capabilities as well as basically all non-x86 architectures.

> 
>>> 4. It only accounts for memory that is allocated directly from a userspace
>>> TTM operation (like page faults or validation). It *doesn't* account for
>>> memory allocated in eviction paths due to device memory pressure.
>>
>> Yeah, that's something I totally agree on.
>>
>> But the major show stopper is still accounting to memcg will break existing userspace. E.g. display servers can get attacked with a deny of service with that.
> 
> The thing with modern userspace, I'm not sure this out of the box is a
> major problem, we usually run the display server and the user
> processes in the same cgroup, so they share limits. Most modern
> distros don't run X.org servers as root in a separate cgroup, even
> running X is usually in the same cgroup as the users of it, Android
> might have different opinions of course, but I'd probably suggest we
> Kconfig this stuff and let distros turn it on once we agree on a
> baseline.
> 
>>>
>>> This seems to work for me here on my hacked up tests systems at least, I
>>> can see the GPU stats moving and they look sane.
>>>
>>> Future work:
>>> Account for pooled non-cached
>>> Account for pooled dma allocations (no idea how that looks)
>>> Figure out if accounting for eviction is possible, and what it might look
>>> like.
>>
>> T.J. suggested to account but don't limit the evictions and I think that should work.
>>
> 
> I was going to introduce an gpu eviction stat counter as a start, I
> also got the idea that might be a bit hard to pull off, but if a
> process needs to evict from VRAM, but the original process has no
> space in it's cgroup, we just fail the VRAM allocation for the current
> process, which didn't sound insane,

That is insane.

The problem is that you can't let the allocation of one process fail because another process has reached it's limit.

That basically kills all reproducibility because userspace can't figure out why an allocation failed.

Regards,
Christian.


> but I haven't considered how
> implementing that in TTM might look.
> 
> Dave.

