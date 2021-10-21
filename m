Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D2435AF8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 08:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E876EB60;
	Thu, 21 Oct 2021 06:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2051.outbound.protection.outlook.com [40.107.101.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D7E6EB60;
 Thu, 21 Oct 2021 06:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lseNibFuK4Ne+q69fXIrNntJZ/8KIEZB0H3pfJu5Y4Wb3exacxfeNZJshmxTkIfedLvkiMuERWuzGkKTU+EnADXOEKXkir7Q/2QPki3Th3ArkcVBCyqzSg2J1C0XDLgYh2a70HimULyIhJQNgwln6PFiKYepN5zxkoX7SCkZA3PY2LpYytd8+ZO4dPgMZOhI4POBGZs0s/tDwRvr680kx249aOY8u7LGRuXOO/HKOjik/VJ4xqPlVOKkXDEU3TDwpfijDMrviglIXUIf3zJb4x7aVf/O7lteWv8d35y+agat7/XKTPrUdJck3gPs0Q3P/KgDv1lcWdpNZNBERHtupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV/cK8qVf0q9PhWg8PIshASO8OEfPxiYhpjJfWTE4yQ=;
 b=QXHk6YFqbkGAu9hvzd/ld6PNiMIIaTFnWCjPvKJyQKt2qBdVbwir59d3E/0z8KScEMCJ0Q6/bZimimMmAAMeKamKbCSpkD9GdHYLYLgszHSSkfPKA1x+OoClUJbxh4cvtlU2rk5JDuwXLNNSZ9I6Vo8eaj3KD+34HA0WjFPQYqjhyxvR5BIfrK8VmFXXA7AY+b0iZdklSrGnm5POrI0N/q1kMSoP939y1XeRMwIDZj0NwoGHac3BACCmXh5IkAy3Br2pU2o4/66L/uM0lAXa81dNW6+PxVFbMQ3mphZN9nFFfT7M+ufypVltuHPua52+fce01dPorEOXqlMANl0/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pV/cK8qVf0q9PhWg8PIshASO8OEfPxiYhpjJfWTE4yQ=;
 b=WslvJu6VtV/mFS3Yr63uT8gsnxavvH2LgGF2Db8SemmX1eJSwIrVh7VucvXOYl3x8+WOPJgeEvqeEwoBDNeU8B09CT/mDjS04dCfv7B1/o/PmQuOEpZ1xdjAGhlhqjUUs6+rYjmllFIOsMlSUu3gnsdY1OVTF3GH5jnAYTCIiPU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1215.namprd12.prod.outlook.com
 (2603:10b6:300:d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 21 Oct
 2021 06:35:05 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.019; Thu, 21 Oct
 2021 06:35:05 +0000
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
Date: Thu, 21 Oct 2021 08:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:46a4:dec3:9292:691a]
 (2a02:908:1252:fb60:46a4:dec3:9292:691a) by
 AS9PR06CA0140.eurprd06.prod.outlook.com (2603:10a6:20b:467::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 06:35:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c6a3adc-cb97-46b6-86e8-08d9945ceae5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1215:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1215F129B10816E5B34BCCA783BF9@MWHPR12MB1215.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/Nt/WY7ZXzh6D6/QQvgn8fsBn3K3l+/C67A9tegFdlwWWNPQUModq919lk7tXJBleGZ90MeeF8vNv4Gcm2n9wUcxrq8UEigZDEi1WcHsbZvAVy1+0h/eu61rsuTKmWhzErn8PmJERW9qFCnKp8RmFLrGO37gNOSvqF0fuIzDr/STRVNsNBOazPMsKfD17I+WBrzzIttIHhbudQv/Mk3yyWrsloqQrZxJ93r4R5aQbBTrHraFQg4Po1MFt5UHBAQyXatjqaMyn6/bPfyj0e+UrMu9E8LQnD+Z/FizjKwaH6L6vKh4UOA9/04gvXrsEqchtmyVbp1n7I1gUSoHolURLJa7zrZJzT6aHEURxqM07/1R92RRA7ZWLN/OScI7klVMxj+uKZPR+P6g1TTbqVJE/0KffaAECOV69wXHzkXJwuBGFoYBEObGHf7vO9sertLNBnEqH4tQozhvS5hT5omMCPVhIlU3i1DHwzIgaryQAn1ordb9OR/HRiZaIfId5GpRMKc4oTnNT7L3ADRSuB0SFzZj0iZI1nF9VO58qcBBNQYfd2xzQf/1GG4WOVIRwhS8Co3tQOoZ13xgmV7lE/Uwa1c1GUK/qRVNbrcuAIZVbVdintcgUXtCKEcV5ilKXhGqWNCoULa9ysVSA8b44Ac1jSoCYJq62sZA2v9KMXn4yH6qVpZSmcKMVpIQGvsjerIGSUMUhXlVUO7XM4bdkYzYdypq+jAzrWFF4Bq+y9m55/A2thF5wtjRqGJg0GnH7ZfcRxT3u/eoI81IB5T0cLhL+EHSnj0CNjtYtGiyln17VeBZNMUo54TiB+1SnVW4AcI81fOlv2K/DoDcJHSWehz7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(2906002)(6666004)(186003)(31696002)(8936002)(66574015)(8676002)(110136005)(6486002)(66946007)(31686004)(53546011)(66476007)(66556008)(966005)(38100700002)(2616005)(36756003)(83380400001)(86362001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE1xZndCL3NxRUNzOWxXWXEzaHZtUzZ4WTJOVW9Ucnh5bllaNGZuakhyV1lW?=
 =?utf-8?B?cVNpSFJjdTlJdGFxR3BHR2YxYVJSa1NOVnNtMFgyZWYrbkJaNUJxZ3llYTY1?=
 =?utf-8?B?VEM4TU5lZGtsZDF1bHNoaTZ1WDU4TW55ems2WjJiOFZ0Y1EwM2hxUG94MUZG?=
 =?utf-8?B?bTJFSG1wVmYremNxa1dycUZHOU9nU1FzYVMxaGNqRHdGdGJjQWhRM2E1SWND?=
 =?utf-8?B?eWJWWGtoUkRrdnpvZlAzcEp1UmR3bWFCeklJRTBCbVZ3eHpCN0tTemIyc29o?=
 =?utf-8?B?SlI2WUxNcUlIVk5DY0xHbExZSkhxeE1mU21Kd1BPbHM4NG5hUEQ5UEltODlv?=
 =?utf-8?B?RW5udkpFSTZWQXRQKy9WRGhjUWR6eUJYOCttVEZNdWFGTWs0V1FUSFJKdjNG?=
 =?utf-8?B?ZFdVZXdLam00TC9rTG5rWWNheWR0YlZaSVlxN2ZMVXdDSXNEQnNrRWNlbk5H?=
 =?utf-8?B?bFBucTJ2dGFzb2xnT3AzdkJNb21SeVkyWisyRnAwbkxYMFd0L1VKaTgxNENl?=
 =?utf-8?B?UkRvRlFiT2cwVFY1MDlPRkRxaGVvVEgvaXExUllZcW1MR21pd093bTZXZmxv?=
 =?utf-8?B?VWkzTHBOZXhTV1c4bkZ6SERhSzZ0aTBKam04VG9ISGtqcUxxYkdWOVBHbU9T?=
 =?utf-8?B?dXRzR0FsQVJWL3lldXJYMGN1TUdEWlhYOE9FU1hSVk9xbllLTWdoSUVmUDlo?=
 =?utf-8?B?cGJIZzVWMFVaTjYvTFVqTTR0SXYwcmJhUEl3R1c5TzluTzZMYjZWbExYdUx3?=
 =?utf-8?B?TndwTEd3VjBFYVdSTDFlN1NzTUg0V2JpcG5JbEJzajdWcXJSdTFXNWNScGk0?=
 =?utf-8?B?RzNDSU5lRXVoWkFKVlA3STFtOFd5Sm90U3Fmb2Z2UUlTYkVLQ0l1MHBsZXpn?=
 =?utf-8?B?U01mcmE0ODl3eDhyaGt5ZUxHakkrUWE4ZEZJeFpKeEVwbnBDT0s0WUE4OUha?=
 =?utf-8?B?aEN4SGtrRmlsUnZzdVVVSU5wVDRNUlBIOEREbUdZeFhnelJXNU1KdDhNOC9Z?=
 =?utf-8?B?dTRPbkxwRkxCcmNJZU03WE1FWlhhUHFEUjcwSytzbmgraE51TExwcm5TeHRi?=
 =?utf-8?B?T3l0RlVaMmc0RVd6cVhGalp6VzVoWVRhSHFic2RZb21OQ1BzYTlGVGtjVzg5?=
 =?utf-8?B?TnUwc25LallscjhrMGorT25ra2srQXFwRjR2VlYyaGxqTmV4ZUdFMGxlRjFC?=
 =?utf-8?B?YmFtMXowSDlkWElYUFpWeW1MdnV6Rkh0cFIyMjlKZVVsWU5sOUxWa1JQVlR2?=
 =?utf-8?B?VllBYzJMNlF2OU9Ray9SNlR2dW40RGdRNGx1eVJuNCtQSzNLVld3TlRoS2Ew?=
 =?utf-8?B?TEhISFFjUHlNM2VnUjZWVFU4ZEk4Tlc0emxMOS9hSmNkUlh1SVNwbnl1WjFG?=
 =?utf-8?B?UW11c1psc29EaW9ydkxhc0M3R0lvS0ZqelNZYzZYN0ppRjlweUwxTWZ3cWI0?=
 =?utf-8?B?cUJ0dVZtcjZ6VDNRbDZKMW1rR3NPb0hSMmQ4TnJXY09kSlJxd2VqZVNUMVJ6?=
 =?utf-8?B?MFh2RjVucUVtUU8yQStnU092bUFXMUxURGIzU3RPMVpML2t1L05HRGVqMy81?=
 =?utf-8?B?V3M4d3d4bm0wVnhzOGgxV0ZBbWYxR0dIVGhjTzNtQnU3VjZCREMrVHloMVU4?=
 =?utf-8?B?NXVUcVVBbDJnQlg2SllVWGRUYzhaNFQ1Umw0Vnpvckl3Rjk1VHVtZmRraUty?=
 =?utf-8?B?czlMV29zV0MvYlA4U1FmL3pOZFBGbFVndFFiemlLRHNGYmdDMXdhVmN4UjdR?=
 =?utf-8?B?UFZHR1R0cUxLb1JZRGExZ3Rhc1g0M2luRnZPSlFpRi9KYVY4NEhES2ZMMktv?=
 =?utf-8?B?ZGdoeGNBbTh5WTVuVG1ObGthOW9mZjVEQTJRYlZiVEVMWU82Zlora2FkZTBX?=
 =?utf-8?Q?qCmzSu+B5BcO4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6a3adc-cb97-46b6-86e8-08d9945ceae5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 06:35:05.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1215
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



Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
> On 2021-10-04 4:14 a.m., Christian König wrote:
>
>> The problem is a bit different.
>>
>> The callback is on the dependent fence, while we need to signal the 
>> scheduler fence.
>>
>> Daniel is right that this needs an irq_work struct to handle this 
>> properly.
>>
>> Christian.
>
>
> So we had some discussions with Christian regarding irq_work and 
> agreed I should look into doing it but stepping back for a sec -
>
> Why we insist on calling the dma_fence_cb  with fence->lock locked ? 
> Is it because of dma_fence_add_callback ?
> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only after 
> that lock the fence->lock ? If so, can't we
> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section ? 
> Because if in theory
> we could call the cb with unlocked fence->lock (i.e. this kind of 
> iteration 
> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/gpu/drm/ttm/ttm_resource.c#L117)
> we wouldn't have the lockdep splat. And in general, is it really
> the correct approach to call a third party code from a call back with 
> locked spinlock ? We don't know what the cb does inside
> and I don't see any explicit restrictions in documentation of 
> dma_fence_func_t what can and cannot be done there.

Yeah, that's exactly what I meant with using the irq_work directly in 
the fence code.

The problem is dma_fence_signal_locked() which is used by quite a number 
of drivers to signal the fence while holding the lock.

Otherwise we could indeed simplify the fence handling a lot.

Christian.

>
> Andrey
>
>
>>
>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>> From what I see here you supposed to have actual deadlock and not 
>>> only warning, sched_fence->finished is  first signaled from within
>>> hw fence done callback (drm_sched_job_done_cb) but then again from 
>>> within it's own callback (drm_sched_entity_kill_jobs_cb) and so
>>> looks like same fence  object is recursively signaled twice. This 
>>> leads to attempt to lock fence->lock second time while it's already
>>> locked. I don't see a need to call drm_sched_fence_finished from 
>>> within drm_sched_entity_kill_jobs_cb as this callback already 
>>> registered
>>> on sched_fence->finished fence (entity->last_scheduled == 
>>> s_fence->finished) and hence the signaling already took place.
>>>
>>> Andrey
>>>
>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>> Hey, Andrey.
>>>>
>>>> while investigating some memory management problems I've got the 
>>>> logdep splat below.
>>>>
>>>> Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), 
>>>> can you investigate?
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> [11176.741052] ============================================
>>>> [11176.741056] WARNING: possible recursive locking detected
>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>> [11176.741066] --------------------------------------------
>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>> dma_fence_signal+0x28/0x80
>>>> [11176.741088]
>>>>                but task is already holding lock:
>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>> dma_fence_signal+0x28/0x80
>>>> [11176.741100]
>>>>                other info that might help us debug this:
>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>
>>>> [11176.741108]        CPU0
>>>> [11176.741110]        ----
>>>> [11176.741113]   lock(&fence->lock);
>>>> [11176.741118]   lock(&fence->lock);
>>>> [11176.741122]
>>>>                 *** DEADLOCK ***
>>>>
>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>
>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, 
>>>> at: dma_fence_signal+0x28/0x80
>>>> [11176.741151]
>>>>                stack backtrace:
>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>> [11176.741160] Hardware name: System manufacturer System Product 
>>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>> [11176.741165] Call Trace:
>>>> [11176.741169]  <IRQ>
>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>> [11176.741181]  dump_stack+0x10/0x12
>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>>> [11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>> [11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>> [11176.742431]  </IRQ>
>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff 
>>>> e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 
>>>> 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 
>>>> 8d 14 40 48 8d
>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>>> 0000000000000000
>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>>> ffffffff9efeed78
>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>>> 0000000000000001
>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>>> ffff9c3350b0e800
>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>>> 0000000000000002
>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>> [11176.742506]  do_idle+0x201/0x280
>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>>>>
>>

