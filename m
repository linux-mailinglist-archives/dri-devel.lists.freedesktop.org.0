Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A9739859
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C475310E4EB;
	Thu, 22 Jun 2023 07:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB09510E4EB;
 Thu, 22 Jun 2023 07:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKpogOp5dECqUbMWHVGZstt4L2Z+xW9YFBmMyxSvyseEGdpMdbZphWMRuhl0DAOR55RBYXh5Et3pq3mX3bhBY+yVytWG/ItCVt3n9P+Wm0jVJZq3pC95qi/sqrBoDEluVF+qHcdlCmBYtNUTj9QhXi2tzIm7FuAIbJuvLUqHnZZbXG9W0UA28Yds4IVgmQhBH5/vijRJQuTeDFgOOdzvadNIB+Lf+reKVVxuu8MRZ2gzoepTYSSzoxdMvbi403kNG3TzmwQbuqugM13sWa2ZhWojsSxZTOIEiDRL868dnE5j+R6FXgs30izKuFUCJ/+YwKe6nl4TzjqOOjqL9LfCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsf5CGmagf1/+/aOj9M3FIPeqrm7kdIygRmK/qZbx6A=;
 b=Wg+f4wZSbbepdYQPjMKmr4pOEZXR55Kj9VxZsORep8tgl39pVCzccWX6aPp0uKtL8BmMqFHxakCht8k/Rdp7d7SRYOObWXs23lca5lOHMZy038ar+ELd+BkbDf12T/5iSvoTU8ZpWQKElLY/84k8xV8FFzPhu5aOP0TkLakFrFJ7DPDZa34dkqSwDTMsH8Fry70vX2Vw0Ir9PQ1PHzh2SKtNPSsjQKo9gIrhmoAiVfqm2pA/fkxgnEgB4wkDBE+U/7yb+KahK+XTWuyhQ/oxGHiG2kq7b7IocE0fqdVXOYQR20eANNaV45wmNiN1zilSuaU8FVeqkAiZWG/kZDPDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsf5CGmagf1/+/aOj9M3FIPeqrm7kdIygRmK/qZbx6A=;
 b=phu3kKLGkmaFqP2mCmeM0kvqz1ffi0WWP/gOmqvK4WeXl9nO2nXlRqneG0wrzF8P3KX+iqxNSfnfeGfXP7ZLWJbEOnz4lHdywSvhHlz4M41+rTk4uILDR4QLrTlxi+6id08wOAgqrpLBltpYyUN26Bb6tZWi1zIO1tRS7l1KgzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 07:45:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 07:45:36 +0000
Message-ID: <376f4136-6c32-1a3c-9ff5-74ee2408214c@amd.com>
Date: Thu, 22 Jun 2023 09:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v3 3/4] drm/amdgpu: Implement DRM_IOCTL_GET_RESET
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-4-andrealmeid@igalia.com>
 <5a0876a6-c3db-73b6-15c1-ef0b8cc8c732@amd.com>
 <1d638ba7-b34c-472a-0816-72758da20ec7@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1d638ba7-b34c-472a-0816-72758da20ec7@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 859e7496-725d-445d-731a-08db72f4aaa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBI/AfmqTjtxH+2ErL55MO/S+NPdYuCzs/Ykf8j7ZuheVHla/YG+NNkjgw+nRWABPSWxNOqT/KDc9fo93l6TRocHZk1sf7trUOpZcauozUaRApIr3fyCt5Vjw9R8Qn0OZp/+AxoyRmKAR56bUgdi/dIiseXcyqDlbXDNlFSoGY8XdHmx8tTP1cpQ1VPycB/gWsIAnMIdXxOr4sup38/bxyF7krpNLDEgD4cOPXRW6bApKpzrHDKxT/fDdhQkyxWylSD2pTsv+MZPNkDlY+u/fQjH4PoFjESGgh2BYXzlzjXnKE9lTXK1D8WYdnQUFkiwZoY3IUanJaqhjur6Lv4Utlox1fZCGZqhWEYgDdfTmjgC/B6hoeMPJZPu1CTw6/d4CPVmCIQvGCmETJhEICsIdL6RQnA5elSeZaVHmQNREzFWXoZ9Ivb6ZnbLi35UU+V5FaVzLIh4YheCrncldA8Yp4WZjhDfztacGueX21vw+QKo3cvahAAZAiDW8NzOEe1/j7cUS8fk/C82QqNwVaUHxy342XFwTjODAvaW/YazHcTab2Uu9DN1Z3YeOtpqbUyuBgs4ykZzGWxaWrTbntji9Quo1jXg9urbBrWU3MJx7f0JJHZECx9UsJJnPJvK4//EfsxaMkqLe3MyMqpOf1mbvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(8676002)(31686004)(4326008)(6486002)(66946007)(66556008)(66476007)(6916009)(478600001)(36756003)(6666004)(316002)(54906003)(31696002)(86362001)(83380400001)(6506007)(66574015)(6512007)(186003)(2616005)(38100700002)(5660300002)(2906002)(41300700001)(8936002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Umk2dGJOMEJpbVZqd3FvYWFTcDFRcktDOFBBank0ZEpzQjJDTUZzR25xMGJY?=
 =?utf-8?B?c09wMDlHNmJYS0UvYTJ1VVhVV3NWdjZvOTViYWlwcFdXTkozOWVtZEJ2bFhy?=
 =?utf-8?B?bFVYcU9kWjI5R0xpN2ZoSysrSGoxb0cyL1NrK3kyS29nMVovVmZvaXdPbWQz?=
 =?utf-8?B?dCsvWXlhYlZQN2c1QkFlOUs0Z2w3bnlmMWVtWmRxWHlJbm11RkhTUmxib1oy?=
 =?utf-8?B?aWxTcFRHZEFJRlJWQlVFVjROSWNUU1NIcnBmSmczMkdhd1VONEdNelI4L3VW?=
 =?utf-8?B?QUdHZlVyejNuRzBSNHVDV3UrWTJLNS80b0tLSFRYTStiZHpiT0lZV2JjZWNC?=
 =?utf-8?B?cnBWUTQ3V0Q4QTk2MVV6RjJMVGVpYUt1L3Urb05ORk05a2VsajFZZ1NPeFRa?=
 =?utf-8?B?MktjUlczMTlWRlY2YWpTWUIxbTViUi9kNWhLSGtKaHhBRHRmOTdyM2lYcGF1?=
 =?utf-8?B?R3RkeUJqU2dUSGNsSC93NjBBVCtpZ3VzMnMzQlB3cEdZRGdQb1NkZjIyL0xT?=
 =?utf-8?B?dFhxK2pGS0s2TTJsT1NoTkxnZzFDS2Q1K2paWnhzS2hCR25SV0VJTXhGWkF6?=
 =?utf-8?B?dE1FM0xxL1Z2NGRlaTEwRjJiVGROeUExSnprY0VhVHB2RWo5dS9kT3JOdFE2?=
 =?utf-8?B?TVpsaElVY0doSzhvUHpZenZPVHhmNSt2R21Wc1RNSEt0L1Bid3hDSTRNclRY?=
 =?utf-8?B?V2RKeHlqanh1dWpWd1o4d1ljaUZKNTRxYWI2VUlFUkxSSFhpZnowTzUzOG9x?=
 =?utf-8?B?Sm9Ib04vY1pGdWlLTjd4Z0J3VHdPTGk2R2JsNVMwYTVjTVo1aXJlZlh2dC9W?=
 =?utf-8?B?RGpLOHZUWlpIazkrUEdidTVkYzh2TDRtczU4RE5ZN2ZWUTZaemJ6eEtWcXhK?=
 =?utf-8?B?V0J6SE8rZ2xDc1NxRVRaS1N1SHErNnU2WHpGYW52ZU5LanhiWlZpUjVyYkVV?=
 =?utf-8?B?SUUxM1JncUlCYk5qaVJqODF1cGpVRlFFZmNhMGFYWVhQOTM4amMvc01zeUdW?=
 =?utf-8?B?S21jWWR2MGpPempmNnVXdUl0eFlUeEpVbFBpZ3crZmVjUm1HalVsTnhnS3Iw?=
 =?utf-8?B?czZ1TlhSVk1pZ2V5S2VMUWJVNEJUWm13T1VOMlhDbTM5M0lIWmd4T0hRUHVn?=
 =?utf-8?B?ek1qOHZIQmJ3ODZ2VXZCYVl3TDBOMVFWWmMxZkhMdHJNaEFvZzdKYi9QYzZo?=
 =?utf-8?B?eTc2aWF5L0p3aC95UW5HcitWd3M2VDBWeFBEMXMrYWNnL1N6MUJGR0dMSjk5?=
 =?utf-8?B?N0FsKzc3UERxN2lkdmdFR2o2WVA5djQ0bGFDU29VclpPR0ZMeDJUNWtkS3l4?=
 =?utf-8?B?ZnVlRmhIc00vMDRkbE5xSnhPVll0c2Y4Q2szbEU4S0I2Q3JlTkJ4dVZzaUhR?=
 =?utf-8?B?N1lkL3VMSm13VUFSSERIeWdUN0F4V1QyYUVEM2trc2s5WVBWeWE4ZFVDZVVv?=
 =?utf-8?B?a25CMktPMDZLV0IybTg5dkw5R1JxMjNTd0c0SnB0V2FrUEFpWVBLOG9VMGVs?=
 =?utf-8?B?NkhzMXFzeW0vUWVsbDNTM0VDSUsxekI0Tk1Ebk1lOE5DenRReGgyZGFaN0w2?=
 =?utf-8?B?MlJkNG9RZCtwTWlLSjJUQ2RKdTQrYnZUUU5jNUQ5cENhdmNHeHVVQUhTdFov?=
 =?utf-8?B?WlZqSW96L01sS05aNTVKOHVqOWE4aG5pb0lvRnZ6cTVrWUxwbzRvN2Y4NzBi?=
 =?utf-8?B?UXpvNk9CWnUyTjFDbDNBb0hkV0QyMDVrYkVsQVBxT1UvU2lSV20zT2g2RTJN?=
 =?utf-8?B?MitKRVAyMEFuZUhDWGhBQUxvN3JuN1VwSVJJQWIvVUVReThGcThvNFI1YWJ4?=
 =?utf-8?B?eUliWXh4NjhuRE8zUmVmNENNTnpURjNzMG9DTDNBWERoUGs4QnQrN2lodzJN?=
 =?utf-8?B?bkkyWUVYUXZiaDZCcmFHdTJUaUk2RU9nK2N4UWpnNW1CVmFqNGRyaWppeG04?=
 =?utf-8?B?TW40UmpZOFYwUHBSUlpYNnZ0UWY3d1pKQXhodjJseHJuYUtEeHRjTW1PRTZI?=
 =?utf-8?B?czdOdkdyZVM1VnVSeVJHYVhrYjgrNUJzNnNHTW1RS3psZHkwSWw2OWZodTJR?=
 =?utf-8?B?aGJaM1d4YktyZXJyWFdjdTVkUDBDVTdtQTN2Q1NFNFQwTi9kdWxNbmhDOE04?=
 =?utf-8?B?c0hKNGpqeUZtU0dJdEE2TC9tT0Z6eFFUTEhNZVkzc0t6SlVsSTIzUnl1SnBG?=
 =?utf-8?Q?QEYvkHtQLvW9xxLFZFPL+5/NZsqMsnY0GRPQUPinkjAg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859e7496-725d-445d-731a-08db72f4aaa9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 07:45:36.5214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvDpuIpMjLTKxB+9qan8IPhFIr7Hnq9k5R9GOcwI7dFkcE+tn24kUmebo1u1E12P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.23 um 18:38 schrieb André Almeida:
> Em 21/06/2023 04:40, Christian König escreveu:
>> Am 21.06.23 um 02:57 schrieb André Almeida:
>>> Implement get_reset ioctl for amdgpu
>>
>> Well that pretty much won't work since the jobs are destroyed much 
>> later than the contexts.
>>
>
> Why does this prevents the code to work? If the context is detroyed, 
> it can't be queried anyway.

Yeah, but you cause use after free issues with that!

The references are ctx->entit->job->fence, so that ctx and entity can be 
destroyed first without destroying the job or fence.

If the job has a back reference that whole stuff doesn't work any more 
and the pointer is potentially dangling.

Christian.

>
>> Christian.
>>
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  4 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 35 
>>> +++++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  5 ++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  2 ++
>>>   6 files changed, 56 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 2eb2c66843a8..0ba26b4b039c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1262,8 +1262,10 @@ static int amdgpu_cs_submit(struct 
>>> amdgpu_cs_parser *p,
>>>       uint64_t seq;
>>>       int r;
>>> -    for (i = 0; i < p->gang_size; ++i)
>>> +    for (i = 0; i < p->gang_size; ++i) {
>>> +        p->jobs[i]->ctx = p->ctx;
>>>           drm_sched_job_arm(&p->jobs[i]->base);
>>> +    }
>>>       for (i = 0; i < p->gang_size; ++i) {
>>>           struct dma_fence *fence;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> index d2139ac12159..d3e292382d4a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> @@ -322,6 +322,9 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr 
>>> *mgr, int32_t priority,
>>>       ctx->init_priority = priority;
>>>       ctx->override_priority = AMDGPU_CTX_PRIORITY_UNSET;
>>> +    ctx->global_reset_counter = 
>>> atomic_read(&mgr->adev->gpu_reset_counter);
>>> +    ctx->local_reset_counter = 0;
>>> +
>>>       r = amdgpu_ctx_get_stable_pstate(ctx, &current_stable_pstate);
>>>       if (r)
>>>           return r;
>>> @@ -963,3 +966,35 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr 
>>> *mgr,
>>>       }
>>>       mutex_unlock(&mgr->lock);
>>>   }
>>> +
>>> +int amdgpu_get_reset(struct drm_file *filp, struct drm_device *dev,
>>> +             struct drm_get_reset *reset)
>>> +{
>>> +    struct amdgpu_device *adev = drm_to_adev(dev);
>>> +    struct amdgpu_ctx *ctx;
>>> +    struct amdgpu_ctx_mgr *mgr;
>>> +    unsigned int id = reset->ctx_id;
>>> +    struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>> +
>>> +    mgr = &fpriv->ctx_mgr;
>>> +    mutex_lock(&mgr->lock);
>>> +    ctx = idr_find(&mgr->ctx_handles, id);
>>> +    if (!ctx) {
>>> +        mutex_unlock(&mgr->lock);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    reset->dev_reset_count =
>>> +        atomic_read(&adev->gpu_reset_counter) - 
>>> ctx->global_reset_counter;
>>> +
>>> +    reset->ctx_reset_count = ctx->local_reset_counter;
>>> +
>>> +    if (amdgpu_in_reset(adev))
>>> +        reset->flags |= DRM_RESET_IN_PROGRESS;
>>> +
>>> +    if (ctx->vram_lost_counter != 
>>> atomic_read(&adev->vram_lost_counter))
>>> +        reset->flags |= DRM_RESET_VRAM_LOST;
>>> +
>>> +    mutex_unlock(&mgr->lock);
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> index 0fa0e56daf67..0c9815695884 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> @@ -57,6 +57,9 @@ struct amdgpu_ctx {
>>>       unsigned long            ras_counter_ce;
>>>       unsigned long            ras_counter_ue;
>>>       uint32_t            stable_pstate;
>>> +
>>> +    uint64_t            global_reset_counter;
>>> +    uint64_t            local_reset_counter;
>>>   };
>>>   struct amdgpu_ctx_mgr {
>>> @@ -97,4 +100,6 @@ void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr 
>>> *mgr);
>>>   void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
>>>                 ktime_t usage[AMDGPU_HW_IP_NUM]);
>>> +int amdgpu_get_reset(struct drm_file *file_priv, struct drm_device 
>>> *dev,
>>> +             struct drm_get_reset *reset);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index c9a41c997c6c..431791b2c3cb 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2805,6 +2805,7 @@ static const struct drm_driver 
>>> amdgpu_kms_driver = {
>>>   #ifdef CONFIG_PROC_FS
>>>       .show_fdinfo = amdgpu_show_fdinfo,
>>>   #endif
>>> +    .get_reset = amdgpu_get_reset,
>>>       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index c3d9d75143f4..1553a2633d46 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -35,11 +35,20 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>   {
>>>       struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>>>       struct amdgpu_job *job = to_amdgpu_job(s_job);
>>> +    struct drm_sched_entity *entity = job->base.entity;
>>>       struct amdgpu_task_info ti;
>>>       struct amdgpu_device *adev = ring->adev;
>>>       int idx;
>>>       int r;
>>> +    memset(&ti, 0, sizeof(struct amdgpu_task_info));
>>> +    amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
>>> +
>>> +    if (job->ctx) {
>>> +        DRM_INFO("Increasing ctx reset count for %s (%d)\n", 
>>> ti.process_name, ti.pid);
>>> +        job->ctx->local_reset_counter++;
>>> +    }
>>> +
>>>       if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>>>           DRM_INFO("%s - device unplugged skipping recovery on 
>>> scheduler:%s",
>>>                __func__, s_job->sched->name);
>>> @@ -48,7 +57,6 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>           return DRM_GPU_SCHED_STAT_ENODEV;
>>>       }
>>> -    memset(&ti, 0, sizeof(struct amdgpu_task_info));
>>>       adev->job_hang = true;
>>>       if (amdgpu_gpu_recovery &&
>>> @@ -58,7 +66,6 @@ static enum drm_gpu_sched_stat 
>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>           goto exit;
>>>       }
>>> -    amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
>>>       DRM_ERROR("ring %s timeout, signaled seq=%u, emitted seq=%u\n",
>>>             job->base.sched->name, 
>>> atomic_read(&ring->fence_drv.last_seq),
>>>             ring->fence_drv.sync_seq);
>>> @@ -105,6 +112,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, 
>>> struct amdgpu_vm *vm,
>>>        */
>>>       (*job)->base.sched = &adev->rings[0]->sched;
>>>       (*job)->vm = vm;
>>> +    (*job)->ctx = NULL;
>>>       amdgpu_sync_create(&(*job)->explicit_sync);
>>>       (*job)->vram_lost_counter = 
>>> atomic_read(&adev->vram_lost_counter);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> index 52f2e313ea17..0d463babaa60 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>>> @@ -63,6 +63,8 @@ struct amdgpu_job {
>>>       uint32_t        oa_base, oa_size;
>>>       uint32_t        vram_lost_counter;
>>> +    struct amdgpu_ctx    *ctx;
>>> +
>>>       /* user fence handling */
>>>       uint64_t        uf_addr;
>>>       uint64_t        uf_sequence;
>>

