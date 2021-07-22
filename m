Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5133D22C8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA5E6EE43;
	Thu, 22 Jul 2021 11:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2044.outbound.protection.outlook.com [40.107.101.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7716EE43;
 Thu, 22 Jul 2021 11:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRyVwnk6mTREduU/hAkyMFrYIZkAPcUlA2/6B4iG+IscI4DHI50Y6Kqg8kd6yQq1F3LRnx6l1xKO7Tk3XCOetwt/fBTVXpQXF1QD3N2jVbZdP+oh4z1Gb4HPlVZAGpWuIKqFE7u29lZ5YEcaoyKlkEF/r6VmVmhaS+8bI7+dvFP6O5SQq2Y1fQaOdjNW/2FM4Hynykw2sa39UQqVBfF1HzIjS5BvjY3zlB7UbzDxklfGrseTNfo3Fa10KF5vlY3Hl72o26viHqaeoeiJ/5aYGd2KENCxqoeRBRiH71WAT9Ve9Hy8vAz0tu4tLtfebPLwHEDhatEaRJ1ftYw/mm36MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv3Oixu36v78xoFH1kWYWCLxZyQxgg3OvtcwE1rJpeo=;
 b=HWPHaOUidAJQ0PJMhT8w3vu+sv0Rt0U/ntozJGIeOhoiNQHwjU0FWmsudSxrvqyDPK3Uj8AYCwR2cEgk+043IQZX4u2SzAHY34lxmlgBLNff38Qu6plltTtbXMuXMeKhpLKx7EPuVt/aBwSTkXlqO0YcQirL+j/C8mJL8lOxUZ279BvP+iU21Xgpt/pHOeWeg5smQMkbay0jQMX6Ss2WDy7IE8/lKfi9w9vYZyfCa2mh8M/NYQqq6KdwIoFsdhYSYqIxV+2/U7eYURokJqx/2CeKWMX8OOmgXChS12qZoIM/kBkKF2ERe8MUf9tMhj+DFmZvHcgeETPE/DgywUD9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv3Oixu36v78xoFH1kWYWCLxZyQxgg3OvtcwE1rJpeo=;
 b=LCBB3RhvxH+LgnjdMSPoLv6D+SUkVNO8y3f+dJlR6+Z3jKd40a+l54eBZ1v3SVOp2k8hYByA+LoFHgffKQQkJIRZPb3l9q4PPv70P6hOhXYKMHBniHUe0LLgrDT8Zzhbg/+V5x3XwaMIDgQvSQiShmocuzEtFrQXjre0lryfgDs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Thu, 22 Jul
 2021 11:33:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:24 +0000
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
 <CAF6AEGtOW3EjZWo36ij8U1om=gAqvg8CSkJJq2GkyHFGWUH4kQ@mail.gmail.com>
 <CAKMK7uF1=Y6_9znGoWG8GrteXBBRmyW8C3bFE+eJQqOj0A1buA@mail.gmail.com>
 <CAF6AEGsOVPdMkXwU9C+nDfQpPThveJ2A0jbXi43RRkkJKtnz3w@mail.gmail.com>
 <CAKMK7uHMXFqic=9APJrSf6totB8nGZTDe4x8+sv-drmV4Q+4Bg@mail.gmail.com>
 <CAF6AEGsKoucxt4a2pcdQM9+L0+YU-6TcAt8eF=3ur169646Jhw@mail.gmail.com>
 <YPhvein5e8do2AR+@phenom.ffwll.local>
 <113b5858-9020-d1c1-292b-96b7f9cc717a@gmail.com>
 <YPk1izQFR+tRV8js@phenom.ffwll.local>
 <9c1e797b-8860-d1f5-e6f2-e06380ec9012@gmail.com>
 <YPlMpoGbXYKUFwCq@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ada9767a-5f7b-6e5a-8c08-ceee251c6fae@amd.com>
Date: Thu, 22 Jul 2021 13:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YPlMpoGbXYKUFwCq@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b706:b115:9c6f:aeee]
 (2a02:908:1252:fb60:b706:b115:9c6f:aeee) by
 FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.13 via Frontend Transport; Thu, 22 Jul 2021 11:33:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c814c36f-19ba-4729-48e3-08d94d048462
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577D1D5217FE74C3EAEB77C83E49@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCCGJYn1VBViSRj9NlJtr4jGBRs7vHybfF3I5ovbeV22P5oT1w87phSz0S7CHTXeUuj2xvIpOisBufZqIvtsaMA1roJZYqBAzgzrmr5AohGWYWuqDYB1YSwOP0xaWRvx7ISWJu3CNOX+Fd0GY7p/g6KSs8xor+AHxJqhnyk2j8FMkZAlHYUBBPCucrG2WgDSQcsXCDMAJ9G/QrE2HTepm5LAq4aI7dxVxjm2nYckpfp2JHOFMhd3MU0PHgRI2ZDn3Rn3YYTBpIMPRTqvBsnrIG2w48ktsjCr8BNBJGWLFr+8gg3afBM64xLSk5y4DoiNdbBLSBG9bxZWWr0svCRH17sdJNkSlmeKbNWkBysyZcSWL9Mz0tGWck6ocDx+pZec39TKPjkiwGq0xvnjhbLMysYtMHQxU/T/D9txYC4kIXgBeWD0/9jDC07RavORKwhrN3wTztuQ1MAbjZ6TBRUHWTUJPI3ubPux2nxSXl9M+Rq//q/wrUtUrElY2clrKXKKkePT4axkUVdJErrCtaZ+bYeYeidxZeC/AYAxPWavl171TV8IXbYkL6XH/S3ykhpF0vu2AKPrTFHKowec4l8TSWjS3d4k2WOSEVHIMpFjpMyVtlo7a5KA0yNICVfZn4PKocTm5xiEpEtysS2PYIH43HFho3eHySBCTmVsEetSKguFmpyRJkk7ajm/J+La0Llh/AGj/7toeRMl4JYeMwfJD0mymGc5G860w/y3Ath8cMK1QcRxkGKuUNS8v8x5Rv18
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(110136005)(5660300002)(316002)(31686004)(86362001)(31696002)(38100700002)(921005)(83380400001)(66476007)(66556008)(7416002)(6486002)(478600001)(8676002)(2906002)(2616005)(8936002)(36756003)(66574015)(66946007)(6666004)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU41N2lkNXVUdGEwSW5abGYzclVLb1JZc0JMWmQzeGhqZ2tjelhkamJ5RmV2?=
 =?utf-8?B?YVk2ZjNiN3pzUVlqNGFka1pXU2tZdXliazdCQlN2aW9PYmIrb01sUW1HenMz?=
 =?utf-8?B?R0JLZmU1eWRsWi9pa3NWRGVxaEZXbkJLakNMMWVxM01DRTZwKzJwYyt3SUVs?=
 =?utf-8?B?ZURzekVSb1V5cW5JMjRKV3J1SVVxeXVmOWJLVjJjUG50dG56bUltYk8wdVh1?=
 =?utf-8?B?d1o2VHUxaHRvYytjSFc5aTJBcjlmKy9LWVBZSG1yYk85Q05abDFQUHJBOGMw?=
 =?utf-8?B?YWVxZmVZZ212VGFBbzd6UGFsLzhnWE5KTm1BT0hYbmo2cC9yckNrRlVvdUNJ?=
 =?utf-8?B?dWpqcFk3em56aXM3dzJJbXB1V0QxOUxhSWdhNkc0eXZVNzdvUDM4VndsMHRl?=
 =?utf-8?B?MWJDMTEzcjFNOWtQZzBONDJ1RWEveTNtRTRxSHBXY3R4SlVyVlZpNEVQTjlX?=
 =?utf-8?B?UUpwS0p2MjhSOTF2RldDQ2gyNmlINGM0cjdJQURYeEpFUGV1bjZ1NWRBazBK?=
 =?utf-8?B?SDJUVElKaytuQkhjVVZ3YnUxWGFOMjhtTDh5NGNqYUloN09aZktmRWFRMmEv?=
 =?utf-8?B?dmVsTGVWa0Zsb0tLMVV1dEVHUzVzYnhNcE1iR2hpZWVIQnZQWWNOVUY5OS8z?=
 =?utf-8?B?MFUwSzM5N21lTVFadWFoZ1BvWHhESzU1VU5QSVJKeFI5MkZUOXJ2VXJVNFcy?=
 =?utf-8?B?WVBrZHFNUW9KMnBUYy8wK3ltR2ZpT091OGlad2p3bHpNU1ZzMVBWaDg4V1B4?=
 =?utf-8?B?Z2pWZFpOdDQyNTcvODJ5WTVnVitPZTR1akdPTmFzL2FSb002UWlBb0NpanZZ?=
 =?utf-8?B?aUxSTysxVVZnYzdaZlp5WmFFdSt2YUVLWDN5d083NFNOVnlyT2xQV3lHU1dU?=
 =?utf-8?B?MHljV1BmZE5tdk5HNlc0YzBWLzhVNVdVKzhaWlJkTTM4aVM0dXNYMkJtbUt6?=
 =?utf-8?B?ZEkwSzRDcm1tbCtRSG9WMkhqU3NvZjQ4SWhDTmhwRWNqcERBRVlzV0JTQkE2?=
 =?utf-8?B?U3ZiWU1Ydys1alRlZHBQZkVGS04vOWhlZlZzbGloSUZBZHBZTVZ2dWl1Y2o2?=
 =?utf-8?B?YlFUWlBmb3EybmwxSlhqTEJwNDhpNitwaG44cDc5QW9HdnBkcUk0ZVpZWVZp?=
 =?utf-8?B?ZUZuSTI2dGR3bjB4ZkFENERlLzc4VW5CSDBvdXJLOWlyMjNFQjhuSWxwZ3VG?=
 =?utf-8?B?YnBqL3VIcnhCRTZqS3FHWHF2L1JjcC9pSThzK0hoMW9HUVgvblNxWXVVNHRH?=
 =?utf-8?B?LzVSZ2s1alhQK1hlRHByaEphOFZnYXg5NG5MUjJ1SFNhRm9RSmQ3c1dsb1g5?=
 =?utf-8?B?UXVsdWkwclVTT3JsRGlOVFkxdkdUaEV0Z3VOdXJkVUpWQTBxRkw2TXNGeXNR?=
 =?utf-8?B?akwzeWVQYVJNZy85MEZvWUEvN1pzakdvcU5vdFNGbEw0YTVCK1FCdWt3L0k4?=
 =?utf-8?B?VzJVRmpleThHV0EwRExPQmVCdGpDb2hVQUtlN0VtQmtJVU82a1lRSXhrc3dF?=
 =?utf-8?B?RTZhOUtia1dtMmYySHlvYXNxOVo1alRyY1JVZlFRS1NDNkJCUXRPZStCTmpE?=
 =?utf-8?B?Y1crUjRGUUwrSXhSbHhFREpFR1p0NXNIWTVEVSsrV0todVJVdnN0VjhtNjdB?=
 =?utf-8?B?UHc2S3BFYzNjMmswdGRJRlRKUjJLZXZXb0xSZ0lIbmhva1JsWjl1MGNJbDhS?=
 =?utf-8?B?Q1BDK05kK0R6MG1KSE1FdnVlSWZYQnJyaVp1OVhMdnNFNStzeTlFbmZPaE9k?=
 =?utf-8?B?eGF1akdIQXRrTG9hbTFkQUJab2QrWkN0V1BuYXd4a29meG5rUnVCekVFeDNr?=
 =?utf-8?B?NVBlOFU4QlJKMEdvS09Fd3JBdjg0MVlFWTN1aGpkb2tNblpLY205OEV5VXZs?=
 =?utf-8?Q?olMUP1uphw0lQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c814c36f-19ba-4729-48e3-08d94d048462
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:33:24.7116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T+D1BPqFLivJ5P4B+xwBfk9x98vLh3QCr2/dNx8Z/VRDFsz4N/PAfxApD5bwAvN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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

Am 22.07.21 um 12:47 schrieb Daniel Vetter:
> On Thu, Jul 22, 2021 at 11:28:01AM +0200, Christian König wrote:
>> Am 22.07.21 um 11:08 schrieb Daniel Vetter:
>>> [SNIP]
>>>> As far as I know wake_up_state() tries to run the thread on the CPU it was
>>>> scheduled last, while wait_event_* makes the thread run on the CPU who
>>>> issues the wake by default.
>>>>
>>>> And yes I've also noticed this already and it was one of the reason why I
>>>> suggested to use a wait_queue instead of the hand wired dma_fence_wait
>>>> implementation.
>>> The first versions had used wait_queue, but iirc we had some issues with
>>> the callbacks and stuff and that was the reasons for hand-rolling. Or
>>> maybe it was the integration of the lockless fastpath for
>>> dma_fence_is_signalled().
>>>
>>>> [SNIP]
>>>> Well it would have been nicer if we used the existing infrastructure instead
>>>> of re-inventing stuff for dma_fence, but that chance is long gone.
>>>>
>>>> And you don't need a dma_fence_context base class, but rather just a flag in
>>>> the dma_fence_ops if you want to change the behavior.
>>> If there's something broken we should just fix it, not force everyone to
>>> set a random flag. dma_fence work like special wait_queues, so if we
>>> differ then we should go back to that.
>> Wait a second with that, this is not broken. It's just different behavior
>> and there are good arguments for both sides.
> Oh I know, but since dma_fence is meant to be a wait_queue with hw
> support, they really should work the same and have the same tuning.
>
>> If a wait is short you can have situations where you want to start the
>> thread on the original CPU.
>>      This is because you can assume that the caches on that CPU are still hot
>> and heating up the caches on the local CPU would take longer than an inter
>> CPU interrupt.
>>
>> But if the wait is long it makes more sense to run the thread on the CPU
>> where you noticed the wake up event.
>>      This is because you can assume that the caches are cold anyway and
>> starting the thread on the current CPU (most likely from an interrupt
>> handler) gives you the absolutely best latency.
>>      In other words you usually return from the interrupt handler and just
>> directly switch to the now running thread.
>>
>> I'm not sure if all drivers want the same behavior. Rob here seems to prefer
>> number 2, but we have used 1 for dma_fence for a rather long time now and it
>> could be that some people start to complain when we switch unconditionally.
> I think the defaults are different because usually if you wake up a wait
> queue, there's a 1:1 relationship between waker and waiter.
>
> Otoh if you just wake a thread it's probably some kinda of service thread,
> so N:1 relationship between waker and waiter. And in that case moving the
> waiter is a really bad idea.

Exactly that, yes.

> I think dma_fence is generally much closer to 1:1 (with the most common
> one irq handler -> scheduler thread for that engine), so having the "same
> cpu" wake behaviour really sounds like the right thing to do. And not
> anything that is specifically an issue with how qualcom gpus work, and
> hence should be msm specific.

That's the point I really can't judge. At least for AMD stuff we try 
very hard to avoid waiting for the GPU in the first place.

But yes it might indeed be better to do it like this, but to be honest 
no idea what functions should actually be used for this.

So feel free to investigate further how to improve this.

> If it turns out to be the wrong thing, well I guess we'll learn
> something. And then maybe we have a different version of dma_fence_wait.

Yeah, I would rather try to avoid that.

Christian.

> -Daniel

