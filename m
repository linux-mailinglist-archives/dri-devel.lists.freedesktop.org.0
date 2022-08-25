Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5F5A0965
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B590D8916;
	Thu, 25 Aug 2022 07:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F1AD8968;
 Thu, 25 Aug 2022 07:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqQoqcRSJoYvTpjgXRGNQgTiXM/HMRl37NTWNXVDcSYWzhmqGkltL5L12qpMcnICNcFaN/IB4YDknyXa05rUEedsoVrJth/hBr3uVok4cM429iLGEBS5FCGJTsh18OXXGF+BKO/El7KMDC+Xr+XpiHe6v5r3ybLTnyGLMCZOckgxvD+KeafzoAaQYX4W2y0QDcxp/CWfjK6P4DCaRxnOm/CT3HjDBmM9b5sV3OD5S+m7uNJiJe+jy/PP+bxlBz6ZSwL84lns9cxldotkFQQNgilA28gFwgdvpIDnKhL4VdGOW7mHahP3g9jXT7Hv7ruA6DXFPmsUncoRXohQjeLn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjapnbi0sKRI/9eSaPNnzLFJ4qsFf1v4O16PBqqV7JU=;
 b=JRE3kixJHXtfkE5XSEc/SdXxy6j9zAwQDv4+p9JIzT8/FcO8d8sppG3MHQQl8Krk4BHCs4Bo4Te3YJyJCW2EcClqE5ysc7sozRqrw4oyXR/KCB3l1fRFwk8BQW3o3ZpfdX2iSc8e37G/u5S8/ppNrv+ATe2GlF+iaeL1NB6v2f+ib2W044vdyxcqIXsoylmK5OnPLgzh1Xcvhnk+Q/rRvQxRmzM8XzvNevzYZAEI0T6t+Mk/FpxlG2f4SQ4Cy/Ze7w6bHdDhbFW5hbDwzS/o61JZBcw2WFbdn/MCz/9Rc1BDdDmJ9wGUYrZq0NcW0H464/pALkPBan4PeIY8qy+pKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjapnbi0sKRI/9eSaPNnzLFJ4qsFf1v4O16PBqqV7JU=;
 b=UdTx1c4gk2jd5OYaC7TmTo91pL2f57NrLw1YvvkLv/wqtsnSzlfjQkKqnQ7E13c/giIl5PdkeKziZqO5w85Oqrs1NS/ZWYfJc9BBki9C1ueL/EO/qFwO+xT53lIy4RzgNCryKwZrAW28EoajKBU/ikBRcCJ9IhMKbsktT1hUQmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 02:29:06 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286%7]) with mapi id 15.20.5546.022; Thu, 25 Aug 2022
 02:29:06 +0000
Message-ID: <34ea8549-f459-2074-2bd7-945601f5ef9b@amd.com>
Date: Wed, 24 Aug 2022 22:29:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
 <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
 <1eadb06c-7d2c-0317-a34a-c219c68b93c3@amd.com>
 <54bbcee9-68c7-5b4d-1050-7f098c96a805@amd.com>
 <65722ac9-e76b-8473-e1d5-3209c2d59a89@amd.com>
 <3adcc1ce-434b-3e2e-8748-697addcb7aa3@amd.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <3adcc1ce-434b-3e2e-8748-697addcb7aa3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba770990-8588-40e3-6960-08da86419519
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOegdtixRhNBiCieEqMeDWAAOT8IOIoQKiotg5z45jdSEwQm5N84zvgNZcfkBmhH+972CW9O74jXUAEjP7Cm6boieIoNrdy88oSS7d4UgE7xnj2dcdlPs/Zb3Z66aJzuUl1nkd0JObT8m3AMDvhmRREc3jusnTtAdC7J5gNWZF9Em6Q6J2t5O+ORWPeqxw7OeXewbTda0nqVnUshom8wMN3O4GYbWLteYboEhLE5qk8yEgcmANlfmFsBwPAlR++A7e/jSj8F0nK7c/O0fnEocHWVMcK7GlNgxtVeq3FLEFgx1jWNJWCj3BOJaj3eOTRsb23uyePYFGSaE76ODo/irWCrtCOx+P5lclP4fVGdFjIZnhbip4pb8ijUX+bfBmHXlsBCbB54rXodX9KMTC8ZUIJUgE2qpMrFu/nXkAWPvqmT7aofFcmfytSoI/ziTNHDsR+yoEEAscRfQNSWzzrqEBfGb4kiAidIOS693FezKpVW45GZNS/Wqw80tzMQl4hsysXDPdpIOgG55FGxumIHWEHuJIdKPAlJaUx/CAS1Xe2x3Ww++Beca1b+AEBclXEkf5TK8+3zXqWwB6rKx1l3cd1mc38jdhSnSWPZkVHlY/VNr+HJFy5GJqUHGWvsqZJq9mKDv69+TLEbE+emkb8phVPbiaYZFb75slVIkx0m3zxuFhGWi/ZlLYw7tRmGvULUMxMIkQ2kRdAZWT+UopfCiqEhO3+5Wh5IEK+7rmaS1YlxMNLvAegRzqxnPe9m5CU57hHtte1Gubo+Jl5LrJNqXYqvjqi77PTtUthE8EO4Hks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(4326008)(66476007)(86362001)(66946007)(66556008)(8676002)(31696002)(316002)(6512007)(6506007)(186003)(2616005)(83380400001)(38100700002)(478600001)(26005)(6486002)(53546011)(41300700001)(2906002)(5660300002)(30864003)(31686004)(36756003)(44832011)(6666004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVE1UnJNUVdFMENrWldrT1FSQmhSbkd2Z3RGVllLaW91K3dSUEVaUlpwMWdF?=
 =?utf-8?B?UjVQcUlVMWVoVWtMR2NyeXJJanMyaTFKOWpGUStiK2tyZlJ3Qnk0ais5ZFdE?=
 =?utf-8?B?ZnNGbldBZU9KakJRRlNXdVpvVEJDMkpPWEhWU05NeHpEL3dTcG96SkpqTHlo?=
 =?utf-8?B?RnBFdlRwMUFndWtOOVgzL2FnRjIzemNsVmt2KzQ5ZUFLdjkvZDVCa3NMZHk0?=
 =?utf-8?B?RTRTTk5SV2dWL0dkdmFGQjJYZnFVYnYzQVZzSTBXNlQ3Z3RkSTcwR3BOL05o?=
 =?utf-8?B?cE16Zml3eVZ5Z1kvZnFDV0ZwK3dYa1pBOHVCRmU1WkdKeUx3eXZpNC9hRGNR?=
 =?utf-8?B?KzNBRFAwUVVtY2sxQjBMd29MQ3ZUaTVhb2RmRDRCVHp0MHBhcGtNd3lBcS9p?=
 =?utf-8?B?bGttK0VyOUc3MGhTWDI3NkpGTUc5L1gvbjV6UWIyaXI5T3BidWc5U1I3YklL?=
 =?utf-8?B?L1ZMVE5FL3R2anZaMllQS0NrNFhHaUZpWGo4TzhtdmhYNE4yTmlpRXJoa2Z3?=
 =?utf-8?B?VGxBZW5NNVY4NHJiOHBBUlRUNmVEaG50dk5xOWRGVXBWNlpZMlF3L0dRR2ll?=
 =?utf-8?B?d1c0QWlKbDJqN1c3REpxYWJPRWdEZExLNjZoUHpqRmoxcTdsaDBTTmYrWG5p?=
 =?utf-8?B?SC9CNXRGSWlDZFhTZVNwenB4bXdRZTFIenU0V0pORnRKM0xZZmxzNTJPeVp2?=
 =?utf-8?B?V0RaT3VGMWZiNXJnT2ttWmZDUjBiaWpUblpsdyt6dlN2UUw0L1lrQzBYUVA0?=
 =?utf-8?B?aHBFU010SjFkZkVlRmducEJyM0thVGFweVBjUlZOUHA5VUtRUCtrYnRRRnVm?=
 =?utf-8?B?dmswZ0RtM3puVVRRZTVoQXFJL2g5cGFyeGxaa1hhaWR3MitUdHdrM1NCUlpi?=
 =?utf-8?B?aTU5SzdwYXJOTDVVS1BFVnN2NUNlZjJHRkJiSjM2VUxFWjNWeTlIYUdGZjdL?=
 =?utf-8?B?MzhCbmNvN2lhWnVxZ2RXNnloNzlGUHMzNkZIcnZzUC94VjRrM1l6c243UHVs?=
 =?utf-8?B?a0JiU2p1enlDRnZ1SU5ORytGdUVEZ0RNRUFFN3M1MWhvcHBFa3ZSaGxtdzBj?=
 =?utf-8?B?WUk1R2I2cXFJUmJRM1hZeHlsRDc3SXFZekRFZGZMVVBnMEpKa0gxZnlDdXNO?=
 =?utf-8?B?ZzE0Wjl4aTZYSTJXR0M5YnBtakE3SWJjeU9lK3BVeFBhMkhKOURjQmRsTmpr?=
 =?utf-8?B?RXNuWWpHSnQ1SExBaUFCUGV1MGtwdXpzMXVvY1dpaUxoTlhuaktGaHIxMEhU?=
 =?utf-8?B?K3hRUy9taFgvczFrcjhnM240RmZ3Qmg2cDkrTkRZQXhqTEhPZGxQTE9aQkt6?=
 =?utf-8?B?MDdUaXRlbVdBYStTUjJmbERad2YrR2h6SVM2elZxcHkvQzBHQmhDYkh5S0RR?=
 =?utf-8?B?ZUh1aXpZMnozdCtlM1U5M25BUFpzS0trWVdHR0U2d1pIV1lZeXg4Y1pkQzVR?=
 =?utf-8?B?Nlo0RW83SFgxQWV3ZU9VTjhoMVhnSExGay91UzJsQzVQLyswQWtvZGp6bm1i?=
 =?utf-8?B?clhXN0FoOTdnRFhUd05UNDVuelBqL2JKQlhwRUVnSUN6OEo0RzJpSEJnZUVk?=
 =?utf-8?B?clhpMURzT0RYUFB5U1dVVm5BbkZ3WmlLSGZLeDR6bEV6dmIxZ04xcyt2bGJP?=
 =?utf-8?B?amJMc2VPdlc3TTFCZDkzYzJDdGU4SkpRdkZaVmZlRzBnYlFsMDlUZXBJMm9Q?=
 =?utf-8?B?S2VtaUlCOHJmZTNsZFZFNGtlWXZxcWVmNWJsMHNsOHMrbkVYenJ3amxleDBU?=
 =?utf-8?B?NDVldjFSYW5DREhKTS9ZV2FiWEZaVmdDVlVmcVppeWJYT0tDNTNONkFaWXRm?=
 =?utf-8?B?Ny9hcTF3WmthNkdPbkQ4TDFmZDg0bDFITUJXRTBnNm1Nai9PYTZQN2M2WWYv?=
 =?utf-8?B?TmdOR1g0VWd2WHAxWUkwdGp6QnlyWG9sUVo2d2ZUMjhqaStXc1l2ZDFDWFRG?=
 =?utf-8?B?UU1Gc0xPcnZ0VWIxNjdGWTQ0TjRjYmFtczBJWDJYTXhrVWNtR3hvOXJWWVlP?=
 =?utf-8?B?eWFPSTlDUnEwS25YU3V2VTJ2WmhjTnAyZmRvNEZGVk5yZHpnbjU3TXlJUlN5?=
 =?utf-8?B?TndUUlJZSElieG9Gejg2V2wrMHZCclk1KzFoYzRidmViNUs5dkwyU0tlQUR5?=
 =?utf-8?Q?tLgN55pqOj2rj5ORLUQj8e0CP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba770990-8588-40e3-6960-08da86419519
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 02:29:06.0375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4xqA8SZDQVrk5infOq3UYWFfOkAsHCSOVfQCUJi6oGKufukWhb8QzBUbll6C3CJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

Inlined:

On 2022-08-24 12:21, Andrey Grodzovsky wrote:
> 
> On 2022-08-23 17:37, Luben Tuikov wrote:
>>
>> On 2022-08-23 14:57, Andrey Grodzovsky wrote:
>>> On 2022-08-23 14:30, Luben Tuikov wrote:
>>>
>>>> On 2022-08-23 14:13, Andrey Grodzovsky wrote:
>>>>> On 2022-08-23 12:58, Luben Tuikov wrote:
>>>>>> Inlined:
>>>>>>
>>>>>> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>>>>>>> Poblem: Given many entities competing for same rq on
>>>>>> ^Problem
>>>>>>
>>>>>>> same scheduler an uncceptabliy long wait time for some
>>>>>> ^unacceptably
>>>>>>
>>>>>>> jobs waiting stuck in rq before being picked up are
>>>>>>> observed (seen using  GPUVis).
>>>>>>> The issue is due to Round Robin policy used by scheduler
>>>>>>> to pick up the next entity for execution. Under stress
>>>>>>> of many entities and long job queus within entity some
>>>>>> ^queues
>>>>>>
>>>>>>> jobs could be stack for very long time in it's entity's
>>>>>>> queue before being popped from the queue and executed
>>>>>>> while for other entites with samller job queues a job
>>>>>> ^entities; smaller
>>>>>>
>>>>>>> might execute ealier even though that job arrived later
>>>>>> ^earlier
>>>>>>
>>>>>>> then the job in the long queue.
>>>>>>>
>>>>>>> Fix:
>>>>>>> Add FIFO selection policy to entites in RQ, chose next enitity
>>>>>>> on rq in such order that if job on one entity arrived
>>>>>>> ealrier then job on another entity the first job will start
>>>>>>> executing ealier regardless of the length of the entity's job
>>>>>>> queue.
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>>>>>>     drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>>>>>>     include/drm/gpu_scheduler.h              |  8 +++
>>>>>>>     3 files changed, 71 insertions(+), 4 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>>>>     	atomic_inc(entity->rq->sched->score);
>>>>>>>     	WRITE_ONCE(entity->last_user, current->group_leader);
>>>>>>>     	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>>>>>>> +	sched_job->submit_ts = ktime_get();
>>>>>>> +
>>>>>>>     
>>>>>>>     	/* first job wakes up scheduler */
>>>>>>>     	if (first) {
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index 68317d3a7a27..c123aa120d06 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -59,6 +59,19 @@
>>>>>>>     #define CREATE_TRACE_POINTS
>>>>>>>     #include "gpu_scheduler_trace.h"
>>>>>>>     
>>>>>>> +
>>>>>>> +
>>>>>>> +int drm_sched_policy = -1;
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * DOC: sched_policy (int)
>>>>>>> + * Used to override default entites scheduling policy in a run queue.
>>>>>>> + */
>>>>>>> +MODULE_PARM_DESC(sched_policy,
>>>>>>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>>>>>>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>>> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
>>>>>> say the RR.
>>>>>>
>>>>>> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.
>>>>> Christian is not against it, just against adding 'auto' here - like the
>>>>> default.
>>>> Exactly what I said.
>>>>
>>>> Also, I still think an O(1) scheduling (picking next to run) should be
>>>> what we strive for in such a FIFO patch implementation.
>>>> A FIFO mechanism is by it's nature an O(1) mechanism for picking the next
>>>> element.
>>>>
>>>> Regards,
>>>> Luben
>>>
>>> The only solution i see for this now is keeping a global per rq jobs
>>> list parallel to SPCP queue per entity - we use this list when we switch
>>> to FIFO scheduling, we can even start building  it ONLY when we switch
>>> to FIFO building it gradually as more jobs come. Do you have other solution
>>> in mind ?
>> The idea is to "sort" on insertion, not on picking the next one to run.
>>
>> cont'd below:
>>
>>> Andrey
>>>
>>>>>>> +
>>>>>>> +
>>>>>>>     #define to_drm_sched_job(sched_job)		\
>>>>>>>     		container_of((sched_job), struct drm_sched_job, queue_node)
>>>>>>>     
>>>>>>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>>     }
>>>>>>>     
>>>>>>>     /**
>>>>>>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>>>>>>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>>>>>      *
>>>>>>>      * @rq: scheduler run queue to check.
>>>>>>>      *
>>>>>>> - * Try to find a ready entity, returns NULL if none found.
>>>>>>> + * Try to find a ready entity, in round robin manner.
>>>>>>> + *
>>>>>>> + * Returns NULL if none found.
>>>>>>>      */
>>>>>>>     static struct drm_sched_entity *
>>>>>>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>>>>>>     {
>>>>>>>     	struct drm_sched_entity *entity;
>>>>>>>     
>>>>>>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>>>>>>     	return NULL;
>>>>>>>     }
>>>>>>>     
>>>>>>> +/**
>>>>>>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>>>>>>> + *
>>>>>>> + * @rq: scheduler run queue to check.
>>>>>>> + *
>>>>>>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>>>>>>> + *
>>>>>>> + * Returns NULL if none found.
>>>>>>> + */
>>>>>>> +static struct drm_sched_entity *
>>>>>>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>>> +{
>>>>>>> +	struct drm_sched_entity *tmp, *entity = NULL;
>>>>>>> +	ktime_t oldest_ts = KTIME_MAX;
>>>>>>> +	struct drm_sched_job *sched_job;
>>>>>>> +
>>>>>>> +	spin_lock(&rq->lock);
>>>>>>> +
>>>>>>> +	list_for_each_entry(tmp, &rq->entities, list) {
>>>>>>> +
>>>>>>> +		if (drm_sched_entity_is_ready(tmp)) {
>>>>>>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>>>>>>> +
>>>>>>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>>>>>>> +				oldest_ts = sched_job->submit_ts;
>>>>>>> +				entity = tmp;
>>>>>>> +			}
>>>>>>> +		}
>>>>>>> +	}
>>>>>> Here I think we need an O(1) lookup of the next job to pick out to run.
>>>>>> I see a number of optimizations, for instance keeping the current/oldest
>>>>>> timestamp in the rq struct itself,
>>>>> This was my original design with rb tree based min heap per rq based on
>>>>> time stamp of
>>>>> the oldest job waiting in each entity's job queue (head of entity's SPCP
>>>>> job queue). But how in this
>>>>> case you record the timestamps of all the jobs waiting in entity's the
>>>>> SPCP queue behind the head job ?
>>>>> If you record only the oldest job and more jobs come you have no place
>>>>> to store their timestamps and so
>>>>> on next job select after current HEAD how you will know who came before
>>>>> or after between 2 job queues of
>>>>> of 2 entities ?
>>>>>
>>>>>
>>>>>> or better yet keeping the next job
>>>>>> to pick out to run at a head of list (a la timer wheel implementation).
>>>>>> For suck an optimization to work, you'd prep things up on job insertion, rather
>>>>>> than on job removal/pick to run.
>>>>> I looked at timer wheel and I don't see how this applies here - it
>>>>> assumes you know before
>>>>> job submission your deadline time for job's execution to start - which
>>>>> we don't so I don't see
>>>>> how we can use it. This seems more suitable for real time scheduler
>>>>> implementation where you
>>>>> have a hard requirement to execute a job by some specific time T.
>> In a timer wheel you instantly know the "soonest" job to run--it's naturally
>> your "next" job, regardless of in what order the timers were added and what
>> their timeout time is.
>>
>>>>> I also mentioned a list, obviously there is the brute force solution of
>>>>> just ordering all jobs in one giant list and get
>>>>> naturally a FIFO ordering this way with O(1) insertions and extractions
>>>>> but I assume we don't want one giant jobs queue
>>>>> for all the entities to avoid more dependeies between them (like locking
>>>>> the entire list when one specific entity is killed and
>>>>> needs to remove it's jobs from SW queue).
>> You can also have a list of list pointers. It'd be trivial to remove a whole
>> list from the main list, by simply removing an element--akin to locking out a rq,
>> or should you need to edit the rq's entity list.
> 
> 
> So you do mean some kind of FIFO list. I really would want to avoid 
> maintaining an
> extra data structure, we already have jobs stored in entity SPSC queue, 
> and now we will have to add
> to a job struct  a pointer to another,  rq wide FIFO list, seems to me 
> like a recipe for problems.

Maybe.

> 
> Thinking more about it, if I do let each job have it's original 
> submission timestamp stored I can go back to my original design
> of storing sched entities themself in min heap structure based on 
> timestamp of the next job to run in the entity
> (head of job list), this way we get O(1) extraction of next job to run 
> and it will still be FIFO. The cost will be O(log(# entites in rq))
> for updating the min heap on each job extraction based on next head 
> timestamp. Still better then linear. On the downside we need to maintain 
> an rb tree structure

O(1) would be ideal, and the "sorting" can be had when the jobs are submitted,
which could take O(log N), as in sorting.

But O(log N) on a balanced tree, such as you're using an R-B tree for a min heap,
is a great metric and way faster than O(N).

> to store the entitles in parallel to holding them in linear list for 
> round robin as it's tpday.

You could choose to store one way or another, exclusively, depending on what
scheduling policy had been chosen.

> I am attaching my original patch to give sense of
> it with TODO section were I added this new code. There are actually some 
> corner cases with empty SPCP queue becoming full and sampling not the 
> head of the
> queue but the next one is what we need but i think it's solvable.

Your WIP patch looks good.

> 
> In general it seems to me that before doing more complicated design we 
> actually need to measure and see if there is really a substantial 
> performance hit compared to current RR
> or even  compared to possible O(1) extraction solution. No point to 
> complicate design if we don't get significant performance improvement 
> from it.

WLOG, assuming all jobs are ready to be executed, then, for graphics, I'd imagine
we'd want to pick the next job to run in O(1) time complexity. However O(log N) is
still good and preferable. O(N) is slow. FWIW, the RR we have right now is O(1) given
the job readiness assumption above.

> 
> 
>>
>>>>>> I'm also surprised that there is no job transition from one queue to another,
>>>>>> as it is picked to run next--for the above optimizations to implemented, you'd
>>>>>> want a state transition from (state) queue to queue.
>>>>> Not sure what you have in mind here ? How this helps ?
>> I think I've explained this a few times now--each list represents a state and a job/entity
>> travels through lists as it travels through states, which states more or less represent
>> the state of execution in the hardware--it could be as simple as incoming --> pending --> done.
>>
>> It allows a finer grain when resetting the hardware (should the hardware allow it).
>>
>> Note that this isn't directly related to the O(1) mechanism I brought up here. As I said, I was surprised
>> to find out none such distinction existed--that's all. Don't fixate on this.
>>
>> Regards,
>> Luben
> 
> 
> Right, so this one is a separate  topic regarding the pending job list 
> refactoring which we need to discuss and fix separately - i have TODO to 
> come back
> to your patches from a year ago or so which were addressing this. 
> Probably will try to get to this after finishing this work.

Excellent!

Regards,
Luben

> 
> Andrey
> 
> 
>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Luben
>>>>>>
>>>>> In my origianl design
>>>>>
>>>>>>> +
>>>>>>> +	if (entity) {
>>>>>>> +		rq->current_entity = entity;
>>>>>>> +		reinit_completion(&entity->entity_idle);
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	spin_unlock(&rq->lock);
>>>>>>> +	return entity;
>>>>>>> +}
>>>>>>> +
>>>>>>>     /**
>>>>>>>      * drm_sched_job_done - complete a job
>>>>>>>      * @s_job: pointer to the job which is done
>>>>>>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>>>>>>     
>>>>>>>     	/* Kernel run queue has higher priority than normal run queue*/
>>>>>>>     	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>>>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>>>>>>> +		entity = drm_sched_policy != 1 ?
>>>>>>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>>>>>>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>>>>>>> +
>>>>>>>     		if (entity)
>>>>>>>     			break;
>>>>>>>     	}
>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>> index addb135eeea6..95865881bfcf 100644
>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>>>>>>     
>>>>>>>     	/** @last_dependency: tracks @dependencies as they signal */
>>>>>>>     	unsigned long			last_dependency;
>>>>>>> +
>>>>>>> +       /**
>>>>>>> +	* @submit_ts:
>>>>>>> +	*
>>>>>>> +	* Marks job submit time
>>>>>>> +	*/
>>>>>>> +       ktime_t				submit_ts;
>>>>>>> +
>>>>>>>     };
>>>>>>>     
>>>>>>>     static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
>>>> Regards,
>> Regards,
