Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A385D5A12B2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF6F10E215;
	Thu, 25 Aug 2022 13:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CC010E1B5;
 Thu, 25 Aug 2022 13:49:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8JDb3NA4IkPCaIkmt/IPeyEL9lXLXgFQ+DHWh26k1QT20jxcprn4LE6HyVeW4fr5nnzz2Fo3ZFIHZvQrjrWgt76H4dPijCEefFFCiWFkwTtK8gjKoFeV+2O9zkn/E1Hqdud9DO9bbTs8y1lc4D9Zkfn0Tly0HAgyx9MZSZto5pNjFPWXtqU+OofrPlxXW1VkRdlqTl/wkLiuR3EGx0KWaII6xmytXXwfzaww3jFWvSMMGaiWgSnrX46ytCPX1pWwCay+29qNW2cj5gosBQRNMlLSlwfp0l2zFYfKeaYbJ5fqwQNfFb3kVdQiOEZ6kngAZ9nBiEhrZ9uHboSpvVhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NO0smogvilTTq+2gABNBFnTTD+oX6ljW1KYXLlpDWg=;
 b=CNb3rlzw5K4wkroWwLMrVBEwIVDYx78hpPcxGWR5RkGaibO1dgb/cFfnUztBseCOb35djCy0XLDzsB0yfPPUJ9MBrc1U4OSALyecwq4QExGMzgIBRTkbP62IqajRI33hkdGCb7gIdYcy5tBXhvhRKcjSIKrSydiVGBRf3Xg3XMmZtx0BwadQ1ZPI/akUm9UCHq2g5VY9GMKY9YlkC/Ax1qXAin4wjMJmJlaZLjhTlGNXAqO1MBFi7HQFDJOjacEJhXDpzJhgP4GT6aV1J8Bh9UQ4AdkO2mByEFz4PaAluaMUc34mK//wOw/vBzhm8icyTp3sm4W+Thh84QRN3UrzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NO0smogvilTTq+2gABNBFnTTD+oX6ljW1KYXLlpDWg=;
 b=cDqce5aigV9Lc2iBaTtAMBkW5yfwShqg6t9bqzAPCUfz2RsHWjue7Dr85dH4NO8hp0D8uzXw1s6vh5NCicQIecOoqL7s7zIbRQL5QSGfRyUP4HJCmmfKdnKAcv8k1vLZG4aZDoBp3QWW2lVOd+50nNp2EwZ5COlZ3W8Mueca+Zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3737.namprd12.prod.outlook.com (2603:10b6:5:1c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 13:49:31 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 13:49:31 +0000
Message-ID: <7643c805-6b75-6306-27e6-c2b76c0e1c76@amd.com>
Date: Thu, 25 Aug 2022 09:49:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
 <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
 <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
 <3adcc1ce-434b-3e2e-8748-697addcb7aa3@amd.com>
 <34ea8549-f459-2074-2bd7-945601f5ef9b@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <34ea8549-f459-2074-2bd7-945601f5ef9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::17) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a38544-180e-4c56-9fe4-08da86a0a2a2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3737:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoWNaRrLnBOyBwWWYGtbb4hvBUjD7I1GXQK8nPw0wK2HdZ+HVOV2cFPZ8A0M7u9menYsDC5I+XGgqGnzG0olWFO9nLnOwemuFQQfNJ2loOrH2x5p1nU4/JDu92U5O/b04mVkyV9TPseU/lWS4zulGPsa2nQvA01szxTJT1CYSxqUDTKgm07fkP3fOoqM0M1P2YVxy92Sho/EI/iOiWOTQnmmuIXL4YxHa+ie3UhsttQ3sNN3SM9eK6QZqiABivlyaQJn1e3Oau5aTN3fyGdMyyG6L4+PWoM5PMnr6q3PaYhz12TUW8rcF0qW9cTbj9FAueOqGSsUpuO4CDzh05inuP6XufeltSXZgWuHa7TPG3WOQv7GdToZegVYgm2Ps6MdN2SFoCFsaxA3cUw7N7cAjBnIBi3pLFufl78ZvHhJvuqfYA5uluBI9yuck+0uhjLMTMnk8oZkU/hQRfn5PkV93Kk1NyP/ie+2tKUmtfRnz1/c8FTgX789y1zVPrfTziWhNeu0s+su/XhaUdTdsxX3lV6RDyml7o4x16lhgNwK+2AEn+CUEmyGc0wJVipciz28kCJEpxEMOw9H+F7MV7KhEe1GIvl+dFaYXH6SYHUD6h26pqOOtSQzPyGVeY+EcCGBYu97Yr0T6BDAu5b69mtLzvRJo4+nz2Nj9iRiicOU+9ZRX1y+s3cr71F5GdXoXQtOEg+K2hLxuXDkFDVMtXX3bTG3tnlZoMp154HNdBp7hpANgu18JMVRw+IjSYO6YPWQgU3leZ3jQZRcIcw0zhTbL1NvVLlvS8F3+qP8kjGT8jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(6506007)(6512007)(41300700001)(53546011)(6666004)(31696002)(36756003)(86362001)(31686004)(2616005)(186003)(6486002)(478600001)(66556008)(8676002)(66946007)(4326008)(83380400001)(66476007)(316002)(38100700002)(44832011)(8936002)(30864003)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1ZSWmRDTTZJSWN4YTh0NDdLZmZ2WUNjdmYzQzl2YnpYbTVOczFsY3Z0Yjg4?=
 =?utf-8?B?WHFFVGRKNTRBQnQ5ZEROeC9CeWQvb3dZTkd5cWhIaEpwVDBwUzdQU0MzMGlX?=
 =?utf-8?B?YjZpZS9Wc05xRXAwVlBzYk02a2p2QzlOWHFVQnc0OGFRK01ybzd2TU1KNVdx?=
 =?utf-8?B?TnZ5ckFZSEt2bDBMa1hwbFphLy9XMUJNaURoajdSRlliTFFoaEFxZ0VZdGFS?=
 =?utf-8?B?WUNCTWNKc0l5VEhOOFJvRmkxMGd4QWN5alNVVytvUDVBYUkyc3FIYURSNmFy?=
 =?utf-8?B?cmpvUXpDQmU3NjRQRGdpS2pYOUh2L3RTL1loZ3hkcS9GcjlNTmFZTVdnRmRV?=
 =?utf-8?B?ZFpKOUlLRVNocGlHMHdPRWp1K29pemJaYUh4UkJWTWV0c2N1b00yUnJNeHNp?=
 =?utf-8?B?OFFLVUFjT1AzMzFicnVMMHNJTTdnSHNHV3FITUdZS2xNWEtLM25ULzRLVGIx?=
 =?utf-8?B?cjlGdmY4ME5CVGlMd3pzRkVhbXVST2NBT2dWQzZadXltbmJVbFkzWmNBWGlS?=
 =?utf-8?B?TGpNNFd4ekRvL0tHZHYybFpQK2dSbzQ4ODZqSFRBTVFDRXZ6a3J6TVJ4dTg0?=
 =?utf-8?B?NDZmQXd2am1ZZzkrTEpycWxYUVRsMVhCSEtkMzR1QU8zR05Cai9xOHJrUWR1?=
 =?utf-8?B?RGNPaC9xU0pOdVRueWVGQkY3RXVLK1ZvTjFCWXZXUElNWEJzRmhJN2Mvb1Y2?=
 =?utf-8?B?ZmVlSXpUQk13T0hZRSttMTFMdXlsbkw2cEFVSERqb2IrSitHUnBkSXhUYXVD?=
 =?utf-8?B?S3FvVjgyQmJ6SjJBNlk4OTg0VmFXd3BHZ1laV0JrM0R3emJmSC83S2pvaG9N?=
 =?utf-8?B?QmFZZ2pHNlU2KzJyTVBtdW9hTGdxSE41MmllTnVVanJiRWlqUjUwaE5xWWlO?=
 =?utf-8?B?amtOY2Vpckc1cFdzMHR4eithalV3T1J0NW5Nc2NIOFV2cnNDSnlXZldXVjBk?=
 =?utf-8?B?RWVySTdoaGFESzE0bVNOU2JjWmMyMGU1RmFhaXdPazdaZlVqRW1rVWFsRHJ6?=
 =?utf-8?B?TS92THd1blQ4UjF0QytGNkFtZlo0V2wzeUpYQzZDT3pLalVJLzZZYXgxSS9O?=
 =?utf-8?B?MFE3ZzBYdTVLb0lmUlh0N05vbGdObktiVWZYWmRhMnNJRFJBUWxJNFJaVWlF?=
 =?utf-8?B?R3MyN0FqdTBxU2IwRUlZMm1JK3B5dFJJOW5ac0daa3JSRG01UGNDdlk5QVJk?=
 =?utf-8?B?YWV3OVlENU1ZcU0zUGdkRm51SnEwZFYzVWRkbUU4bm9uRWk0Y2hybzVZamdW?=
 =?utf-8?B?eHJjNmZISy9LSUtXU2p2aldpT2ZpQmszZk9OOEZuT2l4UC9XMmNiKzI4Q2F4?=
 =?utf-8?B?dnRhcXFaYTQ2eG9tdVN4aC80MElZTjZHWU1xL2lZNm5mRU1ZcDNOaTk1MWxN?=
 =?utf-8?B?Ukc2Q0t1YWpneVRKdzIwNmY3WG80NFVMYnkxT3NEVkRjVFRUbG0wS1ZWZVNp?=
 =?utf-8?B?dEszSUVHN1NlUzdKQ2twTTlqMnpZZnMyU1I2MGRwaTRxNzRJUldaQXkzM05N?=
 =?utf-8?B?ZEpPMVErdGtpUC9ZMHNSZXFpT0FlWVhYQUhxTWVyMUhJYk1GTHdjWUFjZ3dl?=
 =?utf-8?B?TTlHSnd5QUZweTFRZU4xdzBqSmU4WDBoSDE2UFJieHFwSWw4UVBzSDhFSVlz?=
 =?utf-8?B?WGRUaEVnNGZ5OWk5NFgvVWpnOGJhQmlFdFdKSURkUE5ReEtlOTJWcHFZMDVu?=
 =?utf-8?B?eS9WQTZuUUNTVlQ3clc2cjB1Nlc4a1M1eWpQS1V1VnYxUENHTDFwdmM0VEdM?=
 =?utf-8?B?WTllck92MGVKc1IzbCtEWUlWbkNZZ0VFNjg3ckhPYmg0a0ZxWk1aSkh1d1d2?=
 =?utf-8?B?ZWtqUFBQc2lBMDFKMS8xaEV6THJ1ME1SZEoyYVdXQkVtN1gxS2RUZVNYYVhY?=
 =?utf-8?B?OHREZXJNeHhhTklzVTc2bDYxbUErMnY1akRGalNhTlhoODRCbGlMWDRiTUdm?=
 =?utf-8?B?eEFPWkNBZlMxN2l5Z2xHRmV5OUF5eXVyZWVsZEhYSW00eTRXQlFuVUNoYXhW?=
 =?utf-8?B?eFoybkRXdzJ0THpDYjR0aFA4cHNYdWdLVHNtazdDRzJjZUJscTZEbC9lUjBw?=
 =?utf-8?B?M2RoQ0ZLcG5VYVl6TW5BWm9RR0xkbmxBOFJZTFFwMjRlbTF5VHV3Z0NvVmtX?=
 =?utf-8?B?WElHSjg0SnVmSVR0S0tqS0htTWd0Z2c5YmdPTXQ4ZlZqNTJXWjQwWkp6a2cv?=
 =?utf-8?Q?TRbYVl4kkH16CPzmkdN/1Pqu8z84szATRiw9PMPnjwgV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a38544-180e-4c56-9fe4-08da86a0a2a2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:49:31.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4GLD+yyIXQKv2AU133VVHiobr1skyfQe3D8HMDLPnD9PncRCr5DiFDROZPVpLwEMGM5nPyd9dZzgPTe4o4fZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3737
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-08-24 22:29, Luben Tuikov wrote:
> Inlined:
>
> On 2022-08-24 12:21, Andrey Grodzovsky wrote:
>> On 2022-08-23 17:37, Luben Tuikov wrote:
>>> On 2022-08-23 14:57, Andrey Grodzovsky wrote:
>>>> On 2022-08-23 14:30, Luben Tuikov wrote:
>>>>
>>>>> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>>>>>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>>>>>> Inlined:
>>>>>>>
>>>>>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>>>>>> Poblem: Given many entities competing for same rq on
>>>>>>> ^Problem
>>>>>>>
>>>>>>>> same scheduler an uncceptabliy long wait time for some
>>>>>>> ^unacceptably
>>>>>>>
>>>>>>>> jobs waiting stuck in rq before being picked up are
>>>>>>>> observed (seen using  GPUVis).
>>>>>>>> The issue is due to Round Robin policy used by scheduler
>>>>>>>> to pick up the next entity for execution. Under stress
>>>>>>>> of many entities and long job queus within entity some
>>>>>>> ^queues
>>>>>>>
>>>>>>>> jobs could be stack for very long time in it's entity's
>>>>>>>> queue before being popped from the queue and executed
>>>>>>>> while for other entites with samller job queues a job
>>>>>>> ^entities; smaller
>>>>>>>
>>>>>>>> might execute ealier even though that job arrived later
>>>>>>> ^earlier
>>>>>>>
>>>>>>>> then the job in the long queue.
>>>>>>>>
>>>>>>>> Fix:
>>>>>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>>>>>> on rq in such order that if job on one entity arrived
>>>>>>>> ealrier then job on another entity the first job will start
>>>>>>>> executing ealier regardless of the length of the entity's job
>>>>>>>> queue.
>>>>>>>>
>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>>>>>      include/drm/gpu_scheduler.h              |  8 +++
>>>>>>>>      3 files changed, 71 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>>>>      	atomic_inc(entity->rq->sched->score);
>>>>>>>>      	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>>>>>      	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>>>>>> +	sched_job->submit_ts = ktime_get();
>>>>>>>> +
>>>>>>>>      
>>>>>>>>      	/* first job wakes up scheduler */
>>>>>>>>      	if (first) {
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index 68317d3a7a27..c123aa120d06 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -59,6 +59,19 @@
>>>>>>>>      #define CREATE_TRACE_POINTS
>>>>>>>>      #include "gpu_scheduler_trace.h"
>>>>>>>>      
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +int drm_sched_policy = -1;
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * DOC: sched_policy (int)
>>>>>>>> + * Used to override default entites scheduling policy in a run queue.
>>>>>>>> + */
>>>>>>>> +MODULE_PARM_DESC(sched_policy,
>>>>>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>>>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>>>>>> say the RR.
>>>>>>>
>>>>>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>>>>> Christian is not against it, just against adding 'auto' here - like the
>>>>>> default.
>>>>> Exactly what I said.
>>>>>
>>>>> Also, I still think an O(1) scheduling (picking next to run) should be
>>>>> what we strive for in such a FIFO patch implementation.
>>>>> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
>>>>> element.
>>>>>
>>>>> Regards,
>>>>> Luben
>>>> The only solution i see for this now is keeping a global per rq jobs
>>>> list parallel to SPCP queue per entity - we use this list when we switch
>>>> to FIFO scheduling, we can even start building  it ONLY when we switch
>>>> to FIFO building it gradually as more jobs come. Do you have other solution
>>>> in mind ?
>>> The idea is to "sort" on insertion, not on picking the next one to run.
>>>
>>> cont'd below:
>>>
>>>> Andrey
>>>>
>>>>>>>> +
>>>>>>>> +
>>>>>>>>      #define to_drm_sched_job(sched_job)		\
>>>>>>>>      		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>>>>>      
>>>>>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>>>      }
>>>>>>>>      
>>>>>>>>      /**
>>>>>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>>>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>>>       *
>>>>>>>>       * @rq: scheduler run queue to check.
>>>>>>>>       *
>>>>>>>> - * Try to find a ready entity, returns NULL if none found.
>>>>>>>> + * Try to find a ready entity, in round robin manner.
>>>>>>>> + *
>>>>>>>> + * Returns NULL if none found.
>>>>>>>>       */
>>>>>>>>      static struct drm_sched_entity *
>>>>>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>>      {
>>>>>>>>      	struct drm_sched_entity *entity;
>>>>>>>>      
>>>>>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>>>      	return NULL;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +/**
>>>>>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>>>>>> + *
>>>>>>>> + * @rq: scheduler run queue to check.
>>>>>>>> + *
>>>>>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>>>>>> + *
>>>>>>>> + * Returns NULL if none found.
>>>>>>>> + */
>>>>>>>> +static struct drm_sched_entity *
>>>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>>> +{
>>>>>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>>>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>>>>>> +	struct drm_sched_job *sched_job;
>>>>>>>> +
>>>>>>>> +	spin_lock(&rq->lock);
>>>>>>>> +
>>>>>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>>>>>> +
>>>>>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>>>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>>>>>> +
>>>>>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>>>>>> +				oldest_ts = sched_job->submit_ts;
>>>>>>>> +				entity = tmp;
>>>>>>>> +			}
>>>>>>>> +		}
>>>>>>>> +	}
>>>>>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>>>>>> I see a number of optimizations, for instance keeping the current/oldest
>>>>>>> timestamp in the rq struct itself,
>>>>>> This was my original design with rb tree based min heap per rq based on
>>>>>> time stamp of
>>>>>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>>>>>> job queue). But how in this
>>>>>> case you record the timestamps of all the jobs waiting in entity's the
>>>>>> SPCP queue behind the head job ?
>>>>>> If you record only the oldest job and more jobs come you have no place
>>>>>> to store their timestamps and so
>>>>>> on next job select after current HEAD how you will know who came before
>>>>>> or after between 2 job queues of
>>>>>> of 2 entities ?
>>>>>>
>>>>>>
>>>>>>> or better yet keeping the next job
>>>>>>> to pick out to run at a head of list (a la timer wheel implementation).
>>>>>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>>>>>> than on job removal/pick to run.
>>>>>> I looked at timer wheel and I don't see how this applies here - it
>>>>>> assumes you know before
>>>>>> job submission your deadline time for job's execution to start - which
>>>>>> we don't so I don't see
>>>>>> how we can use it. This seems more suitable for real time scheduler
>>>>>> implementation where you
>>>>>> have a hard requirement to execute a job by some specific time T.
>>> In a timer wheel you instantly know the "soonest" job to run--it's naturally
>>> your "next" job, regardless of in what order the timers were added and what
>>> their timeout time is.
>>>
>>>>>> I also mentioned a list, obviously there is the brute force solution of
>>>>>> just ordering all jobs in one giant list and get
>>>>>> naturally a FIFO ordering this way with O(1) insertions and extractions
>>>>>> but I assume we don't want one giant jobs queue
>>>>>> for all the entities to avoid more dependeies between them (like locking
>>>>>> the entire list when one specific entity is killed and
>>>>>> needs to remove it's jobs from SW queue).
>>> You can also have a list of list pointers. It'd be trivial to remove a whole
>>> list from the main list, by simply removing an element--akin to locking out a rq,
>>> or should you need to edit the rq's entity list.
>>
>> So you do mean some kind of FIFO list. I really would want to avoid
>> maintaining an
>> extra data structure, we already have jobs stored in entity SPSC queue,
>> and now we will have to add
>> to a job struct  a pointer to another,  rq wide FIFO list, seems to me
>> like a recipe for problems.
> Maybe.
>
>> Thinking more about it, if I do let each job have it's original
>> submission timestamp stored I can go back to my original design
>> of storing sched entities themself in min heap structure based on
>> timestamp of the next job to run in the entity
>> (head of job list), this way we get O(1) extraction of next job to run
>> and it will still be FIFO. The cost will be O(log(# entites in rq))
>> for updating the min heap on each job extraction based on next head
>> timestamp. Still better then linear. On the downside we need to maintain
>> an rb tree structure
> O(1) would be ideal, and the "sorting" can be had when the jobs are submitted,
> which could take O(log N), as in sorting.
>
> But O(log N) on a balanced tree, such as you're using an R-B tree for a min heap,
> is a great metric and way faster than O(N).
>
>> to store the entitles in parallel to holding them in linear list for
>> round robin as it's tpday.
> You could choose to store one way or another, exclusively, depending on what
> scheduling policy had been chosen.
>
>> I am attaching my original patch to give sense of
>> it with TODO section were I added this new code. There are actually some
>> corner cases with empty SPCP queue becoming full and sampling not the
>> head of the
>> queue but the next one is what we need but i think it's solvable.
> Your WIP patch looks good.
>
>> In general it seems to me that before doing more complicated design we
>> actually need to measure and see if there is really a substantial
>> performance hit compared to current RR
>> or even  compared to possible O(1) extraction solution. No point to
>> complicate design if we don't get significant performance improvement
>> from it.
> WLOG, assuming all jobs are ready to be executed, then, for graphics, I'd imagine
> we'd want to pick the next job to run in O(1) time complexity. However O(log N) is
> still good and preferable. O(N) is slow. FWIW, the RR we have right now is O(1) given
> the job readiness assumption above.


You convinced it, going to try to rework my original patch. I asked 
Yunxiang to measure
performance delta anyway, just in case this rework get stuck and then we 
will just use
the primitive linear search for the client needs at least.

Andrey


>
>>
>>>>>>> I'm also surprised that there is no job transition from one queue to another,
>>>>>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>>>>>> want a state transition from (state) queue to queue.
>>>>>> Not sure what you have in mind here ? How this helps ?
>>> I think I've explained this a few times now--each list represents a state and a job/entity
>>> travels through lists as it travels through states, which states more or less represent
>>> the state of execution in the hardware--it could be as simple as incoming --> pending --> done.
>>>
>>> It allows a finer grain when resetting the hardware (should the hardware allow it).
>>>
>>> Note that this isn't directly related to the O(1) mechanism I brought up here. As I said, I was surprised
>>> to find out none such distinction existed--that's all. Don't fixate on this.
>>>
>>> Regards,
>>> Luben
>>
>> Right, so this one is a separate  topic regarding the pending job list
>> refactoring which we need to discuss and fix separately - i have TODO to
>> come back
>> to your patches from a year ago or so which were addressing this.
>> Probably will try to get to this after finishing this work.
> Excellent!
>
> Regards,
> Luben
>
>> Andrey
>>
>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Luben
>>>>>>>
>>>>>> In my origianl design
>>>>>>
>>>>>>>> +
>>>>>>>> +	if (entity) {
>>>>>>>> +		rq->current_entity = entity;
>>>>>>>> +		reinit_completion(&entity->entity_idle);
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	spin_unlock(&rq->lock);
>>>>>>>> +	return entity;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * drm_sched_job_done - complete a job
>>>>>>>>       * @s_job: pointer to the job which is done
>>>>>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>>      
>>>>>>>>      	/* Kernel run queue has higher priority than normal run queue*/
>>>>>>>>      	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>>>>>> +		entity = drm_sched_policy != 1 ?
>>>>>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>>>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>>>>> +
>>>>>>>>      		if (entity)
>>>>>>>>      			break;
>>>>>>>>      	}
>>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>>> index addb135eeea6..95865881bfcf 100644
>>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>>>>>      
>>>>>>>>      	/** @last_dependency: tracks @dependencies as they signal */
>>>>>>>>      	unsigned long			last_dependency;
>>>>>>>> +
>>>>>>>> +       /**
>>>>>>>> +	* @submit_ts:
>>>>>>>> +	*
>>>>>>>> +	* Marks job submit time
>>>>>>>> +	*/
>>>>>>>> +       ktime_t				submit_ts;
>>>>>>>> +
>>>>>>>>      };
>>>>>>>>      
>>>>>>>>      static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>>>> Regards,
>>> Regards,
