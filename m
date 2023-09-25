Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2677AD803
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 14:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55A610E244;
	Mon, 25 Sep 2023 12:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1426610E177;
 Mon, 25 Sep 2023 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695644819; x=1727180819;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0u/Z3gCXL479C/vVAH1cw7xGbrMOJ6MqRxJkvuqky34=;
 b=k/GS/K1UyV/L9UYXizwcFJJ2RLoRY0gzzDb2fPK0bkmlM9jiynZmMqI+
 20Su14aBcksLoViGmQMfGMlPeDRBCWJtHdwsWTNgHmIXS3V+3D0Kgy/Ra
 0wvogSWigXxfCAId1DjNFMqh0f8Y32+aXI9N5vs9+bGh76mbqEVCzTLcU
 VQEExKF1IzbPTjhRgWk6EgATEt0hr+m/FVMHWUyOMMVF8qyFjnUgIdNZa
 qA0dFBR6mgcjl+A5YcB2LctHG3F03JTvA5MvQx2BIn54qis7lXuAuDn58
 mTUpSN3W02oUjtnmtSv3v/3ZO82ZGW/3U4KdBcZGBTdv6l+DKGyN41/hs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371557613"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="371557613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783473749"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="783473749"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:26:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: liuhaoran <liuhaoran14@163.com>, airlied@gmail.com
Subject: Re: [PATCH] drm/i915/gt: Add error handling in intel_timeline_pin()
In-Reply-To: <20230924061632.13665-1-liuhaoran14@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230924061632.13665-1-liuhaoran14@163.com>
Date: Mon, 25 Sep 2023 15:26:54 +0300
Message-ID: <87o7hqmoa9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, liuhaoran <liuhaoran14@163.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Sep 2023, liuhaoran <liuhaoran14@163.com> wrote:
> This patch adds error-handling for the i915_active_acquire()
> inside the intel_timeline_pin().

Seems to me this is not sufficient.

BR,
Jani.

>
> Signed-off-by: liuhaoran <liuhaoran14@163.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_timeline.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
> index b9640212d659..a2edf9233500 100644
> --- a/drivers/gpu/drm/i915/gt/intel_timeline.c
> +++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
> @@ -211,7 +211,11 @@ int intel_timeline_pin(struct intel_timeline *tl, struct i915_gem_ww_ctx *ww)
>  	GT_TRACE(tl->gt, "timeline:%llx using HWSP offset:%x\n",
>  		 tl->fence_context, tl->hwsp_offset);
>  
> -	i915_active_acquire(&tl->active);
> +	err = i915_active_acquire(&tl->active);
> +
> +	if (err)
> +		return err;
> +
>  	if (atomic_fetch_inc(&tl->pin_count)) {
>  		i915_active_release(&tl->active);
>  		__i915_vma_unpin(tl->hwsp_ggtt);

-- 
Jani Nikula, Intel
