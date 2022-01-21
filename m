Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C145C495ABE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639DA10E902;
	Fri, 21 Jan 2022 07:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAE310E902
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750384; x=1674286384;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=j6D2M5eJcGFfscpsShMvN4Ex93Qg3ANgb4qLkoAi0Oo=;
 b=AZkhAlGN9wmL2cYrHxox6sCkPnsCQw37pyhsF9BMHw6KENaMn0V/SytX
 45AxKokQIRXX+wXfNJJsWdwGHmVHiToNEpGjaFcUoQ4vm05FddTC7vx7b
 9GgWW//B26F2vzQ8wzBjfmv/h9gq7R1h7fwoa/+WbX/2eiQ8PFSDXYx/e
 n/3jjAdibTV01Nuchb/BP4WXyZKk3tz/rDVdND3nTg3n8UZr9gBNJssvR
 hbmkCvUNMtK3YbhGed3fW3rj8KmlN7gWoqeobQRiDBHwuXFnv7UJGXKeO
 OqeoLOenVTzLJBgRnJ7xagOoLYusVnDl/WQSDEbCn/OL0pa6VmlERHUzo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="270007882"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="270007882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:33:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533168548"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.132])
 ([10.249.254.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:32:59 -0800
Message-ID: <ca907ad0-9199-d13e-5033-7113d732d476@linux.intel.com>
Date: Fri, 21 Jan 2022 08:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [PATCH 3/9] dma-buf: Warn about dma_fence_chain
 container rules
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-4-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220120132747.2348-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 1/20/22 14:27, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
>
> Warn about that when we create a dma_fence_chain.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/dma-buf/dma-fence-chain.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 1b4cb3e5cec9..fa33f6b7f77b 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -254,5 +254,13 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>   
>   	dma_fence_init(&chain->base, &dma_fence_chain_ops,
>   		       &chain->lock, context, seqno);
> +
> +	/* Chaining dma_fence_chain container together is only allowed through

Nit: Multi-line comment.

Otherwise, Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> +	 * the prev fence and not through the contained fence.
> +	 *
> +	 * The correct way of handling this is to flatten out the fence
> +	 * structure into a dma_fence_array by the caller instead.
> +	 */
> +	WARN_ON(dma_fence_is_chain(fence));
>   }
>   EXPORT_SYMBOL(dma_fence_chain_init);
