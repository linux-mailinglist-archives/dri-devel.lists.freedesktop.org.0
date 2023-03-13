Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5C6B6FDF
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54F10E45F;
	Mon, 13 Mar 2023 07:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4A510E45F;
 Mon, 13 Mar 2023 07:14:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoF5mncloM8XdZfpFTapDwL6Z4Btpe+VZ9XQNOKK2Ug/NbR9ZyliJRBPvXSYLkebBXteWj41RRryaxSu3S/DyLTg9VMsPY+A6dEM/CvrT4s5KbqdSE8oPsyi38SC8byBmRinpzCVg8amH2Zq6YbhnAoYNxyHLmbeqj+FJ+cPfTTYfkKJNJ3sY5++n2bvB3rmRr4lDGBqjsCeBVJ9MI1Xgtne8Ul0TbtOZhr2g0+KpJnRYoG/9SzPw3ysR1OnM/i3Fg87HmvoCSzlEObQvHlfTrj+oASTNZFAfIoWvkMHYfTeQjp1X2rqGue0R1dG67WqdYEkTEorWkFmjvcNUN+ngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNKASwhWnj0+V8fAuOu0kSapKGVv2O/0u4q4MzcrOMY=;
 b=V2Rk2Ls7TkIAF4StnhiKfMZhdzKNfNRwdY0iJlO43LpoCTA3+uWtTfSWNRQk7VrZePT70EZkwTGOv5sOso5CaOyphniW09ezoKHQrOIGCKGh2iaXE53tGxT21xc/dY42bva1bClIsBmnVDk3oqlbThGMNXuQXCpcAmqNiDhUYjio0zkBo0JQg2DkWoqnnnRr9lRgprLR2Cy61zbjyGgagJuBPjdEKWCu7eXTGvQ4zH8rYyzPiL3+ND+jXoYGCsDwD30Kd6ZtLBz0ZELbNLtBr531pe9eVQAX4nJPMvjk0Kc3knhgE2MB3b9fS3HMXdjowApceh53xubjOl7t3Xywog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNKASwhWnj0+V8fAuOu0kSapKGVv2O/0u4q4MzcrOMY=;
 b=U7vuKhIdedcCc8SGhCQApDkLHxYQNZ+FCA0QCEFcKOkbqWAzi1r50/5NvqcstIqbDfflDFl4CHGipNTAZDPGUPMGEje7eAnoaGdhwWy9wOpXTuJaKJ7zJDgG/wA8IRxB/uJh4JesCYiKARLx0zs4HHcOtr6/xwo5ai4IbcR32Ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8845.namprd12.prod.outlook.com (2603:10b6:a03:538::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:14:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:14:05 +0000
Message-ID: <1e3d4830-4797-8cc2-5882-02de44424ec7@amd.com>
Date: Mon, 13 Mar 2023 08:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: Add dma_fence_init_noref()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230311173513.1080397-1-robdclark@gmail.com>
 <20230311173513.1080397-2-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230311173513.1080397-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 2115dad2-0ed9-4f4b-9a88-08db23928799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbGWYZTPPuU39sndv4/Vo79q4DBKCyHbxlHSD38zF7hHliqSHIH0gTdSH4njegJbVRA4J19jEj8XCHKlTvViFhWp/YUF7b2BVfJd+MGRhUUcUx/SIfkAVB9GK+CxEwQiO+KxdJjY24r2zcJiTkse+jGrqzjzSwyRYNfOVeA/UuTyHLtgNNhd36X0mXs3pNFNFS4MGkmCaTN1uat+7O1uG6c0E7xN9zDTYayEjIGp4F31m++EJ9IGeuTcy5f5gSHsJpp+eQzX7A8grzuG1ynCFMVxHkdI1CsYGt8A23H9Jr0dMNEtazoqrxM1fQeXhtHAC8bV2H0mPS9QSCrcCU2aWEbTOxR6AYPmlsPL3Xey/VlSuFfVgogzGv1buCE+B4u1oobN1pbUf2wCtN5r1lJqAlVRUFtXUPtWzO2hUl6yuMOwGgTL5rSDGhoALoNWy+e1E3htZFuMrMToKNarCQv/FztdK0um99LmLcOifmEdFOhBKdsijavOnSGvMiCsDrMCT+jvYrrm2vR+aSiY6VwoRgnXTS0eLIsm3waBReiBr/7B+JNrX8MQ3mTmavkFBH3sEUiRqU1V4nm8HRyumiUHZrsqmjQM8eTUodwAex78JifUTsojnJTCqmcM6kLp63Jc6kXyv8NuMrP3poIuEE5YemN12VLfnzCkOtM6KS5tGYSS/21mfPf0FCzflU9VLMVQFYbcL7MgXpE5aF9qPIwrrApQhcicZwQ5/ihgm1xB8Zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199018)(31686004)(54906003)(41300700001)(8936002)(478600001)(66476007)(4326008)(66946007)(66556008)(8676002)(36756003)(86362001)(31696002)(38100700002)(26005)(6506007)(6486002)(6666004)(186003)(7416002)(5660300002)(2906002)(316002)(6512007)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBoVkhUZGk4U09zdkw0M0d1a1dVTXE5T0IxQzF4ZU5tOG9YbTE4UG9kZjJy?=
 =?utf-8?B?MnprZThzc2dLVjJNUWtPNVBtRjRVcVdldm5OZHNRYXd1K0pRT1cwdmRpK2Nm?=
 =?utf-8?B?NzZOT2dCeWlTQTJpMjg5dHYxNlFRbVpkeFRSS2o0Zi8vMFpRaEJVQ0ZTNFVP?=
 =?utf-8?B?NnZWS2hNM1J4aTgvYTlvSS9LY01jNmFtd01KVEVrNGRLL1p2amxwaGZhVklP?=
 =?utf-8?B?ZHVsSzN5RjdVRkg2RUdSVDJwOGppV2ZYazJIbTUrNUVJNTg1RkpzZnhnME1X?=
 =?utf-8?B?YlV1S0VKNVBpeXl5aFlkbnBESzQ1MVJVNVhzR3lPZDFrd0NudC96RDlob0pv?=
 =?utf-8?B?Qm1ndnNRekRLc0dtVDB0bnpkNzBobjZIQktQcGQvQnI4VmhqemhhU2kyOUF1?=
 =?utf-8?B?K3RkWEN5NnRyTTBRVVQ4OTVCOWFvc09vK1BtM1EzV0dHcG1ITjBvalBCcU93?=
 =?utf-8?B?eXBkYU5Wck42dnBYeEd0Q3g3MjkrdG1pQW1uZmE2cXJKWFU0RmVuN0NMc3Nm?=
 =?utf-8?B?YzF1UGFXb2l2a0lXVHVKWkU0V1RjYlVpcnZUV3NBVlUyTmtKZ1oxYkVZbW1H?=
 =?utf-8?B?VFJEN21lVDZDZWIydTNmTEZRVFhicGU5OHdUeDB2STRLaXExOWxUL1Zsbkto?=
 =?utf-8?B?RVhBZG05RGZOVEhNTlphL2VhRE5lMlJMeXY0QzVTNklZTTRoeG1aUTViUEFp?=
 =?utf-8?B?VTdtbFU0Yjh6THowZEdkelN0Ylkwa1RCVmV1blhqcGx6YU5IVUMyeXQzdDFi?=
 =?utf-8?B?MDg0WW1LN0VWU0tZVUh4M3dXSHpWdzhPYldCVno3bzNrQ2RJT1RYVTVyWThX?=
 =?utf-8?B?K1UvQ3lpTnROMTdzT1V2VU8zSXFVcjhOM2tUSlRPTTViWlNCa3hOMnNSK0NG?=
 =?utf-8?B?TTBMbHRIRUxPa215ZUlMUFBnUkw1QVY1Q3BEWlU5c3VJQUFlSDV2TVFjZFJE?=
 =?utf-8?B?UFRCR3ZtYlJFZGJtWlhNOXlxeFJXU0Z3NkoyaTVFUVpyRVIxSzk2aDdZOWlW?=
 =?utf-8?B?QU5lUGs4djNaS3JCbjIvL3NZWGpwYTZvYXJyQ2tJdTEvOGlvZ29xNHNBSjhi?=
 =?utf-8?B?RzJaT2c1U1ZzcVR1TjM4Qk02bmRsU2h4NUpKRzFiNWpXcXh0bHFPQXQ2NkJv?=
 =?utf-8?B?cU9wQWpHeXZINXUrM3ZoL2J0NWYxV0xrN1lrOWRFZ05nSDduYkFXWXRWSm50?=
 =?utf-8?B?VUdKMTZJaXp3K01hazBkcVhyZ0NYZmlmRmo2a2hwN2NML3NDZ3JYSk1WYnU5?=
 =?utf-8?B?T3lUZnVBRVhnLzc5aFU1clJJVHZLYWh4UWZsSDNLZkFOZ25FNDJ6eVlOejkx?=
 =?utf-8?B?SlFqY0tVZVdPMURwQ1ZFUzZDL2srYnpQODh0b3Njb0Exd3RrTGw4TE9hLzB2?=
 =?utf-8?B?VUU3ckNBdTlDWnpGZHFwWFZxYjdUaFg4R1pFYVhNNHNpalJHUWNiN200enRY?=
 =?utf-8?B?eVlZK1FvTHdtbG9zcFA0WFR1cVlSSUdqdW1rRm5uQWtYZDQ1ODhpM25zNXg1?=
 =?utf-8?B?cXhFZDYvVGxkdVNIeTN2c25lSkxEdFhMTjAzelF3aVk1WUI5MHRjU24xNW9k?=
 =?utf-8?B?a2Nqb1ZsSjUvQXlXM3haOHJxalBNV3hReGVkeno2b3AwdFpOOXFUK3BLanlx?=
 =?utf-8?B?emRhQWFaSWd2QXlRU2hWdGl3VmVFM3ZwQ3puMnR5VkNtSEUrelJ0YzdRbDQz?=
 =?utf-8?B?RnE5anNmUHpha1RUWm5OQTNucDN2djBrQnNRbTBvQkpNcjhoaEdXMHl5elk4?=
 =?utf-8?B?eXl6VWZuN2FyVzFTOE5WeFZmczBmbkd3S3N3czRFb0JVWmZyY3crMC8rMFVW?=
 =?utf-8?B?cXFsUUFJanVIa1Y2ZnpXa3NrQ0xTV0tibDVPYXorQk5iU3FpMEVSUGw0WXVT?=
 =?utf-8?B?UkVzMU9zMUNEa29QaSt3WGhsOVFsQTV6V0d5RWJvNXk2NXRmSUhNd0E1VlhT?=
 =?utf-8?B?UzArSGtwYkFXVW1wbGxyR0hXTUR2a1ZRMEZ6cVpYdmxzczJYNjhKcE12TGYx?=
 =?utf-8?B?YzJsV3ZJVGZrL1dZdzJLcG9WN1JJQmRGQ3lUVHFWNXZGa3JoKzNNWFZCdDA2?=
 =?utf-8?B?Zm9Ca0kzSlNhYWJJbkwrV05raDZ0dmRZUW1rKzZkdm80Qm15d0NKRVFsaWJz?=
 =?utf-8?Q?5g2XCfUo0DOBV+D63/wOp1nO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2115dad2-0ed9-4f4b-9a88-08db23928799
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:14:05.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFXrh7LglSsqodMWtvS0Kuz+Vxr6LRaMDYzNqDg+2yfI0U5A2tLS2B10gLUKqf9A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8845
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
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.03.23 um 18:35 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Add a way to initialize a fence without touching the refcount.  This is
> useful, for example, if the fence is embedded in a drm_sched_job.  In
> this case the refcount will be initialized before the job is queued.
> But the seqno of the hw_fence is not known until job_run().
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Well that approach won't work. The fence can only be initialized in the 
job_run() callback because only then the sequence number can be determined.

Regards,
Christian.

> ---
>   drivers/dma-buf/dma-fence.c | 43 ++++++++++++++++++++++++++++---------
>   include/linux/dma-fence.h   |  2 ++
>   2 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 74e36f6d05b0..97c05a465cb4 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -989,28 +989,27 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>   EXPORT_SYMBOL(dma_fence_describe);
>   
>   /**
> - * dma_fence_init - Initialize a custom fence.
> + * dma_fence_init_noref - Initialize a custom fence without initializing refcount.
>    * @fence: the fence to initialize
>    * @ops: the dma_fence_ops for operations on this fence
>    * @lock: the irqsafe spinlock to use for locking this fence
>    * @context: the execution context this fence is run on
>    * @seqno: a linear increasing sequence number for this context
>    *
> - * Initializes an allocated fence, the caller doesn't have to keep its
> - * refcount after committing with this fence, but it will need to hold a
> - * refcount again if &dma_fence_ops.enable_signaling gets called.
> - *
> - * context and seqno are used for easy comparison between fences, allowing
> - * to check which fence is later by simply using dma_fence_later().
> + * Like &dma_fence_init but does not initialize the refcount.  Suitable
> + * for cases where the fence is embedded in another struct which has it's
> + * refcount initialized before the fence is initialized.  Such as embedding
> + * in a &drm_sched_job, where the job is created before knowing the seqno
> + * of the hw_fence.
>    */
>   void
> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> -	       spinlock_t *lock, u64 context, u64 seqno)
> +dma_fence_init_noref(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		     spinlock_t *lock, u64 context, u64 seqno)
>   {
>   	BUG_ON(!lock);
>   	BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
> +	BUG_ON(!kref_read(&fence->refcount));
>   
> -	kref_init(&fence->refcount);
>   	fence->ops = ops;
>   	INIT_LIST_HEAD(&fence->cb_list);
>   	fence->lock = lock;
> @@ -1021,4 +1020,28 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   
>   	trace_dma_fence_init(fence);
>   }
> +EXPORT_SYMBOL(dma_fence_init_noref);
> +
> +/**
> + * dma_fence_init - Initialize a custom fence.
> + * @fence: the fence to initialize
> + * @ops: the dma_fence_ops for operations on this fence
> + * @lock: the irqsafe spinlock to use for locking this fence
> + * @context: the execution context this fence is run on
> + * @seqno: a linear increasing sequence number for this context
> + *
> + * Initializes an allocated fence, the caller doesn't have to keep its
> + * refcount after committing with this fence, but it will need to hold a
> + * refcount again if &dma_fence_ops.enable_signaling gets called.
> + *
> + * context and seqno are used for easy comparison between fences, allowing
> + * to check which fence is later by simply using dma_fence_later().
> + */
> +void
> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +	       spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	kref_init(&fence->refcount);
> +	dma_fence_init_noref(fence, ops, lock, context, seqno);
> +}
>   EXPORT_SYMBOL(dma_fence_init);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..f617c78a2e0a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -279,6 +279,8 @@ struct dma_fence_ops {
>   	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>   };
>   
> +void dma_fence_init_noref(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +			  spinlock_t *lock, u64 context, u64 seqno);
>   void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>   		    spinlock_t *lock, u64 context, u64 seqno);
>   

