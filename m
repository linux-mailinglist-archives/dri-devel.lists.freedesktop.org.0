Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDD69F7C1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBF810EA0C;
	Wed, 22 Feb 2023 15:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4AD10EA0C;
 Wed, 22 Feb 2023 15:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7osOSepGuE/9w9/bBWjI83YsxdOHIjaHjwPTZCqvoC7NXwfmKU+jOd7jQdxq6xcepVLLDFX14vIxSjLF+LxKj/eOO/bHxluyBHMhI4SkOFcVOUQti3kceOcaIdBOWACNKZi1dPZczdMRHIEVbIMdJyExz55pYyEyiEGPhf3egGo4r1Wiz+s3kJkbs/y3Jsby/rpY/29iVWVjCFmkiFoFFnY7FZ1/F5motYVW3dMpco1cLgiBIMOpo+YfuFnJMI2RcsFBvduzGU+a/kgR4dFq3vWZIIe6p6Oh8DYdlgkTSTN7qRNUDMD5xO/wQ2AxgqYdQ/NL9qPB/2oiEO9aiO1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1jR+O8b046t7hiN0g/X0WPkUCDPTUm1nK7TmYintbk=;
 b=aaX1fPEF3yr7Wo6cQjxHI2Tx81I1MN+2w8rRcW2/iRMBFzU0QjUS2koWRJgITv11xOxlNeIP1TBHEFdc9kVg1b8wgY9YkBdE4aiAEn4hqup2fp+RCD0mVM0lnKWCMDVCMJcunUpP1vkXdJkmedOabShsQi2k5O5/x8n8Iwj//z/6bVeu7mTa3iJIHNuO6rMw9JjHpIINK8LRk30T2PAvAboIo/8vipqLAxTqTagcyqNzYskWlCA3AMmm/PeWqGjeiOQmr8D47n5M4iGJwpAsto+Rum74xGSS1GZGUcMuIn9z+oV0BWP8wcIInv3Xasyj5PzpcDiyr4GNFNq5uXbJpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1jR+O8b046t7hiN0g/X0WPkUCDPTUm1nK7TmYintbk=;
 b=HQC1zpblxosiSSWMyTQhCoTjltm9KiQS/M0W6CzMTaWupyb9Q6yxJt88ykVddz7ShJ8t9C8e7AJthF3gIhnsiJw8zMi8L4iXXQeov/4LliCNnJwkf/LEuWODUiIXyMCKxThR/S8Ltp25lGIA0MiKch1jpIw8Y1eJB6ZRdLuF0+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 15:28:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 15:28:46 +0000
Message-ID: <21f36640-3229-0b46-31a2-a47efc5be934@amd.com>
Date: Wed, 22 Feb 2023 16:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-2-robdclark@gmail.com>
 <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b65a2fe2-6f68-2116-9599-2940e66d166b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 8404402b-733c-4e11-0ef4-08db14e97d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l7pdVerbWbt3UqZoINsZ5ya9PPB45UFk2Ef/6Lu1TMu2xE8g52s+wvlMzq+IWmFfWiYQkolHKcPGESPJxAYrynaoZFYaSgsaWFPk3i47lIw6PxP39O3Bu0HO6ZsOt7uuADXnA6F5WxLM9aZZhaUJE9bEBtT4Qck+0n1vpEiq+ha/W9P/cgdYcHoZP1f7CA49C5PP4ReMuL41uePsYpd7RKD4K1wBkc4IH/Nlzw1Fd8W+GMmkwtlm58WxX2+QI8OrM6JEG1RTTafmdnv2pmVeUdIG1BFE+FluDLzIQeBHrM8ovdEsMu4x7wIjcMBnc1U9Ui6khlZ0p1f6MYhWpbPxo0H4G/4+rDfJyaUwECy1gmI0HFJn9mV8WyXgA88eTNkfeqjshtG0Q0hyD219Zq3MNyyi2s3FaKWqHETa+df9UefEE0u4sC1Mrt2tkVeym2+8zfia9AxMw81We+kg8/Gk6Psq78l8yNz5n9oRq/7zMwEB9MBjA/cE6G+U1vd0YcBUphqOS0Naz1a07ZNmQm6coPzennUZpR5P7gADKG48qsVCWAcABcVZuVO73mpAc1sqHoPf6cG6r8hXKj9wpdfJXHwvH5XBlXB3mYrOsnfWMr5d03tpQyDgkcDawtPJr3dtbRIxOu3is8rbHkdsQyuE6DwtEvL27qgVKU6XEOH0DB8rv2iN547POXBbJxk+HX1LKCaLX2Nr8C1RcUbcJACTLbFA7aLdXxBL0/Yt6lcnzNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(6666004)(86362001)(6486002)(83380400001)(5660300002)(8936002)(66574015)(41300700001)(7416002)(316002)(53546011)(110136005)(2906002)(186003)(66946007)(4326008)(6512007)(66556008)(66476007)(54906003)(8676002)(2616005)(478600001)(6506007)(38100700002)(36756003)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhKR29FelBicWpsbW5kV05HRzdaV3NFdTZFQ2FtS3hOSFRyZHdRc2tURTNw?=
 =?utf-8?B?MHh1NHhRZ1JuUE41SmdVaWpkM1pXVW9IWXI5dzBIMFZLVVRHQ0NXVjJvaWJU?=
 =?utf-8?B?QkdlRGJXY1BIdTd6VjNtNWtjLyswUzJLK1R0RzVhRVNHbFEwS0dBTXcvelJF?=
 =?utf-8?B?RWc3aVh4SXRtM01mWTZSdWhyMlpWVXNUKzY5aTNlTjBBQWxGYXpoeFhRQUh2?=
 =?utf-8?B?ZVplSEErdHJrU0YxeEZmVVc0L1Z3ejJBekVrYzZScldXa1UwclpyM0Jqdm8x?=
 =?utf-8?B?MWNoTktLK2hRUDQyekZma3pxT0ZpakRjUDJ2ditRaTgyR092aVRDV0J3RGhn?=
 =?utf-8?B?SnRPOExucktvS2VUazFTN2k4UEU2a1RUQVVQckRST25NZ3laY1dzSWdVRUEv?=
 =?utf-8?B?SzVzb1RBbCtWblVXbFZlekJuT0hzcitYVUI5QnNZS3NjQ1Y5WXF0azAvVXMy?=
 =?utf-8?B?YWwzZmlEUitMemNqU09CRUFBNDZOUjNaanNXMTFzZEN0R0tCOG90Y3BRWWxw?=
 =?utf-8?B?QnFMSnh4YUJBY3pyM0tUWEtJNmJoSGJQbUhoWXMrREUrWDhSelVaeDZOVlVF?=
 =?utf-8?B?WTB5VXRPOE51bHNNWDZDemQ0SXpCdlFCSURzYmhaN1ZtOWUzRmorbmJqM3N4?=
 =?utf-8?B?QlVxbXdNK2g4N2V5b1c4a2s3eWJjRkJteGh2VnpaUUFDUjNITXhDWW5UcG8w?=
 =?utf-8?B?Y295WTAra1J3QS9vMExDVGVlRmRRbDBkcmpyZGhFSzl3ckZXUFVhTzR0UDYr?=
 =?utf-8?B?WHk3SHRvUEN4RWgvUDIwZDdNZC9SV1dBQVJMdU1TYk13KzhJYmVIUnB0V21j?=
 =?utf-8?B?QVByQ25xK1EvNjRkMTVqaE52NVV4YmFOK2Zpa2RnWFhIZlN4S09yazArY2F3?=
 =?utf-8?B?bWF1cjdtcFl4UmpPQTNUbXlsNVZ6ZU9RYkNScVNhazI2UnVLNmR1Ui9sN1Fp?=
 =?utf-8?B?eE05alVQOXM1NGcrbVVOQ2JjcjBHRW9McXEzUjRnRlJrbThFc1RNT1l1UXc1?=
 =?utf-8?B?KzBJRzE1VnRqZ05SMjFrU0JXeWxnU1h0UEpubXo0S05hSXlnZnBuVW1obWJm?=
 =?utf-8?B?Um5BYUdnelJBY2ZCdkxFL3dmK0xVeTJ1ZDRRUzBXVytKaGp0ekZxVE8wK0ZH?=
 =?utf-8?B?bEQrN0pkTy90N0ZKVmlyZGxRWUxXdUtiWGhlcUs0TllXMzZWUFJvMHVMQVpQ?=
 =?utf-8?B?WFdHQTJsTDJWNUtJUkpheWYrdkZiNERPN1RUYjhYcFRMZWlQaWhEWG81SE05?=
 =?utf-8?B?dDBtdm9LZktyYkNwbkFsTldlbjBUNVFZZzN6elBoNlhCSmYxTXBZNGU4bVMw?=
 =?utf-8?B?dlNRS0NNQVZzaW1zTkVqSFBmZVRJcy9MWGt6ZnlkZkNtYk5DN1I1aFJhQURB?=
 =?utf-8?B?TkJPODhDUGtzREQ5UnpHNjZhOVJLZnJaVUk5VGRORE9PdWxKa1l0VTJOQjla?=
 =?utf-8?B?OU1BMHlxc2szMWg4ZEZ3cXdDQ2p1aGQvQjl6NXFCcEhpaGJEb1ZIT2F2Y29F?=
 =?utf-8?B?TnVMblhKZ2RzcGwzdDMrUlAxdkVMOW9aUmwwLzFxZXBONWZpZG5pQW1QUUJo?=
 =?utf-8?B?cHpxem15dGZrZzZVQ056RCtPM1dJZmZhcVFKMGRxeTl5cEJOWld4Uk16bDRX?=
 =?utf-8?B?T0NxYmZUcWhKRWh3WGV0Mm0zb3YrMU8wek9Gd0xEM3JEVGRHY2RSZFo0WmYv?=
 =?utf-8?B?NkhQampXVnlqaDNldHdLemVXRFkyZG11aWRpWDYvVUtvRHVwZ3VQaHZ6VGFQ?=
 =?utf-8?B?VS8zWnJKZmlOYzl4bGFYWGhjUG9jSHB6R3BQd0tnVk9DQm9HalZFblZIeG1u?=
 =?utf-8?B?cGtoMjlzcWRGNVlZRndYR04wKzR4UDhpUTNOUy9pdUFPcCtuL2Vyb1dEMW1Y?=
 =?utf-8?B?d0lPWDYwUXdwODJub203QlNQZ0pWNzZYOXJ3YXlXTTBXcFZSblNaRWpGeG50?=
 =?utf-8?B?Y2RYbzg4Yzc5b2tvTGE2czJJL0kwN2o3bnBBd1pBUG1sVVRpSHhLTHcxMkJ6?=
 =?utf-8?B?SHlXRFZHMGJQb3hRUlBvcXlxMVBqNVBUZ2Y0T3hnWkJlbUF3alR0dS9vRy9p?=
 =?utf-8?B?c0tralUvTm5hcEpseVgwNHluZVhveTJYOXRuZ2pYYkFzVGtTWk9DSGxMbWxI?=
 =?utf-8?B?R2VRNmw1Y0M2NkdWaUhVbjlDYTAwZm13WGtVMkVYeUZyeWlWd01hV2E1aEZn?=
 =?utf-8?Q?9VeOCzRg3OOeu1UStEhE9zpbpoPjppc4UGLJpkaTUcCW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8404402b-733c-4e11-0ef4-08db14e97d45
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 15:28:46.7482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx0BGPbFpmDHghJUC/eY2kVuAhTxC4E0j1Ks/GTB56h6AfsGsOmTFZQrB3gokbzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.02.23 um 11:23 schrieb Tvrtko Ursulin:
>
> On 18/02/2023 21:15, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Add a way to hint to the fence signaler of an upcoming deadline, such as
>> vblank, which the fence waiter would prefer not to miss.  This is to aid
>> the fence signaler in making power management decisions, like boosting
>> frequency as the deadline approaches and awareness of missing deadlines
>> so that can be factored in to the frequency scaling.
>>
>> v2: Drop dma_fence::deadline and related logic to filter duplicate
>>      deadlines, to avoid increasing dma_fence size.  The fence-context
>>      implementation will need similar logic to track deadlines of all
>>      the fences on the same timeline.  [ckoenig]
>> v3: Clarify locking wrt. set_deadline callback
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>>   include/linux/dma-fence.h   | 20 ++++++++++++++++++++
>>   2 files changed, 40 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 0de0482cd36e..763b32627684 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence 
>> **fences, uint32_t count,
>>   }
>>   EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>>   +
>> +/**
>> + * dma_fence_set_deadline - set desired fence-wait deadline
>> + * @fence:    the fence that is to be waited on
>> + * @deadline: the time by which the waiter hopes for the fence to be
>> + *            signaled
>> + *
>> + * Inform the fence signaler of an upcoming deadline, such as 
>> vblank, by
>> + * which point the waiter would prefer the fence to be signaled by.  
>> This
>> + * is intended to give feedback to the fence signaler to aid in power
>> + * management decisions, such as boosting GPU frequency if a periodic
>> + * vblank deadline is approaching.
>> + */
>> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>> +{
>> +    if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
>> +        fence->ops->set_deadline(fence, deadline);
>> +}
>> +EXPORT_SYMBOL(dma_fence_set_deadline);
>> +
>>   /**
>>    * dma_fence_describe - Dump fence describtion into seq_file
>>    * @fence: the 6fence to describe
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 775cdc0b4f24..d77f6591c453 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>>       DMA_FENCE_FLAG_SIGNALED_BIT,
>>       DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>       DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> +    DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>
> Would this bit be better left out from core implementation, given how 
> the approach is the component which implements dma-fence has to track 
> the actual deadline and all?
>
> Also taking a step back - are we all okay with starting to expand the 
> relatively simple core synchronisation primitive with side channel 
> data like this? What would be the criteria for what side channel data 
> would be acceptable? Taking note the thing lives outside drivers/gpu/.

I had similar concerns and it took me a moment as well to understand the 
background why this is necessary. I essentially don't see much other 
approach we could do.

Yes, this is GPU/CRTC specific, but we somehow need a common interface 
for communicating it between drivers and that's the dma_fence object as 
far as I can see.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>       DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>>   };
>>   @@ -257,6 +258,23 @@ struct dma_fence_ops {
>>        */
>>       void (*timeline_value_str)(struct dma_fence *fence,
>>                      char *str, int size);
>> +
>> +    /**
>> +     * @set_deadline:
>> +     *
>> +     * Callback to allow a fence waiter to inform the fence signaler of
>> +     * an upcoming deadline, such as vblank, by which point the waiter
>> +     * would prefer the fence to be signaled by.  This is intended to
>> +     * give feedback to the fence signaler to aid in power management
>> +     * decisions, such as boosting GPU frequency.
>> +     *
>> +     * This is called without &dma_fence.lock held, it can be called
>> +     * multiple times and from any context.  Locking is up to the 
>> callee
>> +     * if it has some state to manage.
>> +     *
>> +     * This callback is optional.
>> +     */
>> +    void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>>   };
>>     void dma_fence_init(struct dma_fence *fence, const struct 
>> dma_fence_ops *ops,
>> @@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct 
>> dma_fence *fence, bool intr)
>>       return ret < 0 ? ret : 0;
>>   }
>>   +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t 
>> deadline);
>> +
>>   struct dma_fence *dma_fence_get_stub(void);
>>   struct dma_fence *dma_fence_allocate_private_stub(void);
>>   u64 dma_fence_context_alloc(unsigned num);

