Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411A66B7003
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0193D10E47D;
	Mon, 13 Mar 2023 07:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255B010E47D;
 Mon, 13 Mar 2023 07:19:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZvJMeSKWw/HPWETsLMZ8NIpvbdfRFHo+IHn1rv7+yIWlJvq1GGnyzwh1c/uoLee+Wgu07fu18hNx2zQuIVMWsnJDn2wOvykI2Q9J80TnTx/KNFL3Lny9GDG/cFrZu2fHSvVNWf5zSjaUG1712UA7cj/xjwQefQNoMUXx7U1AyioObT60YImGqAO9hKo0DujLCcuGcGtiRPU0Pwha6YU05ayk7Y0YJwUGHFB8FS3uqGWEXsbDswFmFFZtVv3KW7rWL8ekV6y5e/MlTFzDFsOkblk/fW51pWGBRXPRZ1GlbggEkztvioLLbf+GBuU9MP59kFOUJVveNmqSL+UjqvQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqwZcyhsA4gaoTTKxeKX//rLEC8WLF8RGyStnX3KsXc=;
 b=n08OMcb3hx7OcX1O3dyujco+1HVc/XA+aPbEIIK6zaGQ3IuAyVtzUCJlZXHrufFwf97q2Ab5p/ggUeQJvSRWDuyfkllUGDUM5Noy6EWo3Zmb86R8tNGvUQy38NATfG7XzWaLkLhzFu9JcG/4QvdjkkfxeZbkfKEM7kM+a9T5tm0bb6min4cWAbfZ/VkJKCevyZOWsCiU9Mf8vSghffm3YQ2R5z2p6n3XwHGWsSxAXojqBwJFSHstx+QSCMFeMri4/mwoa5voyIF32Wdgip3w+BMKYiLwWbKBT2MBHtqlw2aLt1rpmcD2KrCtDtHoKtNB2v+0VTd+SKulRnDQtbXR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqwZcyhsA4gaoTTKxeKX//rLEC8WLF8RGyStnX3KsXc=;
 b=jl2pyBtGPMp/llM09ugH2jzkZ0X+SwOVb1SPtm7sOj59R4zJoV8MOrHlrMaXgmw1FyBfwJKzMFJONX8oH0e86EAoByun538MF2RNTzoXXjxC9lXtubVrrt6xLtrWHnKy7qsdISVzEmPOdYC1WWe/R3YvlAr0p3iGRFkwiY2wiXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8845.namprd12.prod.outlook.com (2603:10b6:a03:538::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:19:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:19:33 +0000
Message-ID: <b846101c-e6ef-2d3e-9db9-077003b72e57@amd.com>
Date: Mon, 13 Mar 2023 08:19:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] drm/msm: Embed the hw_fence in msm_gem_submit
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20230311173513.1080397-1-robdclark@gmail.com>
 <20230311173513.1080397-3-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230311173513.1080397-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0b3085-30ea-4867-b11b-08db23934b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bBCjCyBK6516qkqvggqR+Ljft5QWzBIg+lctTGiurguLoJGUUQN6VJArxAHgn5Jx9qbz9B6l6nVRn6hX0BeehCduB+FGECt5r0Tp24+YnAFJ04pQL1mhASqRLnuUjjK0q0gfWeDdRgf0RZp5YeyFodDvRw2tYeLPWD2QFQm/LvSlpwi9PBfVFPaaKRA6djiT9CQqpMHYnf/37yVHL7svV8NZ5uTV/5lns+iUMGA8nzbbbYDktBJIttQGs/UoaFChqtugY0TXgVvLs3VPMopNH1NOb4gfq5CBcwdvRsN3kbg00wEcDOZ/OhHeQkFvO/9MSqptJFZVmgWScrSnif7JFHmI7t1O7fhU/2ZkRaDid0HcIgRC28NNs3AIKMm6AETXJZN5sqogsxoLsQXxZQFlVZaPcITuIsUS3IY0OfJfGrU9MWyP3FvcyoOXwhFKHojCrV/uQjUpMM9z1hr8l8IdmZMRaKCQzG2i5bIA4QdGYZm0J1IvIqP0IPJhun65E5IH6gM73A8RA/dM8+IuRMFc2YjL1EoiT+V30PBKqAqKgHQTmBcCusJ9rJo5oA08YPy/08BD7dwRJk7hgisv80JQAXruBWKwQEq0DrV+ERlG4rF/Iy9u+dJBzcvynyqApwmnbgiIbKC1Nq3PeN7fssFgP68s+Azb+0j7txWQKt+JXA7aBLrOM6UmKRschu1hEV0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199018)(31696002)(86362001)(36756003)(38100700002)(4326008)(66476007)(8676002)(66946007)(66556008)(41300700001)(8936002)(54906003)(6636002)(110136005)(478600001)(316002)(6512007)(7416002)(5660300002)(2906002)(2616005)(83380400001)(6486002)(966005)(186003)(6666004)(6506007)(26005)(66899018)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkdBTTVPV2pnenhVQmRoSHRVYk1LWXU5OXFlUjhJSW9TcHptNWFxa1d5Tmh1?=
 =?utf-8?B?RDZ2czM3ZU9CM0pkZVFJdmtRM1lMc1VscXMzN0VQT0J4bmxKbVNndGV0STRF?=
 =?utf-8?B?bzgwUDRON29SdEhrZjdyWWFXRDkxM3cvMDhjbWo5alRwOVpnZ0h5TGc3Q2hN?=
 =?utf-8?B?Z1hCa1dTakFuQnVhanA4WXZzTWRjUG5zdE5sUFhjaTdSc1ptQ0ZCSzJQNFR3?=
 =?utf-8?B?SURScXZSa09xSU05YWJ3MlcyYnlTdmtaRG8wbTY4Tm9UK2IyY1VERnVseCtY?=
 =?utf-8?B?a2ZtWm9BWlkyenJDZWhPNXIvQ2JOdWZleitMSldqVTdXSGtkSi9GZkZpU1pD?=
 =?utf-8?B?NjRLZ0hid2NVdC9DZTlnSTJZei9XSjlkbVVhNjd3ZHRDZEZhUFFpVmloeG8y?=
 =?utf-8?B?S0VRZmhyRWNEZnFqMHd1alFFVEhyYk9YK2VVd1Z6SVJCYTlqVTY0cHdvUUJO?=
 =?utf-8?B?Vk9IbVhDUW41ejJMNHdGLzA3b3NvdXJBOHdYRjJ5dDhqMEdWQTVmbzMySWo0?=
 =?utf-8?B?TW9NK0svaUQyOWx5eE9raWhZZWZRMlU0VDllaSsyU1FsbFYzcUpldjRjaHRE?=
 =?utf-8?B?MWJKTHdTcGJ2ZWo4M0R3ZUNLeWlRdXY1YVNtWk80RTc4WHRYNko1WjBkNXRU?=
 =?utf-8?B?V215eDRlNTV6UXI5ZmNmL09xYWE4ZFprZEQ4UDZ5Y1pJeFlHRnduaWQyRmpI?=
 =?utf-8?B?aEhQVmVBNzlVWG01ZHpIN2FvZkxNNDBqU3IvQU9lcE5wbUZmVnl2dmx1NW9z?=
 =?utf-8?B?NXcrQTNleU1qV2NQVlhuekljZHhMTFZGZm5xYkRkSHRBL1dYNUhaZHFzNXYw?=
 =?utf-8?B?UFdpTms0S044MWErVythaTlmYU1TczVxMlFyZGtvL0ZrbTV0OWNBRENIVTZa?=
 =?utf-8?B?NnE5SWJXeU9uYk1oUm9ONUx3djFHMkc5ektFb2tLUEVMUHBFbnNZMkw2a2Nu?=
 =?utf-8?B?WXU4VkdEK00zTXNoV0ZyRzljZUdLUGFGTUNaMG1HMS9RQm5WL21zcmVTZ1JD?=
 =?utf-8?B?S2NQZDZmemsxL2NSZDEvN0t4RmVHWjB1MmRTR2dxeW13QlJ3NnBMMFlYODdW?=
 =?utf-8?B?YnlOZEQyTTdzOG5xcVgrdkRPMFhCZ1VLakswQjhwdlNRdDFOU2VjeUhRWkFG?=
 =?utf-8?B?LzNGVUlPTDczQW4xRnk1aGZYaVhRSk5ZK2wyaTVsekRIWFBsUmlZR2VHbDRR?=
 =?utf-8?B?azF0SE9tcnhVTmJMWVdZcENNRFZiQzIzZWkvczVLNUR6dktUNzZUTEVXTTh6?=
 =?utf-8?B?eHpURE1xUkdnb3F0QTJZakIyRzc5UHRmWWIzOWFyR080c2UwOG5kcG5zQlBz?=
 =?utf-8?B?WEJocGdaelN6WjA0cVRXdFNtR2UvRHFVZEJUTHFNRkROTTlzcEJ1eFZXeEp4?=
 =?utf-8?B?ZUdLZ1loQ3loRGdidkNuKzc4ZVJTN243M2JLVno2K0pBRkN0ZjdmTWRjUmow?=
 =?utf-8?B?cWlZRmJoemRDdGdpbGN1WUFBcjRNSlpLbTJvekFybUlFdG9yajFjeHFkQjVT?=
 =?utf-8?B?Q1N1Umx5Y01qVFR2TVZRTTBXSjArT05xWnFZOXVZWWttcHEzcllCRnlrazlk?=
 =?utf-8?B?ejhZTWNQWFBHT2xqL2ZhWVN0U1g0Q09ldGppK1VtSmVHZHcybXRUWjYvRFhM?=
 =?utf-8?B?MUFCS3VpU0FyQ0ZLblFvWUVVMW5tTHExOGlGK0FKMUN0bFRvVmpPVE5Zd2tH?=
 =?utf-8?B?ODEzc1Mrcks4WkJuNGwvQmM1Q0hGRkNlQXBISW4vdHVkUGRrNDVzZ2hib2k1?=
 =?utf-8?B?VU9SMElqU05tbDBJK2w3MFo3Y3N2cEpMMnFIRm1wVzdMYUkvOFZWc0p5R2hy?=
 =?utf-8?B?WEpVb3VCU2dQRWdKZnFnM29vcC9Mczl0WjJJaDF4WWZTa0JnYlFOcEVmakMz?=
 =?utf-8?B?bFQ4eW5VdVZOYklwUnFuQ3pVRE94R1ozOWpNUXNyM3BCZmFkVkZlRmd4aVY5?=
 =?utf-8?B?bVc4U0dSb1l2eWhkZ1NPODQ5TTEvNk9oS01qS3EvYzlIRkpOMXFncEkwY0wv?=
 =?utf-8?B?dnV6TTdhSkQxVExJaEEzYXdYUTBnMVAybnVIcHZLdkRwSU1ackNSVTdLcGt4?=
 =?utf-8?B?WU9tRGVBSi9oZC9hcFZST1VMU3NKZS85OXRFUHF0d0xGQkRPcEtxa00zQlBi?=
 =?utf-8?Q?gIftAYX6P1y+ZbaE1BUKXLx7w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0b3085-30ea-4867-b11b-08db23934b59
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:19:33.6734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaqSw8BrjmThl9aTObYckNPwvc8DK+0KNtBS/CWFX8MQEafOS0koW+D7xhoLhhN2
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.03.23 um 18:35 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Avoid allocating memory in job_run() by embedding the fence in the
> submit object.  Since msm gpu fences are always 1:1 with msm_gem_submit
> we can just use the fence's refcnt to track the submit.  And since we
> can get the fence ctx from the submit we can just drop the msm_fence
> struct altogether.  This uses the new dma_fence_init_noref() to deal
> with the fact that the fence's refcnt is initialized when the submit is
> created, long before job_run().

Well this is a very very bad idea, we made the same mistake with amdgpu 
as well.

It's true that you should not have any memory allocation in your run_job 
callback, but you could also just allocate the hw fence during job 
creation and initializing it later on.

I've suggested to embed the fence into the job for amdgpu because some 
people insisted of re-submitting jobs during timeout and GPU reset. This 
turned into a nightmare with tons of bug fixes on top of bug fixes on 
top of bug fixes because it messes up the job and fence lifetime as 
defined by the DRM scheduler and DMA-buf framework.

Luben is currently working on cleaning all this up.

Regards,
Christian.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Note that this applies on top of https://patchwork.freedesktop.org/series/93035/
> out of convenience for myself, but I can re-work it to go before
> depending on the order that things land.
>
>   drivers/gpu/drm/msm/msm_fence.c      | 45 +++++++++++-----------------
>   drivers/gpu/drm/msm/msm_fence.h      |  2 +-
>   drivers/gpu/drm/msm/msm_gem.h        | 10 +++----
>   drivers/gpu/drm/msm/msm_gem_submit.c |  8 ++---
>   drivers/gpu/drm/msm/msm_gpu.c        |  4 +--
>   drivers/gpu/drm/msm/msm_ringbuffer.c |  4 +--
>   6 files changed, 31 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index 51b461f32103..51f9f1f0cb66 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -103,14 +103,9 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>   	spin_unlock_irqrestore(&fctx->spinlock, flags);
>   }
>   
> -struct msm_fence {
> -	struct dma_fence base;
> -	struct msm_fence_context *fctx;
> -};
> -
> -static inline struct msm_fence *to_msm_fence(struct dma_fence *fence)
> +static inline struct msm_gem_submit *fence_to_submit(struct dma_fence *fence)
>   {
> -	return container_of(fence, struct msm_fence, base);
> +	return container_of(fence, struct msm_gem_submit, hw_fence);
>   }
>   
>   static const char *msm_fence_get_driver_name(struct dma_fence *fence)
> @@ -120,20 +115,20 @@ static const char *msm_fence_get_driver_name(struct dma_fence *fence)
>   
>   static const char *msm_fence_get_timeline_name(struct dma_fence *fence)
>   {
> -	struct msm_fence *f = to_msm_fence(fence);
> -	return f->fctx->name;
> +	struct msm_gem_submit *submit = fence_to_submit(fence);
> +	return submit->ring->fctx->name;
>   }
>   
>   static bool msm_fence_signaled(struct dma_fence *fence)
>   {
> -	struct msm_fence *f = to_msm_fence(fence);
> -	return msm_fence_completed(f->fctx, f->base.seqno);
> +	struct msm_gem_submit *submit = fence_to_submit(fence);
> +	return msm_fence_completed(submit->ring->fctx, fence->seqno);
>   }
>   
>   static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   {
> -	struct msm_fence *f = to_msm_fence(fence);
> -	struct msm_fence_context *fctx = f->fctx;
> +	struct msm_gem_submit *submit = fence_to_submit(fence);
> +	struct msm_fence_context *fctx = submit->ring->fctx;
>   	unsigned long flags;
>   	ktime_t now;
>   
> @@ -165,26 +160,22 @@ static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
>   	spin_unlock_irqrestore(&fctx->spinlock, flags);
>   }
>   
> +static void msm_fence_release(struct dma_fence *fence)
> +{
> +	__msm_gem_submit_destroy(fence_to_submit(fence));
> +}
> +
>   static const struct dma_fence_ops msm_fence_ops = {
>   	.get_driver_name = msm_fence_get_driver_name,
>   	.get_timeline_name = msm_fence_get_timeline_name,
>   	.signaled = msm_fence_signaled,
>   	.set_deadline = msm_fence_set_deadline,
> +	.release = msm_fence_release,
>   };
>   
> -struct dma_fence *
> -msm_fence_alloc(struct msm_fence_context *fctx)
> +void
> +msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f)
>   {
> -	struct msm_fence *f;
> -
> -	f = kzalloc(sizeof(*f), GFP_KERNEL);
> -	if (!f)
> -		return ERR_PTR(-ENOMEM);
> -
> -	f->fctx = fctx;
> -
> -	dma_fence_init(&f->base, &msm_fence_ops, &fctx->spinlock,
> -		       fctx->context, ++fctx->last_fence);
> -
> -	return &f->base;
> +	dma_fence_init_noref(f, &msm_fence_ops, &fctx->spinlock,
> +			     fctx->context, ++fctx->last_fence);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index cdaebfb94f5c..8fca37e9773b 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -81,7 +81,7 @@ void msm_fence_context_free(struct msm_fence_context *fctx);
>   bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence);
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>   
> -struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> +void msm_fence_init(struct msm_fence_context *fctx, struct dma_fence *f);
>   
>   static inline bool
>   fence_before(uint32_t a, uint32_t b)
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c4844cf3a585..e06afed99d5b 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -259,10 +259,10 @@ struct msm_gem_submit {
>   	struct ww_acquire_ctx ticket;
>   	uint32_t seqno;		/* Sequence number of the submit on the ring */
>   
> -	/* Hw fence, which is created when the scheduler executes the job, and
> +	/* Hw fence, which is initialized when the scheduler executes the job, and
>   	 * is signaled when the hw finishes (via seqno write from cmdstream)
>   	 */
> -	struct dma_fence *hw_fence;
> +	struct dma_fence hw_fence;
>   
>   	/* Userspace visible fence, which is signaled by the scheduler after
>   	 * the hw_fence is signaled.
> @@ -309,16 +309,16 @@ static inline struct msm_gem_submit *to_msm_submit(struct drm_sched_job *job)
>   	return container_of(job, struct msm_gem_submit, base);
>   }
>   
> -void __msm_gem_submit_destroy(struct kref *kref);
> +void __msm_gem_submit_destroy(struct msm_gem_submit *submit);
>   
>   static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
>   {
> -	kref_get(&submit->ref);
> +	dma_fence_get(&submit->hw_fence);
>   }
>   
>   static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
>   {
> -	kref_put(&submit->ref, __msm_gem_submit_destroy);
> +	dma_fence_put(&submit->hw_fence);
>   }
>   
>   void msm_submit_retire(struct msm_gem_submit *submit);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index be4bf77103cd..522c8c82e827 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -47,7 +47,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>   		return ERR_PTR(ret);
>   	}
>   
> -	kref_init(&submit->ref);
> +	kref_init(&submit->hw_fence.refcount);
>   	submit->dev = dev;
>   	submit->aspace = queue->ctx->aspace;
>   	submit->gpu = gpu;
> @@ -65,10 +65,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>   	return submit;
>   }
>   
> -void __msm_gem_submit_destroy(struct kref *kref)
> +/* Called when the hw_fence is destroyed: */
> +void __msm_gem_submit_destroy(struct msm_gem_submit *submit)
>   {
> -	struct msm_gem_submit *submit =
> -			container_of(kref, struct msm_gem_submit, ref);
>   	unsigned i;
>   
>   	if (submit->fence_id) {
> @@ -78,7 +77,6 @@ void __msm_gem_submit_destroy(struct kref *kref)
>   	}
>   
>   	dma_fence_put(submit->user_fence);
> -	dma_fence_put(submit->hw_fence);
>   
>   	put_pid(submit->pid);
>   	msm_submitqueue_put(submit->queue);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 380249500325..a82d11dd5fcf 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -716,7 +716,7 @@ static void retire_submits(struct msm_gpu *gpu)
>   			 * been signalled, then later submits are not signalled
>   			 * either, so we are also done.
>   			 */
> -			if (submit && dma_fence_is_signaled(submit->hw_fence)) {
> +			if (submit && dma_fence_is_signaled(&submit->hw_fence)) {
>   				retire_submit(gpu, ring, submit);
>   			} else {
>   				break;
> @@ -760,7 +760,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   
>   	msm_gpu_hw_init(gpu);
>   
> -	submit->seqno = submit->hw_fence->seqno;
> +	submit->seqno = submit->hw_fence.seqno;
>   
>   	msm_rd_dump_submit(priv->rd, submit, NULL);
>   
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 57a8e9564540..5c54befa2427 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -18,7 +18,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>   	struct msm_gpu *gpu = submit->gpu;
>   	int i;
>   
> -	submit->hw_fence = msm_fence_alloc(fctx);
> +	msm_fence_init(fctx, &submit->hw_fence);
>   
>   	for (i = 0; i < submit->nr_bos; i++) {
>   		struct drm_gem_object *obj = &submit->bos[i].obj->base;
> @@ -37,7 +37,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
>   
>   	mutex_unlock(&gpu->lock);
>   
> -	return dma_fence_get(submit->hw_fence);
> +	return dma_fence_get(&submit->hw_fence);
>   }
>   
>   static void msm_job_free(struct drm_sched_job *job)

