Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E254353D9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B066E158;
	Wed, 20 Oct 2021 19:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465A089F53;
 Wed, 20 Oct 2021 19:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hydRuwUu4G2FcdBvErRZX26Hxvw4KZhlPdLIsvnCbcCaN6T8OBujD0KalL/XNZt36s73D/BCqJ+inAxpL3Q+1rty2hnIoX2/y/DRuCjXAX883Q7cMUtim5ekz8yhyhTgBaaeZf9uEiatsh/ePk1xIaVtbyLa0a3k6CyxVGkz9IVoGuKWE2jHTjVRhXU/BohG22t4QRWeNiOTsqBl7jBg/esYUpEf1un83HUD1yOLh9fHLUyFXYuRoemfWgR1cQk10yaw0H4E8hX20zzPBlOgyaA0LBFccKGnRw1SAG0NLvM6B9PrJnPwcjDnytKlxUjq+BHfIhqXy7JY/e+AI6vuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvs1MZoJ+jzxG6I7TGkDVnPygquJV0Hk1z4Q6tnWMzM=;
 b=R6GPqdrBs8BqO6bev/cR5vsARpaVZs24ymxP0IQUqyUjXI6ihu+vkIDpHcq4njnY03TW8NeeTBMJeMTvnrL0gku7djVspWHlJecGyI5yTX5dKevSZgMVhYpu4wXUmQ4/rY1zyz0IcZzk/s3IVBz0u709QxLVICbnQFNAWs0oCJ5P3t87UxMLSvHC1DCK2ZDVkuy0rPW4RHhfyDuAwCJJnxKpCDhLYw8KRKvIkPFY1B7gVBht+2m5Y0jrEhpRx4cOiErfu1lW3QYjWoDNZ4O+/rxhffLG0z4hkOCtHc/Jl8tNTZtrHWOpIkyw0qwGS84UBQuPAx7sgE/eI4QDdV6hjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvs1MZoJ+jzxG6I7TGkDVnPygquJV0Hk1z4Q6tnWMzM=;
 b=1H7oJXIFcaVvgR4RqaRK+8RIppbbYqNTc8dGTTxHYmZVts/SCUhOJ0h0mGr8K56PNLqF5ZLPGy0alElSSDFEGXROy0SLTzCF380Rguwa0k8Lz7Go4CFgFBg0Ees8ib5HiYIKhr6zqGwAJ7FceqYmqtyqQIg3hKwsaSHuz/wCWLI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 19:32:50 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4608.018; Wed, 20 Oct
 2021 19:32:50 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
Date: Wed, 20 Oct 2021 15:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::20) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:dadd:89a3:1273:7800]
 (2607:fea8:3edf:49b0:dadd:89a3:1273:7800) by
 YTOPR0101CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Wed, 20 Oct 2021 19:32:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14416920-938b-49c5-f552-08d9940066a2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB12757CC66AA5069D508F514EEABE9@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9F2kufz7oWO79n5s1cTdJFAebFGK9PDb8tpWHhyM4CvpURBe5Jmz8NfHHIeBeixRYacHUduTRidESGXXkTGfJXTmlo5WYckE1wIntdDDx3M2q2jFRoaEs1JvFs6H8At2Ni2NJwYJHbWGJchH5M+9CIgVPyx42dHmBEFVWZUuJCu3U+yMe+PQCqzJfUrilb2BXrGquUYHMfnen7rjKYdesFz+TXhgPwJbJv9+nFeo7MAN/b0wwPRzKk9sC5M2GrBkCHhlY2AeswPgUY9tiwUfDw+t3To1TAEWcIYxOaK2j+fqn5rZgXLEHc7zil+gkNYY1Nx/e2tgrUA6Jl+6kZ7lHMPp5cGZwrtDwvNHAGLZ3Fa7uhrC/+7KnLr2SAzUFIMYcGr61tQNGz1JoCtMtNO//3GXs+hBrjdDczgpvTm5yL3TbSB6Z/KKzbmxvjb3iUO2pDQch55JmW/4FrNb3TERbRMvSUA01PWSjbs5Op7cMpcVg3tFs6FweKcF3u8n3GFMIy/ol71WvZZIXANoSIrioSBpyyGDudZ6H+udU1FdI8B1qSTyzuJiGgz7/+78qT6P0koCWv0My1vXToSPtlP3IXE9BkQBXcM15cewl+kq2Y6qCQ4B14x8WgOjsGL7NbZM/i6gK9jXOoXCO6Z5TVYqoc5LW6Y8+MPXhSzsiAsiG6/gzICLoRe8BzcPd5WOb/jqjSylGxs3x4TRTvEC9L8lEsLIjzhkCTLgGw31PtKL2iQQWFNqI/ceu6Uy6OzUbKWrLlWq/ydcvzGHgfBPTFMHKaOo7uP5HSimi3QL1JnBR9DJ8QaHiFgFgrTsF4DA/rD5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(44832011)(2616005)(38100700002)(186003)(66476007)(110136005)(66946007)(966005)(5660300002)(36756003)(8936002)(31696002)(8676002)(31686004)(316002)(6486002)(2906002)(86362001)(83380400001)(6666004)(53546011)(508600001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNva0JCQnk1MXRCbDVkTldVNXFFb2h5Z1VOVUpNK0ZZdlQ5dHZILy92N0pa?=
 =?utf-8?B?Mml3VzhNeU1yM3ByNUQwTlFnTE1wU0EwTTBzcFdXSVFmaytIc25BMkpXRXM3?=
 =?utf-8?B?NmZPWXNaMXpWWnAyUm1YRWt5NVp2c3VaQk8xZzFGVTcwMUYvWk5LK1V3bTBR?=
 =?utf-8?B?aG9pejA5RkRxclNRNjJiRm9udi9XUTRBZkd5ZGpEdXREbHJvYUg0amlKMit0?=
 =?utf-8?B?cFhMdWxBOUxTK09NU1hJbGljVWtkT0FRNXEySVBPMGdCZncyR3N0MEMwb0wx?=
 =?utf-8?B?MjVGYUpOb3E4aGNyZW52Z0xlclpyak5uc3loUUJJOEZPS0k1ZUNJRXNrcmUr?=
 =?utf-8?B?SXRLMmgxM3JZQkFEZHBEelNpckdMRVZXZWdrTEVmelpycmFPMzdSb29KQTRx?=
 =?utf-8?B?U2dLM1NKWVNBVUlQV0krekVyNk83SHQwa1RRYWlCZmxkVFlrcEt4M2RudEZq?=
 =?utf-8?B?U2J0ZDZKWnh4TVRwbExTY2RtTWJRUlB6U2EwY1JkaU5CSnFPSzZQNDVpZVJp?=
 =?utf-8?B?VWFtZSs4a1Rpb3dEQ2xrM1pEOVBUQWFkSG1mdzJDbWVyR2Z3Vy9kZWFkdjQv?=
 =?utf-8?B?WUsvMWhqclBjL2oxMk9hRWc2enVkVUk0b1BZRlVKRnNpUXp1NjFlcU5Dd2ZX?=
 =?utf-8?B?Q2srT0NYQ1cxMTVJTnZyYzdNQWFxckpwMUNEejMrR2pYYU5MVytkWmNWUUpx?=
 =?utf-8?B?MmpmTEtLa2JQWjBLQlJjek51VFBwaVNHUjFMYllOQUlBeVk1azZDWkwycks5?=
 =?utf-8?B?RFFiYkFTNmxaR1pzWGhPczlGT1ZuUHhpTk0vT2w1SURKWmRTTlk5dEt6VFgw?=
 =?utf-8?B?ZVRPQytRV0lXd3NpekxteDB0RmZhdnN0RG5MYmhOd3l4Nm5JZHpQTGJTbEJI?=
 =?utf-8?B?MFRXNlExOEp0bTQxUWRrSDY2TUp2OVlrUC9sbVR1NDBxR1dFMHJrUzk1T2s5?=
 =?utf-8?B?VHhRTjhwY3FrR3FqS3NHbEN0bW9LM2RkL2ZKOWxMK3diM1dYWE5UVWpLb2ph?=
 =?utf-8?B?cFpHTjRuM3dIdmN5SkVvK3FrZ2RGajhlM2VPUFZVRnUyV2VLVllvRjRzZVE2?=
 =?utf-8?B?SzA3b1BpK2RVT3Evb0crS3o4UEd4WndVU29VMGdXakdrWHVLbDlXTTUzT0NO?=
 =?utf-8?B?Z3hoN2JQZDl6QmRkUndsU01zNE5ZNUdYYjVlaVBBRTJrODlkTTBpeXg3Sjho?=
 =?utf-8?B?WVpZM0R2UGRWeittaDZlZmhXNmsySDgvaUlyKzJHUG1kVzlRSmEzL2UxV1gz?=
 =?utf-8?B?WElGbjFqRWtsTjBpRnh4ZEgxL3lhbWE0K1lJNDBqOVRrOVVaQnphdDM3M2JD?=
 =?utf-8?B?VkRCSEpxR0FCNUZtTThCVDlGbFFMYUNIMWFFeDlSTEVjSmphQVBBK0JRUFV1?=
 =?utf-8?B?d296ZXUxNnZCOXlhS01oUkl3OXJxSHNiWmFxcWl4b043ZEl5S2E0MTAwY3o5?=
 =?utf-8?B?Qkl1LzBEeVhHeFA4aDhjUXM4eXE0S3VqVzFzV3hJNUNhZ3ZwREtFVkZPaWQy?=
 =?utf-8?B?YlZPT24xZDVTRnJPTW5oSkJ0c0F0SEFDMHR5bjVOOTN5Z0N1amdrU2Ftdzky?=
 =?utf-8?B?NWVjUG5jL2dHWHlIdjB4SHpoQWkrdVpyclZiVy9ldi84UVFvSEVJVGkwZGh2?=
 =?utf-8?B?TVgwMTB2MUpFRWJXTE5TTU53SW1mcjNMc1JFZkh3YnFub3FGS2FDbXBpbDI4?=
 =?utf-8?B?bVU4SlRITU1XTm8wWk5lWEhNSVcvV3RxSmlLTDRlY1o4MFZQZTIzLzdQRFAr?=
 =?utf-8?B?NjFyLzJLaGs1V3RwdmYrTTZYSXhiVmkzVVlNeU1oK21Mb1ViZ1ZVZWZYdDd5?=
 =?utf-8?B?WjYxWFpqdUxwdENsc2lSd01ZNkZpc0xpRzh4Nk9ZRHdzWWNZdUpSZXZidEY0?=
 =?utf-8?Q?RZml5M6D8rCpU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14416920-938b-49c5-f552-08d9940066a2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 19:32:50.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
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

On 2021-10-04 4:14 a.m., Christian König wrote:

> The problem is a bit different.
>
> The callback is on the dependent fence, while we need to signal the 
> scheduler fence.
>
> Daniel is right that this needs an irq_work struct to handle this 
> properly.
>
> Christian.


So we had some discussions with Christian regarding irq_work and agreed 
I should look into doing it but stepping back for a sec -

Why we insist on calling the dma_fence_cb  with fence->lock locked ? Is 
it because of dma_fence_add_callback ?
Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only after 
that lock the fence->lock ? If so, can't we
move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section ? 
Because if in theory
we could call the cb with unlocked fence->lock (i.e. this kind of 
iteration 
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/gpu/drm/ttm/ttm_resource.c#L117)
we wouldn't have the lockdep splat. And in general, is it really
the correct approach to call a third party code from a call back with 
locked spinlock ? We don't know what the cb does inside
and I don't see any explicit restrictions in documentation of 
dma_fence_func_t what can and cannot be done there.

Andrey


>
> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>> From what I see here you supposed to have actual deadlock and not 
>> only warning, sched_fence->finished is  first signaled from within
>> hw fence done callback (drm_sched_job_done_cb) but then again from 
>> within it's own callback (drm_sched_entity_kill_jobs_cb) and so
>> looks like same fence  object is recursively signaled twice. This 
>> leads to attempt to lock fence->lock second time while it's already
>> locked. I don't see a need to call drm_sched_fence_finished from 
>> within drm_sched_entity_kill_jobs_cb as this callback already registered
>> on sched_fence->finished fence (entity->last_scheduled == 
>> s_fence->finished) and hence the signaling already took place.
>>
>> Andrey
>>
>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>> Hey, Andrey.
>>>
>>> while investigating some memory management problems I've got the 
>>> logdep splat below.
>>>
>>> Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), 
>>> can you investigate?
>>>
>>> Thanks,
>>> Christian.
>>>
>>> [11176.741052] ============================================
>>> [11176.741056] WARNING: possible recursive locking detected
>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>> [11176.741066] --------------------------------------------
>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>> dma_fence_signal+0x28/0x80
>>> [11176.741088]
>>>                but task is already holding lock:
>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>> dma_fence_signal+0x28/0x80
>>> [11176.741100]
>>>                other info that might help us debug this:
>>> [11176.741104]  Possible unsafe locking scenario:
>>>
>>> [11176.741108]        CPU0
>>> [11176.741110]        ----
>>> [11176.741113]   lock(&fence->lock);
>>> [11176.741118]   lock(&fence->lock);
>>> [11176.741122]
>>>                 *** DEADLOCK ***
>>>
>>> [11176.741125]  May be due to missing lock nesting notation
>>>
>>> [11176.741128] 2 locks held by swapper/12/0:
>>> [11176.741133]  #0: ffff9c339c30f768 
>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>> dma_fence_signal+0x28/0x80
>>> [11176.741151]
>>>                stack backtrace:
>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>> [11176.741160] Hardware name: System manufacturer System Product 
>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>> [11176.741165] Call Trace:
>>> [11176.741169]  <IRQ>
>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>> [11176.741181]  dump_stack+0x10/0x12
>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>> [11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>> [11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>> [11176.742408]  handle_irq_event+0x39/0x60
>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>> [11176.742426]  common_interrupt+0x80/0x90
>>> [11176.742431]  </IRQ>
>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff e8 
>>> 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 0f 1f 
>>> 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 
>>> 40 48 8d
>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>> 0000000000000000
>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>> ffffffff9efeed78
>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>> 0000000000000001
>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>> ffff9c3350b0e800
>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>> 0000000000000002
>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>> [11176.742500]  call_cpuidle+0x23/0x40
>>> [11176.742506]  do_idle+0x201/0x280
>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>> [11176.742517]  start_secondary+0x11f/0x160
>>> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>>>
>
