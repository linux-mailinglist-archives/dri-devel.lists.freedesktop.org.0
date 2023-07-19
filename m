Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C601C759090
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EC810E437;
	Wed, 19 Jul 2023 08:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1538510E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:45:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFVOa2U+eTY4li4hlUgMVAYv4GOCEUoMa2ZFigNIGkhU5pNdkhYC4qqrINhJ6l0am3pdMVvsZSavCurZFSStAZ05wPsj0RvgPZUBZv/Yl0rV8LT6aRZmh+CsEjYyxOFfHrTnOsyE4GqBq+MOOhL59DXn/+lLXYoGc/g+jR978n577TA3lUMBLRyoa8VUTHnUMJaJMrs7wSFj031nBMZSo5D0+8ZaH5ohBuRZFL4ZsHkZj0cI4j2E9VPH+BHNsS4b5jYccUrKVMT3hO6GPCYxugt/BHttH/aL16rJZFlJ89WqbQeyesFbMsHjZ9S3nuez2YNo7b0rCx6syjeod/Ijkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDsn6TdEuHNPql8RRUi967h5QBHsjuIlCTNuR2jfjec=;
 b=gEccOKQFoba00HEybMRhoL6Y4B7OmeQuJPYd/lNPokmkKVJPerEfQoCTekRp5BIvpn6Z05Kdl6kdqyGS91x0wdAlIC/WeZvgJysPraJ+CbSm1Da7N+A3pSqctnRCroStsh++lCf8PtlECDp4rhlAPxHWxOPLQPeDh28mByYi8O4vz1THD6oG6HYuXTGE4x+uZi86S+hFkq9Py0teOPFwmF2EmsKsrVxfgWawHxXOy0FL7LMeuCg5WaQlWWcyqHibDBktJcVxUpGZPqKr4yITBU/TXR3wNzt/hTeWf0+qrT8+1cLsDYspuxAIK1V6mA6cO54b8MOlOvKEqWd5S/1Zwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDsn6TdEuHNPql8RRUi967h5QBHsjuIlCTNuR2jfjec=;
 b=OSO4dbJPuHHZdNWPSSIdWdhxJFWUW4xz/yb+kEUiGmc91I05ynb6MjY6vbivDFGA9q2MiWfThNfv/92vhVejizn+ChLhhB/jhdSYa5hndLRv8AWWMofXc0ZwLvJJsKF1JCJT3LpOuWWhTVFZj4YU7zeVBgDinF/aXEb7PaEAtnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 08:45:43 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d457:e33f:9a7:7a10]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d457:e33f:9a7:7a10%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:45:42 +0000
Message-ID: <66943763-0c30-9603-2a4c-7603ab5ece27@amd.com>
Date: Wed, 19 Jul 2023 10:45:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::20) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|DM4PR12MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: d56d7e95-931f-45f3-75c6-08db88348911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzWOxZymBuCGa+R8HFJzxIRc5icxgooYxIYdDCEZFAVD5yy5KcmEys2HUsYJFdrMzQEd9qcHyn8Wb6+iAgy4VhQS2V9sgWMj1xxiGAs4Ar5uiUB5C8xUP0NBu4My3744CZpEPo4GSkuke1kJ02Gm/s8mwNfhz+MdeeMyot4G/lj7BRTM0UUlRzHNYokbJVTyjVordVz67EcWJjWve5ZP1wfCF12DDrKlC5NqVaK/VYTwfr46rNLQ283b604Es+xSZtfs2HZy4Fgec8HZSbBV4Jrg/kL4zujep2DB/26NHY5JwFldhAyKXBCWpysonR7WowSX4Ab5jVBYW/b8qTj2BsDp2emRBcLPNgInU6M92515Z8Fu7mfnLBfqgaWlwkEezM+Ai16Xp+Le8S3YHg3gkgHit00a/Tmwu3QHEOnP6KdM/HuEood6KaGZuJoWBxWnfJRyDQEr6XnhRN4u9hdeVFkSpvHHTiBMMuo/ghtd3kPS/dC0FvMMGgR0d8EFuf3x6XxjJM0KfizIhmR5B4q6xrAiTFEWQu8f8LmAVk7XZ1Jku35GKe8uN02tr8lojq+FK6wrNt/See+R4SGrF+tVP02anu73cLqV3+ZdBhGz8iZxYEHCOojdfyfdX45exeV54yAq6b5v+yzYBMUL0tMgAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199021)(66899021)(2616005)(53546011)(6506007)(186003)(6666004)(66946007)(66476007)(41300700001)(66556008)(4326008)(316002)(8676002)(7416002)(2906002)(8936002)(5660300002)(478600001)(54906003)(6512007)(6486002)(110136005)(36756003)(83380400001)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdmZWR4S1ZVM2dGekVDMmtjdkdjajUrZXBKM1lEb0wrMGJoNHlIaHE4WjNo?=
 =?utf-8?B?aEtnL3FDWDEzOG5OY056bll6V1A5TVUrSmpSOUUrZEpVUGo2VE9VbWFqUmUv?=
 =?utf-8?B?NjgzOTNUZTQ0YUswTFZpVTY5eW5xMERNbVBmd3h1b0pqRjlJaFBqNTQ4UkpE?=
 =?utf-8?B?MEd5c2ZjQWVhV0VxVFYwcU14THo5NmQ4dk1CdkdHSkVIMmxOeEJWQzNaa1cv?=
 =?utf-8?B?TnNIYW93MDlpT1ErTW1xNlpGc1llQ0dYdlRTVC9NVjBqWEd5VFA0cDJNTzZo?=
 =?utf-8?B?Y0NwbW91Z20rdi9OT1JPZnJLdWxqaG5nWDFpTlY2VU9KUTZucVh1NG8zUXVz?=
 =?utf-8?B?cDU0ZndxVXRjVWVnVm5JdE5jTVZGU2xHUFlBc0JtZS9pTis1QzQ3bG8yaFBk?=
 =?utf-8?B?bDhVR0c4Nk1BdVhHWU5VYmE1VEpveU5McThkWUp2R0cyTVhkS0ZyeFZSVDFT?=
 =?utf-8?B?S2c5ZllNYnIwd1lXZTJ6b3JxSnlvSDJzY2lUWldoQU5kZHFZdk1mMXFsR3pn?=
 =?utf-8?B?TFN2Z0o5Y3E2cWExOFNXenA3R2M2L0NlbzJIT0NGOVlydUpNcDl2OWJjZ0xW?=
 =?utf-8?B?eDNhWEFZR2dQVzlPMWpPR1ZGZk1YYlNxYXBDZzR1d2p0bnNZQXZWcE5MR1hM?=
 =?utf-8?B?MUhEZlBSaStWUFVqSThTN21LTkYxZ3F3T1NOMTNkTzJTaFZtQjB4eTZlNUhQ?=
 =?utf-8?B?d1BpTDV2MVJwNlhZRVdZcVpTUUNpQ1hwK2FzWVpXOWNqWjc0S3hDWVh5Zlhk?=
 =?utf-8?B?d2JEVVpLYmsrNHN6RkV0NUhLMjd2ZnJsMmZ0TGpQUTQ0bC9GSTVmRmNnQ0Vi?=
 =?utf-8?B?TWpydWxWdWtRVTdLdDBzZzJBa01hblBDQWJpMWFkSFFqQkFtbmE2elRPNTFU?=
 =?utf-8?B?YkpjZnJRU2t3cEtZMkdDYis1d1FhMjlHZDdoV1FoK0xxQ2VCU0N4Ky9Yd21E?=
 =?utf-8?B?Q0wxN21vUzRwSzNYeld1SzNIdkp0RjYwazlMOHBDZENpdUpIZ1pwNy9mQUlx?=
 =?utf-8?B?VkppV2JJREovZVNEQkFnR29ORzhyeGFGNUlIalB2MWQ2cjhrNUt0M0JWSU52?=
 =?utf-8?B?RmxJWDZCWWVRbTg1YzViZ1ZMQ2FkNGdXR1o5YWk3UHdid25vQVd4QkFlNW9T?=
 =?utf-8?B?QlRCRHdVNlAyL1ZCNDZ3bHNCWXZSTTQ1Qk5LYTRoZ2dnVVhiTnRoL1lvVFkw?=
 =?utf-8?B?S24ra2FXUzZYNzVnMEdUSjdaTnk0QmoveUJsODNCTlhGL2EyMjRRVGtkYU5V?=
 =?utf-8?B?R3NKK2NCaGk0aHVPOFR4ZWhITk50SG1xM1BmQkJRUlk0RUhCb1p0TFNDcG41?=
 =?utf-8?B?eTVqdytZZHZVenpKRWhPeTZOMFY0T1N2bGNCdGM4MHhMcG03UHRONlFGVFRX?=
 =?utf-8?B?N1hJYWpuamVreis2REQ1UWNzNHJVZGtKWERBU2gyQmZFVTQzRjY5dmZFcUQ5?=
 =?utf-8?B?Yy8vK2g0d1dTV1RMODZ4YmNYU2Q5WlRRL2hEZ0pLRXlzbnFJb0ZKMGxKRzhN?=
 =?utf-8?B?bkRhZXc4TDQzMXRlUEQyZUsrUEpmK1Vmc1Q5T1hHTzhaMDhUMlhjVUtJdFph?=
 =?utf-8?B?UnYwNEhqOS9jR0MrM3JWaVFCVGxVbFdKaEovaDRUUDVhVGpxcWdxaXh4Sllm?=
 =?utf-8?B?WmpHTFliZHQ3bGhTM3NzUXlNMWJiaDhmR0VFcWpld3RNdHhHSDZyZkIwMlp1?=
 =?utf-8?B?elhzQmRuK0R5M2VMQlBSQTVBaFVmWEdtNDRzZ3N5RjJtcmZBcnVOKyttVkJa?=
 =?utf-8?B?OTdLb0w2M0dvaWVuWXlDa0htTjR2eVhJODNqWENMN2ttWXRIWjA3YnNvZ0Uw?=
 =?utf-8?B?YkNhQkk4OW9mZGo3d2E1bkVQMmQ0ZEh1STA5T0VvditBQ2ZIRWQrbDRqOGxR?=
 =?utf-8?B?S0x0U0QzY2hpakFzUWRhc1pLOVFydU9Rc0FwMWQzNFdobFN0UkQ5eE11dVU3?=
 =?utf-8?B?dE9NZUl1T3MrMFAyWFZpbHNQK0VDZDlSeGlYZVg4TjE3MFNMYnE4TlNZTGFF?=
 =?utf-8?B?d2F1eE13YUhxc3ZCN0VIaUZoMnVJeHZFeWN5a3YwOWE2KzBUekphSVljbTh4?=
 =?utf-8?B?UmNsdlhpeXBwa3RHZ1RHeVJ5M25DMzd5eEZ5S05vSjVpMnZRcFdNNmhKY0pT?=
 =?utf-8?B?V01yOVNFSkYwbTRtai9SL2lRbjgzU2p5MmVDak8vdUVtSFpUOEtyYjF5cDgx?=
 =?utf-8?Q?55zM4ogdo4Rw50byGpqnSHrWdAQZxO5puBQWtz4C02Fg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56d7e95-931f-45f3-75c6-08db88348911
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:45:42.5587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYrxUXIT3YT9zstl+0PJ9wK+UTBRW7noCbXs0gA+SLJSiz6rX/77ojFbG1vVoTx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.07.23 um 09:51 schrieb Asahi Lina:
> On 15/07/2023 16.14, Luben Tuikov wrote:
>> On 2023-07-14 04:21, Asahi Lina wrote:
>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>> causes segfaults and other badness when job completion fences are
>>> signaled after the scheduler is torn down.
>>
>> If there are pending jobs, ideally we want to call into the driver,
>> so that it can release resources it may be holding for those.
>> The idea behind "pending" is that they are pending in the hardware
>> and we don't know their state until signalled/the callback called.
>> (Or unless the device is reset and we get a notification of that fact.)
>
> That's what the job->free_job() callback does, then the driver is free 
> to do whatever it wants with those jobs. A driver could opt to 
> synchronously kill those jobs (if it can) or account for them 
> separately/asynchronously.
>
> What this patch basically says is that if you destroy a scheduler with 
> pending jobs, it immediately considers them terminated with an error, 
> and returns ownership back to the driver for freeing. Then the driver 
> can decide how to handle the rest and whatever the underlying hardware 
> state is.

Yeah, and exactly that is absolutely *not* a good idea. Keep in mind 
that memory management depends on all this stuff and signal a dma_fence 
always requires that the hw give a go for that.

If you want to cleanup a scheduler with pending jobs what needs to 
happen instead is that the driver cancels the processing and signals the 
hw fence.

>
>>> Explicitly detach all jobs from their completion callbacks and free
>>> them. This makes it possible to write a sensible safe abstraction for
>>> drm_sched, without having to externally duplicate the tracking of
>>> in-flight jobs.
>>>
>>> This shouldn't regress any existing drivers, since calling
>>> drm_sched_fini() with any pending jobs is broken and this change should
>>> be a no-op if there are no pending jobs.
>>
>> While this statement is true on its own, it kind of contradicts
>> the premise of the first paragraph.
>
> I mean right *now* it's broken, before this patch. I'm trying to make 
> it safe, but it shouldn't regress any exiting drivers since if they 
> trigger this code path they are broken today.

Yes and exactly that's intentional.

What you can do is to issue a *big* warning here when there are still 
pending unsignaled hw fences when the driver calls drm_sched_fini().

But setting the scheduler fence to signaled without getting a signaled 
state from the hw fence is a complete NO-GO.

Regards,
Christian.

>
>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 32 
>>> ++++++++++++++++++++++++++++++--
>>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 1f3bc3606239..a4da4aac0efd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>   {
>>>       struct drm_sched_entity *s_entity;
>>> +    struct drm_sched_job *s_job, *tmp;
>>>       int i;
>>>   -    if (sched->thread)
>>> -        kthread_stop(sched->thread);
>>> +    if (!sched->thread)
>>> +        return;
>>> +
>>> +    /*
>>> +     * Stop the scheduler, detaching all jobs from their hardware 
>>> callbacks
>>> +     * and cleaning up complete jobs.
>>> +     */
>>> +    drm_sched_stop(sched, NULL);
>>> +
>>> +    /*
>>> +     * Iterate through the pending job list and free all jobs.
>>> +     * This assumes the driver has either guaranteed jobs are 
>>> already stopped, or that
>>> +     * otherwise it is responsible for keeping any necessary data 
>>> structures for
>>> +     * in-progress jobs alive even when the free_job() callback is 
>>> called early (e.g. by
>>> +     * putting them in its own queue or doing its own refcounting).
>>> +     */
>>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>> +        spin_lock(&sched->job_list_lock);
>>> +        list_del_init(&s_job->list);
>>> +        spin_unlock(&sched->job_list_lock);
>>> +
>>> + dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
>>> +        drm_sched_fence_finished(s_job->s_fence);
>>
>> I'd imagine it's better to rebase this on top of drm-misc-next where
>> drm_sched_fence_finished() takes one more parameter--the error.
>
> Ah, sure! I can do that.
>
>>
>>> +
>>> +        WARN_ON(s_job->s_fence->parent);
>>> +        sched->ops->free_job(s_job);
>>> +    }
>>> +
>>> +    kthread_stop(sched->thread);
>>>         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>>           struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>
>>
>> Conceptually I don't mind this patch--I see what it is trying to 
>> achieve,
>> but technically, we want the driver to detect GPU removal and return 
>> shared
>> resources back, such as "jobs", which DRM is also aware of.
>
> I think you missed the context of why I'm doing this, so in short: my 
> use case (like Xe's) involves using a separate drm_sched instance *per 
> file* since these queues are scheduled directly by the firmware. So 
> this isn't about GPU removal, but rather about a GPU context going 
> away while jobs are in flight (e.g. the process got killed). We want 
> that to quickly kill the "DRM view" of the world, including signaling 
> all the fences with an error and freeing resources like the scheduler 
> itself.
>
> In the case of this particular GPU, there is no known way to actively 
> and synchronously abort GPU jobs, so we need to let them run to 
> completion (or failure), but we don't want that to block process 
> cleanup and freeing a bunch of high-level resources. The driver is 
> architected roughly along the lines of a firmware abstraction layer 
> that maps to the firmware shared memory structures, and then a layer 
> on top that implements the DRM view. When a process gets killed, the 
> DRM side (which includes the scheduler, etc.) gets torn down 
> immediately, and it makes sense to handle this cleanup inside 
> drm_sched since it already has a view into what jobs are in flight. 
> Otherwise, I would have to duplicate job tracking in the driver 
> (actually worse: in the Rust abstraction for safety), which doesn't 
> make much sense.
>
> But what I *do* have in the driver is tracking of the firmware 
> structures. So when the drm_sched gets torn down and all the jobs 
> killed, the underlying firmware jobs do run to completion, and the 
> resources they use are all cleaned up after that (it's all reference 
> counted). The primitive involved here is that in-flight firmware jobs 
> are assigned an event completion slot, and that keeps a reference to 
> them from a global array until the events fire and all the jobs are 
> known to have completed. This keeps things memory-safe, since we 
> absolutely cannot free/destroy firmware structures while they are in 
> use (otherwise the firmware crashes, which is fatal on these GPUs - 
> requires a full system reboot to recover).
>
> In practice, with the VM map model that we use, what ends up happening 
> when a process gets killed is that all the user objects for in-flight 
> jobs get unmapped, which usually causes the GPU hardware (not 
> firmware) to fault. This then triggers early termination of jobs 
> anyway via the firmware fault recovery flow. But even that takes some 
> short amount of time, and by then all the drm_sched stuff is long gone 
> and we're just dealing with the in-flight firmware stuff.
>
>> In the case where we're initiating the tear, we should notify the 
>> driver that
>> we're about to forget jobs (resources), so that it knows to return 
>> them back
>> or that it shouldn't notify us for them (since we've notified we're 
>> forgetting them.)
>
> That contradicts Christian's comment. I tried to document that (after 
> this patch) the scheduler no longer cares about hw fences and whether 
> they are signaled or not after it's destroyed, and I got a strongly 
> worded NAK for it. Sooo... which is it? Is it okay for drivers not to 
> signal the hw fence after a scheduler teardown, or not?
>
> But really, I don't see a use case for an explicit "about to forget 
> job" callback. The job free callback already serves the purpose of 
> telling the driver to clean up resources associated with a job. If it 
> wants to synchronously abort things there, it could easily take over 
> its own fence signaling and do something with the underlying stuff if 
> the fence is not signaled yet.
>
> In my case, since the driver is written in Rust and free_job() just 
> maps to the destructor (Drop impl), that just ends up freeing a bunch 
> of memory and other objects, and I don't particularly care about the 
> state of the firmware side any more after that. The flow is the same 
> whether it was a successful job completion, a failure, or an early 
> destruction due to the drm_sched getting torn down.
>
>> (Note also that in this latter case, traditionally, the device would 
>> be reset,
>> so that we can guarantee that it has forgotten all shared resources 
>> which
>> we are to tear up. This is somewhat more complicated with GPUs, thus 
>> the method
>> pointed out above.)
>
> Yeah, in the firmware scheduling case we can't do this at all unless 
> the firmware has an explicit teardown/forget op (which I'm not aware 
> of) and a full GPU reset isn't something we can do either. Hence we 
> just let the underlying jobs complete. In practice they tend to die 
> pretty quickly anyway once all the buffers are unmapped.
>
> ~~ Lina
>

