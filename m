Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B43FF050
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 17:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899A3898B7;
	Thu,  2 Sep 2021 15:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A8C898B7;
 Thu,  2 Sep 2021 15:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX3wcO9PTZIBTX0AhteoGd0JycSpc+tYEurIEtYciQRu0XaCqqsx0yx0jHVtYSQ2TvgYAUxsiI+m5Ap+EERsjLRwsM671tNK0RJ/vbwpZTNgihybtwLOKSEZwK6IdTlba5LEzJYFJoLK41nyOz0uWV/w0vCcrM9/M/Lu8R13VGQ5h27kIHmmeLWu8dui+y5nyGNeVetBYf1bFRG/IGWoTXZztz4Z0E7qDBy2ws+uh4NsFaXPcUFyM9/hTySy7obfpkxA/r7PdVmRiWHj3RHlYaSVoo8DckjEhxdphC3dwsFec3V4XSHcJauyv9WSowBRVo8nbpcFiNxUQQltYBTHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtmWSNko73lOTjN0Mpt77kLB2N067eED/UY6LCCkx3s=;
 b=kCjFEzYEygYIH+KNjO8o+FR8qIP6ixDWaaiwAySBoXY9xUgycnQtGtwQg593jAs8657hSkMsRS6jIDizl5fy4kh/nPIeKrziBJksWbl0Hf1QiMt0kh36x6k2rt2jG61HsN6EBhSMMuqxnhqimEmhRbl+3xeExSiZEzR/4Uhgy5/mHk3V8lotI+Jhs5cuby33NPqvwGnU14tK40/7LSZURmt06ZjEkdLCLMXLaMqHkCAO7EuYfma2TD/u/2ZyNGnE10NvQANYaCqh+BpDOsCtcCgxumz4BJLbeKmYbGP27h6OkjoqbgEs7j1pXnEEcNk+kRja/cWYwO45IY2YafgS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtmWSNko73lOTjN0Mpt77kLB2N067eED/UY6LCCkx3s=;
 b=nrzPA9gzskfMYjumstQ+JXSf3Dl+NGPh2kUrpbYdaiN/A2CXbKc9AlyDxoQVhSANJFIRz8FyCACstl7RMo/+9Mow0cpWEYn0dQL0GR6HYVLPPsdl5ezDd57uqH90Ahzh+BEQGxbVn2fyuYVWYPB9ahwiELZ+JsmPZhhCEfmglQY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 15:36:37 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.026; Thu, 2 Sep 2021
 15:36:37 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local> <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
 <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
 <YTDfd+ibZuxiispx@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d06a45d2-7ac0-fc76-c4d7-e4094936e900@amd.com>
Date: Thu, 2 Sep 2021 11:36:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YTDfd+ibZuxiispx@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:2d20:86f4:2770:4c77]
 (2607:fea8:3edf:49b0:2d20:86f4:2770:4c77) by
 YT3PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 15:36:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cddaaf94-8dc8-4fa5-8cc4-08d96e27739e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2751539F91CE2E0318CBDA07EACE9@SN6PR12MB2751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUL/C8LHz1TpJzUzIAIK5S9H3z1+Q0XLGpxScSTfU26H0i2Jnm2FHhPSSjYbBHbxrLh2aiRW8zHdDqay4MecfqlfmVyjZ0p+dZ1RB6IW7tdkzUscf7iR4uL1kZj7mSthjfk1kpmkxc+54+LgRY5YqNUkmUW0ZaE9DEZvhifPMXrKS+mypYyaUfH6c00CnLVRtFzDrcjv2lecqtL8d1qFv1jFKhrRrAP8iwTR2U1bjGFieENdn8QGPdr44AcloPkAg7LWhBLUKpFa3D1E55S8QKmWgvC2Trx05sS9R8BxYvu4a9fKFkqqwAg89g6oV2T+j5IQxAZj3oVgJM7qSv4UPBPxSw9gLPcNmBq0fd93CZVrWkHAI3Ft8vGn5p/M9wqDPvrFoGOdG6PuSM58ZZwxfhcwFprDKLuWc/r7Ox806JU8R+XTnqHiphdi5fOlikZP9BbRD0eIJuo4KZO5RIGk03JBe9XGB8NcYs3HgO0cfa6eN/vQKwqsGIFctvLBiTpSlWqPI+jMhXnuFZI7UKPyf7Gj94h7rprd8QmRBnWpS3i4QWLcFltVPpnO1Exr+956jupAFGNT8J6i0e/9ftDlZJh0roCUnTnokTyOYLhKNfu4/1edSgRSO8MeZmUmNQdeVyVGQinxkb+0mV0iOB1YqMZoTU+8luI465D6kauEaX1p406m9wjJ0pZqRqg/o3re0X6IGNsiH4e0g3sgF2kWmd9m30yQ/QR/+hCDHg4cuYdcgpOoQGvhFDhDcymoEJsU7ctmgZpZ59ii/kj5OK0yuBtH/qocgVYHid+mkEgC1DtFaY+/icccoKcHc1lcB10A+qqjQOIoGROkKT0EDBFQMUuFMlWTLizQXV5lMgRrIm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(54906003)(2616005)(36756003)(83380400001)(38100700002)(4326008)(966005)(2906002)(44832011)(316002)(186003)(30864003)(8936002)(31696002)(478600001)(45080400002)(31686004)(8676002)(6916009)(5660300002)(66946007)(66556008)(66476007)(53546011)(6486002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXJHMUQ0YTI3WDVTK1FRcFJxa0JUOCs5K0FNdEpJRTJ3YU5YRFRtcmFVcDVm?=
 =?utf-8?B?TmM2U1JxazBROTk1SnIxb3JOd0l2ZHJrSEI3ZHZxLzFTcTNCNGsrUmtFOE9u?=
 =?utf-8?B?L0wxdjNxaGFWZjRodzZSNFoyeVpmZWtFekhNSzRLZlFkbnR6UVRKWGh0MWR4?=
 =?utf-8?B?amROZ21zYnNQdmo3ZU95ckdsOWVpbkY3c2lZYnFVZ1ZQUHI4V1oxcU5JQW0v?=
 =?utf-8?B?Q2JTZ1ZaTWpmZGJMc281U2lSTmxnWW4rbkJ4aEdIWERNUytCcUE0VTZMZWZD?=
 =?utf-8?B?MFg0ZUxIRFNWTUdPdTIxN1ppNmtJN0hTUFdnRmNMN3VDakl1bHVPKzZvNmQx?=
 =?utf-8?B?Rm9GTm1LUWMybzU1dFpnNmtHWlkxMTBOOThZQlozQ2VsRElFSVRKK1hSSTln?=
 =?utf-8?B?TjZkVTkxcmJPTVlzZHRNUFdrNU9XSTVFUFRaQ2hZbytQYjVRNkZFUDhiNFAr?=
 =?utf-8?B?dEFubXFYYk5rWXdqY29hQnhLQThCRW1iZTYxKzVWRm91dFczN3NCdU5LYXMy?=
 =?utf-8?B?SkpRZFFYWitEUUNkSzJoTStRMnNCelZieFNEckVxNkw1U1NzOEdPMUxTQkdC?=
 =?utf-8?B?ZlA5MmE3cmNwYnAyR1JxSkFteUpubXV5RXgra2hkOFhlVWdNRGxGUzVCNFJk?=
 =?utf-8?B?cTE5cnNLalErbERPRWNWSjVBM3I5ZG1uREZxK1FPSk04RnFaZ2FQbHNKenlM?=
 =?utf-8?B?YzQzbmZseTlPTitCMUVvUWdIZmJWc3N3Wjh3VXlvR2dQTUVmOWpQUWlXaW5J?=
 =?utf-8?B?SjVMT25DRHdGaXY0UGpOaFc2a1RzdmZPSnlaUUxCakZzQ2lnYnRIWmE4U3Ba?=
 =?utf-8?B?RkN3bzhoa0pOOWRYY1hiSWNNNmFqNmJhbU5qaUdrTEMvSis3ZDBkano5elUw?=
 =?utf-8?B?aWJ2UTN0MTdyMlYzRnlQNXErOWdmeGkyNGlFMGs0djRjSkRJRzJzdmxYWDQ3?=
 =?utf-8?B?RUJ1bVdKb05FejZuRVBUUHREdVFsUUREbEs2RjJ1cnJqZHMxQ2FMY2NpUFpi?=
 =?utf-8?B?N1RScGxKa2tPMFIwR0RSS1pETnltUmdLbDFZR3Y4eXd0RUQ2Myt6VG04dlZ2?=
 =?utf-8?B?Sk1GRFMwL1Q1czE0UVVTNWxPaEVRODhYZVpEbkVWRkVFbU5IU0F5ZGtTTGxE?=
 =?utf-8?B?Yndxekltd0RpUVp0Sko5czF6WE9TTjV2YVp0N21VQm5BeWx4UUNET0NFVElU?=
 =?utf-8?B?VzdSalM1aGFnZDZBWmtCcTNEMW1YL3B4eUk3RE5nSE1xRWV3djcvOWw1WW54?=
 =?utf-8?B?NVNrRGVzQXdnYTQ4Z0VMaGsxTlJaaXpDU2luMmY5c1ZZcWp0NmF5SThKMmR3?=
 =?utf-8?B?Qys1Rko0MGNGNG54eGZGOVpwUTJzdFdxRTlZNm5EQ0NZNFNEMDcwVno1UWpk?=
 =?utf-8?B?WWZSNzlnNFJ0citTclN6Ti9UWExIQUJodWtxaUJlUWFIcnYxSHFWUndKWm90?=
 =?utf-8?B?UWt3SENDTEdnOEI3SWFkVERyYTlobWlKeHJzai92bWtQRHdkR09qb1h6WEU4?=
 =?utf-8?B?WlpSWkd0WC9nbVIvUU9rMGNCRG80dURZMlFiUjhoUXJ6Q3dNWCtUUnBzc3Fm?=
 =?utf-8?B?V1RwYTFvQzY0dWVRMllwbHB6KytYL0l1eUNUZloxcWxjQVo1L3VKZm0vaXNv?=
 =?utf-8?B?ejVyNG9VajNYZkFiamlrOC9ROVhJbDZkN2I2UlQ0N0I2d0QyMWVPazJWejhl?=
 =?utf-8?B?OFJaek5jVHJTa00xa3BSQ2dMSUpWelRxNklTaXVhTzFKR2U0UW95VXU4dDBt?=
 =?utf-8?B?V0wva2tMbFRZMktkdTYxRVh4VElHLzZ1dWtxSVNBRGNHeEplejdXNGlQWERj?=
 =?utf-8?B?dzJSZDNuNXZrNUkzTmovbjJzcTAyd0ZFS3h4bmZEYXhqTi9CTWpKbmZHL09E?=
 =?utf-8?Q?t6PxXoxPNTi4M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddaaf94-8dc8-4fa5-8cc4-08d96e27739e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 15:36:37.4125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zr9QFg6jgKBBcU0YHKPruMr6u+xCaQug6UyxI6c6kjIAFxcx1qMUGOcfVQHr0nrq4JxjiLuI6zmlbUc9GIwKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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


On 2021-09-02 10:28 a.m., Daniel Vetter wrote:
> On Tue, Aug 31, 2021 at 02:24:52PM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-31 9:11 a.m., Daniel Vetter wrote:
>>> On Thu, Aug 26, 2021 at 11:04:14AM +0200, Daniel Vetter wrote:
>>>> On Thu, Aug 19, 2021 at 11:25:09AM -0400, Andrey Grodzovsky wrote:
>>>>> On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
>>>>>> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>>>>>>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>>>>>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>>>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>>>>>>
>>>>>>>>>>>> + dri-devel
>>>>>>>>>>>>
>>>>>>>>>>>> Since scheduler is a shared component, please add dri-devel on all
>>>>>>>>>>>> scheduler patches.
>>>>>>>>>>>>
>>>>>>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>>>>>>> [Why]
>>>>>>>>>>>>> for bailing job, this commit will delete it from pending list thus the
>>>>>>>>>>>>> bailing job will never have a chance to be resubmitted even in advance
>>>>>>>>>>>>> tdr mode.
>>>>>>>>>>>>>
>>>>>>>>>>>>> [How]
>>>>>>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race condition that
>>>>>>>>>>>>> this commit tries to work around is completely solved.So revert this
>>>>>>>>>>>>> commit.
>>>>>>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>>>>>>> v2:
>>>>>>>>>>>>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>>>>>>>>>>>>> during processing timedout_job
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>>>>>>        1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>>>        {
>>>>>>>>>>>>>               struct drm_gpu_scheduler *sched;
>>>>>>>>>>>>>               struct drm_sched_job *job;
>>>>>>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>>>>>>               enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>>>>>>
>>>>>>>>>>>>>               sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>>>>>>>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>>>
>>>>>>>>>>>>>               if (job) {
>>>>>>>>>>>>>                       /*
>>>>>>>>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>>>>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>>>>>>> -                * is parked at which point it's safe.
>>>>>>>>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>>>>>>>>> +                * processing timedout_job
>>>>>>>>>>>>>                        */
>>>>>>>>>>>>> -               list_del_init(&job->list);
>>>>>>>>>>>>> +               fence = dma_fence_get(job->s_fence->parent);
>>>>>>>>>>> While this is true for amdgpu, it has no meaning for other drivers for whom
>>>>>>>>>>> we haven't
>>>>>>>>>>> done the refactoring of embedding HW fence (parent) into the job structure.
>>>>>>>>>>> In fact thinking
>>>>>>>>>>> about it, unless you do the HW fence embedding for all the drivers using the
>>>>>>>>>>> scheduler you cannot
>>>>>>>>>>> revert this patch or you will just break them.
>>>>>>>>>> btw, why did you do that embedding? I do still have my patches with
>>>>>>>>>> dma_fence annotations floating around, but my idea at least was to fix
>>>>>>>>>> that issue with a mempool, not with embeddeding. What was the motivation
>>>>>>>>>> for embedding the wh fence?
>>>>>>>>>> -Daniel
>>>>>>>>> The motivation was 2 fold, avoid memory allocation during jobs submissions
>>>>>>>>> (HW fence allocation) because as Christian explained this leads to deadlock
>>>>>>>>> with
>>>>>>>>> mm code during evictions due to memory pressure (Christian can clarify if I
>>>>>>>>> messed
>>>>>>>> Yeah that's the exact same thing I've chased with my dma_fence
>>>>>>>> annotations, but thus far zero to none interested in getting it sorted. I
>>>>>>>> think it'd be good to have some cross-driver agreement on how this should
>>>>>>>> be solved before someone just charges ahead ...
>>>>>>>>
>>>>>>>>> this explanation). Second is to exactly revert this patch because while it
>>>>>>>>> solved the issue
>>>>>>>>> described in the patch it created another with drivers who baildc out early
>>>>>>>>> during TDR handling
>>>>>>>>> for various reason and the job would just leak because it was already
>>>>>>>>> removed form pending list.
>>>>>>>> Can't we reinsert it before we restart the scheduler thread? It might need
>>>>>>>> a separate list for that due to the lockless queue tricks. Or am I
>>>>>>>> thinking about the wrong kind of "we lost the job"?
>>>>>>>> -Danile
>>>>>>> If you look at the original patch it would reinsert it even earlier - right
>>>>>>> after stopping the  SW scheduler thread, and even then it was to late for
>>>>>>> some drivers as they would decide to return back from their TDR handler even
>>>>>>> before that. It is solvable but in an ugly way as far as I see, you need to
>>>>>>> require each driver in his code to put the job back in the list if they do
>>>>>>> it before reaching the place where scheduler framework does it. Kind of
>>>>>>> spaghetti code seems to me.
>>>>>> Hm yeah I didn't realize this all happens before we stop the scheduler
>>>>>> thread.
>>>>>>
>>>>>> Why can't we stop the scheduler thread first, so that there's guaranteed
>>>>>> no race? I've recently had a lot of discussions with panfrost folks about
>>>>>> their reset that spawns across engines, and without stopping the scheduler
>>>>>> thread first before you touch anything it's just plain impossible.
>>>>> Talked with Christian on that, for each TDR we actually stop all the
>>>>> schedulers for all the rings and not only the hanged ring since
>>>>> ASIC reset will impact all the rings anyway. So we cannot allow
>>>>> other timeout handlers for other rings run in parallel to ours
>>>>> as they will stop/restart the threads we just stopped and rely
>>>>> on them being stopped. So it's all done with device wide lock
>>>>> inside the amdgpu tTDR handler. Only inside the locked
>>>>> section then we may stop/restart the scheduler threads.
>>>>> Christian also mentioned that you proposed at some point
>>>>> to serialize all TDR handling into single threading for all rings - this
>>>>> seems
>>>>> like something that could be used - we then don't need any
>>>>> locking against TDR handlers from other rings and then we may
>>>>> stop the scheduler thread as first step
>>>>>
>>>>>
>>>>>> I'm also still not understanding what exactly you guys have done,
>>>>>> can someone please dig out the the amdgpu patches that motivate all this
>>>>>> maybe that's clearer? A full explanation would still be good since I've
>>>>>> only started in scheduler stuff.
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommit%2Fde7515d43659f852590645a688f8d493e4a18141&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=T3WC4%2B3BcWBy9gnjCMLRJjPM%2BWXfmN4GfR2Ojn8P3qc%3D&amp;reserved=0
>>>> Uh, it would have been really good if this was discussed a bit wider
>>>> beforehand. Now we have rather diverging approaches to this. Also would be
>>>> really good to resurrect the dma_fence annotations too.
>>>>
>>>> Can you guys pls spend a bit of time on this? Shouldn't be to hard to type
>>>> up rfc conversion patches for the other drivers.
>>> Ping for this. Currently the hw fence is returned from the ->run_job
>>> callback, and that's not great design.
>>
>> What's the problem you see there ?
> For one, all other drivers work like that, and it's not great to be
> inconsistent. And it allows that inconsistent/wrong pattern to continue.
>
> Second I'm not even sure you can embed the hw fence, because there's this
> job restarting going on. Which at least thus far allocated a new hw fence.
> So this needs considerations.


There is a solution to this at least at the amdgou level, see here -
https://www.spinics.net/lists/amd-gfx/msg66614.html So we would
reset the embedded fence seqno for this purpose (see amdgpu_fence_emit).


>
>>> If we embed it, then I think it should start existing latest from
>>> drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
>>> the right thing to do here is to have the hw fence as a pointer in
>>> struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
>>> allocated.
>>
>> Why we need to allocate the HW fence if it's embedded within a job struct ?
> the hw fence is a refcounted struct, and the drm_sched_job is a different
> struct. And we didn't have a dri-devel discussion about whether it's
> correct to conflate these two lifetimes, amdgpu folks simply hacked
> something together.


Obviously scheduler level changes must be discussed at dri-devel forum 
level.
What happened here and as Monk already mentioned - we had internal 
discussion
about how to fix the problem in the header of this thread - avoiding 
accessing feed job
from TDR handler without the current hack in place of removal and back 
insertion
into pending list. It's there we we came up (I think Christian first 
mentioned this) with the
idea of embedding the HW fence into amdgpu job - both for avoiding 
memory allocations
but also - because this allows to use the HW fence's recounting as a 
solution to the above
problem by simply grabbing a reference to the next fence in the pending 
list as a first step
in the TDR handler. What we didn't take into account at the time is that 
indeed this change
cannot be limited to amdgpu level - this we noticed much later during 
final code reviews.

Andrey


>
>>> Otherwise we're just diverging across drivers and tempting them to do the
>>> wrong thing with the current ->run_job callback interface.
>>
>> Maybe we should switch from embedding in driver level job struct as it's now
>> to drm_sched_job and just leave the fence initialization to driver specific
>> code ?
> Maybe? Like I've not been involved in these discussion ont he amd side at
> all, I'm just noticing that we do have a now rather inconsistently used
> inteface across drivers. Which is no good.
> -Daniel
>
>> Andrey
>>
>>
>>> Can you guys look into this?
>>> -Daniel
>>>
>>>>>> Another thing I recently pondered for tdr races looking at i915 code is
>>>>>> whether the tdr should first block the completion fence for that job. My
>>>>>> motivation is to have a race-free error capture (if the completion races
>>>>>> then we might start evicting memory and everything goes boom), but maybe
>>>>>> that helps here too. Some kind of atomic "block this fence from
>>>>>> completing thing.
>>>>>>
>>>>>> Or I'm I completely guessing in the wrong direction?
>>>>> I think we already do it here - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.14-rc1%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fscheduler%2Fsched_main.c%23L410&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1xqr4XCqY%2FCYJjAzT3GI8MyBi15tJQmOt6sB79COsmc%3D&amp;reserved=0
>>>> Ah yes this works becase drm/sched has separate hw fence from the logical
>>>> job fence.
>>>> -Daniel
>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>> -Daniel
>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> Andrey
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>>                       spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>>>
>>>>>>>>>>>>>                       status = job->sched->ops->timedout_job(job);
>>>>>>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>>>                               job->sched->ops->free_job(job);
>>>>>>>>>>>>>                               sched->free_guilty = false;
>>>>>>>>>>>>>                       }
>>>>>>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>>>>>>               } else {
>>>>>>>>>>>>>                       spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>>>               }
>>>>>>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>>>>>
>>>>>>>>>>>>>               kthread_park(sched->thread);
>>>>>>>>>>>>>
>>>>>>>>>>>>> -       /*
>>>>>>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>>>>>>> -        */
>>>>>>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>>>>>>> -               /*
>>>>>>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>>>>>>> -                * job extracted.
>>>>>>>>>>>>> -                */
>>>>>>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>>>>>>> -
>>>>>>>>>>>>>               /*
>>>>>>>>>>>>>                * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>>>>>                * their HW callbacks or remove them from pending list if they already
>>>>>>>>>>>>> --
>>>>>>>>>>>>> 2.25.1
>>>>>>>>>>>>>
>>>> -- 
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Ca5d9bacd4415453ba6c308d96e1de455%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637661896953391179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=4V%2Fri%2B3gnISZfC6HOUxR1Z8dIkseE9dT1EqiXsTuVi8%3D&amp;reserved=0
