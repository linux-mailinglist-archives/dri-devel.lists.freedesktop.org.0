Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9C47BB65
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 09:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C02F10E1C8;
	Tue, 21 Dec 2021 07:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF5A10E1C8;
 Tue, 21 Dec 2021 07:59:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdY0rgIxZGcuUBR3O9Tf2aSWiPPJL+Ocjz7Q3aayL7+X1qwG2wYaeO7iwe8RZ2FEQs8erFt3W8hjovkdcxz4gY4gzvwZVXhfo9+xMzrRctU/qzMuBeQMhonlRUaM31tjuylojBoyUxnU1GPk3YyVecL/FAWBDGYN4n2vJU+ZHB5i/9ztuG+FUkJWfkBvwPrB/lkNdygrLDQx5OvQyWD1dR4/tOHQayctMegrKr044Y2zrW1niRvVg59Q6i+dze/geL3Sv3D+uARYLumepv7jUu44ZFr4YMMCi9UKuifWl+158BQIJs4Acj8XC7gJ39DELfEM85vuFdHQhjcFn8AOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ch/jYcNlviAylzrIkwMjokXJxvBcbb2pI7TwN7cGZz4=;
 b=LrLcbVnzwH1jmDQ61QnUeHSlJ+iyZiG4wjzSehiVVoipgWlFpatmLfZ44CKaG+e9UxRGWlZ3SxIsfrWqWkG3pjSS4/JTDL4JJYaij++1+vTffiAAJhXWW8SWopVmh2+4Lm95Y7MrfioNiz4OyMVQ4byCp7gDzqTVcPoKc1bZRPloM+VLbJWz7MT/BRVggTeN/wV8theIw1l4PrCP1P09tmADjYUVhTwzI/OpQvzeRLVPtlqjgWbIDnbVpq6EZayXqXORT9oFy13T/DnaG9KuQBrEebquroRl+HQZ8dJ2blwCxKcLKedpRIU1Zkq6i1KGLQ9bj0Hgpxr3p6g5CvNv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ch/jYcNlviAylzrIkwMjokXJxvBcbb2pI7TwN7cGZz4=;
 b=aFER/XTBBgEmZSQYGjkyC0mw6Cgn74whDUzyfSV+OlBYDpmJhuACV69vzZDDoVaj1GU59HFCpW51vKGxf0etwSWIPqfDWgi3GJN4Cpdz1mW9Hi6ML0gSZdNBh2MNvgq3e5Ns2sAY7tKBsowN0BfEmF8RAGn7HqyyxgvLSqdhiUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1485.namprd12.prod.outlook.com
 (2603:10b6:301:4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 07:59:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4801.022; Tue, 21 Dec
 2021 07:59:52 +0000
Subject: Re: [RFC 4/6] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-5-andrey.grodzovsky@amd.com>
 <c143e561-d149-6680-0b89-2cda78ea1d51@gmail.com>
 <bfecd7e4-6848-e2ee-4e80-f394403af08d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1ba3fd87-c36d-3949-a466-17eda53a1d94@amd.com>
Date: Tue, 21 Dec 2021 08:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <bfecd7e4-6848-e2ee-4e80-f394403af08d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::13) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a834192-1f42-4fc1-1537-08d9c457dd6e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1485:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1485369E9E90D242347C4EED837C9@MWHPR12MB1485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VxIA8oWlsK/ijS7GGOmv2NwI+YAQDHAmmRlXIVlA2Eh6wKa/bCA3CIkMAZy5z4Yrd0GBWlqipfB9xouGeeHQ0gJfm7HwfolhbFOvvEZZj9HSFSYIyAOyHKRtEzbk7L0ViJPLpCQgySCszMRCSW3iHwAENeJS/QRGCLTnKK3fYB7aZwbK0Wmby27B+XCvPt4QDoWKdm2gWu7tZU3KcS/sd//7Fbenz6SJDw/efJkk3RLnC+V8vCfNZDmHQz1q0BWlxUZ3kMG30NLI//p+n0Qg5ioMcajcF6BLMjt873/+6pY1nqHIta7PguYlOHbDRPCuJnvx6Pxsq8r8JkcKD9i2LJj5ObxjYVHnn7CrCQ9sCQfcaUuk2bQ9Cwi/PsDvyw7X//Im1UUJ2bUDRAukkgYRWaGJdTL2mNbbtG/IGaHL+jDinCd+MQXpWo/qtZvcVyyrwR51haCawFCPXT+bCDWYaRdrfUjwZmoB2uAadwNCeSyxx7hkz6lOuZ7RA9JLqHIXFAmkAJI/x7BP1hEEHgWqZ1B0pTYG5m8zPjVYuUkx+LfeGout59x0ZqjHixaJNCZLq02+VhhU7efNmzOeVEadxrBtR0k7fyTWYFEm2PgAV/mSPO9PbgV8mfq0cHXzCOnMTqgDyoeC4S7Ey1cBYHugcDQakWTWyY6DQizevFL8beEZnnFjqiiUoWyAAYAewwt2n8gaXOxxDwqDgH/Alr16+LbknnS41i15wQf3nFtEJDaP1GxJRDj9l+8liia+dhze
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(5660300002)(31696002)(2906002)(66476007)(26005)(66556008)(66946007)(4326008)(6486002)(6666004)(4001150100001)(2616005)(6512007)(53546011)(186003)(110136005)(31686004)(83380400001)(36756003)(38100700002)(66574015)(8936002)(6506007)(86362001)(316002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGh6M3BwYlJVc0xKWXFkR0NCb2t5UkYvKytheVQxK2paekxjUHZRVE9Sd2My?=
 =?utf-8?B?Y3U3QlQ2SFI5ODZjaXducitkOTBJVDkvMEpZdk5lOUZMbFZKMi9jYVhyODIz?=
 =?utf-8?B?WjYxVThQV2FsWStUSDlIQWNOdXpaUlZhQ2dQVTFGTDRsWkNFWW9NeDExVVpX?=
 =?utf-8?B?TmFBbUpJK21TbkVJSGVRWks0S05Db3Q1WGlDazVQL2p2d3FpaFNCZHF5c3Bu?=
 =?utf-8?B?ODB4ZFV5bVJrN2R5ZE8vS2JJOTFRNHdadUV2V3Ewa29ranR1SGN0RkFxYWZM?=
 =?utf-8?B?M1hmYmlwaGhJTmErN24zb1lZc2VMb1pDVnFhcStkU0V4TkZ2U3BLeFBOK0ZS?=
 =?utf-8?B?bk1nNSsxNGVOZ3VIZDhFamY5SnpJUytlWjdUaldNdHMvYU5FSTF3bk9sWCtz?=
 =?utf-8?B?Qk9jU2RwRHV4YVFDQjJMK2twSTB1MUlTVkNCOExmQnlnM3lXc3dtczBrNzlM?=
 =?utf-8?B?T3ZOMFFGSWpSajBpdGRIKzVxQTJZeUQ0dG5kNkYzUFVoUEFRNDBpUkRxVGth?=
 =?utf-8?B?L1VjNkpiTmg5Zmxmb1h3SnpCQjh6RTBhemRsV0xVejRNVkhraGxjNFQzZTRx?=
 =?utf-8?B?ZEpwMFcxU1BYUFg5ZzVCYytKZ3EyT1VvRTQrdmg1WUYvK2NpSlRWSGdCTmJ6?=
 =?utf-8?B?TnUwRUpmV3huOUdiRk8xUjZCSUNpNnRxZnJkeTZNT2o2UzdEUEsybzFUR0hM?=
 =?utf-8?B?T0E2aFNCNks4OGJROHl4aE5PREs5Q0Q4RjJlUldRZWNsZVdMWGJmR1dWUE8w?=
 =?utf-8?B?S3Ayc3V2NHMwcDM3cE9vSnd5TU9kUnAzUUh1UVFWckRsSVdMbStXcXU1VWhD?=
 =?utf-8?B?UlIwZU5WdWNiREVydmd0cHFDOTNDWjR3M3g4QW5MS0NlajB2M21uRTAyUG91?=
 =?utf-8?B?OVZEZERFN21VMm00Yk5kd1lwQStuR3BCOHlvRC9jR2lqQmhjRDFaVzZiVlNW?=
 =?utf-8?B?WGlNTkthR2IzdzcvYmZMMFE3b0k5S0JvQTJLbDUzU0ZWblkxUFFTNCtXYzJk?=
 =?utf-8?B?dE1rZEk2THJ6Z01NWWd5UFdsVEtCbURaRzVidldVbjd2Q3lSRnpMMmdtSkhK?=
 =?utf-8?B?MkUvTzVtY1Q4TWhwaVpqZ0hybW9KNzN1MDUra0hSR3hmR1lIN0dkNzdYRS81?=
 =?utf-8?B?UVMzNmp1b3hFKzhHQUlmUmlkT1h0ay9ZUUJ5Q2FjWFBuSWNmRGtTcjZrY2kw?=
 =?utf-8?B?VTE3b2l2TFU5ZTRBQlg2YnRtN0tBQ3JJcXliVU1nZE1JZG92eTM2MlpLUVR5?=
 =?utf-8?B?RjVzcDR4bm0vL0w5SHVGNTZUczBXRVQwVFlhaVpxZkYyYVpMM0huWUhueHlp?=
 =?utf-8?B?cXI2dXd6ZVpRYUhIQVhDdUdTMnVEdEkvSjBtclJ0R2FXbnJMMjRmVkdIS2NK?=
 =?utf-8?B?ODRra1BlbFlxazErcXlzNlFJYm9hV3M5Z0hGeVJSbTN5ZDh1TFFpRGFSQWFY?=
 =?utf-8?B?emJNdEtPNHViejdlRjVadEwxQUlCTnY2WFRjTlZnUVd6ai93cFQ1TXJ1WDh1?=
 =?utf-8?B?eVFabGx0SDFlZFY5WTFzdUNkWHQ4RDJvNUs5emE4NmhYU3prWlJkb3drRnV5?=
 =?utf-8?B?dzRGUXRVNStlS2NoOXovUlhOaHplSnpmZW5IUi92N01oRWZ2MUxFMmpwWHBk?=
 =?utf-8?B?bngvUGI2WlhaU09NRE9IYmdPeEE0ZHdFQlRwV3V0NW9XM0tud3FpbUQwRDYr?=
 =?utf-8?B?U2VGWEMyOUN3bjRVYU45aDE1b2htZDhZRXg3N25idVBudkUxOXpzQnBPSWNr?=
 =?utf-8?B?VTcyL1R3by9wVEJLd1JTS1M3S0ZmVjBOSkx1eFpiY2VTOUxGME5TWlZUQndO?=
 =?utf-8?B?ZW9Ia0JtQUtPbWswWjlpWlRkRDhHRjJPSEU3bXo0dms3WElENVZ4ZjR4VjBI?=
 =?utf-8?B?TjExMksxa1RNbnd1cXU2WC90VWZuQWFQeTVRRWFPRlQxRTFrWHg2bWVaeVEy?=
 =?utf-8?B?ZkVNRW01QnpSeWZUYVg3T3h4MStUWEJjeXFGZTBldTBVSnkyaEdQZStodGhs?=
 =?utf-8?B?WVdkeVN6QXpXNmhLQjdUZi91cjN2R1YvbEczNmxPUW5IUkMyZTFnSGxyQnkr?=
 =?utf-8?B?NldvRnRNL0M1U0I4ZmxEd3pCaXl5WUlMeTNvTGp2RGpxK2xxbDFpc2dHTTVJ?=
 =?utf-8?Q?mS6M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a834192-1f42-4fc1-1537-08d9c457dd6e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 07:59:51.7418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z0yxyybVfD78vTV/HoWgCawaeRM9ubvveeykMHSfV0R9B8xd1dZoT1jxH8U85hu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1485
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.12.21 um 23:17 schrieb Andrey Grodzovsky:
>
> On 2021-12-20 2:20 a.m., Christian König wrote:
>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>> Use reset domain wq also for non TDR gpu recovery trigers
>>> such as sysfs and RAS. We must serialize all possible
>>> GPU recoveries to gurantee no concurrency there.
>>> For TDR call the original recovery function directly since
>>> it's already executed from within the wq. For others just
>>> use a wrapper to qeueue work and wait on it to finish.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 
>>> +++++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index b5ff76aae7e0..8e96b9a14452 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>> amdgpu_device *adev);
>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>                     struct amdgpu_job* job);
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>> +                  struct amdgpu_job *job);
>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index b595e6d699b5..55cd67b9ede2 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>    * Returns 0 for success or an error on failure.
>>>    */
>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>                     struct amdgpu_job *job)
>>>   {
>>>       struct list_head device_list, *device_list_handle = NULL;
>>> @@ -5236,6 +5236,37 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>       return r;
>>>   }
>>>   +struct recover_work_struct {
>>
>> Please add an amdgpu_ prefix to the name.
>>
>>> +    struct work_struct base;
>>> +    struct amdgpu_device *adev;
>>> +    struct amdgpu_job *job;
>>> +    int ret;
>>> +};
>>> +
>>> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct 
>>> *work)
>>> +{
>>> +    struct recover_work_struct *recover_work = container_of(work, 
>>> struct recover_work_struct, base);
>>> +
>>> +    recover_work->ret = 
>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>> +}
>>> +/*
>>> + * Serialize gpu recover into reset domain single threaded wq
>>> + */
>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>> +                    struct amdgpu_job *job)
>>> +{
>>> +    struct recover_work_struct work = {.adev = adev, .job = job};
>>> +
>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>> +
>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>> +        return -EAGAIN;
>>> +
>>> +    flush_work(&work.base);
>>> +
>>> +    return work.ret;
>>> +}
>>
>> Maybe that should be part of the scheduler code? Not really sure, 
>> just an idea.
>
>
> Seems to me that since the reset domain is almost always above a 
> single scheduler granularity then it wouldn't feet very well there.

Yeah, but what if we introduce an drm_sched_recover_queue and 
drm_sched_recover_work object?

It's probably ok to go forward with that for now, but this handling 
makes quite some sense to have independent of which driver is using it. 
So as soon as we see a second similar implementation we should move it 
into common code.

Regards,
Christian.

>
> Andrey
>
>
>>
>> Apart from that looks good to me,
>> Christian.
>>
>>> +
>>>   /**
>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>>    *
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>       } else {
>>>           drm_sched_suspend_timeout(&ring->sched);
>>>           if (amdgpu_sriov_vf(adev))
>>

