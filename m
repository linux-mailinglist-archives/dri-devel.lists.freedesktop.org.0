Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA53264CB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 16:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326CE6E1A8;
	Fri, 26 Feb 2021 15:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC826E301;
 Fri, 26 Feb 2021 15:36:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBLb70Bz45Z5QDKnCQDVediQLPNwEYsYsH6E94yA4EGbiNivQgsipgbcakRItK96RkTh8z+GiXqIeuTTSe2Yi9y85mAd7YrKujV52X4BlkpyOEVeI39/9Y2T291f9j8KuICOp7DWVQ1yo+JIP+54gEtzrIV55h0QjxL+6jcK+5Yl70rZg81K3RUkX8AWrwHtTNOhYedBVVJ3nnZ9SdUjuNaUjqmuSPsDF9+1JAQBUfK4EExBtl39ZU9JmeYIIYtr2YllyQzDpWg3vv+kYFGyaAXvQItFg1+ET1DxMUxApyQS1jDtU2bfJ0dMhz4qJhq4PZmhsxSQxfyWctDDQr5K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbyVZtK4a+UEVVkLJnc0Jvave/QU3F4sS2tBFOEh1kM=;
 b=QSaGJvwwilxyADmnBwdlNFrxhYm6+fu2+2++0Iv4NPGG+Bd23+Ka1DH5uLN+D1UvIS7OuAlAPBfbxUJveS8beLK6hbYd6f+RPPfT++YMOrc/Hnu0JvGNBVLz5zDeq7TEMPmnO4KvttD593eReFcy866gHSeaosgba2zQ5mO58djkD4Iz7W/qjLeKD1Q0SIL0D0FmT1x/is7c0K7Kc+mGhubGZyGAUAmnCHpD5CN2JhbWXTKlaSa/KQdIqhYIWNl/cASkcNkgIP1RPoEvrweHIa//DSajB7hCgDx5tPz2vu4q033DKxvk3XL+BybG/PQy7cTlfPZUd3Hvys0aEdoGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbyVZtK4a+UEVVkLJnc0Jvave/QU3F4sS2tBFOEh1kM=;
 b=YUDWK5asIPuTC4S502dITTEpqpoY5EwQRuwJK6Ro80xZ/P0hsmbN2dGhz46iA6Oj1kcqD7511ANfvPyBvLoTW8cRQXPlamGz6ZEqyVGDy4UpvQYwwbkF3ZdxdQtV97WF6QoJYQhlXlrxML/Vk+r7oqwbDePeD1hsD8YS0WGMqnQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2656.namprd12.prod.outlook.com (2603:10b6:805:67::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 26 Feb
 2021 15:36:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 15:36:06 +0000
Subject: Re: [PATCH v3] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210225213736.12352-1-andrey.grodzovsky@amd.com>
 <44555a52-022b-07ab-989f-cb81fdff8440@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <aba617d5-4b45-5dfd-7fa3-5a125c10da3d@amd.com>
Date: Fri, 26 Feb 2021 10:36:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <44555a52-022b-07ab-989f-cb81fdff8440@gmail.com>
Content-Type: multipart/mixed; boundary="------------741ECC0FB07879515539D646"
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:25f7:b1a0:d070:450]
X-ClientProxiedBy: YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::9) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:25f7:b1a0:d070:450]
 (2607:fea8:3edf:49b0:25f7:b1a0:d070:450) by
 YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Fri, 26 Feb 2021 15:36:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49703878-164a-4299-3b67-08d8da6c3b83
X-MS-TrafficTypeDiagnostic: SN6PR12MB2656:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2656E2408048CF8E30CB2AC6EA9D9@SN6PR12MB2656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DHhsRWFDG5DQBoUkk8B6qGe/7ulATlLNdUiHEEpxP56P7pwLxsLQipFKhtuc++luwC7FZkHR5TRyq6By4UnYE4qwr5Zclo4m8kXU4ljwYzyrdGgIZBDy81ZoK+HU8KDlRbW1gu6xHvJ6P3ascYAt1npqytLIr2h395wJj53XEdhcSLR9+G0YN+Ue9U5ORqCMWK3USQ9049zLzDQCummblOKKbV6buDOms4NLhwFW4kj1ChWAfZ0qlD7SWb6OTdIL7C++5znsaDPQfGgyBL7Cb5djpnbEj4mIzzO74T9T5/nUnHz/nTRFVimdn0UgSHyK97w59jMnidO6JnFStq9AEqAuTMAsrV5Gp2qebWVXlL+CwNvRQdmjOmCrDE3gguzHtIq5R9IRuPULQ8zmjxplSh4TyKnqPboOxjGO8wLNYoGQk/VnUJVwCehM/VBc5fmH9IpWgA4zFsCyGAI4qT8tXekx0vOP8cvslW2A3dPO/kimnXSEC3LUDM8vucbwMYFTECVRdzWA+uq9wI418yOchHbDcQTk38xm7fZ4IA44fwiq0XnPDVpMOKl1j2qXZSSNrWaS+nzqOqn84UKKfeqMC8D+YyjG+B/fQwVGrCDoPIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(8936002)(36756003)(66946007)(66574015)(66476007)(86362001)(316002)(2906002)(66556008)(53546011)(33964004)(31696002)(4326008)(66616009)(83380400001)(478600001)(2616005)(44832011)(235185007)(186003)(31686004)(8676002)(5660300002)(52116002)(6486002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWVPeUdqVDIxakFNNEhVVlpTbmNKQ2N1WDBnZnB0L2ZRclNQdmlTSmExbWRv?=
 =?utf-8?B?QnNuK1pGZ21tU2Jxa2dNRWtBOU1wZFJtYjFESmd6S0NySldMK3hpSmlENjdy?=
 =?utf-8?B?NGdmR0E0NlhyUTZZblZ5V2p0VEFBYWw0dkxEUFB2ZzJHVDNsVy9BelgxWmpZ?=
 =?utf-8?B?Q3NNeHBJdUp5UXdhQ1RLTHNKdVFtZGg2Z2lqdWNodEp4WmUxTGswRmZiSHJ3?=
 =?utf-8?B?RDQybHloSzh0NnNJQTA3c0U0UWFlb1B3R2NSUGMwMVppSSt1ZUNOZmFGMjVF?=
 =?utf-8?B?WDdaVzdkc05qNkRidUsrSDB2OUhNK05lbmF5OVMxaklib2lOa0kvK1I0TGlN?=
 =?utf-8?B?NmYwdmM3dENqaEJPTnM1RmthZXphVHFkNVhBNjhLalc5SHQwMXI3L1BOeFQw?=
 =?utf-8?B?TEErMWdQNURtd1JBRlJsVmMyRU1xNW81cHJKYlZPa0ZTekNIcktMVkh1eDdr?=
 =?utf-8?B?K1hCNDQwc0Fzd2g1U1ZUbDNmRElaRzFOYXFQVkVzMDZCajNpWUFKRjFUVWZE?=
 =?utf-8?B?ajhYVXBYK3pPUFRNcWw3K2lGSWVYcERKSGl0RjgwSDhOK3dRWUhXYnpGUGE5?=
 =?utf-8?B?MURyZlJ4THc4dFUrbzI2K21tRUg2NDhJQzB4dmM3MkxLbG5TM3ZZMmtyaDMw?=
 =?utf-8?B?WStxZTVZK1Y2ZldsR2dWTi9Oa1hXOCt2OE54cVAwTlB2STMyaHVJODk2cWdp?=
 =?utf-8?B?Mkh6dVI4SWVIQzFvTFVpdVRVMkRGcm1uSGY2clRuc1RYRC81d1VvcjROcTZ5?=
 =?utf-8?B?b0RneFZ1d1VNQUVLbHJWbVJBV3BwYXFxbGtoU25kTkJxcTNoNlJRbzFpMi8z?=
 =?utf-8?B?dTNGMlQ0cnFxODFDdnR2Ulc1RDFqUjhSOWFVd0Z4RUFpUkk3WC9wSXhtMjR2?=
 =?utf-8?B?V0p5L3VET0ZZRjYyUjJFUHZSUGtpUFF5YzlYZUtDNUoyT2hsMTdGZVBqZkpC?=
 =?utf-8?B?b21qZy84U3lYMWozS3UyZlhTVGhFcnMrVm9MMmxXb3RGd29OWVo0MlYzT2tY?=
 =?utf-8?B?eEp2YUdUd0RIUStkTys3QnRCSHRoc0luUXVBM2s4aEhMdXF5VjRwcm9Tbjcy?=
 =?utf-8?B?ZFM4VDZFSi9WcE10dTA3WWxrMXlHMlVUSWhReG1SQTBHVno0WXJucGhzekhP?=
 =?utf-8?B?ZmZzZFhmVHRJcUpIRVdCRTArWDBQT2lMdlRaQ3prZ2xORi9JaEdCeS83amlV?=
 =?utf-8?B?ZmE5TnJYbmZ6Y2NYSGZPU3htZklCeXJCbFFCSnM4S0c4SmYrRlhGMU54RDNZ?=
 =?utf-8?B?bjhONzBlYkU5SEw2c0c0MlpwRmxsME0xVy9ZMFpxUTA2V1FMV3IzVDJuTGZO?=
 =?utf-8?B?ajNxcm53b1Z0YVJWQXVOTXhRaDU5UE5rOTArNk05SFhQV083cTZMenFGSGtH?=
 =?utf-8?B?VUwzWkNmU09uSWtzTFJ0NW9XOUNPRGtnZE9xNnkxZmlhOEtRRVZhVWlnSGlW?=
 =?utf-8?B?V21jNmRCVFo0bXViQXlFU3ZJZkVNcUJZb3JybWlWanJjSTdtMWxyWElmcnpE?=
 =?utf-8?B?ZEY5WlN0WEpkUGZXbGVPSHRtTXF4Q1QxVXUxdzRpZXJldWliNXp3NU5RWlpH?=
 =?utf-8?B?R0RLeEVReUhrK0VOWVZicGRWcFllU3BPN3ZPUEd5c3B3MXFUcktPZGloNExM?=
 =?utf-8?B?T3poNVQxb3YydzhiOG1xMklhcldDZ2VDSnFRNVE1UVZiSjltTmY3OVdaT2ZM?=
 =?utf-8?B?SVk2MEVNTWFrdDRMbDBmRWU0M25nMUxJZ2l3a1NhTUdZRmliTFArVTQ0V3hy?=
 =?utf-8?B?SEtwVGVRWVBhQTdpckFTWi9FZmFYWXpDZTQwMlFodXU1WkVxWDdCbC9Dc2tt?=
 =?utf-8?B?bGc0YnhsVTNsT2hrV2VqWHp4OWNLcFJqWkZaTGZWY2VkUnRQMU13VkY3Yzd5?=
 =?utf-8?Q?by9EGf3YpcJWb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49703878-164a-4299-3b67-08d8da6c3b83
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 15:36:06.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9n+FtanT/OmupJyUqvPeiHi6NDF+uv71hq33bNvj5g771wxndL+DUuxzrLp6wmNMoQV29pAYnyUm860J3Xw+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2656
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
Cc: amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------741ECC0FB07879515539D646
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-02-26 3:04 a.m., Christian König wrote:
>
>
> Am 25.02.21 um 22:37 schrieb Andrey Grodzovsky:
>> Problem: If scheduler is already stopped by the time sched_entity
>> is released and entity's job_queue not empty I encountred
>> a hang in drm_sched_entity_flush. This is because 
>> drm_sched_entity_is_idle
>> never becomes false.
>>
>> Fix: In drm_sched_fini detach all sched_entities from the
>> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
>> Also wakeup all those processes stuck in sched_entity flushing
>> as the scheduler main thread which wakes them up is stopped by now.
>>
>> v2:
>> Reverse order of drm_sched_rq_remove_entity and marking
>> s_entity as stopped to prevent reinserion back to rq due
>> to race.
>>
>> v3:
>> Drop drm_sched_rq_remove_entity, only modify entity->stopped
>> and check for it in drm_sched_entity_is_idle
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 23 +++++++++++++++++++++++
>>   2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 92d965b629c6..68b10813129a 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct 
>> drm_sched_entity *entity)
>>       rmb(); /* for list_empty to work without lock */
>>         if (list_empty(&entity->list) ||
>> -        spsc_queue_count(&entity->job_queue) == 0)
>> +        spsc_queue_count(&entity->job_queue) == 0 ||
>> +        entity->stopped)
>>           return true;
>>         return false;
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 908b0b56032d..b50fab472734 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -897,9 +897,32 @@ EXPORT_SYMBOL(drm_sched_init);
>>    */
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   {
>> +    int i;
>> +    struct drm_sched_entity *s_entity;
>
> Please declare i last and have an empty line between declaration and 
> code.
>
> With that nit pick fixed the patch is Reviewed-by: Christian König 
> <christian.koenig@amd.com>. Going to push it to drm-misc-next.
>
> Christian.


Done. Since you are pushing attaching the patch here.

Andrey


>
>>       if (sched->thread)
>>           kthread_stop(sched->thread);
>>   +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>> DRM_SCHED_PRIORITY_MIN; i--) {
>> +        struct drm_sched_rq *rq = &sched->sched_rq[i];
>> +
>> +        if (!rq)
>> +            continue;
>> +
>> +        spin_lock(&rq->lock);
>> +        list_for_each_entry(s_entity, &rq->entities, list)
>> +            /*
>> +             * Prevents reinsertion and marks job_queue as idle,
>> +             * it will removed from rq in drm_sched_entity_fini
>> +             * eventually
>> +             */
>> +            s_entity->stopped = true;
>> +        spin_unlock(&rq->lock);
>> +
>> +    }
>> +
>> +    /* Wakeup everyone stuck in drm_sched_entity_flush for this 
>> scheduler */
>> +    wake_up_all(&sched->job_scheduled);
>> +
>>       /* Confirm no work left behind accessing device structures */
>>       cancel_delayed_work_sync(&sched->work_tdr);
>

--------------741ECC0FB07879515539D646
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-scheduler-Fix-hang-when-sched_entity-released.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-scheduler-Fix-hang-when-sched_entity-released.patch"

From 7f0a1f4ee6d5fa24b50fee199e5d7ea316d2f08e Mon Sep 17 00:00:00 2001
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Fri, 12 Feb 2021 01:45:51 -0500
Subject: drm/scheduler: Fix hang when sched_entity released
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Problem: If scheduler is already stopped by the time sched_entity
is released and entity's job_queue not empty I encountred
a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
never becomes false.

Fix: In drm_sched_fini detach all sched_entities from the
scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
Also wakeup all those processes stuck in sched_entity flushing
as the scheduler main thread which wakes them up is stopped by now.

v2:
Reverse order of drm_sched_rq_remove_entity and marking
s_entity as stopped to prevent reinserion back to rq due
to race.

v3:
Drop drm_sched_rq_remove_entity, only modify entity->stopped
and check for it in drm_sched_entity_is_idle

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
 drivers/gpu/drm/scheduler/sched_main.c   | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 92d965b629c6..68b10813129a 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
 	rmb(); /* for list_empty to work without lock */
 
 	if (list_empty(&entity->list) ||
-	    spsc_queue_count(&entity->job_queue) == 0)
+	    spsc_queue_count(&entity->job_queue) == 0 ||
+	    entity->stopped)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 908b0b56032d..ba087354d0a8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -897,9 +897,33 @@ EXPORT_SYMBOL(drm_sched_init);
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_entity *s_entity;
+	int i;
+
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = &sched->sched_rq[i];
+
+		if (!rq)
+			continue;
+
+		spin_lock(&rq->lock);
+		list_for_each_entry(s_entity, &rq->entities, list)
+			/*
+			 * Prevents reinsertion and marks job_queue as idle,
+			 * it will removed from rq in drm_sched_entity_fini
+			 * eventually
+			 */
+			s_entity->stopped = true;
+		spin_unlock(&rq->lock);
+
+	}
+
+	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
+	wake_up_all(&sched->job_scheduled);
+
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
-- 
2.25.1


--------------741ECC0FB07879515539D646
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------741ECC0FB07879515539D646--
