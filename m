Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76567387F30
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 20:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327896EC5D;
	Tue, 18 May 2021 18:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2A56EC5C;
 Tue, 18 May 2021 18:02:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knOcZ0Vwo2dqXYuVKeRaerCLgLYqWSuG5Xoc+EWH0+NQTkkStaf/+3JJNaCWkCnoJlg2k4bCxCYrFSOu7YOW4Cv+FyRz5DCTQlf4ZWQr9iTOcWXg4YWTG2RuwEh9Vjm/6fPWwVL+JEYaeKVC4o+M2DIUN8qrPZWSFnGEQMawR6P8q0f2qdgIq1NQgRR7ayUlHfFEG9SJmsLB/Z7S6AxbvIE/8Ghi0w9KE12t5DWlAKsNPYUB3Yl3z+diVfHxIfQUJMQs0UR9G5c2stfSFeeDYpnBQdI4L/SlmeXSGg07b5J0uVKWPJU9jmSGtHptKqSCaz/jIvVVEqzu0Pjdc04POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX26ehZ4Rsug5+Q/GfMY5IdetKFdqs4YfNlTD0645rc=;
 b=mfESOfZX+1sA8Q2lPELlTKmxIEY/rcA6ut8ImjzmVEN0FtKHnmOd/OGnBUWs4Ng29ecXVQcleIATssDT3q/QC6G/ANMCXMXLwUDFewMMNKkEeMQz70tLmGWBWQBG4GFTm2dwb+id8ZgYuX5H9S4gWxf6Fp6CJEjz16znu+wjdhCSy7LbqncB8mh1GS3IlEi/t1++wnV75Pl2fsAuZg9GvNyyHrbN9VrR6GOmsY+pC9ZIEyjfa3e+QKvHnOFRhcySflVmuVBw+bSjYXM8g5wW+zL/qlX3M6qh9Ira+gszxCsOiuZxyG9rszS2mSy28QdneiBOrSCdmKNjZsl8aA9+dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fX26ehZ4Rsug5+Q/GfMY5IdetKFdqs4YfNlTD0645rc=;
 b=lXqV+KeFt2kHNkLotI1OKQEpeVG4J6qd+CDB6ICstCBbugNy18nftmbd7nna+74hMnIljC4ssKlrNClX0zWunIwh+QmGslcsITAIzXltJg6aAwbf+BNMyTgn8a53rCNI8y6rVE4P0aumrru1rsC7yRCkb1sTHe1q1HjOC5Z+J+s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4607.namprd12.prod.outlook.com (2603:10b6:208:a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 18:02:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 18:02:11 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
Date: Tue, 18 May 2021 20:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 18:02:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88b5bdbe-f763-42b4-e166-08d91a270ef6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4607219B8C869F10F094C68B832C9@MN2PR12MB4607.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95Z7nRnhTWD2VP+8FrgbPJuN40BXeuHVBU9wJtVMZq1FqFKEzHVkHbxNBPg7fiZ0laCisyrN5TC2EdcQSQk7LEIu1izcZoqERxD5vUSOk2IyJTL24lI5hWpMQVGlqQ1Wjib8d0vVr8f9VStOfqSnd2s/dTUBXbfmO6wroMF/TFaYYQQnFH7FH0IpF+jypoYThWN3PtkOtBdao68hRYPWkMgTlRH/fcXARJeXIdUlViFQnrALZq0yghsdMnSNXpttVXXQUKPuAnUeqOHQoYuuX7OlG2IvjnxabBDI3wQb0O8M+Tspri5gFgFI6I9Qoyzs9QQnLv25Bc9B60u6JWl8EW75CcY4Q79CHYQbJOgppI4qh3IJTt7QW8KgSkar3UozkK4e0Lo+UFaUAh2fxZ2BHp0/OBy4nLSPkcqaTGUzSAN/U8aE/JsBb5WaywBev24+SUV/xAkOaMjc8YpG/tsTIvrxjCYlgr8xniX6B45rtZNY+t0Hz5ShQPc2CtFcTO4YvzokN7+e21OLPUUQu9dx5Aby1iJqJj29yLssAQaIzKq+MIEqw76OoXEvGKSZn3NGH3a2iKJEfI+hnGb4NF0bowT3dU9MeoISzXpp7VtQSJyX5T1LokSXBbyxoe/atTA2FIK/KWzVFlfgNlt/rZxIx/7Ox/PYi8n37y/he2zTE9XeD21lOgUiOadpK/6Bzu3C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(31696002)(31686004)(8676002)(478600001)(6636002)(16526019)(186003)(66574015)(2616005)(2906002)(8936002)(6486002)(52116002)(83380400001)(5660300002)(36756003)(86362001)(53546011)(316002)(38100700002)(6666004)(66476007)(4326008)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWt3d2pTTHpOUUJxQ0g3TkozTkxGZWJoWGJqZjNXdmZ3M1h0bTdkRjhDOU1P?=
 =?utf-8?B?bEYvSzZZeHhVd0RwTzFTcEhLbzN3OWxJOGFyY1BkWnZPa1g2SFVNVzdQQ2Fr?=
 =?utf-8?B?TXQ1d0dxbFpwSnlVcmtwK2NOcjl4aGg5L2pkWmsxSGVVaG1YR2k1VWhmd2J3?=
 =?utf-8?B?NGVzR0VHQ1NrMHZMN0ZlWEhaaTRuRmo1NTFMTmJFNERUR2s4b0JKbm53NHFQ?=
 =?utf-8?B?NXVoTXRrSmlXMFh4Y2FqSW9Ta1R1eXBmQ1JBay9nQ2tnVEhLdmdPUFlNaVNP?=
 =?utf-8?B?K3h5cW1yclN2bThNdSsvWCs5YlRueFc0TjZodmROaVZBK2NlQWRNb3h1TlV4?=
 =?utf-8?B?a3U4UExRNm14RytkRldpTFozWUVSTXhiU0EzKzJValJwZTNmMkd4SWNJSmJx?=
 =?utf-8?B?aklKcGVSUmZReVlXbWdiU1h4aVhpMWRDQ293UC9mVXhRVnNsWjg4dzZxOWY3?=
 =?utf-8?B?MkNkZ1p3bXRDYXVMcnJPQ1FVZHAzcEFwUCs4NlRoUHd1TEVHUlRQZ3JJeVF0?=
 =?utf-8?B?RnI1Q0JxWk9TU1AzN1JuczhnaDQ5bFoxa09GdUlyS1p1QXlPRWtxNkY3a0wr?=
 =?utf-8?B?elc2TjZlWnBzTGE5b1RSQ0RvcFNKb2ZVTFhkNWZYQXErV1NwVzU0UUplZHZs?=
 =?utf-8?B?bDRCbVVoejdoOFVCYmF1SVZzTVBHT1ZpRWMxMS9GVEk0UGd0cEhFUHBzRzVW?=
 =?utf-8?B?QWEraDJGRXFvS3U0UUFrem9TQzVPMHNrajQ5VWRhR1g3bi9xbzlWVUdjNG9t?=
 =?utf-8?B?VmxXaUEwRm00M3BlTEozV2VMR1p2N3QwWG5haTJJWFVaVVcyVDh0UEVETlg2?=
 =?utf-8?B?bUh5MmhoVXo4Z0JPdGV0VSt4VWJpUjRJTjdMWC9INTZBQmZRcVpwdEl4WDF4?=
 =?utf-8?B?RXJBZVNLTUZtTmtTQ3g1NktlNWpKd1hqb3RQZ0FTdkNDd2V3d1JSL1J0dVln?=
 =?utf-8?B?bjFzZVl4OWVVRzJOVXc5T0I4cjRMay9FYkFqUytnWFZqMEZRR0dSUWptSjg0?=
 =?utf-8?B?UVJNNGpaZXRUOTlpZ0FXenlhaW82TjNlTU1WdDUzOFZkVHlBemhBS0xpeWZW?=
 =?utf-8?B?anRNMUhGKy9RSkdSM1BRblQ3VDZ6OEFhais3SkY4UnVQRFRvQVVjOUlTNVpy?=
 =?utf-8?B?YVNjUG5aRmhtSHI5RVBheHJBOU11U0VOL0hiczlIZC80U3BNVmJEVmY0SnFj?=
 =?utf-8?B?OGcxUkVJa2tXMmxjT1RJMWtrRzdYMmljeHhiRjM4NjR3MVZHWFVtUTNtcWdC?=
 =?utf-8?B?cyttS2FyVFc2T0pRbEptZEt1Wlg5V1BvOG9QRlhKbHNKNEhXQSswbTQ4dnFy?=
 =?utf-8?B?MmZZUXJiRXJ3VUUveXRnN2RtSlZzSGVxeDczMTJxRXJWYk5xNEYvYUtiaG1i?=
 =?utf-8?B?czlmc3Nncy81RkEycERRV3pBWVo1YTNGV2VlaVQ1TXdZdVpLdFJMc0Yya0g2?=
 =?utf-8?B?SUFhTmlNTXovdEYraWtwRFVpeUFLQWpHbldwanc1N054ZjVPQ2xPdlFxcWI1?=
 =?utf-8?B?cXhiNE9VeVA4RUVkLzR5Uk40UThacVh0UUx1MzJrR0lXVmtrUGcxbWlwdG9S?=
 =?utf-8?B?dXFjdSsxYnNCUTlIQUpHVlZTSG43Q0NiWUltOUFiTGp2TjlxTG11ckZzZm41?=
 =?utf-8?B?cjZoVzVhWU5IVUkzQVo0SjFnOTh0VkV4MmV1ZUZRTndtWnN3bSt4YlpPbDdi?=
 =?utf-8?B?bytBNFJVVzRXWHBnNEVuTVVoR2VJamU3NXE4Smx5WWM2aFNEVFNxUFlVL0Zx?=
 =?utf-8?B?azlZYUxKUnFLS2xzbnFnL1IrRGc5dWxWSmdDU2tMa2JXUGt5bFd1dzExNXBV?=
 =?utf-8?B?c0lvT3NjMWUxMytNYTY2SzVpcExLK0FPek1SdnhPbEJva2JPL29ub0RZMVlT?=
 =?utf-8?Q?hYVRvIHVuRCVd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b5bdbe-f763-42b4-e166-08d91a270ef6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:02:10.9631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAhupbvRbiSQGncRkk0pU+oKEZbArdTvo9Jplq1MDYikIK9Dr2khvCS2nUO9UQ8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4607
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

Am 18.05.21 um 19:43 schrieb Andrey Grodzovsky:
> On 2021-05-18 12:33 p.m., Christian König wrote:
>> Am 18.05.21 um 18:17 schrieb Andrey Grodzovsky:
>>>
>>>
>>> On 2021-05-18 11:15 a.m., Christian König wrote:
>>>> Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>>>>>
>>>>> On 2021-05-18 10:07 a.m., Christian König wrote:
>>>>>> In a separate discussion with Daniel we once more iterated over 
>>>>>> the dma_resv requirements and I came to the conclusion that this 
>>>>>> approach here won't work reliable.
>>>>>>
>>>>>> The problem is as following:
>>>>>> 1. device A schedules some rendering with into a buffer and 
>>>>>> exports it as DMA-buf.
>>>>>> 2. device B imports the DMA-buf and wants to consume the 
>>>>>> rendering, for the the fence of device A is replaced with a new 
>>>>>> operation.
>>>>>> 3. device B is hot plugged and the new operation canceled/newer 
>>>>>> scheduled.
>>>>>>
>>>>>> The problem is now that we can't do this since the operation of 
>>>>>> device A is still running and by signaling our fences we run into 
>>>>>> the problem of potential memory corruption.
>>>
>>> By signaling s_fence->finished of the canceled operation from the
>>> removed device B we in fact cause memory corruption for the uncompleted
>>> job still running on device A ? Because there is someone waiting to
>>> read write from the imported buffer on device B and he only waits for
>>> the s_fence->finished of device B we signaled
>>> in drm_sched_entity_kill_jobs ?
>>
>> Exactly that, yes.
>>
>> In other words when you have a dependency chain like A->B->C then 
>> memory management only waits for C before freeing up the memory for 
>> example.
>>
>> When C now signaled because the device is hot-plugged before A or B 
>> are finished they are essentially accessing freed up memory.
>
> But didn't C imported the BO form B or A in this case ? Why would he be
> the one releasing that memory ? He would be just dropping his reference
> to the BO, no ?

Well freeing the memory was just an example. The BO could also move back 
to VRAM because of the dropped reference.

> Also in the general case,
> drm_sched_entity_fini->drm_sched_entity_kill_jobs which is
> the one who signals the 'C' fence with error code are as far
> as I looked called from when the user of that BO is stopping
> the usage anyway (e.g. drm_driver.postclose callback for when use
> process closes his device file) who would then access and corrupt
> the exported memory on device A where the job hasn't completed yet ?

Key point is that memory management only waits for the last added fence, 
that is the design of the dma_resv object. How that happens is irrelevant.

Because of this we at least need to wait for all dependencies of the job 
before signaling the fence, even if we cancel the job for some reason.

Christian.

>
> Andrey
>
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>>>
>>>>>
>>>>> I am not sure this problem you describe above is related to this 
>>>>> patch.
>>>>
>>>> Well it is kind of related.
>>>>
>>>>> Here we purely expand the criteria for when sched_entity is
>>>>> considered idle in order to prevent a hang on device remove.
>>>>
>>>> And exactly that is problematic. See the jobs on the entity need to 
>>>> cleanly wait for their dependencies before they can be completed.
>>>>
>>>> drm_sched_entity_kill_jobs() is also not handling that correctly at 
>>>> the moment, we only wait for the last scheduled fence but not for 
>>>> the dependencies of the job.
>>>>
>>>>> Were you addressing the patch from yesterday in which you commented
>>>>> that you found a problem with how we finish fences ? It was
>>>>> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>>>>>
>>>>> Also, in the patch series as it is now we only signal HW fences 
>>>>> for the
>>>>> extracted device B, we are not touching any other fences. In fact 
>>>>> as you
>>>>> may remember, I dropped all new logic to forcing fence completion in
>>>>> this patch series and only call amdgpu_fence_driver_force_completion
>>>>> for the HW fences of the extracted device as it's done today anyway.
>>>>
>>>> Signaling hardware fences is unproblematic since they are emitted 
>>>> when the software scheduling is already completed.
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> Andrey
>>>>>
>>>>>>
>>>>>> Not sure how to handle that case. One possibility would be to 
>>>>>> wait for all dependencies of unscheduled jobs before signaling 
>>>>>> their fences as canceled.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>>>>>> Problem: If scheduler is already stopped by the time sched_entity
>>>>>>> is released and entity's job_queue not empty I encountred
>>>>>>> a hang in drm_sched_entity_flush. This is because 
>>>>>>> drm_sched_entity_is_idle
>>>>>>> never becomes false.
>>>>>>>
>>>>>>> Fix: In drm_sched_fini detach all sched_entities from the
>>>>>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>>>>>> Also wakeup all those processes stuck in sched_entity flushing
>>>>>>> as the scheduler main thread which wakes them up is stopped by now.
>>>>>>>
>>>>>>> v2:
>>>>>>> Reverse order of drm_sched_rq_remove_entity and marking
>>>>>>> s_entity as stopped to prevent reinserion back to rq due
>>>>>>> to race.
>>>>>>>
>>>>>>> v3:
>>>>>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>>>>>> and check for it in drm_sched_entity_is_idle
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>>>>>> ++++++++++++++++++++++++
>>>>>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index 0249c7450188..2e93e881b65f 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>>>>>> drm_sched_entity *entity)
>>>>>>>       rmb(); /* for list_empty to work without lock */
>>>>>>>       if (list_empty(&entity->list) ||
>>>>>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>>>>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>>>>>> +        entity->stopped)
>>>>>>>           return true;
>>>>>>>       return false;
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index 8d1211e87101..a2a953693b45 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>>>>    */
>>>>>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>>>>   {
>>>>>>> +    struct drm_sched_entity *s_entity;
>>>>>>> +    int i;
>>>>>>> +
>>>>>>>       if (sched->thread)
>>>>>>>           kthread_stop(sched->thread);
>>>>>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>>>>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>>>> +
>>>>>>> +        if (!rq)
>>>>>>> +            continue;
>>>>>>> +
>>>>>>> +        spin_lock(&rq->lock);
>>>>>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>>>>>> +            /*
>>>>>>> +             * Prevents reinsertion and marks job_queue as idle,
>>>>>>> +             * it will removed from rq in drm_sched_entity_fini
>>>>>>> +             * eventually
>>>>>>> +             */
>>>>>>> +            s_entity->stopped = true;
>>>>>>> +        spin_unlock(&rq->lock);
>>>>>>> +
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>>>>>> scheduler */
>>>>>>> +    wake_up_all(&sched->job_scheduled);
>>>>>>> +
>>>>>>>       /* Confirm no work left behind accessing device structures */
>>>>>>> cancel_delayed_work_sync(&sched->work_tdr);
>>>>>>
>>>>
>>

