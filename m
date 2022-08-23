Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A638659EA98
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 20:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913010FF1C;
	Tue, 23 Aug 2022 18:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C5E10FA13;
 Tue, 23 Aug 2022 18:13:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkdoSpMzq5+DDCJLmo5Hng197x/89cs+jAkrZl7mKDWzwYxJ0YEocpSgF4eVX0IU5ZYq5xydLHg/d0SK9oxRZXU7SImf4KAnuKudR/Uub1+cCZqK3eE/wHGporxqZi+WpmklGVXHz48KuqEE6Xycg+XyfIkh7Rvp+hStgEtLPs5j1nCKWEBEy3hAU3A7ZpRHfwhBZtbtSnSQuU0xAhDC2zkKcJQaWy0yUY5c3+QEJmzN/VOmR6xMdOBWS5WWkcyNGHHmCA904V0YPjc5JyKRae1DIQRiPSoQiE9xdMXs1fLpFa9E082htmLAnf1L+9MieN5s6+hJDYwkHCOBTA7wDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+SyW3Oxrdpv/39u8aeYv+1UXeX3TgFs2s+yzohq8z4=;
 b=n9ItyZk96+ZCZH91mlrhQt6k8L/V3puW7tcr1mfg4xIWfDfbBNvglifio5dGHmg0ayZEUg2Ru7cmKysLheDAGqqEi9gC1GFIAXl44IChtnB1bvjrXnogjj+HNe2vkzbHfZ57kKYJt0PozMrsQIvkno1i/iSG+Vn57JjT4EoyS7NTMAVE7mONxrfb+H4DGEpmuN2N5ZJxc9oLLuMP5FLj9STF3fVUYI+qam4dM9XJkrEFqGc05NO2SpEUBZFo3UHxGkQ+rNzS3B4M3Rv5Dz+iDsH1zk3ULFvjdpDZ8G9h4nuI0duhu6Fwfk2L/6jytn//ekp9TzNNBugdI++Lvhcajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+SyW3Oxrdpv/39u8aeYv+1UXeX3TgFs2s+yzohq8z4=;
 b=fZAQ3G1tVVJPkVY9MQy4j2hs74OoQW55vHFHeMT/8M9LfL3CvvWUuc826txNBNvqWFo5k2fO/nI0NOy9tiavmRY3FGHTdkwKp+2clmOkOkPRyT4cMaPqlKF5bcd52VXlrh0+0owhIq6eq3jFKAA7VM0Qb3GKPYR41WrQYc2Agcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BL1PR12MB5921.namprd12.prod.outlook.com (2603:10b6:208:398::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 23 Aug
 2022 18:13:32 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5566.015; Tue, 23 Aug 2022
 18:13:31 +0000
Message-ID: <bf0791b0-c917-6b6e-75bf-0c16869aa045@amd.com>
Date: Tue, 23 Aug 2022 14:13:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
 <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::26) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc022a8-516d-4dfe-f95c-08da85332fb4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5921:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hPPUorU8thoSvFRKbZyVnDwFtkJnwmNNm0oRJEogFmYP1xlEM6NMONQz5V6nbtIJ71owLcW9IIKAbKQUAKhgPnC9BCBhpaWCVhFaG4S8HWmsAOd2+noBYMWO8FeUDnw6mnR/PW4dv8HXB/cw90m7gSq+aa9AxpGyGsoi5ACESMHE9Lc+wayjYNp4CI6gbVTP44JVvbdcismMV1DsoyFsXt6aNYIruA0j5RhZfIhmWgUZFd3sazuncZRtW/MOmC2xHSj6Y0KpLJpCsOuo+wjHssOPVCgahwrXJc1IGxpTdDxireVRIshIiWyK+Fy39VLqiYuWD65qqdwzpbJm+ccSaGFu51IIsjgpj0dyTIgQMwL4arQK71QvjUTscl59MNZDRS/NwdBOTgdSR2b/4HA3VPtQoFy9TFU8Us6HFCad2GYc9wCMvFnPUDb53YNBa86zj8CGy/Bs9SUaHO9XgyX6Kl4Tm8728EPh8ijMAsaPWOuvjC7pD+6vIM4zgKDKu5UyR6Ok3oqcg/oItz6eF3819LAQ0K+pZfjiktHOcWE3YqIvYbuQJ092HE6fuDwxX5Pa6iiJVcQvKc1KXYIqdGwv492nFMc6zloMEYJzASE67CM/XaniRXwD9DwL18yETUfr9Zw45B00JUFxQDP6uF3ohjXR410CjUiRAH7/Ov7jQDLFmPKSYclSn0XBOtH1LWZ7K3WbUxWgzpSEV4vZJYAMtFXQOeSDnxiGV0zQqCYwjWxfrMBXCibuyluuwpKzJo+ww1eqSon4HTY97/WNlkgCe+AqtY2QPwgM9NECqaBR5j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(316002)(2906002)(36756003)(31686004)(8676002)(4326008)(66946007)(66556008)(66476007)(44832011)(5660300002)(8936002)(6486002)(41300700001)(478600001)(6666004)(2616005)(6506007)(53546011)(26005)(6512007)(31696002)(86362001)(186003)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Q2eVRFYXBKR0ZiMHJyNkdmdTA1eTlLU25lOU9FVHY1M0NoNVBLWFhMb0Rh?=
 =?utf-8?B?MlVITFdYYVQ0U2syRkdoSHJUNWlacGdSanJTVTRUNGJlcWRwUmVySW5PMTEr?=
 =?utf-8?B?WklRTjN3NVJ3MEtSREkrdWE1b2c2ZTJuV2lHTzVqMzM4V3Q3eHBSQTRNSVRv?=
 =?utf-8?B?MHM1ZnBNQlBVeG9nTU5JcU5CU0N3cng4aHhnRklPR1JUd0hvTFBoVlRUYVo5?=
 =?utf-8?B?RnNEVkNjekFsck5lWmhoRlNPOWc0blcrRXk2bDM3NVdZbXJoVlE0Vi90eDIw?=
 =?utf-8?B?VG1BbWErM3Ywb0JnZmtVR3UyY01tbjdpQ0VNVXZ3SEZHaTdkOEJhRkVEM1N0?=
 =?utf-8?B?Z3lVcmF5dW5yUktCRmNLU21aL285VmoxaG9xRWVkK05jRFlyNFhXOHR1ZGhz?=
 =?utf-8?B?ejBFbzdFaGh0L1JqZlNyeDcwZnJ6VjFMTUQ0ZDhGdXMvOUM0YVdPRDNIa2V0?=
 =?utf-8?B?VFVMTGd6YVdVUS8rcFVWb0NCQ3BKT3V4ODF2WUhDMStIY29IMFl2REFlNmhx?=
 =?utf-8?B?bW1JbC9jVWVUcXAyb0JPRE53elN3Z3hOTk40c3NJMzU3Y3crQU94RW9RTEo1?=
 =?utf-8?B?Y1dtbkFRSU5hWWxJd3NNWmtZZmZKOThtTUR3L1BsdzZ4NVUrVzR4WThieENY?=
 =?utf-8?B?d0NmSWdieXlKL3ZnaWg1UnE4ZkV2THV4OWh1WGoyaWRyNTBkWllsQmN2QUcv?=
 =?utf-8?B?eS9mYTR6eGZpK3RWOG1OZWZETkRnZUxrdDJpZjhtMUtIMUpacWhtemlyY0t5?=
 =?utf-8?B?cE95TkIycDQ0NEJqNDdtcWdJblJSUk1lUnRTcXBtR3c1d28rUXcraW9aRDlP?=
 =?utf-8?B?V3ZOQmdwY0h0VUdCVXJ4MkVVQVlzM2Z6TjhpK0txWEpzc2lXQXZLRzQrWlJ2?=
 =?utf-8?B?SHpwQ0Q3TU1uVEpaS1VnclVCbHBNanZxOE9admg4MzYvWTVRSXZjME00cXFC?=
 =?utf-8?B?Z0JJSkFYN0JXcVZTZ2hSbVhydEc2bDg1Uk1mT0Q1MFl6Z2hLUjZLUEhteW9r?=
 =?utf-8?B?NUw1TFNDays5VnNhN0NLK2JEQ3hvRWZKVTBjZmkrN1ZkR0U5S2d3YjUzN2xp?=
 =?utf-8?B?aUFPYmlhdzc4NkJuSkVoYndTaWdzRTZUWG9iZlNzek9pMGZKZ3VXOFpoKzJq?=
 =?utf-8?B?UjhLZm10TXlJWDE5OWRKOGZoT2NtUE81TE1hRTJFWmNVc05ybmxnb1FvZ0Mw?=
 =?utf-8?B?WHYzSkFLbUpCYnZnVDZFZm0vdGV2RDFNSThOdGk1WDJMc0NWYjdYZGRpc0Zk?=
 =?utf-8?B?YmhiUGxybXQ4eSt4ODE0OFlwWElsRkx5Q1E5M1lCaHBiVXhGTU1SaVZZdW1h?=
 =?utf-8?B?SWpVbDFoT0VwM2NvN0JkU1dnUnI1K3lOQXFrYzJ4SDJ2dWwxS2Z1bDFFN3NG?=
 =?utf-8?B?MEk0U1VmRXhEbDE3ZW5iT0hteC8vOW0zTGg2WTF2VVlPMENzc2JyalpGa00v?=
 =?utf-8?B?ZFhQQzJpRjFpdXZxZG9tMEtyK3ROaHA3cktvRzBHT0hjNXRCMU05QUdiaU9o?=
 =?utf-8?B?QTU4dDFDRFd1QkFtUVhsQkhManBvOC9USHdRVDhpeEdldHRuSkxQWlpDLzVL?=
 =?utf-8?B?dDRYWjhUNXBMU1JRRUZDU1paRmxBajRIWUR5bDVxT1ZXMGhBQjUxK2l6SzFm?=
 =?utf-8?B?eEdZV2IrRmFWSnpacnB4RUswUmVWS0Z2VGVxSysxdGFzTUd0Wmp3bUo2SzBK?=
 =?utf-8?B?ZHEvVHVsTElCUHJ0NW5HZFEvaVhqNExwdHdHb1RGTTFYZml4RENqZnlxTnR1?=
 =?utf-8?B?Q2NwSVZRUlBlSkh2R0ZyQ2hMVXhrN3laMHJ5UE9tQ2ZnTDJtTzJFeXQwYUN4?=
 =?utf-8?B?NnlZZmFnVWd5bWNQallmSXIwRzkvVklZSWNnUFlQdktFRWV2ak94RmVJQ0JH?=
 =?utf-8?B?M3ZQUG10cWhxc0JwSGhvNG9kMHJkMFl5czhhcmtSQnM3VmRTb3ZpOTlvYWZR?=
 =?utf-8?B?bHJXd21TV3NIU3dXNGlNRGhXQ3lwZHowVDBSbmE0MDdHbzc1SXg1NU1oQ2x0?=
 =?utf-8?B?SXZKSVdjemM1Tkh3QTBKR2tGYlhLMFVKZW5FcTdYeHV4ZFRpTWFkQkw3dUpC?=
 =?utf-8?B?UzFseHpYWDhnZ0JDK0hiazQ1RURjUS82L0dBNjgzeXNBZlpEQ21jNis0dS9i?=
 =?utf-8?Q?p918lQ/nIR/y6IisXatXsR5Ef?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc022a8-516d-4dfe-f95c-08da85332fb4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 18:13:31.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRBn0lmOUASH3Iq9pBGvHXqAlC/gv++/Pw0QeX5TEU72KBgYNf1pTnPZp/puS3UTiDiRiCQt+tr7pl913u1naQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5921
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
Cc: ckoenig.leichtzumerken@gmail.com, Li Yunxiang <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-08-23 12:58, Luben Tuikov wrote:
> Inlined:
>
> On 2022-08-22 16:09, Andrey Grodzovsky wrote:
>> Poblem: Given many entities competing for same rq on
> ^Problem
>
>> same scheduler an uncceptabliy long wait time for some
> ^unacceptably
>
>> jobs waiting stuck in rq before being picked up are
>> observed (seen using  GPUVis).
>> The issue is due to Round Robin policy used by scheduler
>> to pick up the next entity for execution. Under stress
>> of many entities and long job queus within entity some
> ^queues
>
>> jobs could be stack for very long time in it's entity's
>> queue before being popped from the queue and executed
>> while for other entites with samller job queues a job
> ^entities; smaller
>
>> might execute ealier even though that job arrived later
> ^earlier
>
>> then the job in the long queue.
>>
>> Fix:
>> Add FIFO selection policy to entites in RQ, chose next enitity
>> on rq in such order that if job on one entity arrived
>> ealrier then job on another entity the first job will start
>> executing ealier regardless of the length of the entity's job
>> queue.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>>   drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>>   include/drm/gpu_scheduler.h              |  8 +++
>>   3 files changed, 71 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 6b25b2f4f5a3..3bb7f69306ef 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   	atomic_inc(entity->rq->sched->score);
>>   	WRITE_ONCE(entity->last_user, current->group_leader);
>>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>> +	sched_job->submit_ts = ktime_get();
>> +
>>   
>>   	/* first job wakes up scheduler */
>>   	if (first) {
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 68317d3a7a27..c123aa120d06 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -59,6 +59,19 @@
>>   #define CREATE_TRACE_POINTS
>>   #include "gpu_scheduler_trace.h"
>>   
>> +
>> +
>> +int drm_sched_policy = -1;
>> +
>> +/**
>> + * DOC: sched_policy (int)
>> + * Used to override default entites scheduling policy in a run queue.
>> + */
>> +MODULE_PARM_DESC(sched_policy,
>> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
>> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
> say the RR.
>
> I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.


Christian is not against it, just against adding 'auto' here - like the 
default.


>
>> +
>> +
>>   #define to_drm_sched_job(sched_job)		\
>>   		container_of((sched_job), struct drm_sched_job, queue_node)
>>   
>> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>   }
>>   
>>   /**
>> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
>> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>    *
>>    * @rq: scheduler run queue to check.
>>    *
>> - * Try to find a ready entity, returns NULL if none found.
>> + * Try to find a ready entity, in round robin manner.
>> + *
>> + * Returns NULL if none found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>>   {
>>   	struct drm_sched_entity *entity;
>>   
>> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>>   	return NULL;
>>   }
>>   
>> +/**
>> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
>> + *
>> + * @rq: scheduler run queue to check.
>> + *
>> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
>> + *
>> + * Returns NULL if none found.
>> + */
>> +static struct drm_sched_entity *
>> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>> +{
>> +	struct drm_sched_entity *tmp, *entity = NULL;
>> +	ktime_t oldest_ts = KTIME_MAX;
>> +	struct drm_sched_job *sched_job;
>> +
>> +	spin_lock(&rq->lock);
>> +
>> +	list_for_each_entry(tmp, &rq->entities, list) {
>> +
>> +		if (drm_sched_entity_is_ready(tmp)) {
>> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
>> +
>> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
>> +				oldest_ts = sched_job->submit_ts;
>> +				entity = tmp;
>> +			}
>> +		}
>> +	}
> Here I think we need an O(1) lookup of the next job to pick out to run.
> I see a number of optimizations, for instance keeping the current/oldest
> timestamp in the rq struct itself,


This was my original design with rb tree based min heap per rq based on 
time stamp of
the oldest job waiting in each entity's job queue (head of entity's SPCP 
job queue). But how in this
case you record the timestamps of all the jobs waiting in entity's the 
SPCP queue behind the head job ?
If you record only the oldest job and more jobs come you have no place 
to store their timestamps and so
on next job select after current HEAD how you will know who came before 
or after between 2 job queues of
of 2 entities ?


> or better yet keeping the next job
> to pick out to run at a head of list (a la timer wheel implementation).
> For suck an optimization to work, you'd prep things up on job insertion, rather
> than on job removal/pick to run.


I looked at timer wheel and I don't see how this applies here - it 
assumes you know before
job submission your deadline time for job's execution to start - which 
we don't so I don't see
how we can use it. This seems more suitable for real time scheduler 
implementation where you
have a hard requirement to execute a job by some specific time T.

I also mentioned a list, obviously there is the brute force solution of 
just ordering all jobs in one giant list and get
naturally a FIFO ordering this way with O(1) insertions and extractions 
but I assume we don't want one giant jobs queue
for all the entities to avoid more dependeies between them (like locking 
the entire list when one specific entity is killed and
needs to remove it's jobs from SW queue).

>
> I'm also surprised that there is no job transition from one queue to another,
> as it is picked to run next--for the above optimizations to implemented, you'd
> want a state transition from (state) queue to queue.


Not sure what you have in mind here ? How this helps ?

Andrey


>
> Regards,
> Luben
>

In my origianl design

>> +
>> +	if (entity) {
>> +		rq->current_entity = entity;
>> +		reinit_completion(&entity->entity_idle);
>> +	}
>> +
>> +	spin_unlock(&rq->lock);
>> +	return entity;
>> +}
>> +
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   
>>   	/* Kernel run queue has higher priority than normal run queue*/
>>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
>> +		entity = drm_sched_policy != 1 ?
>> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
>> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
>> +
>>   		if (entity)
>>   			break;
>>   	}
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index addb135eeea6..95865881bfcf 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -314,6 +314,14 @@ struct drm_sched_job {
>>   
>>   	/** @last_dependency: tracks @dependencies as they signal */
>>   	unsigned long			last_dependency;
>> +
>> +       /**
>> +	* @submit_ts:
>> +	*
>> +	* Marks job submit time
>> +	*/
>> +       ktime_t				submit_ts;
>> +
>>   };
>>   
>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
