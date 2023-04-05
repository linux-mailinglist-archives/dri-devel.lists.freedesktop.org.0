Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A426D88F2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 22:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C3810E12F;
	Wed,  5 Apr 2023 20:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C241810E12F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 20:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOTlugiV7AxgGnfOSMUV0JJeKj/2DwqZsce8ldZY5rUtuIVy16uLsGeI7VweFtxQ4lUSCvIj6TC8QBrxYvUc7g9ATSFWAP+V9eUDEkXXYWDvgxA2UIJsJvIMPp5sbhqObdCDr8HP+1VBoW06goO0Wa5nlzxesiJ716rTFzTpC0/l135WzCCr77+LiX74eogtmk2zAFE0iVRxb1NQjxFcG0cXy9SESqryXpljlnT7F9Taze8R2nVa5I/oR2vX6JqadnzOoyJsmo0J972F+JiCC3vB/nuWV/a6XVWU3502qieO0ocO8fNfmnw3qV5qIFXTytmx+ukJAKaSnHX6dCQfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/SycE5m8Av6XTuiWTZlTvatLbo/K6QKFCe/nWlYro4=;
 b=VNlAS68Jqe5fGkC8yrtkheG3fQl3TkBXI8sAH59YeDetmmaK5bleN1Uk4Eb1WfMHQRZHxbxgql0ogdQZUFzmgM9hLyHBqEgyqkUYbnaFRTEPfddPiLUguFPCS3+gXTn2Zsmb5fEYOKbruDCh6ORCHU6oxWPU22zhiv7m1s3Rv2Y7ceLndC7Z0MlBKm//qy9nOLIjSGkX41hF1jnwAMTAeGfbORcN0YYbyjjb7gM+0OBXhlMbiv38poZJQGxJk9RiwoNRO9BMKTWrl9XJFGSRYUAdR1kB8BBbhZguJrC/YLDuYN8P/xVvNLkXg13eEhX6eDVZftcorOXGCUMOaORSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/SycE5m8Av6XTuiWTZlTvatLbo/K6QKFCe/nWlYro4=;
 b=tZAkzSV7ZkngL2rC+7v3tg9wHuKZbVU+IP1e68dHxSS7EWxxYx5exM7cxPWJrrHoCbq0Ewq3e4AJQ3X0/johORQIfNYSIwVWruppxay/VI8nxXDKGNnr3lE1ji+Mlcqu6v8Htwxxqq3Y8iU8vUULLCVp8U0hpJS41knI8MZwPjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.30; Wed, 5 Apr 2023 20:44:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 20:44:36 +0000
Message-ID: <3215dfb9-8f7f-625f-44a9-85320cd32019@amd.com>
Date: Wed, 5 Apr 2023 16:44:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Lucas Stach <l.stach@pengutronix.de>, Danilo Krummrich <dakr@redhat.com>, 
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <c952a63a2c0c7377e1e15b1d06c1a941f3456d60.camel@pengutronix.de>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <c952a63a2c0c7377e1e15b1d06c1a941f3456d60.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0066.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: c41e17a2-5381-4245-d21f-08db3616919e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74Ac/HF9pQJdpQY9bqkz087gmOBzvlx+JRFPsiaQdUdzgrlChTC7ijtKg53d1HqyYZZhIk9KY2qTJBLlEu4uerO/GQloeHTxaCjR9Awz1n5/IYX/3dI0NqFDG7MO0lY+zfiZR9bxg+Owk3cdIAJm5Q7OrHv93VuLPo40c0uPAxZ9uKJKOWwBWXhvuavZeenxKCLGzbGGUMCedAiMxknaZJplymfjSrPBmWtwATrIrssObEwJsfbosa/Awwc+VLx2i5ra1+0ozjxi399N6SVJPaUr079nu21ZC/lowYhDJpG3d0+Nz9ZzldL0BIy90iqQ56rvOhEjcMe8VLTwtSbE9+RZEmpcfhxLhSfA2UMjsvyBhVOu2/MptciHfhld7ynxo9fqL7K3p3VhQCR/NhJG1vT3inoi9uxt2MXdmu+iUFocuhKFnS9KQpahBjtG3AVlWaoAr/mlIImdgA6HgZf+0edOF6vesGbKOlr1cl86Hw6hWt3cWp1VqngCnsE8xYBZ46ZxgcaCpmbFSAKXrAwd9+kgkB69/v7KiIW9DYbP2BSuBH9GzZg8ag++a+zrpYygTG7QmSopdQVfhL3zowqavUNbg8VgE+4/f92Hx1qOPJbhhXr0Bc+MA5SP9Og0cM9i2VjDVTKdYmqXif1EV0Erpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(83380400001)(36756003)(31696002)(86362001)(38100700002)(110136005)(478600001)(316002)(6486002)(41300700001)(44832011)(5660300002)(8936002)(2906002)(8676002)(66556008)(66946007)(31686004)(66476007)(186003)(2616005)(66899021)(26005)(6512007)(6506007)(53546011)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBXbTI3ZXlEamttWUlsK0cxWWNVWnNHOU9ZUWN4bWtnMmVDbkJtcE96Q2dW?=
 =?utf-8?B?amFJQU1qOTd6WjlyU2VjY3dlcUhHdjB5eVI4UWYxK091cXlUYnQvZG9UZDZD?=
 =?utf-8?B?SWlRMEVNLzUra0RPRU85NnZXcE44MkhuWmVCaGZnNG5kQ1U1K1RUU21taGFm?=
 =?utf-8?B?VU1DNCtNVnZqOGh4VkhBU1ZISHFYcFIvYWdQOHN2Z0ZaT0RtY0tXUWJPQWsy?=
 =?utf-8?B?Njk5aWlOSTV2OEJpM3hUVTljejUvd2krdzdMWGtaWlBhQXpwU0MzRExjZ0tl?=
 =?utf-8?B?aW9GWjNFOFZzNHVicXJ0MWpNa3g2Mk1lQmZnTE8zL1hIdTVTNERZQzQrejFK?=
 =?utf-8?B?U1ZLRkhmT1ZNWUd6SVA1cXFjQmhBS05rMVhNYUtFT1h4SThJektFRk1ydHhn?=
 =?utf-8?B?dXFSU21nTlYzVlhPS01STWt1NnVvSkNJZkNSSDdHUVAxZUlGOVBtTjhDQ3Nv?=
 =?utf-8?B?SWpWeGsranRNdUkvVFJOVVN0WVhlVjQwUFFveEFSbi9tUmlOclhGN1V3VklO?=
 =?utf-8?B?amNpM2ZZUzBXdytEaTVlSldVQ0JrY2h4TlArNDk3bzFtOWRIbmxPaS92cVNC?=
 =?utf-8?B?M2JnNEJOMmxodU1sd1hCMW5BeVk3ZUJUVVk1dWVGRkVDV2dwY0JneStPQjVB?=
 =?utf-8?B?TGQ1NU03cDF0anA2WkRkZzBaMmRZbGJYMEMvNWZnMjVDS29rUnVZUGVvb2dx?=
 =?utf-8?B?eFlhREZpeHNGVG9JKzA4VFZ4SnhvZ3hmdUZEeE1XdkhlQ21zV01GaGJPRHZs?=
 =?utf-8?B?b1NMY0wxWWlJNVhnNVhrekRDaUFMWVg2OVZsWkNtdFVQbTV4RVVFc2pPVGQ1?=
 =?utf-8?B?TWxHQ0p6THNaZUtZMlFXRkdqQlUvYVdCaTZTQjl1YWJobkFpdlM1UUt6YUdV?=
 =?utf-8?B?ZHVsSTlvaUM2UkVUeXhEV3ZqLzBUeE1ocW5jVEx5SWRUL0lXN1Y1anM3UUVN?=
 =?utf-8?B?RlZIaEhoYU9aa0NHNCsveG4wZE1VUjlDb3RndHdrOCtLdlp3OG5GYVVJRDdR?=
 =?utf-8?B?d2hTUG5oVlJBTlBGYXpMSzVRN2Y4YTlqaThZajNkY0U4R29KbnAxU0tZamc2?=
 =?utf-8?B?bm12bGZIS1dwTndIMTZ3cldmekpEQVRJaFc1bHhkazhzLzNEYmZHUEVIa2d1?=
 =?utf-8?B?aWhSZ0NVR3psWUROOHE1bXZ1VnFIbnplekZ0ODJYZ09RS0VQUWRMNXJhMjJs?=
 =?utf-8?B?WGxQUG1EZzVkLzZmVU9udFJBU2NaelV4ek5WMmJsTjdFOHhMWnBvbXdPUWJB?=
 =?utf-8?B?L20zelY1dldIZkZDelkrSVk4c2ErNUdMVDlyTDRUVXJJL096b2RlTnIwd3VJ?=
 =?utf-8?B?ZGdoUzZjeUh3dTNUcnFrTDFuNU9neWNaRHJsSzR4R3p2eU03Vk5abTFCa1JX?=
 =?utf-8?B?M1p3RlZLcDQ1Wnd2NWdmQ2ZlTVBjU0lmTXlOYVBjRFBCQ2kyamorTDk0MUZ0?=
 =?utf-8?B?c1I1cURWSlpLK3R6TTF5cEduRmpXemhRZkwzV09DOGhMTnFnQVBnNlhJWFBu?=
 =?utf-8?B?RjczTVh1ZFh3L2YwTGVsOFVoNXFBQWt6RlFDbHlFa0h6N1A2NFdpRkVkWkht?=
 =?utf-8?B?R3Q3c01SWEFwU3dxRFRpSk9jSUQyeXZ4TkxoYmEyRjRlc2FZSGtKcHNQU25I?=
 =?utf-8?B?RTlHTXZTYU1YbEJKTEY3bENJRFNFZ0dUZFluZGYyY1dLTEtVTHhiSHkwUU1B?=
 =?utf-8?B?OWVmaWVOb0VGencyYWZTbEoyR3E3ejA1aHJuQzRkQXF2L2VoVy8zRk4wR0ov?=
 =?utf-8?B?Yi9zZklyYkl2cndQa2hSN2FJZWtVWHI3bGIvcEE4eE5OekxNT09uRnZqZWVJ?=
 =?utf-8?B?RkRpS05uVWJtMEVRYVhEU085cjIwbnlhcXlkRFdSMEdlWnphbGtUOG1mbzl0?=
 =?utf-8?B?RGNyZUpDeUdkcitkdU5vUytHWGhZQnZvRldsV1hidzBrbnk1aU5UeU5na3JE?=
 =?utf-8?B?SmFGdFVZb2ZGU0NabGxXWXFFOG50VGNVc2x0MHZCSStNSDlwV1hYR2hIWUVj?=
 =?utf-8?B?T3BKRE9YNnFjYW54U2ZpUSs4Z0x4Q1VnbytWM0tYS2JHS1drNG13Vmwrc3o1?=
 =?utf-8?B?OFZiL3Zady8vMmhTZjFYQURDOENOYzdPSHl5ZXRKN2dFeXFURjdEVVpZdUlH?=
 =?utf-8?Q?swVWqyyf/2ibeoAgNPfQFistk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c41e17a2-5381-4245-d21f-08db3616919e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 20:44:36.5388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwZepKefboyPLJMFWujKMGF2SW/0Mf9Yi3ear81KKWwb31p9gAvu7b7giBm8LT29
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
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

On 2023-04-05 13:44, Lucas Stach wrote:
> Hi Luben,
> 
> Am Dienstag, dem 04.04.2023 um 00:31 -0400 schrieb Luben Tuikov:
>> On 2023-03-28 04:54, Lucas Stach wrote:
>>> Hi Danilo,
>>>
>>> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>>>> Hi all,
>>>>
>>>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity") 
>>>> tries to track the accumulated time that a job was active on the GPU 
>>>> writing it to the entity through which the job was deployed to the 
>>>> scheduler originally. This is done within drm_sched_get_cleanup_job() 
>>>> which fetches a job from the schedulers pending_list.
>>>>
>>>> Doing this can result in a race condition where the entity is already 
>>>> freed, but the entity's newly added elapsed_ns field is still accessed 
>>>> once the job is fetched from the pending_list.
>>>>
>>>> After drm_sched_entity_destroy() being called it should be safe to free 
>>>> the structure that embeds the entity. However, a job originally handed 
>>>> over to the scheduler by this entity might still reside in the 
>>>> schedulers pending_list for cleanup after drm_sched_entity_destroy() 
>>>> already being called and the entity being freed. Hence, we can run into 
>>>> a UAF.
>>>>
>>> Sorry about that, I clearly didn't properly consider this case.
>>>
>>>> In my case it happened that a job, as explained above, was just picked 
>>>> from the schedulers pending_list after the entity was freed due to the 
>>>> client application exiting. Meanwhile this freed up memory was already 
>>>> allocated for a subsequent client applications job structure again. 
>>>> Hence, the new jobs memory got corrupted. Luckily, I was able to 
>>>> reproduce the same corruption over and over again by just using 
>>>> deqp-runner to run a specific set of VK test cases in parallel.
>>>>
>>>> Fixing this issue doesn't seem to be very straightforward though (unless 
>>>> I miss something), which is why I'm writing this mail instead of sending 
>>>> a fix directly.
>>>>
>>>> Spontaneously, I see three options to fix it:
>>>>
>>>> 1. Rather than embedding the entity into driver specific structures 
>>>> (e.g. tied to file_priv) we could allocate the entity separately and 
>>>> reference count it, such that it's only freed up once all jobs that were 
>>>> deployed through this entity are fetched from the schedulers pending list.
>>>>
>>> My vote is on this or something in similar vain for the long term. I
>>> have some hope to be able to add a GPU scheduling algorithm with a bit
>>> more fairness than the current one sometime in the future, which
>>> requires execution time tracking on the entities.
>>
>> Danilo,
>>
>> Using kref is preferable, i.e. option 1 above.
>>
>> Lucas, can you shed some light on,
>>
>> 1. In what way the current FIFO scheduling is unfair, and
>> 2. shed some details on this "scheduling algorithm with a bit
>> more fairness than the current one"? 
> 
> I don't have a specific implementation in mind yet. However the current
> FIFO algorithm can be very unfair if you have a sparse workload compete
> with one that generates a lot of jobs without any throttling aside from
> the entity queue length.

Ah, that's interesting, let's see, a "sparse workload compete with one that
generates a lot of jobs", so basically we have a sparse workload compete
with a dense workload. So we can represent this with two entities, A, B,
whose jobs we're going to represent by the entities, names A and B.
So if we let A be the sparse workload and B the dense workload,
we have this, wlog,

      First/oldest job, .........................., latter/new jobs.
Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, .....

The current FIFO algorithm, would prefer to execute those jobs
in order of submission, i.e. oldest-ready-first job. Assume
that all jobs are ready. Then we'll execute them in order.
This is desirable and fair. We want to execute the jobs
in the order they were submitted, given also that they are
ready to be executed. So perhaps we want to execute them like this:

      First/oldest job, .........................., latter/new jobs.
Subm: A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...
Time: t0,t1,t2,t3,t4,t5,t6,t7,t8,t9, ....
Exec:          A, B, B, B, B, B, A, B, B, B, B, B, A, B, B, B, B, B, A, ...   

Any other ordering would starve either A, or B. If we executed the 2nd A
job at t6 or t7, then that would starve the 3rd/4th job in B, since the 2nd A job
arrives at the same time as that of the 3rd B job, at time t6.
The time t3-t0 is some delta > 0, some initial scheduler-start up time.

IOW, we don't want to delay a job any more than it should wait--the oldest
job, which is also ready, should execute next, so that we're fair how
it executes in real time. We cannot boot B at t6, so that we execute A,
just because it is sparse, but just arrived.

From A's point of view, it shouldn't expect its job execution time distribution
to be any different than its submission time distribution.

Do you think there's a job permutation which offers a fairer scheduling
than the Exec line above for the Submission line above?

> By tracking the actual GPU time consumed by
> the entities we could implement something with a bit more fairness like
> deficit round robin (don't pin me on the specific algorithm, as I
> haven't given it much thought yet).

Since there's no preemption, this would be hard to achieve--you're at the mercy
of the execution time of job A_i for an entity A job i. (Assuming there's no
preemption as it is the current state of the GPU scheduler.)

The only thing you can do, is punish the next job from this entity, A_i+1,
to execute much later. However, you don't know how long A_i+1 would take. If A_i+1
takes very little time, then you're better off executing it at the next opportune
time, i.e. when it would normally execute. But such an algorithm, which doesn't
know a priori the execution time of a job, would punish A_i+1 to execute much later.

But if A_i+1 takes time as long or longer than A_i, then punishing it to execute much
later, would simply delay it, from an observer's point a view, it wouldn't teach
the context to submit smaller jobs, so that GPU sharing is more fair.

(Note that if we know the job's time a priori, we could do something like bin packing
to accommodate fair scheduling over the long run.)

One way to partially remedy the situation is parallelism. The more parallel execution
units (schedulers) you have, the more the alleviation. We'd get in trouble iff we get
all jobs executing in all schedulers, each taking a long time, with probability going
to 0 as you increase the parallel execution units (not considering a pathological
execution time distribution, where all jobs take a long time universally.)

Thinking about the FIFO discussion above: even if one job in a sparse-with-dense load
distributions from a number of context, takes a long long time to execute, the very next
job you'd want to execute is the oldest (the one who's been waiting to most) ready
job--why delay it any further--that'll starve it.
-- 
Regards,
Luben

