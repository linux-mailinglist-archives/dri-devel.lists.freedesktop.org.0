Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 525824E55C9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E25710E71F;
	Wed, 23 Mar 2022 15:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D2310E71F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 15:58:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9++4m2rA+E4A3h09o0chHzHjO66G+dKH9b+mXcKNRQHN6RAcJAxVg7mzQsRhS6lrZzXvMYZf+L6SgXAyBbc90OAZIoiEQv9Ymhu/z0Ri+AyIMxFQ7TMyFgB6KaMNQeGBNRB6uEketLYaJ1nTxwuzWB2EGdv/G3E+heMxVQgh+X24OIDwXZCzvGwM3uKBLqP2lXvr6KhTg7EqDuTPL7NXyIrAgm80b9SQYvAMQ7T1530RThC0VAiI++51GZamwcYsHAJoRPFiW3oAN0zfYqyz+X+0W266/ce/66/5jEZFSAaC21OjPCjgenRF7eoKRuROirBYwcoGhr+eWQwof2xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWBea4FrrM2MClg+dALCHMLzB1Xd1FpgQZeLt1qzHGU=;
 b=i/yGGpf74xwQcZoNfF7LyQ+qGX2/P5T6WZdZFAlw/+Cn0EQe6fMom10gN1iCuCYh9AzuuLUSpKx5bgIRzNq9+9CpMVtnXo0WU9t1saK8786oiMWNWtZl6jI3ieMn9Uw6BCysLf8qyZ2lDmUnoio7CTRaANJwhRfMoxV8v/tbtcvNhv63FA0CRFHZnrKXobywLWS74h009wp8twdJfLiZmtSMubC+yynoAYCs3HjUlw/UwQqTvryjplAawptCi7uPAJJsiB1yuVAFGUPna7rgJ5vHED0DyxKmOEOsBGMZy6j01oiqypOvZlDn9mNnmg3+fHjkZA+DpDyrAAJiXSZyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWBea4FrrM2MClg+dALCHMLzB1Xd1FpgQZeLt1qzHGU=;
 b=YawGt44OBq8MR7Qlo73AMmn+aDExsyUsYumJxxRYbztZwP3I1UWy22t6eAjfkqXhMjoIkvNpgPilDK4jpXadCBruUMjMybZGcIOeuWdZnqGTznA6nCbRP8E/qJ8rtDq7DTqilhS9qDm9qu1HBWxjMhSbfoJmPo/x1bl/SuzsZG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MN2PR12MB4205.namprd12.prod.outlook.com (2603:10b6:208:198::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 15:57:58 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::54ea:af56:9e64:7e51%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 15:57:58 +0000
Message-ID: <00ab0327-8b51-b223-b2b5-3fe66072bde7@amd.com>
Date: Wed, 23 Mar 2022 16:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/23] dma-buf: add dma_resv_replace_fences v2
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <c25fd1c5-aef3-9abf-ab94-e901904bc4ea@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c25fd1c5-aef3-9abf-ab94-e901904bc4ea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10bc31fa-d04a-4c09-b9d1-08da0ce5e637
X-MS-TrafficTypeDiagnostic: MN2PR12MB4205:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB42055B79882FF0AB9AEC33EF83189@MN2PR12MB4205.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTkW/RE9HFh9x/H0I/qcSGUCQmq+ESEvz5pnS3C9NXF4E8bNQNb34s6fqaflR5kwpNtWQ07LDr8dnv4sP3fZbmsp+rHF9UwlZfV39WOThmYyq4i1ycWh+qoObeL2Oh+n3O2edMrR/QQxbFTQqxuwprpjNfCZ6eTbliRWBgL6pg9N9oe4b054v/nuXyKg2WrjuqUvYtE3aiMaqim42uoOHGlrlQWn93rCaA9zgRuNAfxqrYC7U76hWnCV6iR1eWsFf3En0XkdNUPnvfM3gGL9I2hwZF/PqU71BiPjxp2FRLgCFRP8cBrUJOjPbhHgz4cXvV88oyX1BtpJmKy+RXrchuAz8Z9SRemivkvpzV2eU+37mFPGeM44gp+z7OaavVn1Dr910Mt8qAnY2QA3Z6FYjCgBY0IdeITD3PHstPsiYsOg49gh+IcPedMNgZq87T+LOAkIbZMGvT7Qj43Upx5I3eDkOObd/fAA5T1s7wokHrQbS50TefxnVs5AS987A1IWfcOCtWAKOw3KeXNFTi2clBqao07VHW+sA8C3It21G30yAHyVU4gbo+Ggyc+XNKXYKfJjoZwiGHNH88ZHKAHxNgeWQIfXloTLjUJBnpTt8PJX0t65lg20eWlBy+qc0KIc3MGh4UC6wa+VdOoegSf06JzQwrRTbo1jg1KghKyu3UOKhC1Sz92AdQn00BFgD6huxTiKPqd064MqXFQlg1b+zFH0TS+Vxvb4kavxFyiO3txhKFzU7+VkkMTacrbuVE9e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(8676002)(66556008)(66946007)(66476007)(316002)(86362001)(31696002)(2906002)(38100700002)(6486002)(508600001)(31686004)(36756003)(186003)(66574015)(6506007)(6512007)(83380400001)(8936002)(2616005)(5660300002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clJpOHlEZXFmb3ZQK0ZsUlBoQjlOK0dEYW8xWFAzeEh6QUZZSzQvblM0SEFT?=
 =?utf-8?B?a0c4LzluNmMwS1BuMmpVM2d0WWpieWs3YUhkY0lOTFNFb1JlM1JFR3VqeEpp?=
 =?utf-8?B?UzQ4UDJhNktiNTZFdnUrWEl0Ym93STRpUkJBZGp0NjRYTE5qc1ZDWUZFbU8r?=
 =?utf-8?B?bjR3RkU2YkNnKzdtRkxTODdCQ2VZYnBQRTViVTJkaDdSOWhHV0lmWUZXTGFk?=
 =?utf-8?B?S3hpY1BjTFR6VldoNEhWQXBMT3U2aW8vV1dUbmVlaEcvb3lXM0twVjcyemZm?=
 =?utf-8?B?T2E1QjhnL1VIUnBBbGhaVEN5Wk03SjN1VVBZVmhYZ1B6a2h3aldjUnJrNW5U?=
 =?utf-8?B?V1VlUjFFZHB1NUErWHFST0ZDMEU5c2l1aGJVSWFKdnNoV0VReTdDV0V3UVRq?=
 =?utf-8?B?amtXRXBVb0JWdGdubkhUNmVhcVp5Qk1JNDRDQlJqY3hMMUhOc0ljMlU5d1FT?=
 =?utf-8?B?QU91dWVORURObHQ3NEExR2NmSlpEbGZvSFA5clhibjVCOGcvdXIrR0JLd0hp?=
 =?utf-8?B?eVNMM0xjQld4a09PbWQvOFpnV2NVaFB1MGJvS0xOOE5MWnl5N01OQWlpYlla?=
 =?utf-8?B?T2Q3R3dxVVpueWd5alMxQTlENzZYUTU5QTJrZVVTVS9tVWJQeGttdXp6Rnow?=
 =?utf-8?B?Ry9zVnN4cm9DZ1d6STlzUVF5Yk01NVkrTVF4a09iOXlYSlJqUUpkZS9XY3V2?=
 =?utf-8?B?eVlRM1dZNlBKS2VJM3BvaDVrUzVCa09QeWhRNFBWMXdnd0o0aS9PczlaYndv?=
 =?utf-8?B?c1p4Y1dhTWhDZ3gvS1RqNUJyWjBVOFZnQVZQMkFsK3I5VTR0SjN1VTJSOXhz?=
 =?utf-8?B?RGI0R3A1WXJ4WE9vWkg3OVkraFpUelZPdlQwcFBDdXdUcFFYL2REQkNVWmRX?=
 =?utf-8?B?dWdjS3RSUEhWdDFqait1MGgrUkpKOERIWi9ZMEtxYmV4dlVNOElmS2lCTjcv?=
 =?utf-8?B?djdMelgvSEpvdGdKd2RHTHM0TVprd3JxYVRBNnZaWlFzRHQ5MTV1UFcrUEZt?=
 =?utf-8?B?TXVqL3BabHdzdWZNNnM3TDZPRGg2RzdBU0RPV1cvVjk0K1FPaVd0OFFybms0?=
 =?utf-8?B?a0FsWEhoNUhReEJ6RkNudVJHVDNDSGtXU2RFUmtXZnlpU2QzcXBwYnlOQmZK?=
 =?utf-8?B?cmRTamJsc29kZDlKd2QwampKellzL2ozZWhzQ0ZDWEhaeGxwWWZSOGR2NjIy?=
 =?utf-8?B?QVIvVE1EWjZzTHh4MEgwU0U0VDZlMDgxVjEwR0NCMUdCZEZKUkYxL2RRMldX?=
 =?utf-8?B?NGRSeXhWVDkxUWFqUmJTYThDTFNtZW9xdkRXRk5pa0tHRi9HYmd0QW4zc3pC?=
 =?utf-8?B?dm9ZeWtGaW1yb25wdUZVcDVpUUYya0RBOGIybjhkKzRRVGZRY0FGZUQxRlJZ?=
 =?utf-8?B?cUVKQTZVWkh4SkFrL2RPZnZiaDNTc0tDL2lNa21sQUJ0YWxCSDNDQWNtUkFV?=
 =?utf-8?B?WGlSUXBxUTNyLy9kSWJCR3VPSm9HRk0xUHFiNFczcnhVTzY3V1BOQzZKbEJr?=
 =?utf-8?B?RFhQWjgvMGVSUlFpbjZ2VllPQlk3Z0hSVFp6eTd4cnZjZ0FrMkx2S3RJQ1FF?=
 =?utf-8?B?ZFBKa1VCZTFHMVBTVmJJM3N1bDhKQnY0L00rb0hMSTR2SHlFZ2ZDWXhyR2N0?=
 =?utf-8?B?SEM1Y3ZrbDFBMnhnMWRUaE5JMzJ0WEE0RVlPenBwbFRsdDRpa0FDeXBzcUc1?=
 =?utf-8?B?R2Nna2E3OVIwakIvOFY4ZmlIR01tVFFZU1crZDJRR0tYekZITmRhTXFIbDRO?=
 =?utf-8?B?NGdqUWVJdlNIb0Q1THRFZ0lIWmhpZS9VdUR5STJ1RWFMd3VtdFEzWHdPd1pY?=
 =?utf-8?B?RUt4a3h5QnlXRmhNVlhIblNLQUdNaDNZTjVSdkpUR3BycTg1OWFoK2hzNTR4?=
 =?utf-8?B?ekozRlMrWnJsV1BnMXhYZk8vV2U0ZGF6TTFuK0pnUUVxWEVPeTBUeGVEWnpp?=
 =?utf-8?B?K1l1WjdlUVNUb2VxV0U0VkZ1SmlpL05LbGZueEw0ZENtZVdVRWs3cy9SbHBo?=
 =?utf-8?B?bS9va3NVVGF6Rkt5TmhVbEV4a1dsSS93aFliSWhYUnNkTWp1a3RncmJTV1Fh?=
 =?utf-8?Q?ecn2AH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10bc31fa-d04a-4c09-b9d1-08da0ce5e637
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 15:57:57.7989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHec4Ya/Lw3WIsxCCiFEfsSLAbdiy3WRpHztO01qdIj7y/hKS3zmgS1ZXtt9XZeK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4205
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

Am 23.03.22 um 16:55 schrieb Felix Kuehling:
>
> Am 2022-03-21 um 09:58 schrieb Christian König:
>> This function allows to replace fences from the shared fence list when
>> we can gurantee that the operation represented by the original fence has
>> finished or no accesses to the resources protected by the dma_resv
>> object any more when the new fence finishes.
>>
>> Then use this function in the amdkfd code when BOs are unmapped from the
>> process.
>>
>> v2: add an example when this is usefull.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-resv.c                    | 45 +++++++++++++++++
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
>>   include/linux/dma-resv.h                      |  2 +
>>   3 files changed, 54 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index b51416405e86..509060861cf3 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -289,6 +289,51 @@ void dma_resv_add_shared_fence(struct dma_resv 
>> *obj, struct dma_fence *fence)
>>   }
>>   EXPORT_SYMBOL(dma_resv_add_shared_fence);
>>   +/**
>> + * dma_resv_replace_fences - replace fences in the dma_resv obj
>> + * @obj: the reservation object
>> + * @context: the context of the fences to replace
>> + * @replacement: the new fence to use instead
>> + *
>> + * Replace fences with a specified context with a new fence. Only 
>> valid if the
>> + * operation represented by the original fence has no longer access 
>> to the
>> + * resources represented by the dma_resv object when the new fence 
>> completes.
>> + *
>> + * And example for using this is replacing a preemption fence with a 
>> page table
>> + * update fence which makes the resource inaccessible.
>> + */
>> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>> +                 struct dma_fence *replacement)
>> +{
>> +    struct dma_resv_list *list;
>> +    struct dma_fence *old;
>> +    unsigned int i;
>> +
>> +    dma_resv_assert_held(obj);
>> +
>> +    write_seqcount_begin(&obj->seq);
>> +
>> +    old = dma_resv_excl_fence(obj);
>> +    if (old->context == context) {
>> +        RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
>> +        dma_fence_put(old);
>> +    }
>> +
>> +    list = dma_resv_shared_list(obj);
>> +    for (i = 0; list && i < list->shared_count; ++i) {
>> +        old = rcu_dereference_protected(list->shared[i],
>> +                        dma_resv_held(obj));
>> +        if (old->context != context)
>> +            continue;
>> +
>> +        rcu_assign_pointer(list->shared[i], 
>> dma_fence_get(replacement));
>> +        dma_fence_put(old);
>> +    }
>> +
>> +    write_seqcount_end(&obj->seq);
>> +}
>> +EXPORT_SYMBOL(dma_resv_replace_fences);
>> +
>>   /**
>>    * dma_resv_add_excl_fence - Add an exclusive fence.
>>    * @obj: the reservation object
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index f9bab963a948..b6f266f612ea 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -253,53 +253,18 @@ void amdgpu_amdkfd_release_notify(struct 
>> amdgpu_bo *bo)
>>   static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
>>                       struct amdgpu_amdkfd_fence *ef)
>>   {
>> -    struct dma_resv *resv = bo->tbo.base.resv;
>> -    struct dma_resv_list *old, *new;
>> -    unsigned int i, j, k;
>> +    struct dma_fence *replacement;
>>         if (!ef)
>>           return -EINVAL;
>>   -    old = dma_resv_shared_list(resv);
>> -    if (!old)
>> -        return 0;
>> -
>> -    new = kmalloc(struct_size(new, shared, old->shared_max), 
>> GFP_KERNEL);
>> -    if (!new)
>> -        return -ENOMEM;
>> -
>> -    /* Go through all the shared fences in the resevation object and 
>> sort
>> -     * the interesting ones to the end of the list.
>> +    /* TODO: Instead of block before we should use the fence of the 
>> page
>> +     * table update and TLB flush here directly.
>
> I don't understand this comment. Which block are you referring to? And 
> what does this have to do with TLB flushing? Maybe you're thinking of 
> a specific use case of amdgpu_amdkfd_remove_eviction_fence for page 
> table BOs. But that's not the only case where we need to remove 
> eviction fences.

More or less, correct. See the eviction fence can be removed because we 
can make sure that the hardware operation represented by it doesn't have 
access to the resources protected by the dma_resv object any more.

In other words when we unmap the BO from the process this unmap 
operation results in a fence we can potentially use to replace the 
eviction fence here.

>
> Other than that, this patch is
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks,
Christian.

>
>
>>        */
>> -    for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; 
>> ++i) {
>> -        struct dma_fence *f;
>> -
>> -        f = rcu_dereference_protected(old->shared[i],
>> -                          dma_resv_held(resv));
>> -
>> -        if (f->context == ef->base.context)
>> -            RCU_INIT_POINTER(new->shared[--j], f);
>> -        else
>> -            RCU_INIT_POINTER(new->shared[k++], f);
>> -    }
>> -    new->shared_max = old->shared_max;
>> -    new->shared_count = k;
>> -
>> -    /* Install the new fence list, seqcount provides the barriers */
>> -    write_seqcount_begin(&resv->seq);
>> -    RCU_INIT_POINTER(resv->fence, new);
>> -    write_seqcount_end(&resv->seq);
>> -
>> -    /* Drop the references to the removed fences or move them to 
>> ef_list */
>> -    for (i = j; i < old->shared_count; ++i) {
>> -        struct dma_fence *f;
>> -
>> -        f = rcu_dereference_protected(new->shared[i],
>> -                          dma_resv_held(resv));
>> -        dma_fence_put(f);
>> -    }
>> -    kfree_rcu(old, rcu);
>> -
>> +    replacement = dma_fence_get_stub();
>> +    dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
>> +                replacement);
>> +    dma_fence_put(replacement);
>>       return 0;
>>   }
>>   diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index afdfdfac729f..3f53177bdb46 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -468,6 +468,8 @@ void dma_resv_init(struct dma_resv *obj);
>>   void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int 
>> num_fences);
>>   void dma_resv_add_shared_fence(struct dma_resv *obj, struct 
>> dma_fence *fence);
>> +void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>> +                 struct dma_fence *fence);
>>   void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence 
>> *fence);
>>   int dma_resv_get_fences(struct dma_resv *obj, bool write,
>>               unsigned int *num_fences, struct dma_fence ***fences);

