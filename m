Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B6A3C8F9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 20:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6A710E35D;
	Wed, 19 Feb 2025 19:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIB+0NEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2910E35D;
 Wed, 19 Feb 2025 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739994019; x=1771530019;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FixTnbLB8ynF1WmXJrD4c2cnCEGf3KFr2M2MKl4fW3k=;
 b=OIB+0NEmwOBhIqsqlgbq6l8tL+YCeb3ny6p85eop5iPwBf5dw0iJK6fV
 /0nrCisA6W6CBQ7wQicyWzMDhvcO4AfzrRP6rtX/N51yAlpkUBJV1T8xg
 N9MKUsiGvKbsFo1q1zNuk8jLWfQWj4/tOf+1NtFf+ua9pyG0tVD607AZd
 PCCG/uQKtLqCSCzvkuTlAyqTrIeVEuOrySnxJwp0O9LsP/FMKVUUuTOKY
 hRlLLe5F3/thyMYah1Uv5XN/VkR5vUDpOL+cMWfM/e1xb5/IwG1Gm8Bqk
 DN7iK2J9it3WrjfUo0p4uyqxmzwmaiSX8CrswTwpg3Fuzaz8qltyLrz7a w==;
X-CSE-ConnectionGUID: FeBW/M53TqWJ+DVSufBWvw==
X-CSE-MsgGUID: bZ48tRteShST+iW84cUwgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44519783"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="44519783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:39:59 -0800
X-CSE-ConnectionGUID: UDfYFy5ARdi9xZZMzkZgDQ==
X-CSE-MsgGUID: XUTvgbEsTPutEzatsHTO1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="115011627"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Feb 2025 10:53:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2025 20:53:41 +0200
Date: Wed, 19 Feb 2025 20:53:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Naveen Kumar <naveen1.kumar@intel.com>
Subject: Re: [PATCH v6 2/3] drm/plane: modify create_in_formats to
 accommodate async
Message-ID: <Z7YotTllfzjddNcL@intel.com>
References: <20250219-asyn-v6-0-b959e6becb3c@intel.com>
 <20250219-asyn-v6-2-b959e6becb3c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-asyn-v6-2-b959e6becb3c@intel.com>
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

On Wed, Feb 19, 2025 at 02:47:24PM +0530, Arun R Murthy wrote:
> create_in_formats creates the list of supported format/modifiers for
> synchronous flips, modify the same function so as to take the
> format_mod_supported as argument and create list of format/modifier for
> async as well.
> 
> v5: create_in_formats can return -ve value in failure case, correct the
> if condition to check the creation of blob <Chaitanya>
> Dont add the modifier for which none of the formats is not supported.
> v6: Remove the code for masking the unsupported modifiers as UMD can
> leave with it. (Naveen/Chaitanya)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 45 +++++++++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index fe181c1002171acc68d3054c2d178f9b9f501fe2..fc26ef8a6cab346c9491495b57f88f1eb205d22c 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -193,9 +193,12 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
>  	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
>  }
>  
> -static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
> +static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane,
> +				 bool (*format_mod_supported)
> +						(struct drm_plane *plane,
> +						 uint32_t format,
> +						 uint64_t modifier))
>  {
> -	const struct drm_mode_config *config = &dev->mode_config;
>  	struct drm_property_blob *blob;
>  	struct drm_format_modifier *mod;
>  	size_t blob_size, formats_size, modifiers_size;
> @@ -237,13 +240,17 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  	mod = modifiers_ptr(blob_data);
>  	for (i = 0; i < plane->modifier_count; i++) {
>  		for (j = 0; j < plane->format_count; j++) {
> -			if (!plane->funcs->format_mod_supported ||
> -			    plane->funcs->format_mod_supported(plane,
> -							       plane->format_types[j],
> -							       plane->modifiers[i])) {
> +			if (!format_mod_supported || format_mod_supported
> +							(plane,
> +							 plane->format_types[j],
> +							 plane->modifiers[i])) {

Weird line breaks.

>  				mod->formats |= 1ULL << j;
>  			}
>  		}
> +		if (!mod->formats) {
> +			blob_data->count_modifiers--;
> +			continue;
> +		}

I hope no userspace rejects the blob if there
is extra data at the end...

Since this can actually change the behaviour 
I think this one needs to be a separate patch
in case we need a revert later.

>  
>  		mod->modifier = plane->modifiers[i];
>  		mod->offset = 0;
> @@ -251,10 +258,7 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
>  		mod++;
>  	}
>  
> -	drm_object_attach_property(&plane->base, config->modifiers_property,
> -				   blob->base.id);
> -
> -	return 0;
> +	return blob->base.id;

The return type is wrong for this.

I think it'd probably be better to return
struct drm_property_blob* instead so we can
return errors properly as well.

>  }
>  
>  /**
> @@ -371,6 +375,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  	};
>  	unsigned int format_modifier_count = 0;
>  	int ret;
> +	int blob_id;
>  
>  	/* plane index is used with 32bit bitmasks */
>  	if (WARN_ON(config->num_total_plane >= 32))
> @@ -477,8 +482,24 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  		drm_plane_create_hotspot_properties(plane);
>  	}
>  
> -	if (format_modifier_count)
> -		create_in_format_blob(dev, plane);
> +	if (format_modifier_count) {
> +		blob_id = create_in_format_blob(dev, plane,
> +						plane->funcs->format_mod_supported);
> +		if (blob_id > 0)
> +			drm_object_attach_property(&plane->base,
> +						   config->modifiers_property,
> +						   blob_id);
> +	}
> +
> +	if (plane->funcs->format_mod_supported_async) {
> +		blob_id = create_in_format_blob(dev, plane,
> +						plane->funcs->format_mod_supported_async);
> +		if (blob_id > 0)
> +			drm_object_attach_property(&plane->base,
> +						   config->async_modifiers_property,
> +						   blob_id);
> +	}
> +
>  
>  	return 0;
>  }
> 
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
