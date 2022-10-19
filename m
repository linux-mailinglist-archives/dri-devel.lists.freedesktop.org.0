Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D57604CE3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3330210E77C;
	Wed, 19 Oct 2022 16:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060110E2B0;
 Wed, 19 Oct 2022 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196147; x=1697732147;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dfWDiMe3d2D8E/NvgwinfFtmSAsdDdVyZNhRoSAWGhI=;
 b=VfPKU/5L7DEUUuLFbi6KggN1dlq1AyeiTtVVkuw+B/Izw/C2VyeHFCQU
 kjmBbK2dkK/q0Mv4t+zpnGXzV9lGcCd6IdpfnqzyGdbvhYGI+4j8TbUBC
 DHy/ZTmuNFn79Rtm3PCR8nCJf5Vja850zMreXbrf0NkyJKTa7i8xojKPW
 VxFTS5pJmEkXaRDsBL4P1ImmdSK53SbhzzJmyFXamX1/M7neVqw/O9fXn
 ZxNYBNZqJGGujYLt1Y98c3rqwRm93zvbbKUCYcQ7XQ9ZWSmBfRT0EWFwF
 fMm3yhc19a6akNxpLDd1Aer5m7gnKCJRWRmKA+4zNN2mz92dAa2ue1xlS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="308145500"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="308145500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:09:39 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698146722"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698146722"
Received: from abyrne1-mobl1.ger.corp.intel.com (HELO [10.252.27.172])
 ([10.252.27.172])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:09:35 -0700
Message-ID: <5b8f3280-908d-df3d-e237-9de294326621@intel.com>
Date: Wed, 19 Oct 2022 17:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 14/17] drm/i915/vm_bind: Expose
 i915_request_await_bind()
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-15-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-15-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Rename __i915_request_await_bind() as i915_request_await_bind()
> and make it non-static as it will be used in execbuf3 ioctl path.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 8 +-------
>   drivers/gpu/drm/i915/i915_vma.h | 6 ++++++
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 4975fc662c86..ab89e907f2eb 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1884,18 +1884,12 @@ void i915_vma_revoke_mmap(struct i915_vma *vma)
>   		list_del(&vma->obj->userfault_link);
>   }
>   
> -static int
> -__i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)
> -{
> -	return __i915_request_await_exclusive(rq, &vma->active);
> -}
> -
>   static int __i915_vma_move_to_active(struct i915_vma *vma, struct i915_request *rq)
>   {
>   	int err;
>   
>   	/* Wait for the vma to be bound before we start! */
> -	err = __i915_request_await_bind(rq, vma);
> +	err = i915_request_await_bind(rq, vma);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 04770f8ba815..19e57e12b956 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -54,6 +54,12 @@ void i915_vma_unpin_and_release(struct i915_vma **p_vma, unsigned int flags);
>   /* do not reserve memory to prevent deadlocks */
>   #define __EXEC_OBJECT_NO_RESERVE BIT(31)
>   
> +static inline int
> +i915_request_await_bind(struct i915_request *rq, struct i915_vma *vma)

Some kernel doc might be good?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +{
> +	return __i915_request_await_exclusive(rq, &vma->active);
> +}
> +
>   int __must_check _i915_vma_move_to_active(struct i915_vma *vma,
>   					  struct i915_request *rq,
>   					  struct dma_fence *fence,
