Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E255928F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 08:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1949E1120F1;
	Fri, 24 Jun 2022 06:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6DD1120F1;
 Fri, 24 Jun 2022 06:00:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bI7gq2cmDaBPHH+29DACBXhsWBeZqlrFW0NutLLovUFV2L0xsHgLduwxHh3Pau5Cn0boLCgh+Z/4/tESFU4IO4dmrIuKTxF18sHS4kJl7fEWhwaZdaen10rIt/aE1z4xuG4PNO4bAYKhgQ2TsOfK/Nby6xyTBpPni0Sw6mXZ2XCzVaqliiBi+oU0i99dqSosDAU/NOfe5H7h6jdOCsbGeP4zyOb+AyaMwDEFkcnuDYkRxn9dmfrSlGMnFcbqH/MJAeSLBhSMT2yy9KmK8rhWE0Yzos9mjvQPL3wHEufisW1P7UyEF6SL6s4hRzc5y+DdNpQmnj08Jf5v43/S0v0rvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZv45GtECUsigLxwSfpXgWVCoJHOGHE/p9CYHJBnCL0=;
 b=dRjT9yE8R9eM33w/N70TABp2DuCF19Dm2de6xtrPHWVP3+7DkNWBG31LM6jV1ees/rDX2Tw78Mj6UjRGej/M1CPm8pzTFOjKQLrnnbiTnaIGr6Aq6LevEUFvZ7GJRUYMcKEWhPvENV4m64I/rLHGpWNZbBc9xYJJnv862znUv3FI0IkOMXh1sVUHEzOD+aBk0N49S1Tpl2OWUkcq1S4/I8nKIp9wNGzQ0yFDiUbmpeGm8h7qtqigGJQ+FizsvFtCpkyJOonn8EHJUBPdDmFmtzBbTKIoBZdYnhbtJYpRqJn3sYLl4ruGl2iX4dCQSIm0pOFqpXbFRO4sAMrHdmb/uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZv45GtECUsigLxwSfpXgWVCoJHOGHE/p9CYHJBnCL0=;
 b=fQGU/Fg76hdbKRBW5UNMyqZqkAr70YsHPIkyGgXA6YQ813ZuzNjkBnLyKr24rolP6EhsvxgpKrbTOny9M34q9ixfUD4uMBr1HYWvFPPk9YNlUKGCWYYeZRF5F7ucxlumlns1wbz0hFKuiL0NbJjzMmtM0KtEjJ/5j4uCYu74fmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1471.namprd12.prod.outlook.com (2603:10b6:301:e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 24 Jun
 2022 06:00:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 06:00:16 +0000
Message-ID: <71c0edc4-7bc9-4658-72cb-3d6e1f53b17c@amd.com>
Date: Fri, 24 Jun 2022 08:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/5] drm/amdgpu: Fix possible refcount leak for release of
 external_hw_fence
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-2-andrey.grodzovsky@amd.com>
 <2c70d0c4-a326-6497-54b2-51bc2b93b9d6@gmail.com>
 <91aba934-32f0-b1b9-b882-979ca02a1920@amd.com>
 <6d1acd76-dee8-29fd-dde3-bf51161792de@gmail.com>
 <445f2db4-5496-4003-c5fa-3605aef2c33d@amd.com>
 <16353a69-64e1-2f1c-8859-8000ac6266ce@gmail.com>
 <32e06ffd-a551-a05b-7993-1b6901455a21@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <32e06ffd-a551-a05b-7993-1b6901455a21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8990505c-fe07-471c-84e0-08da55a6cf47
X-MS-TrafficTypeDiagnostic: MWHPR12MB1471:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijSpfTaa4xFAVrK+dab6qv8usGsfre6rpFFR78g3B7EaRRSfM+c59qin8TBKGp9qOqYEu5VCIeBqTJGM1TUwtFImbi7xG38fNzjNl2RipqmyMXPa0m812zNBS6/4Z09Ixwa1yOZGq4pwPcrmplGDhX6ayJFsxoOft1CZ6rgq05/TdOwXv24sfEzB0Z+dIKqBXwGy3tmuGnFxCLdh69+TP9S6D4RknX7B74LF8zvS0mgaEgpfnc7FOsyVEUHUJKggZ9pe3v1fuJ4m7gIudCxENGLiShKzqmLqSBcD/sU+OA/kJyYpaDNVzTMSDETLCxDSn1E2HlAEKptEf7VDLipmkv1Xh4xMRvWGNe67emi9+M5tXKYKlR8CsXV8i4w9TT3LjN5XV0vqa57CPscyJWn3GnfpXs98Z2F8ITnb89dYEN8Kg8DYPpY+jvkMQDGtzZGJ9fSRGgTbAPi574TvWTzaNfUppOZqRC4t0i/fx2aJriNmNwToqAwLctr9SeTs1WgQCBw0M3kzp3Vdhld4cHqMp4NKnSRRKBgejTDPCjtNpGI2f/2xF3zaxH0/wDt4ZEBaSa8K7d2+/ZIRjEd/HWos7xoEvqrcmqdgpanVEGy1kqOl4bHQp086KnNWAXg0aEXYpSBvZbuH5ruW+jWx9J/C/0lWtXfLkh4mGwb+12z0dCnGyj4B7ai7+ridp7WPegJ4HC4f+ZIHh1cM+5h2/euMeocDs/hVnpSJz8V4wVDxPWXOSo9H7zWmNjJ/rnVAAS9/NxEzpCjy96l/aX0YJZZ7Q9vGD5f1qrhrByjMDkSZAgEtwpCp8ZM+C91sXxgN+lm3tHkJ6p3SgIYRV9/QFh5EHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(186003)(86362001)(66574015)(2906002)(36756003)(4326008)(83380400001)(316002)(31696002)(110136005)(66476007)(31686004)(66556008)(5660300002)(41300700001)(26005)(66946007)(6486002)(6506007)(8676002)(6666004)(2616005)(8936002)(478600001)(6512007)(38100700002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3Z3c01aalltcTVBdnZybzdtQ2tvVmdNWkZISm53ZEJsSG45VC9HSXdZTTJG?=
 =?utf-8?B?WEttT25tNldWTEtub2w2RktBSGFhclYyWlZlVS9ERkJOWFZmZkQ3aVN5MTVp?=
 =?utf-8?B?YThUdzB6NnFJMlhPRE9VK3J1Y0xTTkhWQVRwYmw3TXRMejFTNzdlYTArUTBw?=
 =?utf-8?B?a2hhOFlucStZeERzM2xtdmx5djBRTGJQSlZ4eFkzOVhKUStaaGJUcllxNDAy?=
 =?utf-8?B?Y05hTkJ3bWVqWFVJQ0dqdUM1dEczZCtFY0x0Y1FkcVFKVTR0cTBaeWt0QjRl?=
 =?utf-8?B?bW5zYW5qWXc3dldubHh5eU5WUHBiWDEyc05MYVkvR0R1QW81amRlR20rL1Jj?=
 =?utf-8?B?WGdNZDN4Y1JnbUtVSWg5NllPY2UvemwvYUlvSi9zL1Fod1BWSDFDbUtZOUcr?=
 =?utf-8?B?aU9DRFdXdzJwTVVteUxnN0M3SVNwdS9aTjB5VzNNQWpTS2l6cTBaa2s1T1ZQ?=
 =?utf-8?B?RG8vL1U5TFp4UGlVUnFYdnVkZzdobG4zZzNXbk1Wc2xzaHhzQmRzVkN4SVN2?=
 =?utf-8?B?cEQyUW14N3F3amN0bkZGVnB1SkxIWlF0a1l1cm9qSFdNN01XakZ0bjRzMmpk?=
 =?utf-8?B?b1FxcnJkSkRKd1Q1WFhGaExRWDZ2YVkxNC9OanozVGpoTEVKNjgxL0trdy9M?=
 =?utf-8?B?Q09DLzNJSzEyVGpHbzdWdlZOL0I3WHhCek1YcUNjRFFVS1oyUGFDTGNOdVVm?=
 =?utf-8?B?V2JhaFRaeHcySkVGM3lOakVSM29QeXNuWlVIRldtYndySDc4dlBtemlwYUFa?=
 =?utf-8?B?c1dGSDhYN2ZTcUQ2U0ZpTmFuSXQ2VUs4VXBONEo0WVZ4T0g1eWZ1S2hpengx?=
 =?utf-8?B?MnRPck5yQ0M3WDJzMThFdjNLOVpqYTk0TitiTUNuVHRwTDAwMTRCeFFUMkF4?=
 =?utf-8?B?WWl0OXFUUlN4aWhaME9DSXlRM0ZEUzgwNUh2NVBFL2c3WmNReUg3cHNiQmc5?=
 =?utf-8?B?U2VXdldjQlNXZlpSTkZ6QWJZK1NFT2daZmNNZWl0N3JmQmZtb0w4N0FISFJZ?=
 =?utf-8?B?ZUF4SHlDTXlmRk12a0Q4OTd5MHJhQ2I3TGd1dU15M0c4ZVA3R2lpYWM2Q2Yx?=
 =?utf-8?B?TG1QdDdheXlpN3V0dzI2TG9rMnVlbDZYVHJOaXc4bVRFTTVkTDU5RW1NcFI0?=
 =?utf-8?B?Rm9DT3lPQXpLempXVUdhcnRuSkhHMkREZVNvb2s0TERVaHMwRU9jWk1OV2Fx?=
 =?utf-8?B?YVJ4NUZKaWJDV3BTZHd6MDVsdG9oS2lmK1NPK1hRdGYwYVI1ZkFMeC9YOHEx?=
 =?utf-8?B?SnhqZllkcFBlQzBnUUE4VTJYQ2FlUjNRbWtzMWZoNGRGWkNDekFuOGdBMElq?=
 =?utf-8?B?TGxkWTNaNDJiUHZnTmtmeTBPaVA1V0tQRVc5UXYzbHhXcEZoMFI1VElsR1Y5?=
 =?utf-8?B?dmdMeDFkbncwdkoxSjBzZG9KdWV0Mi9EUEhpbGJQZS9sazRKRllqMVRBMkhH?=
 =?utf-8?B?ZVFUaG40OWkrTHQ5TW9BOWNGTCt2dlBJSzZuSkxrYjJaVEN1N05HRlRadFZz?=
 =?utf-8?B?ZTR3ZnpKMmhLbEdqbENxRWpmTkwya3EwYjRLbExoTWFGWTcrakR4R1lZU2JI?=
 =?utf-8?B?WkhyNTJDeElQRmZnVnRpNUd4SkNNZjhyVTQvZy9EaWNibzlzU1pyVE5mRWNX?=
 =?utf-8?B?cHB3Rm5PcTVmam8vKzBxTzR3LzlLcVYwQ1NySFJoY2FQbHhrdS8zTytwQ1py?=
 =?utf-8?B?Q1AyVUx3MFJEOTRxeE1kL0lvUloxUzM5RFJPVHNZQXoyWDVwSVlvWlJrY0Ix?=
 =?utf-8?B?Q0NNcjh6dXl1S2FsM1VCS00vZ3Z6NTVpUS9OejRRZFFpWUxTUkJEZlhRbDlN?=
 =?utf-8?B?ODdpakFnRnRzUkFhT2hWS2U1K3pyUFhWUUVrNEZSSlROSS83QkY2VGZiYmdl?=
 =?utf-8?B?WXpkT1REc1F5dnNWQXo3cFJjb3ljaGpaeUxlZmVnbndJUXBjTU05WDhOTnZr?=
 =?utf-8?B?QkptYjVDSlYrTTNZWkZDTlJsVkxmOHVqMHZGR1h1eFRwNVUyZW9jNXBwYy9n?=
 =?utf-8?B?S0h2RGNGUVgvaXlVSFYwNWtycFQxZXpmS3NFQldKSEVEcjRldU81SUZVQ1Bz?=
 =?utf-8?B?dUJ0MnNCRlI4UFdZMzJzREdGM0pNaURjMktVd2hXUFg3MlJDVlhjSy9RSGts?=
 =?utf-8?Q?+QHmC4y3OEcifv2boOAoHUCQ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8990505c-fe07-471c-84e0-08da55a6cf47
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 06:00:15.8880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HUJnqHJ3D0NGiFeaAK2k2CQpT9Rt0NK5a9hHmQLWtSbtVXBtFDoduNv+H+qeiaVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1471
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com, yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 23:18 schrieb Andrey Grodzovsky:
>
> On 2022-06-22 11:04, Christian König wrote:
>> Am 22.06.22 um 17:01 schrieb Andrey Grodzovsky:
>>>
>>> On 2022-06-22 05:00, Christian König wrote:
>>>> Am 21.06.22 um 21:34 schrieb Andrey Grodzovsky:
>>>>> On 2022-06-21 03:19, Christian König wrote:
>>>>>
>>>>>> Am 21.06.22 um 00:02 schrieb Andrey Grodzovsky:
>>>>>>> Problem:
>>>>>>> In amdgpu_job_submit_direct - The refcount should drop by 2
>>>>>>> but it drops only by 1.
>>>>>>>
>>>>>>> amdgpu_ib_sched->emit -> refcount 1 from first fence init
>>>>>>> dma_fence_get -> refcount 2
>>>>>>> dme_fence_put -> refcount 1
>>>>>>>
>>>>>>> Fix:
>>>>>>> Add put for external_hw_fence in amdgpu_job_free/free_cb
>>>>>>
>>>>>> Well what is the external_hw_fence good for in this construct?
>>>>>
>>>>>
>>>>> As far as I understand for direct submissions you don't want to 
>>>>> pass a job
>>>>> pointer to ib_schedule and so u can't use the embedded fence for 
>>>>> this case.
>>>>
>>>> Can you please look a bit deeper into this, we now have a couple of 
>>>> fields in the job structure which have no obvious use.
>>>>
>>>> I think we could pass a job structure to ib_schedule even for 
>>>> direct submit now.
>>>
>>>
>>> Are you sure  ? I see a lot of activities in amdgpu_ib_schedule 
>>> depend on presence of  vm and fence_ctx which are set if the job 
>>> pointer argument != NULL, might this have a negative impact on 
>>> direct submit ?
>>
>> Not 100% sure, but we did tons of workarounds because we didn't had a 
>> job pointer for direct submit.
>>
>> But this was before we embedded the IBs at the end of the job.
>>
>> It's quite likely that this should be possible now, it's just that 
>> somebody needs to double check.
>>
>> Christian.
>
>
> Looking more i see stuff like amdgpu_vm_flush and 
> amdgpu_ring_emit_cntxcntl, emit_frame_cntl that are conditioned on job 
> argument, doesn't look to me like this is relevant to direct submit ?

I think that those could and maybe even should be cleaned up.

>
> I also noticed that direct submit passes back the created fence to 
> it's caller while freeing the job immediately, Using embedded job here 
> will increase the time the job object will hang around the memory
> without any use as long as it's fence is referenced. Job object is 
> much larger then a single fence.

Ah! Yes, you are right! That was the fundamental problem we ran into: 
When we submit the IB tests during GPU reset we can't allocate any memory!

Ok, that needs further investigation. Please go ahead with your plan to 
fix this first and then clean it up later on.

Regards,
Christian.

>
> Andrey
>
>
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 8 ++++++--
>>>>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> index 10aa073600d4..58568fdde2d0 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> @@ -152,8 +152,10 @@ static void amdgpu_job_free_cb(struct 
>>>>>>> drm_sched_job *s_job)
>>>>>>>       /* only put the hw fence if has embedded fence */
>>>>>>>       if (job->hw_fence.ops != NULL)
>>>>>>>           dma_fence_put(&job->hw_fence);
>>>>>>> -    else
>>>>>>> +    else {
>>>>>>
>>>>>> When one side of the if uses {} the other side should use {} as 
>>>>>> well, e.g. use } else { here.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> + dma_fence_put(job->external_hw_fence);
>>>>>>>           kfree(job);
>>>>>>> +    }
>>>>>>>   }
>>>>>>>     void amdgpu_job_free(struct amdgpu_job *job)
>>>>>>> @@ -165,8 +167,10 @@ void amdgpu_job_free(struct amdgpu_job *job)
>>>>>>>       /* only put the hw fence if has embedded fence */
>>>>>>>       if (job->hw_fence.ops != NULL)
>>>>>>>           dma_fence_put(&job->hw_fence);
>>>>>>> -    else
>>>>>>> +    else {
>>>>>>> +        dma_fence_put(job->external_hw_fence);
>>>>>>>           kfree(job);
>>>>>>> +    }
>>>>>>>   }
>>>>>>>     int amdgpu_job_submit(struct amdgpu_job *job, struct 
>>>>>>> drm_sched_entity *entity,
>>>>>>
>>>>
>>

