Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C577392E1B
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A136E8BF;
	Thu, 27 May 2021 12:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2067.outbound.protection.outlook.com [40.107.102.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029C66E7F5;
 Thu, 27 May 2021 12:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv3wyq+D71GXCXbRNWG87yRebtNc58a2em6LkTQ35+yzRzuO8taW5sDsjRlNY4S8ug9BIrYTwGzPcjjbi5w8yKOHywIhESz/A/YI09ZFsLr2w4xa33ycGqEJxYmL+TgNMrFT7CzkGcTOxQosyfde8GeVbyQmj9pa2q2CMIn+Of4gNrhyAyPGFNMpmymnpLj2aKOevW5tw7lnSNXk48KH2T/9lECzwS+xa+aYf2sUgAtzktxtSotZsjTuPGK1POa/LP0i4VzwOwmLCbnSwRkR1KvDZiI4+amSTBWo5+EYRKiZM1SXkdMDNA5qt3pGtWnb/hJxXieTCVroAzth1qaaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewM0yHI5dFtQI4rDQ/M8Rpv1gN1AArGPt6T7LitUEqA=;
 b=PSr6mhjIZH3NJ+KJeHoGOMIRn2iMbCRJzDdVXmJYanrr6PPJcT9WpvCdYBVCWA/fClx7dK48SonjLHLUs7KN6PX/DoVnT5mgQhrimZa6GUUQiSAAIuEdpa/B1MVgAEflj2V9FejQhTFJrpY0q+ToOVXWwUG/03wdGcq7qhQqdTFeYFyo+/By542POob4HhcxDTxTdcu+BoguzbcflbuL9wU1fCP+d65XeL0xxyguwg6HiXFA6J3z54zjg8VxHanWiddwZNcLwAbXlB/WYfeB2TDwu0mATW4tkUnAD2hnPCJFhvEmQij1EE1PQgMXxUO7qyQ/nfqx0TTXp6QBk+CM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewM0yHI5dFtQI4rDQ/M8Rpv1gN1AArGPt6T7LitUEqA=;
 b=eIlTilojEa5RakKH3qNsjLR27nD/gvGAIs4vKMJuazv+u0GxRjbcMkDWYfImC2SWj6dujbbyuI2wMGuI7TD7BLiAOKvE0dtbq8oKAAWWlOl5LgCGFHF1pFK49qtzi4tWisidiZunl+LsZ3bdjvTzGm67wfIURnDB+XAOm9BNEQk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2482.namprd12.prod.outlook.com (2603:10b6:207:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Thu, 27 May
 2021 12:36:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 12:36:44 +0000
Subject: Re: [PATCH v4 10/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-11-thomas.hellstrom@linux.intel.com>
 <9f49eb8e-8ec5-cb24-0ce1-3e63272628e8@amd.com>
 <b2fea11f-bc69-7347-1781-79626c2d5ceb@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <562ed088-5b43-7b3f-703e-37c21d3933ef@amd.com>
Date: Thu, 27 May 2021 14:36:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b2fea11f-bc69-7347-1781-79626c2d5ceb@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e531:3aa1:4782:878a]
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e531:3aa1:4782:878a]
 (2a02:908:1252:fb60:e531:3aa1:4782:878a) by
 FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.10 via Frontend Transport; Thu, 27 May 2021 12:36:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f30df5e-b5bc-4041-f94f-08d9210c15bb
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2482BDAD46DC58E1078E143D83239@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5yRHU8SKIg1flvbUM/0pY9YXCagYb5UhHnRKNIIpZeLJNSwXBRB6vXdz+MCJYs7kP6/RwlK6WZ4jUohRK3OuQeu7XmilAy11/8tMHmS7+GRu9XyusG43SASk8XYdPVex3B26deW4Hdh/t1Xs9g3fAiTgv/M9taB55/QqVnpVV7hGVHMymQPwgDkosPwsvDQLBOVsQDaOL13/zm5qCsiMQzSvmR0jHG8Y7931aAnZz4fTQD33RnEonD/h6rQuYViW3m7FmBlgqJI319oRXcBfcWT5/sJ8Bg4e26eQaCkjS6wo35p1oE01qQQLkaGKAwun4zTQUbfC6NwZgmMhPa9A5FMDo0al0SSepMrrhZ6E9EwFUl1z7YZZ+jmV1n2vJZdxtg4VjFhOxr+5tWLfy+GX3ZxRgN79m5BdRBAHBR/nm5XhTTcumlGJ5uAe1V4NTUg3t2Lp89TaNEzeGQat7EWCoee6hne68tX4qOSZc9HaReR/ptI1Rk1KiF567I+3zKL8ptbC0HJXCUbqJjx6L+lLvgjMzP8ibwMlXDlu7nCBvzbuibxlNyZ7xCI4PRVTUXdbg+WszWd1y82zmHvWH5yYFya3qy4hDpM9LHchRyGTpvvi/Un1ElVwOQVnLT0sLQ+cI3zpruzt0zi4VIJuYnhANTu2bMbEjnLNTxmNNFeKeI5xhgIm5KGFVn/TLzxuGpHj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(31686004)(36756003)(52116002)(53546011)(110136005)(478600001)(6486002)(83380400001)(316002)(8676002)(66946007)(66574015)(6666004)(66556008)(66476007)(8936002)(5660300002)(2616005)(31696002)(2906002)(86362001)(186003)(16526019)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVJuM012N2NKVmlVRzRwWWxwUStiUWc5djJqS3ZiWVlrQ0NpN0FEbDRLbDZ5?=
 =?utf-8?B?QjhzT2dDM2YzWVAvN3NmWXFWbG1tYkdOa3hhMmoxdHMyWjhrMTZQQTZ5eGNq?=
 =?utf-8?B?cTBlZFhWMDBna2ZnSXNQa0F5UEZrTzZtb2RXOUhsZ3JjK2VzeVladVhDS1JM?=
 =?utf-8?B?VkZCTjJlNU1ncE4vdlUwTEpZdHdlVWNZNXNGbmxwaVJUd3JHM21MMExxK3h3?=
 =?utf-8?B?amcyeWt3a2hMVG1BQk5ieUhHYWxadTJ5YW1xeTdCSWZGM2V1WHF1T3ZGM3Jl?=
 =?utf-8?B?eFQ0cWJVU2QxY21mUk9WSlRHOEg4ZEdScExSNGVwS1ZnUU1hUWFaUThVTzRR?=
 =?utf-8?B?SjBwdzhFYlIwR0hHS09JbHc5VWxRRzhmQVJlVzlXdktTb3NnaExQQWFPR1No?=
 =?utf-8?B?VDZRU3VsbVY3YnpmV1FNaVZQcG14eURRNVpON0dOdGZ3aWVVQUNmMzhHZUpr?=
 =?utf-8?B?aFVRRkRmV1lHZ2QwZjdoRXlhYnJmaG4yU1JOSG5JTFBuMVIvdE1yWW42TzEw?=
 =?utf-8?B?RWFnL0ZNblJjQnpsS0ZrcjFlMG94SGZtaWs2emphdktxUzJNcU9VN1ZCR1ZI?=
 =?utf-8?B?a2kwUEtxd2hqRERhcUM0SzJvdzVyQWIyS3I4RzdmeDBROTFDakozSGoyL0tq?=
 =?utf-8?B?V0xXdm04WndheE92NjlhK2xOdUZ2QXdDSWlMeXhMWVNOblpjYWpyK3RtR3Rq?=
 =?utf-8?B?NnorR1FHV3Avcm5zekVNT0FPaUwrc051V0VHNFRaeTgyb2MyRXVTYzVDdGNv?=
 =?utf-8?B?NDErQWt6bU5nOFlaQjVkK3hPZGt3Uks4Q01Vbmd4VDh0MnZKdTU5VGtLdnVo?=
 =?utf-8?B?aTdmM0ZxdHBxb09oMGFXQnJUUWZlTUVoVGZucmxyZXBQVFNGNG9GU25vN25z?=
 =?utf-8?B?ZGhTQXBzN3dHYVF1SkMxTURYMG1jYmI3RjREa0JuK01iTytGV0pzZDRqQys1?=
 =?utf-8?B?V2h0dyswYnRmUHYyODdBS1hIVSsvbUxsYWx5alNxdHM0STBMMTBENlVQRDNz?=
 =?utf-8?B?cFZ3K0RNZGowSnc2YnI3Zy9qTDQyZWNBOW9zQ1JIQWpIN2g4QW5LWDNWd04v?=
 =?utf-8?B?V0lNUXIvM28wc0hlQmVPbzl1dE0xZFBzdTdaRDRVTS9rL2FINmhZOXdRVW9h?=
 =?utf-8?B?eUlHVHROdUVMMms0N1puaVFTQmJZSWhYTzQyTFQwUmZ2REkxL1FUSDh0K1ZT?=
 =?utf-8?B?YlN6VkNyUkMvWElWdlYyVlF2UFhsVG5GYzJJd3FyM0xuay8xQ3B5TVRieTBK?=
 =?utf-8?B?Ulh6K2hUVkhLZ05KMDNJcEpTVnhOK3JhL3Q1NDh2eTR4bHVvclBLZVo5TXFN?=
 =?utf-8?B?NkF6QTluT29rWXRzSVJ1MVhLeDQyUUgrazJlZjdDWFlZRERUT3hYMXBaWndN?=
 =?utf-8?B?c1J3eTlnRWEyeE1RUWRRaTI0WXVoclVZOEVRd0ptdmtFR3hKQVgvOWlpUXRt?=
 =?utf-8?B?cDRsZ2hxMkNLVHVKV2ZselpRZTA0T2hkVTY5bGpOaXAxaFNUYkdzejhMeTNt?=
 =?utf-8?B?V0pONnBrWkZFVlY4M1psd04vcWxBSkNCaEc1TmdBamhWWDVMb1liNXluS01R?=
 =?utf-8?B?OFIrNlZCemxHUXV6eFpDbGUwbTFkU1kvbDdxQ1hKSy9ERndJR0Z5R3RvVHhG?=
 =?utf-8?B?NnZpUUlHbmRvMEhWYlR3N09CT0hxTlcwMW1HV3F5Ym8yWVY1Ukl2Z2Jwd1JV?=
 =?utf-8?B?ak9qMjljaCtKTlRJc2ZOQ3ZoK3E5QWpYTWMzYlpXNGtiMFNrRkJvaXZsK3gx?=
 =?utf-8?B?VFk2SEFwcFcwNkxZOGExZWFzSHpCZVRrUzZLc29RcnVibHNtQ3BSemdlaXBN?=
 =?utf-8?B?dlNiUW9LQWdxRmIvb1dTOGdGbXpPMUJ1S0IrSjJuY2w1M2dWNW9DKzZYRm9m?=
 =?utf-8?Q?GH+lTVcSxWUcJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f30df5e-b5bc-4041-f94f-08d9210c15bb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 12:36:43.8999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4+4/1oMKvzDXKGRFctStbpNh2Q15mPI7FETKlhEJ0mHN+um9C1JTZlaC6UyIpds
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
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

Am 27.05.21 um 09:33 schrieb Thomas Hellström (Intel):
> Hi, Christian,
>
> Thanks for reviewing.
>
> On 5/26/21 3:26 PM, Christian König wrote:
>> Am 26.05.21 um 13:32 schrieb Thomas Hellström:
>>> We are calling the eviction_valuable driver callback at eviction 
>>> time to
>>> determine whether we actually can evict a buffer object.
>>> The upcoming i915 TTM backend needs the same functionality for swapout,
>>> and that might actually be beneficial to other drivers as well.
>>>
>>> Add an eviction_valuable call also in the swapout path. Try to keep the
>>> current behaviour for all drivers by returning true if the buffer 
>>> object
>>> is already in the TTM_PL_SYSTEM placement. We change behaviour for the
>>> case where a buffer object is in a TT backed placement when swapped 
>>> out,
>>> in which case the drivers normal eviction_valuable path is run.
>>>
>>> Finally make sure we don't try to swapout a bo that was recently purged
>>> and therefore unpopulated.
>>>
>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>> v3:
>>> - Don't export ttm_tt_unpopulate
>>> - Fix confusion reading the locked pointer instead of the value
>>>    pointed to in ttm_bo_evict_swapout_allowable (Reported by
>>>    Maarten Lankhorst)
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 +++
>>>   drivers/gpu/drm/ttm/ttm_bo.c            | 43 
>>> ++++++++++++++++---------
>>>   drivers/gpu/drm/ttm/ttm_tt.c            |  3 ++
>>>   3 files changed, 34 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 3bc3aebfef7c..45d194bffc3f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -1348,6 +1348,10 @@ static bool 
>>> amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>       struct dma_fence *f;
>>>       int i;
>>>   +    /* Swapout? */
>>> +    if (bo->mem.mem_type == TTM_PL_SYSTEM)
>>> +        return true;
>>> +
>>>       if (bo->type == ttm_bo_type_kernel &&
>>>           !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>           return false;
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index be0406466460..1b2d062266ed 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -536,6 +536,10 @@ static int ttm_bo_evict(struct 
>>> ttm_buffer_object *bo,
>>>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>                     const struct ttm_place *place)
>>>   {
>>> +    dma_resv_assert_held(bo->base.resv);
>>> +    if (bo->mem.mem_type == TTM_PL_SYSTEM)
>>> +        return true;
>>> +
>>>       /* Don't evict this BO if it's outside of the
>>>        * requested placement range
>>>        */
>>> @@ -558,7 +562,9 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>>>    * b. Otherwise, trylock it.
>>>    */
>>>   static bool ttm_bo_evict_swapout_allowable(struct 
>>> ttm_buffer_object *bo,
>>> -            struct ttm_operation_ctx *ctx, bool *locked, bool *busy)
>>> +                       struct ttm_operation_ctx *ctx,
>>> +                       const struct ttm_place *place,
>>> +                       bool *locked, bool *busy)
>>>   {
>>>       bool ret = false;
>>>   @@ -576,6 +582,14 @@ static bool 
>>> ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
>>>               *busy = !ret;
>>>       }
>>>   +    if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, 
>>> place)) {
>>> +        ret = false;
>>> +        if (*locked) {
>>> +            dma_resv_unlock(bo->base.resv);
>>> +            *locked = false;
>>> +        }
>>> +    }
>>> +
>>>       return ret;
>>>   }
>>>   @@ -630,20 +644,14 @@ int ttm_mem_evict_first(struct ttm_device 
>>> *bdev,
>>>           list_for_each_entry(bo, &man->lru[i], lru) {
>>>               bool busy;
>>>   -            if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
>>> -                                &busy)) {
>>> +            if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
>>> +                                &locked, &busy)) {
>>>                   if (busy && !busy_bo && ticket !=
>>>                       dma_resv_locking_ctx(bo->base.resv))
>>>                       busy_bo = bo;
>>>                   continue;
>>>               }
>>>   -            if (place && !bdev->funcs->eviction_valuable(bo,
>>> -                                      place)) {
>>> -                if (locked)
>>> -                    dma_resv_unlock(bo->base.resv);
>>> -                continue;
>>> -            }
>>>               if (!ttm_bo_get_unless_zero(bo)) {
>>>                   if (locked)
>>>                       dma_resv_unlock(bo->base.resv);
>>> @@ -1140,10 +1148,18 @@ EXPORT_SYMBOL(ttm_bo_wait);
>>>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct 
>>> ttm_operation_ctx *ctx,
>>>              gfp_t gfp_flags)
>>>   {
>>> +    struct ttm_place place = {};
>>>       bool locked;
>>>       int ret;
>>>   -    if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
>>> +    /*
>>> +     * While the bo may already reside in SYSTEM placement, set
>>> +     * SYSTEM as new placement to cover also the move further below.
>>> +     * The driver may use the fact that we're moving from SYSTEM
>>> +     * as an indication that we're about to swap out.
>>> +     */
>>> +    place.mem_type = TTM_PL_SYSTEM;
>>> +    if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, 
>>> NULL))
>>>           return -EBUSY;
>>>         if (!ttm_bo_get_unless_zero(bo)) {
>>> @@ -1168,12 +1184,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>>> *bo, struct ttm_operation_ctx *ctx,
>>>       if (bo->mem.mem_type != TTM_PL_SYSTEM) {
>>>           struct ttm_operation_ctx ctx = { false, false };
>>>           struct ttm_resource evict_mem;
>>> -        struct ttm_place place, hop;
>>> -
>>> -        memset(&place, 0, sizeof(place));
>>> -        memset(&hop, 0, sizeof(hop));
>>> -
>>> -        place.mem_type = TTM_PL_SYSTEM;
>>> +        struct ttm_place hop = {};
>>
>> I would stick with memset because of the padding reasons.
>>
>>>             ret = ttm_resource_alloc(bo, &place, &evict_mem);
>>>           if (unlikely(ret))
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c 
>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 913b330a234b..d9793cbb6d13 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -263,6 +263,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, 
>>> struct ttm_tt *ttm,
>>>       struct page *to_page;
>>>       int i, ret;
>>>   +    if (!ttm_tt_is_populated(ttm))
>>> +        return 0;
>>> +
>>
>> This here is just because of a bug in the higher level function.
>>
>> I've just pushed the fix for that to drm-misc-fixes, so maybe drop 
>> that here as soon as this is backmerged.
>>
> That code doesn't look correct to me. In ttm_device_swapout only the 
> lru lock is held, and the bo->ttm pointer is protected by the resv 
> lock, meaning that bo->ttm can disappear at any time in that function, 
> so while an advisory reading bo->ttm using READ_ONCE() is ok, 
> dereferencing the bo->ttm pointer without reservation held is illegal 
> and may send you into recently freed memory.
>
> For an example, consider
>
> thread A. Selects bo for eviction, moves to system lru, creates ttm
> Thread B locks lru in swapout code. finds bo->ttm NON_NULL,
> thread A tries to evict bo, fails, destroys the ttm.
> Thread B derefs freed memory.
>
> But even relying on that there were no such example in the ttm core 
> itself, not adhering to the protection of bo->ttm makes the code 
> extremely fragile and IMHO needs fixing.
>
> Also as a secondary note, a driver is in principle free to do things 
> in the swap notifier that may result in an unpopulated ttm so IMHO a 
> late check is needed here.
>
> So ack to keep the above?

Oh, really good point. Haven't thought about that for the quick fix.

I think for the short term we need to protect TT destruction by the 
spinlock.

The problem doing it here is that you end up in an endless loop currently.

E.g. you trylock and inspect the same BO over and over again.

Need to double check the code to see if that can somehow be avoided.

Christian.

>
> Thanks,
>
> Thomas
>
>
>>
>> Christian.
>>
>>
>>>       swap_storage = shmem_file_setup("ttm swap", size, 0);
>>>       if (IS_ERR(swap_storage)) {
>>>           pr_err("Failed allocating swap storage\n");

