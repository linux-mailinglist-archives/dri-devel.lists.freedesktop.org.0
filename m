Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76E23C1F94
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 08:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102276E9BF;
	Fri,  9 Jul 2021 06:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63F6E9BF;
 Fri,  9 Jul 2021 06:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGRkNBDKkQVZsVZmJBRKFwq9F9Xl51w3Oi4iamnTKcX+sIoIAsSLbOrFcAeaRhh1Jhd4OPpUfGn23xO1TxPfqGRBveCRWwBszmCsH+TZS7xNjWZMMsf2ABGKvulht/ltF9FZpI3bhHt3Z4sFdGCBXCeT+wg4C010zW284O/sk9cpGUFtpUydlA8ZaTnNILxCMtgvGRyuyW/WnJOZ7GlGKGRwmgKv8jEIfZ4FjuDlSrsHPsBe2jkjIY1I/u+asq7oD2tuAtk2KEE1LP7D/7K/2nfMi/qmBhPQmFBJSI0vdJ0a2OTobVmsTfzJE8giuCwVXTcwq2dsFDUwMw1e9NiA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNxRFDfwAiOvlzC7q7XOJ9IPZYZUKFX5v+Zoad9u1wg=;
 b=dxSdNU2UZgpQZFyyc42dKUsMuFTMZr1aht7inSylySltVyRbq9150r9+GE4jn2AqggP/hcxyhSx/es+1JS9gg0ddRZXBpr4QGSvR7LCcOJnlzOvBNhvzyKZFJ7TTe8TMJm6W3329ZJnEHrCF5umqgiMm/NAM6v4SlYFv0Vr2c+4slH1Sy3HtP6DDOs3+mNFmQjI1f1qAEjCuvTN7nlPqN94pJCT0MwcX92sfaazT2q85GDCjUiJIGrRkyargw4DiG1/tTgmcbbmoOGIUXwYPMv3/Ko2iQPHwJWRblp2V/hRIYlOgndWNU2RAf0tqHbhKX4Hxk9/jDAfbhAC8NEthtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNxRFDfwAiOvlzC7q7XOJ9IPZYZUKFX5v+Zoad9u1wg=;
 b=Ig8fBkbehsKPNEXQH0D1cgjvsIZXd1aSArnHyJdfWxMRktzxcf3GC4bZ7eHrxdHVd3txu8cCwxnUsDW/D5LgOvVYu1IfpUeeLXLBfSr77gTsCRH7OJZhKDl/p0Kz+earYOsxN6NQcKLyUXhmqWnqsKNt9wd7sqpmHmM6yNlMRbo=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 06:58:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 06:58:02 +0000
Subject: Re: [PATCH] drm/sched: Barriers are needed for entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210708173754.3877540-4-daniel.vetter@ffwll.ch>
 <20210708215439.4093557-1-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14149638-6cc7-5281-c6b6-d6d08d13713f@amd.com>
Date: Fri, 9 Jul 2021 08:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708215439.4093557-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3da0:55de:64af:96f9]
 (2a02:908:1252:fb60:3da0:55de:64af:96f9) by
 FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Fri, 9 Jul 2021 06:58:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1762a2fd-943c-482e-a38a-08d942a6e4c7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4336:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43364BEE6A84966AB38B7E5183189@MN2PR12MB4336.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BGia2xEnZdK+mVP/g3MNOHZ/9vG/GpPl5sDc82LiEcBMFuGW6u2RP/8yTwh3vRovcAuzKC++jUY0OUyU6u2RppgbrdO96m5vgA4fKiN1W3JZJODycN2aUQ0Is0jaw5eeT/FrZxhe1YQ6vrVdyATi8dbdUHDz/O64erigujz9jF47+ooK7w5cQs8axV3JncoAgnRiT2YCGnt042YLaxG5bDxORwGxRsTosUXAiopJSHsGfCDl3oQ9419awYKYdg4iUuHq1yxRZys+RLxiKf+mKPrzy4dMgFah+15RjKKyi4/Pz34JXm0PLLBxkOp0tHp1bca5aIywnjx+XYUwkJm3KWQjBpb8tcjGU1IDl5M1ayHxcZOH0mzNxV/vaEnayTVylBU5cBuVtpkePGGQGswPMntaB4CYk1U4B+PiN8xLA+ruHKnEPjLH0I/GS1qJhxSTeE6o8OOI665cw8GOBLaM7zQ7m4fb7G/pLyldQujuYA2GG2cobnkdabZBQWMLRmK8HwAb+DkeTicG5ld1bCpwlg2P/HPFtOYthp7fRw4m0SBIQnzYCu7hkggZvJ/wGZLs4ykzVB02RVWBOOHxVodtky3EG7cM0Gj/moac2UeHni8sJzbeRgPafytzZ1/oCc6kN62x4Vdjny8Mrzy6qMGLs7bxzYnNbjcV6xOdEfZGoDO2rlVYycGQFwAnEFM5I0XOV5Jw9loAsC5sMI2dC7h/CGH1/5YGF4kBl4Qc10FRgfYmaBxieLB7SYcEx9SFZtS45n0LqWMwEobj2ipOrz6AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(6666004)(66574015)(6486002)(2906002)(38100700002)(8676002)(31696002)(8936002)(31686004)(5660300002)(86362001)(2616005)(54906003)(186003)(478600001)(316002)(4326008)(36756003)(83380400001)(66556008)(66946007)(66476007)(110136005)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dCUG1STFYxOVZnYmpyZXArdHp5L0VSUG1mY3pab3lVeWdzeTlFdmRUUzc5?=
 =?utf-8?B?WE45aUJPbUI5cVJ3VEZQYWFGWW94NWt4LzhlUDU1OFIxVWtyUXN6aFpLMWJr?=
 =?utf-8?B?RkhWQktTZDFpUmVtQVdzSGgzZVI1RE1nSkxSNVkzcjJ0VGdnZWN5UVNPamhV?=
 =?utf-8?B?QldzVzBCbTlIbDNSVkFkU2loQlBIRG5vZU9VSnQ2ZjlxMzd5ejdOak1qN2Z5?=
 =?utf-8?B?eEtFZEF6TXNmdWpTNDZRbHBHZ0tUeGMzY3FKdkxCbWdKOW14YmJwWWVGa0oz?=
 =?utf-8?B?S3h6VHVkNDZmNWplN0U3N2tuRHlGeEFJdHMwYkpNK05yTkJhd3o3RmkxMWM0?=
 =?utf-8?B?SWxFRUhodGU4cnMvS1YvQXViS1hLS2dtTThJYy9PUkp4U2RLbjAwM0s3T2Vs?=
 =?utf-8?B?U2ZXcWhiVkRtcHUvRzBoTVJuakR3bGN0bGxEVU9zZy9VRG1taWRvSllsM280?=
 =?utf-8?B?ZEtFUkFXZHlRZlNqM2FaRFhLSkRIZlBPaW92NjRrQnlQTFVHSENZTDhMRWdB?=
 =?utf-8?B?ZzdwelBPaWd3U00rczBESDNhUkhkNytKOEY5MW0xZldzZnl0RERRVlFjNXpE?=
 =?utf-8?B?TWFRYWxCOXJqTXRjVThxUGNCUFQ3YXYwWDIwRU1wc0tTU1o0ZWovbENtWkRt?=
 =?utf-8?B?a21CMWN5QktYL1ZhYVlpM2xzN3IwTnRQclRqUFpUUTdCdE83OUJLRzJ1dXBn?=
 =?utf-8?B?OS9LVHFMQVFCQWpSZUc5emRhbjY1SitGb00wUC9YamFaYm1odHRBVTFZNTAy?=
 =?utf-8?B?dnlMbVNHTU5KSmdrU1h5Vk8yVHh6TkNqbjR0SHFKaHVxN2wweVRmREJNSEtn?=
 =?utf-8?B?akprblJFamVwMXlUTUpMSGs3YmU2NWc0Z2JpVjFpNWpuSGErbkUydHI4TnRX?=
 =?utf-8?B?UlMwbDBnZmV5YjBlQlJXSjFZTVZQSThmRlplYUVVMWNFV2pMRmQxWFVGK0Iz?=
 =?utf-8?B?MjlyQjVZTDRMakd5MGJWMFU1N2kvSHBLR1Q4MEZENENVdTJJTE9EREJLMnpy?=
 =?utf-8?B?U0swRlRCMmJKMzZyMUlRMWRId3J4UTh0ZGdzTlRhejNlaW90TmlpbHhMeGdz?=
 =?utf-8?B?bzdyOFR0NHcrQmVaZmloT2xSOEM1bmNZeTVVbEhyVWgxVDYzU2FXSEZScjA5?=
 =?utf-8?B?RDVzNDZiL1NEWGs3MnI3aU81L2krQXphVENYd1ZuWEE1WVVaTXF6OUdCdkx2?=
 =?utf-8?B?VlBpOUgwMTBMR1phSnh0dHVTWGEwZkI4S0NKSmtmU1ZwbmpVWWxSQ2hMMEFx?=
 =?utf-8?B?eDZpWm1iQktMOGU0bXRmRFdRZXFnVnp6QkVQQ3MxYUdicFRWRHF0Szg0QUZz?=
 =?utf-8?B?ZVFXaFRjcnBsTDIvWVJpcmh6OHNOWTJDNmlkRlRMS2RqQ29NblovdFFJTmZF?=
 =?utf-8?B?bHBEN1hCdGF2Q3pQeDdsZ05qY242SWVLanBHdGxIKzhYTm1mVSt3aERoVk50?=
 =?utf-8?B?Q3AzYnl4bU0xSFpsY0FLbVJmRFQxSXRVS0dYbDVyOWxlOHRFOHFRYmpqUUxC?=
 =?utf-8?B?bGJrdTAxeVkwd0sxNjNHQ1Y3bUxKRTFkSWxBVXFoYTZDUm1mandZOXhkZzBF?=
 =?utf-8?B?OExSM3dNTURySkxkbTJIRGJUNUpoY21rQ1o0S1pzQllEc0p4UDY2TitWT0Qv?=
 =?utf-8?B?blFzRFUzY0NzVmpqYmxud20rN1lROGdkR1RpYVhOU25ZdFd0bWM2SWV1REEy?=
 =?utf-8?B?eGVqZUVIZzJZNjYxUElBamROR1ZBNFVBK0tBL3d0dlBqN2pRVzJ3UGVCdWVV?=
 =?utf-8?B?bmNzS0x6UGdzSjRpSnl5ZndPZTg5ZGdaajV0NFU1WGd1SGNwbFhjK2gvQjVp?=
 =?utf-8?B?MG5TS0lBNTBIYU5VdDdWV3dvK0JEVVlCZGZZRUxzZlRwUUs3dXZGcC9rSHdr?=
 =?utf-8?Q?t3nSQo33Ir4nq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1762a2fd-943c-482e-a38a-08d942a6e4c7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:58:02.1418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04jn5wl5k7XeHMfSt3FoUgsBveFnsUyFs2jYx6KPqbUjJHWBtiKfvgH20Jq4dU96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.07.21 um 23:54 schrieb Daniel Vetter:
> It might be good enough on x86 with just READ_ONCE, but the write side
> should then at least be WRITE_ONCE because x86 has total store order.
>
> It's definitely not enough on arm.
>
> Fix this proplery, which means
> - explain the need for the barrier in both places
> - point at the other side in each comment
>
> Also pull out the !sched_list case as the first check, so that the
> code flow is clearer.
>
> While at it sprinkle some comments around because it was very
> non-obvious to me what's actually going on here and why.
>
> Note that we really need full barriers here, at first I thought
> store-release and load-acquire on ->last_scheduled would be enough,
> but we actually requiring ordering between that and the queue state.
>
> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>   1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 64d398166644..6366006c0fcf 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>   
>   	dma_fence_put(entity->last_scheduled);
> +
>   	entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>   
> +	/*
> +	 * If the queue is empty we allow drm_sched_entity_select_rq() to
> +	 * locklessly access ->last_scheduled. This only works if we set the
> +	 * pointer before we dequeue and if we a write barrier here.
> +	 */
> +	smp_wmb();
> +

That whole stuff needs to be inside the spsc queue, not outside.

Otherwise drm_sched_entity_is_idle() won't work either and cause a lot 
of trouble during process tear down.

Christian.

>   	spsc_queue_pop(&entity->job_queue);
>   	return sched_job;
>   }
> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_rq *rq;
>   
> -	if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
> +	/* single possible engine and already selected */
> +	if (!entity->sched_list)
> +		return;
> +
> +	/* queue non-empty, stay on the same engine */
> +	if (spsc_queue_count(&entity->job_queue))
>   		return;
>   
> -	fence = READ_ONCE(entity->last_scheduled);
> +	/*
> +	 * Only when the queue is empty are we guaranteed that the scheduler
> +	 * thread cannot change ->last_scheduled. To enforce ordering we need
> +	 * a read barrier here. See drm_sched_entity_pop_job() for the other
> +	 * side.
> +	 */
> +	smp_rmb();
> +
> +	fence = entity->last_scheduled;
> +
> +	/* stay on the same engine if the previous job hasn't finished */
>   	if (fence && !dma_fence_is_signaled(fence))
>   		return;
>   

