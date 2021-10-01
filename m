Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59041F0A8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3B16EE1B;
	Fri,  1 Oct 2021 15:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0926EE1A;
 Fri,  1 Oct 2021 15:10:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NePzygmLC9W0DdS0hr0kX7a6S31dJAGVuW6LjFJKzozIkf0A+v4Y2KWd5FNMcWTdVHdvsuRvcY5dkiV/jTY0nE+Xl+/ZmMVdSAuPJ/PrxPgkmfVXUUnXeDdom5GpQ9PxKewipUYzTBOM/54LoFzy1OwoWdQ0bKqmP7sjLR8eysJ+sXFMRIyW1CcNMH756qqtIENb1YEvEhG9e/kXoNMv25BqBpbXX51dy1XpBIgtZd2tTYWjGkAEh03ByHXwDFAX4zSad9rVdvCpSt/da/eEQmVkEzulmKeIfSUyaTmpxYEsPVS/CTNlfSfOli+m4OGNXZ5mB2tDkMFh6FeyzKxepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AylCdHRgp3w4iR5sDovUCW3lNRnvEtNy/AIM1/JIjVU=;
 b=SlsObDNDOBs3g09a+Hl4nvE9rkCdaXPwVrDQyNR4YMXF0k41biDoPbtqId6s9d4nrOxb4F41Egdh86+CBVPiy2xXiHy3zs1bpmjdIV3ZCObefv9rNggy1U5WThp03oNJ8sfwcHwCGU2ZIg7q6QEqbpm0h119KV1XamsGzd9N3A49K0yPHz8yInGgyyPAMe6ywIEf963GaLkfCffakAEwb7UzJqNZb/g5wP2P5f0pzM1Qtf9gRnXJxx7iRNwEtOAVM+y8T/m0b9hsmzj6FIZXlkVyIbJcakUYq+n/VnPbTv3kffiw1B9f7KyebYTkt5WgIdkNiCwqH30/6WJRp1rZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AylCdHRgp3w4iR5sDovUCW3lNRnvEtNy/AIM1/JIjVU=;
 b=fPAJvrQuPMFHazrDOhw9FO34a1YA8yO2AUYCCq3kAuUXxOscT6cTxrKCybE15uqN0/DqKut6BkTvb4BggmHXGVH5Z95s9FQz+WHmFdS8k/A1Q6ajjIdc0LJ0CKHdG/HbNhAE2ESKy1PEz22fU9aTKxqNh0G5RAo3HY7Re/VrvMQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3564.namprd12.prod.outlook.com (2603:10b6:5:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 15:10:16 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 15:10:16 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
Date: Fri, 1 Oct 2021 11:10:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:3ee6:5fc9:7b9f:84b9]
 (2607:fea8:3edf:49b0:3ee6:5fc9:7b9f:84b9) by
 YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 15:10:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 503b0386-7cda-42ea-5c0f-08d984ed9339
X-MS-TrafficTypeDiagnostic: DM6PR12MB3564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3564533CF003B42C0CA99611EAAB9@DM6PR12MB3564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7VX0/WieH5IZpTauUINP7yCEc09BXAC3gVzEKbfa5XJFPcR3r+uj7vVr2L0VItIawxi9xO8ySaGiR05p8+CJuNitJfjQKPMmo8Es1W7TJa5O33v0/+TT4BA0RWOOqHLokWDOcDIFffbga5oCbuKsHLJv+1DBhXpg/0qndmp8BEa6U+YlhAoG/fXjPX4jeNifdSJTcZP2uj7GJXkoY+XzA9E3XW9q7iKt0yNibSAdyfg+GxLyadPZ1Wj3NkDgApRJDSAOcSTMPaSPHQQvRWWakAA5P78SesasmK9WcZKlFXkBYTV/oyoriAtRElhzIYuzMU+AjvLgLBSoST5WJwjopHaU04DffoA0NrseC913SG+6Vy6eRY4YCTAcQzqp+opSSimFOm66RGU06qiRayvOfNqF/oF/JWULTOzv6jS7JtpHmAnxlAXTtoTAtiOJvZiU8eKjmpfs26tdxGz3Pcw4cn7JcaZ+gqKEdwzxZ7fH/CzDCAGBPU+Bn2mlVOx3Wy+AdPzBcVzfdwxCjhJLKzbXat7uJEIDhe0hsTFTuYblqKAZnnEJnIvhiztwLRS9CJA1zj2vGRMByeyfG8ig6eGUoX83JM1ZOl/nvgKWCYNzGC5F6MzjEvQjsufvL6NXlfYXKxpSKeMd72TYiYv7eO7J87IVTVz/+FaXZlWGigjg0hOiZ6hNSh5LLN71e9f7CQwN0H5LlTIS2MAWqofcFVtL5nxiwJ9kTBupMI1Y1ebbCbn3JiLuTSlXuR1U+OjehwSN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66574015)(5660300002)(450100002)(2616005)(38100700002)(316002)(83380400001)(86362001)(186003)(2906002)(6486002)(31696002)(44832011)(31686004)(53546011)(8676002)(8936002)(66556008)(66476007)(66946007)(508600001)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzRraFlPelMwSVNVRC9VUkxMMVJJMkZGTlFKLzhnSThkb2pPOGlhbHBsMURB?=
 =?utf-8?B?cXRiNDhWaUJXcHZaMFQ0UjY0SjJnQmJIblV5QnB6YUhTYWFUbnl2MkZ4UWV6?=
 =?utf-8?B?REp1cVBsN290eEJpekJKV2JNenc5VHNPZ0Z3N2RjTE9PTCs0bTRiWDc3WnVL?=
 =?utf-8?B?RHpnQ3o2cWUxQ0dueWxiV3dVUzAyNmdIQ2VySGk2WC8vV3FYNSttcTN2bURq?=
 =?utf-8?B?UnpFb3lDNVlmcEFJcVNLYTdSWXcwZHZmMnJVSXZmM0tGa3dCeEFPRW8wTTY1?=
 =?utf-8?B?UFZNWVpObm90anJIK2x4RjQ1MFNvUDNMZFFYaG40YjBLSlgydWJLNnFaRnBu?=
 =?utf-8?B?WXNwZ1puQ041MXphZVNVZVFLMTdvK0dDSXBxV1lQb2drcGZid0EveS94MndS?=
 =?utf-8?B?YnBWOXhqK05BQnRlZjlFTTV5WnNybU5mL1UyME9EYlFHNmN4WEcxRVVBRDFC?=
 =?utf-8?B?TDhmZ2dVQ3hyY3BiWW9kTVQ3eHNESWhyUC9LL3JPU0svTFc4RnhKT3o1THkx?=
 =?utf-8?B?VFhWUzhQYkJoblVtVFJkckNUUTV1Zk5maVZmYVVBdUNjK3VHOURTak1jV3Va?=
 =?utf-8?B?UGV5TUFJeHV0Y0ZUWG9EVEQvU21abGFFaTArTGtYMGFQRWtiTGNIME02Nnk2?=
 =?utf-8?B?NGlnK3Nud0Y5T2dEcnl3VGYvd0VGL3Y4M2hEMHRNTUlIMnhaS3Ayc3p0V2pr?=
 =?utf-8?B?QU15YjlibHc3L2lFc0IzSHM5QzFOL0xrQW55cGdGVDdpRkFpeXVEUWlaZ2xv?=
 =?utf-8?B?K2lRUTU3MDU1WkFXaGl4b3JWT3NpWnJPam01b3B3T3RvRm1QMEVjcmg2RmU2?=
 =?utf-8?B?ZVFGT2UySDUrZG1xMHBGZzdwcjNoRFNicWs5bVY5cmNYSUVPakE4ZUNOMm1W?=
 =?utf-8?B?U2hzV2J3em80Uis1OHR4Wjl2TG5najFhUEVOMzZGbmhHSVNIT0dxcUtJZ2RN?=
 =?utf-8?B?REdXaDJnMjRYVmlkNG03Q3FGTU4wTXBNTzRQenlGQmRSdTEzN3Z2TVpKTzd2?=
 =?utf-8?B?Q2ZvMVB2NGlrT3JLUXMxQW9NR3p4R3ExVEY0bnNMS3U5T1MzRUw3SEhLRWtt?=
 =?utf-8?B?ZTBUZ3F6UUZ2dVB0THhXZHU1b3QyNG5zREp3RWJGdFpEenNpQWRtY1Z4dUdB?=
 =?utf-8?B?Zmd4RDRnRkVsNEt5WE5BenN4RWNzZmgwdnkwL28yTjNDUDFIUE82ZFZJdEdj?=
 =?utf-8?B?SEtWc0Y1ZnBJY2E2QkJsRTZtSEZFcHVnTm84UFhKSUJ6M0k5by9rNVp4eldP?=
 =?utf-8?B?N1RLakJjaVJHNFJGZnd2b2RNZWpBbm5odWVOdEFNYXpyMHpadnlNbk42djFW?=
 =?utf-8?B?WU54aW5YZC9zeU56MDh5cW41bWtiOWtFQWwya0xacWVZR2w2ZmdKSEc4Zyts?=
 =?utf-8?B?VUFoY3lNVHczeHRlWnh5eWd4UG9OVDFlQ0RyRlRqaDlHVU9JTE5zbVJXNHdn?=
 =?utf-8?B?Vm9QMzZEaWt6Vk4rdHRCTmJWWnZMWkpuczlhSTFYZjNKeHBqSXVTZnVIQTh6?=
 =?utf-8?B?ZmxZNGdKekVnQUdQNTVidFo4TjNlc0orV0UrNDBsblhCWFk5NFUyU21ma2Nr?=
 =?utf-8?B?Rm9HSXk4L3RlSFc2WTErN0E2Y2U3TWJSOCt0czA3UE5vL1NtUy9QblpzUU5w?=
 =?utf-8?B?d2lDSXFBemVQWHNINW13ODJ1RjJiZUcwMGYxV2FHeXdXSjBlSC9sRVJKV2tn?=
 =?utf-8?B?bWhtaXlQZFo0UGpPR0V5ZUx1V2dEQ0taTmVWTHU5bFE4ZXVncXRMNFZPVERx?=
 =?utf-8?B?bFVZd0g3clA5M1JqbWh6bFltcytINkZMRkFRbnRsZkRXZER5Um14T1ZuMVpP?=
 =?utf-8?B?V1Rocjg2TVZqdDFPSCtENzJTUjJYUlVWWmFzRGk4TGR0bll3akF4RlN0N05Y?=
 =?utf-8?Q?5tRCGGV29L8Lt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503b0386-7cda-42ea-5c0f-08d984ed9339
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 15:10:16.4380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVC3Gdu0BM4GNK8bPoTHiQkdk7tzNoyiYXMblKOILjbT0yRXw9vNT/dZJuQ55aRfYIZWQfc5xsAuKoAL/qA/Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3564
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

 From what I see here you supposed to have actual deadlock and not only 
warning, sched_fence->finished is  first signaled from within
hw fence done callback (drm_sched_job_done_cb) but then again from 
within it's own callback (drm_sched_entity_kill_jobs_cb) and so
looks like same fence  object is recursively signaled twice. This leads 
to attempt to lock fence->lock second time while it's already
locked. I don't see a need to call drm_sched_fence_finished from within 
drm_sched_entity_kill_jobs_cb as this callback already registered
on sched_fence->finished fence (entity->last_scheduled == 
s_fence->finished) and hence the signaling already took place.

Andrey

On 2021-10-01 6:50 a.m., Christian König wrote:
> Hey, Andrey.
>
> while investigating some memory management problems I've got the 
> logdep splat below.
>
> Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), 
> can you investigate?
>
> Thanks,
> Christian.
>
> [11176.741052] ============================================
> [11176.741056] WARNING: possible recursive locking detected
> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
> [11176.741066] --------------------------------------------
> [11176.741070] swapper/12/0 is trying to acquire lock:
> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
> dma_fence_signal+0x28/0x80
> [11176.741088]
>                but task is already holding lock:
> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
> dma_fence_signal+0x28/0x80
> [11176.741100]
>                other info that might help us debug this:
> [11176.741104]  Possible unsafe locking scenario:
>
> [11176.741108]        CPU0
> [11176.741110]        ----
> [11176.741113]   lock(&fence->lock);
> [11176.741118]   lock(&fence->lock);
> [11176.741122]
>                 *** DEADLOCK ***
>
> [11176.741125]  May be due to missing lock nesting notation
>
> [11176.741128] 2 locks held by swapper/12/0:
> [11176.741133]  #0: ffff9c339c30f768 
> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
> dma_fence_signal+0x28/0x80
> [11176.741151]
>                stack backtrace:
> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
> 5.15.0-rc1-00031-g9d546d600800 #171
> [11176.741160] Hardware name: System manufacturer System Product 
> Name/PRIME X399-A, BIOS 0808 10/12/2018
> [11176.741165] Call Trace:
> [11176.741169]  <IRQ>
> [11176.741173]  dump_stack_lvl+0x5b/0x74
> [11176.741181]  dump_stack+0x10/0x12
> [11176.741186]  __lock_acquire.cold+0x208/0x2df
> [11176.741197]  lock_acquire+0xc6/0x2d0
> [11176.741204]  ? dma_fence_signal+0x28/0x80
> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
> [11176.741219]  ? dma_fence_signal+0x28/0x80
> [11176.741225]  dma_fence_signal+0x28/0x80
> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
> [11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
> [11176.741254]  dma_fence_signal+0x3b/0x80
> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
> [11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
> [11176.741290]  dma_fence_signal+0x3b/0x80
> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
> [11176.742402]  handle_irq_event_percpu+0x33/0x80
> [11176.742408]  handle_irq_event+0x39/0x60
> [11176.742414]  handle_edge_irq+0x93/0x1d0
> [11176.742419]  __common_interrupt+0x50/0xe0
> [11176.742426]  common_interrupt+0x80/0x90
> [11176.742431]  </IRQ>
> [11176.742436]  asm_common_interrupt+0x1e/0x40
> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff e8 
> 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 0f 1f 
> 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 40 
> 48 8d
> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
> 0000000000000000
> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> ffffffff9efeed78
> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
> 0000000000000001
> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
> ffff9c3350b0e800
> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
> 0000000000000002
> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
> [11176.742495]  cpuidle_enter+0x2e/0x40
> [11176.742500]  call_cpuidle+0x23/0x40
> [11176.742506]  do_idle+0x201/0x280
> [11176.742512]  cpu_startup_entry+0x20/0x30
> [11176.742517]  start_secondary+0x11f/0x160
> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>
