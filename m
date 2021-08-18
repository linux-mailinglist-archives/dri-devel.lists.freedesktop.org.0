Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E163F06D5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315FC6E7FA;
	Wed, 18 Aug 2021 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F1C6E7E6;
 Wed, 18 Aug 2021 14:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMr94QFtUpmQnPyZQqBMuT5fguNddEO1Lr+yxOrWEXjfUWC2RcHCV6NjHEdY+Fyx/ZwXHKyNmsV4W2hrj+KHQNu3WhROTxkI/N3HHWebBmgqMD5G3exRwy87QQyRenm00NedGeZ3G0UHJnF+pD5Sx9utY6lub2/IqWPShhLXLx80n6xk4Vjr49rldU6hJj/h1uqYUh3j5vjKDcy2/PjR19gOOdwDMUt+MNkel3reIwWoABKN7ENHcy0U1iE9J+xeKYnE7M8aAQUOrxqdg/jC2VUmtQqTFHdDo/aZzd6fGbApLPIDSDNwvBnxZwiO/H/Zs7yKwU8Aw0ZcTb4AQCk58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N893ViI0HA11Pe1MHYdnOEiWdvM45oMafwrI+DmHuZs=;
 b=KfWRaZn+EMV57tG/DFAZIJZum/2zQ9uui5DJl8jDWmYMCvfnV4bgB/P9RjTXX6jVMlLgXAMXyPnGN4rBXLuYaGYFtBzO7QY97ig+aB9aF9SazdV0mlKNWqDwpq4lCbmJRe2M01ZROiKQTwt6dS6F3xS5ITfpX5eRjAUbvfY0M9vsdwjWPT2sOC83wl7q3Q62KyVUw1OQ1PORPgHG7BepPe4CSrSaVh8yNfocFRgCy1PV79ZBi90iemoqgDvH5PA6KM1KgzYVJRMbCUh+oyZ5+RpKvsJ4rz1qmzCISQXYvf6Ebu6RWjInjTukmuaRBbGXloFyst0E1k65qC2LQ7uXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N893ViI0HA11Pe1MHYdnOEiWdvM45oMafwrI+DmHuZs=;
 b=d4wyhPxcJlF5pazaYMIwDreafnN5CKC2MhM5FBSEMgIJ+qsI8gIUAU1kxX2cpht33OieXck+/+B8eLEHkxlGMw6JsJq3lu2/BOx5VGDTdwSdU8TeRsj2QitU3ad8iWyLMtEjzbuTSfRTeI+x2J+zWXSS5nEl/f+qgkzcC1Uko5k=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Wed, 18 Aug
 2021 14:36:34 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 14:36:34 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
Date: Wed, 18 Aug 2021 10:36:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::32) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8030:531a:c97a:dc26]
 (2607:fea8:3edf:49b0:8030:531a:c97a:dc26) by
 YT1PR01CA0153.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 14:36:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef78030e-6f23-47bd-4018-08d962559406
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2847763FC7A8F38277DDD68CEAFF9@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XYW8DaxBc3w/vdtwnGcPLlbZx7mRZZc2FClevPFIMIWuYaOzORgea6iQuQ6MM+4sp7yK4qwx8sDkyA47anWXsDe4yCNM2P5PyDKTMV7UIYDXP9173LrO7NNJKi5BxrFbcEQdElEAUMM51ChyeDGLaahJbvXGSFmAidQCMyExGxRMHKMHdhYEDSGH3UU1s7CgKKOtH3hWMJrGaNRn0lBo000MsF0dTj8dHdX76z8sIl3e3nGlRzUnlxfHzZDrcM2guSmzq5oN928EcOffNL24CZshVG8of5wvHThrpvlGg1w74Dt7yT/1nH65xx9Xyi91q4lAyp58fLiocA3ocd5Plx+Yafn7jYCl5VOJZPIgqDbgrAIoWcXwNM0UXrikfljl4m2XCk8KUgIs9ZQ3hfbq1IKJEOtELdqFeEUdrpILpCsAqdRFZPGbp6cdHwb+Iudw6DjB4hcKIsAfOImcLcQJ6bo+Gu5a/KGA4qmPYiWnfcERFZ5PN3/eCF/vj5RThMamgUvBjkeDkF/5UjX3S+kxwU+ZF1zeQc+8jOIxf2f5/3TW+3dsy8iQBan1CkI/cuGWBghmbTr0dzjs8xEVKXYqp72U6+IQS3WUHSAuDD/yGUlAC/DaWdXg21VeOee7VDAG0F0mFefZkyfAV3sYVSNDI03Ugy3r5j/jSgfuQauZBjRM4f/KNAjzgJVutFk2UktG7My59M/nhDEiVkk/6iHPTq5GjkPa5T14RrWnyHfnVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(66946007)(66476007)(38100700002)(83380400001)(66556008)(36756003)(8676002)(8936002)(2616005)(4326008)(44832011)(186003)(316002)(2906002)(53546011)(86362001)(5660300002)(54906003)(6916009)(31696002)(478600001)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emU5NUxGbDRyMU90MlY4dkE2bkJ3ZTJmL3puUEtFK0dSeUxtanRSZGxHTzQx?=
 =?utf-8?B?VEtMQXo0d0kwWERDb01RRVBrNTIwVkZBREh6aDVxSDZEZG9FRFBvY0ZObnpq?=
 =?utf-8?B?VmtrY2h2TGdoaDBtd1hodXpsbmE2RllJaTg1bzRoeS9yUmRGSEZXK09jRVQx?=
 =?utf-8?B?UUF0RW1GQzlYN25oeDIrb3JxL1JZcjVMSTdlK1BzMWM5M1hkVVVCdVJWMy9S?=
 =?utf-8?B?bjlQU2tuM2kyR0xpZkM3WEIwWW5jZ3dHVHdPTnJMaXFvSnpxNjZlYm1WZEV5?=
 =?utf-8?B?NHdieGxWUXBQZHR0VVAvekV0ZG1Ia0g0LzRBZmh4aEJoN0xWSVdZVXU3eVJS?=
 =?utf-8?B?SnIvS0JLYXZ0dEJmK1ZyVzFlMFNGSXB1VjNMeWxWZzlxREJXdDl3dTNIeGU1?=
 =?utf-8?B?U0pGRHh5T3hXRERqekU5Y0ZHWEpha280cGVjdmIrSk11WE4wUVZUV3J1VHFo?=
 =?utf-8?B?bVh1SjhjbldYUGFkTlk2Y0pCTm1US1JJN1VGWWZNNmRicllaV1FqeEp1T0tG?=
 =?utf-8?B?azZUNU04Sm04QUI5YmxZb3RGMWJYd2c5NTZmOFg0dDZQOGJGS3h4V3dRbkRU?=
 =?utf-8?B?TkpGMUZNWk5RYlNJN3JId0pITFovWVoxRjNKc2hYMFE4aU5lZk1mbUNCSmhl?=
 =?utf-8?B?S3hKM2ljbHkyT2FVQXN5amlQSHlza0lpVkZtQnI5dTFVOXduOFcxQnFWcnFq?=
 =?utf-8?B?N0NZRXJDTHhwZ2lQUTZGQlNHRmYvWUVCTS92OU9waGN0Mk9vcXRnQ3pGeVg2?=
 =?utf-8?B?ZFduaGY3ZmdHNEhFZ1FsREc3aFV6NGFpSWhPUFl3OXFua2gvSGhNMzgzeitr?=
 =?utf-8?B?bUhkVkVVUEVhanZ5dzZ0VEpicnJGNFY4RUJUQ3FEeDNXR0lzVHY0YWIwTS9m?=
 =?utf-8?B?N1o0TStDUjBtVGJOMFNmQ1FKS3JkSHZTVEttdkRQYkJJc0FDelJ0Ri9RSVhU?=
 =?utf-8?B?RGRvRm1OVWZqbUQ5dWNXSGc0N0RUQnFFVEJuc1Y3eUZ5TkpGQjE2T2dwOUoz?=
 =?utf-8?B?ajRxaW5pOWdFTGxTaXF2aDFDdjZvTDlpcGxUTitRMnM0bkxDU01kK3ZWdW9D?=
 =?utf-8?B?WVc3aGxLMEFtWFhmZytvdmkyRi91TjJ0czVCSG16RWVEQjBBZUpiTlhLVUJL?=
 =?utf-8?B?RlpkUXN1K0Ric2J4U3pVdkJyVnZnckRYWlp3K2RnRCt1V21wRmV2Q2hTRi9u?=
 =?utf-8?B?SnRTNm9wcU1rTFhHK2Qyc3VpY1pWVmR1RDZuVW5IM044N005RjVGWm1XWGNH?=
 =?utf-8?B?dnVWZVV5VURPR0EwQ09nai9CVG45TzFUekpVbVpnRGVnMjQ1RkFUVG1uTTQv?=
 =?utf-8?B?TmE3RGxPWkI1Znh2Z1NKVnVLVGsyMC91Q3VTRG9TeENpOU1UWCt6alJNWThN?=
 =?utf-8?B?MUlGajkwSjJZSTVnSnlHTXAwNWxXaXR1VVJmc3lyeXRTQ3RhZkZNRlB6NEF3?=
 =?utf-8?B?dkNpdDkya1pQM3pqVzFiOVg2SkdmS25uNmZUTmRhdkIwcUE0djlqT2dKblJo?=
 =?utf-8?B?bnp0UWV1RzRPR0E0c0kwdDlVMjZUVWU3R0dleC9NSWZUQWdFUFRMTVJFU09X?=
 =?utf-8?B?Qzh5SkFRZWNqdEdUemlhQ3NOelNFTWdzaW0rZ3U4dUsxNndjUG1ZdmgwdmRV?=
 =?utf-8?B?aFg4bVJGSUVITDY5bm5GdzVzWnc4ejB6WDR6QTg4ejR5dDd1Y25JdlBHbk5s?=
 =?utf-8?B?UUczTmVFQ2hpQnA0WmdHUGVTa3FxcWhyZFNxaGN6ZFBsNHdnNGJMK1RZODFq?=
 =?utf-8?B?eVp0bkdUYk1RVWxSbm9kalRCTnNzNGNuSHFDSGdwNjdSeWdWd0tBaW5EWFFO?=
 =?utf-8?B?QndmM3NDQk81b2xtNS9uQlRqcTA0ZXo4SzM5VEJjTkt3ZVIxVWM0bjd1RXQv?=
 =?utf-8?Q?EW2POJuTc8gS2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef78030e-6f23-47bd-4018-08d962559406
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 14:36:34.5725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpQ2ZF8B9OGp+QlH9/62fdvzYBTb4VJGdrkvFyJlV28OoFf3Br3QvASuQjfHwYu2Knm+WCAQ0BE92atQ1J3AxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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


On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>
>>> + dri-devel
>>>
>>> Since scheduler is a shared component, please add dri-devel on all
>>> scheduler patches.
>>>
>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>> [Why]
>>>> for bailing job, this commit will delete it from pending list thus the
>>>> bailing job will never have a chance to be resubmitted even in advance
>>>> tdr mode.
>>>>
>>>> [How]
>>>> after embeded hw_fence into amdgpu_job is done, the race condition that
>>>> this commit tries to work around is completely solved.So revert this
>>>> commit.
>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>> v2:
>>>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>>>> during processing timedout_job
>>>>
>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>    1 file changed, 5 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>    {
>>>>           struct drm_gpu_scheduler *sched;
>>>>           struct drm_sched_job *job;
>>>> +       struct dma_fence *fence;
>>>>           enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>>>
>>>>           sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>
>>>>           if (job) {
>>>>                   /*
>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>> -                * is parked at which point it's safe.
>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>> +                * processing timedout_job
>>>>                    */
>>>> -               list_del_init(&job->list);
>>>> +               fence = dma_fence_get(job->s_fence->parent);
>>
>> While this is true for amdgpu, it has no meaning for other drivers for whom
>> we haven't
>> done the refactoring of embedding HW fence (parent) into the job structure.
>> In fact thinking
>> about it, unless you do the HW fence embedding for all the drivers using the
>> scheduler you cannot
>> revert this patch or you will just break them.
> btw, why did you do that embedding? I do still have my patches with
> dma_fence annotations floating around, but my idea at least was to fix
> that issue with a mempool, not with embeddeding. What was the motivation
> for embedding the wh fence?
> -Daniel


The motivation was 2 fold, avoid memory allocation during jobs submissions
(HW fence allocation) because as Christian explained this leads to 
deadlock with
mm code during evictions due to memory pressure (Christian can clarify 
if I messed
this explanation). Second is to exactly revert this patch because while 
it solved the issue
described in the patch it created another with drivers who baildc out 
early during TDR handling
for various reason and the job would just leak because it was already 
removed form pending list.

Andrey


>
>
>> Andrey
>>
>>
>>>>                   spin_unlock(&sched->job_list_lock);
>>>>
>>>>                   status = job->sched->ops->timedout_job(job);
>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>                           job->sched->ops->free_job(job);
>>>>                           sched->free_guilty = false;
>>>>                   }
>>>> +               dma_fence_put(fence);
>>>>           } else {
>>>>                   spin_unlock(&sched->job_list_lock);
>>>>           }
>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>
>>>>           kthread_park(sched->thread);
>>>>
>>>> -       /*
>>>> -        * Reinsert back the bad job here - now it's safe as
>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>> -        * now until the scheduler thread is unparked.
>>>> -        */
>>>> -       if (bad && bad->sched == sched)
>>>> -               /*
>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>> -                * job extracted.
>>>> -                */
>>>> -               list_add(&bad->list, &sched->pending_list);
>>>> -
>>>>           /*
>>>>            * Iterate the job list from later to  earlier one and either deactive
>>>>            * their HW callbacks or remove them from pending list if they already
>>>> --
>>>> 2.25.1
>>>>
