Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAED69F318
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 12:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EA610E807;
	Wed, 22 Feb 2023 11:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2481B10E1C0;
 Wed, 22 Feb 2023 11:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBSOf4gDDg4VEA+0v9nqivzlVuZqmm4Uj5xF5W7NjHazkHxwPTycjLZjOsRxksA429DbiB1745j7YmaJx6NDLK1U05GnLO22u2uZh3cgwAGluu+aGjGEp0aGFOeBGXBW4GFPtXTaRK9jVWUnLFPt/pCqjOAd/03oRQnIKENiY0/UtPuKL4s9RE8opi4zZ7rjYCLZToVI0/HU+X43xHWiJulSwlRmLLYMNp3/6eq+ryzWmK8shPVDVVY4mLOMp4AAHERW3IJKIzYo6ke6wXTPmFus2+eGadl22sKCa3lcwfanVwS83lU21fZ9qNY+RTs2Qth18rwXD/m2XhMyogap7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jlfcYPUTSLmU+Hm+u46D5s/HQSMBjI3mN8gB8KisP0=;
 b=EpZ72gOq8NlMG0kFb/3LL9IwDEDrxF0ikq9yTfyobCry/i87G+RhQ8YQhKfMv80ZA463VcbH/eUhFFiopXQjrXXnMWCnFJrjA/v/0xXG56KYkfAqezsKVSRZl6DLbRzoK6wYZuyiOO/Aom5qdV23CJ7lFV0erNAvRDRTSRVSzAK2t1SBRPELAxsDy+v18IYzJKqR4pGUr36JfiMrUo0vosNEe9E3y8+hDs7TBQKhxLHfrYKHr4B2MEVmzRBWHGZJx0RI5xZC4uv/s7IbIc642j9PwfyUbFBxGITKANyd3EFQVilPRpG8qI9O2rxA5fueFg6s8AXR55W7EXuyPuVqhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jlfcYPUTSLmU+Hm+u46D5s/HQSMBjI3mN8gB8KisP0=;
 b=ek65xw3DudBOk5Mk7OB5gebDPHoNXiULKDCsrW8wP1Kf1MOaXhGrsqJZuLJC5VlMflh1c5afPGXgpYYQZwOsu1W6nFlCV0H+GVKudGh0RCYtsHF+Q+XXc0UKy2eHnHbrJP5WNJA8JFbou56UWx1jM9rx+RbNYjZUhkc72+f1Ggw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 11:01:58 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 11:01:58 +0000
Message-ID: <7e158702-19fe-594d-6c94-5b5378848521@amd.com>
Date: Wed, 22 Feb 2023 06:01:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-CA
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-2-robdclark@gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v4 01/14] dma-buf/dma-fence: Add deadline awareness
In-Reply-To: <20230218211608.1630586-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 8382c51c-1521-455a-b117-08db14c4372f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WiT+SMuIZguggGauLnBVv1RAzuzHIJXcXOupMcuAJOF2NLnioQPLIbFKvOu7tlDS2xkDWEdBPWJpsv0NRZ5kgTw34qk8wkU2RPPoyRDaM1g/rS+2z1Ckr1vYTFutWj2HQfy3xSBoRT0UulFZoI8UDFLaeG0oIuVnfOCfaeFsL3aj3NosIQllrY1bMdAe0pMRmDr4+fcjIebu5ce9TlxUlf0hlI42rN1aDHMlmWP22oGq9NfAUkHLGPT5G5c+7GDN0AIEgEuyfPcXLbAnvEePnsoQklIUHZ7WbyhnqQqQlRKCgVbULE32UJyBT3Ai4FCBD1+VtJD/5rSgK1IVHMp+YvKkDPpWgM6rnC7ITW3x/I0CXt/+gPfeGrILG+J5TBKKLlLnvW/UOOlSoGVOpRydV5Heo2jkz7t4fE967MYPSO01jcSwL+xpew/t71mv9KEZjXZmA6DFcBLQ9GJ8xIunzezbigv497gJ3mKzFzSdKK0ACY1vAxs7wxEua1u+Fvf2Z8q2rvZyY3aQMzxJMD+UZo4QfNgJGUdcSJF1GHJ3e6I620Gpn1kpNxiOx0b47LRO0IWBHlUwtSvdT8oUaka35Y/dS1LKJv10fFgTTfwxJj6ux7JX3hpM2J8WDWHK6FGnsBtRxkzGQK43CJVc9gLxyMxWpgzkt8xOska9k9pFwtcRpQ7mE6lUhnielObVsrAEB3aH/vsxX+NB8Lr4JB9Ep8jmuDy/hCmr22tI9Wuicmo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(31686004)(66574015)(36756003)(5660300002)(2906002)(44832011)(7416002)(83380400001)(6486002)(6506007)(6512007)(55236004)(53546011)(54906003)(31696002)(478600001)(86362001)(41300700001)(6666004)(2616005)(38100700002)(186003)(26005)(66556008)(8676002)(66476007)(316002)(4326008)(8936002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andCU1Jnc252dTBxd09Fc0RueGhPL2RNODhQNlIyT2dYeCs2WWxucHN0K3Fu?=
 =?utf-8?B?ZEc2ck1XNXpMY0tvRE1leVJPQkhBblNIZC9lWHFQYVZ5OC9DSjNPdkUxOENa?=
 =?utf-8?B?L0RlOU96Y0JEdE9saWpIdmdxN3hpM2w0M3dEYm1XTjZROE9UYTcwUExDMkRO?=
 =?utf-8?B?cGRoNkxsaEhvUkFud2dmMTNyZXBNMkdGdzF4c1ZFc2g1YTJwUW5zRFRramFK?=
 =?utf-8?B?SlJyOW1sKzhWcWdiN2dJV2huNjFpNlVYNUFreDZIazc3RkR3akFOSkpJeVAw?=
 =?utf-8?B?UG9xcmx2R0x4NFd2ajBDL0I3QVQ0aWpnWUV0OGdONlEzTXR0UWYzM2Q5VElN?=
 =?utf-8?B?UzdBamNxeXU2eStPS2dsT1dFRHl4bkV4dU5PNTcxVFp3eU1YMjJOZXJNY3ZZ?=
 =?utf-8?B?WjhWNTR0OFhkR1Z6M0RNOHNuWk5QcjkrSFYrRUtzVU1SK1RlSFFBTm9hL1Nv?=
 =?utf-8?B?YjgrU1BlbjZDUHdENVgxbzhCQ1NJN3NsMnpkaGU4dEhxUTlBRlUwSG1VL1JD?=
 =?utf-8?B?R0hyTHNiamVGRDg1dUcvNWRkWnFNN056cmx2OGdGYzdhUG05cXdoN2ozUkwv?=
 =?utf-8?B?Y2MzMUZQMmVWZW4vc3g2alNOQ1hzSHJMblo0QlhmSE1SckxiYXJaL1poUmtt?=
 =?utf-8?B?SmNlSDJIbXBmUm5yYnBqdStjYVZUZUIrTG5WczdPUlcwcTZ0UVJnM3lzQTB1?=
 =?utf-8?B?UWQ1RlNhRTZsTzlIMHJpUnY4YndhYUlxYkU5dzdKZEZma1dXR3I3QnRUejh0?=
 =?utf-8?B?VG1KbkdTanE5clgrV3pLdUVndStsUC9TOGVQUWluSXFEcFhDdXhvZ0oxaGx4?=
 =?utf-8?B?bTYrOENRWFB5Sk1RMkUydnZzcWRad2Z0a1hxYW5WZmdkWHYyNGtNYTE5WkY0?=
 =?utf-8?B?SGI3bm55bjBBOXZabGtxWVlRWXdNNVJieUxmMVVYOVBhdmFUamZXdUQ0VGlS?=
 =?utf-8?B?UHpnMi9oUkdrUXNHbmllMmdtU3NENnZsQjlaSFlkVGQ5eGFHeCtLMkJBRHhp?=
 =?utf-8?B?ZXJ1TjYxWlc2RDQrSWRicFdkVUhZWFRyWGY2UmFNbWd5Vzd5WW1YV25nRlF3?=
 =?utf-8?B?ZDZ1RmdkdVRteHZpK1FLS3JZN2dmRzhKUS9zWHZrSFpjamVmWmNzUjUzaHo4?=
 =?utf-8?B?bmRiTWlhQkxEaEpZY0Z4ZjhPS2svS3BnU28rckNYZURTQ0VHYmFlYWNicFp4?=
 =?utf-8?B?d281U21nOXpSWFNSVDZCOUJLTFNJbTFKdy8vR25JcGxmOWRSSUM1bzg5RWtC?=
 =?utf-8?B?NlI2ZFg4UTZWKzdpamphWDZuTGlZNkJ3bjFsVHI5YVQvWHhIRHZuNkRLYlFG?=
 =?utf-8?B?UUNkbnduczRGYVdad1pEWC92blNMOXZkSXJmR3BVdW5WdFBHNGxETENUWmJv?=
 =?utf-8?B?N1VvM3kwbjVWWWRWd3NyOG9nL2J3SkQ4Q2Q5MmZTZ2ZMUnp1V2NyYlBQZW9V?=
 =?utf-8?B?WVBUNmtxS3MvYXU4c3ZWanhsRnRMZTJQeHkwYkxseFNFSjRHeWhUQVFlRmZD?=
 =?utf-8?B?RjlpU1ZSWHdxUDl3OWI3SmgvQ2V1Q2o1UDM5V3MwY2xzbThMdHNBb3ZmRkVJ?=
 =?utf-8?B?REtQaGlCdWlJVFV1ZWFHNktiMVpnMlV2Z2FtUXB2NzJNTm1pd0diOXhEeHRq?=
 =?utf-8?B?RjdJUGZqU25JQVhEOWtLQmx6ZWhUTWhvbHZJNFpWMHdpdFA2cytScVUrOXhy?=
 =?utf-8?B?aHNPUTJsZ09jcS83UGd4ZHBlWnRlcldFdVQwNWlZdjBhUlF0RUdnNldqeHlX?=
 =?utf-8?B?TEI0MXhOSGVTWVlOaHJybm40c0lrckdvV0h4akk4dWVyUE50aGw3VDBuQ0Fu?=
 =?utf-8?B?SGtQM3NESDVLcy84L0ZKdG1BNEtRZWdEckdkSGQ3OXc5T3JsYmlWZmRZWVE4?=
 =?utf-8?B?VC9MTVgxcDdtamlwZDAvbVNhN0hYRlFraVRrZWxzSmZwdVVxWk1paUQrTm1R?=
 =?utf-8?B?RjBvdmF1cFJUdE5DK1o2RE95S0g3ckxUOTJpUmt3ZktrQ045cmdiWHRHczFt?=
 =?utf-8?B?cFM0UngwV0pidlFhbmx2emRCQ2hGLzZYaDVoWjVIQmE3bkZTL3Z3dDM4cFkz?=
 =?utf-8?B?aHhsNUZqd3ZVUjAxNlRSUzFxcmwxQmRmRVJZS0tGeXFzSk9WN1doYTAxeHNK?=
 =?utf-8?Q?ad7hZ95luVnnt4XdQ/TeG2/ka?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8382c51c-1521-455a-b117-08db14c4372f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 11:01:57.8824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvPbPrYnOXOMX0pbPG+9VwOtueSZgrAKnJ9aPmNwGMdQ5s7+0WBRuCJ/KNNo5hbd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-18 16:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
> 
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>     deadlines, to avoid increasing dma_fence size.  The fence-context
>     implementation will need similar logic to track deadlines of all
>     the fences on the same timeline.  [ckoenig]
> v3: Clarify locking wrt. set_deadline callback
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
>  include/linux/dma-fence.h   | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0de0482cd36e..763b32627684 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -912,6 +912,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>  }
>  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
>  
> +
> +/**

The added empty line above creates a problem for scripts/checkpatch.pl--and
there's a few others here and there. It'd be a good idea to run this series
through checkpatch.pl, if at least informatively.

I wasn't able to apply patch 13 to drm-misc-next or any other known to me
branch, and I didn't see base tree information in the cover letter. I skipped
it and it compiled okay without it.
-- 
Regards,
Luben

> + * dma_fence_set_deadline - set desired fence-wait deadline
> + * @fence:    the fence that is to be waited on
> + * @deadline: the time by which the waiter hopes for the fence to be
> + *            signaled
> + *
> + * Inform the fence signaler of an upcoming deadline, such as vblank, by
> + * which point the waiter would prefer the fence to be signaled by.  This
> + * is intended to give feedback to the fence signaler to aid in power
> + * management decisions, such as boosting GPU frequency if a periodic
> + * vblank deadline is approaching.
> + */
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>  /**
>   * dma_fence_describe - Dump fence describtion into seq_file
>   * @fence: the 6fence to describe
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..d77f6591c453 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> +	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>  	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
>  };
>  
> @@ -257,6 +258,23 @@ struct dma_fence_ops {
>  	 */
>  	void (*timeline_value_str)(struct dma_fence *fence,
>  				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of
> +	 * an upcoming deadline, such as vblank, by which point the waiter
> +	 * would prefer the fence to be signaled by.  This is intended to
> +	 * give feedback to the fence signaler to aid in power management
> +	 * decisions, such as boosting GPU frequency.
> +	 *
> +	 * This is called without &dma_fence.lock held, it can be called
> +	 * multiple times and from any context.  Locking is up to the callee
> +	 * if it has some state to manage.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>  };
>  
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
> @@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>  	return ret < 0 ? ret : 0;
>  }
>  
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>  struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);

