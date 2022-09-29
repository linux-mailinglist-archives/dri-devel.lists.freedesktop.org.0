Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC35EF666
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930B10EA59;
	Thu, 29 Sep 2022 13:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36810EA53
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:24:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhHHnPYFfrrDIWkiVFKk/FPB3B7J/itKdEI0bt3iqV2QIBluFe14T3vlv/hwcqONuwzutPlDRXyCp7ISH24uycl520Ie4i/li/hgkZfE2onDiEG2EhfjM3ZbjYZog3eIdTDQl/c587BAF8u1DKOChnk6mE18n4T9Nk7JKJv0lRBcZaMUAPdp03wpKYB66pNDvMJfY+uferwH5JlEz8IGMGw206KwKJgXNgUF0fsNW6ZQJis/bwj6U1nqPGmqv5IULcCPAOdEqyocLS5gza2dWaAvil4ri25H+hxdg/jn8+VMsc/jw8lJ4GxB/kr5tFPEyxnMBGsGQt2H7q+XcYoJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Tx8h3fLJ9B7zInkKOAtlGXZxqVB/SI6NUD3HmRCpWo=;
 b=ZriZgql/jocD/EUs7JDKNllboiczvxn1HKPmNCTrGJoMinHPwdlT7KVsNTHpvPtFFppKuf+6eYI/AhLh8OkJ8Sm3mskjGtCaAEiK/nyH4A9qtukiwMNAKp4XegMVfURT3D3drSbkg6wEhJ+o2RFUuPZ3P3nwFDNjtHYj4lblOA4PtZKaiScaC3BBkQU/jWFg1v+9uTF0xw3/tsv5ZyY7qRu9Sf2QjXt1XGAO0m4AzOiqkZmaW9wkFl2fCteI2ZVZdeGzrePxE7OuXhjV/9TVSr13O3hYH02l+F8uV1YxDlK55XcK3x1RolLhqRZU9PiFItdJqH2jfbfJWlHuGjMHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Tx8h3fLJ9B7zInkKOAtlGXZxqVB/SI6NUD3HmRCpWo=;
 b=FvrMKtli/mjJMdMjq5w0jMpetuWK9F4RtxHXkeZb+wGQ5420Fsk70Hpv1jJ8zAXpCKpwnzZsuoJsnC01w0lZJBNyo/ttwGHwIC00WOpCd4VSSprV/jS4fZNvg+0uJxSroZnO4STOCHXpjl1iIwF+h35Qx+TVQT9nZNSzSZdEQJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5056.namprd12.prod.outlook.com (2603:10b6:5:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.18; Thu, 29 Sep
 2022 13:24:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 13:24:12 +0000
Message-ID: <8f8a6344-85ba-0864-b1d7-a9ea0d37aef4@amd.com>
Date: Thu, 29 Sep 2022 15:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/13] drm/scheduler: fix fence ref counting
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220929132136.1715-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P251CA0012.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a54dd1-3ed4-4bd7-ca1d-08daa21de59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZdp+A6yZjevLzBbLetjAlyMZOdiZ65V42CulzBCuz4BTtq4mD6FkjzWHi6d/hSoyC7T/UfazEINqAsDLwiVCqmJ2U9mDcMQ0AlgEkr+00mzNexQcWshKu7A7notLGUxvUIqyK0mOUymPy8+2BkVPh1yibawLxvPx+MdxAtcO30+5d2KxAzcO3kjeXJAWXZBObmirBIIiHkqucKwNVdLbxOlEKlVz5+rE+plagVGqNu++mQuFWRZUsi3KPhlBAHrlOZH9bSv2zftNVGvEHmF6wVpDZgLHwsjraejO6zRPBkQDjKC4hivYjGUdL1xvUHIOtA3982Yd6US38imytK+U0cz3JUqo5D16Mg7S402l0KOHXha0vItg87dUjpl8NKvfsG9vWbAGEsCsijLGIYhBstB+SzixAvbsiCA9Q5s2saQDrvSUvFfaAUNcCMRpTRJ5LWLEj900Sq/4Qst9X9Hi+PdHAsyKwy29WPzQgtXZby1fxHpVIhvkYB0XDp2joIbCF/8WfiuzxbrCcqGtfC8JImYRCFmn7ZG9rPcl4VCKbY9SLlskYr6z3AmFGrNUxeKeKaE9S8zZdkkD/qyoTzxRqDbfKUptrhQOg3IVlhg1dUdOJxfeXxM1NqZVXuOXJYDmaJjwGVuh6itoCbjbTCHmDmm+xEvSlB3Hhl/Pcz+q4qdMTw7IvxCJdlDrfSTapDMngRCRSo66AUXuVNf+VcZ4vcMsCHw2SOQ804V4ydUtgYpO1GHYT8+13TSyGqhFv6tlvsDzcaDX8XYOqkASe/MEUrKr6kysmAtwNAUZwh44n4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199015)(6486002)(38100700002)(31686004)(86362001)(41300700001)(6666004)(2906002)(8936002)(6506007)(36756003)(478600001)(316002)(83380400001)(5660300002)(31696002)(66574015)(6512007)(66556008)(66476007)(8676002)(4326008)(186003)(66946007)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTBpK0VWc0JGdzc0alBFVkhKbGV5MjVwS0NLQytwemM3c3FraU94QkhaRTdX?=
 =?utf-8?B?UEMwUWpYTDQrS21vc2NtekduOHNyZmFYbGhKMEtjbXZSMCszd0U2RElaM0Y2?=
 =?utf-8?B?czkxamVoV2N6SlEvOU1TenVlMndrUjFVTytxcXhjWEJEZVZWTVpjY2NtSDBn?=
 =?utf-8?B?Z3FVSFpFMG9jdzE3RzNlZHZFcFpxbVBCVVc2YVYwS2FLQm52dDFIeTFQSU15?=
 =?utf-8?B?WjN5ZHMzc2FKUmJlUWRqRXU0NjJSVDRBZ012czB3UEdnRzlNUW8zQnA4bVln?=
 =?utf-8?B?Mk5BSTRlRTFXNU9HRnkxemxacFVrMFJOenduRnhlNDVlYkkvUmRZa1FBOVA2?=
 =?utf-8?B?U2xVYjlTU3k1c3hLK1dka0RiMU1PczUxaCtGdmduOFZmc3IvTmpCVmJxVm8z?=
 =?utf-8?B?QTJYcXB4V0p3bFpoRGU4QmRBVGFnVXl5S0N0TFFqN3dXSEtsZjRPNTJZZ1or?=
 =?utf-8?B?Tzczd2ZFaTBnWGZpaEE1b1ZKS2hZOHgzZGg0MUJaU1k5NDd1VGZjOTZCQVFl?=
 =?utf-8?B?K0FneEF5d0laUGloa0VRMWw2Y3FBZFA0VVQ4bEtpMFYxNHdTN0g1dm9XRjZm?=
 =?utf-8?B?dEU1dHAxd1FxVjhKd1ZySERtOWs1N2pibFh1S3o2UnNlMFVPUHk5UVZkQVVM?=
 =?utf-8?B?eDNrb1ArSG5xNkFib0dkYi8rR3lPMnQ0NiswNVUwQ2ZNcWg1eHNscm9CaU0z?=
 =?utf-8?B?Wk9rODFZZjVrOWRWdjAxTGd1UENPenNaSHhYUUphbVhZQUFUK0s5K0hXak5x?=
 =?utf-8?B?Rzc4TTIvdlBFTDFPVVF5NE1tWlVUckJhMjVDZXBUUG5lSDdDMmtMa1hOQ2FM?=
 =?utf-8?B?RDRYVEF5UlhYQytHQW1BaERrYkZrMTVlUVNoam9FTWZpc0NUVWkrY0lIdWNR?=
 =?utf-8?B?cTYrRU1HUHl5YjZhb0ZhQWZiQnZBL3djL2ZWWUdvd0J5U2FKNDZtTVdFUERK?=
 =?utf-8?B?NlFYOGZGeVJmVkx5aUE1U0tBNGI3Vm5jTkZtS25UR0c0L3JLa05JTmNxWmly?=
 =?utf-8?B?QytJVWhxM1VKR1puREpoVkRhcEg2T3VjS1paZlZTRFhHU0FVbEZ0Y2VhYWFK?=
 =?utf-8?B?M3BIeFJDZm9jeEZLcmxabWRNT3RCMURUOXVIa25sNG1QM3RnT3htdVVVZE0y?=
 =?utf-8?B?UlRZUWNwMitLQXZBZXFYQWpDS0NLMTBNMmxUSnRLdUZUZ0ZZMmVDc1BWMFdI?=
 =?utf-8?B?SDJtQWRnd1ZRK2ZhQy9Cc3diMDBhbk1Qc0lSQkRpQWdTWittK241YlFDZThG?=
 =?utf-8?B?QVR5amtRNnE5YWVVYTcyRnovTFNSU0FScHRKUzAwQmZYQVZqWFYrWjRvTXVX?=
 =?utf-8?B?dnBjWVRYbGNOazBaTTJpd09LeTJsM2hVNHljcURwWWQremV2TVR1U1hNSEhM?=
 =?utf-8?B?dHRWVnNMbFNBa3NYYkQwQmlTdmVYbG43ZkRqUWZZTUY0Z25mZWVGTTdjVUZN?=
 =?utf-8?B?Ty9aS1RWM0ZhOVBxN1lZWHF0bWo0MDZra0hBVFlTVUlaZHBXd25GcXcrV1Ra?=
 =?utf-8?B?VEt0YTZvbm0wcEZ4L2NQNkxEekl2Nkl1V0RCSEtaNjhqQ1EvOWZrREt0NkVM?=
 =?utf-8?B?NjhiQUFEb3RlSnRSR1lZaTFKeHFxOXVyRlowNXU1U2psdVkwZXJzVVcyT0Jo?=
 =?utf-8?B?Q3RKMHJBcDlqUlFRQkp2eDhkT1NlU0tRTVhtR3kwamVYaHlyaTJHOEtaT01j?=
 =?utf-8?B?ZmhVaEhuYzZMOHppM0lBZjdqZExONjN1b2tuTWRVN2JRRytsRkNET0EyZDBP?=
 =?utf-8?B?bW9mS3U3NmdLYnlBTXc2UlZqeUVuQ3haUWp1UThQZW1rc21oN1owaDhkMlNn?=
 =?utf-8?B?eUVWQy9Kay92Z3pNbEx1ZXp1dHdrbzBwZjkzSk0zcWxYMmlYN290b01PMnF1?=
 =?utf-8?B?K2R3cmIyblkyUjRHV3FKQWFtT2NZL002WXN1SkxSSmtLZVByU1RGais2ZUJ4?=
 =?utf-8?B?MTNmSk02bGZoNjlJandLbGlLaFlRVjd3eGRieXhUZFR4T0N6VWM4ZjNyNDlO?=
 =?utf-8?B?ZXNOblpsUFRFYzB4aFpSaHVYWFlTTDBUenRZcVNTWWR2RHZzb0RObDZrRWQ1?=
 =?utf-8?B?ZCt4Y0dJcFBkd2JQN0Z2R1lPWUhpZkVlYW5aR21uQlRiY2lQeDNNekZKYnNu?=
 =?utf-8?Q?5R9vOE7k4k+lLs8uGfpOV1EYz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a54dd1-3ed4-4bd7-ca1d-08daa21de59e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:24:11.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYNTJlNWlFwpiO7YPupzK84GK4WhMEgZZpjbsz3bgYT0Bg9yH/xu10yIz/XORg6i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5056
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
Cc: shansheng.wang@amd.com, luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've forgot to add a cover letter, so here some more background to this 
change.

Basically I'm switching amdgpu over to using the dependencies inside the 
drm_sched_job instead of it's own data structure.

This has the major advantage that we can keep those dependencies around 
after the entity is already freed up. Otherwise the blocking for killed 
entities can easily result in a deadlock.

Regards,
Christian.

Am 29.09.22 um 15:21 schrieb Christian König:
> We leaked dependency fences when processes were beeing killed.
>
> Additional to that grab a reference to the last scheduled fence.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 191c56064f19..1bb1437a8fed 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -207,6 +207,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>   						 finish_cb);
>   
> +	dma_fence_put(f);
>   	init_irq_work(&job->work, drm_sched_entity_kill_jobs_irq_work);
>   	irq_work_queue(&job->work);
>   }
> @@ -234,8 +235,10 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
>   		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = drm_sched_job_dependency(job, entity)))
> +		while ((f = drm_sched_job_dependency(job, entity))) {
>   			dma_fence_wait(f, false);
> +			dma_fence_put(f);
> +		}
>   
>   		drm_sched_fence_scheduled(s_fence);
>   		dma_fence_set_error(&s_fence->finished, -ESRCH);
> @@ -250,6 +253,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   			continue;
>   		}
>   
> +		dma_fence_get(entity->last_scheduled);
>   		r = dma_fence_add_callback(entity->last_scheduled,
>   					   &job->finish_cb,
>   					   drm_sched_entity_kill_jobs_cb);

