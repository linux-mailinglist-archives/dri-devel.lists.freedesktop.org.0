Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEF510C8D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 01:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2211A10E970;
	Tue, 26 Apr 2022 23:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6773210E970;
 Tue, 26 Apr 2022 23:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmxuqGKuOsVYsRRLZmdhl8Sg1djz4ocOgggmDfixMp6ks7WTgVm0yL0AYw2lD2YMDeDWI7jaNtGk7eFkt7gcGyawIGtCrpZVNmuUpJRssXUpas9DUVBLpvig099joY+onPBk1j/MBDN2a5Qi98NHIrTPlJ4NkrneyTRRkFCSx70TUpK/T+1vVACoM3ze5ilItrPPbl7gz66LwJuYyMZiVw+Y98nViQemPXN2n84OgKlgiDsYlrGP6vYS86UE/JtgDFx2AcKE1XfM2uq/rvdgJOTzgeRhchyyOFNxLi7wDQTZ05lgQxLgKzsMiU1ac9KMXIOEB1dEks5HlZmC5tK+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBiEJfSd6vOmrS5QAlNLG2M797NixEyA7FbmQPCNZlk=;
 b=NrDeoKObHp8lbc2EVOl0NVHNc8tomMuj6JCN+0oNERo6dQybG6nuY/G3rPshwoXdBSW5qvh7v0hwku2esUwCWvadd2Fc2vYzoKv0K2end4MD000uqVlJKITphSQ5jFicimPMp7QF5uBrBGZAcO0dtmGSemPg7s5LoPY39ArAn1WVDvBWuz59ueN0YqsiH0RZINzJcw8OgGWBEbRpPrK/pLE+Z9iPN19SN1GdxpoBYsxoVGKQVLz9panwYid6088KaH7jzE5L4CVkO4wHWX8K2vARbbbdOSGRDz9zTDxntFkBkax4iYPxtFkZFZ/GdwxPz16fmfBL2GfHZJUuSFvGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBiEJfSd6vOmrS5QAlNLG2M797NixEyA7FbmQPCNZlk=;
 b=Q/VVEK0Q+iFA80gyIFniKpN5dlh96Bqto6J3kbbKiSpqWaJjNyQszQwZGquBlrzC5xPEGu9o9qD3r/oO04J0QjnyoSQ61kxYeSLJzhBrsSFpDLvPu+/04pA1GfJoUL0FA6FXtvbTD2ko4NhWLwdSa8ZHk1NaS0S+Q1sZN0lKlV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 23:20:09 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 23:20:09 +0000
Message-ID: <72430dd0-a053-17a2-06e8-65d34f21d01d@amd.com>
Date: Tue, 26 Apr 2022 10:48:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gpu: drm: remove redundant dma_fence_put() when
 drm_sched_job_add_dependency() fails
Content-Language: en-US
To: Hangyu Hua <hbh25y@gmail.com>, yuq825@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220425083645.25922-1-hbh25y@gmail.com>
 <b7d8956e-5ac6-8200-d8b1-4ce828f04665@amd.com>
 <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <79b198d0-eff2-d658-4b5e-9084a834fc93@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faf3b28c-ec2c-4b12-b886-08da27db4df2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390F1BE0A0A6016904E3BFEEAFB9@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fR3fsdquHXDs0GurwGkLshcyQbu+TTe6c4dtpMVil8I3SOdiguv2y0W+zWEjTGHZX4gxkaeaU1Bu1yS3AQfsfEZ+aVKR7vyVMI+3PzIzJDFMK7Qs0IXnyoN7k+1s7sQGNIUjPa1kv4RAMQWwaY7xyqzUhsFjz8PnFapwq5NzBlq4DYaFnrCtx3K+n1ve2534Bq4LMdZz3Q3nNuLpkYaWRLZvnsZFj87WSED4/pE7eydvylfz7IBzJBQon9Tn1ZIopvGrwHysnn2wjTEJdGkVFZ7noQpzVx7gf7pV1NCS8F5csRRvffO1ROpKqL7F1keWMHMgLd1ajQEETxut7PU5D1EdwNJKpfZnmCB8I1L2qYahDAHo7q17T3PuXqSlfpDR2+aN4h+L9WYE4tmVMly1eSicDURFyr2YglimE5lD+q/mV0vJtw2MI1tLv1Gk5NzkY+D02G4337s85wKwo4KyOFfRjtLOCxzTQHjownxJFhHlwBZeFcGAmEy9p7gqXklqz3JDsGEZqGBZvaPM7ITM0aowSJHUCVh5P8HSZISHoRqnSvORWilTq6ROHIEi0zma6pjYIKA8B0htWxc2Y1fzEE12fXPDh5zx7h/+zwel1UfkAGctFubivgfG39G+FJscHoB4LRo8cJ1sdJZ+HIjCxmFB7whj5hhqkqcg1nL+UGSJ5jElJcZsegse9l1NfajWof4ixsenmYi2eQjSLAgK3yF5EJuE6GdbLUI9T8HPxuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6486002)(316002)(66556008)(66476007)(8676002)(2616005)(86362001)(508600001)(6512007)(66946007)(6666004)(4326008)(53546011)(31696002)(5660300002)(8936002)(6506007)(83380400001)(36756003)(31686004)(44832011)(186003)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzYxZVNUaFNrV0R5UVoyWE4wMllqYnlCWERTdlN4bi9RcDFkSzlyWGZyWnVC?=
 =?utf-8?B?ZXZya2pXZ0FwR1FqelNqaW9XeVFZYldteFFoYXI3eExyVTFETE9sRHlDbjZB?=
 =?utf-8?B?alRGS0lld3djU0FmNlowSFQ5U2pxVTAwY1JNb3JqU2pUN3FpTDR2NjBEOG9s?=
 =?utf-8?B?L0NuT1QrQTVFZ2tjcFNXc2tkb1VjV1pUOW5FMFVOWHpoeVZ1QU82YVRrUzFK?=
 =?utf-8?B?ZnhteUtobmlQQm1qUnkxVEpER1hGKytZU0NwOWNIS1c5OTRwNUlDd1BJVXR6?=
 =?utf-8?B?Q1ZTcVlkb2VBbEdnSWxnTE54SkhMK2hVY3FhaUVJcnlBTldVODRsNXBmeGgr?=
 =?utf-8?B?ajlvSjVzU0tjOEw5eHdvNlpzQU9CTytLSlNDeE5JdDIzL0ZPNTNLZTBtUlRX?=
 =?utf-8?B?WWdSbWVDYkJDRnZHYllqbXJiMjlFQ3RqNlBqcVFUZkllbVhzVzVZcXpjR1N5?=
 =?utf-8?B?emIrYUphSTRLNERPYXQzMmEvRW4xQ25tSXRhVUdhUjl4czZOeUhZc0h3SEZL?=
 =?utf-8?B?dHdOVWVKMlJuUW1QUU9mZFRKYXpaNytoQ0FSTUpZeU9PWXdyZnpYVDdaTHZx?=
 =?utf-8?B?eVdQekJFNldFZDgvQ29palF5QjNuQys3b2VMNTFOSXJGWXgvTTFOWkhBNmVq?=
 =?utf-8?B?bnd5VTBjWHo5SmFXREFxcTIvNm1XblFLQ1o4YlY4ZW94enNna3RHZUFyZ3Fp?=
 =?utf-8?B?UW5GbDFYaWlpVHhyMXRFMStyQXRjb1NscUxkRVBzUlI4aDA1cmVtenJSYmtM?=
 =?utf-8?B?cFJYZ2h1T2ppQ3E4empWeWJac1d0WDZBZDdQbU9GbzR4TFdncDcvZ3I2Y0ly?=
 =?utf-8?B?NjY2NFVjOVdYM3p6bGQ2NGJXdjJ4WEU1QlNNVEhId1ltc1BiUTc3SThPc2pS?=
 =?utf-8?B?MmdpMDBvQ2tldjV2SjZWVlpHODRSeDF1em45ckw0aUtqZWFEcDluTGxrRG16?=
 =?utf-8?B?OTI5Qm44V1NOOVJtM0U5Z2Q1a2JtTXR1NjZFaFhITm5BVUxDSGtvdmdJd3dD?=
 =?utf-8?B?ZkFURTg3SWJONVNla3d0TnYzb2Zld3VlZFU5M0FaVkpjenE1RU02M01DSGhJ?=
 =?utf-8?B?WmpPOXp4Nm4xYkt2RnBNNXRQay9YQTZLa3RHcUw5K2o4amh0ZDVqbUhOM1dm?=
 =?utf-8?B?MTlha0hLejZWemdCTjQ5dHRPWnRzbEluY0ZYUENvN1VxZjZKVm1wZVVETmlp?=
 =?utf-8?B?RGZwTTdsUEdBbHlqWWxXRHlicUJORjNoS1hNUDB0NnVwTTJpc1J3dGhnRUdE?=
 =?utf-8?B?UnVTSnR5L1pROFNQWUwwNy9FZWd2czh3NTJuNk0vRnRQMlozN0hLSi9PeWxU?=
 =?utf-8?B?Y3JVSHVWRGNjdUp5aG1Gem9ablRsaThFTGN6MVMrQTNTc2tWNzBob3p4WXdr?=
 =?utf-8?B?bjN0T3Z0cmlnMXlrMzVPVWc0a0wwQ2ZYSkd2M09sbFBkK24vVmxUVE4raUh4?=
 =?utf-8?B?UkxON1RBdEFZUU0zdklHWWhDOVNuaXFrYlduYW1qQ2xNUGNUTmVqWDIyRFFv?=
 =?utf-8?B?emVWMk15SEtlbVFqd2F4b1dKaldRRWU1VDY4VFRSWUlyanhkdnJwNWUwOXk1?=
 =?utf-8?B?bG13UVpkSnprOG1HUVo0MWlydEk4cXFFQk9DTURqakVTNjNzeEFkOGUxaWda?=
 =?utf-8?B?OVJZa1l0Sm5IczNITVlqMXBFNC9SVEdpRm1SMWpnVXVieUtyd1Brc3hoVHEy?=
 =?utf-8?B?OTlEN3JzL2Q5eS9lRk5NMkJjWkRXbkZ2N3lKMTloTzF2ak1RU1VPOUJrUFNN?=
 =?utf-8?B?M1R2dkErbVpNSDFvMUx5MFgzWm9UeTVtK1o1MG5wZWhpYjc1UDZGWndrTDBh?=
 =?utf-8?B?bERsZHVzVTE1TDJoeXVUWnQ0bGVRcXl2RHN0eFVOWFhqcUUyS0NiOVpzTHBp?=
 =?utf-8?B?dVlDODZRK0dvMGMramlLL29KVnFMdEhLN1VkZFNSNTNoMlQxL1I4a293cm5x?=
 =?utf-8?B?MTRJdmJjVjVRQUIyVE9zQkdYUnFXVnY1ZGJTWElNOFBqbUJXUU0wQ2ptMWhV?=
 =?utf-8?B?dG9IODFGMHhiNmc1TkxIN3ZSSG9ValVqeVllTTZPMzdYTkNSb2t2bHdsQ1p5?=
 =?utf-8?B?MHczRURURSt2eDEvVXoxYXFHWVBONDZ0Q1Y4Z1BhUy81RndiTDdXa1BNWEVl?=
 =?utf-8?B?Vk91Z2o3RUJwelRaQUNBbU9uMGp2ajJGWUIzcTg2a3k1MWJ6OGVhQmpoZ0Na?=
 =?utf-8?B?a1N0UGg5U0xHeEUwNThmSitHRStWRXRrQmVwU3BIS04yYnhNWTlXQ1BEWmZL?=
 =?utf-8?B?ZkdHS1RXQXVka0RLUVNJbkhodWFzU2lOQy9KRXAwVDVhelRIVUR4eE4rNTFZ?=
 =?utf-8?B?eDhjZXZ4czZkcmNMZDVyUlQvbTF5SUpTeEtGUHEwL0UxSS9MRTFvamVwSEJV?=
 =?utf-8?Q?a9mLtgeLoeLsehpb0B4ZnMCrV84T8MHFu812G8mJiZ8H+?=
X-MS-Exchange-AntiSpam-MessageData-1: +fga+mm6hhAIHA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf3b28c-ec2c-4b12-b886-08da27db4df2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 23:20:08.8857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13AiYfWsZ+r9NDnrV3sAa2qchZkULASNGSHTSHgH96XKyrAACGyhc7b8VCwYoJyuC9hhqTXdwPYip5BInj7qRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-04-25 22:54, Hangyu Hua wrote:
> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>
>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will be 
>>> called
>>> internally. Calling it again after drm_sched_job_add_dependency() 
>>> finishes
>>> may result in a dangling pointer.
>>>
>>> Fix this by removing redundant dma_fence_put().
>>>
>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>> ---
>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>   2 files changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>> b/drivers/gpu/drm/lima/lima_gem.c
>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>> *file, struct lima_submit *submit)
>>>           err = drm_sched_job_add_dependency(&submit->task->base, 
>>> fence);
>>>           if (err) {
>>> -            dma_fence_put(fence);
>>>               return err;
>>
>>
>> Makes sense here
>>
>>
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -708,7 +708,6 @@ int 
>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>           dma_fence_get(fence);
>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>           if (ret) {
>>> -            dma_fence_put(fence);
>>
>>
>>
>> Not sure about this one since if you look at the relevant commits -
>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>> You will see that the dma_fence_put here balances the extra 
>> dma_fence_get
>> above
>>
>> Andrey
>>
>
> I don't think so. I checked the call chain and found no additional 
> dma_fence_get(). But dma_fence_get() needs to be called before 
> drm_sched_job_add_dependency() to keep the counter balanced. 


I didn't say there is an additional dma_fence_get , from what I 
understand here drm_sched_job_add_implicit_dependencies->dma_fence_get 
is not balancing any counter but rather grabs an extra reference to 
account for adding the fence to the job's dependency array, and so when 
adding fails then you call dma_fence_put to decrement the count back. 
This makes sense because drm_sched_job_add_dependency doesn't increment 
himself refcount for the fences

> On the other hand, dma_fence_get() and dma_fence_put() are meaningless 
> here if threre is an extra dma_fence_get() beacause counter will not 
> decrease to 0 during drm_sched_job_add_dependency().


Where is the extra dma_fence_get() ?


>
> I check the call chain as follows:
>
> msm_ioctl_gem_submit()
> -> submit_fence_sync()
> -> drm_sched_job_add_implicit_dependencies()


Could you maybe print the buggy refcount sequence you say you discovered 
as an example ? Because I fail to follow where is the problem.

Andrey


>
> Thanks,
> Hangyu
>
>>
>>>               return ret;
>>>           }
>>>       }
