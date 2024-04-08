Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5889CB6D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 20:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7210EA83;
	Mon,  8 Apr 2024 18:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxFZUgFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3D10EA83;
 Mon,  8 Apr 2024 18:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712599526; x=1744135526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OZu+Zu9h3smjwzoCCSagP6Utyt0FPhaH+P/3YyGL3V0=;
 b=UxFZUgFxVNxdZEojS802rbwdVNpPgVQBZgj0y1krfKuOWAPy9KzzeIkx
 +DtZC3UBo24P1DqORp1TmfZeu6q69WsSaRoBerfH3tK+YNixpAZRkcu88
 GkAgPW54f82eDLzwbDjGWOZxail4X48GRGryvPy7IxXukHahWI9EK3QH2
 JgWMufgltpXmrjcMGfzukbYGiaH/MYrsdaH3yheBZE4F53copR7I8bg8z
 mtBsRb014Sr7QW2E4YIsx9LpPLBoMO07hguQ5oCftnGGRmtqxa63YbLre
 0gqyDV0r0ZuL31dkzLc5piqTIw4vmgtUZOzH6wUMd3NSYXK44JFigqa49 w==;
X-CSE-ConnectionGUID: 1SUprTUVTcyXIbepdY0lSQ==
X-CSE-MsgGUID: 8h3ab5q4Sr+6B9nGgsNnBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10867366"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="10867366"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792364"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792364"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 11:05:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 21:05:22 +0300
Date: Mon, 8 Apr 2024 21:05:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/4] drm/edid: add drm_edid_print_product_id()
Message-ID: <ZhQx4gWk_4whJqrD@intel.com>
References: <cover.1711015462.git.jani.nikula@intel.com>
 <dcefe0474d74f818e250677982b32c767b466110.1711015462.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcefe0474d74f818e250677982b32c767b466110.1711015462.git.jani.nikula@intel.com>
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

On Thu, Mar 21, 2024 at 12:05:10PM +0200, Jani Nikula wrote:
> Add a function to print a decoded EDID vendor and product id to a drm
> printer, optinally with the raw data.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 35 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_edid.h     |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 626a0e24e66a..198986f0eb8b 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -29,6 +29,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/byteorder/generic.h>
>  #include <linux/cec.h>
>  #include <linux/hdmi.h>
>  #include <linux/i2c.h>
> @@ -2771,6 +2772,40 @@ void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>  }
>  EXPORT_SYMBOL(drm_edid_get_product_id);
>  
> +/**
> + * drm_edid_print_product_id - Print decoded product id to printer
> + * @p: drm printer
> + * @id: EDID product id
> + * @raw: If true, also print the raw hex
> + */
> +void drm_edid_print_product_id(struct drm_printer *p,
> +			       const struct drm_edid_product_id *id, bool raw)
> +{
> +	u16 mfg_id = id->manufacturer_name[0] << 8 | id->manufacturer_name[1];
> +	char *date;
> +	char vend[4];
> +
> +	drm_edid_decode_mfg_id(mfg_id, vend);
> +
> +	if (id->week_of_manufacture == 0xff)

Didn't realize this had a loaded meaning. Maybe we should also
skip the week printout if week==0? Otherwise people might think
week==0 means the first week.

> +		date = kasprintf(GFP_KERNEL, "model year: %d",
> +				 id->year_of_manufacture + 1990);
> +	else
> +		date = kasprintf(GFP_KERNEL, "week: %d, year of manufacture: %d",

The "week: %d" part feels a bit left out here. Maybe this should be
formatted as "week/year of manufacture: %d/%d"? 

Not sure I like the kasprintf(). Maybe use an on-stack buffer?

> +				 id->week_of_manufacture,
> +				 id->year_of_manufacture + 1990);
> +
> +	drm_printf(p, "manufacturer name: %s, product code: %u, serial number: %u, %s\n",
> +		   vend, le16_to_cpu(id->product_code),
> +		   le32_to_cpu(id->serial_number), date ?: "");
> +
> +	if (raw)
> +		drm_printf(p, "raw product id: %*ph\n", (int)sizeof(*id), id);
> +
> +	kfree(date);
> +}
> +EXPORT_SYMBOL(drm_edid_print_product_id);
> +
>  /**
>   * drm_edid_get_panel_id - Get a panel's ID from EDID
>   * @drm_edid: EDID that contains panel ID.
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 7911a2f8a672..c763ba1a0bbd 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -30,6 +30,7 @@ struct drm_connector;
>  struct drm_device;
>  struct drm_display_mode;
>  struct drm_edid;
> +struct drm_printer;
>  struct hdmi_avi_infoframe;
>  struct hdmi_vendor_infoframe;
>  struct i2c_adapter;
> @@ -481,6 +482,8 @@ int drm_edid_connector_add_modes(struct drm_connector *connector);
>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>  void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>  			     struct drm_edid_product_id *id);
> +void drm_edid_print_product_id(struct drm_printer *p,
> +			       const struct drm_edid_product_id *id, bool raw);
>  
>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>  				  int ext_id, int *ext_index);
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
