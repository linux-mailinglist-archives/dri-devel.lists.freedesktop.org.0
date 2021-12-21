Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD6B47B6C1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 02:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509C10EA9E;
	Tue, 21 Dec 2021 01:18:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD79B10EA99;
 Tue, 21 Dec 2021 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640049503; x=1671585503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MedFrNDsOlcHgUj7LkZaKsHZZneOhNqmOlQck1Q5h1s=;
 b=Mg+jIFD0hUj3jq4B/05bY3XF3wElsU46ZLpNITty7vwxIKcffi+IjsSd
 jxXG0hcIOgwLJtYNZ4zQvHmvX0hebDFWfJLp8jC8JV3VkndFpRG3aOfcH
 jjynh1eh1Ewq3Aghu8KSpheTZQ8IcrrsH6vao/Zw9bUX5GuS82C8RnLaM
 58SM2Nj405x69igDJuYCEtn5rWP9tKWyDVbLYDb8Hs6PEi0tBhFMN8ody
 vak6AOTnHDF8hhTXOvGP2lQ5IqKOHKfmgtUZG9drmzAay7oyokiyy+btF
 T8kgmgpSgn/Cc3MGrcCQHivp3zUqD8+JtJZKRiytKS1+zWuNJR+9ATkTh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240522703"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="240522703"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:18:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="613289095"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 17:18:22 -0800
Date: Mon, 20 Dec 2021 17:13:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Temporarily bump the GuC
 load timeout
Message-ID: <20211221011303.GA27635@jons-linux-dev-box>
References: <20211221005221.1090824-1-John.C.Harrison@Intel.com>
 <20211221005221.1090824-2-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221005221.1090824-2-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 04:52:19PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There is a known (but exceedingly unlikely) race condition where the
> asynchronous frequency management code could reduce the GT clock while
> a GuC reload is in progress (during a full GT reset). A fix is in
> progress but there are complex locking issues to be resolved. In the
> meantime bump the timeout to 500ms. Even at slowest clock, this
> should be sufficient. And in the working case, a larger timeout makes
> no difference.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Any idea of the ETA for the proper fix? Also if the proper fix makes the
locking more complicated I'm probably of the opinion we just live with a
longer timer as full GTs shouldn't really ever happen in practice and if
they take a longer time, so be it.

Anyways for this patch:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> index 31420ce1ce6b..c03bde5ec61f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
> @@ -105,12 +105,21 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
>  	/*
>  	 * Wait for the GuC to start up.
>  	 * NB: Docs recommend not using the interrupt for completion.
> -	 * Measurements indicate this should take no more than 20ms, so a
> +	 * Measurements indicate this should take no more than 20ms
> +	 * (assuming the GT clock is at maximum frequency). So, a
>  	 * timeout here indicates that the GuC has failed and is unusable.
>  	 * (Higher levels of the driver may decide to reset the GuC and
>  	 * attempt the ucode load again if this happens.)
> +	 *
> +	 * FIXME: There is a known (but exceedingly unlikely) race condition
> +	 * where the asynchronous frequency management code could reduce
> +	 * the GT clock while a GuC reload is in progress (during a full
> +	 * GT reset). A fix is in progress but there are complex locking
> +	 * issues to be resolved. In the meantime bump the timeout to
> +	 * 500ms. Even at slowest clock, this should be sufficient. And
> +	 * in the working case, a larger timeout makes no difference.
>  	 */
> -	ret = wait_for(guc_ready(uncore, &status), 100);
> +	ret = wait_for(guc_ready(uncore, &status), 500);
>  	if (ret) {
>  		struct drm_device *drm = &uncore->i915->drm;
>  
> -- 
> 2.25.1
> 
