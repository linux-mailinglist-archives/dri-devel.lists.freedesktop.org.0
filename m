Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4FB7BEAFA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5610E2DC;
	Mon,  9 Oct 2023 19:54:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D6710E2D9;
 Mon,  9 Oct 2023 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696881275; x=1728417275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=grOgaVrMFVXREXdvqrCQCdvPCBHVdxyEL6/C6yZ1qsk=;
 b=RaC7tLgMK5DNtBKa6dcKIRA+lmaSe6/KN3F95C67mcOt3hioHb6WxQZT
 F8LLFw35j3PsDqG5oCHtMBE7yhIF4AZ14skoMx5Cr1xXjvDLG+NbjQgiW
 mHgN9e6QKkoJJM6bhMj9Q9nxP/KRb+HYI/pD+uGYP2VB6ODKMo+cR6XHb
 GLK5gta5gRsHqHcaSOay1EE0G7BeWMOljrMZ/Ip5hI4phGvsmQxL5HRAm
 6bxSkcBvo5DaxG+O0PnKb+TVPnDvfeQUWwSFFxEHeBsb8vOECEvJCv7uh
 GAFkBhHvaQW2kTN0B3JPt9JMqIyVQBHD52QxeB1YWZkpuAnH/1cZjX6TE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363586581"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="363586581"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:54:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="926865902"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="926865902"
Received: from ibrahim2-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.42.185])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 12:54:23 -0700
Date: Mon, 9 Oct 2023 21:54:17 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: More use of GT specific print
 helpers
Message-ID: <ZSRaaVzpL51DA3y+@ashyti-mobl2.lan>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009183802.673882-3-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

...

> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -71,6 +71,7 @@
>  #include "gem/i915_gem_pm.h"
>  #include "gt/intel_gt.h"
>  #include "gt/intel_gt_pm.h"
> +#include "gt/intel_gt_print.h"
>  #include "gt/intel_rc6.h"
>  
>  #include "pxp/intel_pxp.h"
> @@ -429,7 +430,7 @@ static int i915_pcode_init(struct drm_i915_private *i915)
>  	for_each_gt(gt, i915, id) {
>  		ret = intel_pcode_init(gt->uncore);
>  		if (ret) {
> -			drm_err(&gt->i915->drm, "gt%d: intel_pcode_init failed %d\n", id, ret);
> +			gt_err(gt, "intel_pcode_init failed %d\n", ret);

using gt_*() print functions in the upper layers looks a bit
wrong to me. If we need GT printing, the prints need to be done
inside the function called, in this case would be
intel_pcode_init().

Andi
