Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9834E9D87
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA2C10E73C;
	Mon, 28 Mar 2022 17:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50510E73C;
 Mon, 28 Mar 2022 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488548; x=1680024548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OV1GAwXhEgjZzRU9gz9zPi7Jm5KOUmJOjUOgqtY4QQ8=;
 b=UpwJPsU95wtud6tJkTUmTgufKrFlwoSgl4YJA4fbbZMAkyY7WVkr+e5i
 hXzAHmbxvAG4IreXMX8+Cw5Ggj7ezj+5Tvi7vq4cdoB+IYhcOHg94QeAQ
 k/QvujXyp0uG/sgu+rZj0OsFImGN2BVDJffrjLm5wvVgZEUnXhDAY46ry
 qD76ScM7xSPrgedsP9D5VxfWjNoYABQTsdiW9HdcBPBoP1rdLG+cuAO3F
 y90uD2vG7Cx9/ggctSLiNad1Rr9Tl0FeFMrzEs2up05FmMXwHAr4uir/d
 3V+2vyJrZ3M79wLr0GvhPqL4+pOWPMZmWT03Lpia9jskB5izBN0S72o0I g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259249607"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="259249607"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="521108620"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga006.jf.intel.com with SMTP; 28 Mar 2022 10:29:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:29:04 +0300
Date: Mon, 28 Mar 2022 20:29:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 04/12] drm/edid: pass a timing pointer to
 is_detailed_timing_descriptor()
Message-ID: <YkHwYPHZGnIyvUA0@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <0b5213383e14f11c6a505b10a7342fb2ff4f2a11.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b5213383e14f11c6a505b10a7342fb2ff4f2a11.1648477901.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 05:34:25PM +0300, Jani Nikula wrote:
> Use struct member access instead of direct offsets to avoid a cast.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ded1f019180d..10da6b9b14fb 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2342,9 +2342,11 @@ static bool is_display_descriptor(const struct detailed_timing *descriptor, u8 t
>  		descriptor->data.other_data.type == type;
>  }
>  
> -static bool is_detailed_timing_descriptor(const u8 d[18])
> +static bool is_detailed_timing_descriptor(const struct detailed_timing *descriptor)
>  {
> -	return d[0] != 0x00 || d[1] != 0x00;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), pixel_clock) != 0);
> +
> +	return descriptor->pixel_clock != 0;
>  }
>  
>  typedef void detailed_cb(struct detailed_timing *timing, void *closure);
> @@ -3266,7 +3268,7 @@ do_detailed_mode(struct detailed_timing *timing, void *c)
>  	struct detailed_mode_closure *closure = c;
>  	struct drm_display_mode *newmode;
>  
> -	if (!is_detailed_timing_descriptor((const u8 *)timing))
> +	if (!is_detailed_timing_descriptor(timing))
>  		return;
>  
>  	newmode = drm_mode_detailed(closure->connector->dev,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
