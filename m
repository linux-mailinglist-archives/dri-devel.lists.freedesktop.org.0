Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3951384A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 17:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF1E10E6EF;
	Thu, 28 Apr 2022 15:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F810E624;
 Thu, 28 Apr 2022 15:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBu2+TPDrUdJZXDJ3qZcmf2FiV7inJmk66WQHVkoA34I5jcbFuzPmlKr0eJ2UQeMz4iftGJ5WuV6NI4whKSIrPbojE4pn/ditfFlylIscCIm5M9SJxAyNAKE9QgszOlbRdpAeqOEalckwNW4LtNrVZc1OqPmFB3B9JuFrDpIdY1pzXmdB1kdByQpRycNWx2M5fG03Yux72cvXkzWWKpzerLax7KvHjpyDoA8CtSBuXQRh7nFla6HoVyWm6Dypeq/U8mKv750br3aKGFBc2KDFzg269Q8ZQ1g/YCt5cCBECcq62WYz5Hqoh+fD8BL02kIMedGc38OxSFCQoynP7sUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X824XzM1AIfa3WEy8ZG+zZTg5eFi6EQRwCtLvtHu1QY=;
 b=WazCElZE+clQkIDUwGdrtnobuKPmBjiIMhqOej5knS/SZOP0KSbilpF/Z45bfxWsl85ebT1tfeUyKj6CvYHm0gsCCqFqG9Y+vwZDC+FvfiJlk3PAxdCVSojH+JvG/WvBwO5nLHE2AaK0S349Vid8wVl24RmQkCPKgi7mUGBZQLoBJji/JQQ01q4sjaztzY+72TfiQGWaEjFHkA4iy/eMBbiRtYlB1JkDVvf0PlJOhTpeEPgw+wWOQ03D0vl/PKJHQHz9j0+w568XOq5CSrYvaJAh18OHWQMtk1PR59TQdT8RJRkYUfynx0JmEB3PuYg2+HyBeNf46i0Zk7fGFx6j8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X824XzM1AIfa3WEy8ZG+zZTg5eFi6EQRwCtLvtHu1QY=;
 b=ulB2rnp06R8lKfqsmZ/yeOOuPlVjvdzLXIIPqRtGPdIqY4qodx06rtR87eC8IUeSuv5d9ggMOz0S+avW+o52nerLisjl++pbsoPk8LObYnmZT1TJDem7kmOrQJNtRELB2F4rngNIKCKnpNQeidOURZ2sMmfgJ8VBojlw5TKiZ/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by SA0PR12MB4544.namprd12.prod.outlook.com (2603:10b6:806:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 15:27:12 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 15:27:11 +0000
Message-ID: <9b91e06c-50fd-b567-7d2b-a2597d01c4dc@amd.com>
Date: Thu, 28 Apr 2022 11:27:08 -0400
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
 <e26e6ef8-6665-0b9d-804f-cf107f1788d4@amd.com>
 <88dd5d67-7dd5-2f58-5254-adaa941deb0f@gmail.com>
 <65b6cc23-1a77-7df0-5768-f81cd03b6514@amd.com>
 <d0790635-4b2e-cd58-0a51-36427800b39c@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <d0790635-4b2e-cd58-0a51-36427800b39c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::35) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e020ec24-1642-4f30-db3f-08da292b90b3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4544:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB45447062E4C63C9AA8506D94EAFD9@SA0PR12MB4544.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EX7kpbVnVvNkCy3ToPgebo8ZXrh89TtWNtEbufS+RwXkeb6DmWoe6CqzOnumDiujbw9eMN0T0UMuqh2mIwpkUwqWB+CqLdRmRgPbgLAYzzze7u6PrrYqkdhCJbDidYMPo+lY1+nkubfCE1NqYgxxuVMxRe9mgCnBfEyAlRejdnX8XkwbfE47TcVj8Bvzd+knqqXS3bIuOMphSeUDYM0AV/dUW9uGJiSEM28QUrN5Y2Ca2ZzbQEAnGQ/A98xxPIL6wT4z8LCpHlneSzdvRfDUCgXFIyFwRAr+XhOAX3XJjvQyFY77QQ+ptj+kcu1vbS7ixFr+L5LlUg9cWc/E3l5lrMOOonOEUVJo9k7Vhic3py8xUTTM3JVWM3e07mBbDbDED2C6J4gafSC3eesf5mPs5IMjxUv7VglhxtmXzdCQcnK3gRhjBhQIfcxqIptq/8B5gMhU16utmOpwQpd2qJ7tpY4hsnY5bqmTg9exda3YFr2v5kxdPGk8wuGmrBtLNYhEZ/LIkaEZPvhunHH5gB+bF70/3oMXvFlBawC6/wk5Qr8ed3Zw7TdY+24TsVrJK7FqK0Pce7Y5vBqdiWPQKDTKkk5PqPqO5zr7ZAlMW2z7vwJo4HaA9qx6KHGKCxlO5UtXa/U46+IVFPXlA5sbUYSAAwlE+e5AwdvQV0b+vJSHc5J55ou11KwXh+ddcXcqY4tJ0hNzodvPaX0bUmLw8kO6ADCAi2v/8Sow+pFPhEcQXlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66556008)(66946007)(66476007)(53546011)(38100700002)(6512007)(6506007)(6666004)(44832011)(2906002)(8936002)(83380400001)(4326008)(6486002)(31686004)(508600001)(8676002)(36756003)(86362001)(31696002)(2616005)(186003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRucC9WQlFCSlFwOW5md3U3eXdSQ0RtSENiK3p6NlVaUmFZaWlKV2NoRlhL?=
 =?utf-8?B?TU9BZ2RzTFhMeGtZdGVDai9tSGxjSWZjNmN3cEl5cFN2SENTSkRHVmdSWGF4?=
 =?utf-8?B?U0NDSlF4UEtLb3dZaDJxd3F3TEZwWGxSb1hyeE5PVnUwZkhRRE1jd2Y2TzV2?=
 =?utf-8?B?VlhUVFMwNXNOVmgzOFBWTjh4b2trOXc4VHEwU0doUDNSN01PaXlEYjU2a2NC?=
 =?utf-8?B?VlRvcE5zcmxyb2t5QzNNeUQ2WlduN2tReHVuZHVxTENmRGI1S2NVSlVtUlZm?=
 =?utf-8?B?UDE1L3F0TE1Oc3NFbTI5SnY5QlRjbkVVK0Q0V0RZQnFJWElKakhvQVBibWdP?=
 =?utf-8?B?QXZKdzdkSzFuM1hpanVMY29ldW5zNXlZbmVZaFl4OU1PMUZ4VGk0c1o5Kzgx?=
 =?utf-8?B?bjZuaU1FaWxoWGJJZDVmK0NCNGVFMXVoMEVwNXdGbHdiVnpRTUZ3c2RtNnh0?=
 =?utf-8?B?T3BYSDZBMThLK1I2QlhhM0pOTHoycWhXdEZ5TkQ0bXZJMHJMeUl2V0RUOE05?=
 =?utf-8?B?UWk1bVp5WmphSElkODhBMk04MHVxdXhsNnFoUUlPUzc0R1ZxNHlNV1phaStD?=
 =?utf-8?B?WUFqcS9heUZndk9PWTZrT0pKUFZrZlpESUF5eXJpYXlBZWt2cmpaNDEwNFVn?=
 =?utf-8?B?RkZHVkNUaW9KSGJwb2hTL0NiV1RSaDZ1SG56MUVFUndFL2h3S25JY1lEczF5?=
 =?utf-8?B?Q21pOWhsaGlSUStRVG1rcCtlQ1ltYUNuOXM0TVJ2ZEtjM2FoT2VrT3Nrb1h1?=
 =?utf-8?B?bjMySXpiT3RSSTIyV0ErK2dIWXU4ZFJyT3NFcnNwZzVGaytacGEwN1VPTk84?=
 =?utf-8?B?NElXMVVQZDU1TS8xOERqK3B5RzYwRXZYNENJOXNKSFZrb3NaRWJ1NDkrL3BW?=
 =?utf-8?B?VkZmbnpjemlha1JVSk9JM2s5YjNtYkdmRFRucXVFR1ZVcmN4S3NHeEVOZ25l?=
 =?utf-8?B?UU5nS05zeWtPdkI1aXJCNldEdVVCQTRKZFFGcytIcXNSV2FkQ3p2K210NXNu?=
 =?utf-8?B?T0tkYVhnZ1Frd0FxU2k1TWp6TmlFbVNOZlk1VGswY2xWUnl1KytsbzBUUU13?=
 =?utf-8?B?TUFWVkpIeFRUWWxDeXUvZGpuSVM1SWdVd0xMK3d5cUlSOGF1NTFCcWZVK1kx?=
 =?utf-8?B?dkNlTkR0bjUvNzNQNVN6ZkcrZFFhUjkrWEJzYXk1QUV1bEpBd21aZHRoSDhv?=
 =?utf-8?B?UnlFaEVLMkZwQi9hc1BrY3JhUmkrRDJlQ0RKRzFKOTQyUGllRndUY0ZJVlhO?=
 =?utf-8?B?ZUlJS2dFZkVuenVEVVBhS2toc3lSVlhrelFtV0JMaCtNUDRoUVdXZXluL2px?=
 =?utf-8?B?UklRNlJuWVo4VDQ1Smx1WlRlMTVOTk1UNFdURTU0RGlZWXZQa1VFSWxNR2lo?=
 =?utf-8?B?WDVsTjA3cHdxMnd0NnlGQ2s2N2tFd3pzazJHRWZaQ01JbllhL0w4VWdxcmJx?=
 =?utf-8?B?Q3pkY3p3QklaY3hZMEVJRDhrbkQ2YjhYbWJaVFhidHV0LzF1K1hxN1BNc25J?=
 =?utf-8?B?UHBaQkN6V2wxNDB6dmFBaC8wWTB3VWsvQkYvaDhMc0hLd0pxdGVmTUp1UWZa?=
 =?utf-8?B?SFQxaHdUemlZTVJ6WU9XaW8vM3ZuR1RHZ0Q1WW1taklTZnNtKy9HcDE1cksy?=
 =?utf-8?B?a281N2lHeHFneCszcndodmxMNlF2RU11SmJmSGFLQm55M1ZvNGNGMVVpeVhZ?=
 =?utf-8?B?S0M2d2Z3SjdaOEk1RGdzSURvVmhhK2dBdFhkOGpGYjJzVzJuYUc0cFdUVU9v?=
 =?utf-8?B?TXI5dEdIRVY5QXZBV1NIMWx5SEhVbk9uN1VPOVkzYjdxYS81MjBKNWxQMlRm?=
 =?utf-8?B?bWFaVjZlci9XZThaV2R4aVVyb1Q4VERDVzZIbFdrTHBvd09LS2MvOHJ1cm1v?=
 =?utf-8?B?R3Axd2JGdjM4bEsvUE9QaXlzcHJWRGxtMHdIemVKUVJIUmJOd2pWcTluOHVF?=
 =?utf-8?B?RHlTbGhXVklVTmljM1NRc0pmRFhMVFNoNG5JWkd4TUp0SFN4Yzg2NGpDaUlP?=
 =?utf-8?B?NmlTczhOdDhJeno0dWhtTkN6QkhwUitIaTI3L2d3NlhKRE1DbDFkN0tCYkVH?=
 =?utf-8?B?N1pyWmQwQk50YysvWFlEWnpOR3BuQzYzUTIvakg0eWo4QXBYdVd2aWI5YzBm?=
 =?utf-8?B?TTJBeE9jNU9PTjVUdHhFTTdnRVlSV0RyYkVHWXVvSHVPL2JjckdZNDJjeWts?=
 =?utf-8?B?YlB6a1ExNFNRMytHQUJaS09vOGJkcHJHRFRMS0RTVlZvSWd2S1VwaytoS3Nr?=
 =?utf-8?B?UHptNUUwSktPb29wRTFWN0xJRzZPek1wazRjRjEzMjFIQ0ovcEVKRnZoZ3RV?=
 =?utf-8?B?Q3FmSFNBQXRwbU8wMjB6LzJxV3QxRjdEVE1KdVJZaUdBNWZkbDhMQUdsWVFS?=
 =?utf-8?Q?SYDXSf2D2ORucNTPVo/nN4podSI4jKirPQ563yZrKP4SH?=
X-MS-Exchange-AntiSpam-MessageData-1: 4GndYx4jPrUc6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e020ec24-1642-4f30-db3f-08da292b90b3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 15:27:11.8134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljgeRZvT/lkcFqX/zGAWJ2get/S5jtmfARSz78qALN1qvokIVLmjFWq9O5CFIlv3Nqmc7H2hAsk7ppgYUHufHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4544
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


On 2022-04-28 04:56, Hangyu Hua wrote:
> On 2022/4/27 22:43, Andrey Grodzovsky wrote:
>>
>> On 2022-04-26 22:31, Hangyu Hua wrote:
>>> On 2022/4/26 22:55, Andrey Grodzovsky wrote:
>>>>
>>>> On 2022-04-25 22:54, Hangyu Hua wrote:
>>>>> On 2022/4/25 23:42, Andrey Grodzovsky wrote:
>>>>>> On 2022-04-25 04:36, Hangyu Hua wrote:
>>>>>>
>>>>>>> When drm_sched_job_add_dependency() fails, dma_fence_put() will 
>>>>>>> be called
>>>>>>> internally. Calling it again after 
>>>>>>> drm_sched_job_add_dependency() finishes
>>>>>>> may result in a dangling pointer.
>>>>>>>
>>>>>>> Fix this by removing redundant dma_fence_put().
>>>>>>>
>>>>>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/lima/lima_gem.c        | 1 -
>>>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 1 -
>>>>>>>   2 files changed, 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c 
>>>>>>> b/drivers/gpu/drm/lima/lima_gem.c
>>>>>>> index 55bb1ec3c4f7..99c8e7f6bb1c 100644
>>>>>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>>>>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>>>>>> @@ -291,7 +291,6 @@ static int lima_gem_add_deps(struct drm_file 
>>>>>>> *file, struct lima_submit *submit)
>>>>>>>           err = 
>>>>>>> drm_sched_job_add_dependency(&submit->task->base, fence);
>>>>>>>           if (err) {
>>>>>>> -            dma_fence_put(fence);
>>>>>>>               return err;
>>>>>>
>>>>>>
>>>>>> Makes sense here
>>>>>>
>>>>>>
>>>>>>>           }
>>>>>>>       }
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index b81fceb0b8a2..ebab9eca37a8 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -708,7 +708,6 @@ int 
>>>>>>> drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>>>>>           dma_fence_get(fence);
>>>>>>>           ret = drm_sched_job_add_dependency(job, fence);
>>>>>>>           if (ret) {
>>>>>>> -            dma_fence_put(fence);
>>>>>>
>>>>>>
>>>>>>
>>>>>> Not sure about this one since if you look at the relevant commits -
>>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies' and
>>>>>> 'drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder'
>>>>>> You will see that the dma_fence_put here balances the extra 
>>>>>> dma_fence_get
>>>>>> above
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>
>>>>> I don't think so. I checked the call chain and found no additional 
>>>>> dma_fence_get(). But dma_fence_get() needs to be called before 
>>>>> drm_sched_job_add_dependency() to keep the counter balanced. 
>>>>
>>>>
>>>> I don't say there is an additional get, I just say that 
>>>> drm_sched_job_add_dependency doesn't grab an extra reference to the 
>>>> fences it stores so this needs to be done outside and for that
>>>> drm_sched_job_add_implicit_dependencies->dma_fence_get is called 
>>>> and, if this addition fails you just call dma_fence_put to keep the 
>>>> counter balanced.
>>>>
>>>
>>> drm_sched_job_add_implicit_dependencies() will call 
>>> drm_sched_job_add_dependency(). And drm_sched_job_add_dependency() 
>>> already call dma_fence_put() when it fails. Calling dma_fence_put() 
>>> twice doesn't make sense.
>>>
>>> dma_fence_get() is in [2]. But dma_fence_put() will be called in [1] 
>>> and [3] when xa_alloc() fails.
>>
>>
>> The way I see it, [2] and [3] are mat matching *get* and *put* 
>> respectively. [1] *put* is against the original 
>> dma_fence_init->kref_init of the fence which always set the refcount 
>> at 1.
>> Also in support of this see commit 'drm/scheduler: fix 
>> drm_sched_job_add_implicit_dependencies harder' - it says there 
>> "drm_sched_job_add_dependency() could drop the last ref"  - this last 
>> ref is the original refcount set by dma_fence_init->kref
>>
>> Andrey
>
>
> You can see that drm_sched_job_add_dependency() has three return paths 
> they are [4], [5] and [1]. [4] and [5] will return 0. [1] will return 
> error.
>
> There will be three weird problems if you're right:
>
> 1. [5] path will triger a refcount leak beacause ret is 0 in *if*[6]. 


Terminology confusion issue - [5] is a 'put' so it cannot cause a leak 
by definition, extra unbalanced 'get' will cause a leak because memory 
is never released, extra put will just probably cause a warning in 
kref_put or maybe double free.


> Otherwise [2] and [5] are matching *get* and *put* in here.


Exactly, they are matching - so until this point all good and no 'leak' 
then, no ?


>
> 2. [4] path need a additional dma_fence_get() to adds the fence as a 
> job dependency. fence is from obj->resv. Taking msm as an example 
> obj->resv is from etnaviv_ioctl_gem_submit()->submit_lookup_objects(). 
> It is not possible that an object has *refcount == 1* but is 
> referenced in two places. So dma_fence_get() called in [2] is for [4]. 
> By the way, [3] don't execute in this case.


Still don't see the problem - [2] is the additional dma_fence_get() you 
need here (just as you say above).


>
> 3. This one is a doubt. You can see in "[PATCH] drm/scheduler: fix 
> drm_sched_job_add_implicit_dependencies harder". 
> drm_sched_job_add_dependency() could drop the last ref, so we need to do
> the dma_fence_get() first. But the last ref still will drop in [3] if 
> drm_sched_job_add_dependency() go path [1]. And there is only a 
> *return* between [1] and [3]. Is this necessary? I think Rob Clark 
> wants to avoid the last ref being dropped in 
> drm_sched_job_add_implicit_dependencies() because fence is still used 
> by obj->resv.


In the scenario above - if we go thorough path [1] refcount before [1] 
starts is 2 - one from original kref_init and one from [2] and so it's 
balanced against 2 puts (one from [1] and one from [3]) so I still don't 
see a problem.

I suggest that you give a specific scenario  from fence ref-count 
perspective that your patch fixes. I might be wrong but unless you give 
a specific case where the 'put' in [3] is redundant I just can't see it.

Andrey


>
>
> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>                                  struct dma_fence *fence)
> {
>         ...
>         xa_for_each(&job->dependencies, index, entry) {
>                 if (entry->context != fence->context)
>                         continue;
>
>                 if (dma_fence_is_later(fence, entry)) {
>                         dma_fence_put(entry);
>                         xa_store(&job->dependencies, index, fence, 
> GFP_KERNEL);    <---- [4]
>                 } else {
>                         dma_fence_put(fence);    <---- [5]
>                 }
>                 return 0;
>         }
>
>         ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
> GFP_KERNEL);
>         if (ret != 0)
>                 dma_fence_put(fence);   <---- [1]
>
>         return ret;
> }
>
>
> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>                                             struct drm_gem_object *obj,
>                                             bool write)
> {
>         struct dma_resv_iter cursor;
>         struct dma_fence *fence;
>         int ret;
>
>         dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>                 /* Make sure to grab an additional ref on the added 
> fence */
>                 dma_fence_get(fence);   <---- [2]
>                 ret = drm_sched_job_add_dependency(job, fence);
>                 if (ret) {      <---- [6]
>                         dma_fence_put(fence);   <---- [3]
>
>                         return ret;
>                 }
>         }
>         return 0;
> }
>
> Thanks,
> hangyu
>
>>
>>>
>>>
>>> int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>                  struct dma_fence *fence)
>>> {
>>>     ...
>>>     ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, 
>>> GFP_KERNEL);
>>>     if (ret != 0)
>>>         dma_fence_put(fence);    <--- [1]
>>>
>>>     return ret;
>>> }
>>> EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>>
>>>
>>> int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>                         struct drm_gem_object *obj,
>>>                         bool write)
>>> {
>>>     struct dma_resv_iter cursor;
>>>     struct dma_fence *fence;
>>>     int ret;
>>>
>>>     dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>>         /* Make sure to grab an additional ref on the added fence */
>>>         dma_fence_get(fence);    <--- [2]
>>>         ret = drm_sched_job_add_dependency(job, fence);
>>>         if (ret) {
>>>             dma_fence_put(fence);    <--- [3]
>>>             return ret;
>>>         }
>>>     }
>>>     return 0;
>>> }
>>>
>>>
>>>>
>>>>> On the other hand, dma_fence_get() and dma_fence_put() are 
>>>>> meaningless here if threre is an extra dma_fence_get() beacause 
>>>>> counter will not decrease to 0 during drm_sched_job_add_dependency().
>>>>>
>>>>> I check the call chain as follows:
>>>>>
>>>>> msm_ioctl_gem_submit()
>>>>> -> submit_fence_sync()
>>>>> -> drm_sched_job_add_implicit_dependencies()
>>>>
>>>>
>>>> Can you maybe trace or print one such example of problematic 
>>>> refcount that you are trying to fix ? I still don't see where is 
>>>> the problem.
>>>>
>>>> Andrey
>>>>
>>>
>>> I also wish I could. System logs can make this easy. But i don't 
>>> have a corresponding GPU physical device. 
>>> drm_sched_job_add_implicit_dependencies is only used in a few devices.
>>>
>>> Thanks.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Hangyu
>>>>>
>>>>>>
>>>>>>>               return ret;
>>>>>>>           }
>>>>>>>       }
