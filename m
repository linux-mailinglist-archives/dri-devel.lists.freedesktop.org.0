Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFE77C0B7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 21:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DD410E0CE;
	Mon, 14 Aug 2023 19:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A7710E0C2;
 Mon, 14 Aug 2023 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692041056; x=1723577056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Am3/swHi/WWw/xwGWmW1ilXOmyg6qNAjZ24pEG3Rs30=;
 b=dtgwTn8yaZFnvSbCyb1O0zf61BuX7XCJaAz1ACWIvtvNNRQgkTkhPZQR
 Sv8CrsvunmsVZsFwoJ6//2QB7sg980autymwTsugkXAKcTatIV2TeN3uC
 w810AsDrBltG0lvjlQfourzXrqxsUKvuwVlrl2mxMw8iKQClHp4SDZym2
 6/ls8uP6SqN/eQeZja2M1khnLqU37/XS/aRRlaDwBPOZmtURE3bvYMS6Y
 Muj/1Te5aWUmYdVX/0nvs0+Cgt6DIRnzpPFa4Zt8kTkDIEDolgbGvGyG2
 J3RgF2IRbLNsrtivkupV/7kKz11r8JJRTKLx6yMvKwHlkAV5tL2qxEtxT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="371021123"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="371021123"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 12:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710441861"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="710441861"
Received: from dkravtso-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.252.51.126])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 12:24:13 -0700
Date: Mon, 14 Aug 2023 21:24:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v1] drm/i915: Fix TLB-Invalidation seqno store
Message-ID: <ZNp/WwgHSSp09+LO@ashyti-mobl2.lan>
References: <20230814182449.1060747-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814182449.1060747-1-alan.previn.teres.alexis@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alan,

On Mon, Aug 14, 2023 at 11:24:49AM -0700, Alan Previn wrote:
> When getting the next gt's seqno to be stored into an
> objects mm.tlb[gt_id] array, fix the retrieval code
> to get it from the correct gt instead of the same one.
> 
> Fixes: d6c531ab4820 ("drm/i915: Invalidate the TLBs on each GT")
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_vma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index e52089564d79..6f180ee13853 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -1356,7 +1356,7 @@ void vma_invalidate_tlb(struct i915_address_space *vm, u32 *tlb)
>  	 */
>  	for_each_gt(gt, vm->i915, id)
>  		WRITE_ONCE(tlb[id],
> -			   intel_gt_next_invalidate_tlb_full(vm->gt));
> +			   intel_gt_next_invalidate_tlb_full(gt));

ops!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thank you!
Andi
