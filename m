Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DC246CF40
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 09:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC796E8EF;
	Wed,  8 Dec 2021 08:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116D56E8FE;
 Wed,  8 Dec 2021 08:41:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="235298656"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="235298656"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:40:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="679819062"
Received: from cahanley-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.1])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 00:40:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: cgel.zte@gmail.com
Subject: Re: [PATCH linux-next] drm/i915/display: Remove the useless
 variable offset and its assignment
In-Reply-To: <20211208074952.404381-1-luo.penghao@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211208074952.404381-1-luo.penghao@zte.com.cn>
Date: Wed, 08 Dec 2021 10:40:49 +0200
Message-ID: <87y24v4hgu.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luo penghao <luo.penghao@zte.com.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Dec 2021, cgel.zte@gmail.com wrote:
> From: luo penghao <luo.penghao@zte.com.cn>
>
> The existence of offset is meaningless, so it should be deleted.
>
> The clang_analyzer complains as follows:
>
> Value stored to 'offset' is never read
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: luo penghao <luo.penghao@zte.com.cn>

I've said the same things before, and I'll say them again.

Having an unused variable like this could be an indication of a bug
introduced by an earlier change; maybe we should still be using the
variable but no longer do. Please figure out when the variable became
unused and reference the commit so we can tell.

If cgel.zte@gmail.com sends the patches, we'll need their name and
Signed-off-by too.

Thanks for the report, but I'll consider this as a report only.


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/i9xx_plane.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> index b1439ba..a478b7f 100644
> --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> @@ -964,7 +964,7 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
>  	struct intel_plane *plane = to_intel_plane(crtc->base.primary);
>  	enum i9xx_plane_id i9xx_plane = plane->i9xx_plane;
>  	enum pipe pipe;
> -	u32 val, base, offset;
> +	u32 val, base;
>  	int fourcc, pixel_format;
>  	unsigned int aligned_height;
>  	struct drm_framebuffer *fb;
> @@ -1006,14 +1006,14 @@ i9xx_get_initial_plane_config(struct intel_crtc *crtc,
>  	fb->format = drm_format_info(fourcc);
>  
>  	if (IS_HASWELL(dev_priv) || IS_BROADWELL(dev_priv)) {
> -		offset = intel_de_read(dev_priv, DSPOFFSET(i9xx_plane));
> +		intel_de_read(dev_priv, DSPOFFSET(i9xx_plane));
>  		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & 0xfffff000;
>  	} else if (DISPLAY_VER(dev_priv) >= 4) {
>  		if (plane_config->tiling)
> -			offset = intel_de_read(dev_priv,
> +			intel_de_read(dev_priv,
>  					       DSPTILEOFF(i9xx_plane));
>  		else
> -			offset = intel_de_read(dev_priv,
> +			intel_de_read(dev_priv,
>  					       DSPLINOFF(i9xx_plane));
>  		base = intel_de_read(dev_priv, DSPSURF(i9xx_plane)) & 0xfffff000;
>  	} else {

-- 
Jani Nikula, Intel Open Source Graphics Center
