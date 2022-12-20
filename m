Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65065652090
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 13:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294E010E0A6;
	Tue, 20 Dec 2022 12:36:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC4C10E099;
 Tue, 20 Dec 2022 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671539781; x=1703075781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DoA/cand5GZK1y2u65AYXJaJ79LjAAVyBESYmM0f8fA=;
 b=iqcH8poEbgu1jqlrgRrnhVf0Y87lmpqyWyVoK50OFQB6Htcrp+PE7mzx
 xO77quNxhvYv7Svk7mn9D744OGDUL7tt+BFylqlaLBUM9VC7WTEMo/t6d
 n5fa+o7CMQH02v9GRLQoXHup1ThVSwxaLNahlyf+NvwpH0nrM0Ygcbp0K
 lenNVBE+UieeFz9keZWPowwgfDZ1YE40v+fHm4vh9p+MHUY5Xie7i/Mj2
 PQ5tFV0tl0XhJEVFAZgkD13sQ4+Dc3rlR+xSNCoejaMAj4Y7kYdrcliLC
 N90T5t054jqMxx+3KE346PITaLRD843c6XnmrKvAk2mq2qA2Iavbgy85M Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299277046"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="299277046"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 04:36:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="714402787"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="714402787"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga008.fm.intel.com with SMTP; 20 Dec 2022 04:36:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 14:36:17 +0200
Date: Tue, 20 Dec 2022 14:36:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 06/12] drm/edid: refactor _drm_edid_connector_update()
 and rename
Message-ID: <Y6GsQXvDKPKsHf30@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
 <f35102562feb9ca63462a902a582c3494fccde4d.1671206131.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f35102562feb9ca63462a902a582c3494fccde4d.1671206131.git.jani.nikula@intel.com>
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

On Fri, Dec 16, 2022 at 06:00:20PM +0200, Jani Nikula wrote:
> By moving update_display_info() out of _drm_edid_connector_update() we
> make the function purely about adding modes.

I don't think that's quite true. The 4:2:0 stuff still updates
various display_info things from the mode parsing functions.

> Rename accordingly.
> 
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 15f69c362fc3..4ebfd7212bce 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6575,19 +6575,12 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  	return num_modes;
>  }
>  
> -static int _drm_edid_connector_update(struct drm_connector *connector,
> -				      const struct drm_edid *drm_edid)
> +static int _drm_edid_connector_add_modes(struct drm_connector *connector,
> +					 const struct drm_edid *drm_edid)
>  {
>  	const struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
>  
> -	/*
> -	 * CEA-861-F adds ycbcr capability map block, for HDMI 2.0 sinks.
> -	 * To avoid multiple parsing of same block, lets parse that map
> -	 * from sink info, before parsing CEA modes.
> -	 */
> -	update_display_info(connector, drm_edid);
> -
>  	if (!drm_edid)
>  		return 0;
>  
> @@ -6692,7 +6685,9 @@ int drm_edid_connector_update(struct drm_connector *connector,
>  {
>  	int count;
>  
> -	count = _drm_edid_connector_update(connector, drm_edid);
> +	update_display_info(connector, drm_edid);
> +
> +	count = _drm_edid_connector_add_modes(connector, drm_edid);
>  
>  	_drm_update_tile_info(connector, drm_edid);
>  
> @@ -6762,7 +6757,8 @@ EXPORT_SYMBOL(drm_connector_update_edid_property);
>   */
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  {
> -	struct drm_edid drm_edid;
> +	struct drm_edid _drm_edid;
> +	const struct drm_edid *drm_edid;
>  
>  	if (edid && !drm_edid_is_valid(edid)) {
>  		drm_warn(connector->dev, "[CONNECTOR:%d:%s] EDID invalid.\n",
> @@ -6770,8 +6766,11 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  		edid = NULL;
>  	}
>  
> -	return _drm_edid_connector_update(connector,
> -					  drm_edid_legacy_init(&drm_edid, edid));
> +	drm_edid = drm_edid_legacy_init(&_drm_edid, edid);
> +
> +	update_display_info(connector, drm_edid);
> +
> +	return _drm_edid_connector_add_modes(connector, drm_edid);
>  }
>  EXPORT_SYMBOL(drm_add_edid_modes);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
