Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A328D4E9DD0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6D10E752;
	Mon, 28 Mar 2022 17:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704A810E759;
 Mon, 28 Mar 2022 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648489713; x=1680025713;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GTqqQhU/f11iZgNtCu9YKlkjuz2frAxBEz6myxYcT2A=;
 b=EZIH3XJ6iJ+uCG1QobCxxmzj8JmUelpHAAtPFXrxeFH8aifE/+VzZYvg
 KFj3WonpU7PygWb/jZ1JvAX+MrEiTLGwhn/HSCDM518gLeUQDhN0MmAZV
 AwD0/wvfcSrioSWhzKh45HRBJGJaCxqZujhLV3qutRAqW+YHGUF1hulOJ
 nGSUANAAw+8FWT3ho5k3Gn/9WekzR8lU1dxcRw4Ls8MPYOAtQXxpyJR7h
 zmc7rhUwITK5Ulkbx+jNcKFu9/WWhQwOI73JUQNbrJPk1gcF3JOMRhIva
 3e8BXbTkF4Pz29vH/mW9Hic6eQX4mN2Pi64fYybs1KcyhADP/h/StNIrP w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246556862"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="246556862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="563865356"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga008.jf.intel.com with SMTP; 28 Mar 2022 10:48:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:48:08 +0300
Date: Mon, 28 Mar 2022 20:48:08 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 12/12] drm/edid: split drm_add_edid_modes() to two
Message-ID: <YkH02F/kGQSBQDi+@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <437c3c79f68d1144444fb2dd18a678f3aa97272c.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <437c3c79f68d1144444fb2dd18a678f3aa97272c.1648477901.git.jani.nikula@intel.com>
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

On Mon, Mar 28, 2022 at 05:34:33PM +0300, Jani Nikula wrote:
> Reduce the size of the function that actually modifies the EDID.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 42 ++++++++++++++++++++++----------------
>  1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index d1abaa517867..d79b06f7f34c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5561,18 +5561,8 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> -/**
> - * drm_add_edid_modes - add modes from EDID data, if available
> - * @connector: connector we're probing
> - * @edid: EDID data
> - *
> - * Add the specified modes to the connector's mode list. Also fills out the
> - * &drm_display_info structure and ELD in @connector with any information which
> - * can be derived from the edid.
> - *
> - * Return: The number of modes added or 0 if we couldn't find any.
> - */
> -int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> +static int drm_edid_connector_update(struct drm_connector *connector,
> +				     const struct edid *edid)
>  {
>  	int num_modes = 0;
>  	u32 quirks;
> @@ -5581,12 +5571,6 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  		clear_eld(connector);
>  		return 0;
>  	}
> -	if (!drm_edid_is_valid(edid)) {
> -		clear_eld(connector);
> -		drm_warn(connector->dev, "%s: EDID invalid.\n",
> -			 connector->name);
> -		return 0;
> -	}
>  
>  	drm_edid_to_eld(connector, edid);
>  
> @@ -5638,6 +5622,28 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  
>  	return num_modes;
>  }
> +
> +/**
> + * drm_add_edid_modes - add modes from EDID data, if available
> + * @connector: connector we're probing
> + * @edid: EDID data
> + *
> + * Add the specified modes to the connector's mode list. Also fills out the
> + * &drm_display_info structure and ELD in @connector with any information which
> + * can be derived from the edid.
> + *
> + * Return: The number of modes added or 0 if we couldn't find any.
> + */
> +int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
> +{
> +	if (edid && !drm_edid_is_valid(edid)) {

drm_edid_is_valid() is very poorly named since it can mutate the EDID.
Also calling it here is kinda crazy instead of just validating when we
originally read the EDID. But those are things for to be fixed later.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		drm_warn(connector->dev, "%s: EDID invalid.\n",
> +			 connector->name);
> +		edid = NULL;
> +	}
> +
> +	return drm_edid_connector_update(connector, edid);
> +}
>  EXPORT_SYMBOL(drm_add_edid_modes);
>  
>  /**
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
