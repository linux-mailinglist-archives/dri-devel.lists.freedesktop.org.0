Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A767E5C67
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 18:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089AA10E17D;
	Wed,  8 Nov 2023 17:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69A410E17D;
 Wed,  8 Nov 2023 17:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvsOLa6BMEoEw+J673r/BEp4zzZFZhG8iBpKQ7ht8jn3wahej5b7NIlT/8RgAXt2iTCM3P+og6myJhdWpCWX2f/a+p79jiAQY9QPPd/p+pj0Cv2c4w6ZQVBo5hPu2cg7faDusTK5ctnwKZ565F0zMJ6O1mz+hIF25LrNbsGwk8i3gdLUExI70GbbcjFVW6l9bJmXVmOfZ/gIuw3Q8ng8aKrN42PBhc34zzW3FFE83euozuHWUBqi1KpUN3eAo9Rr8fP0bEymQEtOcmanw+dvsK4JCCJlG1JNmUsTdwA71uOxwqRw9+nC9O0x6QmN9eo6aj/WX8MabTjfKYteRbtGBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUbG5eSolG5p+urEW1raH5X/25qxP8YoAfJnUGC+htA=;
 b=fX0CNVGX+qYLRLpj3q2/ZZSIUGEdDpIovJNhjKH8R8nSxSfzjJx5hxhLyaRh3oF0xOYys7S4iWivXDOjeqgs4vscAndiDDrxNSAZYj2fwOsR93CON+pqsWwNnq8ho0mEhSsulp8Z8ZCiPRLq1bMNgn2T1v0/e68sVEuNYH6RvZrJClENcoA4XiSWcBD+i7lQHfhUMsJWLOna0YRwQxQVLEimCsBgDKxzcRUZ9r0rloMrPOBEattmtXzG/v1Vk3mFBLxJcx1/dKqayzpuM3uOCByyo+wPvm/p5aFPvgfl21XGJttbk6rChF921Js+sEVwEJCZ7F/w0Mit95ENwFk9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUbG5eSolG5p+urEW1raH5X/25qxP8YoAfJnUGC+htA=;
 b=F+apE8TVpW3KF6jjZsvAwvNW6Wdwwy4XwP/nztAYNL8mxYXTqnJdLTdgr6lcHe/a5iRBTGeD11h4RQt1+UGYpwqQBj5JngSqeVqifw2kJIfOIEZiP82CiC+an5bdgwNHTs2CIQfVuDU8oN4stJC+DVo2D6aPTj1bXVrb2Hz0H6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 17:28:36 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::d257:cea8:6e29:e0a3]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::d257:cea8:6e29:e0a3%5]) with mapi id 15.20.6954.027; Wed, 8 Nov 2023
 17:28:36 +0000
Message-ID: <cbc4b3c0-4648-798b-80e9-3850273637a9@amd.com>
Date: Wed, 8 Nov 2023 12:28:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Patch v2] drm/ttm: Schedule delayed_delete worker closer
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20231108125824.995445-1-rajneesh.bhardwaj@amd.com>
 <86152ebb-96eb-43a1-b244-052c42ef1024@amd.com>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <86152ebb-96eb-43a1-b244-052c42ef1024@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::13) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: 8113abac-1071-4b8e-1557-08dbe08023cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhHZRC2HEjgxkAHuqW+fZrSiGaRxArWGmvrakVz4UPTvjzJP5N/J7peEaLSWza2Vuf1UkSldNGUMkvH06Ytw9IkUg6DCBtklE33jMUeKpNlclncFJ2vN+xTILUzRdgff376XSrjetzMkU9MuW15iCQyRdkiux0hIUcy0HiZtyaMboB5SuS16Ij9rHI8q0mON2yLZN3QB22/AlGQ3OEV1GZ6493n9N9EG9mZEVjyCaoyVKqyoghKGTi6Fq876L3m75tHQ/IciANvkBTK/Z5lCXbDR5fcrFyIbjeybcF1V7C9tY1dfwEvUbcypawr1ZLbq3RxHO6Sj9sibDk2zilF1lQFzoxFHCdAyjZu5RP68ZzSSi0J8LAfzKifBaIKOi2NjwTPbW2G14gx5K6kmfd6k85bu4jRVXV3fupLglZr09uPEz3/k4DiXZzs6AG1D1WAzLg/utlnE/Oo/07ePFFLa3tbt5sBAPbly6XnRjENr7Hunbq3vNb0rRxaEBf1GLPxHn8tzg+MrXnI0ZUFrA8+o5T6ykNmVmFCQzHbYrBZ6zKaNCPU6HjrUq5qOB0FLB+HKMkPMEzjH69B0b7G+nGf/Q7veD23Z3wjnPxN4uAAFWVvGNMTgPK3Tuhhrsd4kSWZuxX/0P3mTRtbkdgKAg4CObw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(2616005)(66946007)(83380400001)(26005)(66574015)(6506007)(478600001)(6666004)(6486002)(66556008)(53546011)(6512007)(2906002)(41300700001)(8676002)(4326008)(450100002)(8936002)(316002)(36756003)(38100700002)(5660300002)(31696002)(86362001)(66476007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejZ3Nmg3T1d2ZnRqOTdIY21CdzRrOXROTGh6QWF6UXJzbCtOWE4yRDFDV2No?=
 =?utf-8?B?UHp6SkJuVWQ1QmhBRVVlVVBuNDltcmF3Z0c1ZlZPRGc3SUlLdE1MUm9FMnc5?=
 =?utf-8?B?dEc4SVVycDFZL0J6TmVMREVyeXFxQlY1eENwVkUvbVBWVU03ZnM4WG1sMGFG?=
 =?utf-8?B?NVlYdUduSEtLYzA3SjVybHJJODFGYURjWWFjNkErNW9wYW1wN0xLSHZ0d1Fi?=
 =?utf-8?B?Y0lPeUhxZVVRNHRuSWNnZHJYYWtDMDFtejZjam9QckZKYjJmemJvWFNGaVBG?=
 =?utf-8?B?NjdsWFNFVjB1WTQyamtxUHlSZ0pncVZPNGxreUp3cGN5MDQ3Y1ovTlQrVnB2?=
 =?utf-8?B?emtrUzJMV0drSlEzc3RRMVJGSFdEQTM5dUpybk1QQ1h4T052eitHT283YURu?=
 =?utf-8?B?T3M1UVZVME4wSldVOE9wVUt1OTRPUGx2a1NlTVlkamZHRnVwcWRNeUJMdk5D?=
 =?utf-8?B?SkxzZHNxb01uNStYT2oyRmNkK1ZuYlZMN1ZwQ2ZVeGNIMDhITGR1dDNkM2d3?=
 =?utf-8?B?SkZYN25Pa1pHUXNlajBDMm56UW5MZ3lYMEFqcWtmZDN2RnRJQko0cFd4MzE5?=
 =?utf-8?B?QlN1YVRRSUFxUTl3YXFXZlZtbC80c1M5Vm9jWEk1eXZzeG5NK3ZlNDliaEJn?=
 =?utf-8?B?dnNEWlFKdGR4cDlNZVFkdmwyT0pDU3RrSFRoelFHaCtVOUVWVlVwQTZmbTVI?=
 =?utf-8?B?aW9jUW10VmFDV2w4R0g4WjFYT2NGcWtxVXFQU29zZWk5WWZuNlRPZUhUT1Fp?=
 =?utf-8?B?M3ppZ3BpNkllbDB3RXBCZ1RSdE5hRjNmbUhXYUxhdENUdk00MXJJc3c2c2Fm?=
 =?utf-8?B?czJzamhFK01JTlB4WE1XeHZGbnVzTUtTcmFwa29SRUxjUS82YXJ0OVJ1OG1l?=
 =?utf-8?B?endvTjU0cWt3N25HOVZHWTREVCtGdlhoRlR4Q2huNkUvWDFZanV0QXNoM1RG?=
 =?utf-8?B?R3hWMzBLdHg4cGlISUJITkhOb3p0Wllud3pVRW1xR3EzcDJ2NGd6eWVySHQ2?=
 =?utf-8?B?UldJeUx2VjFXckY1eUdvNmtXRHVjOHVzWVRtWEVOQ05SS3EyQWl3QjNsSEJL?=
 =?utf-8?B?eWpIS3dlenRnUUxKU25OWVVILzNPYVc2c1RLTjdTc1U2M3JwWGMvZjVtRkk2?=
 =?utf-8?B?OUtrUXk4b2duSldUNU40T3c0NDgvem02SWg3VnNEbzFNQXZ3N0czZzE0VC90?=
 =?utf-8?B?dkg3WkJQdEJkbVY4Zkt4bFdHVjJTbHhFZUQ2Y2JZaTdMWFNDbFNEdmJqRkhJ?=
 =?utf-8?B?VHVuaFBXcE16L1VHSVJiRy9xYWZtSkxMZDhaVEttVVlUcnpTZENNeE93aUps?=
 =?utf-8?B?QnFKN3UveURRZEZWMHIyWm1wL3lWcGlVUWZrWlhsU2J3VklCWlJleVIwaCtM?=
 =?utf-8?B?SFBMQzQva3RRSzJVVWlvSDdoaHhReVpDUlp4cWM4OTNQRFJCTGkyU1QzcWpV?=
 =?utf-8?B?QzB1L25xVmZ0QWJ2YnhLcCs1aTFEMHgwNWdzWXZoN2dDVWpJZnk4S29yclgz?=
 =?utf-8?B?U01UOXQ0QnR6bTVZeno1MUJidnE2ZEZNZ0N3WWxPN3ZYdGVVb3JZMUJ5SCtL?=
 =?utf-8?B?VFFpeStRTmpZZEJzNHVjUTEvYVU2Y3NJYURiNXFFTkRDVm40alhWQ0JwVXFP?=
 =?utf-8?B?aTd2TE9IUC9BTWI3U21tY3RRZHlxTFl6QUQ5RDBKYVJpZTdpSVo2S0VDKzZl?=
 =?utf-8?B?L0FPNjNmOUxNcEVxakUwcFU4clEydVMwZkhKVnMzVlN1R0FuaitBL3JCdUVO?=
 =?utf-8?B?RzB5dGp3STZkVVIzL0RrdDhsNnBDU1crOG9ZYkdCcVNnM2RkV1NETndoamVh?=
 =?utf-8?B?TjFqWEcxVm5ZdW1aLzFkMVdWbVFlTDdzblNFMDViN1E4UE83UjNHTUdzQ2w1?=
 =?utf-8?B?NmxlRHVrczdBcHM1THQxVHZZSDFRSmZuOWF1M3BtK1YyaFpiRmFuR3RRSk03?=
 =?utf-8?B?UXlsc2p4ZWxLUjZYbHNFV2JmUEM1NkY1Zm5nMTRjdlRsaktpbFBmZVkrMnpS?=
 =?utf-8?B?RWs4TzJ5Mk9BeEsxaGdhQVhVZzdxSEhyTEhkRGZKL0Y0eEZDdWo3WExSa1BL?=
 =?utf-8?B?aVEzZmo4ZFJ0QTNEV2hma1pxNFBRZlRQR1NIMXZieTUvOUJybGdPNUV0Sm4r?=
 =?utf-8?Q?XAO5DsBB8E6Eo4BA/XBVOaq8C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8113abac-1071-4b8e-1557-08dbe08023cc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 17:28:36.7108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNQGWH2/CFkMsSHEBkIyBL+Ca1NcXPYmmvDgoP8yi1cSa9is+PjvGZIIJZeLaPDHqGjoftD4Lz1pAyo3VMTBqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/8/2023 9:49 AM, Christian König wrote:
> Am 08.11.23 um 13:58 schrieb Rajneesh Bhardwaj:
>> Try to allocate system memory on the NUMA node the device is closest to
>> and try to run delayed_delete workers on a CPU of this node as well.
>>
>> To optimize the memory clearing operation when a TTM BO gets freed by
>> the delayed_delete worker, scheduling it closer to a NUMA node where the
>> memory was initially allocated helps avoid the cases where the worker
>> gets randomly scheduled on the CPU cores that are across interconnect
>> boundaries such as xGMI, PCIe etc.
>>
>> This change helps USWC GTT allocations on NUMA systems (dGPU) and AMD
>> APU platforms such as GFXIP9.4.3.
>>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Going to push this to drm-misc-next.

Thanks Christian, there is a new regression reported and I am checking 
on that. Please don't submit it yet.


>
> Thanks,
> Christian.
>
>> ---
>>
>> Changes in v2:
>>   - Absorbed the feedback provided by Christian in the commit message 
>> and
>>     the comment.
>>
>>   drivers/gpu/drm/ttm/ttm_bo.c     | 8 +++++++-
>>   drivers/gpu/drm/ttm/ttm_device.c | 3 ++-
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 5757b9415e37..6f28a77a565b 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -370,7 +370,13 @@ static void ttm_bo_release(struct kref *kref)
>>               spin_unlock(&bo->bdev->lru_lock);
>>                 INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
>> -            queue_work(bdev->wq, &bo->delayed_delete);
>> +
>> +            /* Schedule the worker on the closest NUMA node. This
>> +             * improves performance since system memory might be
>> +             * cleared on free and that is best done on a CPU core
>> +             * close to it.
>> +             */
>> +            queue_work_node(bdev->pool.nid, bdev->wq, 
>> &bo->delayed_delete);
>>               return;
>>           }
>>   diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index 43e27ab77f95..72b81a2ee6c7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -213,7 +213,8 @@ int ttm_device_init(struct ttm_device *bdev, 
>> struct ttm_device_funcs *funcs,
>>       bdev->funcs = funcs;
>>         ttm_sys_man_init(bdev);
>> -    ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, 
>> use_dma32);
>> +
>> +    ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, 
>> use_dma32);
>>         bdev->vma_manager = vma_manager;
>>       spin_lock_init(&bdev->lru_lock);
>
