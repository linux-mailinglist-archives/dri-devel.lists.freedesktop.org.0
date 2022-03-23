Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349C64E5511
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 16:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2100110E6EC;
	Wed, 23 Mar 2022 15:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4E810E6EC;
 Wed, 23 Mar 2022 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648048904; x=1679584904;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RiqPIXCl76i0q5bteN3qHa4LwWo5wlf4EkuAIVO2uow=;
 b=OXsrQqfJHxOmIni9L+n5a4iVRfsKmS4Bn9LjZbbslMUoK9YMdrc+Ux1O
 /g1tNW7gg9ZFX/3zCeMOTErGtTjzA2VdFz9b4PMkuRPHiey7tw+hjKQ2Z
 e4g8nqxEu5KwKY+kgCBKIQG2LxWOM8o5PfL8lyyuJ3LVjTngGN/J6YgZ9
 OkfxYPIXRTuA/I4c3IdKxzu0iw8NCinnepB4iSPyuUHvllehCW53py+vF
 foo+cqsjDzhXnlOwQgzz/41h8n0FT68RYwK384oCtzrCPh5vPnl3HD8gF
 OOyRxwMcm8+xxB7/XB3JqYY5EDPnTSTMfZXu6LdL8fB4y/HiCY68LAW3m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="282981206"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="282981206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 08:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="560945091"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga008.jf.intel.com with SMTP; 23 Mar 2022 08:21:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 17:21:40 +0200
Date: Wed, 23 Mar 2022 17:21:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [RFC 01/19] drm/edid: add
 drm_edid_extension_block_count() and drm_edid_size()
Message-ID: <Yjs7BFh0OLLA7W94@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
 <c492b3887df42fa4166fb65ee10fa611c276cf98.1647985054.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c492b3887df42fa4166fb65ee10fa611c276cf98.1647985054.git.jani.nikula@intel.com>
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

On Tue, Mar 22, 2022 at 11:40:30PM +0200, Jani Nikula wrote:
> Add abstractions for getting the number of EDID extension blocks and the
> total EDID size in bytes.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 18 ++++++++++++++++++
>  include/drm/drm_edid.h     |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 561f53831e29..f4b49693e666 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2198,6 +2198,24 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_get_edid_switcheroo);
>  
> +/**
> + * drm_edid_extension_block_count - get the number of EDID extension blocks
> + */
> +u8 drm_edid_extension_block_count(const struct edid *edid)

It's just a number, so could be 'int' IMO.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +{
> +	return edid->extensions;
> +}
> +EXPORT_SYMBOL(drm_edid_extension_block_count);
> +
> +/**
> + * drm_edid_size - get the EDID size in bytes
> + */
> +size_t drm_edid_size(const struct edid *edid)
> +{
> +	return (drm_edid_extension_block_count(edid) + 1) * EDID_LENGTH;
> +}
> +EXPORT_SYMBOL(drm_edid_size);
> +
>  /**
>   * drm_edid_duplicate - duplicate an EDID and the extensions
>   * @edid: EDID to duplicate
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..7a19daa00c0c 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -564,6 +564,8 @@ struct edid *drm_get_edid(struct drm_connector *connector,
>  u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
>  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
>  				     struct i2c_adapter *adapter);
> +u8 drm_edid_extension_block_count(const struct edid *edid);
> +size_t drm_edid_size(const struct edid *edid);
>  struct edid *drm_edid_duplicate(const struct edid *edid);
>  int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
>  int drm_add_override_edid_modes(struct drm_connector *connector);
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
