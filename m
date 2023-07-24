Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A976005F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 22:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686A10E351;
	Mon, 24 Jul 2023 20:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275610E11F;
 Mon, 24 Jul 2023 20:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690229769; x=1721765769;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QXTogMEqj8WARXQRtzwBquYXFZkG/HEmBMFRqdRB1CU=;
 b=ZAH3bOzHJoXNpnJB45Pq2Pft4ENZyA/0y2HIr0TKJarTDaRtZ6zFSdbc
 1MPXYVQ7q8R8emixpZJce+bZEuyYHJ9CKgyXxKnc4XT1NxsWWRCNCLrfu
 ODWXnGZLaa9k3sJ65teM2TbIqwpoBFqK2SPVaHImQEfp4mYDO4Xlj8Y0G
 /s5V1kx5tszfqAS3f0zu7ojxnRIcpSTZWKoHeFF2ObEaEdhWHfULnyl8K
 qnepxbAZW6CJYE3SA5T3/FSklbPkFhGtlTog+mPhhOVcPrVVXX1r7XU/E
 bjTe57O1asCZrbTbcXT3dLwyFzuonG94F+bsrSEa9er2xJvaA8mYlnhOv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="357543861"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="357543861"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 13:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972404956"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="972404956"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 13:16:08 -0700
Date: Mon, 24 Jul 2023 22:16:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid GGTT flushing on non-GGTT
 paths of i915_vma_pin_iomap
Message-ID: <ZL7cBvXCdtx3yzkB@ashyti-mobl2.lan>
References: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724125633.1490543-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, Jul 24, 2023 at 01:56:33PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Commit 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
> added a code path which does not map via GGTT, but was still setting the
> ggtt write bit, and so triggering the GGTT flushing.
> 
> Fix it by not setting that bit unless the GGTT mapping path was used, and
> replace the flush with wmb() in i915_vma_flush_writes().
> 
> This also works for the i915_gem_object_pin_map path added in
> d976521a995a ("drm/i915: extend i915_vma_pin_iomap()").
> 
> It is hard to say if the fix has any observable effect, given that the
> write-combine buffer gets flushed from intel_gt_flush_ggtt_writes too, but
> apart from code clarity, skipping the needless GGTT flushing could be
> beneficial on platforms with non-coherent GGTT. (See the code flow in
> intel_gt_flush_ggtt_writes().)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 4bc91dbde0da ("drm/i915/lmem: Bypass aperture when lmem is available")
> References: d976521a995a ("drm/i915: extend i915_vma_pin_iomap()")
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index ffb425ba591c..f2b626cd2755 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -602,7 +602,9 @@ void __iomem *i915_vma_pin_iomap(struct i915_vma *vma)
>  	if (err)
>  		goto err_unpin;
>  
> -	i915_vma_set_ggtt_write(vma);
> +	if (!i915_gem_object_is_lmem(vma->obj) &&
> +	    i915_vma_is_map_and_fenceable(vma))
> +		i915_vma_set_ggtt_write(vma);
>  
>  	/* NB Access through the GTT requires the device to be awake. */
>  	return page_mask_bits(ptr);
> @@ -617,6 +619,8 @@ void i915_vma_flush_writes(struct i915_vma *vma)
>  {
>  	if (i915_vma_unset_ggtt_write(vma))
>  		intel_gt_flush_ggtt_writes(vma->vm->gt);
> +	else
> +		wmb(); /* Just flush the write-combine buffer. */

is flush the right word? Can you expand more the explanation in
this comment and why this point of synchronization is needed
here? (I am even wondering if it is really needed).

Anyway, it looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

>  }
>  
>  void i915_vma_unpin_iomap(struct i915_vma *vma)
> -- 
> 2.39.2
