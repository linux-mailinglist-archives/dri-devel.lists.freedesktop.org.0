Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C364C5B5EB0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74D10E0C1;
	Mon, 12 Sep 2022 17:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5444510E0C1;
 Mon, 12 Sep 2022 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663001998; x=1694537998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d1kGTyk2cN9Ovca/+x9Nb4cMgT7PK2UcJyHC3d94Rl4=;
 b=VR0CthdsheagV1uF90GDbJgGfgcBvRUxOVYFUUWuidOdmSVu52LeDUHB
 yZJU5Xe0QHMDGD3e1zIoxJtp+54+nv3Fzb97J9SwrUIgOAKnPrFYS6jlB
 fZTVRcqzlCATZSYzt54FSwcC3d71AqrWIwSsMWNHQc1UFb3+ppwc2r7tb
 UAZji9VO2OwYCI9wf0fT4WLaEQGYAUXBgKaIkoWCUjDtbkj1fTV2krba7
 CbsWw9CQpKXW0iaxYnZmhpLQ/CoroEkUaZCZFzaL4KW7KacQSvSo+qNjS
 TnM6B25d4gMVhNR/jNZ5tdcwIuormAfZj5vbpZEj/iMsjS3uVw37mmsif g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="359643568"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="359643568"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:59:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678176042"
Received: from mtabaka-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.57.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 09:59:56 -0700
Date: Mon, 12 Sep 2022 18:59:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 1/1] drm/i915: Skip applying copy engine
 fuses
Message-ID: <Yx9liQu4JmnVmWVn@alfio.lan>
References: <20220912-copy-engine-v1-0-ef92fd81758d@intel.com>
 <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912-copy-engine-v1-1-ef92fd81758d@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Mon, Sep 12, 2022 at 09:19:38AM -0700, Lucas De Marchi wrote:
> Support for reading the fuses to check what are the Link Copy engines
> was added in commit ad5f74f34201 ("drm/i915/pvc: read fuses for link
> copy engines"). However they were added unconditionally because the
> FUSE3 register is present since graphics version 10.
> 
> However the bitfield with meml3 fuses only exists since graphics version
> 12. Moreover, Link Copy engines are currently only available in PVC.
> Tying additional copy engines to the meml3 fuses is not correct for
> other platforms.
> 
> Make sure there is a check for  `12.60 <= ver < 12.70`. Later platforms
> may extend this function later if it's needed to fuse off copy engines.
> 
> Currently it's harmless as the Link Copy engines are still not exported:
> info->engine_mask only has BCS0 set and the register is only read for
> platforms that do have it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 814f83b5fe59..1f7188129cd1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -764,6 +764,10 @@ static void engine_mask_apply_copy_fuses(struct intel_gt *gt)
>  	unsigned long meml3_mask;
>  	unsigned long quad;
>  
> +	if (!(GRAPHICS_VER_FULL(i915) >= IP_VER(12, 60) &&
> +	      GRAPHICS_VER_FULL(i915) < IP_VER(12, 70)))
> +		return;
> +

Isn't it easier if you wrote

	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 60) ||
	    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
		return;

?

You save a parenthesis and a negation '!'.

Anyway, looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
 
>  	meml3_mask = intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3);
>  	meml3_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK, meml3_mask);
>  
> 
> -- 
> b4 0.10.0-dev-df873
