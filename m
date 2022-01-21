Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0687495AB7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1731010E8FC;
	Fri, 21 Jan 2022 07:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11610E8FF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750278; x=1674286278;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ASOROsILjd0PMR1PX1r+grUH0Atx+d5KkMA1O6KZxbA=;
 b=h+BHa9tp0SPUOnmr9nlCL0zvAfIlxp+5fsI0OYzW//3apmsQmAQHpWdD
 JMnUzDHWZFPqmNWAwL533YSB9WBQYDFkQO3YlpHIuRFJ8Xr4JDMywlj8k
 8JK7itSHHTK8BOJCHSJY+qq8qHsMggNO34b59k5jyrxYXaka5s6vDA6vI
 wkujL/T/UgWgvYcNrFfre7FXWViUNJ1vtQ+DRZDRZ0bOGrU8Py63COejK
 glpu3A1V14q13XFdqVx3H+YFVCxT4PoEADlTiud7woA6uSC+oYn9MDizf
 AzgoldW952iMS/SQah4rY3tPI+njBpbSAOMGHJXyZf+8yFE16fk7fErpH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245374515"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="245374515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:31:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533167635"
Received: from hekner-mobl5.ger.corp.intel.com (HELO [10.249.254.132])
 ([10.249.254.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:31:15 -0800
Message-ID: <be78e61c-992c-4fa6-7a2b-b9b93310a34d@linux.intel.com>
Date: Fri, 21 Jan 2022 08:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [PATCH 2/9] dma-buf: warn about dma_fence_array
 container rules
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20220120132747.2348-1-christian.koenig@amd.com>
 <20220120132747.2348-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220120132747.2348-3-christian.koenig@amd.com>
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
> It's not allowed to nest another dma_fence container into a dma_fence_array
> or otherwise we can run into recursion.
>
> Warn about that when we create a dma_fence_array.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 3e07f961e2f3..4bfbcb885bbc 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>   
>   	array->base.error = PENDING_ERROR;
>   
> +	/* dma_fence_array objects should never contain any other fence
Nit: First comment line of multi-line comments shouldn't contain text.
> +	 * containers or otherwise we run into recursion and potential kernel
> +	 * stack overflow on operations on the dma_fence_array.
> +	 *
> +	 * The correct way of handling this is to flatten out the array by the
> +	 * caller instead.
> +	 *
> +	 * Enforce this here by checking that we don't create a dma_fence_array
> +	 * with any container inside.
> +	 */
> +	while (seqno--)
> +		WARN_ON(dma_fence_is_container(fences[seqno]));
> +

s/seqno/num_fences/g ?

Thanks,

Thomas



>   	return array;
>   }
>   EXPORT_SYMBOL(dma_fence_array_create);

