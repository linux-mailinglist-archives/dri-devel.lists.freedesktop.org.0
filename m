Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F86722C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3910E789;
	Wed, 18 Jan 2023 16:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152510E775;
 Wed, 18 Jan 2023 16:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674058539; x=1705594539;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o48YeKxucyzC6tpr2gbeZur+i3oyufCeS+2xn1C+Kk0=;
 b=hXIJQLZlGo2tVrl8jYVFtJrVUrOi8/9Lq+J5vEHZZPtA6sA5aDpnUhjQ
 gYRZQEkfx2YSwZ4AYdYe7Rsk+EkwhiUclhYXqpONs4xjcyAAt3sCCVDlm
 bgPYQxo99+ocoT8w8ty7Zjp3o1CRhzDfQJDlLBu6j7rSdlBnfzr5rGNPd
 YQTR+hXkdBDDidt4NTLsgg/fY1k0tYAAOS/g8GLUnsoXDU4Z1KRMNwvkC
 hcJBnuTA/G9ZivUQ5R2bXhplGcPbWvXq699rMNRZd7B5VYPTkzCWVG3sN
 XMFUJ2UBJlxjArqNoKVLjl+1Ziny7arRvj4crb72la4CbZks1aPbbuDc+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326285177"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326285177"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692056140"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="692056140"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga001.jf.intel.com with SMTP; 18 Jan 2023 08:15:10 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 18:15:09 +0200
Date: Wed, 18 Jan 2023 18:15:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 15/22] drm/edid: move EDID BPC quirk application to
 update_display_info()
Message-ID: <Y8gbDbJRFFt969G6@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <8997e0fa3b0fd03c920e72d1dff24c0d96ff4dd0.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8997e0fa3b0fd03c920e72d1dff24c0d96ff4dd0.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:30PM +0200, Jani Nikula wrote:
> The BPC quirks are closer to home in update_display_info().
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 810a5fca398a..5881df5bddb9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6555,6 +6555,18 @@ static void update_display_info(struct drm_connector *connector,
>  	if (info->quirks & EDID_QUIRK_CAP_DSC_15BPP)
>  		info->max_dsc_bpp = 15;
>  
> +	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
> +		info->bpc = 6;
> +
> +	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
> +		info->bpc = 8;
> +
> +	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
> +		info->bpc = 10;
> +
> +	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
> +		info->bpc = 12;
> +
>  	/* Depends on info->cea_rev set by drm_parse_cea_ext() above */
>  	drm_edid_to_eld(connector, drm_edid);
>  }
> @@ -6654,7 +6666,7 @@ static int add_displayid_detailed_modes(struct drm_connector *connector,
>  static int _drm_edid_connector_update(struct drm_connector *connector,
>  				      const struct drm_edid *drm_edid)
>  {
> -	struct drm_display_info *info = &connector->display_info;
> +	const struct drm_display_info *info = &connector->display_info;
>  	int num_modes = 0;
>  
>  	/*
> @@ -6694,18 +6706,6 @@ static int _drm_edid_connector_update(struct drm_connector *connector,
>  	if (info->quirks & (EDID_QUIRK_PREFER_LARGE_60 | EDID_QUIRK_PREFER_LARGE_75))
>  		edid_fixup_preferred(connector);
>  
> -	if (info->quirks & EDID_QUIRK_FORCE_6BPC)
> -		info->bpc = 6;
> -
> -	if (info->quirks & EDID_QUIRK_FORCE_8BPC)
> -		info->bpc = 8;
> -
> -	if (info->quirks & EDID_QUIRK_FORCE_10BPC)
> -		info->bpc = 10;
> -
> -	if (info->quirks & EDID_QUIRK_FORCE_12BPC)
> -		info->bpc = 12;
> -
>  	return num_modes;
>  }
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
