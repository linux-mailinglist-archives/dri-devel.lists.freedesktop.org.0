Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42DB59E830
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 18:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24B110E4D9;
	Tue, 23 Aug 2022 16:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675B010EFAC;
 Tue, 23 Aug 2022 16:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2cJkE+hw8ew0TmPKyU+aa830Pz7Lqd/tz2eTyWbvyldxMjNf8O87Wlp86v9Q8V7nWg6nUBrGmhbrmXTEYlnnYyXYvRbLooC5Bqv6mw6m3VJje6sN2uup9hXdhs4nf98LlhieIuy+LxpV6dhwBcCtDa0BhttMFy2V+nxD+44v/6OZ+pXv5oZ7qxc79Qr0TriAsCONXKHQmR4gC9bJkNUwW5bNhawfmrCFFuq7QE40amyZPY65rEsbBvxg32Bb1egkZCK2fsheTbc4qhIh09ZpyAg4IV4nFCT+9y7pNTTNng83p38jwxiKn5VIyA1UZdllEWwQ6xgZaxMp0gOiwXBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88FJRepqjKXoME1vIonf876uoolcVDcccRk+yFha9eY=;
 b=QG9QNQTwCMzE2XeUe2RaC0NZDkmoH+Et2YTgUlYi5nInY18ZUmnl4MkAF5LPXbIHlqc2bm2lpinZ50AWhvqrcBMaVKePpafGyyPadjOfRdBPSmynF3K0Q36OOQ+I2QVDeQ/FK/thxG5J7Jw4sH9lpzh7tuODTHdXKY6vvwKYlPz9gBqIpAmYFjMuH5qETyOzdw56p1gzLJY4AkL52qpdkmt2UISb40k01D17zl7TAJzlqEgDLN8mJkM13vjS6lLzdGaQ7lh0HHthwFbiYEjao9509i57n+u0jrqIx5iQIWcx8XI+4VUAyWj0SV6eFrkbdgOrsStkEX183P8yKu1jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88FJRepqjKXoME1vIonf876uoolcVDcccRk+yFha9eY=;
 b=nzPkJ9HUoDNCFmk/bmK96fen1jQ8I7CdlOl8BWrm69xIBmwXl6PSfCN7gbOV0xgirJNzSYVQKmE9MKZCpCcGrg4Zg4YGAHFmcLsq0ro332cPACe3lQw+io4a6VrWUABzAD/VLCTcXU9C+Rl44Y+sGer0VlwPYBkId+6iF5hal2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Tue, 23 Aug
 2022 16:58:52 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::845b:3332:e2df:8286%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 16:58:52 +0000
Message-ID: <d5c45e7a-257b-7c60-33b5-7c103b0b1f93@amd.com>
Date: Tue, 23 Aug 2022 12:58:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/sced: Add FIFO policy for scheduler rq
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20220822200917.440681-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d05bf4-0478-4acd-35e4-08da8528c1ca
X-MS-TrafficTypeDiagnostic: LV2PR12MB5871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHSf1PCvKSzICQioVt7l56CL732+Yn1gOYc/XKEbpCQFTLux3pHLzFlYrqSRaCjFY12AAAxVXV4MzkWZeHeTs2wETiwL4m/c//xO9lnDWWN1IyCAGLixa3Nt7mYumasSanmx/FA/tvdEjHfrq8UHLJs9sQxNg1bWoFvgQ0KtgkfxUSnFXSGlY6tNlnF0ce6rAcylwXNEJRRcYuf0beiGR7cgC5S7g3SUFwMtnCuGjjsddMlz1l0tJiROYLZmvUW/PKEtiBw/yHbJJw05QizeBeM3gxVMYJE7CZ269igtlty0ioSpVJH+7M8WCqS57nZPOn/uEHappBG2BxsYAYxJ071Bcthzho1jZyXZQ8tTGJMTFZItEqA2VIrp/H0PZCJGs56OmZ2u9Dgm4WEMELL4hQ+Ptw/2eJJdx9Hh4HcKKgZ5KFsHfNHFgXnehQmMG2iWUBo1GRdkeuzLCK/D5BcSGd0S5bKXW3fJZx/RJEjXegeqX5rQDZ0Vo3H0RiY5c2whJLp/okF+Wi37WynyPCBWR/OMT2kAooCpjXEUNd68n78T4ppGwomAcfvQL7iCLIgUQBwWSj4wyb85HF3gdnW7h/n2Yrdq2oNLweT9j1qAYLXYAv3XTbqu18OXQSGyi/KxB+3Vm9sKaQpv/pdE/APnGNjQGQ/xOij+ftJqoIluwadU2U+34VbJYCMrtq8x6D0oYo5PQgbZXS3gMA4QDFNbtWNGG4wB2Ssse/K2OojRjR+0AHVga2I2Ft8B56a+rzOTFLZdzmcuHFGpeI/c36a5MDIL5vpi+P+cdNcpgtY1AXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(41300700001)(8936002)(5660300002)(478600001)(6486002)(31696002)(2906002)(53546011)(44832011)(6506007)(26005)(6512007)(6666004)(86362001)(38100700002)(186003)(2616005)(83380400001)(31686004)(316002)(4326008)(66946007)(8676002)(66556008)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wnp2eE9TVk81NXFJMXpMcFk0SlAwNnlvR3d6cHhQMlJ1SEFDbWtQMGlEbURw?=
 =?utf-8?B?TDFkNjhWRUhXdnFmWW9EenBFWmZORk5MNXplanJaZytwcDVMbkFzS1NlS0FG?=
 =?utf-8?B?c3dZRFFVdWxyZFRlTGRmS0hvWlpqR050UkpaTlVudlp3NXkrMmFydEQ5NTdD?=
 =?utf-8?B?UHFjb1JXaTBIcmIxR0o0NVVnNCsrb0lPUG43Sm4yZzdFdm5MTXh3d1RlVzB3?=
 =?utf-8?B?bFpESkh5UWRKQTlrR21IbVkvaUVjMkY3bEZBTStrL01xUkw1REVyaXdHTkJt?=
 =?utf-8?B?UW1VSCtUVFIvNnMwRi84MjJhNGt6ekY3Mm44M0lobkZmQk4rWlhGamo5WVVw?=
 =?utf-8?B?ZmZzKzk4d3FES2ErNk1QelE5cS9qUkRzWW1PWnF4K3p4VThDdjh6K0FxQ0Zx?=
 =?utf-8?B?UUcwNUc4UW1KUDhDb1k2NUxqRi9OQmZ1cFI4dVVxODdOUG1oZ0RSZk9tSGxD?=
 =?utf-8?B?ZjZuVnpKWVBuNEZ1SVJsQVBtVkRyWi9EVTdpMThuVTcwQ01BcFBLRWdxeFBn?=
 =?utf-8?B?OTdaZlRId1F5WnJmcjNaUHFYWHF4WnMzVDlrc0I2R20vcTlJdis3N0crdVBJ?=
 =?utf-8?B?UTVFN3ZZelNOSkRrakxWYUlmY0tRQ2xCdElhMGNZOHp5WDlud1VLRFpkREFT?=
 =?utf-8?B?QjJJUDFSVi85aW5GVWRtdlNib1RBcC9ueDJ4Zjcxd2ZDYkFkYkI3cTNBYTFi?=
 =?utf-8?B?Y0tRRWV4bUJaRDdIeWZvVWlxTmRoKzI1Nyt2Q3IrQ3lLc2Y0NnhJMnoxVmR2?=
 =?utf-8?B?WC8xeGpLdmU4QU9KRUV5YVJubEkyTTQrSWcwRURVT0lSWXYyNG5kM25lYXB0?=
 =?utf-8?B?R1dEWVM3TXRoZ1c2dGo4ckc2NEJJaVpKNVhKNUZXQ29KQ1FzRXc1VU11NzhE?=
 =?utf-8?B?TXF0dUx2VHVnVjZHa3Zjdmd0SUx1eDdWbzNEcnNtOUNwaDVRbDNDK3I3SU9D?=
 =?utf-8?B?TW52R1I4TmFkVGQxWXFmTm9YNUE5Z1lCenZwLzhGc0Nvd3hMdjdRdC9zMnVu?=
 =?utf-8?B?VUV5MWp6dm9WQk55SDhydUh4TDUzNWZEYmIyeFM0Y0Q1V3BONnNYc0xoMnVL?=
 =?utf-8?B?NEFVczhoUjNJdTRsUjltSzh1V0tUL0E4MDMwY1RhR3VvUWhQMzc5b0x5eHRN?=
 =?utf-8?B?N1k1SlFMcHpiMHRFMHE1KytDYTF3S0dYU2hCMyt6T1YrSG81VW15TE1XUWto?=
 =?utf-8?B?c3k2NlUzRHZmVnU3ZDZ4dWk0bnpvSVFEeHdSc0doSUwxSkxQVnJ4V09Ub0F4?=
 =?utf-8?B?aGY4Q0JYZ2xjYmNzWWh6YSsrL2NNOUxkQzZ1Vjk4ck45SVZVS3JMQ2pMeWdv?=
 =?utf-8?B?SVVPOGZkanR3d0pWN2oyL09XcE8wSis3clkxQjNPa1NpaFEzMHN3RDFJMTc3?=
 =?utf-8?B?dmNaWTV6Vk5VTFV0UDArT28rQXhjMzl4Slo3V3B3N0tYT256L0FXQVNrRXhv?=
 =?utf-8?B?Y2JaN1lLQzV1c05xR0JCci9JMHJxS2dvOU9GenFnQmhnbWNUT0Z0TEgrY25J?=
 =?utf-8?B?UDNTTXVsNFpiVnU3VnNFNEEwcHFtSDlRa1Q5Y3JudldSVmpueEhBOVVoQUw3?=
 =?utf-8?B?OVZJb2RiMCtsV0dXdTB1VmdCU1grbHBmVlN2TzkzbzExbTdYdU9qQ01wUHNj?=
 =?utf-8?B?UVJ5TjljemtkVnlQMkIvQ2VGbzZLS2VkT1lCT3hEdzQxbjBqY1pLM1V4amxh?=
 =?utf-8?B?OFNRS1dsWXd3VkZNMkVYSUdwamxVQ1RlbDNNK0ZVYTB1bmNTNkNUM0VlMnhl?=
 =?utf-8?B?bWI4K05NYmZLNFIrRER0RHNOZjdoeWtoanZzZWRCeTJIRlRLYjhVWWdPQnhK?=
 =?utf-8?B?enZKazg5ZzBueS9SQk1MNXlEVUpLZGt0dURweEo0TzgzQkpZZmFpN0VJRUhp?=
 =?utf-8?B?V2ZHU1hzcUk2NDFLV2hXa3krZEFmSktxaGxLY3h6Q1Y4bjkzNmpWbE05OWtj?=
 =?utf-8?B?cU9Vb0lPdjhuL0JPVkh2SjkzV1hRWnZhSktuNjJDanFxUDZPVTJQZ3lKaXlF?=
 =?utf-8?B?SldYcm1SSXlHM2Jmb2pjTXdYWloyZVdsY0t4WGZycEJOVXErYzNhczFmd2Rq?=
 =?utf-8?B?aFFLTTdLYU41YWhpL2xyajMwb3FHQ2lSSUFtd2s4NlVHOWFHbmFYbzU3amZv?=
 =?utf-8?Q?mLsVHbeuUIrilQW4UPjtehfVS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d05bf4-0478-4acd-35e4-08da8528c1ca
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 16:58:52.4037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM63BUrufsoiMDww21cWckBKRwjATSWA2yAyUxyaf4s4RfO6b6h33nEFemObR4Z0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871
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

Inlined:

On 2022-08-22 16:09, Andrey Grodzovsky wrote:
> Poblem: Given many entities competing for same rq on
^Problem

> same scheduler an uncceptabliy long wait time for some
^unacceptably

> jobs waiting stuck in rq before being picked up are
> observed (seen using  GPUVis).
> The issue is due to Round Robin policy used by scheduler
> to pick up the next entity for execution. Under stress
> of many entities and long job queus within entity some
^queues

> jobs could be stack for very long time in it's entity's
> queue before being popped from the queue and executed
> while for other entites with samller job queues a job
^entities; smaller

> might execute ealier even though that job arrived later
^earlier

> then the job in the long queue.
> 
> Fix:
> Add FIFO selection policy to entites in RQ, chose next enitity
> on rq in such order that if job on one entity arrived
> ealrier then job on another entity the first job will start
> executing ealier regardless of the length of the entity's job
> queue.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c |  2 +
>  drivers/gpu/drm/scheduler/sched_main.c   | 65 ++++++++++++++++++++++--
>  include/drm/gpu_scheduler.h              |  8 +++
>  3 files changed, 71 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 6b25b2f4f5a3..3bb7f69306ef 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -507,6 +507,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
>  	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> +	sched_job->submit_ts = ktime_get();
> +
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 68317d3a7a27..c123aa120d06 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -59,6 +59,19 @@
>  #define CREATE_TRACE_POINTS
>  #include "gpu_scheduler_trace.h"
>  
> +
> +
> +int drm_sched_policy = -1;
> +
> +/**
> + * DOC: sched_policy (int)
> + * Used to override default entites scheduling policy in a run queue.
> + */
> +MODULE_PARM_DESC(sched_policy,
> +		"specify schedule policy for entites on a runqueue (-1 = auto(default) value, 0 = Round Robin,1  = use FIFO");
> +module_param_named(sched_policy, drm_sched_policy, int, 0444);

As per Christian's comments, you can drop the "auto" and perhaps leave one as the default,
say the RR.

I do think it is beneficial to have a module parameter control the scheduling policy, as shown above.

> +
> +
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> @@ -120,14 +133,16 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  }
>  
>  /**
> - * drm_sched_rq_select_entity - Select an entity which could provide a job to run
> + * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>   *
>   * @rq: scheduler run queue to check.
>   *
> - * Try to find a ready entity, returns NULL if none found.
> + * Try to find a ready entity, in round robin manner.
> + *
> + * Returns NULL if none found.
>   */
>  static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
>  {
>  	struct drm_sched_entity *entity;
>  
> @@ -163,6 +178,45 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>  	return NULL;
>  }
>  
> +/**
> + * drm_sched_rq_select_entity_fifo - Select an entity which could provide a job to run
> + *
> + * @rq: scheduler run queue to check.
> + *
> + * Try to find a ready entity, based on FIFO order of jobs arrivals.
> + *
> + * Returns NULL if none found.
> + */
> +static struct drm_sched_entity *
> +drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
> +{
> +	struct drm_sched_entity *tmp, *entity = NULL;
> +	ktime_t oldest_ts = KTIME_MAX;
> +	struct drm_sched_job *sched_job;
> +
> +	spin_lock(&rq->lock);
> +
> +	list_for_each_entry(tmp, &rq->entities, list) {
> +
> +		if (drm_sched_entity_is_ready(tmp)) {
> +			sched_job = to_drm_sched_job(spsc_queue_peek(&tmp->job_queue));
> +
> +			if (ktime_before(sched_job->submit_ts, oldest_ts)) {
> +				oldest_ts = sched_job->submit_ts;
> +				entity = tmp;
> +			}
> +		}
> +	}

Here I think we need an O(1) lookup of the next job to pick out to run.
I see a number of optimizations, for instance keeping the current/oldest
timestamp in the rq struct itself, or better yet keeping the next job
to pick out to run at a head of list (a la timer wheel implementation).
For suck an optimization to work, you'd prep things up on job insertion, rather
than on job removal/pick to run.

I'm also surprised that there is no job transition from one queue to another,
as it is picked to run next--for the above optimizations to implemented, you'd
want a state transition from (state) queue to queue.

Regards,
Luben

> +
> +	if (entity) {
> +		rq->current_entity = entity;
> +		reinit_completion(&entity->entity_idle);
> +	}
> +
> +	spin_unlock(&rq->lock);
> +	return entity;
> +}
> +
>  /**
>   * drm_sched_job_done - complete a job
>   * @s_job: pointer to the job which is done
> @@ -804,7 +858,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_rq_select_entity(&sched->sched_rq[i]);
> +		entity = drm_sched_policy != 1 ?
> +				drm_sched_rq_select_entity_rr(&sched->sched_rq[i]) :
> +				drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]);
> +
>  		if (entity)
>  			break;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..95865881bfcf 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -314,6 +314,14 @@ struct drm_sched_job {
>  
>  	/** @last_dependency: tracks @dependencies as they signal */
>  	unsigned long			last_dependency;
> +
> +       /**
> +	* @submit_ts:
> +	*
> +	* Marks job submit time
> +	*/
> +       ktime_t				submit_ts;
> +
>  };
>  
>  static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
