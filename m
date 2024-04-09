Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8801E89DF6F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F409210E895;
	Tue,  9 Apr 2024 15:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqR+rWFo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8E4112D4B;
 Tue,  9 Apr 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712677261; x=1744213261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JDOwyp0EG56ABIeUrHRnuk9DY1zpJQXLrpp81oyxOsI=;
 b=JqR+rWFoOODW3UeZzJFBM3WY4BQ/v4TawG2M4wmHEN/SHDmubFBTajjb
 Fsfu1whc93nyHLDAm99MNF5gIjBlQO/wuSy3vSBKhFSz1lraKU8eBUS4S
 kv+93TDxkKQjFDFUF/zhsqk0FxamWWXRjFIgelIDVT4XMB/JU3D0uAiRN
 kOKlhhxtGYWKWZq+Wg5CVrPOHzPWgUXvkrPEUUaxcxam6CPXSTCK1UVvY
 10jK/3/7TpUK4i3+Ncs/uZu6bTRZHcWE+a9/49CJfUECVZlg/H6FdEF2s
 hWBK45vUquZvjok6+ZzqBi0NRpx417GmwSWuCa00KZF4+GImU7FpCiQgL w==;
X-CSE-ConnectionGUID: jM8aHFWNTnydIBX6oLbmFQ==
X-CSE-MsgGUID: piger2KbSKWT6Yno9Rzbng==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7866790"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7866790"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="827792663"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="827792663"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 09 Apr 2024 08:40:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Apr 2024 18:40:47 +0300
Date: Tue, 9 Apr 2024 18:40:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v2 3/4] drm/i915/bios: switch to struct drm_edid and
 struct drm_edid_product_id
Message-ID: <ZhVhf0snHrjPKZEi@intel.com>
References: <cover.1712655867.git.jani.nikula@intel.com>
 <ec5148dd43221b32cb2066bc7fd264a069c1188b.1712655867.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5148dd43221b32cb2066bc7fd264a069c1188b.1712655867.git.jani.nikula@intel.com>
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

On Tue, Apr 09, 2024 at 12:46:11PM +0300, Jani Nikula wrote:
> To avoid accessing and parsing the raw EDID with drm_edid_raw(), switch
> to the struct drm_edid based function to extract product id, and use the
> drm printer function to debug log it.
> 
> The underlying assumption is that struct drm_edid_product_id and struct
> lvds_pnp_id describe identical data, albeit with slightly different
> member definitions.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 43 ++++++++++-------------
>  1 file changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index 2abd2d7ceda2..3d89e4b39fed 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -600,6 +600,9 @@ get_lvds_pnp_id(const struct bdb_lvds_lfp_data *data,
>  		const struct bdb_lvds_lfp_data_ptrs *ptrs,
>  		int index)
>  {
> +	/* These two are supposed to have the same layout in memory. */
> +	BUILD_BUG_ON(sizeof(struct lvds_pnp_id) != sizeof(struct drm_edid_product_id));
> +
>  	return (const void *)data + ptrs->ptr[index].panel_pnp_id.offset;
>  }
>  
> @@ -613,19 +616,6 @@ get_lfp_data_tail(const struct bdb_lvds_lfp_data *data,
>  		return NULL;
>  }
>  
> -static void dump_pnp_id(struct drm_i915_private *i915,
> -			const struct lvds_pnp_id *pnp_id,
> -			const char *name)
> -{
> -	u16 mfg_name = be16_to_cpu((__force __be16)pnp_id->mfg_name);
> -	char vend[4];
> -
> -	drm_dbg_kms(&i915->drm, "%s PNPID mfg: %s (0x%x), prod: %u, serial: %u, week: %d, year: %d\n",
> -		    name, drm_edid_decode_mfg_id(mfg_name, vend),
> -		    pnp_id->mfg_name, pnp_id->product_code, pnp_id->serial,
> -		    pnp_id->mfg_week, pnp_id->mfg_year + 1990);
> -}
> -
>  static int opregion_get_panel_type(struct drm_i915_private *i915,
>  				   const struct intel_bios_encoder_data *devdata,
>  				   const struct drm_edid *drm_edid, bool use_fallback)
> @@ -664,21 +654,21 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
>  {
>  	const struct bdb_lvds_lfp_data *data;
>  	const struct bdb_lvds_lfp_data_ptrs *ptrs;
> -	const struct lvds_pnp_id *edid_id;
> -	struct lvds_pnp_id edid_id_nodate;
> -	const struct edid *edid = drm_edid_raw(drm_edid); /* FIXME */
> +	struct drm_edid_product_id product_id, product_id_nodate;
> +	struct drm_printer p;
>  	int i, best = -1;
>  
> -	if (!edid)
> +	if (!drm_edid)
>  		return -1;
>  
> -	edid_id = (const void *)&edid->mfg_id[0];
> +	drm_edid_get_product_id(drm_edid, &product_id);

I don't really like s/edid_id/product_id/ rename.
The variable names were trying to convey the source of
the data (EDID vs. VBT).

But not a huge deal wither way. Series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
> -	edid_id_nodate = *edid_id;
> -	edid_id_nodate.mfg_week = 0;
> -	edid_id_nodate.mfg_year = 0;
> +	product_id_nodate = product_id;
> +	product_id_nodate.week_of_manufacture = 0;
> +	product_id_nodate.year_of_manufacture = 0;
>  
> -	dump_pnp_id(i915, edid_id, "EDID");
> +	p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "EDID");
> +	drm_edid_print_product_id(&p, &product_id, true);
>  
>  	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
>  	if (!ptrs)
> @@ -693,7 +683,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
>  			get_lvds_pnp_id(data, ptrs, i);
>  
>  		/* full match? */
> -		if (!memcmp(vbt_id, edid_id, sizeof(*vbt_id)))
> +		if (!memcmp(vbt_id, &product_id, sizeof(*vbt_id)))
>  			return i;
>  
>  		/*
> @@ -701,7 +691,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
>  		 * and the VBT entry does not specify a date.
>  		 */
>  		if (best < 0 &&
> -		    !memcmp(vbt_id, &edid_id_nodate, sizeof(*vbt_id)))
> +		    !memcmp(vbt_id, &product_id_nodate, sizeof(*vbt_id)))
>  			best = i;
>  	}
>  
> @@ -888,6 +878,7 @@ parse_lfp_data(struct drm_i915_private *i915,
>  	const struct bdb_lvds_lfp_data_tail *tail;
>  	const struct bdb_lvds_lfp_data_ptrs *ptrs;
>  	const struct lvds_pnp_id *pnp_id;
> +	struct drm_printer p;
>  	int panel_type = panel->vbt.panel_type;
>  
>  	ptrs = bdb_find_section(i915, BDB_LVDS_LFP_DATA_PTRS);
> @@ -902,7 +893,9 @@ parse_lfp_data(struct drm_i915_private *i915,
>  		parse_lfp_panel_dtd(i915, panel, data, ptrs);
>  
>  	pnp_id = get_lvds_pnp_id(data, ptrs, panel_type);
> -	dump_pnp_id(i915, pnp_id, "Panel");
> +
> +	p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "Panel");
> +	drm_edid_print_product_id(&p, (const struct drm_edid_product_id *)pnp_id, false);
>  
>  	tail = get_lfp_data_tail(data, ptrs);
>  	if (!tail)
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
