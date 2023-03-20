Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCA06C1CD2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 17:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F5A810E601;
	Mon, 20 Mar 2023 16:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA55E10E620;
 Mon, 20 Mar 2023 16:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIiwPN87+x8eX6MyDxhzqIdbrhINIXO4/lDVfZ4F6T3aaQlTH5oVRJQzTPNog0arTHwdYuIxgsMBFfHhxZ8x6+DjVCsHOEDFADuVbVfL+st4xDxj02KHfS5l8uT9ZLQo5mv2uVwwDkTm+kABpc9gM+naUX9OLZ1zETCbq5x4AoqljyIAV8mfOdWCPKdQVV6V2OK/YDwVCiv5Y9kS+btvdmOYNawwa5hioLJ4xVgf3+AIiAxwh6UczRIgxWxIAXu05T54epwKOISeQloBK6AguB1CxeNPG503jLsg71cRQ3Sfo6/mpuzc69TiGZ+TxJk9DpeKdvmkX1FQ9tYuoiRm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9d8g+D7cgBaHSkKEI1xXWyLloVAj2P0HYquGlLNu8w=;
 b=nl5voy+NScgRISPTGTFfRGHqozMqKo0yMlVAeUjEvwYWQr5BKwfA8YZlWfN3b45YFVWPSpwykc4tdJpv2VJVm4uuf0hzNqCsiKHVYT03HRzWsjvEbhQpNBMrT2vUzAdNwF8oJMfAYEqhPZ6cOYo9yz01eVYcCJ5vTVHcGC6KsgQOqcuyAPnIvORodx3Np+IH2fULoAJYBgn5/7bkNeX9SlWg2DjEuo15qIl3XpSlUIwl6dZG45yv+NdKa2QZSKRN4ye3l+OFRA8O2wEY2F0Omr9GMM1T3EtFw0xARqy0Zcr/dKJU1j3r1xtxGRduzX4dQsq9LnUFYJLO0ECDdbhpuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9d8g+D7cgBaHSkKEI1xXWyLloVAj2P0HYquGlLNu8w=;
 b=34rMvCeD2jObZx8vIf68p5W5B4uElUEiFE1gNyHHuQ4kyntPa0tIGmsaOI72TbwwF+0MdX9oX/nO7E36pcXQZCTtYw5fwnNNSqjvdHcfnoJAzOQONpnXXcpYysm1HE5APuWO6yAfjCCoFQny6zlZDWuy67UpkXfD3mqrwwXUhoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7297.namprd12.prod.outlook.com (2603:10b6:806:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:52:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 16:52:23 +0000
Message-ID: <25bd9a77-a703-6eb6-e142-5da9e54754a0@amd.com>
Date: Mon, 20 Mar 2023 17:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/23] drm/msm: Pre-allocate hw_fence
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230320144356.803762-1-robdclark@gmail.com>
 <20230320144356.803762-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230320144356.803762-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: c023df50-08f5-4aba-28a4-08db29637a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5Mw+iL0mPTy3qaBFr4FBOUFvAzDV3W6Qdlx5KhUB50lo0bvCP7N71EYD7b5aWbyoM/kxh6n/1h7cVKZzyr7zePi+tn9ZfoHgvX6iF/paaAtz1aaXl0tm+3NwJFL1iCMgYtkD/B+/tOMQxiQs/dZcSl6vGLg/S5Bs2FZfsGLVbi1dqfEkxXOdtO6Hwkl9S3coapTrqapwnDMHimYRsbNMXue/qHKhOhu2zL9iKw2nnw/eQiKaiVk5WTFTvhvt2hTneoHS4ldK5QzpJAwJ+hYW92iHhF26DPTAiOmzgQSh+jdm+DAPKKpu4Ajfz2YJdifG3cn9jYglH45HsfA/X4IMKhqi/Te8NYKDZpweAlcWDOxyzLwfKBnsCOb89C+ddPCJpjb3nTz6tkp5sRkk9RhVegPrzC2ZZkY2wCpyufzd7Wk1EKM2T/a4/ABr+d/LATTmWiDNMQO5w42Me15/MF4Mm5MCCzNdyZdZTt2bkFeVV4ZbGtxzVoo/Y6Rk+7F91RdXm/7aGX0XZSpiJAuXZMr8F0gNK5baJGRQV4GiYSnApg0PoZreoBHSH+j0gkQFHOL/d/aIjGc+SdvOct786OPxWZSFD9XNzUYQMCQ63BrWjm+1jLMQ5JhVBclFmRsK6t9xYYpLx6igsfgQP4P3leHRTGCWLm3sZBQcWxh0f56BIZKORazZhhU3mRhj0dgT56nIeLSZg7ebRHtbMTQWFPWxEAhmP7KRa2ahQ0yIYLVtOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199018)(316002)(54906003)(6666004)(38100700002)(66946007)(8676002)(4326008)(31686004)(66556008)(478600001)(66476007)(2906002)(6486002)(41300700001)(2616005)(86362001)(186003)(6512007)(8936002)(6506007)(83380400001)(31696002)(36756003)(5660300002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djJ3cEhvMWpUbWFtZXhtekN5Ui9VUXJ4bU92MmJQblhycDNrRDJCT2VYSzJp?=
 =?utf-8?B?YWpNY25HODM0Y21Zbm9Sd3k3UGZaV3RJRFUrSmhsVG82emtlclBreEVNZ25M?=
 =?utf-8?B?K2YyOVFPSTJWdm4zTTgvT0VYZ2ZxM3ZuTnZIa2NUaFdmdm5TRU9GKzAvOHVD?=
 =?utf-8?B?cUMzeE5lRHNDUVUwMFJsejh3TnhBWUFlR1BpQ1g5TVhDNVhhUm5vTzFQSElk?=
 =?utf-8?B?eHVPaDExeFRjR0Vnck9yQVBTa21lWnhCU3ZYanlYZzlsRXI3RTBmMy84YjV5?=
 =?utf-8?B?OWZnc0E4ZmZVNDZBcUZGRSszbVJ3M1IxcXpoQXU2aVUxMWxzUmdwN0Z5VktT?=
 =?utf-8?B?RWNqVnVuNldLa0NEaHl1VG5HcEE4QUxCWjJ2MW1vVUR4dTVPMzB6NFJMZElh?=
 =?utf-8?B?UnRZdlUyenh4SUFwcHZDL0Y0RGplSjAzRUQrS2syeU9ERlJITGFPak9RVlJ5?=
 =?utf-8?B?R1Q5UFpHQVVqamROckxBVGdaRGNpVjJieFRvd2RlQ2xCVUVacEZBdE92eXJG?=
 =?utf-8?B?UWQ4Z0lrQ3VsZGcwRjZQK29uNzIrTkpkcFI5QkYvbCsyUGNBTEhLb2VpeG1R?=
 =?utf-8?B?b1JaNlNodkJVTWlTb3cyQ0w0WTNkS0NhQVZUTElRVVdsSDd4U3ZaeDdVakxi?=
 =?utf-8?B?WDZieENMYnBtbWdFc3drMzRsK2RobDlicTJQYXF4RVNnbk8vS1paaDFubjJi?=
 =?utf-8?B?Vzc5RGVzTzR5dHMwaFpTQVNrSkRDNndlQmJONmpoUGJlQW1HZ0Ixdmo2SG9F?=
 =?utf-8?B?TGpIMW5EcUh2TXZQeGtWbGRuNWJ4c1ZvZk1xb3ZTY0d2Sk9MRlJ4WllUaEsy?=
 =?utf-8?B?RFNtcURoUlg4OE5TNzNnT2p0T25wbVlCZTRPYmZxMlRLRVNPR2prdVYvKzU3?=
 =?utf-8?B?R1I0OUNEcm1iTU9nNDJjRTYwSHAxNDNzSDhZVUFRR3JPMVlJbVZKcDJuRTJp?=
 =?utf-8?B?VHlVSVVEajVpTE9jc3prZlJTL1Z2N1M4MENZdmZWbjhTU3VNTXZqUGhHcG1B?=
 =?utf-8?B?NUM2MjZHaVBEemtsb3htMFppaHpMZXhLQStBMFQ2eS9aaVlSbGNFdHZ1bXNS?=
 =?utf-8?B?MXJPMFpYL2kyalVGNGZBdFpSam8zUldDdDJ1emFKcElsRXdNUUN4REI2bysw?=
 =?utf-8?B?dG5USnAwNHQ4YnNFV0o5WWNZR055aWFuVnNpTlM5YXpwN3VQdWtnVUJKRXh3?=
 =?utf-8?B?S0U5dWlJek5CVm11SldEbFhmbDNIYnI4VEc1dWlvaExCZ2E2UGJveFlXR1dY?=
 =?utf-8?B?UmNJb1g1dmd4RUF1UStrWXJYSkdGSzl3U0J4TnJEQ3hHNzdKMUZ0YUU0dlc3?=
 =?utf-8?B?bk1pTVVuMXRPSDFtWnZ1NzFjYTZrZHRmM2FYald4NmVJMmlTVmhlT2RIdHRh?=
 =?utf-8?B?eHZ6WkhGWW5ZK1ViTWZnWTR5MFc0YTBWbW5xTm54VnRzeHMzVVNZbkFMakxW?=
 =?utf-8?B?dTF2NXZmcG1rTWhhRnhWYW90bC9xQTJSQVlUa1NzblhZUWhaUy91aXFUbmpI?=
 =?utf-8?B?eE9PekhZb2g5ZG1JUG9TVE9jTHU5c0MzUkxyWXd3NU8ySmRqK25oVzFPT2l4?=
 =?utf-8?B?QXJNZDBQYVUvS21ISzB5WXFiTkprTTQ5SFd2OVY1M0trVW1YV1hDU1RsZEFa?=
 =?utf-8?B?NWhxSlBjSWtJUEpSejBwZG1XcWlldlNBaERoaU81LzdHNXV5c0QzMkhMMWVU?=
 =?utf-8?B?VlJ0OG9OcnBCMXI5ZXRhcU40NGxGSis5MkJobnpQeVJCSmlZSi9hdVpHRmda?=
 =?utf-8?B?SldxeHZKbEwreEJMR1M2N2ozNG81RG94aUxxcHJMQUxvME1jdmkrZzBIZ0hG?=
 =?utf-8?B?MjJ1UjRiZCttdDhpbDlibmVSZy9obE5xcDFGdndkZGtXcGgrRGlmNFNsN1F0?=
 =?utf-8?B?U1l0Q0dtTDJ5cjNueU16NWplbVZzM2lrZDNaQjRtNys5TGcwb3FmSHpXcS8v?=
 =?utf-8?B?MkVrNUluSy9hMlcyellXbGVlbWhUQUR6bEk2SDdPUVFJMU0yL3VKS2E1ZTh3?=
 =?utf-8?B?cThCS1dRVUw2ZktZTVdzUUJYNnVEUFdDR2x0SGpPeDNvbG9JUWY0L29Wd1dV?=
 =?utf-8?B?TFlwaWhYQ1NrMnRva1NaMkNiSjdDck13Z3pYS3FlbklPS0thOW1wYjluTWJr?=
 =?utf-8?B?MWV2cjJtUTQ2UjVNUUhzRmdlenJmQnlORlFhWHRoakw2bXk1bGZoV2tTMWtU?=
 =?utf-8?Q?va4O+tGu+RPyWc4jdayAVlIuRZtCUvrapq8OJMo/S9Dd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c023df50-08f5-4aba-28a4-08db29637a11
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:52:23.2002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdbn+sS7mUDRbNlJ9IjtrDYyx6vzQaP/ZyqAcdA8QhFt+/pzuaXSsLhajeTC9xOE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7297
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.03.23 um 15:43 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Avoid allocating memory in job_run() by pre-allocating the hw_fence.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.c      | 12 +++++++++---
>   drivers/gpu/drm/msm/msm_fence.h      |  3 ++-
>   drivers/gpu/drm/msm/msm_gem_submit.c |  7 +++++++
>   drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
>   4 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 56641408ea74..bab3d84f1686 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -99,7 +99,7 @@ static const struct dma_fence_ops msm_fence_ops = {
>   };
>   
>   struct dma_fence *
> -msm_fence_alloc(struct msm_fence_context *fctx)
> +msm_fence_alloc(void)
>   {
>   	struct msm_fence *f;
>   
> @@ -107,10 +107,16 @@ msm_fence_alloc(struct msm_fence_context *fctx)
>   	if (!f)
>   		return ERR_PTR(-ENOMEM);
>   
> +	return &f->base;
> +}
> +
> +void
> +msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx)
> +{
> +	struct msm_fence *f = to_msm_fence(fence);
> +
>   	f->fctx = fctx;
>   
>   	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
>   		       fctx->context, ++fctx->last_fence);
> -
> -	return &f->base;
>   }
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 7f1798c54cd1..f913fa22d8fe 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -61,7 +61,8 @@ void msm_fence_context_free(struct msm_fence_context *fctx);
>   bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>   
> -struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> +struct dma_fence * msm_fence_alloc(void);
> +void msm_fence_init(struct dma_fence *fence, struct msm_fence_context *fctx);
>   
>   static inline bool
>   fence_before(uint32_t a, uint32_t b)
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index be4bf77103cd..2570c018b0cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -41,6 +41,13 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>   	if (!submit)
>   		return ERR_PTR(-ENOMEM);
>   
> +	submit->hw_fence = msm_fence_alloc();
> +	if (IS_ERR(submit->hw_fence)) {
> +		ret = PTR_ERR(submit->hw_fence);
> +		kfree(submit);
> +		return ERR_PTR(ret);
> +	}
> +
>   	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
>   	if (ret) {
>   		kfree(submit);

You probably need some error handling here or otherwise leak 
submit->hw_fence.

Apart from that looks good to me.

Christian.

> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 57a8e9564540..a62b45e5a8c3 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>   	struct msm_gpu *gpu = submit->gpu;
>   	int i;
>   
> -	submit->hw_fence = msm_fence_alloc(fctx);
> +	msm_fence_init(submit->hw_fence, fctx);
>   
>   	for (i = 0; i < submit->nr_bos; i++) {
>   		struct drm_gem_object *obj = &submit->bos[i].obj->base;

