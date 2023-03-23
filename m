Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002566C6A5E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7087510EAB4;
	Thu, 23 Mar 2023 14:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145FB10EAB8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 14:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og2OjKlPyCKjMYtvWChRsN0iB4sQsF6r0BTuzAQFcrwkMDkEjwAhJGrCdSj4eU3YE2d7mrs90AWZ7VkhrG8o/1nh2nDSbCqmWyzlQ6/8YwVVtAz8wKn0D9ynfrcVLw/V3Jbx1fjlKN+glk09IX25Z/Y/4rqwuoVLSEJ7BZOqZd9WcajRxzEYXo9/1qiI/mmZMHbabYQaK5RhjsaUuOCKJ05OBR+752WpPGlcWYJfiYE4G6X9qJY3Y/77hDXeU036z/VgUbavdU6kJzihL91TvmEqpxZTYu3STIPsZI0rn/3ytxZcTTlLfHYZAYr3VvivGIgFAFbSdzlhKseUwYdOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JfURZCt8FZSBgyrc1/sDSpXFt6gnDxxCCYgyIS8f/Q=;
 b=Qe32v/fDD5EB28iFejKn+F7/99zn26jbHV+c4INCalAxqgfmPGKpvu3BdbR/QxqrunVkmQ1K33ydO8STcvCLrQpBoGpl2EB2aKDpViTe/VPeRiszaCeOx0hjHgX0eZ0lddF8L5fS/UyK9/AbmCffVvhCVjjrUJAYf05lgYTM1eXY7iTnnFt6Pd5veGNF/aEJTGih96DvzSCdgCm2gLXzfhiHnc2kJ5aQu6n/zJWfg+h5HPcDOSPQHZjAybNO5hsip0JcUkn98hpEky2QN2Z7U7NheAXZqZFusjCwmGKy8r6anEiuGmL8RuNvRvAueh8zlz55Xq59XjApVuDOr/ARqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JfURZCt8FZSBgyrc1/sDSpXFt6gnDxxCCYgyIS8f/Q=;
 b=XZ9FwnMGQ7rkr7VIOtH/nymPa8XpBh4mC2NKCZ8cKl5ADBrn8DAI6qegca11SjTg8UrfE1ao2++DdUr+sJZDdi3NV/AmPI6iRyu0BK4btWk1wvo/bpKaB6iJNeiAZ5BR5+Zi9JwT8cnoevpYHLlOO86qKAOo9X0sOrbLJs5A5Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 14:03:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 14:03:42 +0000
Message-ID: <e2fa296b-9b71-a41b-d37d-33f0fac2cd4e@amd.com>
Date: Thu, 23 Mar 2023 15:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
 <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aba74d5-2843-4230-8527-08db2ba768ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyS/2p0NFBGr/K8f1ggMfYNxDwLCbOiYy+6XySsXdhOFsi1jJY4bSCht8tCmHqUUZGlFZRT/YXaR8h9yOQW8BHGY9rNT1m0pAflsHT5L0pJ4SVbdT6hpxsYLBuQeRhUMNpWhVcnnUKTakMQ3JTDzbCBw7NgCn0Vq2RVOHsadn+NDa4hXFM8ccucEu9OTvOCvaJl6sxpbttGN8XyWuduPyacqP9o8FRAcK9ABIRb/o0WpgQ1hf/K3OkKJzrEjOe2uRDi7aF2g908Be69b9iWqo1tzCx3C347KEErjcOjmTfpXwzTj9uOkU8yfL7rHXp/I4/n8fj4eQaxQ8Mion7jzxWkmgrayEaN97H9dE+6qe02PerMu3aeT4sRFdAp/dtteqt5e4Y65Uc1oXttZ3pHpkZvbDl2VAB5/di8Ul62hwiXmDMK5n2bMx7E3H/Ikbj9expNlL3SYzASr6NbxztZ+nkE4+UMhRofdVKATTz1r6Tm2mkX0JfzYKMtnn2rMDRcYW3446kT6LGo8fVcyk9jzeDkv5bflDLHwPdDPNG9jHjU1D6TORjFkJmLppQW+pUaZcEas5hXa8qGVvYcPjjuvaQfHw7AiuOP2tm3j3QjuKgmGiAqJR/cuZYOY9jy+eJ+OmOtWE4gdZpIFNVw74QL4MfKcIG9/C88rBIVszSCP21W3ZdHO5MAbewIiTqroFQQ4ahxT1IlW9uyABgoog15rvQ4DvQ4H4VOEIc9pgj2LtRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199018)(31686004)(38100700002)(2616005)(2906002)(478600001)(83380400001)(6486002)(186003)(36756003)(31696002)(86362001)(316002)(54906003)(66476007)(8676002)(66556008)(66946007)(6916009)(4326008)(8936002)(26005)(66574015)(6666004)(53546011)(6512007)(6506007)(5660300002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djV1L1FsSkVZQlNNM25kRnBHYlVsQ1VFeS9scXhiYWJIelZMcDhFYStMTDBn?=
 =?utf-8?B?VmZySTNhN3crZHdhc0lmVndkZ3ZEMU5teW5NMTlzU05QTmNaajNyWVVqM09Q?=
 =?utf-8?B?SWphZ09VNVRlV2MxUU82UElIeHE1NmdZcEE3aFJNR0tyV1RTUTFvTGdBNGV4?=
 =?utf-8?B?OUpUUlhuWkMyaGo3SWNLS3JIbVl4TnVQNUk5RWgrNG1adlZUMVJjVm91ZGdX?=
 =?utf-8?B?a0pnWmc1RHZQYzFzdVZaY3Y4clhzQnNoYUhOVnZnMktpOXlmNFNMSXBSUXBJ?=
 =?utf-8?B?N3Fjc3M4RGVsOHFabHN1Ykt3TDJqRTJPdFVaaXd2Z3gzOUh1dy9IY0hQdEVK?=
 =?utf-8?B?MXQ2UDltalc3bXRtTms4U1VzaE5tYWFsOWhrZHlkeUUwSXdGMkU2WGx0bm1i?=
 =?utf-8?B?TkhueXdjb1dhZWd0SjhQOFJDWTh3YWRJZFlNblNyaUY3MjQ1NVM5cjN3Qm1z?=
 =?utf-8?B?dTFRTzdueXVGWWorSjgvU2hTeEd3K2VoZzFTYzl4SW8yenljckt4MFZOMXd5?=
 =?utf-8?B?QTNzdzlaTTFuaFM2VXNsUmlsUytqUktOM2xmc3AwL1FCUldSZE9nS040RUo3?=
 =?utf-8?B?Uk90NDNMNjl3VlRaZjZQell2elkzQ2g3VE4yR2NSaDVoVXpMelNZYWpwWXNr?=
 =?utf-8?B?YXN5eHpUTUtlcldGM3U5c1h6MTNiZ3BqSTlSUytxd3NmMmpVMnVTcloyeHVY?=
 =?utf-8?B?cmJoL291WlRESVNoNXd6cElKMUxhejQ2R1RKaGlvUVFEQXIwMWlnRDVoVEpz?=
 =?utf-8?B?eGlWRVFlcnBIcEJiK0xBNlR5U3dIbTZMVE9nYldYeVdEOFk5ZkFFcmliQ2ZO?=
 =?utf-8?B?R2NYak5LU0tEQ3dObFZDMVZuajU3Tk9TWXNIMjdSSytNd0x6NHE4azN1NkU2?=
 =?utf-8?B?dWxrNzlSbklKczd0TnNwWGRKVG9EWnpSSkx6TjhCdDI4UW0yV1JEcVFUbWhR?=
 =?utf-8?B?UjNRemN2Ykg2ZnlHWXdrTzczeEs2RDZZSlZzZTBTNTlFbjJHZmZ4NVBsYXF6?=
 =?utf-8?B?cUxjZGFQS0thVFlhOUlUcHoxUzNVc1NjcjBta1RRemcyc2FOeUMxQkJoR212?=
 =?utf-8?B?cFJuRnVnQTNGeWNGQjFOWFdzUzRDMHlJQzNDVEFETUN6NWJRcXZtUENVaU91?=
 =?utf-8?B?dHQwdDlnVjVmV0pjS1RLd0hSczQ1L0k5YTh2NWpVcDZYUExKV1IvTUZZOUFx?=
 =?utf-8?B?NTl0TXdwRTkxaUw1d3BaQ1dLbEtzLzRkUmdSVjl6VVhsdWN0RjNFNWhBeExu?=
 =?utf-8?B?S25YOFBZeXVUd2lMNUU1SjVRME5KNlQ3Unh1UDFGK1FXd1g3V21aS3dhMG96?=
 =?utf-8?B?M1hpZE43NzdlY1hCYWorbG1NZEZqWWZ3OERKZ1VZblVha2hTWmlTbndkbFho?=
 =?utf-8?B?ZjdVRlYyWmptSlhlOWZsd3dDQkV0blNWd0ZSS3NmQTNUL0gvaGRXSUN4Rm9i?=
 =?utf-8?B?akY1VW1FNGxsVW1aSmhUdWYvTFZjeHFNSGZDNTJrTDFrWEFtK1ZReHRVbGM5?=
 =?utf-8?B?cmlOZWc5bWwyZDRHOWdaamxSTnV0Vld3OVZsT25xSk1BckkwQVh5ckNhbVZt?=
 =?utf-8?B?Q0xSaHd3QzBSVmtaSzIrTmE1SlJiR2N4Z1o0SzRCdG84Ung4RkxVTnhzNDJn?=
 =?utf-8?B?SGFFRmd6QlkweTJERHh5Ym4wWWMzLzd0bjg2RWxlbmhvT0Y4aTA4eVcvS3JO?=
 =?utf-8?B?OVM5eElQSUxvR3cwQUg1N015KzA2Mndab1BJaG4wVlFpaVdFV1FIQTVQTzkz?=
 =?utf-8?B?UHBwSjBWS01iUzdBNEJFaE9WNTNBdG9IRnJpWWVENGZFTC9GaURRSTMyR2Ix?=
 =?utf-8?B?bEpiUHU2RnVQZ1N4ckttNHg0aWUyTHJlcVVIakNWbVdnNHhkVSthSThlam5z?=
 =?utf-8?B?NkFoNld2UldQdnBGUUFpbHVTWklRRmhHendsVzMwSUlQR0gwYjZuaWNjb0gv?=
 =?utf-8?B?R2pVVENzQkdSQ2FGRXZSQ1pUYzgzdUE2SWFxTHdQOFRFZWdhMWt0V0d4TkRk?=
 =?utf-8?B?SkFnMmZVS0hoQUFMN2xPUGVMRk10eWltL0R1T3Npdml0Z3dEcmh5aTcvVlVC?=
 =?utf-8?B?L2RhNk85aDNtcXhJVTdiMXFzZUVHUkVzUVcyLzFHc2s3aTg1a215bzUvUWla?=
 =?utf-8?Q?CQgo3ucDS9HNlgBDRaZlGG52O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aba74d5-2843-4230-8527-08db2ba768ad
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 14:03:42.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHaeUI7IjtaZSyGeLeYLVuqXIJYy/1BJXp5QRO4Wbyl1AHPUVES2EyfI/Fuik4eK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.23 um 14:54 schrieb Rob Clark:
> On Thu, Mar 23, 2023 at 12:35 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 22.03.23 um 23:44 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Container fences have burner contexts, which makes the trick to store at
>>> most one fence per context somewhat useless if we don't unwrap array or
>>> chain fences.
>> Mhm, we intentionally kept them not unwrapped since this way they only
>> occupy one fence slot.
>>
>> But it might be better to unwrap them if you add many of those dependencies.
>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>> tbh, I'm not sure why we weren't doing this already, unless there is
>>> something I'm overlooking
>>>
>>>    drivers/gpu/drm/scheduler/sched_main.c | 43 +++++++++++++++++---------
>>>    1 file changed, 28 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index c2ee44d6224b..f59e5335afbb 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -41,20 +41,21 @@
>>>     * 4. Entities themselves maintain a queue of jobs that will be scheduled on
>>>     *    the hardware.
>>>     *
>>>     * The jobs in a entity are always scheduled in the order that they were pushed.
>>>     */
>>>
>>>    #include <linux/kthread.h>
>>>    #include <linux/wait.h>
>>>    #include <linux/sched.h>
>>>    #include <linux/completion.h>
>>> +#include <linux/dma-fence-unwrap.h>
>>>    #include <linux/dma-resv.h>
>>>    #include <uapi/linux/sched/types.h>
>>>
>>>    #include <drm/drm_print.h>
>>>    #include <drm/drm_gem.h>
>>>    #include <drm/gpu_scheduler.h>
>>>    #include <drm/spsc_queue.h>
>>>
>>>    #define CREATE_TRACE_POINTS
>>>    #include "gpu_scheduler_trace.h"
>>> @@ -665,41 +666,27 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>>        sched = entity->rq->sched;
>>>
>>>        job->sched = sched;
>>>        job->s_priority = entity->rq - sched->sched_rq;
>>>        job->id = atomic64_inc_return(&sched->job_id_count);
>>>
>>>        drm_sched_fence_init(job->s_fence, job->entity);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_arm);
>>>
>>> -/**
>>> - * drm_sched_job_add_dependency - adds the fence as a job dependency
>>> - * @job: scheduler job to add the dependencies to
>>> - * @fence: the dma_fence to add to the list of dependencies.
>>> - *
>>> - * Note that @fence is consumed in both the success and error cases.
>>> - *
>>> - * Returns:
>>> - * 0 on success, or an error on failing to expand the array.
>>> - */
>>> -int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>> -                              struct dma_fence *fence)
>>> +static int _add_dependency(struct drm_sched_job *job, struct dma_fence *fence)
>> Please keep the drm_sched_job_ prefix here even for static functions.
>> The symbol _add_dependency just sucks in a backtrace, especially when
>> it's tail optimized.
>>
>>>    {
>>>        struct dma_fence *entry;
>>>        unsigned long index;
>>>        u32 id = 0;
>>>        int ret;
>>>
>>> -     if (!fence)
>>> -             return 0;
>>> -
>>>        /* Deduplicate if we already depend on a fence from the same context.
>>>         * This lets the size of the array of deps scale with the number of
>>>         * engines involved, rather than the number of BOs.
>>>         */
>>>        xa_for_each(&job->dependencies, index, entry) {
>>>                if (entry->context != fence->context)
>>>                        continue;
>>>
>>>                if (dma_fence_is_later(fence, entry)) {
>>>                        dma_fence_put(entry);
>>> @@ -709,20 +696,46 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>                }
>>>                return 0;
>>>        }
>>>
>>>        ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
>>>        if (ret != 0)
>>>                dma_fence_put(fence);
>>>
>>>        return ret;
>>>    }
>>> +
>>> +/**
>>> + * drm_sched_job_add_dependency - adds the fence as a job dependency
>>> + * @job: scheduler job to add the dependencies to
>>> + * @fence: the dma_fence to add to the list of dependencies.
>>> + *
>>> + * Note that @fence is consumed in both the success and error cases.
>>> + *
>>> + * Returns:
>>> + * 0 on success, or an error on failing to expand the array.
>>> + */
>>> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>> +                              struct dma_fence *fence)
>> Maybe name the new function drm_sched_job_unwrap_add_dependency or
>> something like this.
>>
>> I need to double check, but I think for some cases we don't need or
>> don't even want this in the driver.
> I'd be curious to know the cases where you don't want this.. one thing
> I was thinking about, what if you have a container fence with two
> contained fences.  One is on the same ctx as the job, one is not but
> signals sooner.  You end up artificially waiting on both, which seems
> sub-optimal.

Well resv objects don't contain other containers for example.

Then we also have an use case in amdgpu where fence need to be 
explicitly waited for even when they are from the same ctx as the job 
because otherwise we wouldn't see everything cache coherent.

On the other hand we currently handle that amdgpu use case differently 
and the extra overhead of unwrapping fences even if they can't be 
containers is probably negligible.

> Anyways, I can make this a new entrypoint which unwraps, and/or rename
> the internal static function, if we think this is a good idea.

If you think that's unnecessary keeping your original approach is fine 
with me as well.

Regards,
Christian.

>
> BR,
> -R
>
>> Christian.
>>
>>> +{
>>> +     struct dma_fence_unwrap iter;
>>> +     struct dma_fence *f;
>>> +     int ret = 0;
>>> +
>>> +     dma_fence_unwrap_for_each (f, &iter, fence) {
>>> +             ret = _add_dependency(job, f);
>>> +             if (ret)
>>> +                     break;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>>    EXPORT_SYMBOL(drm_sched_job_add_dependency);
>>>
>>>    /**
>>>     * drm_sched_job_add_resv_dependencies - add all fences from the resv to the job
>>>     * @job: scheduler job to add the dependencies to
>>>     * @resv: the dma_resv object to get the fences from
>>>     * @usage: the dma_resv_usage to use to filter the fences
>>>     *
>>>     * This adds all fences matching the given usage from @resv to @job.
>>>     * Must be called with the @resv lock held.

