Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF7387AAC
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B999D6EB87;
	Tue, 18 May 2021 14:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3CD6E886;
 Tue, 18 May 2021 14:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/p708UUb6ag4v+8eC3+Yo7MiG29/HvwbCr+xGP4DuOiol8WzkyXI5pZrOIWbSZl8DpQgLOJDCWKWGejQgemKek2ys5mmbAKWbNVfWkMTGdTUvIjhokIJz4TNw87l2nj4photyAZ3M+oRaKUlRTx0feR+mCaH5Tv51fRp6B7TfuI9JrvdA7UZodkYBmC+0nIVs64l2fS3yKNWlhVkRWmGL4/yd6GN5DLYlw3I40nzursEtExvzdszXjWT4hmTubjwhX5jnjugKddrmMhjwa7z9eb936r9UcRjSZ0enl3FwWgPIGwNHX4aABtGmkJgCOsBWGmdxJ2tl2LTTO/aef5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+IJX4IDtvED7MY5nHKkjIZccVh61sf1mqI0D3UvcM8=;
 b=L/g+n383x8THcE/rPnwYr5fir77NeY45f75CVWKZXhzvk8UdMjHev8uwZX8tJDWKSFLZlwlEj5HHf1dBVO3FSYuC7U7Xo3VxPvFzNgvFGmnLAQo4r7n8NAo7y6u7VbrMQKUknLz9JDo+ytmpnqpGpR1CBZHJAM50+d5RgwEHpnRZ+SQTzR4MZDaTuq6OYx+XxEymWwCJIbV3Hj+psB0S1BAtaAsZMci/SelLdyOHNE2Unq/xfpHYkqkBkvClC4HJMoVxtgf1is7TKJk5JPjdgJhdczmz1k3+A5ouNEiVQ29jANKjS37sBr+OIi5vmhXPTHUW6J+ctYpJajhRlCkMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+IJX4IDtvED7MY5nHKkjIZccVh61sf1mqI0D3UvcM8=;
 b=WSIMksnlhn0OcOQ406hoGDYZT9EDkfhi9sD41guaOVwJmowmiBjM4sIX/bpa6cHojwYnCjPe0GXLVrIOhiSDrA2pryKR+roJtJRTvqUQDES0FOVxgPpTSEXUiTfaIUauFiKtJt3lyevuh0erJafKjjuVcXFXDd4Q1YzvpeF4k3c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 14:07:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 14:07:40 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
Date: Tue, 18 May 2021 16:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210512142648.666476-14-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM3PR05CA0128.eurprd05.prod.outlook.com
 (2603:10a6:207:2::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM3PR05CA0128.eurprd05.prod.outlook.com (2603:10a6:207:2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.32 via Frontend Transport; Tue, 18 May 2021 14:07:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f978b66a-e13a-4046-5fac-08d91a064c0e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39366F77D445B576BA5E4CBD832C9@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJA4EKLIWzkydGFhy81ZbOuNxtqYhctq2A8xKslZNfjBjff3JUbhUv9fSqI02Nu0o2K1ccaSn5LUpN1YGqiFOL6LyzFqYY7yNvkjM8ll0Oz+Yyxg4K9tpBWJJWriSvFteS9qOLoaqaH4e0LNNXLAS4kA9/Oz3zHWn+d6FvUARO9CofX6aklNcDpdPYtkPRJT3ghH04Lemu++wgg3DUg4KCQutcbGj/nlDU2sr+VZ7EIUr/6OKkw9Gs9zpgvhluLhY65no+mRWD4r3R8U00wKDXbcuPWXYDu8Iei52RDte1emqdDJtUISSoTS8jMJsz2NTih1c8mGS3tFNH7yXFX49ogGuLkopBe/uRk3DuD9oT/J+MOzb/7FwSXfou7DUPriK7qa59t0U/7yYXh4rQ0JVw9QfIeInQ21fIT6YAebSoiTRFeDdxt+gGJzl5FPDqqa+Nl7pcHCznge9DZKavR8XeML8zxSdkmJAkCka+AasZXTkTUrMXflftiTIfMquRFBvMXZxcH8c0mI6UGhvuhLAJZ1w3tM3u26ShfZ/ZUjBTC3dnvgXDQcWmhY3xcY7Rxh3xw7nZuxku1EPmmiKK003CdiIpOjHk7ZbbO5I01uqQ+H54+hMkcIGETCQbJ9OL7EXyNmZ0FXs9LDARrgS86uXZwJtsAvuu8evnDK8U6Exd8o6yOCBnh1BPHuGw9CGSa+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(31696002)(83380400001)(316002)(66574015)(52116002)(2906002)(4326008)(478600001)(66476007)(66946007)(66556008)(6486002)(86362001)(5660300002)(8936002)(8676002)(6636002)(38100700002)(2616005)(16526019)(186003)(6666004)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUdvSWJxNGtMQWpJYURxUW5QekhnR0llZTg4bkNUeVBkWW04cHQwTTBOcWVm?=
 =?utf-8?B?cWtDS091NHBDNlA4bzE0bnNaaXdMcFRHTjA3MVY0Z05tNzFWdmRjaVUwSXNS?=
 =?utf-8?B?WExtbFNpUloxc2FKYzVkVGpJeHFZYVVxNE5jQktzajZicmxPMHAzdTRTWWJ2?=
 =?utf-8?B?SlI1a0UzM3IxRDU5QkZzY0JTaHZpM21QZE9xOElwMVR2ZStkM2hHY21KZGtU?=
 =?utf-8?B?MmU4akZiRVZxVEhKTmFvOHBhR01HVERMV0RRRThJRFdrRU55SStjK1Z1SXpD?=
 =?utf-8?B?eHVMMTZsRmY4ZXdOeUVnajJvOW0wMTg5eHlzY1VkbEJDQzdPWWR5SDdNQWZK?=
 =?utf-8?B?aWRhcGdVOGVpcXc5clFEdmhVVHlXWlJYVE1jSC9Sb2l3cWVONWJVaWVldGl5?=
 =?utf-8?B?eElsdE5yUkdCNlpwV1JKQkRBVW9lOFJjZDhxZjNSQjUrZFBqdlFGWUtrc2o5?=
 =?utf-8?B?ejlBZnB6MmRLRGNCa1ZRV3Nab3V3QjdlU1BaZ1FDSW5jWmUzQWs4aElYaXVW?=
 =?utf-8?B?TGVhd2grZGs5Q25yTjJFdXIvQ0tCRTRDNUNzanRlTldLeGMwN3FUZ0VrdXVY?=
 =?utf-8?B?eFg0UHdFcmE4RUtkOTRrbkMvbWRXQlY2TklCbktvRGpGVy9CTy9TQUY3czBF?=
 =?utf-8?B?MkNUZ1lFaEg3d0xacWN3UE1zSlV1N0F5dU5yTWlXSzdVdmFMYjVMazFneHhY?=
 =?utf-8?B?bHdpdy85MVZaUWZra2N1bjJWTGhwekpDRHcxWXg2ZXgxZU5XN3ZDWHJSK2Ru?=
 =?utf-8?B?dFNNa0l3dnlFN2dFeXIrNTZRa2ZURmZWWVFIVU56M1MrS0JKZ01mNGl1enNK?=
 =?utf-8?B?Z3UzUFdzUXBBTjZJU1YrMVVUa0c0WnpjbGJMVy9WcWlscHIxa21yNmZDdE5q?=
 =?utf-8?B?TmJHU2tjdzliMU95a1A3bkFGWjc3aENYSG1lL3QraEt5cldQbnRkZzRDZ20z?=
 =?utf-8?B?VVNqNnV1eW0rTEVhUXRUU3c3MG56STByTnBlUzc4YTZjLzUrcThzVWZkRE1i?=
 =?utf-8?B?b29ScjZxTEw3a2o0UGhqTnA1YkpzZU9oN1JwaXdOb0pYNEQyYzNTR1R2NzZu?=
 =?utf-8?B?WTVIblVxRkswczFEMmE3SkRaQVo2NHNXZGNKWEhlRkUzYVI0UGUyNG9rOU05?=
 =?utf-8?B?K1BzN1FxR3RRUUxWYWo2WXZkZUNicE5vY0xHaXNQOHRNclpxZjd1dk1YUlRS?=
 =?utf-8?B?bTBGb0dVYzdGem8wNHBkbFV6MWk0U09BQzJBQkNRajBMWWdFM1dJazdyUGpP?=
 =?utf-8?B?MXZ4Ukd1YXpUZ3dVcGJFUThUQ3NqVE5va21lbk1QRmNDRm85OXNKMk1DYnFL?=
 =?utf-8?B?M0dUbzBiOE5qaS8rNVhFVSs1SWYrOWxVZkVOR291YkwyeWxLckcwZEVobTVp?=
 =?utf-8?B?RnZtS09JcTlTRXZwVEtEQXpWVDdMTTdVTk95elVNZ1BMSlJYSWlnbU1wMS9E?=
 =?utf-8?B?WC9iU0NSb0Z0U3BkN1hUUVR1MTlMcStsNUxrOVBhRXJGR2dTS1o5WkxncWo2?=
 =?utf-8?B?Y1RTMHZOUUU3eDFkeVluMFd5dU90OER2Z3RnYVZTd1g5cnFMdlZ6M3FLcFR1?=
 =?utf-8?B?ZGhFTEplc0ttQ05sSVkwWXBIQk5lcXZpVEtNd0lKeCtlVXRuOXVnclB3MVpk?=
 =?utf-8?B?WXordjR5dWNEVmhlaXVHZU9jMUN5Wko2RDlOb3g0empKVkQ5TWtEWnkvSlIv?=
 =?utf-8?B?aUhoa3BSWWdnbkJpK1U5cTFWblBIN2RUcXoyamxKN2U5Y2lRWGx2Y1pMNGFR?=
 =?utf-8?B?d1Zlb1U3U2FjK2NjeTNFVUc2Q2NHWVVRL2ptK2Vmcko3SStDcm41dFFqMG1I?=
 =?utf-8?B?aGJpdTdyVXBjUXdPcU15Mk5JY04vQkdkWDlaUkUvWFcwelp4VGNCWGNBcDN5?=
 =?utf-8?Q?e+sr9xuWQodkP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f978b66a-e13a-4046-5fac-08d91a064c0e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:07:39.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ9xESh7bPqPP46gnUi3rQoVs0x0EtVoRcnoEmtUbSvpoMGxzPYNVhzmB24JH4rE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a separate discussion with Daniel we once more iterated over the 
dma_resv requirements and I came to the conclusion that this approach 
here won't work reliable.

The problem is as following:
1. device A schedules some rendering with into a buffer and exports it 
as DMA-buf.
2. device B imports the DMA-buf and wants to consume the rendering, for 
the the fence of device A is replaced with a new operation.
3. device B is hot plugged and the new operation canceled/newer scheduled.

The problem is now that we can't do this since the operation of device A 
is still running and by signaling our fences we run into the problem of 
potential memory corruption.

Not sure how to handle that case. One possibility would be to wait for 
all dependencies of unscheduled jobs before signaling their fences as 
canceled.

Christian.

Am 12.05.21 um 16:26 schrieb Andrey Grodzovsky:
> Problem: If scheduler is already stopped by the time sched_entity
> is released and entity's job_queue not empty I encountred
> a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
> never becomes false.
>
> Fix: In drm_sched_fini detach all sched_entities from the
> scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
> Also wakeup all those processes stuck in sched_entity flushing
> as the scheduler main thread which wakes them up is stopped by now.
>
> v2:
> Reverse order of drm_sched_rq_remove_entity and marking
> s_entity as stopped to prevent reinserion back to rq due
> to race.
>
> v3:
> Drop drm_sched_rq_remove_entity, only modify entity->stopped
> and check for it in drm_sched_entity_is_idle
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
>   drivers/gpu/drm/scheduler/sched_main.c   | 24 ++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 0249c7450188..2e93e881b65f 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>   	rmb(); /* for list_empty to work without lock */
>   
>   	if (list_empty(&entity->list) ||
> -	    spsc_queue_count(&entity->job_queue) == 0)
> +	    spsc_queue_count(&entity->job_queue) == 0 ||
> +	    entity->stopped)
>   		return true;
>   
>   	return false;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 8d1211e87101..a2a953693b45 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
> +	struct drm_sched_entity *s_entity;
> +	int i;
> +
>   	if (sched->thread)
>   		kthread_stop(sched->thread);
>   
> +	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> +		struct drm_sched_rq *rq = &sched->sched_rq[i];
> +
> +		if (!rq)
> +			continue;
> +
> +		spin_lock(&rq->lock);
> +		list_for_each_entry(s_entity, &rq->entities, list)
> +			/*
> +			 * Prevents reinsertion and marks job_queue as idle,
> +			 * it will removed from rq in drm_sched_entity_fini
> +			 * eventually
> +			 */
> +			s_entity->stopped = true;
> +		spin_unlock(&rq->lock);
> +
> +	}
> +
> +	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
> +	wake_up_all(&sched->job_scheduled);
> +
>   	/* Confirm no work left behind accessing device structures */
>   	cancel_delayed_work_sync(&sched->work_tdr);
>   

