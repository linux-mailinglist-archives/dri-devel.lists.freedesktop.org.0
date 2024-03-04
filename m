Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3704870009
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51D10FFED;
	Mon,  4 Mar 2024 11:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd7hU+5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8A10FFED;
 Mon,  4 Mar 2024 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709550789; x=1741086789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zWCb/ku/h76tcpLs23jrW8GlvwCDULDEu7boNNfTOxU=;
 b=Yd7hU+5qLYpLX+3gOUDY1/ixjhLxHtna/KE0CMIVPs4M4oEOwS7eTBt1
 D06VyaWlZVuMGM/bPPKYvwtnZYi4egBOQtleIx/IrPuqkSjcqapTt24PL
 +3ZLpMhhtlATVl0PilD5Ww2AYHJoWKs4qOo7pX4w7y3UDfhB8+RABRkrg
 HbuJMcT1FnjJflBoqY7oFwTWMbEgTWFYrbMh9LFZQ4tgjOgEk2Gt+ynxb
 hnaNE1efHLEOh7nXCUATQbKhHoZQQt1w0jRrf81l/1AW0lruC76bjDLx8
 KVHiqTkTw2+DLD62lXZUsiFzBFpzUwKpJwDa+NaSkwHqcsnUaWYLWYqdy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4161018"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4161018"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:13:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="827773141"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="827773141"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Mar 2024 03:13:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Mar 2024 13:13:03 +0200
Date: Mon, 4 Mar 2024 13:13:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, andrealmeid@riseup.net,
 tales.aparecida@gmail.com, daniel@ffwll.ch, airlied@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 lucas.demarchi@intel.com
Subject: Re: [PATCH v2] drm/i915/overlay: Remove redundant drm_rect_visible()
 use
Message-ID: <ZeWsv4xbEWGyBgFo@intel.com>
References: <20230325172719.92102-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230325172719.92102-1-arthurgrillo@riseup.net>
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

On Sat, Mar 25, 2023 at 02:27:19PM -0300, Arthur Grillo wrote:
> The drm_rect_intersect() already returns if the intersection is visible
> or not, so the use of drm_rect_visible() is duplicate.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

Sorry, looks like I completely missed this.
Now push the drm-intel-next. Thanks.

> ---
> v1->v2: https://lore.kernel.org/all/20230324142533.6357-1-arthurgrillo@riseup.net/
> - Split the if condition.
> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index c12bdca8da9b..d55153587cae 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -966,10 +966,11 @@ static int check_overlay_dst(struct intel_overlay *overlay,
>  		      rec->dst_width, rec->dst_height);
>  
>  	clipped = req;
> -	drm_rect_intersect(&clipped, &crtc_state->pipe_src);
>  
> -	if (!drm_rect_visible(&clipped) ||
> -	    !drm_rect_equals(&clipped, &req))
> +	if (!drm_rect_intersect(&clipped, &crtc_state->pipe_src))
> +		return -EINVAL;
> +
> +	if (!drm_rect_equals(&clipped, &req))
>  		return -EINVAL;
>  
>  	return 0;
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
