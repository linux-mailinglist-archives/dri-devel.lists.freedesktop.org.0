Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0944212A0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 17:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C4E6EA25;
	Mon,  4 Oct 2021 15:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFD46EA25;
 Mon,  4 Oct 2021 15:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9QnJe1pZBdfI76D5G1n/0XNSmCXgtojqyWecmuKKFz8Go2fpzhBeo6tmtHfiyShiJHYgbD0IPgpEGyH14kj3TNXQ9IJFsjdLcH2L33ooBt7PvKLChAH4vK3Ccjwwtj2PJUrH8LZKI/GlrFmbwmmae3l54cLls6XwBVEDdlRu5Q7ifmGBSQd7+Ski0tfpJ7iTcSOidN1rWRMEW37Q6PhinX7E++QPvYq3kf+GQ44xbXEgRMHnqHLLW/TkxxHhcSVFlmCQThXj+cvsjU07BAGUfnApqHus/tm4GKnIui1s+VCfFkBwAa+ro7n7zJwF4oNvOoA+paH2pFu4abB/SjWjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pppmBjIrgcfim7viWeF35IW4/FuOQts6CdmkYNbchNs=;
 b=d2WXiaUq3L1eh8Hs3AC2U8wI/5QCNqVouim62GtUipi3oMi2G0zao4V/6LKWtctr8qKghXT5R8Ivnp0DJrhMlpGdd+4UBZXeVyJTqadQNFZSpZMeD0GaaIjf/78IKxx3gDdpM9QKF3fxIzg/rjwsSRk5HNEp7QEsuWNORmqBgARKkV/z7C40qA1tQH2xlOR2g+FG+EJWAEFDlWlXkZHmaoNEEBmDg1CVYeQGNDY1/kpxypLRFDmuj7Kb4tlAkUnM+LslLEA9y59cQa77Vr3ynVXVZ8TBtpLk3kGjGcXPALnJzD0gLQb4i6qKmNy7M98F2FNUta5IUxFk4pXwyoetRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pppmBjIrgcfim7viWeF35IW4/FuOQts6CdmkYNbchNs=;
 b=avUm3/QhqLhM74IeXfvZK0BaYbGKz9n+dcAYUXAzfCg2op5BIoGMp9qbz8CjPz/lnrwzWfkAPNTq919hDqzowpKHhdpUIZy1x1gVZhj9AVFVEsPFLjaHL+dwBwjJKhp3AVKrnj7xe4wfdFhMIvkufugUGB3EJi9zCbTfph/SzSo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3482.namprd12.prod.outlook.com (2603:10b6:5:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 15:27:20 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 15:27:20 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d4b3524e-719b-ca68-bcf3-f3574922be01@amd.com>
Date: Mon, 4 Oct 2021 11:27:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::25) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:bc6f:8108:e4c4:3301]
 (2607:fea8:3edf:49b0:bc6f:8108:e4c4:3301) by
 YTOPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Mon, 4 Oct 2021 15:27:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9154a2db-9d18-4949-a290-08d9874b7481
X-MS-TrafficTypeDiagnostic: DM6PR12MB3482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3482A230C7FC37B1FABE2487EAAE9@DM6PR12MB3482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HO9+cR8BDlf1vh/PdEjSUqrJufg67Jic97DoEUhWFWx7VBO1RbV/NxUK653bMwkXq7pgmK71KqMPdw1VakRjbB/wrW0YYuiEyxiGx+YdsixSSlrYwjrgQlEfPpVLBYSqmkESMYkhVXTGvOhoGc7C0yMeqY9MIAYXLBwEAophu1yR2xOipVb/yS06j5fdSHPnaywwYdhOl3XespMx3qcsHmx4QrYzziSrFAWZtu9jj6YFn4Dx1T4qFrZdNzQi6y8jTb+NB8kGldYi0NQQKiWHhHhiNkxxnxXJkpexOyIXqAU+Sfbf8XqGxDfeKbz9wMGjVCkLeLgjv8bRHEjE/Y+CXxSWKy5flHDVUQKl511oRV8Fy0UBWsn5ZaZANOoS6cCGB8ErR0x/DBrCKolxXn2pyZShUrgndGmVCT1IdGMhjwBC627akawE/J2W6k5Txi/hqLOpjbvlAAXg0hEpkkH9qSTP+hEfM3DjkQjtlyJBJXbT/+t+CvMAkM4Q20A5JrOM/cG7zzyz4e1cd6IXpU/Ob7xa/de4gzXxSmkGh+5qJJXvoLiv6FRvA5H8QRsNEUJJby3phmZeHZmVxPP5Jq6s7blinI/9jd4iKaC1dhEVCMglCh78kqB0VlR7QLXFI1sJJWXBa0B1iZNXNj4mOaehjw8BfYRuglEtgMC4SS0TciHlZ0hjeWjvfug4rsBonq6UcchgS+wSGiVVIMZejZGc7zmrhh6ejNebqQIO8mNI4ng8iFWWvWL6FIeZpe82x98q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(110136005)(66946007)(316002)(31686004)(66556008)(31696002)(53546011)(86362001)(508600001)(66476007)(2616005)(8936002)(8676002)(5660300002)(186003)(36756003)(66574015)(83380400001)(2906002)(38100700002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2NGQW1LMllnOW54SjlYWmw2Z3Jqa3NVUlJzVmNtaEZQNHpLQ2ppWU9SbFo3?=
 =?utf-8?B?ankySlB6YnRFYUd6TnBzQWF4QmhsRVNBQTNFQnlpNmNMc3kyaGhUNW0wVjhH?=
 =?utf-8?B?V0taSTFmNDB1RjBPdEsxWXpUbFZXVk81dG1qNHJWWVB0em5pL2dQRkc0Uld6?=
 =?utf-8?B?QjgvWWRnUk15WTZJNFI4Y2crY3RuUUtqMC9NaUcrdjBZZTNwT1ZMZmR6SDNl?=
 =?utf-8?B?dDBqVnpJUTJxR2huWlBHcE5VMFhwZEhWUy9JUDNSNkFOclJvSnZkcVZCZ0Q3?=
 =?utf-8?B?aUZlc2o1cndNMjFlemF0RjRhR0s4dkdXb0hsWEI1QnJDR3k3V2hCRjBmMTFU?=
 =?utf-8?B?UUNQWmNMV0M2VWR3MUlKN3E2V2R6OW9DdzFFc1Y0dnU4YjhlR0JQdkRBemxi?=
 =?utf-8?B?Rjd2S3czODVTTUdEQnppMlg2K2RMSVZZTHY3aDhRMWY0OGM4M2pWdFBQM29m?=
 =?utf-8?B?VW53amdxOS8zMEptK0hZQnQ1MlY0SlNiblIzZW5oaVV5eUlLYzdNQ3dDNDVE?=
 =?utf-8?B?TlZja1g4L2liaWZKMndpbnZ5UHZLeE0xQ3BwODhyalZNNGZWNFVwWGUrL2do?=
 =?utf-8?B?RXJwY3R4LzNWL3BXZ1d5OUk5a1dzMStXcVNnSUpzbjRVRlhvVVZWT2hUK0Mw?=
 =?utf-8?B?c1hWQ095dTZ5UmxTajdwbU8vaS94c0x6cERNY1FZOFNkcE9OZ0V5OXIzQm1X?=
 =?utf-8?B?NlBoNUliMDlWYk1QVVFISGpxbTZOUGVXT3dtTWNPNDVyS1d5VFFKbVNOMlZN?=
 =?utf-8?B?d3dVZEpZWEVWUW4rT09wUnpTZ3N1MzBVU3g1UXhSc2F5QmdtZkFUWExTVmNO?=
 =?utf-8?B?bHlrMHVydGdzY0djWGFFUUo3UEtMZENuaVF6SzhnS0ZDVlpUMEQ2cDlPUTlo?=
 =?utf-8?B?cmlaZTlETTZhMmZCamZSa2tneUVkTUlrWHNDeDlvSldhNEMrcXdDb3QwMVZL?=
 =?utf-8?B?UGUyekkyS0NwclNjZmRGbU53QlFwZXlUMmZYOXVyUmdCdTc4bURGQ08xM202?=
 =?utf-8?B?QmwvRGV0b1FnaGhteWxaYVZRQWhiOTQyVUZ2WVAvWVdLVzJYWFJPVGtBaUlX?=
 =?utf-8?B?UVdnd1RaMHNrZEl3ZHdOb0xuT08vdVBpUW9YK1MvdWh6QmFueFVvZjNMdWEx?=
 =?utf-8?B?Vzc5SjJYVmdWNHV3KytNNktvMmt6Tk1wTUFDbURkK3RxUVk4TE1YZ2J4dzBD?=
 =?utf-8?B?SEwraXVYUU5WUURsSzNDUk9uamJ4NUhhc0gvRU0yTVYrYnlLY1I2SWJBQmEv?=
 =?utf-8?B?T1N1cWNDTW05TEhIOUUzZHlpd21mamo3aXJ1dDZOcGJiLzM3SWM4VU5DWG1z?=
 =?utf-8?B?aDhhd2FUMVdRdzc5c1BTSjVWalQrU3EwUzYwY2hzSnd4d1UzSG0wejZYbDlI?=
 =?utf-8?B?RGhQYUhoV1FJZVRBWnU3SlJUR1dhVXRXZHBsZVpQcXRrWGJnTGt6SnlLYzZD?=
 =?utf-8?B?WS9jVHM1SEdSM2pqdGtHODhJVENnUXN3SWMvd3Z0VVFLdktUREtQMm4vRUpE?=
 =?utf-8?B?R1FYQVAxdHR4SG9Cd2hQV09WbDEzRnh4d0dNMGJTVE1hUnFmVXpzUzZTckhG?=
 =?utf-8?B?Z0FGREgvSUhpU0xMWHlpTWlMbERoTUt5bURoOTU5L1ZlQ0RwOWs1OXI4elc2?=
 =?utf-8?B?YTJaaE1EWFFxRTdvWDdnYVVGVm4xK1BnR1JWU0gvSWpjUGQyU0FEQWxrTzJu?=
 =?utf-8?B?YkM2UWExN3VISXhqeUYrTHNUcURQV1hjcElralEzdTVLSkpxYWJMS05QRGlv?=
 =?utf-8?B?R0IrbUo1bG84anY0dVVCK0ZxWTNzMmwvWGNOWjZHZU5MTnhsdXp5TDQvM3pG?=
 =?utf-8?B?TmE5MWtmOU5JWGFrQVpEWHl3V2kwb2FaSmFrTThJMk83dDRvZ0NEaDB2bGQ4?=
 =?utf-8?Q?k4KExFDRHEPvb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9154a2db-9d18-4949-a290-08d9874b7481
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:27:19.8784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PReMlSLyiyiALaEKgPtsG3nCGyRC7LYtwEhuts96/oeZWF5Ffynd5JEF74L2o82ADZ57sDiUdTAs7ZUAzMl5Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3482
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

I see my confusion, we hang all unsubmitted jobs on the last submitted 
to HW job.
Yea, in this case indeed rescheduling to a different thread context will 
avoid the splat but
the schedule work cannot be done for each dependency signalling but 
rather they way we do
for ttm_bo_delayed_delete with a list of dependencies to signal. 
Otherwise some of the schedule
work will be drop because previous invocation is still pending execution.

Andrey

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
