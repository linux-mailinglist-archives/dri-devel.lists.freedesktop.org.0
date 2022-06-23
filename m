Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0D558A93
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 23:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2FD10E7B2;
	Thu, 23 Jun 2022 21:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA0310E7B2;
 Thu, 23 Jun 2022 21:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnMbUBy0dVfKrAIEDip/jVR3I5jhhDkg7kt/mGh3c3+66n2Gy9mZjoI6ajZIPXm10CkYhbPKPSXLgo3rCXpQzZXurERyH4iJfEVlKTkbhli+BPgBBBMLpPudH+E7e0miyEVWfPUlvSXfKY0uIVpHDABGs4s7gkSn/J9o2pQ8biU0bz7P6f23iowhKHrHI9ZNGJLEEa4icdd9j+yDDxIDlTXlclI4RiCUGdupXIhphl2jKri0p2IEtN3+psIx0eENUhzOQaolP66E33tVFXsSf6eX0AwqMWI4oGqvEPw7mt6eFq55dWrIEz6ayWMB7OF2xNSqHKztfgkj4c+s9JFfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww9gSPQidG8pV0pli6ijrw5CHtXLnB0mI8cJLBKAwdk=;
 b=fVnzfDzf3RzLC4f4giDWv8vhcmSVK9nKcdvW1PXscHfCNvD14jlak5xa45n6NQIkfPfIHiwHQFqNsoxniTjE29LWlkY0HuPPP5Zg5Zzv+Lma30bGvmsd9BtpTsf2djTOOPJdm3my2wttzpNHhecP4+mF/BqaGom1IqH3qRXLlkOkk4k5IWiBTI62+3rF5/1XxUcaZliepjyoM5sqHF8u0uocj5R18HM3Q17kzH0FOLSiQQoGn+ytfZG4OHaXJlpenVgT0zX3/x7PR78Rn0rWNMZ8xOWB+6naGMqaHk8jY7GxDBR0N5Hp1ChMbHx5Xhk44Shp3o+P3vy+HIxTsknpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww9gSPQidG8pV0pli6ijrw5CHtXLnB0mI8cJLBKAwdk=;
 b=b78JvHsi5y6H405PWBkY8g8Qwz/BwX2aWAb7zp5eH4GXNzqpzd0ZqI0vjvi4mXR5FjPKQapXMDTyXCt1srYczPkaXM8AayNokIJ/xM65r8x7o8KED1KBaydX6/4AJuH4OANvVquxDyjYg/tmz5vUnhaLNMSHRVtX2VBQGWatnhc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3276.namprd12.prod.outlook.com (2603:10b6:5:15e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 21:18:20 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 21:18:20 +0000
Message-ID: <32e06ffd-a551-a05b-7993-1b6901455a21@amd.com>
Date: Thu, 23 Jun 2022 17:18:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
 <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
 <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
 <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
 <445f2db4-5496-4003-c5fa-3605aef2c33d@amd.com>
 <16353a69-64e1-2f1c-8859-8000ac6266ce@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <16353a69-64e1-2f1c-8859-8000ac6266ce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::32) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d163833e-8b29-43ea-c3d9-08da555de5bf
X-MS-TrafficTypeDiagnostic: DM6PR12MB3276:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQmoxOLSrgpVGdQdq8EjDBMvBT0bGkHiNLjC7VmR0CtAv0p6HsJNpXPnMgPnTaDGnMSjo1VHqOXT4KiCNLJmEVfoDvVQYQujaalGRMheIwwGZLb+w++FZ+BM49ia498orTZZd1HQ+mu2inyafb5BubBQ5wQIagC7FUgr002ILf5uPiM9DlLsq8Aqx2sS82awcX+hz1PwqQlbpAOl1PUaU+CzjDo/e6rjv714DJvi1A03q6n66q4x0T2Nm3KzdNJEJS9wrZi6HMJkTMJpMVu0Ac1QSOcRZ//keQg7ijUUGrCOmSeSEGJSUYwb23Bc2Hiy6+uYruDLyuIdYtl3eipUfe90TS2UlJMu8YrsMmf9jt3s4qjRNiwS1eqOij4MLlIO5ADFreBOT3au9w9JFr+fy32mUYI6FJZStOkcIQm/N2/+yQ7wua3fsrefS2paYyB5mNPXq4Lvyo79MIKDxApmsOP0FWjkctg0qMYPlj3TwaHn7EIO8yTkuV8OGM4+7cF5xqdLrxlsYpZ8yGcG+l4HYsAXprkNLej3wRT0zck6PUF1PaMB+LUCEJCUPemnhO8a8yzGEGvqf2ajQaj9njqybWr8lCt++uy1ZnweStSdl7h8Z/58piB8tCzr842GPYsGjJgHuuRPU474pzNVTdbXvhUHluSIhS2vcBLFhgqtIJIt3tq5zWCpO2EnbPsGGGGBdGtPVyglQ7pzbOsusp077ZHy81XpTOPL5UdUeYkHVwIyPxxt43ab86+bF03lzB5hIzQ189dH9BE/Q5sCkbKTfYGgBUxs5l1Q/8W5XiV5LdCnwZTNiFscvw1h3kymU7lIAmdnpKo+M+2OBD2Ta8XeQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(2906002)(31686004)(31696002)(6512007)(6486002)(186003)(66476007)(53546011)(6506007)(86362001)(41300700001)(66946007)(4326008)(38100700002)(8676002)(5660300002)(66574015)(44832011)(83380400001)(316002)(36756003)(478600001)(66556008)(2616005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtjS0p1RjM3WVA4MlpTZzNaeVNnYVBXVmFjQjhaRVkxbDZMa3hWMlZKSmtt?=
 =?utf-8?B?M2JsYzFMSGdtdjdIRjR6VzMrM1JlTTNjOE4zT2t2cXl4bEJ2NEFGaFhKcnNp?=
 =?utf-8?B?LzhxYm9aZ1ROdkZPTGlycVJIYXFBeE1nM1lER3hxSGlVWk9CR3RjemlyV0ZI?=
 =?utf-8?B?K21ueDRTMnB6TVZTSmdUaktSQkllbXJxNWwzR0V5bUttK2RaeDFKaXYyaFhU?=
 =?utf-8?B?eng0dkFLd3JXRzBlallMQXNsWmw2Ny9uMy9pV01oUkNoZ1pRVXZkNTJxZnZE?=
 =?utf-8?B?VVVHUjFoM0E1MmpHL040c3IrVEovU2FSLzNuNEtSOVFYbVJneHc0N2plNW1j?=
 =?utf-8?B?M3k1blRXdHNEWEVUUlFCMnhYTHhZRXNodlhyWEZIek1WakE0dEVlR0UzNEh1?=
 =?utf-8?B?U0JNZUFId29hZEtrMHRkRVJFMTV0WVUrcE5KcWlkMTdHa09VNWFWNnNxdER4?=
 =?utf-8?B?SlF5YTZHcU1oVENzS0NJTDNid2k1bnlITHcvTnBuTnZUb0F2aDVqWWRJczYz?=
 =?utf-8?B?eXdHVUsyamJibVhWUldqcFBuWnVkalhGUHcyTFlWQ2JpWXdDaXdIaHo2dHJC?=
 =?utf-8?B?S3ppME9vYnhUZmE5Vm4wdFdMcWNnam1kOEJZRmMra2FCT2Z3emVHRkh5R2hM?=
 =?utf-8?B?V2N4U0RBb1dPWjFOS2VyZGtYaHhXQ0hnNG1TWFZLQ2ptd0pvYlRaeFVicGgr?=
 =?utf-8?B?SUhSMFFvbzZMVVgrTTJzOWhUd3RSTXdSMkZoNDNDVDNtYzJFanBRalNMWnBS?=
 =?utf-8?B?VU9Fc2JzTUNVcUZnQ1JVVFMxc2dYQXBmdmtlbmttT0Z5VGJialI0YnNyNU9u?=
 =?utf-8?B?MHoxQm45NG1abWg2YjVMbHljYVQrdUR4MWVYQUEydGtJL3RidmNxeTlQNkho?=
 =?utf-8?B?TElORHlFTS82eTZaR1QzcURHYWppYU0zc1YzRnAzMTVOR1dvajFRazR2ZHpB?=
 =?utf-8?B?UGpzZnp4TFcrNFRMY3l1dVZnanVuRitQN29iTlNRdjhjRFVTaW9oZ3pReGFH?=
 =?utf-8?B?SllwMFFrUXF4M0dKWm03V1lwSzhsQlY4SlFJeU9teU84QkFZZVppRWsrWVJV?=
 =?utf-8?B?NGZxY1lTWlQ0K2Frckh1UzgybVlkd2o3V2dZeFp3am80QTRnbzRSY3haQlVJ?=
 =?utf-8?B?dXY3Ri8rQzNucGhETUxpQzFDOW5BS3QxTWYxQUxDTG1PZGttMlc2YkpVaFFt?=
 =?utf-8?B?QmtiVVU2TDB5R2lrQTUwNFJ3dE4zaktyVjF6NVNSdFpUOUZhbU1mL1pCT3JL?=
 =?utf-8?B?eDl5aVhJM3oyQVg2dUszQlVKZmI1QlhMRnhZckZIS1NDTU9tVXgrMEtmUGs4?=
 =?utf-8?B?RGVCTzUxb1dFRWxpQyt4VXdIcjVMdkMxSnVnU1hIY3g4a3grNm1aUE0yaU1n?=
 =?utf-8?B?UjNrRWtwd05ZblhrMmN2RW1DVGpyL2JOUGxnRjNTY3FOTjVsLys3M1RYY2wx?=
 =?utf-8?B?akREMzFVUDlKUjRnZjYxMzJQMC81TTZnTzBzK0lyUTVCOWRycGg5bmRYTnFD?=
 =?utf-8?B?M1dZL0dqa0RjWW40SU5PNHhUWTByeXZNTUo0K3lMeFdyN3ZSbHd4ckZ3MzZN?=
 =?utf-8?B?WWdlMTRQQ240SlVnOFp1Zm02R2dCOG16dEF0emVDM0lERjNKTkFoTHovQlpk?=
 =?utf-8?B?ajE4RTF4eFRxVmR1VUIxLzZDemlpWHY5ckNxMVpTaW1xTUx0b0VZWVVkTDVC?=
 =?utf-8?B?U1R3WFdJOU1pRjlaVVJ2TXN4a3JzZTh5VFJKdUpJSk5uaDg5bnE1NHovU3Bk?=
 =?utf-8?B?cEc3dUJzNEhZd0dmU3ZmMVdYWUl0SHpQYWFwS1drMkpXTzExUTNJZWpoQzJB?=
 =?utf-8?B?by8zeGZqNjhJbDluMmtWeEJCTXBaV2c1Nm0raktHa1Q0d0RzTlMrTVlEMGs3?=
 =?utf-8?B?RXAydmk2cGNoQmlIZU85NDdrWmdFRHpmTWFPWGFEdG91Q1JjVmNqU3RzMWFQ?=
 =?utf-8?B?d0NQT0dlR1hMcEZJY0VjZGU1Y1h3SmN4TU5GcUYrQUpxSlNMcW8vdy9zOW54?=
 =?utf-8?B?cHVlTFl0dVVGaTNrNWw1cmNsaGppT1lQaGt6dC9tNlo1dTF0ay90VzgrM25O?=
 =?utf-8?B?bW85KzdRb09XaUxFSGpGRThqTzNzR3dwZ0ZaNmlYbE9NTjVMWTNvVXFxWERI?=
 =?utf-8?B?K0YwOUR3QTNqSEYyTEtRaFV2Szl5SlgzU0QvMm82V1dqVk1HUjliS0dlN2tB?=
 =?utf-8?Q?cRyJ8lx5flp0y+mdC3/Ts1Rykq9gh4RqT/4HAqo2C3z9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d163833e-8b29-43ea-c3d9-08da555de5bf
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 21:18:20.2778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA6tgwAqvv0lr8GJfXDO4mKQBr9TKol1lpsIO20cvITroU9HP6fX4eJ8V98zfRO2szblPYeirtY62kBCEQcHsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3276
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-06-22 11:04, Christian König wrote:
> Am 22.06.22 um 17:01 schrieb Andrey Grodzovsky:
>>
>> On 2022-06-22 05:00, Christian König wrote:
>>> Am 21.06.22 um 21:34 schrieb Andrey Grodzovsky:
>>>> On 2022-06-21 03:19, Christian König wrote:
>>>>
>>>>> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>>>>>> Problem:
>>>>>> In amdgpu_job_submit_direct - The refcount should drop by 2
>>>>>> but it drops only by 1.
>>>>>>
>>>>>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>>>>>> dma_fence_get -> refcount 2
>>>>>> dme_fence_put -> refcount 1
>>>>>>
>>>>>> Fix:
>>>>>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>>>>>
>>>>> Well what is the external_hw_fence good for in this construct?
>>>>
>>>>
>>>> As far as I understand for direct submissions you don't want to 
>>>> pass a job
>>>> pointer to ib_schedule and so u can't use the embedded fence for 
>>>> this case.
>>>
>>> Can you please look a bit deeper into this, we now have a couple of 
>>> fields in the job structure which have no obvious use.
>>>
>>> I think we could pass a job structure to ib_schedule even for direct 
>>> submit now.
>>
>>
>> Are you sure  ? I see a lot of activities in amdgpu_ib_schedule 
>> depend on presence of  vm and fence_ctx which are set if the job 
>> pointer argument != NULL, might this have a negative impact on direct 
>> submit ?
>
> Not 100% sure, but we did tons of workarounds because we didn't had a 
> job pointer for direct submit.
>
> But this was before we embedded the IBs at the end of the job.
>
> It's quite likely that this should be possible now, it's just that 
> somebody needs to double check.
>
> Christian.


Looking more i see stuff like amdgpu_vm_flush and 
amdgpu_ring_emit_cntxcntl, emit_frame_cntl that are conditioned on job 
argument, doesn't look to me like this is relevant to direct submit ?

I also noticed that direct submit passes back the created fence to it's 
caller while freeing the job immediately, Using embedded job here will 
increase the time the job object will hang around the memory
without any use as long as it's fence is referenced. Job object is much 
larger then a single fence.

Andrey


>
>>
>> Andrey
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> index 10aa073600d4..58568fdde2d0 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>>>>>> drm_sched_job *s_job)
>>>>>>       /* only put the hw fence if has embedded fence */
>>>>>>       if (job->hw_fence.ops != NULL)
>>>>>>           dma_fence_put(&job->hw_fence);
>>>>>> -    else
>>>>>> +    else {
>>>>>
>>>>> When one side of the if uses {} the other side should use {} as 
>>>>> well, e.g. use } else { here.
>>>>>
>>>>> Christian.
>>>>>
>>>>>> + dma_fence_put(job->external_hw_fence);
>>>>>>           kfree(job);
>>>>>> +    }
>>>>>>   }
>>>>>>     void amdgpu_job_free(struct amdgpu_job *job)
>>>>>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>>>>       /* only put the hw fence if has embedded fence */
>>>>>>       if (job->hw_fence.ops != NULL)
>>>>>>           dma_fence_put(&job->hw_fence);
>>>>>> -    else
>>>>>> +    else {
>>>>>> +        dma_fence_put(job->external_hw_fence);
>>>>>>           kfree(job);
>>>>>> +    }
>>>>>>   }
>>>>>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>>>>>> drm_sched_entity *entity,
>>>>>
>>>
>
