Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB8387C31
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6023C6EBA3;
	Tue, 18 May 2021 15:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758A6E894;
 Tue, 18 May 2021 15:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acM6xhJvIT2sOA+VFf35Yl5DGMiG4jfJ+PDsyiWORGNZlXgA1owQ2Ys7X6tpwwIMw+HCtwnEuVD9Z65TmKN3582xw8P2FwyTU5CG5kkdUL9bdxpJ4qh7GG2AnkqI08wrKmJM2yuAdfDN45Lb9L9QaDWQtRmaoGFHsQzWCnNI5MrXirNuFEuTp4ViyESEKoG6prmrOdrNo8l0J7jmhcUETkM1MVC3d1vk2s0B41294UqhyybKJhA9K2LHtTACiBDsQamDEPCxnj3S4YQLU2SVi/UpiOndfmWptHzoo05S6WJfZl6pdRndUMC54MgX0vPccpkjc8o3T+l/GJ2FcPa/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MhaYdq9Lu0i4iB20UnPYyzhdXJi/8M39gWlsyJKbJw=;
 b=bfgELP2YcpPLdDJ+afCa9h4Zm9CqRYmGLEZmQNVXGEGXuqp8WkogHmCOkr6vZSPdxzlA46JcIk4uV4DtcDOVHM+DPwtxPS4OPva/mAgjg1tYY0v0ZlPo4DjlyeRbFCUY2tt/Lhk1BwXxa0UgZyZzEYMOXFBac0sj79R7rXFeCI8bXBRNiv2/2hIl4Un1R3u4xyEgb0Kxb2nGIs6rTf08WxnUGNDiGpYu+CqS/3ALaiz+GZdMltB8SQi5oDbcc/BBUKNcuwC8tqlSul0jVn2IpTVz/HJ4PcrqSDQmWMT6URgzyHKZOOcxcqbCL9bo5z/0My9HaKQnlt9od0ernWHCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MhaYdq9Lu0i4iB20UnPYyzhdXJi/8M39gWlsyJKbJw=;
 b=4mcX+8+ZgcY0xC3LOyvPjrhEk0cmXHKILN03L6HmeBoHvYlV/eoMSZ+3LFAhaW4i08XKeYwaDM7hW8w32CQw+hYR85aQ8gkONmVJVKdu6vGktxh5UAur5crCYTlruIVM3yiOvOT7krmSBxYfEOIwcenQh+tz6iyEZhSSez+YHQ0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2388.namprd12.prod.outlook.com (2603:10b6:207:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 15:15:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:15:07 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
Date: Tue, 18 May 2021 17:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM0PR04CA0125.eurprd04.prod.outlook.com
 (2603:10a6:208:55::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM0PR04CA0125.eurprd04.prod.outlook.com (2603:10a6:208:55::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 15:15:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 266c2bcd-eca7-4a99-ba2c-08d91a0fb83a
X-MS-TrafficTypeDiagnostic: BL0PR12MB2388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2388F300BA60622EAEC35479832C9@BL0PR12MB2388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: or+PDKiGFZFoCvPG4IUUh0DqXxbNHqSIzcF74597VuNXyeCI9yfCHq84x5s4L5yItjVZvq/vp4v2GgoXvryitS0tWID/uaebMSjH6HT4nu+g5I0L99zhlBXwqjLeRJn8IqUuM4nvaXL1npWaTwt5cCF5JPYou+oo12ovR3VYL6DMMnM7sy83NioXbAEWayCDNk9rybaqUcHyyyjlPd7T6BxFeNvE9IOiIA2CyYGO1Skc+P3G7eDh90LuMRSH5+iZ+4S+IetPNCXCtywix4s1QBNJ8840UXrlxlnKQQNQmcAFaH390cwKpp6s+4uzBtKgFbVaLPEQrZKT6UMZo3hhF48YhSAiS4XTvfkpMoqgjP070FuOK8CgBnaxtbMKlxTvGHv4D6XqA9y3p69T45ppNES4agsafB/Xvt/yEc+J1gmeX4k412gsQ4Wx3nhwOm6PEUsnY9DOPAqk5bYgTGm9iZJvSr2x5psoI8rhwDsGbZbT6sPaoPWFbroifl/W+7XKA3eNxGraJN/R7B/AiuXhmc/TZXvebZN6f52Rb9V5+puLwiilzcKmHnE65+ohYXmRQkMnU2+haWPn3WWfzOWwB59vpHMGTikiGnKLJMdyzKtef6xOGFY1N3A98F/cN8EALhY+Dcg+oBdqwaSkRuXNu4KNBj+L0H7v67UW3nUKNw6vFvtBI9YWsCfqcdGryWU6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(31696002)(53546011)(86362001)(2906002)(6666004)(31686004)(8936002)(478600001)(4326008)(66946007)(66476007)(2616005)(5660300002)(66556008)(8676002)(6636002)(36756003)(316002)(186003)(6486002)(16526019)(66574015)(83380400001)(38100700002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXhlUlpDT3B2a3Bpakg1MzZyZlkxYUx1S3M4TWZOdFBmL3g0MUdPUnhDWVdT?=
 =?utf-8?B?dlEyY0MyN2RrcWFTNHlxWUdON1pWZjJIQ09LVDBXWUZTVHhLL0ZiK0o4em5k?=
 =?utf-8?B?ZG43bDdOZTlJUHBZR0RnMmNPQmhFVGRTWVJybGk4LytYNDdoblFpR0tsRTY4?=
 =?utf-8?B?U2RkakpLZ1VHdFN6cUhBR3hlaTFLNVY0N3pyZGdFL2tqTlIrSWQ4eXk4OFha?=
 =?utf-8?B?WFk2STJDY0lpcG8vRTBydXJPVCt6SG5rVm5TS0Q0Qk80WHBiRUtHNTRkWFNr?=
 =?utf-8?B?QlVKc3pJUDFhbHVPUUw2RUh5Tmx1cGkwb3pBRDQ1UENIYnpGQmJQTXhGckFj?=
 =?utf-8?B?bGxuK29nU0h2MXpZS3FSOHNvdFhQMmFrL1FZNzM5OUQ1Ym1hUXl0NVNyeWo3?=
 =?utf-8?B?RU5zVkVxWFhlRHV0SlBuck0zWkV5L0VFYW5OQ3R4aVZRNUczSlQwREhVK2Zl?=
 =?utf-8?B?S0RSQzJqV0R1REhld2krY1ZXak5lSGNnMlFNOGpObE02ZEduK2dIV1VpazZH?=
 =?utf-8?B?MlhEWmJrbnBPNElYUmQyMWpESHFMVEFHOUkzL1kzZllMcUhDYTcwWWIxVS9N?=
 =?utf-8?B?QlVBc2VlMzVHSkg0SFBLdWdSbEJoNEtLVzNua2h1UzZYelpHRjFZRW1hUC9M?=
 =?utf-8?B?aVd6U1plKzRMOWRmYzdkTWo0NE9JYUJ2bERINEc2aWVJZkpHQ0pYRzlTYlpp?=
 =?utf-8?B?bTYrWGJyNGFDR3FkRXcrWlpReThvZmI4TUxlYU1WUU5wc05sSlEvRkh3YWpi?=
 =?utf-8?B?bUUyTHZYVVdQY1MrbzY2cVI3Q2paaTVXZ2UrYjNDYVd2WmtGRjBRVzcwSWhB?=
 =?utf-8?B?TkordmdLQTM2d0NvaVpmOHZpRVFvR2w2VzhUY2JEZTd0WFp2RTRUUDk1dCty?=
 =?utf-8?B?TlBEOURMYjE1aU1OaStQZnpncUgrVUxwVTRweVdZQVhxQ0RvT05Xc0xKYkE4?=
 =?utf-8?B?QXVHSkVSMkJzbk1nWUc5YjhXZm56dTc5Ykg5NUF3bXU3Q0t4RnhiNmhsakFq?=
 =?utf-8?B?K005d09SQ1FOcjZVa0ZGSWJ6Mzc1Rnk2Z1VXVEVRWUJxSitBaVNlS1JqTW8y?=
 =?utf-8?B?Qll1NlczZEJlajdYaHlPY2R2d0dzcWNRTGZQemJiOExNZmxIOU5zQUhjYWl6?=
 =?utf-8?B?bytXOGtyeFJ5VHFZQUYzTGpDYk80U2RoNEEvc1lqSzU2MEFiUVBHT1Z1Kzhl?=
 =?utf-8?B?WXVzR0h1dDhHRVJxdm5QdXkvLzB0NFg5eHdNdExNR1l5dGUrWDlSSENyN1JX?=
 =?utf-8?B?OHF6MEFTUEwyKzZ6MkNIZStFb2k5YjRRV05yZ3Y2Zk1BdDdOZWUxRVZKYkNR?=
 =?utf-8?B?ZFlseFlIaFg0TjBKVWJucERLNlgyUTFTeFgwWEZFaW1tTFh5QTlBeHZoM0JK?=
 =?utf-8?B?N25ZWnA5ZGQ4aEpXQmt1c1AxaXQ1eHNrR0lGekV2WkxuMVBGanhQTjltd0E4?=
 =?utf-8?B?RURTVFc3MzBHZVdjU213WlFDQ0kyUHdXZk13Q2FtZ3hhbk9oTGV6bXAydWc4?=
 =?utf-8?B?emt5cklWRkZqQ21OS2ZNaGZxUDEyTW5kVERKRFFxN0JiTHo1Z0QxVFNjNUZu?=
 =?utf-8?B?L1Y0NDdoNzhvMUxRZ09veXhlVmZpWVlYdlU3V0xuNlRUVUM5aFAzK0xZQ3BM?=
 =?utf-8?B?YmFiYnNsQTFzekIrNFg2c1hybVlwYVdkeFBKWGhORk00QWpnUUJML0Z2dUEx?=
 =?utf-8?B?YjcyK3JrREVOVE8xK0hGZ3QyeW14OEZ0OU94UDY4dlM1QTRERHJ2K2NaMHl4?=
 =?utf-8?B?V2NOdVFpRFVEM3V2NjlRTXlkblIxQnZ6Y0I2dUd1dHJzc051ZklBaCt3SkVT?=
 =?utf-8?B?SllSVExwTVlRdlN5bTRPUTMvZnZza3F1UUtKWlA0U3F0L2JuV3llelBtTTJl?=
 =?utf-8?Q?sZ+tFlWLmNdq+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266c2bcd-eca7-4a99-ba2c-08d91a0fb83a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:15:06.9232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8XSU3OpQ8NEhCZ499rQEUFjM9FfAXYzKiNdLt2/ZnLNUoTnA13tcgnTXMLEgDQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2388
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 17:03 schrieb Andrey Grodzovsky:
>
> On 2021-05-18 10:07 a.m., Christian König wrote:
>> In a separate discussion with Daniel we once more iterated over the 
>> dma_resv requirements and I came to the conclusion that this approach 
>> here won't work reliable.
>>
>> The problem is as following:
>> 1. device A schedules some rendering with into a buffer and exports 
>> it as DMA-buf.
>> 2. device B imports the DMA-buf and wants to consume the rendering, 
>> for the the fence of device A is replaced with a new operation.
>> 3. device B is hot plugged and the new operation canceled/newer 
>> scheduled.
>>
>> The problem is now that we can't do this since the operation of 
>> device A is still running and by signaling our fences we run into the 
>> problem of potential memory corruption.
>
>
> I am not sure this problem you describe above is related to this patch.

Well it is kind of related.

> Here we purely expand the criteria for when sched_entity is
> considered idle in order to prevent a hang on device remove.

And exactly that is problematic. See the jobs on the entity need to 
cleanly wait for their dependencies before they can be completed.

drm_sched_entity_kill_jobs() is also not handling that correctly at the 
moment, we only wait for the last scheduled fence but not for the 
dependencies of the job.

> Were you addressing the patch from yesterday in which you commented
> that you found a problem with how we finish fences ? It was
> '[PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.'
>
> Also, in the patch series as it is now we only signal HW fences for the
> extracted device B, we are not touching any other fences. In fact as you
> may remember, I dropped all new logic to forcing fence completion in
> this patch series and only call amdgpu_fence_driver_force_completion
> for the HW fences of the extracted device as it's done today anyway.

Signaling hardware fences is unproblematic since they are emitted when 
the software scheduling is already completed.

Christian.

>
> Andrey
>
>>
>> Not sure how to handle that case. One possibility would be to wait 
>> for all dependencies of unscheduled jobs before signaling their 
>> fences as canceled.
>>
>> Christian.
>>
>> Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
>>> Problem: If scheduler is already stopped by the time sched_entity
>>> is released and entity's job_queue not empty I encountred
>>> a hang in drm_sched_entity_flush. This is because 
>>> drm_sched_entity_is_idle
>>> never becomes false.
>>>
>>> Fix: In drm_sched_fini detach all sched_entities from the
>>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>>> Also wakeup all those processes stuck in sched_entity flushing
>>> as the scheduler main thread which wakes them up is stopped by now.
>>>
>>> v2:
>>> Reverse order of drm_sched_rq_remove_entity and marking
>>> s_entity as stopped to prevent reinserion back to rq due
>>> to race.
>>>
>>> v3:
>>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>>> and check for it in drm_sched_entity_is_idle
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>>   drivers/gpu/drm/scheduler/sched_main.c   | 24 
>>> ++++++++++++++++++++++++
>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 0249c7450188..2e93e881b65f 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>>> drm_sched_entity *entity)
>>>       rmb(); /* for list_empty to work without lock */
>>>       if (list_empty(&entity->list) ||
>>> -        spsc_queue_count(&entity->job_queue) == 0)
>>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>>> +        entity->stopped)
>>>           return true;
>>>       return false;
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 8d1211e87101..a2a953693b45 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>>    */
>>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>   {
>>> +    struct drm_sched_entity *s_entity;
>>> +    int i;
>>> +
>>>       if (sched->thread)
>>>           kthread_stop(sched->thread);
>>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>>> DRM_SCHED_PRIORITY_MIN; i--) {
>>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>>> +
>>> +        if (!rq)
>>> +            continue;
>>> +
>>> +        spin_lock(&rq->lock);
>>> +        list_for_each_entry(s_entity, &rq->entities, list)
>>> +            /*
>>> +             * Prevents reinsertion and marks job_queue as idle,
>>> +             * it will removed from rq in drm_sched_entity_fini
>>> +             * eventually
>>> +             */
>>> +            s_entity->stopped = true;
>>> +        spin_unlock(&rq->lock);
>>> +
>>> +    }
>>> +
>>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>>> scheduler */
>>> +    wake_up_all(&sched->job_scheduled);
>>> +
>>>       /* Confirm no work left behind accessing device structures */
>>>       cancel_delayed_work_sync(&sched->work_tdr);
>>

