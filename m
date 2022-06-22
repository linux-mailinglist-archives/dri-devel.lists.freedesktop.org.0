Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F2554EAA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 17:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517CC11341E;
	Wed, 22 Jun 2022 15:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E461120C1;
 Wed, 22 Jun 2022 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655910402; x=1687446402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rZ4PzsdHgYOZkU27YlfxeAHtdwjQou8Pe+igv+FJXMk=;
 b=S3LCPUmEh63lTCWWQyuHV/t/A0Q2dgCyphI6nvwOf6G3jYKO0L29TEfP
 WYHln8XLRs9bEYLdPjbO8YDVdUBKGJew0GFVtLfZVSJbWiTe5OH3rj8Tl
 gqw/ddeRr9VRgKz2fObpLPNrcy7wJXYyZprGJqp7lwOLiJiTmfS9bE3fi
 dICAuFB7Tn6Eik6HGlKOf1TSjabqjDVLOVDM+1/d9XAEM11tcDwLIDcvF
 xgYzX+M2PFLbyhwBxZDtyNzafS8O+O24db20Jd83+tr2qDv9J+hRu6K+Y
 UtpL+uqUGS9IynQ3rkRcbmNe3EQQvS5A+PmGFO+fP9z4/gD55GNmSMnLJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="269162289"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="269162289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 08:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="677595354"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by FMSMGA003.fm.intel.com with SMTP; 22 Jun 2022 08:05:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 18:05:37 +0300
Date: Wed, 22 Jun 2022 18:05:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 08/13] drm/i915/edid: convert DP, HDMI and LVDS to
 drm_edid
Message-ID: <YrMvwZZ/gKKf9sKK@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
 <944e7c45ca5a59f421926e94e6b12abccff78f92.1655895388.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <944e7c45ca5a59f421926e94e6b12abccff78f92.1655895388.git.jani.nikula@intel.com>
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

On Wed, Jun 22, 2022 at 01:59:22PM +0300, Jani Nikula wrote:
> @@ -948,27 +948,30 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
>  	 * preferred mode is the right one.
>  	 */
>  	mutex_lock(&dev->mode_config.mutex);
> -	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC)
> +	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
> +		const struct edid *edid;
> +
> +		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
>  		edid = drm_get_edid_switcheroo(connector,
> -				    intel_gmbus_get_adapter(dev_priv, pin));
> -	else
> -		edid = drm_get_edid(connector,
> -				    intel_gmbus_get_adapter(dev_priv, pin));
> -	if (edid) {
> -		if (drm_add_edid_modes(connector, edid)) {
> -			drm_connector_update_edid_property(connector,
> -								edid);
> -		} else {
> -			kfree(edid);
> -			edid = ERR_PTR(-EINVAL);
> +					       intel_gmbus_get_adapter(dev_priv, pin));
> +		if (edid)
> +			drm_edid = drm_edid_alloc(edid, (edid->extensions + 1) * EDID_LENGTH);

This one still seems to leak.

> +	} else {
> +		drm_edid = drm_edid_read_ddc(connector,
> +					     intel_gmbus_get_adapter(dev_priv, pin));
> +	}
> +	if (drm_edid) {
> +		if (!drm_edid_connector_update(connector, drm_edid)) {
> +			drm_edid_free(drm_edid);
> +			drm_edid = ERR_PTR(-EINVAL);
>  		}
>  	} else {
> -		edid = ERR_PTR(-ENOENT);
> +		drm_edid = ERR_PTR(-ENOENT);
>  	}
> -	intel_connector->edid = edid;
> +	intel_connector->edid = drm_edid;
>  
>  	intel_bios_init_panel(dev_priv, &intel_connector->panel, NULL,
> -			      IS_ERR(edid) ? NULL : edid);
> +			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
>  
>  	/* Try EDID first */
>  	intel_panel_add_edid_fixed_modes(intel_connector,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
