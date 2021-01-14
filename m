Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446472F621D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 14:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77996E32A;
	Thu, 14 Jan 2021 13:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DFD6E32A;
 Thu, 14 Jan 2021 13:37:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh7r/NNe3UYqqyoqhN9UPjk0kQDGkNC+vuv8WBffZACFwnzBKsDndXg9VL0OenMdC5Bxk5XzNWFlo72EZeVJSDg9fVJciPNyGuPnyVHQUWZhxB3qsqPC/ctYjjWK6uwV9frU4NCmer7CC0pBcb+loawR3YNDC7Oplvj8khkm2ZFcfieU+XZKFDS6Ly1pl7uH0sJmw/zjWSNYMvrQz2rRD78Rdc/5cr4TyC1mxGb68zxM8jAUZ1WTtTd1LlIILcAKEcSwlVBH2/RF/4jPSWQl6nbkWD7LyduMv9v6ZJVRMEuJSs2ekxu6zuu/o7PHfRd+21UipQi7cxMGppSbY2m02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3+IGxNeO46jDRgHCunvTtk78iSO+Od2BjvWioOb6Gs=;
 b=G9pjc9togiw29a1cVqr+KxEJLC+kQEXV/WzazHd7erQShsiqT8G/LttHiKcb3mlxqPEubSUYnPt218DJQF2DiscJ5+tt1ax1l/+tndW4mBG+hC7bjwcCN+xxagSBFKHl8nq6QIY66JOLRP+FBgkyVFQ+UM3xGEsTUxwT6K0mF6uBoF8wQwr+uvtsl2Hd3QbAOIlRBaPiQIV0pcvbLBWrXHzWO5ZVywd1lzJsDwjbued4bHbAGJITdenXVLzBbEaK9S7JkTxZcbgfPFF7pcLjLhlOg4ryHoclZmUspwUdcD9a2x/tw8qqsbGlydIkhD+/TUNO8ahLCGTIO12X2aSaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3+IGxNeO46jDRgHCunvTtk78iSO+Od2BjvWioOb6Gs=;
 b=QkL5q0AZ0LedVktmsw27JJCmsnPBv8/bUH5o6/6srtY8dhd2DWi1cFcYDOzW+YHNBY1Y+gCpJRmlk3spaXo2cCLtKma9EdNwTXBEPBUIHm9ZvokvrTcm8lmmI/R7LyrXN2Q1TzbFaWSXeraleCzGFOC0ZDx3lVMpR+2i8peMRNc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4740.namprd12.prod.outlook.com (2603:10b6:208:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 13:37:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 13:37:42 +0000
Subject: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory manager to
 KFD)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local> <20210113165646.GB521755@redhat.com>
 <c1ecb381-20cc-850b-4491-99c6b413f7df@gmail.com>
 <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
Date: Thu, 14 Jan 2021 14:37:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.4 via Frontend Transport; Thu, 14 Jan 2021 13:37:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89e9badd-9029-42f4-d380-08d8b89191c3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4740:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4740CEC3075F2EA968B9E28C83A80@BL0PR12MB4740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HxqB0AmUbzIa0Sr5drpEAYUIyajWV0qVTOubLqK9CQddRPyQk1mk7pH5kQFcjBFX0tGC2XwRtYbHNxoduiwqmJHCQUNCM6pvZEBmrNVtCBLDZMaA4/hDbcZnpRQEiwf4E6u5JyVy1lkYIJn5543E71lVYtbKnFn9Ull5u7aK+jdE543Nbdd2Umeo3c2h7M3sPoOazzX+fGPkk4PrP69OUhlrNosxDigyGDYHtztDIxPlC9eQlvmYApnxheOW00Wahk2Vzu7fA239gk+zOL5dNJ44DASitoFuSDLLdZLDnZU3HNQ5DjvDrRKDPnsEnAMkf3vhEz6SoVMoW0OBQUJNXJ9wVg6YInZW8jz9Eno4Jq0H18vxhMY/1Hpt8z1K4OP9GuYNYQynMHaSJLAIa+VBgKaLxeSEQ8XKL80ZPf3R5VyqC2rSXk8D0uHfwaZUO+Fkeq+z/TB+XIqn9UMS/g277kEv4/2fYD3T3yirevFsT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(2616005)(186003)(16526019)(31686004)(4326008)(5660300002)(8936002)(6916009)(6666004)(36756003)(83380400001)(54906003)(66946007)(8676002)(2906002)(6486002)(31696002)(478600001)(316002)(52116002)(66476007)(66556008)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZmRoTXJBMUpNdHpzY0hMQUNBQlI1ekFxcHd2OWMzRlRUa3BtUyt2UmZWMW4x?=
 =?utf-8?B?bTIyU1grWVV6TzNsTkV6VWZEaHdIMDE0UUFwK1FCQXV1cUhWQjVmVUZsOXk3?=
 =?utf-8?B?YnRWRGtaeitWRWljcXplTkVRd3pOb1RmNmNLQlY3OEowdC8yT3NWN2s0SW5Q?=
 =?utf-8?B?RDh3dEhtTjdETTlmejNNTlhFOTNhQ1JqWjcwd1MzZzRwR3IxVk1uUjM1ekhT?=
 =?utf-8?B?U21GakltRjB4MzR3TU83a1F2b3dVQmV6azZva3cwSmRXaFY0bkRGL1JMdmJi?=
 =?utf-8?B?Vkc0c2g0UnNGdkZocFBtN21MQ0gyZHVQZ283THlrTm9PY3czcWcxVXlwYTVB?=
 =?utf-8?B?QnIwRDNNUjhXN2hCeWZHQU5QWTJtVWIyMWR0M0szcDVWMDRHd0xocWkxMmM5?=
 =?utf-8?B?MS9CbVdtRTNKeTE1SFh0MVMvalhTeklTTkZrOERsNlVtZ0FZNnVVVGVCWUpr?=
 =?utf-8?B?YTNPNGNCT0REUU1DbTJiZzFxcGVHbURMQlVxeitqcVRaS3htajZhbEc1bk9i?=
 =?utf-8?B?OVc3SmlBVE55Y3QvS1JpdVQwU0pQNENXUUQraU5pZzVud2lkcU9SSVZTZ1dX?=
 =?utf-8?B?QlFUS3QyOGM3ckNZRHlsZFNYOGpHb3RRTUExcGJnYkIvMkdUYUNTTjljeklk?=
 =?utf-8?B?b3pweW15VFJRalNiQkJNRjZLcHlHOUpXanpBV2JqWEpwODBnaEJDZEp1TzJn?=
 =?utf-8?B?RDlGZVQ4WFVTN1laOEV2MjFZeDlkcS9Jb0g4M0FrYWJ4ZWhjbG9iNkFTZlhi?=
 =?utf-8?B?UkNxZHZ5V1ZMSk5URHNHTCtvR0Jyd1VPeEpwL2xwTjFKcVhnOUkzSnFPTDRC?=
 =?utf-8?B?UXVibGpuWlpuanNjZTZzaC9KMHhTZitTZ1JVamc5M3dhdDI0SXI4Tk5EdXc3?=
 =?utf-8?B?Z0lQSC9VSnB6eHlzNmxBUW9QMU1TZUF6amEwdU5RVWpnK3ZLR0dEbVFMU1pj?=
 =?utf-8?B?RVZTa3ZBbHc5bG1MMFZmYkhNZUZEc1RTU2FDaGZpYWErRGVHNlJkTUU2Nmg3?=
 =?utf-8?B?ZFJTSk13NkV3QVhLbU8yTmFUVTZXeXpnanpNRFE4bUlESWdGWEdHNG85dVFP?=
 =?utf-8?B?TStIa1psVzByM2JHSENJQUYyOHFnSFlYZk1kSSsrTElCRUNmOXVYMVZHNGFH?=
 =?utf-8?B?UGdBMGdDR0ppdGZXdWNDMUFzMjZWNThMck9OYmp4UkM5Ym1VLzdpREExR2lP?=
 =?utf-8?B?Y1FUUHFGb0N6RjVnNWRJeUdybkNzUW4yYUFkZXdmODNQZzlpTkpwMFUrRVMw?=
 =?utf-8?B?c0JLNDArNnpvNXZ6cVMrYmpDUzErVjVLNjAyUjk3bGpxTDg3NlhOUXU5cC9E?=
 =?utf-8?B?UHc2TGFiV1hrMnNVT2ordGxXK0JmMk0xY0oxUVI1QXFaMnNnbXZIb0ljclo1?=
 =?utf-8?B?N1h5WjRnZVY4U1hycGdrN0txc3ZKcllGeG0wV0VpcC9HbjBOK0ZTVmUzekVC?=
 =?utf-8?Q?JlszziEj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 13:37:42.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e9badd-9029-42f4-d380-08d8b89191c3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki2+vpaCKsS4540sA+aM3kjwAqrZ541uTAWffXxxjP2bhdLba7RMVV5kdYvVf/kS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4740
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.01.21 um 12:52 schrieb Daniel Vetter:
> [SNIP]
>>> I had a new idea, i wanted to think more about it but have not yet,
>>> anyway here it is. Adding a new callback to dma fence which ask the
>>> question can it dead lock ? Any time a GPU driver has pending page
>>> fault (ie something calling into the mm) it answer yes, otherwise
>>> no. The GPU shrinker would ask the question before waiting on any
>>> dma-fence and back of if it gets yes. Shrinker can still try many
>>> dma buf object for which it does not get a yes on associated fence.
>>>
>>> This does not solve the mmu notifier case, for this you would just
>>> invalidate the gem userptr object (with a flag but not releasing the
>>> page refcount) but you would not wait for the GPU (ie no dma fence
>>> wait in that code path anymore). The userptr API never really made
>>> the contract that it will always be in sync with the mm view of the
>>> world so if different page get remapped to same virtual address
>>> while GPU is still working with the old pages it should not be an
>>> issue (it would not be in our usage of userptr for compositor and
>>> what not).
>> The current working idea in my mind goes into a similar direction.
>>
>> But instead of a callback I'm adding a complete new class of HMM fences.
>>
>> Waiting in the MMU notfier, scheduler, TTM etc etc is only allowed for
>> the dma_fences and HMM fences are ignored in container objects.
>>
>> When you handle an implicit or explicit synchronization request from
>> userspace you need to block for HMM fences to complete before taking any
>> resource locks.
> Isnt' that what I call gang scheduling? I.e. you either run in HMM
> mode, or in legacy fencing mode (whether implicit or explicit doesn't
> really matter I think). By forcing that split we avoid the problem,
> but it means occasionally full stalls on mixed workloads.
>
> But that's not what Jerome wants (afaiui at least), I think his idea
> is to track the reverse dependencies of all the fences floating
> around, and then skip evicting an object if you have to wait for any
> fence that is problematic for the current calling context. And I don't
> think that's very feasible in practice.
>
> So what kind of hmm fences do you have in mind here?

It's a bit more relaxed than your gang schedule.

See the requirements are as follow:

1. dma_fences never depend on hmm_fences.
2. hmm_fences can never preempt dma_fences.
3. dma_fences must be able to preempt hmm_fences or we always reserve 
enough hardware resources (CUs) to guarantee forward progress of dma_fences.

Critical sections are MMU notifiers, page faults, GPU schedulers and 
dma_reservation object locks.

4. It is valid to wait for a dma_fences in critical sections.
5. It is not valid to wait for hmm_fences in critical sections.

Fence creation either happens during command submission or by adding 
something like a barrier or signal command to your userspace queue.

6. If we have an hmm_fence as implicit or explicit dependency for 
creating a dma_fence we must wait for that before taking any locks or 
reserving resources.
7. If we have a dma_fence as implicit or explicit dependency for 
creating an hmm_fence we can wait later on. So busy waiting or special 
WAIT hardware commands are valid.

This prevents hard cuts, e.g. can mix hmm_fences and dma_fences at the 
same time on the hardware.

In other words we can have a high priority gfx queue running jobs based 
on dma_fences and a low priority compute queue running jobs based on 
hmm_fences.

Only when we switch from hmm_fence to dma_fence we need to block the 
submission until all the necessary resources (both memory as well as 
CUs) are available.

This is somewhat an extension to your gang submit idea.

Regards,
Christian.

> -Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
