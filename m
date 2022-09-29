Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613E55EFDA8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 21:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DEA10EC5C;
	Thu, 29 Sep 2022 19:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D8210EC4E;
 Thu, 29 Sep 2022 19:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bcl9Oo8p2BfivtLZzHUe5+ksVU8eIaaEgGsFFKmG8xzuOxDQFQG6S9BJ6j0/gSE1n6bWyY2PTUzftW0Mi5EJaMZVLYgvI9cdchjLgBNZ+LQegQ+0/yvLl0Ok4SDSVP7rR3/FmVVK+APk/uzyT9uvhrHgp1AgyAMRm3HKPK21wWmirpwTju+jIskupzGeqrFmpQLK1fRw0+80xg4MgL9yR3v4SMl9ezCQwB9WujhYPmHW6wTz6F2mQEXrN84NEJQ4Q/jkw7e8dm87wS5IAqztDoERf7A1bxctmcdgkESuSvKqp21vhmsZUeo8jHjvIxy4koEo30iAqoyIGNhhImZypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxu9AWxo1wzn2+2ew6pMnTB7AkWgyEmhXeAv1SaJE9A=;
 b=HLkkMV2xuquDC1zTP0fpQhJgHpPB2VDQ11apd0gv926mEAgufGk9QcVYiZi5B6F9E8FGm+BheAkSgEAJfXck7ON47LPUvt+6mVkWPZjMnTMNYPFQQfTA+RjHD/GHZKm0owVIdZGm5J8Xcv2hcOklx7NLqkfYg1EFhhe3SU4Q/Df94pzQukq21r20yYYjrX9PqRg4nCreP8jMS/Vo+CXMiQ4y60XSdwXNO6mEQD3z+4Pk36FRNLZpxwewxnUE4UwuQXGKAm3x6tPwaaiIXiTPrefRuwhCaw42a++DaKCfv7f0hR7SAtbO1BGWUbrKT1SjJJCo27Gg5NDiVIv3Bj37Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxu9AWxo1wzn2+2ew6pMnTB7AkWgyEmhXeAv1SaJE9A=;
 b=svnzzl9ZExhgof0tKlu9+SKrK7AFLo+G52zwn89NIXvWa0WLHFG8trpXW0WatkzvUMbVDRlkYD8N5Q5AGTNb2Vfl/KufwdMD/s2ZCym87sdBxytNfvSFV0A1X8CaXIZHO4IA+sHBGCggvK2v+mz+3Q37aE4qRS3hGmEDnWHUUIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB5392.namprd12.prod.outlook.com (2603:10b6:5:39f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 29 Sep 2022 19:11:30 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::c549:82d4:60d9:2a8a%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 19:11:30 +0000
Message-ID: <4baa5bda-dd14-f49a-927a-4fb1dc6596fa@amd.com>
Date: Thu, 29 Sep 2022 15:11:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/sched: Add FIFO sched policy to run queue
Content-Language: en-CA
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20220929184605.890379-1-luben.tuikov@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220929184605.890379-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de62c36-cb46-4858-aa85-08daa24e6a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiAGFmY3d/I14u2PPwrj6uciNpPVEtwgX03RcfvZCKQPs85S5+bVhDEMbUAEYMs+dh3A3WqltHlIj4wce5vGK1zvdNL/vskv/gZRSk+sJ7gjF7p2n0UjHMMwFPwPL8z0vKgxjVwPeOiku0MqUXlAehI3V8f8RmbzW2s/WV/pYhLzW03hD4qwnM91Fov60TqVO700F3rY/JqPpDiQ/zMY1lb3OqscQb3N42P3KtNsbPKR3OtoeN63kpi8V2t4MYC2MkDjGITBl5e9Ow5pMSPOJvsU+7VrQPgkVNwQW1vRk99gguBF4aaB1CUT4DvA14+vC0kaeoYCO4mU7DDz2Qw7r/J1TbthncMFB8NJS8h65/EYt/PxzepSHGZgcXtjmiqJ/LInEukKfFpMWvxANl/Dy7Upv2BGlNNfjY2MnJSLWEKXoQ7PcC7Xqie0VgvCRoiA89PnPXSfNpgovJJLtXSTkElAGmqsrBeSqIiDveow4mS/VK6nyl8Pve99Y/wlO2N0oVyGEQ6nR35F0XbgAPAFfFXF+hO25nYq1gvrP9UT+ebTUZlt459HU6DvIgYqYOcxWgxPpvfv2dvtjNsQ6fGL9pw/nqM0lyKWtShEuHLowCC5sB6d584XEge9+t17yhkkBNknroR9wzxxGzE5iOQbf8I1PStwI3z/x5uKQwsHDj0s5v/GT0lXX3q9cBIRfuAWSvuDwmMNAOkIbvK3MBEZtHdIEsZo0iwXHjtAZt2p3+EZ+ZSmqtta0e181MVuUiXARXs/yCwB3tm5kjegTOIAiynaB4Sl+CbHddUkvWcdexA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(6512007)(26005)(2616005)(53546011)(31686004)(316002)(38100700002)(54906003)(6916009)(6486002)(450100002)(31696002)(86362001)(36756003)(83380400001)(66574015)(6506007)(478600001)(186003)(6666004)(44832011)(5660300002)(30864003)(8936002)(2906002)(8676002)(66476007)(66946007)(41300700001)(4326008)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3BTNHkrbzNJaFlLdUxQb1JYa0pRSUUzVEVsZXNOVDJDcTVTYVRydnNEQU5Y?=
 =?utf-8?B?Nmx3RjgwRmFuQjJvUnNnOTlWdTdrZG56THVSZU9LdTFudGtpMnNlK0Ywdkxy?=
 =?utf-8?B?Qmt4STRoU0JPV3A2M1RpcEkyRmRZdS9BYzYvWHNFS0RXZTM0Y3hCVmxUSkgv?=
 =?utf-8?B?YVZIemQvOEdOTnZDZWpIUjQ0Slh6aEM0VXZMRlphaXRsc2l4dWxaYTRlRWgr?=
 =?utf-8?B?cWNlTzdCZ0Z6ZDJxSCtodk9KUDNidXhwR2J6R2JBYUR2Y25nWmkzUjk0MzA5?=
 =?utf-8?B?RVcyWGpVWTNSRGVNbnFQWldLN3pwR08vbHczc0V1bVdLTURFK2d5MndkalJR?=
 =?utf-8?B?alNpbHlKYzRwQ1BOKzQ3Rkpock9hWlJucHZEcVJYcWRBeXdCTWJFYTJqM1RK?=
 =?utf-8?B?R3dvTnVDWVhxRTNMbmJtbmlXMEU3UHpWNFRhSGR0dm5hU1Q5L0JCTmpIS2sz?=
 =?utf-8?B?YjNCY0phVnNSQzIrbXNnTWdsbkxpN1J2YzVFenJMdDgvQnlvSFpEcEdrUnlD?=
 =?utf-8?B?cVVQSjlWOWd1cTdJbXRhak9saTMvOVBZbFplUlIrWnRlN3VJajhRNzM2N3ZH?=
 =?utf-8?B?Z1pyOHpZWlFkMWtRV3ZLc3lhSHFXRmp4K0x3NWVjRHRHeHFxbVlLUkJ0TVVo?=
 =?utf-8?B?YmovR2paMjJGYkFjNzJ2OHovM015Y01lN0tEeWRWVUVnTC9iQUxtbEtRMzZm?=
 =?utf-8?B?ZmxacDVxMEk5OXczRGRIYnhhUjFwald5YkRlaWRmdW9JclR6cTFzaUdWcTFZ?=
 =?utf-8?B?cmZRb3JobHJLdjlJeGQwNkFZUE5mcVJweDNuWnBMU0EwcHZ0RnUzK2JWd0F2?=
 =?utf-8?B?aEM3NW5MNWFmQVIyM3p4cERpTUJmdzkvclRtK0k2RUFlSjg0NktjdGhqVDFv?=
 =?utf-8?B?ZUNjdS9QV0R6amd4Z2lUd3EydHVWbHlkcnFtSUswMUhiL0gySTBXbzNyUGFG?=
 =?utf-8?B?ODNjWUhmZFIyZEtlVFpacnBmcTNmYVBJUU01TGZOajN5bUN4N0hseGFvRitI?=
 =?utf-8?B?QlhRNFRDd3JPdm1peVQzQkNhbVh6aUhvaXRGZnREcU9iOFZDRE5VR05mYjZX?=
 =?utf-8?B?WHQ1aGFZRmhyNWxod2srV3pQTGZwa3VxNm5TY3o0WWxZU1pIaXVtQm1qdHhC?=
 =?utf-8?B?ZEJMdmJySDBHMlVWMldsck5wdmZOcHY5YUhrL1BUM0Q4YlBYZ2ZiVjNZbmlV?=
 =?utf-8?B?ek9SSGEyRHB0bVZJaFIxZ3NCRGZnTzFpQS8yVVdTcG4rSGhLYjNVMW03NDdx?=
 =?utf-8?B?WGFXQUVya2pGYmlvRjVrSGZXNm4wYWdZS2FkK2NsUk55UGRnZUtsTGo0QnYw?=
 =?utf-8?B?QVExNUlkL1Vnc0gwNnpwRCtZODg5MWN1UStJeUNZa1QvQ3E3YjNjaEdMb21E?=
 =?utf-8?B?TUhlWGlGNk96UW56d0N4STNpWUF3ZjJDOWc5MmwrQjBOcmRHS0J4OTV3S0NC?=
 =?utf-8?B?eWhDTzJTT1liMHdCbThPdnU4S0xyRFBxQXVkY05LYStxMlQ1SUdhV0QvQ2Ux?=
 =?utf-8?B?SENYVDY5cmdRYlFTOEpocEpDMXgxTEp1OXBFMTBWT2JrRnFYZ1hXdlRwY3Nj?=
 =?utf-8?B?OG1vSlRIcHMvOGpCSFlzekVMNGdSQlpWMGN5RjYrWTgzWm9MMGwySGgxMXZj?=
 =?utf-8?B?ZEVjYTNnTFdLU3IwOGh2aXo0dUpwT0xRVmVxVG4xazVHUCtHbHJFYnRqWXdN?=
 =?utf-8?B?OG9TV3FUaFFsSFEyTDRsakxEamsrOTlqQk1vT3I1bUd2S256ZXhtcnZsZjJ1?=
 =?utf-8?B?SGdIL084dElVQWJMcExpM3BYek1OTlBaU2w0L1VSZEtFQ2xzUFo4TlRTcngw?=
 =?utf-8?B?R2Mrdm52MFEyMStCdEo1R0R3VDUzRTBZME9LdkoyYWMzb01qQU9jS2VZZm1O?=
 =?utf-8?B?YkF5cGI2U2NLOFFrNUVTY2pqSVA5b2owNm9ncGNkQ3MrdERPcTJvZXhzOVMv?=
 =?utf-8?B?dVVYcWFNTW8yandVRDFjZ1ZwNXBZTEdhT2VRR3JMMjlxbFBpeHRkTHBxbVZm?=
 =?utf-8?B?ZE5NUnlHSTJKR1NNdFYzRFNJcjM1a1pyMmhNY3R4SDBVYm5KelgwYUd4NEJy?=
 =?utf-8?B?bHpCQ25mS2RXZ1RBTTdjakY4akc0cjBMR0RtckpjQTcydzhkSEhHZGJBSk1W?=
 =?utf-8?Q?tXfHt8TQmF84OYw6rU26G5y3B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de62c36-cb46-4858-aa85-08daa24e6a29
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 19:11:30.2048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8iVrFil70cIgaRnlHxAkah9wSwQNt4piHjtrFYRVf25P9z5Zv0uzaalQ4R6xU/v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5392
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inlined:

On 2022-09-29 14:46, Luben Tuikov wrote:
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> 
> When many entities are competing for the same run queue
> on the same scheduler, we observe an unusually long wait
> times and some jobs get starved. This has been observed on GPUVis.
> 
> The issue is due to the Round Robin policy used by schedulers
> to pick up the next entity's job queue for execution. Under stress
> of many entities and long job queues within entity some
> jobs could be stuck for very long time in it's entity's
> queue before being popped from the queue and executed
> while for other entities with smaller job queues a job
> might execute earlier even though that job arrived later
> then the job in the long queue.
>    
> Fix:
> Add FIFO selection policy to entities in run queue, chose next entity
> on run queue in such order that if job on one entity arrived
> earlier then job on another entity the first job will start
> executing earlier regardless of the length of the entity's job
> queue.
> 
> v2:
> Switch to rb tree structure for entities based on TS of
> oldest job waiting in the job queue of an entity. Improves next
> entity extraction to O(1). Entity TS update
> O(log N) where N is the number of entities in the run-queue
> 
> Drop default option in module control parameter.
> 
> v3:
> Various cosmetical fixes and minor refactoring of fifo update function. (Luben)
> 
> v4:
> Switch drm_sched_rq_select_entity_fifo to in order search (Luben)
> 
> v5: Fix up drm_sched_rq_select_entity_fifo loop (Luben)
> 
> v6: Add missing drm_sched_rq_remove_fifo_locked
> 
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Yunxiang Li (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 26 ++++++-
>  drivers/gpu/drm/scheduler/sched_main.c   | 97 +++++++++++++++++++++++-
>  include/drm/gpu_scheduler.h              | 32 ++++++++
>  3 files changed, 149 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a308..f3ffce3c9304d5 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -73,6 +73,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	entity->priority = priority;
>  	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>  	entity->last_scheduled = NULL;
> +	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
>  	if(num_sched_list)
>  		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> @@ -417,14 +418,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
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
> @@ -443,6 +446,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	smp_wmb();
>  
>  	spsc_queue_pop(&entity->job_queue);
> +
> +	/*
> +	 * It's when head job is extracted we can access the next job (or empty)
> +	 * queue and update the entity location in the min heap accordingly.
> +	 */
> +skip:
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		drm_sched_rq_update_fifo(entity,
> +					 (sched_job ? sched_job->submit_ts : ktime_get()));
> +
>  	return sched_job;
>  }

If there's a next job, you should update the entity's timestamp to that
of the next job. Also you shouldn't have to update the timestamp when there
is no next job. And to be true to the comment above, you should have this here:

-skip:
-       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-               drm_sched_rq_update_fifo(entity,
-                                        (sched_job ? sched_job->submit_ts : ktime_get()));
 
+       if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+               struct drm_sched_job *next;
+
+               next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+               if (next)
+                       drm_sched_rq_update_fifo(entity, next->submit_ts);
+       }
+Out:
        return sched_job;

And then change the "goto skip;" to "goto Out;" in the preceding code.

This way you update the entity's timestamp to that of the next (oldest) job
in the entity's job queue, if there is a next job. You also avoid getting
a timestamp from the kernel.

>  
> @@ -502,11 +515,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
>  	bool first;
> +	ktime_t ts =  ktime_get();

Get rid of this "ts" variable.

>  
>  	trace_drm_sched_job(sched_job, entity);
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ts;

Just assign the result of "ktime_get()" here:

	sched_job->submit_ts = ktime_get();

>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> @@ -518,8 +533,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  			DRM_ERROR("Trying to push to a killed entity\n");
>  			return;
>  		}
> +
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
> +
> +		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +			drm_sched_rq_update_fifo(entity, ts);
> +

And here do this:

	drm_sched_rq_update_fifo(entity, sched_job->submit_ts);

You want to show that you're updating timestamps to that of the newly
submitted job, as opposed to some arbitrary "ts" variable.

Regards,
Luben

>  		drm_sched_wakeup(entity->rq->sched);
>  	}
>  }
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 4f2395d1a79182..a16495f4997410 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,6 +62,56 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entities scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy,
> +		 "specify schedule policy for entities on a runqueue (DRM_SCHED_POLICY_RR = Round Robin (default), DRM_SCHED_POLICY_FIFO  = use FIFO");
> +module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +
> +static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
> +							    const struct rb_node *b)
> +{
> +	struct drm_sched_entity *ent_a =  rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *ent_b =  rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
> +}
> +
> +static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_rq *rq = entity->rq;
> +
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +}
> +
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	spin_lock(&entity->rq_lock);
> +	spin_lock(&entity->rq->lock);
> +
> +	drm_sched_rq_remove_fifo_locked(entity);
> +
> +	entity->oldest_job_waiting = ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
> +		      drm_sched_entity_compare_before);
> +
> +	spin_unlock(&entity->rq->lock);
> +	spin_unlock(&entity->rq_lock);
> +}
> +
>  /**
>   * drm_sched_rq_init - initialize a given run queue struct
>   *
> @@ -75,6 +125,7 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>  {
>  	spin_lock_init(&rq->lock);
>  	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root = RB_ROOT_CACHED;
>  	rq->current_entity = NULL;
>  	rq->sched = sched;
>  }
> @@ -92,9 +143,12 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
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
> @@ -111,23 +165,30 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  {
>  	if (list_empty(&entity->list))
>  		return;
> +
>  	spin_lock(&rq->lock);
> +
>  	atomic_dec(rq->sched->score);
>  	list_del_init(&entity->list);
> +
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
> +
> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		drm_sched_rq_remove_fifo_locked(entity);
> +
>  	spin_unlock(&rq->lock);
>  }
>  
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
> @@ -163,6 +224,34 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>  	return NULL;
>  }
>  
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity, returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +	struct rb_node *rb;
> +
> +	spin_lock(&rq->lock);
> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
> +		struct drm_sched_entity *entity;
> +
> +		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity)) {
> +			rq->current_entity = entity;
> +			reinit_completion(&entity->entity_idle);
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -803,7 +892,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);

No negative checks--it makes the code messy and hard to understand, plus
you use positive checks for that exact condition everywhere else in
this patch. Also, since you're introducing DRM_SCHED_POLICY_FIFO in this
patch, you want to check for exactly that new policy which you're introducing,
like this:

-               entity = drm_sched_policy != DRM_SCHED_POLICY_FIFO ?
-                               drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
-                               drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
+               entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+                       drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
+                       drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);

Regards,
Luben


>  		if (entity)
>  			break;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 599855c6a6727b..1f7d9dd1a44484 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -50,6 +50,12 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> +/* Used to chose between FIFO and RR jobs scheduling */
> +extern int drm_sched_policy;
> +
> +#define DRM_SCHED_POLICY_RR    0
> +#define DRM_SCHED_POLICY_FIFO  1
> +
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
>   * attached to the DRM file_priv).
> @@ -196,6 +202,21 @@ struct drm_sched_entity {
>  	 * drm_sched_entity_fini().
>  	 */
>  	struct completion		entity_idle;
> +
> +	/**
> +	 * @oldest_job_waiting:
> +	 *
> +	 * Marks earliest job waiting in SW queue
> +	 */
> +	ktime_t				oldest_job_waiting;
> +
> +	/**
> +	 * @rb_tree_node:
> +	 *
> +	 * The node used to insert this entity into time based priority queue
> +	 */
> +	struct rb_node			rb_tree_node;
> +
>  };
>  
>  /**
> @@ -205,6 +226,7 @@ struct drm_sched_entity {
>   * @sched: the scheduler to which this rq belongs to.
>   * @entities: list of the entities to be scheduled.
>   * @current_entity: the entity which is to be scheduled.
> + * @rb_tree_root: root of time based priory queue of entities for FIFO scheduling
>   *
>   * Run queue is a set of entities scheduling command submissions for
>   * one specific ring. It implements the scheduling policy that selects
> @@ -215,6 +237,7 @@ struct drm_sched_rq {
>  	struct drm_gpu_scheduler	*sched;
>  	struct list_head		entities;
>  	struct drm_sched_entity		*current_entity;
> +	struct rb_root_cached		rb_tree_root;
>  };
>  
>  /**
> @@ -314,6 +337,13 @@ struct drm_sched_job {
>  
>  	/** @last_dependency: tracks @dependencies as they signal */
>  	unsigned long			last_dependency;
> +
> +	/**
> +	 * @submit_ts:
> +	 *
> +	 * When the job was pushed into the entity queue.
> +	 */
> +	ktime_t                         submit_ts;
>  };
>  
>  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -503,6 +533,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  				struct drm_sched_entity *entity);
>  
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts);
> +
>  int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  enum drm_sched_priority priority,
>  			  struct drm_gpu_scheduler **sched_list,
> 
> base-commit: 2ab69739209c843a47af82c0620036b233c83688
