Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF159C500
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C11C9B86C;
	Mon, 22 Aug 2022 17:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A789B81B;
 Mon, 22 Aug 2022 17:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661189287; x=1692725287;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=9ElP/IwqxhNOlWFt/bRl8Zyn5hdwF2/4tZbor7mkJK8=;
 b=F5mQ6w94cEyLeDbmkodxvisjrfiChxPbKgUEIb1DyEZivWeT0c9fIXGR
 WsjdtskSX2trmoCCpJ6P4l0hherfOQbXCNUCfFe5HwZVhefHnojYBP2zg
 HKRQ2HjgnO6KAOmCH4C02zWscX/Xh1B3PcLy5xCEpC/oSSzZciA38MM7K
 YYuXS4oFT2ov24HkCrhereMKOYe/5jr+qczQeeQeWNTowH3m+2wFHUKPd
 hdaA3YR9lB4RkMIulz33C+KZn/i8032J2Kg3xQp/9sZux4ZqldxvkT/mU
 uwg1mVJikG+8R1ou/0QltgabgPdv9R7lJumJw5c401xLLr4nvangTki4Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="357457722"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="357457722"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 10:28:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="854560472"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 10:28:04 -0700
Date: Mon, 22 Aug 2022 20:28:00 +0300
From: Imre Deak <imre.deak@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v6 4/4] drm/i915/fbdev: do not create fbdev if HPD is
 suspended
Message-ID: <YwO8oD4fyQgOsCTu@ideak-desk.fi.intel.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
 <20220722125143.1604709-5-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722125143.1604709-5-andrzej.hajda@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 02:51:43PM +0200, Andrzej Hajda wrote:
> In case of deferred FB setup core can try to create new
> framebuffer. Disallow it if hpd_suspended flag is set.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 94ddc0f34fde64..fb8dbd532b9e05 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -210,6 +210,12 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	struct drm_i915_gem_object *obj;
>  	int ret;
>  
> +	mutex_lock(&ifbdev->hpd_lock);
> +	ret = ifbdev->hpd_suspended ? -EAGAIN : 0;
> +	mutex_unlock(&ifbdev->hpd_lock);
> +	if (ret)
> +		return ret;
> +
>  	if (intel_fb &&
>  	    (sizes->fb_width > intel_fb->base.width ||
>  	     sizes->fb_height > intel_fb->base.height)) {
> -- 
> 2.25.1
> 
