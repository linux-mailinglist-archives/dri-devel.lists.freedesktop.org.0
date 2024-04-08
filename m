Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A289CB84
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 20:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35841127F8;
	Mon,  8 Apr 2024 18:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgAwc20x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515E211292C;
 Mon,  8 Apr 2024 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712599863; x=1744135863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6agTnyCAhDq1HzcHIodsGtM2CgMbMrLkaqyqn3MODqA=;
 b=QgAwc20xxejE5zJQYBYXIn/gQBdQfCAstwJCLQPyHFiTGPA9kKhuf43Q
 C6B2LGC4MtsNIW3q1IfnGOFDTkHlrGqxTR6Vf1pt+OK5OIyK9YM4omgRe
 4fWXZx4oHJxsBkqWktjl8mJ4gI+3e+JMkZnoexTUpAl7lmDSPOq+XYUkr
 ujKP5g20vVI5QzYp9pS7IGHyIgHKLTODpxhwm+4nu7Ia664HAPna4adkA
 QtkaPjgtEnVgyNRSOMJ6X9S0eufO3t/1sOn8bjFiULWh8in5G2abAqSBT
 QBoX4j4xQmzBItqOsNYQ3W0nrQwl3JWrt6yqa7od7dpwgrB1eqq/vCOZ5 A==;
X-CSE-ConnectionGUID: rF6U/JMtTWKJiMPxQ6vXlQ==
X-CSE-MsgGUID: 4UCxKGZrTiu8aDaVmSjC+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8018227"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="8018227"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792367"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792367"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 11:11:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 21:10:59 +0300
Date: Mon, 8 Apr 2024 21:10:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/edid: add drm_edid_get_product_id()
Message-ID: <ZhQzM2bCCKDr0IsY@intel.com>
References: <cover.1711015462.git.jani.nikula@intel.com>
 <e3e7194ae72190a48916defa77b0a4de2fc87086.1711015462.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3e7194ae72190a48916defa77b0a4de2fc87086.1711015462.git.jani.nikula@intel.com>
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

On Thu, Mar 21, 2024 at 12:05:09PM +0200, Jani Nikula wrote:
> Add a struct drm_edid based function to get the vendor and product ID
> from an EDID. Add a separate struct for defining this part of the EDID,
> with defined byte order for product code and serial number.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 15 +++++++++++++++
>  include/drm/drm_edid.h     | 25 ++++++++++++++++++++-----
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ea77577a3786..626a0e24e66a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2756,6 +2756,21 @@ const struct drm_edid *drm_edid_read(struct drm_connector *connector)
>  }
>  EXPORT_SYMBOL(drm_edid_read);
>  
> +/**
> + * drm_edid_get_product_id - Get the vendor and product identification
> + * @drm_edid: EDID
> + * @id: Where to place the product id
> + */
> +void drm_edid_get_product_id(const struct drm_edid *drm_edid,
> +			     struct drm_edid_product_id *id)
> +{
> +	if (drm_edid && drm_edid->edid && drm_edid->size >= EDID_LENGTH)
> +		memcpy(id, &drm_edid->edid->product_id, sizeof(*id));
> +	else
> +		memset(id, 0, sizeof(*id));
> +}
> +EXPORT_SYMBOL(drm_edid_get_product_id);
> +
>  /**
>   * drm_edid_get_panel_id - Get a panel's ID from EDID
>   * @drm_edid: EDID that contains panel ID.
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 6f65bbf655a1..7911a2f8a672 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -272,14 +272,27 @@ struct detailed_timing {
>  #define DRM_EDID_DSC_MAX_SLICES			0xf
>  #define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
>  
> +struct drm_edid_product_id {
> +	u8 manufacturer_name[2];

__be16?

> +	__le16 product_code;
> +	__le32 serial_number;
> +	u8 week_of_manufacture;
> +	u8 year_of_manufacture;
> +} __packed;
> +
>  struct edid {
>  	u8 header[8];
>  	/* Vendor & product info */
> -	u8 mfg_id[2];
> -	u8 prod_code[2];
> -	u32 serial; /* FIXME: byte order */
> -	u8 mfg_week;
> -	u8 mfg_year;
> +	union {
> +		struct drm_edid_product_id product_id;
> +		struct {
> +			u8 mfg_id[2];
> +			u8 prod_code[2];
> +			u32 serial; /* FIXME: byte order */
> +			u8 mfg_week;
> +			u8 mfg_year;
> +		} __packed;
> +	} __packed;
>  	/* EDID version */
>  	u8 version;
>  	u8 revision;
> @@ -466,6 +479,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
>  			      const struct drm_edid *edid);
>  int drm_edid_connector_add_modes(struct drm_connector *connector);
>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> +void drm_edid_get_product_id(const struct drm_edid *drm_edid,
> +			     struct drm_edid_product_id *id);
>  
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
