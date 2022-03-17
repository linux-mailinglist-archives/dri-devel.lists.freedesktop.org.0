Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB14DCF07
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 20:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DB910E748;
	Thu, 17 Mar 2022 19:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A9E10E748;
 Thu, 17 Mar 2022 19:50:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3Afoxo1YOKz01ctC1a5S6QtcpoL25heEET4QpHSoo1xmwacRT+vIdfBS8mnujjK72UKmSMwXJcBkC/W9MCY+kUwAv/uXEnprOUM/xW7A75m2UiCwEKNwqbXN+dMKpQIP4pEGjOz5WHy1yzZ34FWqEItvzU6ULS+CxxTDBVBp2cUCIlnFZ4YdRZ+A3dwYpfmRZmqFztKbuoN/cqBy01GL3tTEkT+MBuyuLhjV2fu5R2y1TLq4xAyKIzzRsnr7wLLK6O8An9LC6HpblbmKYdqE/PrmOzCzr6/vZeYOG3Of2nzracpVySItoqH4RyIaWKh1qxbBj/8BDJAQSkhoZiRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9roZaGd+6eXXJiA1nRj0/UXxo0OUmhwh0KBVmdEHawQ=;
 b=P5Md1fWH55cwgiDz8b84ZXAUo6NRIfAKwbL/fYNDjGX5fTI5P60oDU4j//s1Au84h7VpWX3EVYTvsI4poVU/2pbm9lu2vXXaXzQUH0LFneWJGKnlYq9iOSj6clsKLJus28HwBZTZDQvjDPrb1vfJd2LsJMGkeYpdtkL0N0IqAG+vdSMA9l38QOHlhCb6yLX2Z9OQuDE5h363phtG3N/SCW60ZSfocDgeCCzNRG/IkVB9Ts1/aRnDMDG10uB/sYczBbuMRyvPPSv1vUmOCASS5Sx0pWmEOVaYd8fhMG8p0K6w0c3bnjTnlr2CsWbj5hUZyUdVHywE8yoQofYcL1/l3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9roZaGd+6eXXJiA1nRj0/UXxo0OUmhwh0KBVmdEHawQ=;
 b=T8GpQyG+OP/GcG5oJF9ZoBXyO75S7wo5YZLdMzJ1L+JljMZFmYfk3ePK0+OX8gYyC+4WYEDh9nsKBT9YRo/LCRE+CR7A6m1ciUdUq/Qm5XFMS2/SbeQTmZDzkj9sLjZmmymAC1GsETXWD83feRB2PmEPhKSecYlZ7X5GCBCf360=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH2PR12MB3672.namprd12.prod.outlook.com (2603:10b6:610:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Thu, 17 Mar
 2022 19:50:02 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 19:50:02 +0000
Message-ID: <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
Date: Thu, 17 Mar 2022 15:49:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::14) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38c0d6c8-5696-472c-8f56-08da084f5335
X-MS-TrafficTypeDiagnostic: CH2PR12MB3672:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB36721A7ED8606C71B0C83050EA129@CH2PR12MB3672.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lb3DqgYi7axWPI2yVlIuGZS7fQse9Ei9jm8oD6A1ijQHL1my/gqNsr6KFSdvx+3Apj2FJdGbzrowth8cfpzGjmprJJI/JzoBDv5TXCGeB14sdRM6XFW7fLZ5WgRAWi8Y+Fd2C2mAIpJ8diK4L42dFvWReusN6VpvBWE6wbDL0PKFR9LqhV3dgsi/VJfjKp+GAtKRxcesFyG+CkPiw+u9ShA2hmMKkAuQtgRTAiFij038FuwVBGosqce3B5lM3i9VPvJacHsN3k45mVH9ZbuQn7Q4O3d0Zskz9bDAiKbXbRWldgpviX+1JEyuvENnuu7ZRW5mNzHeyviWwqstHueCeNNc0LLWEgXUo8UxxaC6IaPg275XxmfV85FEEals/DLD75REZLt/8ptvFTe0JCj8jixd9SpqqxAZYJTYOmxLwc/t+FDwy56Ewau7o3V0XlXOFa0CTE6eMfvfquW01aCjsk8rq4c+wfrujxKjT7CoGzNBP0STNfIZKnQiWpStD1gjwLO8vB+CbVAnNDmV34gKZQxBdFUxN87j2c1aqydMd90S7n39jKJnwjE2/QMetrNm8kUYATu4KFttw+DJtX0ODU9REHgWR/CbpFE514gOKUoEPCvwq9ikb0ab+pMt3+MI3IptHN2D3VpQTHVB+8TLXQijV3YLduM7zEEl8FuAp1rBMdshLNTeIsXZcnLst7iXcpFWwQGO3dbv9AnHn0Uml9+AEch++AsooxOOebQsdWk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6666004)(38100700002)(86362001)(66556008)(66476007)(66946007)(31696002)(54906003)(316002)(6916009)(8676002)(186003)(4326008)(2616005)(6512007)(53546011)(6506007)(83380400001)(66574015)(31686004)(2906002)(36756003)(15650500001)(8936002)(44832011)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGx0dUprNUZsNkJoMEFmL3JuTUxTYUJIQ0hHNXk5Y0lpampNSXk4VkN3RnM3?=
 =?utf-8?B?d3FKaytGeENYSVJwRzk2MFZqMU53MG01UmZHVGZzaFhiZE9BU2hQektWVTdH?=
 =?utf-8?B?WGx0SEczOUJjNEV4Mi9Wb3lOTkxXRkZ5T2tCMnRlK2I2Rm0rQ2hiNDR2cVFO?=
 =?utf-8?B?UjlFTVE5azhleVZONWFSTDkwL1hqUnhpN2p6V1YwN1BIajE0d2FmQmVDcW9u?=
 =?utf-8?B?V2RqNnNNNlBha2xkQW5lSWIrMTJEZXhFcnJraUZ3QlYrSlBJVXhvdE5VT3R0?=
 =?utf-8?B?T1dXd2RPZ2dVU1owaW50blhUSUcrYWhaWFEya3FaNHBVd3lEVGtycHZ2cVlZ?=
 =?utf-8?B?NXJaUEcrcjlxajVYTU1mZTl4TXpWTnJJTmlGcWt4VXJaZUVhOWYvaDdlWjEy?=
 =?utf-8?B?cGNYMlRlV2JEbHc0MWtYVUhSMnhLeERUZ0kvUWhHTjFUcU83WGszMWNJMS9z?=
 =?utf-8?B?M2JRRzNNOWljOHhTTGdDOFg1TEhCeXZDR1N0a0VyOFJRdnk1SGprUXlIMWdZ?=
 =?utf-8?B?dlFvNDc5UEROZVdpWUEwTCthS21nM2pQUEFiUGgrc09MRGFIa0E4dmlqaTg5?=
 =?utf-8?B?SER2NnVGbEp6bURrcklPY0ZsODV1QTZkM3E2YXZIakR4eWdyV0d6SVhySnR0?=
 =?utf-8?B?K0ZZSEFUc1RDMjI1SkpRZDBTbUpmUExwRnhRVGNJQzdRWWdCQ01sbHJsbk9t?=
 =?utf-8?B?VTZNd1lLeEh0ZXZ4UElWOTNVTzBKSE13aDYzdEJKYmFMa2hRZEU0WHRSMEVh?=
 =?utf-8?B?Qk9YdmhGMG90UTdOUDFOSytuTXpqdUthbFJPMzBlcnJTb0YrZDk0RWhOTElH?=
 =?utf-8?B?d09GN2czRi9Hc3B3d05qeGNFanBMYTQwK1BPU1hzL3NPNUk2ZXRzWkQ4TFR4?=
 =?utf-8?B?NUFEZmIrNUJMR0ptNnc0ckxUWVdqWE5BT2YrOVpRQmpEa3hFVWtJNVVxODdT?=
 =?utf-8?B?ZVNUV1RpRTdDYTUwU1VacjJpWmpVRWR1Uk5DZ3pQUTJtaVdQUnNwMXU0YWNB?=
 =?utf-8?B?N2s0Nkc1U2ZMZ1ZqV2NtMWpXMVNMT0g2bmpYZERJTWFKOE1LV1N4VmM2OFVs?=
 =?utf-8?B?NXJNMWRIM2hLRDlIc1p1dkxKbGt6NjBmT2tGUjNYWmlKZ2U0T1hGYjYxM1dW?=
 =?utf-8?B?b01EVmhmSFdBYjNqK0dRT0FUOTNMOXg5RlRBTC9JS0gweEd6djdJVFB2NUEv?=
 =?utf-8?B?bTdDNGVtSzdHTTdDY3J5SWp6Mm8rWDgvdUVETFBMci9sQTNrMDBiYjJFUVFW?=
 =?utf-8?B?R2NBUU54M2VpSmlUSm84aUhmNCtqZTBPU0krcDNOcVJiQ2lSTi9COXFMVjhT?=
 =?utf-8?B?MDg5d0dkU1lUWERGNEQydWZvQXVpR3Z6RXZLekpYRDJKT2dSVXlIZW1UV2dB?=
 =?utf-8?B?aEQwVUErOUFSWkhXclQzOGVqYXVRbm53bDBxbnAyS2pFVFF4a2FFcEZRL2VT?=
 =?utf-8?B?MU81SnRBZDl0OVVrUzJQZ3BtWFV0cTcySDZNMXJmQk03V2ROd1ZyVk5qUnl5?=
 =?utf-8?B?WEpOZjUrU0hHL3FvVVpaY2swSHNkbVVPaUVyakZiUG5mVFBSY0NjblJGRXhM?=
 =?utf-8?B?SHpydEM4SENDOTVyS2l1VHVkU0lMcW4wS1I4TUs5QVpIMVA4TlNZc1VuUzhY?=
 =?utf-8?B?ellQRnhweXAzVWhxeGRCaElTckoydzBuQndwemtVdzlFY05VdFhsQXBYT0R2?=
 =?utf-8?B?TXV5MGwyblFqZ1V3UFJXSjZ2SE9hUTk5TlI2dnFyVnZHK1B5ZGVvbzAzTnNT?=
 =?utf-8?B?OE04cEl4MnlZdnNpZmppWXNXcGoxT1VlZGJkVWIvb2Vla3F6ZTREcFpGdkFh?=
 =?utf-8?B?T0JuWlp6RzJLNnZlcmFNa2ZhL1hUcFJwVlRVYXFkZVk0cmE1OGNycXVQaVkv?=
 =?utf-8?B?a2MxUzZhUkQrZWZqcy9VdTlHTWdza1FmbE5FWDRZU3NudXZkRTkySTBzbDJW?=
 =?utf-8?B?anRaajFneDZKeW1jWm1mUW5JekJZOSttNnRDTC9QTkFYeUwwT09vYnlnRUpj?=
 =?utf-8?B?VUFEYUZpd2pjMmFKTDBpbkJmUFRiNDB1ekFzUHFwUmxvNEpTRnZNRXp2RDhU?=
 =?utf-8?Q?SAbMsO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c0d6c8-5696-472c-8f56-08da084f5335
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 19:50:02.0460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05YQz4WMJY6tKFRpw89ZEX15kZHIlz8eNVNN7oxJN4ngjv1vv4egyL0ThrXhn0PIhxZU5pLdYUgtLmcbzEC27A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3672
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-17 14:25, Rob Clark wrote:
> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2022-03-17 13:35, Rob Clark wrote:
>>> On Thu, Mar 17, 2022 at 9:45 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>>>>>> [SNIP]
>>>>>>> userspace frozen != kthread frozen .. that is what this patch is
>>>>>>> trying to address, so we aren't racing between shutting down the hw
>>>>>>> and the scheduler shoveling more jobs at us.
>>>>>> Well exactly that's the problem. The scheduler is supposed to shoveling
>>>>>> more jobs at us until it is empty.
>>>>>>
>>>>>> Thinking more about it we will then keep some dma_fence instance
>>>>>> unsignaled and that is and extremely bad idea since it can lead to
>>>>>> deadlocks during suspend.
>>>>> Hmm, perhaps that is true if you need to migrate things out of vram?
>>>>> It is at least not a problem when vram is not involved.
>>>> No, it's much wider than that.
>>>>
>>>> See what can happen is that the memory management shrinkers want to wait
>>>> for a dma_fence during suspend.
>>> we don't wait on fences in shrinker, only purging or evicting things
>>> that are already ready.  Actually, waiting on fences in shrinker path
>>> sounds like a pretty bad idea.
>>>
>>>> And if you stop the scheduler they will just wait forever.
>>>>
>>>> What you need to do instead is to drain the scheduler, e.g. call
>>>> drm_sched_entity_flush() with a proper timeout for each entity you have
>>>> created.
>>> yeah, it would work to drain the scheduler.. I guess that might be the
>>> more portable approach as far as generic solution for suspend.
>>>
>>> BR,
>>> -R
>>
>> I am not sure how this drains the scheduler ? Suppose we done the
>> waiting in drm_sched_entity_flush,
>> what prevents someone to push right away another job into the same
>> entity's queue  right after that ?
>> Shouldn't we first disable further pushing of jobs into entity before we
>> wait for  sched->job_scheduled ?
>>
> In the system suspend path, userspace processes will have already been
> frozen, so there should be no way to push more jobs to the scheduler,
> unless they are pushed from the kernel itself.


It was my suspicion but I wasn't sure about it.


> We don't do that in
> drm/msm, but maybe you need to to move things btwn vram and system
> memory?


Exactly, that was my main concern - if we use this method we have to use 
it in a point in
suspend sequence when all the in kernel job submissions activity already 
suspended

> But even in that case, if the # of jobs you push is bounded I
> guess that is ok?

Submissions to scheduler entities are using unbounded queue, the bounded 
part is when
you extract next job from entity to submit to HW ring and it rejects if 
submission limit reached (drm_sched_ready)

In general - It looks to me at least that what we what we want her is 
more of a drain operation then flush (i.e.
we first want to disable any further job submission to entity's queue 
and then flush all in flight ones). As example
for this i was looking at  flush_workqueue vs. drain_workqueue

Andrey


>
> BR,
> -R
