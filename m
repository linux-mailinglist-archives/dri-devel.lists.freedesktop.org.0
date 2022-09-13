Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A965B6E9A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE3810E716;
	Tue, 13 Sep 2022 13:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB24410E723;
 Tue, 13 Sep 2022 13:50:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wdb2mOBJhmtqNz3JN1yDIlJEaBM5GRxuWPlKxH5bcobby3NongO9j0pH8f3WbPHqcIbPhFU9W2zxGmqMB/7C8IA/1TrdnCa8CsgSgpI62fD89IX8iKjEmaPrU/b/xMapglg95AX2cDvQrb5RBwR92ldDBeg2BKXV3mnU4+LQqH0Eruwe9EpmoTId933L5TK40/XvoQ2tzTDPlOkhCrFuzVnW6IIOWrPuooifTIcvH7y1cmSOuopPwIpIvSPx6XScVc8oPFWe4NgRgkHB51I85zmXi7c7XL2761WnTZ7bE9f/Mu4YFYOaO78rjdhoEXiMaquf6eRnNXhQAl9KIbJu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPv3Km0sl3VHSbi0hV8J4rspvBSojTQ7+GjtmgTj0Qc=;
 b=cYNxnsMoZOvnjFFs6xPKlWReNs1Rfa84tyrHCxXC39JgNa0ERdhTXZOSZtfgxd00KIzJjZQi9QOUuq+RSU+F8T0DoKZQHX0vW4u2JwrCFmhVphdMm/jMzSQE5P1Tey0s9BfhgdOSZL/eK9S/tusxW2nIzcDK0QQ1qTWIqPUZ3wA6Ev4uFxXTBUVgS3Zv7zbf58ry/+6fmzQwTzCRVy51xM4o+mq1rr7LuD7xf310wbnRuA1W2gyVHqPUw2RlbkUxJiZvcAxBQWrfHS7GBevT+pi9jzTW6jYa2NDh6uZx6QTjxDIPkrLN6rRJGmxNw3wannc17pMCnre+gLrOFg/ZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPv3Km0sl3VHSbi0hV8J4rspvBSojTQ7+GjtmgTj0Qc=;
 b=BTaz1i4854m/pVpOrCTWcf3TWyBOym2Zn9RBs+hsvSSvF7A2FcFpMOgAqBla3z4JAL8hgL11mXAPwCtmNRnqCpXQgb8t1EOmDHCDazy2D9b7VYEHCw9kVc75814R3Eg0RrHUht8kArqemwZsoyl7vXT2OJ8aDfPXYp31oSRC+1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3375.namprd12.prod.outlook.com (2603:10b6:208:cc::12)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 13:50:22 +0000
Received: from MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::855e:f995:b7a0:130b]) by MN2PR12MB3375.namprd12.prod.outlook.com
 ([fe80::855e:f995:b7a0:130b%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 13:50:21 +0000
Message-ID: <4999c81f-3b9b-a2e6-7076-1be7d72c0b74@amd.com>
Date: Tue, 13 Sep 2022 09:50:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v2] drm/sced: Add FIFO sched policy to rq
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
Content-Language: en-CA
In-Reply-To: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::7) To MN2PR12MB3375.namprd12.prod.outlook.com
 (2603:10b6:208:cc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3375:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3cc455-ca88-4dea-ea36-08da958ee676
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kq+SFOtxltBAGJLi9F8KRk9YjCMTEf/nztSGlIvW+l/pA9MaO5RGXz+mMD0IBg5Om8nU5zIxlVYDBaAZKHA1P68p2Hay28ya0cSBBzr3VvtwdtPGphKsEuSzujqokhIHH0D4SSgrtpKcCe0XJO7PgVDRk8xc06av+uSgQwE9AEfOfqIX/k1KMYWqDJDJs82cNcRuweyhiMyKisYAvCOCAxah/iTcx1fMHVHkX7xd9dIxYfX/lxkoOmGpHOHtjWudJZE29hePo8yrpFeZ9yQ5+Xh8FAsPMHkSza6xAz1czZF8imZ4OmxwjineEwPU23eqV7sSPPldosgiwLN4jV8lFY+fVXP2X2/WXlX/ODS8+nSGz/RG1EWThRTrZhEZNSaiqxSVdrlGAnUaFp2Y+bRg9Jx4iTScIVYbN/ziUcF9EIFokovzTnH3OvGBtI4eumfa27vjXFAYt2uOxoBagpJ1WJN41QGvR8DYjVqbD/mY4ujMlhkKkBRXylvItNjAIGZu8VvKKW5SPTwadRvQHNHtMd7dMXvzgoKgl8VKrVGPdScA/6WWqlo6rUZnH4UI/uhcMIn/GqY0KY0vsfVs6j2FOSpVEsnZPvWm0J4BUSfABzM8ecwe3UuUUw/2olWrKXOY0XDuYCrJPZAZRVLZf+akUqGBvFrFslRLppKiTORgXD8eP2pAhJuRVMCl6twGNduIf/zqEUu61Dh/or1M1JV23ne44JYG118A7I1a3SLJtL3wyjEywal/Aq5fp+MjyNc3cjz9IfadN7toVZVkLzIHgCAqeXWKo5fKUdRTd7EUebw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3375.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(8676002)(83380400001)(66946007)(53546011)(6506007)(26005)(2906002)(6486002)(31686004)(66556008)(86362001)(6512007)(2616005)(41300700001)(316002)(66476007)(31696002)(44832011)(4326008)(36756003)(30864003)(5660300002)(186003)(38100700002)(478600001)(6666004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzZoZ09qZlVmYmpVYWZtOGFFdmYwdDFkeWZ0am9HZ3hvUnU0TDhuVVNWN0h4?=
 =?utf-8?B?QzRCQ2h3ZDA1cm5Gek54M1kxQUhOTjR1dVpUdlExTkFaemdvT2tOekhLeTRB?=
 =?utf-8?B?ZE1sUlVNYlRNSld4Vm9scVdNbzk3L0lHLzY3TlBndkJaK2xGT29xTEgvSktn?=
 =?utf-8?B?RDJIcDkyVkFER085REkwTHJXbURzTTdJNGZoOUFFWmhsTnBtNGMrN0duamhr?=
 =?utf-8?B?bHBoWkpOSlBZVCtBd3BxOEREeUNCME9selczMDNvN1B2MHJRMXV5WEJ4QWVM?=
 =?utf-8?B?SEtUTy9zbFpiNWRsUjgyWTBhbVRKZlJYSDhCKytCbHdCTjFvczBnbk9QdXY5?=
 =?utf-8?B?a2EvZHVESzhiYVM0MlpaMzNIQiszQkFUd2lEOVVPVnA3RFRkTFVCR216SDh2?=
 =?utf-8?B?RjZ6MHhQV2xkMjlQMVFyYlhXR0I1VG1oU1JWVWFWeDRUZG9RMlBtZkluYSs2?=
 =?utf-8?B?bUIvS0s1RGNBOEUwRnAvM1d0VkloOGYvV1hZMEtzcTBKOUR1bnFQZGM5ZWxC?=
 =?utf-8?B?QXd5MmlRQUlZRFB5dU1rMFlFeXRrdVR4OVp6KzlkMktEY3NlSnFkdytuOUw3?=
 =?utf-8?B?OWRJQi9zRDU2Y0VCMENlUGNXY1Zia2pwMGxDdnA3cUQwb3M5TmZoRWs3SlQ3?=
 =?utf-8?B?TzNGM010WmNpRktHbS9pRXh4N01qUmRaVmpFN3E5a2RoWGZkcXkxU2xGc09R?=
 =?utf-8?B?TkdxS2Q1eFZrOTA1MWxRMlJZcTVLMm1jTFRRRVVIQTFoc05QMmRWTmRtNFZo?=
 =?utf-8?B?VVpYdzNOQVZYRWR3U00rTUtva1pmQWNTeVBNdllxeDU2OHA3UlM4dkJrUGxs?=
 =?utf-8?B?bVZhbDRuNitQNjh2VFdRY0tpenZzZzluR0wrNW1IYzhKQ1hqbmZlQnhaeEdL?=
 =?utf-8?B?YURBcFY2ZzNFYXBDeU9aRmdmV0NxOE10RDNsZERYVXZCTjdVc0tOdENYSFRr?=
 =?utf-8?B?ZFM0UTJlcHp3YUNQNVozcDh2TTlpRGRpTWR4TFhDdzFpVVZkVld6c0o4M3hl?=
 =?utf-8?B?eDQ1MEVXeE5rUDdmVVZXR2ZYVTZJb0pRMXVReUVZZEpMZ25qNGVOeENnTEZi?=
 =?utf-8?B?WVp3MHZFcHhqNUI1WXZSdkRkbGJxYWNWaUlRejBRT2xIQ0N1L0k1M24rRldG?=
 =?utf-8?B?aEMzRmVvejhXVmR1aS9LUFIvZ0Iza09NRjZzQ0VpSW9sNUZvM1NJL3Z1Z1RG?=
 =?utf-8?B?bDhHOGJFVVlRdjNWWWVYbnRUY0MxK1ZCR04wOVhDTlhiYVk0TDJXQjcwczhW?=
 =?utf-8?B?S1F2NU1jNDFseFhVZThPQVJKY0g5MCtPWUExYlNsVnhpZGluNTQvV2xYK3JG?=
 =?utf-8?B?dlNLN3ZZc21CT0dKdm95UVR5NGszcXF4ZDlCTkt3RENxazAxRXV4YjdJVHpR?=
 =?utf-8?B?YThUb3NkVWlRckE1Qm5mNWtmZGJJMGZodEhhckEzU3p4L3hZdmR3b2h6ais2?=
 =?utf-8?B?MFg5R2JHbU1RNDRseFh1WjQ5aUtMMlFiT1NsZWl2Rm04eWVHZDBBT09BeDVU?=
 =?utf-8?B?a3BRRk1LRy9lYmVZOVJyWnA3ZW5YWlJkNUl3YTd2V0Q0Y2EyaStNRlNkM3JK?=
 =?utf-8?B?Wks1MWl4Y2FrMnpFSCtXc1doT2xybHFtRXdUWVBoSEQ1R1M5WmVpTzhWekxl?=
 =?utf-8?B?WWtxQXRVZy9UNGdvSEdndW1wM1JMK3BCSy9yeG9nbkhIM3l3eXRud2d6ckhi?=
 =?utf-8?B?cFpUZm1mM0NqV0EwN2F4c0kycTVWMytUays3V2R2d3lCaWU3ZUEzZ0tHb1NC?=
 =?utf-8?B?c0hPNjRvWCsvZGxnR3MyelFTVWdObjl1RkV5T1l0enZQdGlLcE5TUStZK2Z2?=
 =?utf-8?B?YjBaejB1bmpMZ3pURWhWSzdUQVFQd1YvdzVPT2l2S0VBOGJ2YUpqMWZ4SmFI?=
 =?utf-8?B?dHFPQlZlSFpyUm5OSXFXRWplZjZSRkxreERwY3NWMUtETWlTT1Z1S0ZHZlVv?=
 =?utf-8?B?WXMzeWExS2hoN0pCQ2dUN3R5Q0JUZWczbmVrbjhVYndCaFBTMGcrVjQ4UXd0?=
 =?utf-8?B?U0NzTjU1akxPdUdvVWdtdXV5YVNFSlI4ZkVPdlk2Y2NacGowMVFzVFpOUkhn?=
 =?utf-8?B?VVlnSlRlN3p5bEUyTkluL1B6L3pOeStnUjNpN2dpR3c4dmt0WklwM3ZoelM4?=
 =?utf-8?Q?Eu5OS2+oeIMRw3tjgI2ODYuoH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3cc455-ca88-4dea-ea36-08da958ee676
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3375.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 13:50:21.3450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSCG/MrePFEavV6eCvTVWw9jrbv4tkQOYq3V3XxpYRo279HXHzzjHejY0B73ngkl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
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

The title needs a spelling fix: /sched:
I'd also spell out "rq" as it is in a title.

The patch has a number of warnings from scripts/checkpatch.pl.
I suggest it be run through checkpatch.pl before submitting.

Inlined:

On 2022-09-02 22:48, Andrey Grodzovsky wrote:
> Poblem: Given many entities competing for same rq on

"Problem", but I'd drop it, and just start with "Given ...".

Spell out "rq" to run queue, it makes it an easier read,
throughout the commit message, above and below.

> same scheduler an uncceptabliy long wait time for some

"unacceptably"

> jobs waiting stuck in rq before being picked up are
> observed (seen using  GPUVis).
> The issue is due to Round Robin policy used by scheduler
> to pick up the next entity for execution. Under stress

"... the Round Robin policy". I'd also clarify that
what we're picking in a round robin policy is
the entity's job queue, from which we pick the oldest job.
This makes the problem clearer to a casual reader,
in that if one entity's job queue is very long, but other's
is just one job deep, longer entity's queues will get starved,
compared to shorter ones, as we pick off the "top" in a FIFO
manner.


> of many entities and long job queus within entity some
> jobs could be stack for very long time in it's entity's

"queues", "stuck", "its".

> queue before being popped from the queue and executed
> while for other entites with samller job queues a job
> might execute ealier even though that job arrived later
> then the job in the long queue.

"entities", "smaller", "earlier".

> 
> Fix:
> Add FIFO selection policy to entites in RQ, chose next enitity
> on rq in such order that if job on one entity arrived
> ealrier then job on another entity the first job will start
> executing ealier regardless of the length of the entity's job
> queue.

I'd remove this paragraph altogether as it doesn't apply to
this version of the patch, and it is somewhat confusing
in regards to what this patch commits. (Or at least spell
check it, "entity/entities" is misspelled four times,
and use "run queue" instead of "rq".)

> 
> v2:> Switch to rb tree structure for entites based on TS of

Spell out "rb" to "Red-Black", "entities", TS --> time-stamp
for clarity.

> oldest job waiting in job queue of enitity. Improves next

"entity"

> enitity extraction to O(1). Enitity TS update

"entity" x2 and "TS" --> "time-stamp".

> O(log(number of entites in rq))

I'd say "O(log N) where N is the number of entities in the run-queue."

I'd do this instead,

v1: Use a FIFO.
v2: Switch to a Red-Black tree from a FIFO.

And use the explanation above in the actual text of the commit.

> 
> Drop default option in module control parameter.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  29 ++++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 131 ++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              |  29 +++++
>  3 files changed, 183 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 191c56064f19..65ae4be2248b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -33,6 +33,8 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +extern int drm_sched_policy;

This should be in gpu_scheduler.h, so that both sched_main.c and sched_entity.c agree on its prototype.

> +
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -73,6 +75,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	entity->priority = priority;
>  	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>  	entity->last_scheduled = NULL;
> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
>  	if(num_sched_list)
>  		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> @@ -417,14 +420,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  
>  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>  	if (!sched_job)
> -		return NULL;
> +		goto skip;
>  
>  	while ((entity->dependency =
>  			drm_sched_job_dependency(sched_job, entity))) {
>  		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>  
> -		if (drm_sched_entity_add_dependency_cb(entity))
> -			return NULL;
> +		if (drm_sched_entity_add_dependency_cb(entity)) {
> +			sched_job = NULL;
> +			goto skip;
> +		}
>  	}
>  
>  	/* skip jobs from entity that marked guilty */
> @@ -443,6 +448,17 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	smp_wmb();
>  
>  	spsc_queue_pop(&entity->job_queue);
> +
> +	/*
> +	 * It's when head job is extracted we can access the next job (or empty)
> +	 * queue and update the entity location in the min heap accordingly.
> +	 */
> +skip:
> +	if (drm_sched_policy == 1)
> +		drm_sched_rq_update_fifo(entity,
> +					 (sched_job ? sched_job->submit_ts : ktime_get()),
> +					 false);
> +

Perhaps use a macro definition, as opposed to "1" for drm_sched_policy. Something like this:

#define DRM_SCHED_POLICY_RR    0
#define DRM_SCHED_POLICY_FIFO  1

You can then use this macro in the module string with the usual substitution to get
the literal value embedded into the string.

They should be defined in gpu_scheduler.h.

>  	return sched_job;
>  }
>  
> @@ -502,11 +518,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
>  	bool first;
> +	ktime_t ts =  ktime_get();
>  
>  	trace_drm_sched_job(sched_job, entity);
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ts;
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> @@ -518,8 +536,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)

Perhaps also update the kernel doc for this function here.

>  			DRM_ERROR("Trying to push to a killed entity\n");
>  			return;
>  		}
> +
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
> +
> +		if (drm_sched_policy == 1)
> +			drm_sched_rq_update_fifo(entity, ts,  false);

Here use the macro discussed above instead of the literal '1 in the comparison with drm_sched_policy.

> +
>  		drm_sched_wakeup(entity->rq->sched);
>  	}
>  }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c5437ee03e3f..4d2450b3f5bd 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,62 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +int drm_sched_policy = 0;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entites scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy,
> +	"specify schedule policy for entites on a runqueue (0 = Round Robin (default) ,1  = use FIFO");
> +module_param_named(sched_policy, drm_sched_policy, int, 0444);

For 0 and 1, use the macros discussed above here. 

> +
> +static __always_inline bool drm_sched_entity_compare_earlier(struct rb_node *a,
> +							     const struct rb_node *b)

I think the standard naming for such a function as seen in the rest of the kernel,
is "_before(", not "_earlier(", to mean "is a before b", although both mean
the same thing in English, the former is traditionally used in the kernel and
perhaps we should stick to that, to make understanding easier.

> +{
> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> +}
> +
> +static inline void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> +						   ktime_t ts, bool remove_only)
> +{
> +	struct drm_sched_rq *rq = entity->rq;
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +
> +	if (remove_only)
> +		return;

Wouldn't it be a better design to have a function which removes,
and call that function from this function?

Overloaded functions like this can make for a messy design.

In sched_entity.c you always call this function with "false".
It is in sched_main.c which you call it with "remove" used
as a conditional. For this reason, I think it would be much clearer,
if there was a "remove"-only static inline-perhaps function here
in this file, and this function here without the overloaded "remove_only".

> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +		      drm_sched_entity_compare_earlier);
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts,
> +			      bool remove_only)

Remove "remove_only" here to this exported function, and apply what I mentioned
above to make the design cleaner.

> +{
> +
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->rq->lock);
> +
> +	drm_sched_rq_update_fifo_locked(entity, ts, remove_only);
> +
> +	spin_unlock(&entity->rq->lock);
> +	spin_unlock(&entity->rq_lock);
> +}
> +
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> @@ -75,6 +131,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  {
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>  	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
> @@ -92,9 +149,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  {
>  	if (!list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
> +
>  	atomic_inc(rq->sched->score);
>  	list_add_tail(&entity->list, &rq->entities);
> +
>  	spin_unlock(&rq->lock);
>  }
>  
> @@ -111,23 +171,32 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  {
>  	if (list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
> +
> +

Checkpatch.pl should catch this double empty-line insertion here.

>  	atomic_dec(rq->sched->score);
>  	list_del_init(&entity->list);
> +
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
> +
> +	if (drm_sched_policy == 1)
> +		drm_sched_rq_update_fifo_locked(entity, 0, true);

Use a macro constant for drm_sched_policy and remove "true" and use
a dedicated removal function.

> +
>  	spin_unlock(&rq->lock);
>  }
>  
> +
>  /**
> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
>   *
>   * Try to find a ready entity, returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -163,6 +232,59 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>  	return NULL;
>  }
>  
> +
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run

"Select an entity which _provides_ a job to run"--not "could". This decision is made
internally here and you return NULL if no such one exists.

> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Try to find a ready entity, returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +		struct drm_sched_entity *first, *entity = NULL;
> +		struct rb_node *rb;
> +		spin_lock(&rq->lock);

You need an empty line before the spin_lock() line--don't bunch them up together
with the declarations.

> +
> +		rb = rb_first_cached(&rq->rb_tree_root);
> +		if (!rb)
> +			goto out;
> +
> +		first = rb_entry((rb), struct drm_sched_entity, rb_tree_node);
> +		entity = first;
> +
> +		while(true){
> +
> +
> +

You don't need three or any empty lines here. Also you need a space before the opening brace.

> +			if (drm_sched_entity_is_ready(entity)) {
> +				rq->current_entity = entity;
> +				reinit_completion(&entity->entity_idle);
> +				break;
> +			} else {
> +				/*
> +				 * Push not ready entity to the end of the line so others
> +				 * have chance
> +				 */
> +				drm_sched_rq_update_fifo_locked(entity, ktime_get(), false);
> +			}
> +
> +			rb = rb_first_cached(&rq->rb_tree_root);
> +			entity =  rb_entry((rb), struct drm_sched_entity, rb_tree_node);
> +
> +			/* We completed full cycle */
> +			if (!drm_sched_entity_is_ready(entity) && entity == first) {

Is it possible to use a do { } while (entity != first); loop here? Since we check if ready at the top
of the loop, is it possible that we wrap around and at the end found out that it is ready then, but
it wasn't ready at the start of the loop? (which which case we could export it via a different variable...)
(Just wondering, not a blocker or anything...)

> +				entity = NULL;
> +				break;
> +			}
> +		}
> +
> +	out:

No need for empty line above the label.

> +		spin_unlock(&rq->lock);
> +		return entity;
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -592,6 +714,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>  		       struct drm_sched_entity *entity,
>  		       void *owner)
>  {
> +

Unnecessary empty line.

>  	drm_sched_entity_select_rq(entity);
>  	if (!entity->rq)
>  		return -ENOENT;
> @@ -801,7 +924,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy != 1 ?
> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);

Use a macro for '1' here as discussed above.

>  		if (entity)
>  			break;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 944f83ef9f2e..9fb20c963c5c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -196,6 +196,21 @@ struct drm_sched_entity {
>  	 * drm_sched_entity_fini().
>  	 */
>  	struct completion		entity_idle;
> +
> +	/**
> +	 * @oldest_job_waiting:
> +	 *
> +	 * Marks earliest job waiting in SW queue
> +	 */
> +	ktime_t 			oldest_job_waiting;

In the comment, I'd say "oldest" not "earliest", as that's the word being used
in the comment heading and in the variable. Instead of "Marks",
I'd say "Record the time of the oldest job waiting in the software queue".

> +
> +	/**
> +	 * @rb_tree_node:
> +	 *
> +	 * To insert this entity into time based priority queue
> +	 */
> +	struct rb_node 			rb_tree_node;
> +
>  };

The comment should say "The node used to insert this entity ..."

>  
>  /**
> @@ -205,6 +220,7 @@ struct drm_sched_entity {
>   * @sched: the scheduler to which this rq belongs to.
>   * @entities: list of the entities to be scheduled.
>   * @current_entity: the entity which is to be scheduled.
> + * @rb_tree_root: root of time based priory queue of entites for FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
>   * one specific ring. It implements the scheduling policy that selects
> @@ -215,6 +231,7 @@ struct drm_sched_rq {
>  	struct drm_gpu_scheduler	*sched;
>  	struct list_head		entities;
>  	struct drm_sched_entity		*current_entity;
> +	struct rb_root_cached 		rb_tree_root;
>  };
>  
>  /**
> @@ -313,6 +330,14 @@ struct drm_sched_job {
>  
>  	/** @last_dependency: tracks @dependencies as they signal */
>  	unsigned long			last_dependency;
> +
> +
> +	/**
> +	* @submit_ts:
> +	*
> +	* Marks job submit time

"Records the job submit time"

> +	*/
> +	ktime_t                         submit_ts;
>  };
>  
>  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -501,6 +526,10 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity);
>  
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts,
> +			      bool remove_only);
> +
> +
>  int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  enum drm_sched_priority priority,
>  			  struct drm_gpu_scheduler **sched_list,

Regards,
-- 
Luben
