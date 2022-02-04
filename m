Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E704A97F1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 11:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3B010F510;
	Fri,  4 Feb 2022 10:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392310F4F5;
 Fri,  4 Feb 2022 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643971108; x=1675507108;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aPiWBsvja/fZow5K7GyBkKp0bTAHY+iiV2Z3OUT/0Gg=;
 b=Z8S/uY7eUDNizs3l7MVj5JsJ9UFZ1rJf5A6IL0C146VhjdRkM92WF6l/
 D0Lvvybrc2r8jUbCcgdu20Rx0jbJKbfNL1Xfs/BsknpYz6HH9oEprTBHV
 7/KZs+tiWDttY9xe10Qo7vHtdiZGcLZqGajV4rwYtv2grpJpkbRGrRTLs
 BDRYOc657Q90i5wyqbA+88i5A7+bl2Ncyru0cqUpzslk4bBC74NsGsOhc
 Wt2zToc+Scfk52knw5EA6gJ99mUgYI2M+ksgQVjpmkNWS9E1vnHmxCYdA
 CY5qbbqT1LZbGDOhw1J/Yw/adeW/isn6nb4MqNtMiul0utvNdgENAR4qj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="334741794"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="334741794"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 02:38:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600"; d="scan'208";a="627741601"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 02:38:26 -0800
Message-ID: <37889ae1c34026bba2cbddd4434cec11f9b1d4d3.camel@linux.intel.com>
Subject: Re: [PATCH 5/6] dma-buf: add dma_fence_chain_contained helper
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 sumit.semwal@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org,  linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Date: Fri, 04 Feb 2022 11:38:23 +0100
In-Reply-To: <20220204100429.2049-6-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-6-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
> It's a reoccurring pattern that we need to extract the fence
> from a dma_fence_chain object. Add a helper for this.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I thought I'd reviewed this one already, but in case I didn't

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>  drivers/dma-buf/dma-fence-chain.c |  6 ++----
>  include/linux/dma-fence-chain.h   | 15 +++++++++++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-
> fence-chain.c
> index 084c6927b735..06f8ef97c6e8 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -148,8 +148,7 @@ static bool
> dma_fence_chain_enable_signaling(struct dma_fence *fence)
>  
>         dma_fence_get(&head->base);
>         dma_fence_chain_for_each(fence, &head->base) {
> -               struct dma_fence_chain *chain =
> to_dma_fence_chain(fence);
> -               struct dma_fence *f = chain ? chain->fence : fence;
> +               struct dma_fence *f =
> dma_fence_chain_contained(fence);
>  
>                 dma_fence_get(f);
>                 if (!dma_fence_add_callback(f, &head->cb,
> dma_fence_chain_cb)) {
> @@ -165,8 +164,7 @@ static bool
> dma_fence_chain_enable_signaling(struct dma_fence *fence)
>  static bool dma_fence_chain_signaled(struct dma_fence *fence)
>  {
>         dma_fence_chain_for_each(fence, fence) {
> -               struct dma_fence_chain *chain =
> to_dma_fence_chain(fence);
> -               struct dma_fence *f = chain ? chain->fence : fence;
> +               struct dma_fence *f =
> dma_fence_chain_contained(fence);
>  
>                 if (!dma_fence_is_signaled(f)) {
>                         dma_fence_put(fence);
> diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-
> fence-chain.h
> index ee906b659694..10d51bcdf7b7 100644
> --- a/include/linux/dma-fence-chain.h
> +++ b/include/linux/dma-fence-chain.h
> @@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
>         return container_of(fence, struct dma_fence_chain, base);
>  }
>  
> +/**
> + * dma_fence_chain_contained - return the contained fence
> + * @fence: the fence to test
> + *
> + * If the fence is a dma_fence_chain the function returns the fence
> contained
> + * inside the chain object, otherwise it returns the fence itself.
> + */
> +static inline struct dma_fence *
> +dma_fence_chain_contained(struct dma_fence *fence)
> +{
> +       struct dma_fence_chain *chain = to_dma_fence_chain(fence);
> +
> +       return chain ? chain->fence : fence;
> +}
> +
>  /**
>   * dma_fence_chain_alloc
>   *


