Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8BA173C3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 21:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF710E486;
	Mon, 20 Jan 2025 20:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgrCSBnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5010E486;
 Mon, 20 Jan 2025 20:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737406033; x=1768942033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F7vbQdM55xTpKQySkpmOL5mDIjLNzf9dAh9NEDNXHjQ=;
 b=bgrCSBnDL+U/zRaQLM5Ie7nEz42exO0vzOYJ+ADGGuED5rHPWsGhX3lb
 a9mi/Wrbvs3l9plkB0oyK/JNgZVcW2a6N0R+dIFunvmUgEaxYmGY3I1RT
 mkBAT3SGVibwoUqEMAqQ/wOTRwhXAz1K1HDDGADOPYP2e96ozuz/jdv61
 OlHByVMY7RYTaiT5vgVXtvA/MIE3c38utx7Rc2xx4ObuNCD//MxO+eD2H
 MUGJUPKlF/0IGBFNA5IKTF8TgKnIXM79YS0RHRsQB7+JnqynqMxOjk0kP
 CwizF3tXpSZE06DVVMEYsvRycq4lg9iJp6PQntPXumD2viLfn9hiHy+UM w==;
X-CSE-ConnectionGUID: I2z0KoqgR/usthjTBgJJLw==
X-CSE-MsgGUID: rXDhNNhoR/+aTW1wxBvmCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37833733"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="37833733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 12:47:13 -0800
X-CSE-ConnectionGUID: GRe51EnkSbGLdOWU7zrI+w==
X-CSE-MsgGUID: uYZlXWjHSniuzUln7JmkFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; d="scan'208";a="106737484"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Jan 2025 12:47:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 20 Jan 2025 22:47:09 +0200
Date: Mon, 20 Jan 2025 22:47:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] drm/i915/display: Populate list of async
 supported formats/modifiers
Message-ID: <Z462TS-6qRPz7eOb@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-4-f4399635eec9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108-asyn-v3-4-f4399635eec9@intel.com>
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

On Wed, Jan 08, 2025 at 11:09:02AM +0530, Arun R Murthy wrote:
> Populate the list of formats/modifiers supported by async flip. Register
> a async property and expose the same to user through blob.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/skl_universal_plane.c | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ff9764cac1e71959e56283f61b5192ea261cec7a..e5e47f2219dae62e76cbde2efb40266b047ab2b2 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -170,6 +170,44 @@ static const u32 icl_hdr_plane_formats[] = {
>  	DRM_FORMAT_XVYU16161616,
>  };
>  
> +static u64 tgl_asyn_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	I915_FORMAT_MOD_X_TILED,
> +	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_4_TILED,
> +	I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> +	I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> +	I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
> +	I915_FORMAT_MOD_4_TILED_BMG_CCS,
> +	I915_FORMAT_MOD_4_TILED_LNL_CCS,
> +};
> +
> +static u64 icl_async_modifiers[] = {
> +	I915_FORMAT_MOD_X_TILED,
> +	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_Yf_TILED,
> +	I915_FORMAT_MOD_Y_TILED_CCS,
> +	I915_FORMAT_MOD_Yf_TILED_CCS,
> +};
> +
> +static u64 skl_async_modifiers[] = {
> +	I915_FORMAT_MOD_X_TILED,
> +	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_Yf_TILED,
> +};
> +
> +static u32 intel_async_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XRGB2101010,
> +	DRM_FORMAT_XBGR2101010,
> +	DRM_FORMAT_XRGB16161616F,
> +	DRM_FORMAT_XBGR16161616F,
> +};

I've just pushed my .can_async_flip() thing. I'm thinking with
that all this can just disappear and we can have a completely
generic implementation. Eg something like:

intel_plane_format_mod_supported_async()
{
	// some generic checks here (eg. reject planar formats)

	return plane->format_mod_supported() &&
		plane->can_async_flip();
}

> +
>  int skl_format_to_fourcc(int format, bool rgb_order, bool alpha)
>  {
>  	switch (format) {
> @@ -2613,6 +2651,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
>  	unsigned int supported_rotations;
>  	unsigned int supported_csc;
>  	const u64 *modifiers;
> +	u64 *async_modifiers;
>  	const u32 *formats;
>  	int num_formats;
>  	int ret;
> @@ -2715,6 +2754,18 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
>  	if (ret)
>  		goto fail;
>  
> +	if (DISPLAY_VER(dev_priv) >= 12)
> +		async_modifiers = tgl_asyn_modifiers;
> +	else if (DISPLAY_VER(dev_priv) == 11)
> +		async_modifiers = icl_async_modifiers;
> +	else
> +		async_modifiers = skl_async_modifiers;
> +
> +	drm_plane_create_format_blob(&dev_priv->drm, &plane->base,
> +				     async_modifiers, sizeof(async_modifiers),
> +				     intel_async_formats,
> +				     sizeof(intel_async_formats), true);
> +
>  	if (DISPLAY_VER(dev_priv) >= 13)
>  		supported_rotations = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>  	else
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
