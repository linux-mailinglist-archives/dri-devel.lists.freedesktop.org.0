Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07C413B1A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 22:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7834D6E81A;
	Tue, 21 Sep 2021 20:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DB06E81A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 20:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zdd3B5tvJaYnyaI4BTgalURiSRILIZ7yJ4nA6f6E+4apFAnwyCvkmqmainxusti0jRqilVzdoLLo7Q/3PDfStEARFdaFldofLTNg9C2sjHu7rEONVcWNlB64H98505Hlamrns5dubjok5+Azh1F2crr5CkWNfbGGpxXO4y3sKcWBC0XCOy2Is7LVRuqnO/aLyY+ulArafwwDldCfIFzSD7gxpGCWeCA1wVBt95UyE2aJPpzkk9nC31h4c5xQFm2yKY1a3hb7mGq60SbinGGVbGpdaTx+hRUGoyZPN4ggsPmu2tgXsdptNEo3twb+6Jv2y2iGng0gyUZPD4ePtOwzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VgIM5xG0gjzqEZUw722f9emfa3LgYAhjoMCdioLEN38=;
 b=lr8jFVtjmChG0HmCVXwLb7uJCQJFCaOh1vBNO1GQW+PqqWcAnq0KjxaSyF9bBljQymv4jMfPXh59BCANbFJnfAIPbFy3sHKCTMB9YhH9A3Hzg1swB3SRuUPkvPfbVtRa88GOWMLQF8Za660kvFCPSE0sD4qUN8BclQZrOk2IjB+LUMOZuMKhz73aYDb99WpX4a6dJQUCJUsxw6KLV7Yr8CkaZDSzJIE8M6muLVEW7im8qcianNw0R8GEwNedZRhXgPzUS903MSFhspleiHmxuXYYAQ7x/l12h/7izERqGrlG5XzyWnwT3hRi2rn9LNLIjewsIBpsjAXF5b4sGTKgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgIM5xG0gjzqEZUw722f9emfa3LgYAhjoMCdioLEN38=;
 b=Rvm3MF3R6B65x6ePhoDRgY0jOwQB2Gtn+K+Ofs6CdQhOW1GuHFRUHSB0jgkaKychE25/50Bhn9D/6MRmmc1yBc76NJaF6G7+LOyHPiagA/CUs4+Ze5ZSca4RkWQVrVRax/a2ReEmNSOBkUB3NMwyyTpnE3hviuNVTTqB1GhJ9FM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB1369.namprd12.prod.outlook.com (2603:10b6:3:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 20:09:38 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4523.018; Tue, 21 Sep
 2021 20:09:38 +0000
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <101628ea-23c9-4bc0-5abc-a5b71b0fccc1@amd.com>
Date: Tue, 21 Sep 2021 16:09:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903184806.1680887-5-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:591f:ecc8:119a:23e7]
 (2607:fea8:3edf:49b0:591f:ecc8:119a:23e7) by
 YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 20:09:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82dd1476-caf5-49b0-7324-08d97d3bbcfa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1369FDAB435CBEF5D2FA6962EAA19@DM5PR12MB1369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:239;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zs1ioHSAtXxhGGdgCgc/dGSm+ug8rJoxnys8SQH1E3kDiq2sD1O7QjGnqjRamsnvI+Fn1d6KReq/9agSKKVpY91YVlACw0KAARp8mPw313oUXqAsUnWR/iOWpk8ib6g1yAGje8XE8R/ONezfF+sx3PaDixaLRRNa3SGxl1tO5XdQn2dfJPMDeRtTB6j0vXnrFtYLjdHFeG1uHYDBUU07eTrdYCV5riV0OVzjw5Ra8Gh+qQ8qI7qhfMROyqMFNOiEYDToTEo2Dr0wByArWQJ3iNntzzc+1EB2IhuMFQJ3hm0WPrX1WCUaWqurHgWcxH0a9haAzg5bReSy2gkuGACXGSATuvPqbu36uxfygcMkOh6Rqdx/sEYhje1KZa7nE2HHz7eo7ryLOyt+3LF4+yQx9IoEoC8DTqq/mdz17CHeQHDrvvC1HeiqObr+N3UbYn85E3JbUDvMa9e9EOMNV6BZuUjZdN74qd8eKpjoboVYMoN0mMCR2WTRKr2KkRbCafGxseugxFLWzrswXfnewWuRudy8YtnQm7ToDc6ADWpuF9aRf1BygVBEdGJNUYuHmVN6UIR1m2E+M5NT/aIlpPH5aJAm6PTRXK1SWS9NW4r/nTmhrYKG1k/rxDM+m5NTY8mcA5j/t4FhAa60/KNLFyOlJKCD0J3P20e9SCwmEjEDnGJ2iQ3cZ2bwcV0uhVQ6AGv2R5ICMZK8L6O5o/zHu9OHU25tOj6r+YxruLVUiLj3D+A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(36756003)(31686004)(7416002)(66946007)(6486002)(54906003)(5660300002)(53546011)(186003)(44832011)(2906002)(8936002)(38100700002)(31696002)(2616005)(83380400001)(86362001)(4326008)(66476007)(508600001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEQwaVgrZ1kzRlJaOWU5eVlyUStoQUx5R1dsM1FxR0VDSzhuUFNhVjA2amlP?=
 =?utf-8?B?MUdIaWhBTjI0QThsYmpjZjZhdlJpd04yamZvdGNJakI5N2lhblJ2RmpsQWVl?=
 =?utf-8?B?dExkWWdqaEtzSUdHZmJjQ1VRYXFoVURwVWNCVlcxU0d2OGJlc2E0TGtHbFRn?=
 =?utf-8?B?Zm1qNjR0azgxaCtQNUZyQ2dEWmRWNjBMVGRVdTg1T0ZXcGFTRTg0RDlGOHQy?=
 =?utf-8?B?VTMveUZWMUp1ZnBXOWx0TXNOeFdKWmlqRWNtQjJ2Z1NRUThSSFFaNWdReDFt?=
 =?utf-8?B?dW1iaE1hK0dqbHdqRjB1aXRjeWNtT2dZZlVlRzJaSmlIakUzWFozaVNXbHFI?=
 =?utf-8?B?c0dJcWFPWEVzTVJWT25FYnVNWURlL0xHK0kyTzZIcEhzWDNIVzgxWkFVUzVy?=
 =?utf-8?B?VlV6S0JUVWZ2ZUtsc09IQ0UxbzRKNXpBT2t0SHFXNXovZzN5S0RudEc2MHBT?=
 =?utf-8?B?MzVaa1dHYVd3UmtXYTBFeDk1c0dSeWlpNnNqcFFFbnhnNHpyaTBESlBmUlZx?=
 =?utf-8?B?ZnlvRFJsUmJZTmVnS2ZJUU0yejNSeUNHSlJZZmFCalNpaUl5SGUyWmxQNmw4?=
 =?utf-8?B?OXlLVEVDZkJIUUNmQTNFck9zUFUyRDdEVlBmUUFkTzNGRHFZQ2ZTYmxndWRW?=
 =?utf-8?B?SzlYS0RvcDlYd2NzZ244WHNXTWNQbDV3ZHg1OU1zTHM5cTdFQ210U0daSWRD?=
 =?utf-8?B?YnVHSmZHOVlXclVNY3RKd0xRNmpsK2JYR1lNZ01JNVhRUkR6cnA0SGVvRGR5?=
 =?utf-8?B?U253Zmk0TWk0aWdmN2NBL0tRdTVkSDY0bTJIRzR0VUw1T3VQY1dxRlp1ZXZE?=
 =?utf-8?B?OG5MZEJpbnFZRVp5WWVEcDllMDFvR1BKN2ZtSHZ1L1JRVkw5VjJhT2ZDam4w?=
 =?utf-8?B?U1luKzl2Szc1VFRVQ1BBajVlaW1EMjF1R0J0WVhiZUxzNWpzV3FGT3RCYlp0?=
 =?utf-8?B?NVY4MkVrOWF2YVc1UjJlRnpmRnpjZ3k4akhiTDNKT2h0eWJhV0dCYVNJZ0ty?=
 =?utf-8?B?aUtJUUlDc3FpWmNhUnF0b0NId2N6bkFPbkg1V25CZmR3akRXY2ZzSjRzeVZ4?=
 =?utf-8?B?cXNKTytJa25KK1VSNkRwdHJTU1AvYi8xMUx4SElNNmd4WGJQczdQRGZnS3Yx?=
 =?utf-8?B?SzE2a0pjbWdvcjFKL3NneGJhelBwSDFxbHM2VHpIWUh0QjNsQmU1US80VDQr?=
 =?utf-8?B?TXVweXJpZUQyZjdwc2NKcWpCL3JjSVI0TUVoT0huL05PaEtPQTdPT1J0UXBh?=
 =?utf-8?B?VFN3dTdsWjN2eDBVSTI4c1I0YXNzUVBZa1lFZ3VSRHBjQms3NG5iYTJQUXdx?=
 =?utf-8?B?bks3NEY3cGZwWmNFcXZwd09HV1pNdFhyVmxmMmEyUlVEU3czcW5wc3ZhcVJM?=
 =?utf-8?B?bHFkM3Jaand0OXN3SDNFOTkzTjBLbnBhKzdDa2IwNU5LQzhWUDVKaDRwSGsx?=
 =?utf-8?B?S29ZMXpLbWxhVHZ3ZklSdzd3V2g4TFBzeENpTkh6MFJWNkFuczRhdDZnNkxr?=
 =?utf-8?B?VUxtOEYzNXQ1WjlqeWtkc3JMVUJRSEZaRGRrRmsrSXpqRVdNMm80N0hTNFI2?=
 =?utf-8?B?bjRyWVdsUjRBVVlzNnJtSW9uR21FeFEvTjVYWWlyVzNsaXhaWGJEMWxhQlNB?=
 =?utf-8?B?MDVvTmg4TGdVcXliZEhGazZDdkZhYUI3UUM3SE9vclV5dFYxbWNOOEJXbHFu?=
 =?utf-8?B?VlczbWYxSnI0S3dmMENhT3Vyek5uZks1MSt6RVBsTWFNMkhKckwwem8yWmZ3?=
 =?utf-8?B?S0R3L3pJcFl3b1pTeWVaSWIrMnB5aWdyZGhnQ1htbVdMK2hVTHFwSzVFdm9k?=
 =?utf-8?B?T3JwaC9DYll0SHNVazBaRDZxNkUvaTdsK21GeENsRXpXZTRYRDg2S2N3Sm80?=
 =?utf-8?Q?280jXNzvSwfaN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dd1476-caf5-49b0-7324-08d97d3bbcfa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 20:09:38.0026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYIjpTkLSgKqIxF5naMuaYLvTk8Ytx5iiFGxfuJdaovhtBmcaWXV9NwMMoohbKeyEuVBKTQHQ5rUZoNTpNmiWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1369
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-09-03 2:47 p.m., Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> As the finished fence is the one that is exposed to userspace, and
> therefore the one that other operations, like atomic update, would
> block on, we need to propagate the deadline from from the finished
> fence to the actual hw fence.
>
> v2: Split into drm_sched_fence_set_parent() (ckoenig)
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>   include/drm/gpu_scheduler.h             |  8 ++++++
>   3 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index bcea035cf4c6..4fc41a71d1c7 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>   	dma_fence_put(&fence->scheduled);
>   }
>   
> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
> +						  ktime_t deadline)
> +{
> +	struct drm_sched_fence *fence = to_drm_sched_fence(f);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fence->lock, flags);
> +
> +	/* If we already have an earlier deadline, keep it: */
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
> +	    ktime_before(fence->deadline, deadline)) {
> +		spin_unlock_irqrestore(&fence->lock, flags);
> +		return;
> +	}
> +
> +	fence->deadline = deadline;
> +	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> +
> +	spin_unlock_irqrestore(&fence->lock, flags);
> +
> +	if (fence->parent)
> +		dma_fence_set_deadline(fence->parent, deadline);
> +}
> +
>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>   	.get_driver_name = drm_sched_fence_get_driver_name,
>   	.get_timeline_name = drm_sched_fence_get_timeline_name,
>   	.release = drm_sched_fence_release_finished,
> +	.set_deadline = drm_sched_fence_set_deadline_finished,
>   };
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>   }
>   EXPORT_SYMBOL(to_drm_sched_fence);
>   
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence)
> +{
> +	s_fence->parent = dma_fence_get(fence);
> +	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
> +		     &s_fence->finished.flags))
> +		dma_fence_set_deadline(fence, s_fence->deadline);


I believe above you should pass be s_fence->finished to 
dma_fence_set_deadline
instead it fence which is the HW fence itself.

Andrey


> +}
> +
>   struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>   					      void *owner)
>   {
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 595e47ff7d06..27bf0ac0625f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -978,7 +978,7 @@ static int drm_sched_main(void *param)
>   		drm_sched_fence_scheduled(s_fence);
>   
>   		if (!IS_ERR_OR_NULL(fence)) {
> -			s_fence->parent = dma_fence_get(fence);
> +			drm_sched_fence_set_parent(s_fence, fence);
>   			r = dma_fence_add_callback(fence, &sched_job->cb,
>   						   drm_sched_job_done_cb);
>   			if (r == -ENOENT)
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 7f77a455722c..158ddd662469 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -238,6 +238,12 @@ struct drm_sched_fence {
>            */
>   	struct dma_fence		finished;
>   
> +	/**
> +	 * @deadline: deadline set on &drm_sched_fence.finished which
> +	 * potentially needs to be propagated to &drm_sched_fence.parent
> +	 */
> +	ktime_t				deadline;
> +
>           /**
>            * @parent: the fence returned by &drm_sched_backend_ops.run_job
>            * when scheduling the job on hardware. We signal the
> @@ -505,6 +511,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>   
> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
> +				struct dma_fence *fence);
>   struct drm_sched_fence *drm_sched_fence_alloc(
>   	struct drm_sched_entity *s_entity, void *owner);
>   void drm_sched_fence_init(struct drm_sched_fence *fence,
