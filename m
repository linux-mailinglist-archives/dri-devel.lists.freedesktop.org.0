Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03F7A47C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 13:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACFC10E05C;
	Mon, 18 Sep 2023 11:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B6A10E05C;
 Mon, 18 Sep 2023 11:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+vOd9NUgw5gtBrgzg4Iu8RO9CaHm0fPrrYLsk9vKu4WCpaEpgZx+hQUKZO/bA9GaD/ADNDDToNJsVVuQfzwGQLAeibskzpzKhXtI6g4foKfndGL3a5ZBR6nIF3WVTNu8OmfTTv5jaGi7tr9yU/tE0WSUD0XZTiAPKggPsaAPNcWJxfSfJH5OTFN7yzNSU5DYNXUxOaHfTKTsIHwu0vqiRz6YQbV/dzQbQULx8GqMdwC5wlBMhD/n5MFibLt/PYWPUXM85KNbfcrmKpvBLLWUCLcMAFZs6n5F9wO81sUfI1V6V70X+jJSy6Vft9vxYakZkdrJg7ByjWUpJmsV0szCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJMHKFDTR/OflUM5kbpwwyNSpFlP1tf47R40oIhcohM=;
 b=l3cFVyGztId8woxWVRyvZPHJZSK2IEaRYZElwwa+agoejVmMtQ7QqeqWcRgOTuboya8FdfgSkVPMugV4jiXpmV6HRQYpd9/PpqRGwcY64e1DSo2cnLEIoUWNn6k7VF8AX7sQES+TaaiY00fHp1Ns1pro/4pgYFxjoBcpg9Zw1VpFSKwuGhSYGaPjjQgiqtJPqtJOKCS95zupnXazf4O7/iMejuiIIXjsHo/fsF2hhofbZNulPWw96IeixC44irBzVP2MIed24az4djpamt4BT46vdFOZASRItfue5LPiyZVYLXsdWlvbcqtjy74ciEHE4k0RMHIHRlbvYlPKNuWHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJMHKFDTR/OflUM5kbpwwyNSpFlP1tf47R40oIhcohM=;
 b=wJc+lWWWjxYEloUcOox9dh8m73Qm6xUmCO9r36AR8PV/p3R1xhtwuaJydtmvIWvWWcyk5ZfAU2F29WSAUSXhUzm4ruMr/Lpq16KxH6QRgTwwTLdXSYzfafDXukh0luTFH/4Hez7jJE/VeeIGWGZs6dADwijDT40X22m6BHJ5Wis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:03:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:03:36 +0000
Message-ID: <9bbaa40e-d839-10c6-5a5e-c9cfb36c578f@amd.com>
Date: Mon, 18 Sep 2023 13:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 11/13] drm/sched: Waiting for pending jobs to complete
 in scheduler kill
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-12-matthew.brost@intel.com>
 <2b5c148c-51e6-c9f4-b950-fe16db5bad17@amd.com>
 <ZQB57X3TI2m2cECE@DUT025-TGLU.fm.intel.com>
 <be7fe6bd-0744-b33e-71b0-2c66eaa39382@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <be7fe6bd-0744-b33e-71b0-2c66eaa39382@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c88d6de-8665-47c1-5f91-08dbb836e837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ud/SlZzp3mfhMuLZiYBgu+2a0pkZO+CLbPqWRTNWAPJUl41jZ5PBaOV8ie+k1OU3uFUj+VipACh8F/jxEsAx6YpuFI8qyRBBAyUwgIxsOjxmR+mZqedUkCFBtsA+FX3cVSmabueUxMQF2T3SSgxpYmDeDvdNJD2o9Job/n/FP3An5PUqjGa/NKBrFYmgjqtbMxVSwukQXSq+odt3XPux+pZa4BkUe96EuxRUvSeDLruduo0HTMTzYw0koUqG2f9z8HyGQwmZtyD4yqRtj5SDN4eKhl6f4cJUs9bxAn88JAUs9RISncuulS9dNkXH353z3EZP87mTbcgwN10mzgB9rg7zhi5B7XwjqPE43My5MXKTRcDGcEyWvIIiasNaeWBgw8/or3J8tFC8XfBLSlz32+QKu5/i/e/A6ugcs2zcdCSuXgSVk53N7oWMZs9V6QFi2Jcs1Hr41B92S0zebeHTiLvUSdEqMYIyaCw9ykXX3dIEsydp3GRw217zAFk85XsXQwflcmW+xRr0JrW/xCaFyZdgpYcxfPJHpf10J8WLrQiSm0Po48Uy34pvuOzyl6OaFEMTaYNu+7myyRT6z5r9yAZl/5YmMFkQxGoo+m0hxTptXK+tNn5pG6WbIyL+KUUOr16OSvTAm3Df+3gamov96g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(1800799009)(186009)(451199024)(31686004)(36756003)(86362001)(38100700002)(31696002)(6486002)(6506007)(53546011)(478600001)(2906002)(5660300002)(66556008)(66946007)(66476007)(8936002)(6666004)(8676002)(4326008)(66574015)(6512007)(83380400001)(41300700001)(7416002)(110136005)(30864003)(316002)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVuWVJrU2hVdVNRSjRGQ3cxcHJNelB1aHFvc2V5OFlWTldCWXoxWmdZcDE1?=
 =?utf-8?B?SnpFV2t5ZmJEa0JEWWlhZnFjRU9pYllhcmVKNEdiangrenNvSmo2NjRHWmth?=
 =?utf-8?B?TytjcXJPZ2dVTzJYUjRIeDYyWlpJUGdnbGJnM0xHTVRNSG1Wa3JuYlY4MmRp?=
 =?utf-8?B?a3lhTE5icG55VmxMeXZXUm5VL3VJTlpBUDdFMURab2J4d3Q4aXFkTTI1VWN6?=
 =?utf-8?B?bi9LV1EyOTRDQys3enZLOThMemVXN21wMENPOVIyZS92V0VGWFlTZXNtYnZP?=
 =?utf-8?B?U0llVjNLaWxsR2VTUnR2Q1ZHbDMzSUJmZ0pNS2d5Ui9mWEhHT0JUVmhMU3RM?=
 =?utf-8?B?YXdWN2Q1R1JZSEtBY0FzOXVXU3RXTHF5ZHZCQkhJVEtGVFJWZjVpNy9MR2w1?=
 =?utf-8?B?b2FwclVoZzg1UllFVUdUZ3FQSEJGUTdqbTlkYXdVMnZCVnVpV21wUVJVL0N0?=
 =?utf-8?B?TmdYdXRXczYvQjh6SlcrVHNtdEdyTmZJTjRwYjg3Z1g1TXovS2xjWUt0MllI?=
 =?utf-8?B?Z3E1MG4zdis5NU55d1RacmRjbmxqNzlXNlhrSFNDSWkwd1RIaEVKU2EyZ283?=
 =?utf-8?B?M1VVMEEzaHBTM3hRZG94WVltTTJoSXg3OVk3NnFhSnZ4UzZjZ2FuMUxzNjFU?=
 =?utf-8?B?SHROYWFBNWVlYktTU1UrY2xvNlhqa2RSY3BSUjQ2Y2tpR0pPenRiUzExWXRS?=
 =?utf-8?B?NDAvREN2TUl5L2tKK1g5Tmlvenk0bzBSS2EvSXU5VG1yTFRrLzM4SFhvMHRD?=
 =?utf-8?B?b2JCTm1BY2xOemcrTE5CY1ZlTTNUVEwwSS9pVWI1Z1F2NFg5Qm1pcXpNeXdT?=
 =?utf-8?B?dHZhZXVLVi96RU5YRWExVXhHWHZEY3NGdE1UMUh5YWI3RVdKSDQwS1dWRWRK?=
 =?utf-8?B?TlJlenpCTXhtcFVVU2pFMUNzRUptVjF2K05rL1ZZaGtZckNzVmJSRUhIT1Z2?=
 =?utf-8?B?YWVDT0ZBellzeTdwdlUxMG5sUEZIQ05TTEVuNDBkYi9rQy9yaW9jeFVnRS95?=
 =?utf-8?B?dzVBMWx5OHFZWm9TVHc1RkhBcklVU2FCL1BRbXBJaHk2VnoybDNsdDdzcUE5?=
 =?utf-8?B?ejYvMDNLbXhXc2pnVWV2bzV5eWNPTkZRTHI3NjhuQUE4N0lWTnRTZVpOWHl3?=
 =?utf-8?B?bDhXdWxKWUN6aEp1SXpyNmNZM3A5cS9veE5PSnVtcGNzR1haRWFrZ0IrOHdU?=
 =?utf-8?B?SFcwbWtua1pBdThiT3lZNkE5RFpZeUNjalFHWFFsNGZMMDVISEhoWndxTTgz?=
 =?utf-8?B?TlRiT1VLSXVkS3R2aVhVWWY2aGdkdlRHaksrOGZ4QVp5UHFvbUtnMVNwNW9F?=
 =?utf-8?B?OTF3b3g3R0k1elEwQUt4Vms5ZVR2ZGZnL3pDQ2QyWkgvSTBEM2NRRXQrNUR1?=
 =?utf-8?B?bEtUWkpuKy9qZ2RnSGk1L2RQRytodi93UXdESFZwb21LS0tub3Bzd3VkUStz?=
 =?utf-8?B?bG12citGS2ZNejV1cy9peDlXUFVMZlZ5UGNva1hQa0IwbEMyVnVOYXJ0eHRw?=
 =?utf-8?B?RlM1Mm9DRHdZVXpuN05Fck4rUlFBY2dUQzZ2ai9uTG1lZVBMWDhGQVVnVWR0?=
 =?utf-8?B?cEpXVWlSVXI4clcwazVObE1FVHdSYmxjMmdzWENMMVhXRUEzUjFPSzM2c0Vp?=
 =?utf-8?B?L2hVeDFBWHEzazhwaVZwM2V3enkwNENUU2xxaHFRTUQxOFhDRysyOXg4NUQ3?=
 =?utf-8?B?bHBMKzdRdjhhaWpOWGpINnovc2N6R041RGJna0hPRjROS0g2S3hjZndNc1B2?=
 =?utf-8?B?SEk3bVV1OC9BZlNwQ2V0cERHazdYL2Z2Ynd2TkdVYUc2NVFvM0dFOTR3bG5x?=
 =?utf-8?B?TENLM2hsaXVoekVDTGhaWjZWYXZoSlJSUWtJUW4rZFgrQ2c1NmY5NkZ1RStP?=
 =?utf-8?B?WlpkZ1kxanNQODQ0Zkx2dmpjQmFPWXV1SGpXM3p3K29JaXdLYWFoZEJSMW1I?=
 =?utf-8?B?Ujhtalg5S0xRSmtQQUViL090NHNNOG9vQ0M0Qk12SUtDdTM0TEltTWNPd1dM?=
 =?utf-8?B?NGZJMmFBK0Q2bFhTSDBvai9RY1ZFd0hSMDAvdnVVd0w3dXhLYmhmeGlCSG42?=
 =?utf-8?B?NTJkM0h4Ri9BMENGNGkxZlBCeGs0L0VKUFdqL29xd0tQQXBrZzJRMG5nQ3Z4?=
 =?utf-8?Q?Vywc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c88d6de-8665-47c1-5f91-08dbb836e837
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:03:36.8480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tb2fV0wTDvKZzOOOq8TkXmb7KUuv5fqlEHEM0rtXf07P6okoz+pjgP20n5+DCh8U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7982
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.09.23 um 19:52 schrieb Danilo Krummrich:
> On 9/12/23 16:47, Matthew Brost wrote:
>> On Tue, Sep 12, 2023 at 11:57:30AM +0200, Christian König wrote:
>>> Am 12.09.23 um 04:16 schrieb Matthew Brost:
>>>> Wait for pending jobs to be complete before signaling queued jobs. 
>>>> This
>>>> ensures dma-fence signaling order correct and also ensures the 
>>>> entity is
>>>> not running on the hardware after drm_sched_entity_flush or
>>>> drm_sched_entity_fini returns.
>>>
>>> Entities are *not* supposed to outlive the submissions they carry 
>>> and we
>>> absolutely *can't* wait for submissions to finish while killing the 
>>> entity.
>>>
>>> In other words it is perfectly expected that entities doesn't exists 
>>> any
>>> more while the submissions they carried are still running on the 
>>> hardware.
>>>
>>> I somehow better need to document how this working and especially 
>>> why it is
>>> working like that.
>>>
>>> This approach came up like four or five times now and we already 
>>> applied and
>>> reverted patches doing this.
>>>
>>> For now let's take a look at the source code of 
>>> drm_sched_entity_kill():
>>>
>>>         /* The entity is guaranteed to not be used by the scheduler */
>>>          prev = rcu_dereference_check(entity->last_scheduled, true);
>>>          dma_fence_get(prev);
>>>
>>>          while ((job = 
>>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue))))
>>> {
>>>                  struct drm_sched_fence *s_fence = job->s_fence;
>>>
>>>                  dma_fence_get(&s_fence->finished);
>>>                  if (!prev || dma_fence_add_callback(prev, 
>>> &job->finish_cb,
>>> drm_sched_entity_kill_jobs_cb))
>>>                          drm_sched_entity_kill_jobs_cb(NULL,
>>> &job->finish_cb);
>>>
>>>                  prev = &s_fence->finished;
>>>          }
>>>          dma_fence_put(prev);
>>>
>>> This ensures the dma-fence signaling order by delegating signaling 
>>> of the
>>> scheduler fences into callbacks.
>>>
>>
>> Thanks for the explaination, this code makes more sense now. Agree this
>> patch is not correct.
>>
>> This patch really is an RFC for something Nouveau needs, I can delete
>> this patch in the next rev and let Nouveau run with a slightly different
>> version if needed.
>
> Maybe there was a misunderstanding, I do not see any need for this in 
> Nouveau.
>
> Instead, what I think we need is a way to wait for the pending_list 
> being empty
> (meaning all jobs on the pending_list are freed) before we call 
> drm_sched_fini().
>
> Currently, if we call drm_sched_fini() there might still be pending 
> jobs on the
> pending_list (unless the driver implements something driver specific).
> drm_sched_fini() stops the scheduler work though, hence pending jobs 
> will never be
> freed up leaking their memory.
>
> This might also be true for existing drivers, but since they call 
> drm_sched_fini()
> from their driver remove callback, this race is extremely unlikely. 
> However, it
> definitely is an issue for drivers using the single entitiy policy 
> calling
> drm_sched_fini() from a context where it is much more likely pending 
> jobs still
> exist.

Yeah, that's exactly one of the reasons why I want to get away from the 
idea that the scheduler is necessary for executing the commands.

What this component should do is to push jobs to the hardware and not 
overview their execution, that's the job of the driver.

In other words drivers should be able to call drm_sched_fini() while 
there are jobs still pending on the hardware.

Also keep in mind that you *can't* wait for all hw operations to finish 
in your flush or file descriptor close callback or you create 
un-killable processes.

Regards,
Christian.

>
>>
>> Matt
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>>>    drivers/gpu/drm/scheduler/sched_entity.c    |  7 ++-
>>>>    drivers/gpu/drm/scheduler/sched_main.c      | 50 
>>>> ++++++++++++++++++---
>>>>    include/drm/gpu_scheduler.h                 | 18 ++++++++
>>>>    4 files changed, 70 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> index fb5dad687168..7835c0da65c5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>> @@ -1873,7 +1873,7 @@ static void 
>>>> amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
>>>>        list_for_each_entry_safe(s_job, tmp, &sched->pending_list, 
>>>> list) {
>>>>            if (dma_fence_is_signaled(&s_job->s_fence->finished)) {
>>>>                /* remove job from ring_mirror_list */
>>>> -            list_del_init(&s_job->list);
>>>> +            drm_sched_remove_pending_job(s_job);
>>>>                sched->ops->free_job(s_job);
>>>>                continue;
>>>>            }
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 1dec97caaba3..37557fbb96d0 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -104,9 +104,11 @@ int drm_sched_entity_init(struct 
>>>> drm_sched_entity *entity,
>>>>        }
>>>>        init_completion(&entity->entity_idle);
>>>> +    init_completion(&entity->jobs_done);
>>>> -    /* We start in an idle state. */
>>>> +    /* We start in an idle and jobs done state. */
>>>>        complete_all(&entity->entity_idle);
>>>> +    complete_all(&entity->jobs_done);
>>>>        spin_lock_init(&entity->rq_lock);
>>>>        spsc_queue_init(&entity->job_queue);
>>>> @@ -256,6 +258,9 @@ static void drm_sched_entity_kill(struct 
>>>> drm_sched_entity *entity)
>>>>        /* Make sure this entity is not used by the scheduler at the 
>>>> moment */
>>>>        wait_for_completion(&entity->entity_idle);
>>>> +    /* Make sure all pending jobs are done */
>>>> +    wait_for_completion(&entity->jobs_done);
>>>> +
>>>>        /* The entity is guaranteed to not be used by the scheduler */
>>>>        prev = rcu_dereference_check(entity->last_scheduled, true);
>>>>        dma_fence_get(prev);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 689fb6686e01..ed6f5680793a 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -510,12 +510,52 @@ void drm_sched_resume_timeout(struct 
>>>> drm_gpu_scheduler *sched,
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_resume_timeout);
>>>> +/**
>>>> + * drm_sched_add_pending_job - Add pending job to scheduler
>>>> + *
>>>> + * @job: scheduler job to add
>>>> + * @tail: add to tail of pending list
>>>> + */
>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail)
>>>> +{
>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>> +    struct drm_sched_entity *entity = job->entity;
>>>> +
>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>> +
>>>> +    if (tail)
>>>> +        list_add_tail(&job->list, &sched->pending_list);
>>>> +    else
>>>> +        list_add(&job->list, &sched->pending_list);
>>>> +    if (!entity->pending_job_count++)
>>>> +        reinit_completion(&entity->jobs_done);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_sched_add_pending_job);
>>>> +
>>>> +/**
>>>> + * drm_sched_remove_pending_job - Remove pending job from` scheduler
>>>> + *
>>>> + * @job: scheduler job to remove
>>>> + */
>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job)
>>>> +{
>>>> +    struct drm_gpu_scheduler *sched = job->sched;
>>>> +    struct drm_sched_entity *entity = job->entity;
>>>> +
>>>> +    lockdep_assert_held(&sched->job_list_lock);
>>>> +
>>>> +    list_del_init(&job->list);
>>>> +    if (!--entity->pending_job_count)
>>>> +        complete_all(&entity->jobs_done);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_sched_remove_pending_job);
>>>> +
>>>>    static void drm_sched_job_begin(struct drm_sched_job *s_job)
>>>>    {
>>>>        struct drm_gpu_scheduler *sched = s_job->sched;
>>>>        spin_lock(&sched->job_list_lock);
>>>> -    list_add_tail(&s_job->list, &sched->pending_list);
>>>> +    drm_sched_add_pending_job(s_job, true);
>>>>        spin_unlock(&sched->job_list_lock);
>>>>    }
>>>> @@ -538,7 +578,7 @@ static void drm_sched_job_timedout(struct 
>>>> work_struct *work)
>>>>             * drm_sched_cleanup_jobs. It will be reinserted back 
>>>> after sched->thread
>>>>             * is parked at which point it's safe.
>>>>             */
>>>> -        list_del_init(&job->list);
>>>> +        drm_sched_remove_pending_job(job);
>>>>            spin_unlock(&sched->job_list_lock);
>>>>            status = job->sched->ops->timedout_job(job);
>>>> @@ -589,7 +629,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>>>> *sched, struct drm_sched_job *bad)
>>>>             * Add at the head of the queue to reflect it was the 
>>>> earliest
>>>>             * job extracted.
>>>>             */
>>>> -        list_add(&bad->list, &sched->pending_list);
>>>> +        drm_sched_add_pending_job(bad, false);
>>>>        /*
>>>>         * Iterate the job list from later to  earlier one and 
>>>> either deactive
>>>> @@ -611,7 +651,7 @@ void drm_sched_stop(struct drm_gpu_scheduler 
>>>> *sched, struct drm_sched_job *bad)
>>>>                 * Locking here is for concurrent resume timeout
>>>>                 */
>>>>                spin_lock(&sched->job_list_lock);
>>>> -            list_del_init(&s_job->list);
>>>> +            drm_sched_remove_pending_job(s_job);
>>>>                spin_unlock(&sched->job_list_lock);
>>>>                /*
>>>> @@ -1066,7 +1106,7 @@ drm_sched_get_cleanup_job(struct 
>>>> drm_gpu_scheduler *sched)
>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>            /* remove job from pending_list */
>>>> -        list_del_init(&job->list);
>>>> +        drm_sched_remove_pending_job(job);
>>>>            /* cancel this job's TO timer */
>>>>            cancel_delayed_work(&sched->work_tdr);
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index b7b818cd81b6..7c628f36fe78 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -233,6 +233,21 @@ struct drm_sched_entity {
>>>>         */
>>>>        struct completion        entity_idle;
>>>> +    /**
>>>> +     * @pending_job_count:
>>>> +     *
>>>> +     * Number of pending jobs.
>>>> +     */
>>>> +    unsigned int                    pending_job_count;
>>>> +
>>>> +    /**
>>>> +     * @jobs_done:
>>>> +     *
>>>> +     * Signals when entity has no pending jobs, used to sequence 
>>>> entity
>>>> +     * cleanup in drm_sched_entity_fini().
>>>> +     */
>>>> +    struct completion        jobs_done;
>>>> +
>>>>        /**
>>>>         * @oldest_job_waiting:
>>>>         *
>>>> @@ -656,4 +671,7 @@ struct drm_gpu_scheduler *
>>>>    drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>>>                 unsigned int num_sched_list);
>>>> +void drm_sched_add_pending_job(struct drm_sched_job *job, bool tail);
>>>> +void drm_sched_remove_pending_job(struct drm_sched_job *job);
>>>> +
>>>>    #endif
>>>
>

