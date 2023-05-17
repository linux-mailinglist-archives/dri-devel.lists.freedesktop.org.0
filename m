Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1441270767B
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 01:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD0710E306;
	Wed, 17 May 2023 23:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6503410E2FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 23:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrGOcdnX6mZgPCm81Ue4pFNwAZ1if0Uq5x+t7HedtdIFPveeQC96KnC3fR3HFdf1OAaoTQFvhJOpDbIOaoU5cGeVnS76absKOgwSQCwrVBNntnAw9lJR9iO+zEEZb+bhzjq17LNwX6zMfiCzh2eHR2+KK8oVI0mgRXRAXfWPskMz+XqoZeiMTC9IeVz2zQ1YlwhPt9/TpAdZzjbzPBbwymFyfGj38H1oCVk2uqjLWUlns+qpKy/OjxlpXpKBuovcsWYPWjXlagR80hWMCdX8pGtSGLTClip8iIIzOXqs5tZzRpRLqUYNWy9p70eIM/+f1Ret2lBCCKca2ju0dvhkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWr5xEnxVsnc3PME8NdiKkABE1q+hQOMn120NFCzqcM=;
 b=bV1txzhIMCOdBzCUq/lRMmd8lqIaGynqlpWeIqBhreInMxb/IHFbMjKYnUYCkdSTqCPsdCsoBABlizqdK1Y/i5I/Vopq+HgxrqcpVikeZOqir8upn0VXaYB/aC2gxmV6axBBUUk7d9aUL5/8tAYDuQoIFpiw20EzHyM3IroePXLKfs6XEYz/OZI+yIaD2sC3B3cOYEEBP2MkDv2iqnG4IvuVNMTYSEQejHOBjm+ccgkAmXZOEYf0A6R3d/0UP6Tm8gF4P1vsjin/lx+9pX8iku/t19nHgZjkm8ZsHkpruzuQDmAnr8siL2eoZzueMXYX/8K2ZU8wHFdQq4JmaMhqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWr5xEnxVsnc3PME8NdiKkABE1q+hQOMn120NFCzqcM=;
 b=LIivFRuz4VLzSuq9TnGyaN0T+2bwXS2i/NUB/UIWRNdfp2Avvuf8AU7xuD8liYutPtB+XR9YKrcKTwCyntN86KghqLXYxc5A5sldsMdN6xDRDGekvVaiFt86+Q8bmFzn7d1x/66jv0HrcWBSegUIKtybit4YRhKkoSN1yWFYNGY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 23:35:20 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6411.017; Wed, 17 May 2023
 23:35:19 +0000
Message-ID: <783de914-52ba-77e6-ae77-364624dadb1e@amd.com>
Date: Wed, 17 May 2023 19:35:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/sched: Rename to drm_sched_wakeup_if_canqueue()
To: Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20230517230820.371572-1-luben.tuikov@amd.com>
 <20230517230820.371572-3-luben.tuikov@amd.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20230517230820.371572-3-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::8) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f5f317-906d-4bb9-689f-08db572f6034
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbnEpVZ5a44nVbGbGTwNYU8a2VpidKlCQIXrzdqgWsovE1yYPL5PPYmPoenmfrV10nVLhtlNJucz1CFcQ0lg10OyYhyLgQKb9DJTIl0FgYPrulsx5qV/d5+dHpOTMHE2s1S9DMeyMwdTvFgvnF6Ke6fTPmT6GCgXvrTM+i1Rt/Q6MR0jBaiH54NcUPrzyurDl5LuJT2NshykfZ8t+NAJCLstbBbVD9wIZJuubyrl1AmZsLW6UZfLNHztyPvDzSVU31qQjjcdA6S7HPrkQeDO0wo4+5rmxtHPFK5UWCZjNkEbc2ew3G3CD3+ZN7BocoFsK22SMkjfjCHSNoWbpr92leu57yPToIGOTM0KRjwdRmvIsX/JaGeo3QoclQeVm3U7LaVdyRLuU5nz5wyy04bTLT5nU/XcCS7VyiC71uhZd2qCAtZkt9dseKLk4bqKVFOfCEenUImotSgCwTxD3kqTnLJ7rtO92Mm/8n/CIlO0vkkgOFdQGuXTHoVxLFXOVfXwWegyOpwz6x/2YCopbivVp8T6nX9aNF/8tQaSRRFH+f4a8SEROtKBi6rI5f0MMakZyhB6ggHHxDuj8SXC9miNZlU9LUK3ZuT+hG8Miq9CYtgIfojdaV6yyzMNzt+r250T8zxaMms29drru9aC7X9wsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(36756003)(86362001)(83380400001)(316002)(31696002)(54906003)(6916009)(478600001)(66946007)(66476007)(66556008)(4326008)(5660300002)(8676002)(44832011)(2906002)(8936002)(38100700002)(26005)(2616005)(6486002)(53546011)(6506007)(6512007)(186003)(66574015)(41300700001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3ZvMzdWRmw2cjFYbmREN294RWVxZ1pGTnRVSno2OE5RUkRJWFZDeFdYT0Jv?=
 =?utf-8?B?cFlVd0xmK3hYUU5jeVUrSzZCNTVuNG4weWRVbHgwYjVIVHBnMGROVTVFNTN0?=
 =?utf-8?B?NHl2ZWtUOTY3MklOaGtaZEhNVklXOExwRDRIZHhldU5rT1pZWnkyUjRKSUZG?=
 =?utf-8?B?SVJPNlBJUzNleDhxQm5FR21CL0MxVEwvOTQxbktTbUhURFZSbEtwNHNpUVYw?=
 =?utf-8?B?blMyb2RLaHBqcS9Za1BZMTBYd2ZMOGdCR1BYNE5uNU16dzVjeTBxWEpEOUdQ?=
 =?utf-8?B?blIrVnF4c2hGemJLbzllVERPd3J2SWlETThEcFJ2OU44UkJCUDMyT29zYjJu?=
 =?utf-8?B?LzdlWmxlbHd4SmJESnl4UThtTHZ2bk4rVDVYOWVLMmttTHF4eVpVMmxEWXFJ?=
 =?utf-8?B?NVlsN3F5M1duRnQ3TkQ4QTRQd3hRVE9UdjZuYlZjU0d3ekdJNnloQTBYZSty?=
 =?utf-8?B?RHArdENSVWcvelk0YzZqbEczVnpoSmxJeXc2UVpGSndjaDVOOVpzbHc0NEJp?=
 =?utf-8?B?SU1sKzlrMHkzMURDeC80WWk2eGFhUjgvNzU2K2lFR1B6bDZNVzVWVTFneWVt?=
 =?utf-8?B?cUV5Tkl5TlNpNGh0b2Y2bmpBdjg1N2kxSnJsV1VyZmtYRnRGU0swNFQrSlAx?=
 =?utf-8?B?Szl3dHlRUGJpZzgrK0RYdzNBSTM3cjdmYi81Ym9mZi9HaFh6dXg4QXNFTEFC?=
 =?utf-8?B?QnJ0cWlyVFliVWkrR09NQmRmNjg3TXF6WlpWZGJjTFc4cGs4TkRXMktyOGNI?=
 =?utf-8?B?bFdYYXFCYmJTM0FWV1RCS3FZdS9yWUVtUm1laWt0VjJkbXprVVUwMXNoQlAr?=
 =?utf-8?B?bkF6a25vL0xhZzZFR0hRSlB6OGs2eUNDblhnb3JxV1BpaGpRZHQxNTJQWEdS?=
 =?utf-8?B?aDkyY2liam5RNTV4Tm5YcHBSU3czcGRtUWVwSkNxWkF3SThDRnIwTEwxSS9F?=
 =?utf-8?B?Tmo5VEZLdFdOZVZyaWhwWmFtVTkvNG9VY1Q4VVpUYXZVcGpzQ2J6SHFzajBX?=
 =?utf-8?B?dG1vQ0NkMkx1c1hrS2dONE9lSkJYRzJTMTBOOFRkcGlqV2FjYzVLWGpsRWlx?=
 =?utf-8?B?SjAvWkR3aG1vc2RuZmFCampTN0t2S2VtU3REbGVhaW5YcUhvOTBqZDZXOUt1?=
 =?utf-8?B?Q1lkei83aTVCSTl4eDZqdnhLb3RnTWJ5UjJubkY3YUNsR29pL1IzUFVmWnJk?=
 =?utf-8?B?UVdYMkErQ2VNU1dxVjk2LytDTjZ0NFduY3AySWRWdFFZS3BaUGdrdzFuZDBW?=
 =?utf-8?B?bnY2NVliMU9PWTRQODE3Q1FSb2NCQnh6Z3BDWkZZMjNyMHJBSktseC9haTg1?=
 =?utf-8?B?dDBIU3RjQ3haeGRQek83TGpxcVJpNll3OHVDbUljS2ZqUWRUR3dIaXJPSUNT?=
 =?utf-8?B?VkY0M3VhSDU3K2pmWmh5bGYwcFhlUXZGMmF5bHAxM2lOQldYUjdCMmJ2WVU0?=
 =?utf-8?B?Qkt0Q2tvenMxSVE0MUs5K2VDcWY0Q3RkcWlpZm95NWE2dDRhZ1NoajlYM1cw?=
 =?utf-8?B?aEwvaVI2cHFNeWF4bVdQVm5HR2pDUFJtdThYWHA2bitVV1NYM1luVm8zNm9j?=
 =?utf-8?B?QkQ5N2ZqMFMrd0IyYXJyVzY4d2tqdEhWall5V1RIWGFYNi9WR0lEbEZuNGEw?=
 =?utf-8?B?TkI5cVRWZDNhbDFORTM1c2JJUUhtREZWT0tXSUNOSGw0NVRnYWw1RFVVZ0RN?=
 =?utf-8?B?MzEvUHJWbjdOMmIybnBQNStBSEpzV0Fnc1EyUHJJajFqT2lHNmh1NlE4dXp1?=
 =?utf-8?B?N0IrVnlOZ3JKR3NZUnZhRW5SK1JTR0RReTh3ZHpWbFFGU0xBVXZURXJ6SDFu?=
 =?utf-8?B?cTl6MDZ2NDBwblR4SnVkdElNOXhhSk5nZ3Nia2x3R3p4VDlDM2FMTmxoQzk5?=
 =?utf-8?B?c3F3OTNtcmJqeHBwTmZtaXJoOVBxRjh5bnFSVGUxRllaY05vSjZoL0pJRlZY?=
 =?utf-8?B?VndtWGJVOUtWUU84VVFJR050SVF3QWRHTTVGVHBEL1JaT2tUaTFNQ2RkdjhO?=
 =?utf-8?B?TE9oMjYwZjhtbDFCQXoxTVhhU3JyY1NqZXc4MFJZNTBWbmVtbU04WUxzYnk4?=
 =?utf-8?B?T1FleFYwanVBK2k2YkJtN2xka0NKZFQrTy9hZGNWYyt3eXBvSlFCdmh5K25t?=
 =?utf-8?Q?21e8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f5f317-906d-4bb9-689f-08db572f6034
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:35:19.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2lWx3gvFyuor2prALrsxQerzyRsUCR1x8MqGJorD7y5Lu0wctgoTDH3CYg+qSad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ignore this series--I'll repost without the duplication.

Regards,
Luben

On 2023-05-17 19:08, Luben Tuikov wrote:
> Rename drm_sched_wakeup() to drm_sched_wakeup_if_canqueue() since the former
> is misleading, as it wakes up the GPU scheduler _only if_ more jobs can be
> queued to the underlying hardware.
> 
> This distinction is important to make, since the wake conditional in the GPU
> scheduler thread wakes up when other conditions are also true, e.g. when there
> are jobs to be cleaned. For instance, a user might want to wake up the
> scheduler only because there are more jobs to clean, but whether we can queue
> more jobs is irrelevant.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 4 ++--
>  drivers/gpu/drm/scheduler/sched_main.c   | 6 +++---
>  include/drm/gpu_scheduler.h              | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cfb433e9200586..371b44fb4bacf4 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -342,7 +342,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>  		container_of(cb, struct drm_sched_entity, cb);
>  
>  	drm_sched_entity_clear_dep(f, cb);
> -	drm_sched_wakeup(entity->rq->sched);
> +	drm_sched_wakeup_if_canqueue(entity->rq->sched);
>  }
>  
>  /**
> @@ -565,7 +565,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
> -		drm_sched_wakeup(entity->rq->sched);
> +		drm_sched_wakeup_if_canqueue(entity->rq->sched);
>  	}
>  }
>  EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8739322c30321b..f437dbe62112cc 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -860,12 +860,12 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  }
>  
>  /**
> - * drm_sched_wakeup - Wake up the scheduler when it is ready
> - *
> + * drm_sched_wakeup_if_canqueue - Wake up the scheduler
>   * @sched: scheduler instance
>   *
> + * Wake up the scheduler if we can queue jobs.
>   */
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched)
>  {
>  	if (drm_sched_can_queue(sched))
>  		wake_up_interruptible(&sched->wake_up_worker);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 31d1f5166c79fe..a05dd01e264842 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -549,7 +549,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>                                     unsigned int num_sched_list);
>  
>  void drm_sched_job_cleanup(struct drm_sched_job *job);
> -void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> +void drm_sched_wakeup_if_canqueue(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

