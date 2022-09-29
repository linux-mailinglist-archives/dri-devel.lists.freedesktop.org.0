Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA85EFDCF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 21:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4353F10EC60;
	Thu, 29 Sep 2022 19:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7510EC60
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 19:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUNKM7Iq6Tkei/udKi19h7U+zfyvPCRbf1DjEW/ZeCHvkQk3Nxgo6k/thiuakBT9duWq4n3cwZxqFNKKzoYrm+KqeCYFxYsmrkx2MV6rNlp02pl5DvGqR7D5IMj4F+rn0JGVN3DPvkETorTsHAaUeSTkFL/E6gOwjRdlrW/arjQm/5y4QVuPAdMZGBS0XkkPQs0hxInN1Q2KC2fds43RZNG+oo6F9DDNxk3c1jwtKphdE+mpb3HhyFfcDqU5W5ZW6sLVC1SK1Zxipo660HymvcgVJ8EQm4wjeclGHNKQXi2jpQyGTiZrvPcJUJhecsVden5kCJ+/CweBLJaCXXK9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZOuuu2b0qYpyj8T8Q9YdUh1VJxXKGGkVctlSNgIaS4=;
 b=UHoHEzhX7h21GHshRJW2NLaM3aaR+GG8JEKs/10H708b4YMcFrilVSWAIvfbukY8b8fFpVG8VIbPbdqqKaf+/LjwsJJ7jqZpOkGrDU+OKk5LwAAKF1iwoj6ia4RHWqFX21eWATyid4Ep2xgm9w66e+IwPFNUjwoFXJgg2f5hD5bpisP+uigNon2qc3zSRMzw7TnG92LZoJV2Pb94/eLi1TxAHyQAgcpLtppK2NtPvn41AfuzDhFnpo1wsKHZLz49qM1T/beKxWKXZuolqgcPJyORgShiofNb/QYcxgpCXVOBsdM9ahOx+BN2wUbLkcxOr8D/lNqXI1Af8cSxFfpmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZOuuu2b0qYpyj8T8Q9YdUh1VJxXKGGkVctlSNgIaS4=;
 b=qdS6ouZ3aWaY51kejSVzGyez6M8Jtv+A5xO8oAi3eEjWuOBiAy5AxByca2Pl8ZFGK1fnkoYW2Wkr8Qm5ABmRQAPnxkB/Fh9H+RZFNh7+NGZhLS6M3zQGCQYf3tzXemjZNJQJTryy0tpBo2lqUOinv1pL63vvryT71V06cek59+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN9PR12MB5289.namprd12.prod.outlook.com (2603:10b6:408:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 19:20:20 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5c7:e934:c098:f2ac%8]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 19:20:20 +0000
Message-ID: <85442771-b3f0-3079-4356-f92d91dfb4df@amd.com>
Date: Thu, 29 Sep 2022 15:20:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220929132136.1715-1-christian.koenig@amd.com>
 <20220929132136.1715-12-christian.koenig@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220929132136.1715-12-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::7) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|BN9PR12MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddf0c93-ad2d-41c4-6130-08daa24fa5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9gxgPWfyRmw6UyuP0eYasoMDFptk1Y/pU/ATQq/37ipLojofJzP2WBnqIkHE6D7xhrrz9hPTqiypw7foR/9M9Fhkl2Decdb7qn7rbIBOITqQa6ySubiANlqDH+d3YybVfyM8Hv8XVco0ZVWZKyZRUWBK7nMJ3XSNtbrCZIQfI3kwYVgGcn41bqPMxZEnBgV/XIT0ElnRIVTsQnWSq9ldLJJHWtZbMNKnic+n6QcVPdRYvS1nB/n0sNJr96qsplFe3LBKfMMYzvOUEBQzkJbBv7zrdJo56ySZ/Zo1jrENVBPOBLuQ6n53qwYvQI0RZrnhZpiPC6nWH01Yhw3Tir3p1elRXXs3LuDmuOb3AwCoMr0TO5f+t/4nq8scYhQwwK/vlOJOllaVcXn3q/Ve3cTM9UjHtbO3WX3QdVBvK+FouylUsXcnAU273qPOxWAjsyCNO80+bxq0cc5OwECQHuyPSFGoiXEWJovzp7wKOoLQEofTy1FLBTEdZ0vBKDl1dk3CP4yTNWv3YoxbZZpDMIgFRE1xwcbMdNP9OI/SVKufBOkGVwcD7HvgCaQuaL/WRIowkPr/4kpc4aFMAYNiTOCIPggJYs7z8suKY7d5IFpHjmTxIinFpB6AdQBQ0LXw4luYBkjp44NxeuBLZ1UxvzKOagSlPqDtGF6lTtlmipATMYhUGYUE2jfqw3UsAEEP8qzz71Sgtfp/yXd7NTHCHRh6ahpUQvkrw9eMImGjj1Iv/kz/ycfqS4RFvyzOIZNrd/9lXtkj7rmWgAd5nilYlTQ0GcLPWnoOtXL7w6MkmfbV/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(31686004)(44832011)(2906002)(6512007)(5660300002)(186003)(86362001)(8936002)(83380400001)(38100700002)(53546011)(66574015)(2616005)(31696002)(41300700001)(6506007)(36756003)(8676002)(66946007)(66556008)(6666004)(4326008)(66476007)(316002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDY2WEZlYXFuZ3NoNzNUUG5oMVBRRmVldE5MbTFROHZrRkI5NVBGWFQ5cnJi?=
 =?utf-8?B?NmR2bUlLa3lqOW04Qk5HOSt3Z3hMeEJDNitqK0YrNm1qQXcwd3lVZXIvS1pH?=
 =?utf-8?B?czI2S1QxeVUxYWJNQkNHQlllQ2VHb1dnaklUbWdwNDA2NHBQS0NXNHhYV3la?=
 =?utf-8?B?Y3ErNnhBc2JNc2VSSEJZSFF3MTgrZGttZjVvaHpSUDhKOG80SlVuWUM3UWsv?=
 =?utf-8?B?SGFjdVpzZ3EzUHNsYkY3M1BQWS9sMFJ3VFNiZFE1Y2FmNElzYWV0RTlkbXVF?=
 =?utf-8?B?NVBNMXhDR2tRNkZEcDF3VzhOMVhRdkx0QzNhYjRzTjNQMENmYlVyTno5RWMr?=
 =?utf-8?B?T2ZNMzIzYkJESEFEdVA5Y3o3SWNmcURHSmRVcnVXUmV2bXlHaTFzcUsyVXBD?=
 =?utf-8?B?UndLNFZtbXl5YkpZczYrNmI2WnZETmFmYlJUU2lFNm5QREtGbG9tVVFXQjho?=
 =?utf-8?B?UnhrZ21yWFMrQy8va2VKUlVYdG1HRStkakhxTy9sekNWaXJjQ2tCNGl3aVI3?=
 =?utf-8?B?M2cxNUlBMWpGVmJjbG9aMHBXODFRZlN3c3ZkU2Zld0JaazFDQ1JPVWpoY1ZK?=
 =?utf-8?B?dDVITVVkQU1jb2o4MGQyMGdEVEg2VzZJcXE1dWhHSnkxeGRQd3g0L204RGdv?=
 =?utf-8?B?MDNDS2dCUnVBdllTRS9PYzFBVDBPZ3E5cDUyQ1RKbXc5amFMZTViNkNjTGwz?=
 =?utf-8?B?dE94SHp6eDZqNEJNYWdPeVRCYnNuUTlMZHRBdzNZSzZ1SVFkbUdGUGZnZnlG?=
 =?utf-8?B?Wk5iT2hYbkhhZEx4bUZzUGVkOWN2Ty9Oc2xJWHptVHBNQmRodm9jNGhZOFhV?=
 =?utf-8?B?bGg4SCtEMUplQnJkcDRzbHBxZERNazR6MWFrRllNQTF6UWhJVTViYVMyR0Ew?=
 =?utf-8?B?VHEreEE4K00wa2tjT2lyWDgyM21xb29LaXA0bWxoa0JEbUdzN1I1eGt2VFNm?=
 =?utf-8?B?NTJlMnBiNlc0L0VodWxhbFFZT2V1NVVLRWNNTnhPajRTYlhWUVpmUjdka2I4?=
 =?utf-8?B?Vmx2Q2J0Q25Cckp3ZnVmZnIydU5zcGQ3QksrdTJoaXBjakNST1NJamdrSi9X?=
 =?utf-8?B?cytvd1VaZGtSdmxpcEVEUTlsRC9hS1BmZ3dHMlR3VDNkZFB2OGVsMW53Z1Aw?=
 =?utf-8?B?SmxtRTVKQUMxVUVaSWxOWWRsRkI3dERhNHg1Wmo4ZEVINTlKUUlIblRxb2JE?=
 =?utf-8?B?TEFoSVlPTlF5VG50THFzUDVKUWZQditMa0M0WUM5SjRLVFcybEc3OHI0NFF5?=
 =?utf-8?B?VkdIZWJ2OGF6MSt1MUw2RWFCK0tsaWluSkFBaUtRS1hwSml3Y2pIUk9malZY?=
 =?utf-8?B?Wm05UzJoUEduYk1zYU1Md2RoRHhYbTIybThNUXQzSitMN05ackpYbUw5a25S?=
 =?utf-8?B?b0dKVVlIN2poRmEwQTFBTFc0N3RHSTV6VHV3L3RHcGY3eGNPMENDTWFqT3JI?=
 =?utf-8?B?VFpNem5nZFpaeFNkMHovOGFKQXRQMHRtWGpmeUNYVW1sdE56TFBzNkJ0UHYr?=
 =?utf-8?B?Zzd4TnVjOWc4bGMvazFFTU1STjR4ekpDU2V6cEV1OWN3dWx2R2RkQlBqeFZu?=
 =?utf-8?B?UjZPNTV3dkVRM2pKK0V6MzBEdFVBMTltUUFaclMraTFrMlRDTTJndkZ6WnVv?=
 =?utf-8?B?Q3BIcG1NZmMrMlZjbEVlSE92NGdqdXp2SGczWjl5dDg5dG9YcytJV29UYTgr?=
 =?utf-8?B?Q2ZwSDZadW4zLythVVhjNDZwbGd6WFFxeTFlejZwQkdSZGgvWVNtMTVFV2xw?=
 =?utf-8?B?ZW9keUtEZ08zN0U5c3hnM0p6cW16cVhGK3BNczYyb0dZRUZRdUdhTnZpU3hW?=
 =?utf-8?B?dmhxUXZRVU8vMVU3S0xmbERmeUZoZGxFVzh2Ty9YbWZLcHpPWlM4R29mZmpB?=
 =?utf-8?B?MHo2bHd1ekZkbXRvbndBUVZQbXdSdWROUFBETmVoQ3VnZkVyOVNhTlltNUJQ?=
 =?utf-8?B?d3RyZDBkdGI4UzNwdVVXV2d1a1Z0Ukw3QmNHbnhTMDZlcCtHUnFLRzJ1NzJ6?=
 =?utf-8?B?WWRFektSclRvdjAwVU8yd1ovZEVSaXU0bWE3N1d5VTFVVWF1TkdEOVI1Qk41?=
 =?utf-8?B?VXBxcFdCaE16VUxZeDVXZnVGN0tNMkZGaW1kRCtjTXZzcXlPSlVjWFZSdUhL?=
 =?utf-8?B?M2RXM2duUDdsbWNKbUU1c05mYnRDOWVaVjNyMnNrYTNNVFVxS1p1K0JFSVpm?=
 =?utf-8?Q?3btN48U/fA7Z7tyt93ZP+ZjRChwX+u+lUDCwTBWkiYRB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddf0c93-ad2d-41c4-6130-08daa24fa5ff
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 19:20:19.8845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/5OaTlh3dbwmOCJoPEgbjpZ1OZFYs4+SOti8xtFBhSsun3IkAhbapcQs95qKH/1P9AM2A2tDavliioUAQDK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5289
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
Cc: luben.tuikov@amd.com, shansheng.wang@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-29 09:21, Christian König wrote:
> This was buggy because when we had to wait for entities which were
> killed as well we would just deadlock.
>
> Instead move all the dependency handling into the callbacks so that
> will all happen asynchronously.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 197 +++++++++++------------
>   1 file changed, 92 insertions(+), 105 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 1bb1437a8fed..1d448e376811 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -139,6 +139,74 @@ bool drm_sched_entity_is_ready(struct drm_sched_entity *entity)
>   	return true;
>   }
>   
> +static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
> +{
> +	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
> +
> +	drm_sched_fence_scheduled(job->s_fence);
> +	drm_sched_fence_finished(job->s_fence);
> +	WARN_ON(job->s_fence->parent);
> +	job->sched->ops->free_job(job);
> +}
> +
> +/* Signal the scheduler finished fence when the entity in question is killed. */
> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> +					  struct dma_fence_cb *cb)
> +{
> +	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> +						 finish_cb);
> +	int r;
> +
> +	dma_fence_put(f);
> +
> +	/* Wait for all dependencies to avoid data corruptions */
> +	while (!xa_empty(&job->dependencies)) {
> +		f = xa_erase(&job->dependencies, job->last_dependency++);
> +		r = dma_fence_add_callback(f, &job->finish_cb,
> +					   drm_sched_entity_kill_jobs_cb);
> +		if (!r)
> +			return;
> +
> +		dma_fence_put(f);
> +	}
> +
> +	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
> +	irq_work_queue(&job->work);
> +}
> +
> +/* Remove the entity from the scheduler and kill all pending jobs */
> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *job;
> +	struct dma_fence *prev;
> +
> +	if (!entity->rq)
> +		return;
> +
> +	spin_lock(&entity->rq_lock);
> +	entity->stopped = true;
> +	drm_sched_rq_remove_entity(entity->rq, entity);
> +	spin_unlock(&entity->rq_lock);
> +
> +	/* Make sure this entity is not used by the scheduler at the moment */
> +	wait_for_completion(&entity->entity_idle);


Does it really stop processing in case more jobs are pending in entity 
queue already ?
It probably makes sense to integrate drm_sched_entity_is_idle into 
drm_sched_entity_is_ready
to prevent rq selecting this  entity  in such case

> +
> +	prev = dma_fence_get(entity->last_scheduled);
> +	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
> +		struct drm_sched_fence *s_fence = job->s_fence;
> +
> +		dma_fence_set_error(&s_fence->finished, -ESRCH);
> +
> +		dma_fence_get(&s_fence->finished);
> +		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
> +					   drm_sched_entity_kill_jobs_cb))
> +			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
> +
> +		prev = &s_fence->finished;
> +	}
> +	dma_fence_put(prev);
> +}
> +
>   /**
>    * drm_sched_entity_flush - Flush a context entity
>    *
> @@ -179,91 +247,13 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>   	/* For killed process disable any more IBs enqueue right now */
>   	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>   	if ((!last_user || last_user == current->group_leader) &&
> -	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL)) {
> -		spin_lock(&entity->rq_lock);
> -		entity->stopped = true;
> -		drm_sched_rq_remove_entity(entity->rq, entity);
> -		spin_unlock(&entity->rq_lock);
> -	}
> +	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
> +		drm_sched_entity_kill(entity);


This reverts 'drm/scheduler: only kill entity if last user is killed v2' 
and so might break this use case - when entity
gets through FD into child process. Why this needs to be removed ?

Andrey


>   
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_sched_entity_flush);
>   
> -static void drm_sched_entity_kill_jobs_irq_work(struct irq_work *wrk)
> -{
> -	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
> -
> -	drm_sched_fence_finished(job->s_fence);
> -	WARN_ON(job->s_fence->parent);
> -	job->sched->ops->free_job(job);
> -}
> -
> -
> -/* Signal the scheduler finished fence when the entity in question is killed. */
> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> -					  struct dma_fence_cb *cb)
> -{
> -	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
> -						 finish_cb);
> -
> -	dma_fence_put(f);
> -	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
> -	irq_work_queue(&job->work);
> -}
> -
> -static struct dma_fence *
> -drm_sched_job_dependency(struct drm_sched_job *job,
> -			 struct drm_sched_entity *entity)
> -{
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> -
> -	if (job->sched->ops->dependency)
> -		return job->sched->ops->dependency(job, entity);
> -
> -	return NULL;
> -}
> -
> -static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *job;
> -	struct dma_fence *f;
> -	int r;
> -
> -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
> -		struct drm_sched_fence *s_fence = job->s_fence;
> -
> -		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = drm_sched_job_dependency(job, entity))) {
> -			dma_fence_wait(f, false);
> -			dma_fence_put(f);
> -		}
> -
> -		drm_sched_fence_scheduled(s_fence);
> -		dma_fence_set_error(&s_fence->finished, -ESRCH);
> -
> -		/*
> -		 * When pipe is hanged by older entity, new entity might
> -		 * not even have chance to submit it's first job to HW
> -		 * and so entity->last_scheduled will remain NULL
> -		 */
> -		if (!entity->last_scheduled) {
> -			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
> -			continue;
> -		}
> -
> -		dma_fence_get(entity->last_scheduled);
> -		r = dma_fence_add_callback(entity->last_scheduled,
> -					   &job->finish_cb,
> -					   drm_sched_entity_kill_jobs_cb);
> -		if (r == -ENOENT)
> -			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
> -		else if (r)
> -			DRM_ERROR("fence add callback failed (%d)\n", r);
> -	}
> -}
> -
>   /**
>    * drm_sched_entity_fini - Destroy a context entity
>    *
> @@ -277,33 +267,17 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>    */
>   void drm_sched_entity_fini(struct drm_sched_entity *entity)
>   {
> -	struct drm_gpu_scheduler *sched = NULL;
> -
> -	if (entity->rq) {
> -		sched = entity->rq->sched;
> -		drm_sched_rq_remove_entity(entity->rq, entity);
> -	}
> -
> -	/* Consumption of existing IBs wasn't completed. Forcefully
> -	 * remove them here.
> +	/*
> +	 * If consumption of existing IBs wasn't completed. Forcefully remove
> +	 * them here. Also makes sure that the scheduler won't touch this entity
> +	 * any more.
>   	 */
> -	if (spsc_queue_count(&entity->job_queue)) {
> -		if (sched) {
> -			/*
> -			 * Wait for thread to idle to make sure it isn't processing
> -			 * this entity.
> -			 */
> -			wait_for_completion(&entity->entity_idle);
> -
> -		}
> -		if (entity->dependency) {
> -			dma_fence_remove_callback(entity->dependency,
> -						  &entity->cb);
> -			dma_fence_put(entity->dependency);
> -			entity->dependency = NULL;
> -		}
> +	drm_sched_entity_kill(entity);
>   
> -		drm_sched_entity_kill_jobs(entity);
> +	if (entity->dependency) {
> +		dma_fence_remove_callback(entity->dependency, &entity->cb);
> +		dma_fence_put(entity->dependency);
> +		entity->dependency = NULL;
>   	}
>   
>   	dma_fence_put(entity->last_scheduled);
> @@ -415,6 +389,19 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   	return false;
>   }
>   
> +static struct dma_fence *
> +drm_sched_job_dependency(struct drm_sched_job *job,
> +			 struct drm_sched_entity *entity)
> +{
> +	if (!xa_empty(&job->dependencies))
> +		return xa_erase(&job->dependencies, job->last_dependency++);
> +
> +	if (job->sched->ops->dependency)
> +		return job->sched->ops->dependency(job, entity);
> +
> +	return NULL;
> +}
> +
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
>   	struct drm_sched_job *sched_job;
