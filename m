Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187CE86C93B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216CF10E467;
	Thu, 29 Feb 2024 12:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2uwzqMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852110E0E0;
 Thu, 29 Feb 2024 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709209850; x=1740745850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I8wHXrw5KXLL0vG+bL726Zb9dp643IbYVediCET50o8=;
 b=j2uwzqMwbbIMsHc2vNzCj2RxJwQzdoJJST3I4Y4PWwcyfj6WEVyHT67b
 Os3g/lf1t9n30F/3+GDrny9ZbMRXOiESw47MGOwJYWyiOXxJQK+nx6Mxr
 XrLScKhpoT7v6Vxo+dMvCWwpjNbaZQVJQZadRx0WNVsuBXkbL26uxdUjF
 IhhIVtj8sGb+nXDD2QY6TMXH8qTp8Gt+sr/HiMXWCX9CqrCDHB0bPoknE
 awrNuz6siCJ3yjYHOdmgDoc2Saan7BFgwLkpyOWHyHUCBlanquNm0XGgL
 xCKeo7SZFPPCcNqLbQIdF4d2Qn/6SbXl6SiUbm9SCu8Jy8o029s4A/tDr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="4255541"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="4255541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 04:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="827771475"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="827771475"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 29 Feb 2024 04:30:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Feb 2024 14:30:29 +0200
Date: Thu, 29 Feb 2024 14:30:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nikita Kiryushin <kiryushin@ancud.ru>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 project@linuxtesting.org
Subject: Re: [PATCH] drm/i915: Remove unneeded double drm_rect_visible call
 in check_overlay_dst
Message-ID: <ZeB45WKv4lP8QQpv@intel.com>
References: <>
 <79c92cfa-cf5a-4a23-8a93-11c1af7432fc@ancud.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79c92cfa-cf5a-4a23-8a93-11c1af7432fc@ancud.ru>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 28, 2024 at 09:32:47PM +0300, Nikita Kiryushin wrote:
> 
> check_overlay_dst for clipped is called 2 times: in drm_rect_intersect 
> and than directly. Change second call for check of drm_rect_intersect 
> result to save some time (in locked code section).
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 8d8b2dd3995f ("drm/i915: Make the PIPESRC rect relative to the 
> entire bigjoiner area")
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
> ---
>   drivers/gpu/drm/i915/display/intel_overlay.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c 
> b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 2b1392d5a902..1cda1c163a92 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -972,9 +972,8 @@ static int check_overlay_dst(struct intel_overlay 
> *overlay,
>   		      rec->dst_width, rec->dst_height);
>    	clipped = req;
> -	drm_rect_intersect(&clipped, &crtc_state->pipe_src);
>   -	if (!drm_rect_visible(&clipped) ||
> +	if (!drm_rect_intersect(&clipped, &crtc_state->pipe_src) ||

I prefer the current way where we have no side effects in
the if statement.

>   	    !drm_rect_equals(&clipped, &req))
>   		return -EINVAL;
>   -- 2.34.1

-- 
Ville Syrjälä
Intel
