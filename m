Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57188387FE6
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F361F6EC6D;
	Tue, 18 May 2021 18:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAEE6EC6D;
 Tue, 18 May 2021 18:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuASau+pd0M6wgi+/bp0Qv7s5r7GGhAhwYI3Kp7O4mjqAehHM05T4CRNiteCD+Oqb+8PBf5ovsMNNvxkLGXXtiCf+lwzdl6FwBE6M4Vnl1UgxqKXprDx52Im43zI0yNUoKOsdZjGsVI32w67jdemnZdHabKeJhwxBqFcXDTX+S89wnFvq7vD8v/AWkeej3wal4zT3Z0IS9YtIPfAmjr1rOVL21pFtE57cWlxGG+2eouaROjmvCX63/40A1j42GOkQhGgI/EubfqdNxDkx+Fw/I5tv8AOcFyBYJkHISDFlQFe1zSm52DH3gVeVwWp9po9fbuhAV207GBGfdJ1yq6AcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ1zFzQc6M4Sav8VzzUmjgiekH21tMZiAGh4gaVXdis=;
 b=j3oIkO9xGZBCUtEVuhzLvtmbi6za1+fV1kb9L++OnDAEOwaQMerEBq7IGpDQ/gJ2wuDlUFs4D8lUYdT1XTDkvxN/yBVcHp0PjS3zCuG3t65kJ13QPMaSX31xihH+riVeVZ9SsE20wJZGioKiMX8q9cp2U5Q0Jg1mPit8YJjo8xre9M45dXV2m3IUGQJUacO4YfOvawyTbXWl1vTUo2QBrwALCK4LD5XkR2cj+MW18EzZkdLhg+DjjBoMb9t2xVBgY8kmOms6i8izzajM5nAmEWSbpAK2hbOAEjBPjL6RdPNhubsXFD/2y2aLBXCmHOPlb5Y6RCjrU8lu4AEMJIqxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ1zFzQc6M4Sav8VzzUmjgiekH21tMZiAGh4gaVXdis=;
 b=L/AsJng/xsQcuOiFGGhtaF6kQYVCU+ddiWNu6np2G5ZF/St/1be2/pW6IzmJJwEuXp+gxDsS3a6F8S8zSfmmdXABA575lKIH5xvvPRJPkR3KU6Sv1Bk5/AyCr5hMVq0hOWEa4tI7Low8xvU8rkBOs35Bqcu7m3XrACVKSG0bLJ0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.27; Tue, 18 May
 2021 18:48:57 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 18:48:56 +0000
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
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
Date: Tue, 18 May 2021 14:48:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
X-ClientProxiedBy: YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024]
 (2607:fea8:3edf:49b0:f8d5:c6ca:4eec:9024) by
 YT1PR01CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Tue, 18 May 2021 18:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a294da-fc61-42a6-a7bc-08d91a2d9762
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576FFA99D89FFC4036EBE95EA2C9@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yIqGP1Ee22YxQRqLQLLtjT+nR8uilfYEGeUnNK9aBZGSNgcOF9i42StcKRWN0+7ixJ+i0Fl2fyHN807ub+MUE8EZlU0Cqpnwf2xz2ZS3UjiTU0EicKm9qekTPQm59qXqpFxacunYKR9h9iZ21eR1uDjNxTa5pJNWceKnBPm7vb1VWMcOgnPjQ3SYycbB/xnXoXWMfA0R6DytSthnKgUk6T1zWZyXa1pAS8bdX06G4j7CPKhReLgkacbFjLQq/igHh8PMoJI80gYhYav1Ldn0OSBIRK9qkOQ1ZSOo1ojk4s5bcEo64Se5tjbAb3T8HRriVtiQgLtTTTPddJqcXiuY350lcbdpj56i2lkJeDERhbvBnbSrwjltAR319ybAf4oRuEwjXmWEMtML9lxNGz/OwmEB26E9Wq6/BXoWVarywzhJ8oY3O5RlfbX+39vKM3B/myWUvZ7ymR7JPUyUmLsKI20O1Ot59TRW+rZ3THiZqDc8K0qGqSpPUv2ewO0wRa438ONda7LsdpzAgDvS/f0E5jjxeUCDkqs0zK1e/hHRFvoIdFr5DB36+K4HV9DBod3/68fdR5LDerm+ccSwd/JbgI9QUj1c7BiJmWwIT93nLsWXvChyhpijNz4uXvAj8l98/JOvkWstk/9hUFfIhyD9S1kDl4v48O+H/R6nvsLxYac2/JGDxTp7raLWC4QdFTmF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(83380400001)(38100700002)(4326008)(31686004)(8676002)(316002)(53546011)(31696002)(2906002)(186003)(86362001)(6636002)(16526019)(44832011)(36756003)(5660300002)(66476007)(66946007)(66556008)(6486002)(8936002)(2616005)(52116002)(66574015)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnQvVUZvMDRZakVjeENaT0lpa3JCUmQ4SXJkVGMrOHRYdHRWa2prZlYvdUM3?=
 =?utf-8?B?bFBlSWFkOXRzMEVDY0RaajB2Q3lld0FMZ3JhdGpqMnpKWjZQaTZBRUdPU2g4?=
 =?utf-8?B?V2gvbllldDB3cnIrQlVtcGlnL0xrMWxUVjg2WTVYV0hOOUFaVjYwUGN1aG52?=
 =?utf-8?B?OGRQb0dJWVBGeC9Hb0UxU3hTbXBvN1dnSG00dWNsa3NkWlhXd0lMVktxa1Az?=
 =?utf-8?B?dWM0WWxlWjcrM0g3cXdYYkJXMmdVdVZkS0MzRWpjQWFsbkhqNEtmck9UZXdY?=
 =?utf-8?B?UXVxRnZycW5FNjBUTFRwUi9rNGJ0V00vWVJ2d3BYZDdFbjk5OUxCOXpVUVg4?=
 =?utf-8?B?dlVUUnBSdVkyNytlY1B2OFlzQytoeFF4UlJiL2hQK0JyMmFSMVEvZkNHVFgz?=
 =?utf-8?B?a0xIWW02UHBRTENramFTWTRxd2gxR0x5SGQxeW1yZUVSWXBJUTdueTBrQWl1?=
 =?utf-8?B?b0ZhUDI1R3hkdEltZW90Y1N0OXU1SkVFRjQ4clMyR2JJWm0waXdpRGt4SWlv?=
 =?utf-8?B?a3dvR1pSNzM0NjVCaDhOd3pjMTVucHZpbE5PM2M2cXZqdmNLaDNwbjQyM3pV?=
 =?utf-8?B?RTUxZm42cmQ2OGt6ZnNMOURubjJCRGtvZ0cvTm5DL204eTlHUUlySXIyYWVi?=
 =?utf-8?B?UjJPTktqREJoN1JiNFRkUWtVYXJVYU44dzgxOVdxRUc2bHgrTndjSmViZWht?=
 =?utf-8?B?QkJVTXo5UFA0cHR0LzNvRDhrdVJxeWZ2N3pVK0I5NFdNcTUzNnNrazhTV29i?=
 =?utf-8?B?cWVJYTNtVHFaOFJzT1hPbGgxc1dlM3M4V3FucUJpUXJHbnd1enNMTnRRSWMx?=
 =?utf-8?B?eThIQXJ2OE1pZUFIMzgvUXB4SEdYM20wS01MZFNZSit2QVdiaFo1Mm9XdG55?=
 =?utf-8?B?dmE0NituNW0wMjExMFVka09Ocjk1T0w0ZnovZGtEN1M4QnlWdnl1QXRJRTVI?=
 =?utf-8?B?Y0RqUEZyVXhuVVQ4RENndzJWcEczUXVrUWtiTGN4aXZieGZzOU90azJtcng0?=
 =?utf-8?B?OFVYRjFuTEVyQWV5K0lCNkIyMGhWbzZwcVh3b3J3Ym81d3ZjajVrWEJhZkdS?=
 =?utf-8?B?Q0s5b2dJZ0ZiY0ZYZVFoU1RSK2g2TVVhOE4vaFJ4TkRneUpOK2Fud3JFWlVQ?=
 =?utf-8?B?V25OSzRDcW02UXlGWkhaSi9JNmcwWW42eGUwcXpWQ1A1RWNOUHZ0NjI5YW9q?=
 =?utf-8?B?ZkxNYWhFVnFkeUFyL3JMSFBvd0JvZVpoeEhqd2twRmdlYWFmdVBvdkVRMElm?=
 =?utf-8?B?UlBrSXFiUTZKVkRGTGJOdnBnaFN1TjdQemU3WEFDakxGNHBhVXJHU2MwUHpQ?=
 =?utf-8?B?V3duNG9OL0MyTnZKK29vRUVRak83eUEwemtVcEZaVUR5MDAyM09UL0laL3Fa?=
 =?utf-8?B?azludVBaMmtOdTJyamV6QVhVeDNWSVFkMDVZTnk3YU16cUwvSU55eFNGVERO?=
 =?utf-8?B?TndsaVV3Z3o3QUMrZE5Ic3pybzVqR1I5eHVJME9XQTVHc3hYS29XT2t5Mk1j?=
 =?utf-8?B?a1YvL0dYU2RUekx4cDEzOHZTajdWazl4L25NZkgxQ3ZXTXhRZ05TbWRlMng3?=
 =?utf-8?B?YWxzOUtHdjZGZFl1dzJFbmlRVUJDbThEbmNBclVqa1duMkZrM1E1dXg0eUtr?=
 =?utf-8?B?MC94V0VrMHo2Wm5pSk5vNjczclZPMGIwNWMyNGZOMDBEdmcwamx4ZUZETHVR?=
 =?utf-8?B?VzdVbnJIb000ek9jRWprM3NtUUpLSEF3YjZqdWZwU0k4NzZralJqbUR3RjJ1?=
 =?utf-8?B?NlZiYmlGT09Hc3l0OXVHdi9DVmlxQy9uUUlEay9zM1lLSEdldFY0cFAxdnBF?=
 =?utf-8?B?NzBCU1VSTW9Ubm10UnFDYjJXT2ViNFB1SXdkdjg3Vi93TVZrcTdmdWtZZmJP?=
 =?utf-8?B?VVYxVmdtTm8yWmpFYUlLdllYejBjbE5oNmlsNk4wTnBwOGc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a294da-fc61-42a6-a7bc-08d91a2d9762
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:48:56.7330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Hj1rX5GHAn64W0O4P7HJGs9eRw8kvagPeldYrqmAyXKDdj+Q2uEMEkgGUL2wvbSn/CD29byymAgQWmXh0X+vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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



On 2021-05-18 2:13 p.m., Christian König wrote:
> 
> Am 18.05.21 um 20:09 schrieb Andrey Grodzovsky:
>> On 2021-05-18 2:02 p.m., Christian König wrote:
>>> Am 18.05.21 um 19:43 schrieb Andrey Grodzovsky:
>>>> On 2021-05-18 12:33 p.m., Christian König wrote:
>>>>> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>>>>>
>>>>>>
>>>>>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>>>>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>>>>>
>>>>>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>>>>>> In a separate discussion with Daniel we once more iterated over 
>>>>>>>>> the dma_resv requirements and I came to the conclusion that 
>>>>>>>>> this approach here won't work reliable.
>>>>>>>>>
>>>>>>>>> The problem is as following:
>>>>>>>>> 1. device A schedules some rendering with into a buffer and 
>>>>>>>>> exports it as DMA-buf.
>>>>>>>>> 2. device B imports the DMA-buf and wants to consume the 
>>>>>>>>> rendering, for the the fence of device A is replaced with a new 
>>>>>>>>> operation.
>>>>>>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>>>>>>> scheduled.
>>>>>>>>>
>>>>>>>>> The problem is now that we can't do this since the operation of 
>>>>>>>>> device A is still running and by signaling our fences we run 
>>>>>>>>> into the problem of potential memory corruption.
>>>>>>
>>>>>> By signaling s_fence->finished of the canceled operation from the
>>>>>> removed device B we in fact cause memory corruption for the 
>>>>>> uncompleted
>>>>>> job still running on device A ? Because there is someone waiting to
>>>>>> read write from the imported buffer on device B and he only waits for
>>>>>> the s_fence->finished of device B we signaled
>>>>>> in drm_sched_entity_kill_jobs ?
>>>>>
>>>>> Exactly that, yes.
>>>>>
>>>>> In other words when you have a dependency chain like A->B->C then 
>>>>> memory management only waits for C before freeing up the memory for 
>>>>> example.
>>>>>
>>>>> When C now signaled because the device is hot-plugged before A or B 
>>>>> are finished they are essentially accessing freed up memory.
>>>>
>>>> But didn't C imported the BO form B or A in this case ? Why would he be
>>>> the one releasing that memory ? He would be just dropping his reference
>>>> to the BO, no ?
>>>
>>> Well freeing the memory was just an example. The BO could also move 
>>> back to VRAM because of the dropped reference.
>>>
>>>> Also in the general case,
>>>> drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
>>>> the one who signals the 'C' fence with error code are as far
>>>> as I looked called from when the user of that BO is stopping
>>>> the usage anyway (e.g. drm_driver.postclose callback for when use
>>>> process closes his device file) who would then access and corrupt
>>>> the exported memory on device A where the job hasn't completed yet ?
>>>
>>> Key point is that memory management only waits for the last added 
>>> fence, that is the design of the dma_resv object. How that happens is 
>>> irrelevant.
>>>
>>> Because of this we at least need to wait for all dependencies of the 
>>> job before signaling the fence, even if we cancel the job for some 
>>> reason.
>>>
>>> Christian.
>>
>> Would this be the right way to do it ?
> 
> Yes, it is at least a start. Question is if we can wait blocking here or 
> not.
> 
> We install a callback a bit lower to avoid blocking, so I'm pretty sure 
> that won't work as expected.
> 
> Christian.

I can't see why this would create problems, as long as the dependencies
complete or force competed if they are from same device (extracted) but
on a different ring then looks to me it should work. I will give it
a try.

Andrey

> 
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 2e93e881b65f..10f784874b63 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -223,10 +223,14 @@ static void drm_sched_entity_kill_jobs(struct 
>> drm_sched_entity *entity)
>>  {
>>         struct drm_sched_job *job;
>>         int r;
>> +       struct dma_fence *f;
>>
>>         while ((job = 
>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>>                 struct drm_sched_fence *s_fence = job->s_fence;
>>
>> +               while (f = sched->ops->dependency(sched_job, entity))
>> +                       dma_fence_wait(f);
>> +
>>                 drm_sched_fence_scheduled(s_fence);
>>                 dma_fence_set_error(&s_fence->finished, -ESRCH);
>>
>> Andrey
>>
>>
>>
>>>
>>>>
>>>> Andrey
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> I am not sure this problem you describe above is related to this 
>>>>>>>> patch.
>>>>>>>
>>>>>>> Well it is kind of related.
>>>>>>>
>>>>>>>> Here we purely expand the criteria for when sched_entity is
>>>>>>>> considered idle in order to prevent a hang on device remove.
>>>>>>>
>>>>>>> And exactly that is problematic. See the jobs on the entity need 
>>>>>>> to cleanly wait for their dependencies before they can be completed.
>>>>>>>
>>>>>>> drm_sched_entity_kill_jobs() is also not handling that correctly 
>>>>>>> at the moment, we only wait for the last scheduled fence but not 
>>>>>>> for the dependencies of the job.
>>>>>>>
>>>>>>>> Were you addressing the patch from yesterday in which you commented
>>>>>>>> that you found a problem with how we finish fences ? It was
>>>>>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>>>>>
>>>>>>>> Also, in the patch series as it is now we only signal HW fences 
>>>>>>>> for the
>>>>>>>> extracted device B, we are not touching any other fences. In 
>>>>>>>> fact as you
>>>>>>>> may remember, I dropped all new logic to forcing fence 
>>>>>>>> completion in
>>>>>>>> this patch series and only call 
>>>>>>>> amdgpu_fence_driver_force_completion
>>>>>>>> for the HW fences of the extracted device as it's done today 
>>>>>>>> anyway.
>>>>>>>
>>>>>>> Signaling hardware fences is unproblematic since they are emitted 
>>>>>>> when the software scheduling is already completed.
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Not sure how to handle that case. One possibility would be to 
>>>>>>>>> wait for all dependencies of unscheduled jobs before signaling 
>>>>>>>>> their fences as canceled.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>>>>>> is released and entity's job_queue not empty I encountred
>>>>>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>>>>>> drm_sched_entity_is_idle
>>>>>>>>>> never becomes false.
>>>>>>>>>>
>>>>>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>>>>>> scheduler's run queues. This will satisfy 
>>>>>>>>>> drm_sched_entity_is_idle.
>>>>>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>>>>>> as the scheduler main thread which wakes them up is stopped by 
>>>>>>>>>> now.
>>>>>>>>>>
>>>>>>>>>> v2:
>>>>>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>>>>>> to race.
>>>>>>>>>>
>>>>>>>>>> v3:
>>>>>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>>>> @@ -116,7 +116,8 @@ static bool 
>>>>>>>>>> drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>>>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>>>>>       if (list_empty(&entity->list) ||
>>>>>>>>>> - spsc_queue_count(&entity->job_queue) == 0)
>>>>>>>>>> + spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>>>>>> +        entity->stopped)
>>>>>>>>>>           return true;
>>>>>>>>>>       return false;
>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>>>>>    */
>>>>>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>>>>>   {
>>>>>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>>>>>> +    int i;
>>>>>>>>>> +
>>>>>>>>>>       if (sched->thread)
>>>>>>>>>>           kthread_stop(sched->thread);
>>>>>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>>>>>> +
>>>>>>>>>> +        if (!rq)
>>>>>>>>>> +            continue;
>>>>>>>>>> +
>>>>>>>>>> +        spin_lock(&rq->lock);
>>>>>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>>>>>> +            /*
>>>>>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>>>>>> +             * eventually
>>>>>>>>>> +             */
>>>>>>>>>> +            s_entity->stopped = true;
>>>>>>>>>> +        spin_unlock(&rq->lock);
>>>>>>>>>> +
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for 
>>>>>>>>>> this scheduler */
>>>>>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>>>>>> +
>>>>>>>>>>       /* Confirm no work left behind accessing device 
>>>>>>>>>> structures */
>>>>>>>>>> cancel_delayed_work_sync(&sched->work_tdr);
>>>>>>>>>
>>>>>>>
>>>>>
>>>
> 
