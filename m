Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E766DFAB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 14:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5354010E181;
	Tue, 17 Jan 2023 13:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4661410E181;
 Tue, 17 Jan 2023 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673963772; x=1705499772;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7XWjTsDMeS3tr1JAax+Np7DONdRK+jGt05VAd9+JJ90=;
 b=RkxarGZjUOOU00Tzu7VegkBGqVIA7bUyCcgr410FkKnl+uIhRvURJKww
 muHoX57mIfjbYJHwRkCghzKLlyx8bPLewcHhbSkVl/rgQT33qce9+RJ/8
 meMDmQJ5cysRr8H85qHA5lLRIOvMRG7MwUtOCTo37op6Fzt04HlDiTWOj
 Ba4lDLmn8ZHm0gMaOL4xBqSspXgVO4AXB4ZKXfbLtslbS1k0cwjTRhJs+
 Cgih3f61Oc6k/eP+i3+Q8TXgQk1PoaCnyGTEXvgjsnyo8BSq2kvOrLW7F
 dgUYIp65UckGtAMm0mIocLfmn7KCqkmasenC+/aq1o6ouPFnVjvQLFgE0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389197427"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="389197427"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:56:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="767294715"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="767294715"
Received: from dmitriim-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.45.175])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:56:08 -0800
Date: Tue, 17 Jan 2023 14:56:04 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: Ratelimit debug log in
 vm_fault_ttm
Message-ID: <Y8ao9HvRqBIEgHSj@ashyti-mobl2.lan>
References: <20230117115350.1071-1-nirmoy.das@intel.com>
 <20230117115350.1071-2-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117115350.1071-2-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Tue, Jan 17, 2023 at 12:53:50PM +0100, Nirmoy Das wrote:
> Test like i915_gem_mman_live_selftests/igt_mmap_migrate can cause
> dmesg spamming. Use ratelimit api to reduce log rate.
> 
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7038
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 8cfed1bef629..25294ddbee46 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1077,8 +1077,9 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>  		}
>  
>  		if (err) {
> -			drm_dbg(dev, "Unable to make resource CPU accessible(err = %pe)\n",
> -				ERR_PTR(err));
> +			drm_dbg_ratelimited(dev,
> +					    "Unable to make resource CPU accessible(err = %pe)\n",
> +					    ERR_PTR(err));
>  			dma_resv_unlock(bo->base.resv);
>  			ret = VM_FAULT_SIGBUS;
>  			goto out_rpm;
> -- 
> 2.39.0
