Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D36D918F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F31910E04A;
	Thu,  6 Apr 2023 08:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D25E10E042
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkCdzaP7FYBYxjykvugjBE2deNyHswwe/jcaY0Mdvm48BKYczLxpdmlKZAOGbODgpuvzgL8qvbk3RFOMs1aT7ztTdIx9zEuiP7t5ZQrxvSbLatQbycYCKEHo6iueyBT8vZtwi+CF0Jn+EYdkoxgRm9dB+AlmSpfuueNrYBNkkzuhLjvVmUt3TOZcSxcllD1f9tF2TSD0mRHwNRKEVROcAHZwFY0pwPmSp4Ni73Adut05YCFpgXII9xmnQy5CjydCtotWOkuKCPToa7A5bZmiRSKFLQCEya4OpT5T+gFfcYWfP181aEuJCJHHEo+3uI9zmLohIRbyt3av+iAzoUmqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UDJ9K5Kd2d2vofQe6y/L7WFn+vz8w0I3qjwIjaIkt8=;
 b=DUT5xeb2AjZaj/dXFt0KlcQj+UgeAQVtUufSuF2GjRuMXNADRf1o/c2Mb38Ohx3kPHkrrtxVOrxY8NwVJzKLzNcJotG4HbQhI43DWkPuxveqD4aZ04gKBQElIpLK8ctymqccZfxSDTFTo7+NTE1xskwhBaAYcXj1DtIQjEZAzcxl0jqq2te13/bdTPsOTRz2bSTQX5NJBnyKD+omd3RmdDl/1nHbeIgCjcJyrPKUiI+vZy3BdTLihKpfG2FOdyJ4UZ6iqrx5nLxfJB0TyT4I4cddHh3ef3+nuaANTMvOMO6MamkTD9JV3qujaTupKhZQ7oBJhQy9hLSOTdI2sdpHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UDJ9K5Kd2d2vofQe6y/L7WFn+vz8w0I3qjwIjaIkt8=;
 b=ahJRMQSRQ2nG2qIMpysbXtr1hpuQXN69c3KCz/lDYzSN6g23KR0yDpMG5V360LN5r8JvSK58KSbzCpxUIginrmxsr5ZemyFeGDKtAJ0SPNmHWmwgQucCW/a8UW63KFILGIxvT6VCYBpH8KsPz8oZalF2NNgZ6trgkZ/JqAhxuI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.38; Thu, 6 Apr
 2023 08:30:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 08:30:03 +0000
Message-ID: <6b3433ee-0712-f789-51ee-3047ead9bb79@amd.com>
Date: Thu, 6 Apr 2023 10:29:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-US
To: Asahi Lina <lina@asahilina.net>, Luben Tuikov <luben.tuikov@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230406-scheduler-uaf-1-v1-1-8e5662269d25@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d364b42-9579-40ab-db13-08db36791e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yqx7XAob0yPjpkhT28BNGuVmCG954QAICNsMr6ZVk8y2DoT8Kgm5vU8EvKGXiJD4BYN4phU596Mo/bpq3FU2r01ziLsOT0ubmP9ghrLz//3zX2jd2emoTtKKHdGilFm7X795Q1wWxtCNfGrihV0J7H/+PMZVa48AU3o9kUL21hKxS3WWex/yLvH8twSfqA94oCwqipXNkBqMqQBrvUwvQEOPs5Fwjo6TJH3KqzbBqp43/Od4vJgXYAkJ7NlURifqBrG/JfYfxUhgJHgXVJ1VeumEyr0kuZ2V8U+JMze4PKlhESQpH5XazzTdM8mWpiJ+xxB2ib9gOaME9aOtRohVL9FdcA+WoOKKF3AQcc+mH70ykCJrwJFlb108qqP8Ty7LkAMKBBgS+GFfIsEsQpj7cLhWsammJ6aIef6OABsVO6q/icg+P/O2a1r+yFQH+5S2P4CJLL6BgktwmzZ0nF90wK7lZoiD/oerG7eefakOJgUzasxceVzbErAWs6U2KN1U3dxk+FFlZARG1DFUY+4PkiiWyUe71A0bbBUFqyX7qpmp5tjvMLZmoOARTqZ+KueUlgz0LgoMuYd3laJA/Bod3/i2/u4+lR40x47s2hdjNlCY4prk9YfYBjFw32JUZJaSO1aPVo2Vzp02wc5e1N+l6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(2616005)(83380400001)(6486002)(316002)(478600001)(110136005)(6506007)(26005)(6666004)(186003)(6512007)(2906002)(4326008)(5660300002)(36756003)(38100700002)(66476007)(8676002)(41300700001)(66556008)(86362001)(66946007)(31696002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGQzYkdYL0ljeHpUNmFkSmphWUhZQ0phZmgweWlkUWNvZVQ2Qk1OVWgxd1ls?=
 =?utf-8?B?a2RJSE56cVBBNk5aRDl1Q3R6QjBiTUN1ZitCQXkzaXVnb0ZiVVBRMllMZHZM?=
 =?utf-8?B?V3FYOTJXOUhhNzh5UGU5MVRUUWV0YWwwY0tUZzJieWFQMGFJaXFPL0FIK2dB?=
 =?utf-8?B?akx0VjhDNSs4ZHdYdGNic3NzWnFRSS8wSkJzM2NoaWM2SCs1RmplMktVTCtn?=
 =?utf-8?B?UUh3NGVxWmFQNnVqKytjajhCaTh3WXFIdXdmUHdGc1RCaHdGckhHNnFDSWI1?=
 =?utf-8?B?OG40RVp3VXdMNDJDdEpaL3E1azhDL1FrTlIycy93UHo0V1NKQ1kyTFJmMGpL?=
 =?utf-8?B?TXZJdG4vWWxYMTdnZlBFVlJlbExHcWJpSGVlR0VKRUdIUmJRaTJqMWFlWDhV?=
 =?utf-8?B?clVIRWhQOGxpb29GRkVGaXpvV3MwQSswMHhEU0pEMmVmOVJEU2JPMytVdWM0?=
 =?utf-8?B?RUl0NVBhNW1FRU9Ic0lTbjF1d2N5dXhjMnBPTEMrRFdQMkdGbEZnTFl6TFo0?=
 =?utf-8?B?M01wWU5RNEZVWUY4MmM0ZkJhR3VFUlVPUnJUWTN0L1dQVWZZbjlMUENLOW0z?=
 =?utf-8?B?T3A1aWJCaWlud3FsRDNUTHZMMnowNzNQU0lTZEdRTVBRbTVRWGRXaVFZTGcr?=
 =?utf-8?B?UE41ekVuUlh2SWFvWnVWQklibnZOaVpSOENadEw1bHJJWEhpYlhIVzloQUk1?=
 =?utf-8?B?bDgwUmVsbk80Wk5DeC9ZQmhEWittNEl0NGVrQmhoWUlsemJZMERqM2Vvd0t5?=
 =?utf-8?B?aVFBTHA3QnYrQnFTSjZhZ3BwSEJ3amNxUzdPdjM5dUdEYmU5alRJQ2llaFJZ?=
 =?utf-8?B?aFJ3NzBSbUFkbjBjQjdtNGRtd2UyNkhVV2RiWnBwVEgyK2JvVkk0YnV3RjVB?=
 =?utf-8?B?MFhuelhxMHF1YzEzaXYrbmxFeTZPeDA3OWIraG5OWWxYU2NVa0RhY3lxN3VW?=
 =?utf-8?B?Um1QQThJQ3hwQXczZ1RXOHg5eDgzbTFZdWN6dW5pUDN1Zm9RaFVCUTQ4N3Uv?=
 =?utf-8?B?ZE9yYzdtTTJJLzh3ZVZSZGVjaGtGdEpEV1F3bTc0OUtYQ0VvQk9qbGhQd3Qz?=
 =?utf-8?B?bmloQXBHVmRYQnRMZDR6emVudGdYSVdXZ0dzckdVV0hkYjh1Nndpa2FxdlF4?=
 =?utf-8?B?K0xUbE5ucGFURkJtdkRaOWdvVHMzR2ovZUdlTldDUDBrTkFyOTZmcXF2RjBF?=
 =?utf-8?B?dk1CeW9ENWlPaU5waVhVR0xDaEdGN2ZZa0ZaSkR2MzNxMlFpTlF0VGJiTVdT?=
 =?utf-8?B?WUMybk42U3pLL211YmpEQ3dEdWdURlR2bjBBQnZ0di9OUGVJeXdEYXJ4NnZ4?=
 =?utf-8?B?SjVLUG9DWlNpWFZjcDlJZldNQnRxV0xHbHQ4Qk9ITmd5RDAvK0JkL1FReXlW?=
 =?utf-8?B?MmlYaW5JQ0s2cHlFY09iTmp3TVhwd09hbGZlYTBQWnFaRUFiais3SWdwN2ZS?=
 =?utf-8?B?Z0JadEtsNXgyNmdDbm5KUmNrQVNYYlFQYjhmdy9jTk43TlVnUjBHUWpubENM?=
 =?utf-8?B?d215d3RuNTV4TUl5MDFYWkc5aXJoTWlPS3JmcnBoY2FMdUFuWTF4ck5mdVc1?=
 =?utf-8?B?TXhaT2p3T3pwVXEwVGszbjk1TG12UWk4SUF1aGUvRXMwTVRTWVNQRU52WVlP?=
 =?utf-8?B?WFk3UTlscFNOWW1KT0drMGlrZGNIK3FkOXo3WHhzdnhsZUZRNnByWE92MGYz?=
 =?utf-8?B?dnJ6c1EydWZ1NHlBTzdVb1RFd3BRUEl1d1dxNld0UkVUVlhkTW1qMjM1aVk3?=
 =?utf-8?B?dW9ocFkzLzBTc3pUdXJhRGZXZWl3aWdHLzBRNzl6cWs3SXZNNTdjTHF3ejY2?=
 =?utf-8?B?enpSWGJlVFhTZURJYUQ1Qm52RjUzUzV6ZTQrNUNRZm5Na3hLakxLWmxjcFFi?=
 =?utf-8?B?TlQwMW9pU0d4UmtYVkxTR1JqUGhSTHo0REltZ1R1SGlRMUI1ZGMzUHlCa2lO?=
 =?utf-8?B?UmdBZnUvWWd4QUFIUnNoWTlTeFViUVZRNWhnaU5jZ2o1eXg0UGxIWFR6bmZl?=
 =?utf-8?B?NUpFZWFyMDdHdkE3Z3VDOVdBL3JGNVZ4Z2gwVDBCc2xWTHl2aHB2ZVlPT2ZQ?=
 =?utf-8?B?QVlkWGF2cVZ6NW02MWdaMTExaEhiQ3hnN1RBZmNBaFBPRVM3MjhPMUVRUEY0?=
 =?utf-8?Q?UJTtjqvjSWHAwLsxRlLlFSLJv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d364b42-9579-40ab-db13-08db36791e27
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 08:30:03.0519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfvgIUCt6uTfgLrm2TrC4x+qF5guyHBoOEBy7dWQwDNxdMsIrzlCf1lQ8+1rdtTO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.23 um 18:34 schrieb Asahi Lina:
> A signaled scheduler fence can outlive its scheduler, since fences are
> independently reference counted.

Well that is actually not correct. Schedulers are supposed to stay 
around until the hw they have been driving is no longer present.

E.g. the reference was scheduler_fence->hw_fence->driver->scheduler.

Your use case is now completely different to that and this won't work 
any more.

This here might just be the first case where that breaks.

Regards,
Christian.

>   Therefore, we can't reference the
> scheduler in the get_timeline_name() implementation.
>
> Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
> dma-bufs reference fences from GPU schedulers that no longer exist.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>   drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>   include/drm/gpu_scheduler.h              | 5 +++++
>   3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..8b3b949b2ce8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -368,7 +368,12 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>   
>   		/*
>   		 * Fence is from the same scheduler, only need to wait for
> -		 * it to be scheduled
> +		 * it to be scheduled.
> +		 *
> +		 * Note: s_fence->sched could have been freed and reallocated
> +		 * as another scheduler. This false positive case is okay, as if
> +		 * the old scheduler was freed all of its jobs must have
> +		 * signaled their completion fences.
>   		 */
>   		fence = dma_fence_get(&s_fence->scheduled);
>   		dma_fence_put(entity->dependency);
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index 7fd869520ef2..33b145dfa38c 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -66,7 +66,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>   static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>   {
>   	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> -	return (const char *)fence->sched->name;
> +	return (const char *)fence->sched_name;
>   }
>   
>   static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
> @@ -168,6 +168,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>   	unsigned seq;
>   
>   	fence->sched = entity->rq->sched;
> +	strlcpy(fence->sched_name, entity->rq->sched->name,
> +		sizeof(fence->sched_name));
>   	seq = atomic_inc_return(&entity->fence_seq);
>   	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>   		       &fence->lock, entity->fence_context, seq);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9db9e5e504ee..49f019731891 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -295,6 +295,11 @@ struct drm_sched_fence {
>            * @lock: the lock used by the scheduled and the finished fences.
>            */
>   	spinlock_t			lock;
> +        /**
> +         * @sched_name: the name of the scheduler that owns this fence. We
> +         * keep a copy here since fences can outlive their scheduler.
> +         */
> +	char sched_name[16];
>           /**
>            * @owner: job owner for debugging
>            */
>
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230406-scheduler-uaf-1-994ec34cac93
>
> Thank you,
> ~~ Lina
>

