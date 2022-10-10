Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F85F9A4A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 09:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2971810E1A1;
	Mon, 10 Oct 2022 07:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E401D10E1A1;
 Mon, 10 Oct 2022 07:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665387870; x=1696923870;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+xYBzkJJbEswt3Udi7rw2jLreR3Vwbfut7+yRDH0aa4=;
 b=CdCZn7exU3SnmOeflO9kW5I5gYmvZn0XMkEKRu+M7IqRbsC2wqDf5Q11
 isfSVNjZcpwppXXWt7A5kfKLFtDWFGLl6YgmkM0CUhExGiX6ZzcGs1Ymj
 PYfvll/K3io1Bo9f7U1G8ijrsdhg4+ne+2zubFCPkDmTVOoYi4oilEvVO
 6uNuHXbXj1T5F1K9xlpV1vyoBnKiTpWL4bmLmispvMjgXYoH5WYwTNuAs
 0kB6qZXLXXBayUeARs56mS/i13mBXXkuUfAoDJYUOTGKvKxd+cBLBDI09
 plIJg/FdC6+QNZjZcA7XRLib2Zmsui9yqXRx3cErIQkjBjBft3x2OHNkf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="304153211"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="304153211"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 00:44:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="603628611"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="603628611"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.10.52])
 ([10.213.10.52])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 00:44:23 -0700
Message-ID: <10268aa0-6d76-2635-79f8-f450f11e01d0@intel.com>
Date: Mon, 10 Oct 2022 09:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH RESEND] drm/i915: Fix display problems after
 resume
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20221005121159.340245-1-thomas.hellstrom@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221005121159.340245-1-thomas.hellstrom@linux.intel.com>
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
Cc: Kevin Boulain <kevinboulain@gmail.com>,
 David de Sousa <davidesousa@gmail.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.10.2022 14:11, Thomas Hellström wrote:
> Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt
> binding / unbinding") introduced a regression that due to the vma resource
> tracking of the binding state, dpt ptes were not correctly repopulated.
> Fix this by clearing the vma resource state before repopulating.
> The state will subsequently be restored by the bind_vma operation.
> 
> Fixes: 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt binding / unbinding")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20220912121957.31310-1-thomas.hellstrom@linux.intel.com
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.18+
> Reported-and-tested-by: Kevin Boulain <kevinboulain@gmail.com>
> Tested-by: David de Sousa <davidesousa@gmail.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index b31fe0fb013f..5c67e49aacf6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -1275,10 +1275,16 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>   			atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
>   
>   		GEM_BUG_ON(!was_bound);
> -		if (!retained_ptes)
> +		if (!retained_ptes) {
> +			/*
> +			 * Clear the bound flags of the vma resource to allow
> +			 * ptes to be repopulated.
> +			 */
> +			vma->resource->bound_flags = 0;

Personally I would put this at suspend path, if possible.
Anyway:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


>   			vma->ops->bind_vma(vm, NULL, vma->resource,
>   					   obj ? obj->cache_level : 0,
>   					   was_bound);
> +		}
>   		if (obj) { /* only used during resume => exclusive access */
>   			write_domain_objs |= fetch_and_zero(&obj->write_domain);
>   			obj->read_domains |= I915_GEM_DOMAIN_GTT;

