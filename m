Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C56387EA2
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB986EC51;
	Tue, 18 May 2021 17:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23E36EC51;
 Tue, 18 May 2021 17:43:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2HkNoXrJLbpbkkiOLEPoNqsBb3NZXt4q+IM1/nAqnF73Vhj6HSU3OSYu9sIaFJyGKZk8at1U2uWecG8//mEcgR85BU0L2NSHid3EFCNIrfXoWVJBjMP7x5nq0mBe9oVMR8kra856URCQs9Yx0h9Fxd7O32EUHOUr2pUtXPi1YB8p/bbCreVvd3PdCIDdHjHiyHdMKEmGDEwVHZmmGDA/DgEX1ex6IEvZA2x63w6Wb7pv1sKJOgmZZYYyaTErczeOxuIYk6T7QUqRrsE5UJ/p4+eQl86P6+TgyEc7Aqm93ROaaLMh/vhC3FDL5AZl9miJJgHO9U/y9l9mpIYMUqsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9L7RuK6eCW5VqUYX/8FyWgf8HfnYbt0wE7Ddukaavc=;
 b=eCooIxLK2pLhILd4B/UAsYOr6HuiYzy06bm3w2i9LZ0258swDGgC2bpgWYai4A3Cx0W5sG9AHx/dWXn/rCGmZ9uF6dXX/nZp0W+symYIJCSE5V9t9SisR6UAsShAiR3UBrQGlghrIBAaf6MmbPPWcsBBL55zxILbK/YuHlIe9SoVXqZMUuYql2qop95X6n6lwndax+2FM/JBRDZgpGre5i+c5ycHc4cwjo0XInT1X2iNRxl5v/CxZJmYb9jQXL2hfWUsqke6177CosgwtKVY675+dFfmhWfg7xvQvlIuk/Soj/23o3plNIMowFlcGJ0+3XRP0qhOgGRNNXdM9BSYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9L7RuK6eCW5VqUYX/8FyWgf8HfnYbt0wE7Ddukaavc=;
 b=uZtIGN1ruDF+8/OYDKLnYL+2r6zHhDpsxRnfL2oomUp01W7abBrOlbz1xSP1QlNa5nvn2vfTtPU/ezREjI6Xioo2SDPPhuBwJHPxKrgUT0gwXksELKkMuEetq6+wGuY3w/CKujLZg+yt2v6DgvkoiLuKIx7LzYWRwX4zgzwURGM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:43:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 17:43:55 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
Date: Tue, 18 May 2021 13:43:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
X-ClientProxiedBy: YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
 (2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024) by
 YTOPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Tue, 18 May 2021 17:43:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6dbc476-2091-4a71-d809-08d91a248208
X-MS-TrafficTypeDiagnostic: SA0PR12MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4591D1504DC3E29EA4C49C30EA2C9@SA0PR12MB4591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FrT43gFjdt+2nx9Cmr03Hxv1/UyDQFcd18wBLyitihfEb5h+B4i5nGrtW5jZ7zV1XOOxj5RfZlwhzADfeSiwvtLUfYCwXy7EoSsyeC5/H3B36XW+mOIlWLsJATb1R2uOUkaHhCICv+VNGuA2WDMaf5ETRojHvFr0kYZ+/Yfm5nWcyXl+BFEhkIco3Aa+uZYNgRpo31OR3aAl8QzZT8h5YC4JVRbYHSOdmmN0BkTpXJnDsUdcVFl2PFEnQxSSRDVU/gq/IOLzjIeLQbXMIE4BlU6HJ2A0u1DViAv10PqD8Iw4H7aiI1G2qFQqYu4daeSM9mPRfiH1MGy1ulqGa0klgdSCoruNkWytOfutILBKjqfTt8Rerarw0TsFmsErM3Gjy9vke4xRFDVDneIjDSnUVkb5J4DtV8ob2SdNHzcaW89Vy3GJJnoM0nMXRyN9PKBRyieRPyIwEFyCzRJGbMFTXAgnHkKHOrbl2YCPwKWdVzotxfhmqVf8YgfqnwbwM0PUv24b+qw5eNdU2JhYyh5Epiuj7hFFB7q109Kn4EUCOsDAULjkjFQ7gaMZ9fhn/v/E+4ez/oWbDdDKjyi9/yfKoA4qBg/+W94OeYw3l+KtV0aqiXNpuLgHa5S4me/mnxEjwCtHKDfTaoarqn4/GbhtpupLkHyfOo5Me4Mgp3YA6Wstdj2SkAsBFtwSLFnnz3dY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(66574015)(83380400001)(16526019)(478600001)(53546011)(86362001)(2906002)(5660300002)(38100700002)(6486002)(66476007)(36756003)(316002)(52116002)(31696002)(8936002)(8676002)(4326008)(6636002)(31686004)(66556008)(66946007)(44832011)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzN4K1lEamdzaDZFRXhzOGh1b3krK0E0TE14V2ZaUHZPTzgzUENSdUZqSnBN?=
 =?utf-8?B?TmY5TkFlK090N01oeGw3RXNrODNQbkJhcDQySUlKVUhHc2ZubHoxY0loNjFT?=
 =?utf-8?B?OUxHUnNubWlPSHZzUU1zTVJGd0FLWFJCSjVYQndnSk1aUXQvSFhaZElJblFl?=
 =?utf-8?B?cnVuem50WTdVdkNaMXJ6UFlhVDFOcVRtOXNFUjFjekQzVS9IVm04K0JRRkdS?=
 =?utf-8?B?a1lzcCtHalhaM01WalE5MUVwU1gza3lWNXpvNFFNR21ETitmQ0hVVkl3UkY3?=
 =?utf-8?B?V2txeUpIZDJwSUZrZmtlZ0NOT2dkWTRQNDU5VjlGdi91MFJNWEhNRldIUnor?=
 =?utf-8?B?SzFEM2JJTW9ZVG5YVTlkcU9aejgzaCt4Z1ZmK09wY2tCNEtuOW4vemIzYVhi?=
 =?utf-8?B?VDVwaEFybmx0UWRPcWI5RThEcTRVWjhhd2I2N01oYXlOUWZINGNxUFEvcVFB?=
 =?utf-8?B?ZFFXMG8yMTIvNUdORWx0QWdBUmdhenJaYVRXdy9tbzFBUVFGUG5CdUlmUUw5?=
 =?utf-8?B?WjdaY2RrcEVBRVIvTnd0TWFmTDdZZ0Iybkk2clNRRHlYN1didFR1dEZOSFhU?=
 =?utf-8?B?VjduV0VRKzVkaHRvaWc3QzIraUY2RTFqUkFsQ3ZFNGpBR0VTNVVlYjk5MG45?=
 =?utf-8?B?TnhIdkZib1I1TWZ2dEE1MjU3aFAzZWp3QkhlMmIrNG53elNMZGtzMGxLZTlN?=
 =?utf-8?B?d1o4RnpNdVhmLzQvYlVmVWd2K0xOWm1kQ1RKZDJPMmx4cjE1WkhWZHRCeG1w?=
 =?utf-8?B?ZG5CZWJ1czZ2Z3ozYis5eDNIM2c4YmJZSGNHaWJYOHowOFpBR1FYdk5OVm9l?=
 =?utf-8?B?TTJoRE1zaGhFL05uQTFURFA3OXE4REJsa2cwOG1FdmpKYVl3cmRmelFBa0tZ?=
 =?utf-8?B?R0FQb3JaU09tODB1RzBIdFlzUkFMUVNGbVRIeGFjS203eU9rMmlFR3lwMWRS?=
 =?utf-8?B?T3ZXU0p2dkh4bWNDa3BjR3JGTExoM3BIYXJvZ1kyL3ZSYjhxcy8yRnRmYmJO?=
 =?utf-8?B?OWZOcFFpaHl0RkE0eEcvR3MxRmtvbUQxVXE1SkI3aTVMVEExdDJPZzNvampM?=
 =?utf-8?B?WGdGbkNjZ0FQaU5KdCtBanIrclRVVElOVk5TQlBZTEFUWjgzaHhGdUJOTmtp?=
 =?utf-8?B?WEptZThtWXFpSk03cDAzbkxQRjNpNzhFRG91blcyb2ZqblV5U3FaRjdsY2lB?=
 =?utf-8?B?UEVDUks5TGYxamJyM3ZBRmt2UXNqaFFhWnluOUxFNGhHV2xpMGNmS29na2Jy?=
 =?utf-8?B?NUEwbU1tRjJNeEVXTDJaU080Y2tjbkZRYXlNUjVrSXBtZGp0bXlYK1lKZk9v?=
 =?utf-8?B?alpMa2VHUTFVd3ptZkVXcDBJSmRMMzVhRFhKbVFMM1NnU1k1U2dLRENZc3ly?=
 =?utf-8?B?Snp3Rk9aVVorK0RTU1hYU285VTRZM0JiSmNwSzFpNGdieTkwdnNTL3ZTRjRh?=
 =?utf-8?B?cXZOSEtWODJzaFhocVdzZUtyM0pPQm9LSENQRUpENmprZU8zaEhBQ1ZkQWhl?=
 =?utf-8?B?OWxWd002YmRXOFBwejlSVkQrWEsyblhMcHcxcC9hT0V1dTh0TUNSeitIaUl0?=
 =?utf-8?B?WTJJNjdUMEFsTUx0cWc2SU04djl3ZE1Yay9hVFk1VGFXRHdDOUg2cm00Q3ps?=
 =?utf-8?B?ZjFLalhJVWJyMVN4NEhCenE0TmpYN1NpMHkvK3BXWG5QNTNyR0EreVRQcEF1?=
 =?utf-8?B?RW8zK2VqaXhUMmtRaHVUMHJkMEloUEh1QTczOFdxK1RXZjBBMU9aNzRQZGZx?=
 =?utf-8?B?Sm5lRlFnbGxGN0dYeEpmVVZGRG9XL2lwbnB1cmJKa0pTL1FiZUoxUGdZTndy?=
 =?utf-8?B?SnZLaDltRTR5RlJ6VDBwMUttRXJTK1d2MXoyS2R4bE5JOG4xQ1FseEphNFk1?=
 =?utf-8?Q?syA4qtFx9JhfC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dbc476-2091-4a71-d809-08d91a248208
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:43:55.6745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AuxN5yrnmXvap/Fi8r4rKtpqWytJ+pTMRPN/3xPfpu+6gWLuSNSaENCOg14sORDCq/1ccZfbCBiJ0emodiMJwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-18 12:33 p.m., Christian König wrote:
> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>
>>
>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>
>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>> In a separate discussion with Daniel we once more iterated over the 
>>>>> dma_resv requirements and I came to the conclusion that this 
>>>>> approach here won't work reliable.
>>>>>
>>>>> The problem is as following:
>>>>> 1. device A schedules some rendering with into a buffer and exports 
>>>>> it as DMA-buf.
>>>>> 2. device B imports the DMA-buf and wants to consume the rendering, 
>>>>> for the the fence of device A is replaced with a new operation.
>>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>>> scheduled.
>>>>>
>>>>> The problem is now that we can't do this since the operation of 
>>>>> device A is still running and by signaling our fences we run into 
>>>>> the problem of potential memory corruption.
>>
>> By signaling s_fence->finished of the canceled operation from the
>> removed device B we in fact cause memory corruption for the uncompleted
>> job still running on device A ? Because there is someone waiting to
>> read write from the imported buffer on device B and he only waits for
>> the s_fence->finished of device B we signaled
>> in drm_sched_entity_kill_jobs ?
> 
> Exactly that, yes.
> 
> In other words when you have a dependency chain like A->B->C then memory 
> management only waits for C before freeing up the memory for example.
> 
> When C now signaled because the device is hot-plugged before A or B are 
> finished they are essentially accessing freed up memory.

But didn't C imported the BO form B or A in this case ? Why would he be
the one releasing that memory ? He would be just dropping his reference
to the BO, no ?

Also in the general case,
drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
the one who signals the 'C' fence with error code are as far
as I looked called from when the user of that BO is stopping
the usage anyway (e.g. drm_driver.postclose callback for when use
process closes his device file) who would then access and corrupt
the exported memory on device A where the job hasn't completed yet ?

Andrey

> 
> Christian.
> 
>>
>> Andrey
>>
>>>>
>>>>
>>>> I am not sure this problem you describe above is related to this patch.
>>>
>>> Well it is kind of related.
>>>
>>>> Here we purely expand the criteria for when sched_entity is
>>>> considered idle in order to prevent a hang on device remove.
>>>
>>> And exactly that is problematic. See the jobs on the entity need to 
>>> cleanly wait for their dependencies before they can be completed.
>>>
>>> drm_sched_entity_kill_jobs() is also not handling that correctly at 
>>> the moment, we only wait for the last scheduled fence but not for the 
>>> dependencies of the job.
>>>
>>>> Were you addressing the patch from yesterday in which you commented
>>>> that you found a problem with how we finish fences ? It was
>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>
>>>> Also, in the patch series as it is now we only signal HW fences for the
>>>> extracted device B, we are not touching any other fences. In fact as 
>>>> you
>>>> may remember, I dropped all new logic to forcing fence completion in
>>>> this patch series and only call amdgpu_fence_driver_force_completion
>>>> for the HW fences of the extracted device as it's done today anyway.
>>>
>>> Signaling hardware fences is unproblematic since they are emitted 
>>> when the software scheduling is already completed.
>>>
>>> Christian.
>>>
>>>>
>>>> Andrey
>>>>
>>>>>
>>>>> Not sure how to handle that case. One possibility would be to wait 
>>>>> for all dependencies of unscheduled jobs before signaling their 
>>>>> fences as canceled.
>>>>>
>>>>> Christian.
>>>>>
>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>> is released and entity's job_queue not empty I encountred
>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>> drm_sched_entity_is_idle
>>>>>> never becomes false.
>>>>>>
>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>>>
>>>>>> v2:
>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>> to race.
>>>>>>
>>>>>> v3:
>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>> ++++++++++++++++++++++++
>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>>>>> drm_sched_entity *entity)
>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>       if (list_empty(&entity->list) ||
>>>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>> +        entity->stopped)
>>>>>>           return true;
>>>>>>       return false;
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>    */
>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>   {
>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>> +    int i;
>>>>>> +
>>>>>>       if (sched->thread)
>>>>>>           kthread_stop(sched->thread);
>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>> +
>>>>>> +        if (!rq)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        spin_lock(&rq->lock);
>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>> +            /*
>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>> +             * eventually
>>>>>> +             */
>>>>>> +            s_entity->stopped = true;
>>>>>> +        spin_unlock(&rq->lock);
>>>>>> +
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>>>>> scheduler */
>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>> +
>>>>>>       /* Confirm no work left behind accessing device structures */
>>>>>>       cancel_delayed_work_sync(&sched->work_tdr);
>>>>>
>>>
> 
