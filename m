Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A677BF337
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 08:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7735C10E31A;
	Tue, 10 Oct 2023 06:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A0F10E317;
 Tue, 10 Oct 2023 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696920027; x=1728456027;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qyS78X6kgyN72gNbojsrXZvOfLJcf47vxLUxZFdsRK0=;
 b=NlZm0Ww+w7zGkGyicDohqKOAA9v8ydx2N1kTmoqKw4utdyPOKOcKS3bY
 07yWEHWTo0ZSobryBUA0cx0GyIm86PJm+8TOeMA69VVtbI/cMnwgRBF9/
 TEFCF+frjXRRy/SS37MAaiK22G8R8iuQYSwB8MnDANohXnRA+zuY5W7zE
 kGkpdOm+liNqx4WfCmDLziZQ9osQYAWIUVKYSrvlZGVWljVVGeyMUiJgs
 WKCzKDM+FId52YkxPawh7c5wzmE02Y0xd2rw1LZlSqv+SxV+aE1KYHwCU
 //XITgWYsKTj9NAzvXQcacBve7f+ZnmF01nkMZyos4pVt15Zlvjhek3vi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369390602"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="369390602"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 23:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746962821"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="746962821"
Received: from agargas-mobl.ger.corp.intel.com (HELO [10.249.254.164])
 ([10.249.254.164])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 23:40:21 -0700
Message-ID: <c6ce663d-dd69-46a2-7b55-359169b6c03c@linux.intel.com>
Date: Tue, 10 Oct 2023 08:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v6 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-5-dakr@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231008233212.13815-5-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/9/23 01:32, Danilo Krummrich wrote:
> Currently the DRM GPUVM offers common infrastructure to track GPU VA
> allocations and mappings, generically connect GPU VA mappings to their
> backing buffers and perform more complex mapping operations on the GPU VA
> space.
>
> However, there are more design patterns commonly used by drivers, which
> can potentially be generalized in order to make the DRM GPUVM represent
> a basis for GPU-VM implementations. In this context, this patch aims
> at generalizing the following elements.
>
> 1) Provide a common dma-resv for GEM objects not being used outside of
>     this GPU-VM.
>
> 2) Provide tracking of external GEM objects (GEM objects which are
>     shared with other GPU-VMs).
>
> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>     GPU-VM contains mappings of.
>
> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>     of, such that validation of evicted GEM objects is accelerated.
>
> 5) Provide some convinience functions for common patterns.
>
> Big thanks to Boris Brezillon for his help to figure out locking for
> drivers updating the GPU VA space within the fence signalling path.
>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>
> +/**
> + * drm_gpuvm_resv_add_fence - add fence to private and all extobj
> + * dma-resv
> + * @gpuvm: the &drm_gpuvm to add a fence to
> + * @exec: the &drm_exec locking context
> + * @fence: fence to add
> + * @private_usage: private dma-resv usage
> + * @extobj_usage: extobj dma-resv usage
> + */
> +void
> +drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
> +			 struct drm_exec *exec,
> +			 struct dma_fence *fence,
> +			 enum dma_resv_usage private_usage,
> +			 enum dma_resv_usage extobj_usage)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		dma_resv_assert_held(obj->resv);
> +		dma_resv_add_fence(obj->resv, fence,
> +				   drm_gpuvm_is_extobj(gpuvm, obj) ?
> +				   private_usage : extobj_usage);

It looks like private_usage and extobj_usage are mixed up above?


> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
> +

Thanks,

Thomas


