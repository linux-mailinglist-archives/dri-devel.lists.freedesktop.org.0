Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD268A53F8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CE7112614;
	Mon, 15 Apr 2024 14:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yUpvLxMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED0F1125F3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkGwWJIyC4Lwv56WPryiwy5luiMyGC5XBVtP4LXuhIVTVAMlA1SS3uPC/dpGEfPejgpitJ23wI2t0wTdTRsMm45t+Sgq0P9LkPfyWrAUARpH8k5rn4/9bT6XJwBOwD08YWdY+cCetU4P1GRPH0y3IOoc6GbxvdkHUOoqt4/1V6UB32+DY3WDDQWUM2xmcpgdx2QERUEjlBRnZJUPeepDJIu9jbjwAH5HWnX7r5I3Uf+azAqlL4qDL99SoOxoowD+sXp9aWNAR49aZBMPf3qeX/r30nNikeH4kemqLDYOp3IslBwglhk1eUnAw0fU2zFOlwS5ziJQekt8B1nDXlNQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BnV8DedyTTZtorYxu0B87EsM4ZjYTXF4o4n0xE8Dmg=;
 b=fY+Q20zWfnLVNgH5ffIRYV9uyARaKRj8e2C45SCZy3Vuz5KHjjbarhg7nRfGgP8klETK94xbs9LQ+ntLDv9e/yezCitEy0YXSq5sJQlzUafP+6fw91W0Gb9IvA7i9UxdF39QU2tvQTgSUjCU/Xqbcje/aGmd8Y6MJp5jIsBSZxEX5namOVhTd6tHmyQVQW3puq35vfWK+Szeln1QJ4XptN1Z/RJt6KJj9H8Up5NlOfTUrSfHzLxop/fQ8kaOnFP36Hr/S2rlBdFaD5tGETwrsUoCdbojZVNQFTCvt4Z/fVqK18lDwwoDRzeiJYSMRyoCjF32lvFUUhuBpug97bDpuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BnV8DedyTTZtorYxu0B87EsM4ZjYTXF4o4n0xE8Dmg=;
 b=yUpvLxMFaIjtKOXr6QlQ+FoA49Fze5epb0wuXcH2RCExm7mZwucj8zkcQQ7xa1ukk/0Kda1s3W0XsiMBdVayanaEHU6bw2tI/67DmurBv3rz87xjyxE4GWalBhdRjEWBvCRPoepXAO8stcbKer9viUdSaWsYK6rQgq8PkV8VDII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7106.namprd12.prod.outlook.com (2603:10b6:806:2a1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 15 Apr
 2024 14:32:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7%3]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 14:32:51 +0000
Message-ID: <214a8afb-b338-4470-879a-c172efb4e9a8@amd.com>
Date: Mon, 15 Apr 2024 10:32:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: stop pooling cached NUMA pages v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alexander.Deucher@amd.com, Rajneesh.Bhardwaj@amd.com,
 Steven.Roberts@amd.com, dri-devel@lists.freedesktop.org
References: <20240415134821.1919-1-christian.koenig@amd.com>
 <4b04b1d7-2215-42ae-a65a-eb8103bb847e@amd.com>
 <345a958f-dde4-4211-850c-7b23ddd71b0b@gmail.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <345a958f-dde4-4211-850c-7b23ddd71b0b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::30) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: d68b49e0-2ab1-4ac7-aa02-08dc5d58ee33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMYydYWIWLVbp+X0kuTFSpYfyqWLMud/G5z0p5VNNV1mPzWWF/pWh4cBZbEB1kJWeCw51OPfv2QCzj2jf7P4qt3pvuYc15gYFzzehJWCDrGQWCgcVf2qPdW/H+O9SIXR7H3EW2P8evs7PnCCXkPrVyyrX/JF6AeTykdspnhoPzyVmU0Yx5wYwSM2yBkl+ap5sRi6D79513ooENPRFAivZalk5Ae48axGlDFxnsAvBd8FF3aACvZzn/rx+oYt7U9gSGFBQ+QGIMj9gi1feEWn9+9sqbl/tAFJHFrPzSwxlbD4t1zE0cSxvgi991ekCYHTavbI5MraiAEN51idTgeD1RlrdrZyAPryC8+slIfW/n9CvSAn64ANZzNhQs1d2QhkREfKGk5xQMVI12V35+DDKdF3homftaEISTwcCvty9HF2fE/FVZz3a1ia8O2tlumTmOeo2ePVkRXE472yxB71xTlU4GLyUcHGt1QD/g027fzA4EU7g/Q52CGi/sGvZchMO2FaRfFAMf0KZNKOEeyrzu7AgoB1nLAHuC/oGxh7C3WHY3+8cIp1KIH8+u1ZEzmvMYlLP+DbeQfn54QYECqYkde8jHGCEZnvODAxEbJsZKtrVx6Nt0UAYmNq7gzJuEqBFR6MxiaA18Pvfaejv70KnhM5Q4ZGVIliKpU5fSbi2Mk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVJMVlRJM1pURXBSbmd1MDdFWlJEUlNyTU9tcWVxd0d5Nk9tZnNVK1VreGVR?=
 =?utf-8?B?bGFvRVpmMS9pTFdqZ1N1Mi9xV2xNcnl1ZUYzUmllRHZMTm5PY1ZsNXJVeXBD?=
 =?utf-8?B?aU1adUlNcCswQTM3VkcrUXpuVzdRa1BkYmdCNnJ1VVFkR1RZblhjZEwyY1Vw?=
 =?utf-8?B?VG83VE9takxEZkEvVjB2TWY0VmkyTEFFQitmcUFyR1dGZjgvR1NjOFNNNW04?=
 =?utf-8?B?Z2M5OSt1OENxR0htWFcyMU51dFk0dXc5Nm5Ed3dQVERyWkRPVXBtRForS0Jv?=
 =?utf-8?B?THlZeDhZSVQzWnJzYml3TWpMQkZYUEtuVUxJNjY2aW9zSkt1cmdlbHRqcy9O?=
 =?utf-8?B?RjBGcnQyZVV4ZSs1UGs3WS9jZyt6Vm55NkxMaXRTU09RMGp0QjlOcTNHWHQw?=
 =?utf-8?B?TTd1L3FLcEI1S1FsSENMN1hzaGNVS3V1b2tuaGdPR21JeXRQVTNEai9zeisr?=
 =?utf-8?B?M1diVlRYM0VTbzNidHJwV2FWV1RQdEhUN2xCVXI1aVJoc2xUQU1PM1ZGdjR3?=
 =?utf-8?B?ajg1ZmxEQ0FRT01nbUt5TXRaeHprT0JBNjNaL1lUU3hTVWpqd3lCbUpsci9r?=
 =?utf-8?B?RUVuOFcvWVZ3dHNtNXQzN2dXL2tydWJ1NWZqOE5lVmtnbGhPOXRtbG93UWNm?=
 =?utf-8?B?QWdHdURmQkZDRytzU3lJMFVVeS9pZmlZV1ZkTXpIR1ZVdTJUdlFQTEJ0WUc2?=
 =?utf-8?B?bzc0b0ZjYys4Tjd1OTAvT3BiSWk1UUJFdmtqM1o2R1g4WG9zNnZ2Mk4yQ0NT?=
 =?utf-8?B?SnRRSmFja3dJNFB0T3B4R1dLUENrZkxObFJHZnZFbFlXWkF2MlZzY29ORmlJ?=
 =?utf-8?B?RVNDcVpSaUZvaWZWQ2VDRENMVXZMUTQwYTNmL0JnSWdpRGZlZnZlSERPVi9D?=
 =?utf-8?B?Rm9GNkVXd3IzYldIc1pyWFhVdXhITTdiR0ZkR25vVy8vT1FKM0dMMDVDU2V0?=
 =?utf-8?B?NlpmN25mRHVINEVZUTlXdUNMOTM3TnpsKy9qMTRuSnJ4dlJyOENjbXB2L0Y0?=
 =?utf-8?B?TXdsNjNEdW05STc0ZUhqTkZLb3pFY0hTM3pqTno0Um1nTGNLN2VUbHFZVFY5?=
 =?utf-8?B?ZURhTDUvZUd0YnBFczNPSjRJZkowRjJGb25LSGZjYkVRbDJ3REo1Tk1pd05I?=
 =?utf-8?B?R2hiaEVBa21QV0VIZDNIUE96bXcyNHR1SDdtY1F3NW0vQndYSUhyV3YxdEZp?=
 =?utf-8?B?em1PN1g5QndGaXFMaHNHdzk5cGplNFF1cEtnUkc5MzZ5RGNoUkJTTzdXaEZP?=
 =?utf-8?B?dVFvU0FtZkNhYVBCd1VjN01hdkpENVVQemJncXl6UEhpMFc0SXM3Z0ZVYytu?=
 =?utf-8?B?TDJOMWpFaHlNeW5TdzNEdXg2VzkwbFQ3dlE4alFWeUNIajhZSmN2cjRpNDJW?=
 =?utf-8?B?aDZhSXdnYTVDK3pNcnVjaHVvTThnVHZNZnpKZHlZejVxRWI3T2t2YWxOWnNR?=
 =?utf-8?B?YnZsZmE0N2ZQdlZ5ak1pdjBTQ0s5aXh1RE5Da2svaCt6T2JKY3BjM2cxd2pJ?=
 =?utf-8?B?N2pMQ2Vaek0rY25idlVvb3V6WU5TRHFXWU1sN0xXa3BiUkRpb0V4THBrb3d5?=
 =?utf-8?B?cldBdE9qeXVBYTB5c0RPYW5MU284a1hvUkh2THpxM3hmZ2UyZnRzUTl4UWZS?=
 =?utf-8?B?YnA4cHdnWGxqbnV6d0xhdXRkZGliSHFZUWNvUm9uOGdPL0VWUEdWVW8zNWV6?=
 =?utf-8?B?WThVTU50bDNqdnZ0VXdiZU94eWNmMGtaMkVPd2ExVUlBd3NvNWRmS3dJZmFK?=
 =?utf-8?B?a1o5eG4xbHNqQ2VDNUJmcjBFNmtSZEp1cGRSM2x1QUx0RXoxSFQ2TDRiKzdD?=
 =?utf-8?B?UEpGNEdWSThKVW02ZjhTZWZ6QjFWQWRGOGtaZmJ6ejltMklIYjkzMXhlRTY0?=
 =?utf-8?B?dWxEV2VHbDlTYmJDWFNkUXRjd25ucjNSM2dKWlBJTHpOSFV6d2JGckxTeWNV?=
 =?utf-8?B?ZEViTzlXSDNBUng5U25Zb3h5SDJYYzlLWTk2T2ZyeXFxVTh2S3VZZEMxcjRj?=
 =?utf-8?B?UndQVy9iKzlmMmE1MmR2eVA0N01JNXlBajVJVjV4dFZTeUJVdTE3MmMwK3l6?=
 =?utf-8?B?bllSVFdZYWhWaE16NmpVanpNdEJ4RXRnZ3BPYXc5SjJNK2FTNFFJT1JHWFNm?=
 =?utf-8?Q?pgt2Iq98CYK+F70GRjM0b2AKl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68b49e0-2ab1-4ac7-aa02-08dc5d58ee33
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 14:32:51.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKlQ7g4aP/uLeKW5k5KSdOQL3MjLFKzwWkqpvhovnJ5bVtwnQTaWLwWG0ExHh4NErPFgFBvm2WXM1V4HEUnv3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7106
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

On 2024-04-15 10:08, Christian König wrote:
> Am 15.04.24 um 15:53 schrieb Felix Kuehling:
>> On 2024-04-15 9:48, Christian König wrote:
>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>>
>>> We only pool write combined and uncached allocations because they
>>> require extra overhead on allocation and release.
>>>
>>> If we also pool cached NUMA it not only means some extra unnecessary
>>> overhead, but also that under memory pressure it can happen that
>>> pages from the wrong NUMA node enters the pool and are re-used
>>> over and over again.
>>>
>>> This can lead to performance reduction after running into memory
>>> pressure.
>>>
>>> v2: restructure and cleanup the code a bit from the internal hack to
>>>      test this.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Fixes: 4482d3c94d7f ("drm/ttm: add NUMA node id to the pool")
>>> CC: stable@vger.kernel.org
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_pool.c | 38 
>>> +++++++++++++++++++++++++---------
>>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index 112438d965ff..6e1fd6985ffc 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -288,17 +288,23 @@ static struct ttm_pool_type 
>>> *ttm_pool_select_type(struct ttm_pool *pool,
>>>                             enum ttm_caching caching,
>>>                             unsigned int order)
>>>   {
>>> -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
>>> +    if (pool->use_dma_alloc)
>>>           return &pool->caching[caching].orders[order];
>>>     #ifdef CONFIG_X86
>>>       switch (caching) {
>>>       case ttm_write_combined:
>>> +        if (pool->nid != NUMA_NO_NODE)
>>> +            return &pool->caching[caching].orders[order];
>>
>> Doesn't this break USWC allocations on NUMA systems, where we set a 
>> NUMA node for the default pool (at least we were planning to at some 
>> point)?
>
> I don't think so, but I might have missed something. Why do you think 
> that would break?
>
> I mean the idea is basically if the pool is associated with a NUMA id 
> we should rather use this pool instead of the global one.
>
> And that is true for both cases, the default pool and the specialized 
> ones.

OK, I think I misunderstood what I was reading. It looked to me like it 
would always use a "caching" pool if nid was set. But caching here is a 
variable; each node still has specialized pools for write combining etc.

Then the concern you stated in the commit message "under memory pressure 
it can happen that pages from the wrong NUMA node enters the pool and 
are re-used over and over again" is still possible for uncached and wc 
pages. Anyway, it's better than not having NUMA, I guess.

The patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


>
> Regards,
> Christian.
>
>>
>> Regards,
>>   Felix
>>
>>
>>> +
>>>           if (pool->use_dma32)
>>>               return &global_dma32_write_combined[order];
>>>             return &global_write_combined[order];
>>>       case ttm_uncached:
>>> +        if (pool->nid != NUMA_NO_NODE)
>>> +            return &pool->caching[caching].orders[order];
>>> +
>>>           if (pool->use_dma32)
>>>               return &global_dma32_uncached[order];
>>>   @@ -566,11 +572,17 @@ void ttm_pool_init(struct ttm_pool *pool, 
>>> struct device *dev,
>>>       pool->use_dma_alloc = use_dma_alloc;
>>>       pool->use_dma32 = use_dma32;
>>>   -    if (use_dma_alloc || nid != NUMA_NO_NODE) {
>>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>>> - ttm_pool_type_init(&pool->caching[i].orders[j],
>>> -                           pool, i, j);
>>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>> +            struct ttm_pool_type *pt;
>>> +
>>> +            /* Initialize only pool types which are actually used */
>>> +            pt = ttm_pool_select_type(pool, i, j);
>>> +            if (pt != &pool->caching[i].orders[j])
>>> +                continue;
>>> +
>>> +            ttm_pool_type_init(pt, pool, i, j);
>>> +        }
>>>       }
>>>   }
>>>   EXPORT_SYMBOL(ttm_pool_init);
>>> @@ -599,10 +611,16 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>   {
>>>       unsigned int i, j;
>>>   -    if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
>>> -        for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
>>> -            for (j = 0; j < NR_PAGE_ORDERS; ++j)
>>> - ttm_pool_type_fini(&pool->caching[i].orders[j]);
>>> +    for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
>>> +        for (j = 0; j < NR_PAGE_ORDERS; ++j) {
>>> +            struct ttm_pool_type *pt;
>>> +
>>> +            pt = ttm_pool_select_type(pool, i, j);
>>> +            if (pt != &pool->caching[i].orders[j])
>>> +                continue;
>>> +
>>> +            ttm_pool_type_fini(pt);
>>> +        }
>>>       }
>>>         /* We removed the pool types from the LRU, but we need to 
>>> also make sure
>
