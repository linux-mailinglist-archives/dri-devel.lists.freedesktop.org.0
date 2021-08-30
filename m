Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70F3FB7AD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2B89B0D;
	Mon, 30 Aug 2021 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BA289B0D;
 Mon, 30 Aug 2021 14:16:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2Dx1qVjo1ZSMfQQKVZnNMi/dZgCqYde9argAdH76xMSeke5tbQDOrEYikw/QNGWZlI1xAcT6sgB6DFDoxPY5OCvgIjUVuezKvO9XKIDMb8ZUdAvZHkjUCbW76+HIeWj436f7i9aN8OHuacO5dFO2v4hR5qv4WDtC3vESQXUv+dlLPPI713zBtD9ivSjLkvR3wRtW5YTCrk+zH344uMYz7XKpGH26vrhp0+NDI/p7veUMjdX4vYUGf08QdH1G7Uq0omknOmyVceWtjbO8APR6I8208jQx7DWTI4szUjVf2D6dEMUo/0pjmSbC2QoHCRCXcTcUTvQpyLVx0rLfqE3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk2DFpWBEmyrXvqOOPmQhi7P4bd3QwW79ksVEsHZKBw=;
 b=CsPYcfiH57S9vJsLUAVKecx77ATQJA3guZzPjAfgXuAYZLHifiTVANZCFlJe3yd1oIArUGnxyXEDHNQhXhYdUKATjCYWLRXyEuB5RsRJ8ntBYi2JGv7kA8JAp44wsRUTR75uhymPjTaXB+/pTgYpv6/8IV3Dk+51oifJNW9cnK4BP6uTFlEjtk2MqwVMnj6MhTWbGwWoHijHAVW509A1gbP2xIwtMldwY7etjwGcG0lkzH8uV3Dh+0xfm75VDxIqns4z4nwz0gIW6+xfnL0YqrCo4CGvU9NB29P/70Fjgy7ojfbBw6z9U+/XgNa6L3hZ3cZSPHURW29u7bDMhC31Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk2DFpWBEmyrXvqOOPmQhi7P4bd3QwW79ksVEsHZKBw=;
 b=GZCDWgVthCW/LIQk0Tcb8ked2NqrNnzeXDTzSViAgHFVdKOGhyrKYp5uAeYbi32B4KEKit4y3Hd1f8zNFMXi58j6TnGlRARSnOSaqKpYmBYj/VZdNMgtfyem80T0yIy8AES9/f718Q/q34jh3Hnt8GCyoQNBSseaHE5htBcczaU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 14:16:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 14:16:33 +0000
Subject: Re: [PATCH v3 1/4] drm/ttm: Create pinned list
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: ckoenig.leichtzumerken@gmail.com
References: <20210827203910.5565-1-andrey.grodzovsky@amd.com>
 <20210827203910.5565-2-andrey.grodzovsky@amd.com>
 <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e716dd6d-a338-86ae-9100-0e869f12732c@amd.com>
Date: Mon, 30 Aug 2021 10:16:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a13d095d-1b0f-a31c-1479-1275c2e93877@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::27) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:fe36:59a5:493:2924]
 (2607:fea8:3edf:49b0:fe36:59a5:493:2924) by
 YT3PR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 14:16:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 143bba57-2ed9-445a-60c8-08d96bc0c50c
X-MS-TrafficTypeDiagnostic: SN1PR12MB2349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23492C30D41263C5E9F38FCEEACB9@SN1PR12MB2349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fc5C/u0pkeLl8dViJSgjgqJgDRmUiuqPFGQ77JN9cdaJHzNeBvXCuCPr3eOOY+yEpM5gej7mkJa2N1lsoVYNWnFj2oj5ckLBiFUzOvAMg0S0YkdaGlzLeJLeeWDPYJYUgxG5qoSXv3e4BdTCtjH7cvD26tiUU944+xiBFws+U3lGkFrqMUkp+MzpzR7oPK/8t7IPBSmcEH8A9LoDyGW2s/3bE3b0w1DUIhXCzNZGsNknS+hD2o1r4YYUzUfp79WUxhzUowCkCQnktGsG6xNklzeS/vbBMx4hpniEzwhAaMUe82yq+6v1DCaXGrSkosw3bP/HbCHRIoZKR0XaRWiB3Y8uOsAqT9a12NYAmTYmST2FRu9gslrE05S9AkedMvi4cNwHwPs+aZBnaHB7zHnH+/bhGcm84Su9RRO2xZP1kSVI2OkWfYjwFgErw0wElA6jxST6E26u8orrDwh83OJ7DRyBHoCchl0rmB3zE2GxttOwcqIYWnIksgpoYxGIPE31pRLL/cwCwMS3l1tgoq5EsrZ5Q9hqWjZ5s3nuP7eeqig8Kpm5h5hdAJurLI5Ngb+AQNKpKMkEJVtCPUNThKSgZ2On/EtNqcwc1kw9z7PxsKrXsmQQRBbzkU5vjKyW4Wc0/Kgffdwnxvgpdh9v+C2HphojCQRkjweFDTdzuZnypyp/FnlLyOE5bDYVOks9sXKauuQom6vBjy7ohlnQvTiL6X3IvVATzdnCMGhCfkf7zLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(2906002)(66574015)(31696002)(478600001)(8936002)(53546011)(5660300002)(66946007)(186003)(38100700002)(86362001)(2616005)(44832011)(4326008)(316002)(36756003)(31686004)(83380400001)(6486002)(8676002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnR2Z1ZKTnRHM3RNS1ZoaWxZMVh5UHBwemdBcDNndEJYZHR2YnM3UTJWdDMy?=
 =?utf-8?B?bE4vSVJ0ek5PTVRXOUh2dUVORnIvOXFvcUg0QzUvN3hRSHowVEpVUzdESWpK?=
 =?utf-8?B?dXZLYVp3dEE4V3VFQm1wMmpPQUFUVVg5MDN4b3hDNU42L0lRR3doVVZvZ05S?=
 =?utf-8?B?MXI4S3FVVlB0S2VickU3TnJadU5JQ1lNemU2Y0oyeDFMVmh2RENhdXp5cEsz?=
 =?utf-8?B?Z1VWMDQ1N2V5R2ZONU0yekdBZ0hSU251T3Z0SEl4ajNqamtZczRLeWh6cTFl?=
 =?utf-8?B?a1ZEMzN3bzZnOWlJU1p1NGlNUk9kZlF0QmRxcU9HWE9vV3dXNVFwdmRjNFNx?=
 =?utf-8?B?em1hRTQ1Q0pjZHVoZ2VUbVpzbStWYkxINS9jcjBGZ2tZYmZKNjlBakVRK092?=
 =?utf-8?B?Mkg1UG14eUYrMnpGQUhXVjVhWDVudWptaWJwWDE4a01EeXNSUXVudndVMXhy?=
 =?utf-8?B?Y0JLN0tzSzhrS2RpWUtXMjZra3ZEc2QybUVyK3AzK1N0UWY3TWRhbzRtdjZm?=
 =?utf-8?B?VzhWRi9XYW92T09nUWdSQ2VyMGhhYVdnSVU0N3ZCUm9KUE5DOGhMU2FLUzNX?=
 =?utf-8?B?NHN3MFJhTlFDWTJRbUxINnZtZk9TejZhWGIydk45ekg1L3ZzNlRZc3p2V3JY?=
 =?utf-8?B?Uy9SMFZ6bGpoSnM1dGQ5QmVkYVZWTWtFRGlOZGgzbXRVOWI2Q3NuYXJTa1U2?=
 =?utf-8?B?UFJDM2Vnc1gyNWt1aS82U1NqblZKSWdodGhwOWpJMXczZFpEN1lQQWFUZm9L?=
 =?utf-8?B?TmxwU3cxTldXdzR6aEdJY0hxb2hhcjZ3QStNMnpPRis2ZFlKeWJ6NVZqbkdC?=
 =?utf-8?B?TnNGMWhEVmRlQXAyTmpwa0UzWTZ0SENpRldnbW9keXNCWWRWYlhUemxsKzlF?=
 =?utf-8?B?c1lFalRWTXMwM0IyZWV0MzV5NzZZL0R0SjNCQk5lOCtiMEZzZEVqUEZROVRF?=
 =?utf-8?B?bDVtYnUvREtmbWVuNDIyaWJRUW9FWnJVSmk5SEsxSGd3NkwwMDFJeHJyUGIx?=
 =?utf-8?B?ZS9TS3RXUkRrYW93RGJTZ0VVYU8wUGtnQnh6YUJXMU1PVy9CeVpBU1JRenJW?=
 =?utf-8?B?M2sxL2lQTmJtbEc0M1hFUGhxMjRtazRVd0t5Q3B5RDJWZHRWY2l6cFFKL1Er?=
 =?utf-8?B?cmk4L2g3KzZjMkM2SkVkczBhakpIYmRNRlNZcll0Y0Z6OFl0Tmh2QXMraXZi?=
 =?utf-8?B?d1ZUY0xjNWJtZXJJSjRxTGIzQktHUnFLSm1TajdiVWVkN2VkZHZUUHdCTkRr?=
 =?utf-8?B?TzUwN3lLUHBBeDE5MEpCYWdpT1ppa3B1OGtmcTVxdW1BUWh4ZXd5L1V5ckNP?=
 =?utf-8?B?dDlBTzdjeGJjT0JnWUVQeHdyaTB2ZVl2eG9wVHVjMTJXcCtjcFVBanNuSitz?=
 =?utf-8?B?eWlJbGVGOFNkRVRma2lqOEN1REUyaWc3NmJKaHA0Y1ZlNk5IeFBYMHB6TDB2?=
 =?utf-8?B?QUhESU5VSUpWc0dQZ09BU1RjcTVQUS9OSHc1MUk4N3lUaTMzMSs3ZEJ6SFlD?=
 =?utf-8?B?dFBYOVQ4WjA2bGtyczhsM29TMkp6UXhVQmxCcjRlejZNUGVUWkZRVERCV1Az?=
 =?utf-8?B?emFEN0hOaEkwdkUrOU51am0rRUdJSGlzTWVrTWZMaTFrVEp3bnRRcTFaNXhi?=
 =?utf-8?B?QWZhaVRQVEkwL0xwdVFqOFNIT0pxWFZncWh4Zytia1piaHF6Tm1EMHBHRnhG?=
 =?utf-8?B?V3U4RmpHcnYyMlp1OWNscEg4aERqU2R2dk1SaFRWY1VsWk50WDcrTDZEMk5T?=
 =?utf-8?B?VVFDbHNSc20vSzYvYktsUlNpd2xRMFhrNFBCVVVaQjcyakVOV0g2bFpwMmU5?=
 =?utf-8?B?aERiaWswT2g2cnlaaWYxSVk4TFBHVUc3VWhrRis5UUlQbGNCaXhrdFhyVWxl?=
 =?utf-8?Q?7sFFnkXQl5sb8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143bba57-2ed9-445a-60c8-08d96bc0c50c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 14:16:33.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwJE81t3/jsK1Iz3QI2vwf9LIQSr6ddTi9m7XKR+CQ1NyPSqbt4e7NbUJ49CWWrVb/t7+94+FQykE1NjXa8Nzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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


On 2021-08-30 4:58 a.m., Christian König wrote:
> Am 27.08.21 um 22:39 schrieb Andrey Grodzovsky:
>> This list will be used to capture all non VRAM BOs not
>> on LRU so when device is hot unplugged we can iterate
>> the list and unmap DMA mappings before device is removed.
>>
>> v2: Reanme function to ttm_bo_move_to_pinned
>> v3: Move the pinned list to ttm device
>
> As far as I can see there is not list_del() remaining. So this won't 
> work correctly.


It's in ttm_bo_release, there was no code change there hence it's not 
captured in the patch.

Andrey


>
> I suggest to rather rebase on top of the stuff I'm working on for a 
> while to move the LRU into the resource instead.
>
> Just send out the latest patch set of this with you in CC.
>
> Christian.
>
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 18 ++++++++++++++----
>>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>>   include/drm/ttm/ttm_device.h     |  1 +
>>   3 files changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 1b950b45cf4b..1fedd0eb67ba 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -69,7 +69,17 @@ static void ttm_bo_mem_space_debug(struct 
>> ttm_buffer_object *bo,
>>       }
>>   }
>>   -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>> +static inline void ttm_bo_move_to_pinned(struct ttm_buffer_object *bo)
>> +{
>> +    struct ttm_device *bdev = bo->bdev;
>> +
>> +    list_move_tail(&bo->lru, &bdev->pinned);
>> +
>> +    if (bdev->funcs->del_from_lru_notify)
>> +        bdev->funcs->del_from_lru_notify(bo);
>> +}
>> +
>> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>>   {
>>       struct ttm_device *bdev = bo->bdev;
>>   @@ -98,7 +108,7 @@ void ttm_bo_move_to_lru_tail(struct 
>> ttm_buffer_object *bo,
>>           dma_resv_assert_held(bo->base.resv);
>>         if (bo->pin_count) {
>> -        ttm_bo_del_from_lru(bo);
>> +        ttm_bo_move_to_pinned(bo);
>>           return;
>>       }
>>   @@ -339,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct 
>> ttm_buffer_object *bo,
>>           return ret;
>>       }
>>   -    ttm_bo_del_from_lru(bo);
>> +    ttm_bo_move_to_pinned(bo);
>>       list_del_init(&bo->ddestroy);
>>       spin_unlock(&bo->bdev->lru_lock);
>>       ttm_bo_cleanup_memtype_use(bo);
>> @@ -1154,7 +1164,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>> *bo, struct ttm_operation_ctx *ctx,
>>           return 0;
>>       }
>>   -    ttm_bo_del_from_lru(bo);
>> +    ttm_bo_move_to_pinned(bo);
>>       /* TODO: Cleanup the locking */
>>       spin_unlock(&bo->bdev->lru_lock);
>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index 5f31acec3ad7..530a9c36be37 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -208,6 +208,7 @@ int ttm_device_init(struct ttm_device *bdev, 
>> struct ttm_device_funcs *funcs,
>>       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
>>       spin_lock_init(&bdev->lru_lock);
>>       INIT_LIST_HEAD(&bdev->ddestroy);
>> +    INIT_LIST_HEAD(&bdev->pinned);
>>       bdev->dev_mapping = mapping;
>>       mutex_lock(&ttm_global_mutex);
>>       list_add_tail(&bdev->device_list, &glob->device_list);
>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
>> index cd592f8e941b..03fb44d061e0 100644
>> --- a/include/drm/ttm/ttm_device.h
>> +++ b/include/drm/ttm/ttm_device.h
>> @@ -265,6 +265,7 @@ struct ttm_device {
>>        */
>>       spinlock_t lru_lock;
>>       struct list_head ddestroy;
>> +    struct list_head pinned;
>>         /*
>>        * Protected by load / firstopen / lastclose /unload sync.
>
