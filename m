Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F406E546D45
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 21:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379CA1137F9;
	Fri, 10 Jun 2022 19:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CFB1137F9;
 Fri, 10 Jun 2022 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654889388; x=1686425388;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kw2O03ud+ICZ9bU7pAeCqrqmzJWmnIcGdQY4MtKNxuQ=;
 b=Jw85QlAAQyhjmhHYY9gaqVPXeRGVTD51bb5DEhvNwp1+TxHzRKXcCOX8
 8i4eZ9vdTUw1gV2EMjVdDdO/6bA7Dur/7r5E1a17nfYfgW+6ok+mlQzUY
 U6QK5xwE4YbiX0yUI1AI9Fzdhi9b/upJdWkkGUhS0g6YkMqMf6JuAgY9K
 0RqUYR4j5jjjFof1KXrqc/gQzqH/8pigpEVufwdid4c7bVZAQErh7SHl8
 931s6b3sHb8w5Mn3FHS/Bwy1658BoHjj4wJNmy8kh1EaS2miZkofy8Put
 1mO+DbRnVlQrmdINcdEf6asb92ogEGMZu8/7qtNu8n/xGzdzjmUkYU+Ny w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="303104214"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="303104214"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 12:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="556512797"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga006.jf.intel.com with SMTP; 10 Jun 2022 12:29:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jun 2022 22:29:44 +0300
Date: Fri, 10 Jun 2022 22:29:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 11/15] drm/i915/bios: convert intel_bios_init_panel()
 to drm_edid
Message-ID: <YqObqJ7Dr8TgcCmg@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
 <1fcff3e9aeea3778c69aeaf2940c09886bd90a8c.1654674560.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fcff3e9aeea3778c69aeaf2940c09886bd90a8c.1654674560.git.jani.nikula@intel.com>
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

On Wed, Jun 08, 2022 at 10:50:41AM +0300, Jani Nikula wrote:
> Try to use struct drm_edid where possible, even if having to fall back
> to looking into struct edid down low via drm_edid_raw().
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_bios.c | 23 ++++++++++++-----------
>  drivers/gpu/drm/i915/display/intel_bios.h |  4 ++--
>  drivers/gpu/drm/i915/display/intel_dp.c   |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c |  2 +-
>  4 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
> index c42b9e7d0dce..be0b4264d526 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.c
> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
> @@ -604,13 +604,13 @@ get_lfp_data_tail(const struct bdb_lvds_lfp_data *data,
>  }
>  
>  static int opregion_get_panel_type(struct drm_i915_private *i915,
> -				   const struct edid *edid)
> +				   const struct drm_edid *drm_edid)
>  {
>  	return intel_opregion_get_panel_type(i915);
>  }
>  
>  static int vbt_get_panel_type(struct drm_i915_private *i915,
> -			      const struct edid *edid)
> +			      const struct drm_edid *drm_edid)
>  {
>  	const struct bdb_lvds_options *lvds_options;
>  
> @@ -629,12 +629,13 @@ static int vbt_get_panel_type(struct drm_i915_private *i915,
>  }
>  
>  static int pnpid_get_panel_type(struct drm_i915_private *i915,
> -				const struct edid *edid)
> +				const struct drm_edid *drm_edid)
>  {
>  	const struct bdb_lvds_lfp_data *data;
>  	const struct bdb_lvds_lfp_data_ptrs *ptrs;
>  	const struct lvds_pnp_id *edid_id;
>  	struct lvds_pnp_id edid_id_nodate;
> +	const struct edid *edid = drm_edid_raw(drm_edid); /* FIXME */
>  	int i, best = -1;
>  
>  	if (!edid)
> @@ -675,7 +676,7 @@ static int pnpid_get_panel_type(struct drm_i915_private *i915,
>  }
>  
>  static int fallback_get_panel_type(struct drm_i915_private *i915,
> -				   const struct edid *edid)
> +				   const struct drm_edid *drm_edid)
>  {
>  	return 0;
>  }
> @@ -688,12 +689,12 @@ enum panel_type {
>  };
>  
>  static int get_panel_type(struct drm_i915_private *i915,
> -			  const struct edid *edid)
> +			  const struct drm_edid *drm_edid)
>  {
>  	struct {
>  		const char *name;
>  		int (*get_panel_type)(struct drm_i915_private *i915,
> -				      const struct edid *edid);
> +				      const struct drm_edid *drm_edid);
>  		int panel_type;
>  	} panel_types[] = {
>  		[PANEL_TYPE_OPREGION] = {
> @@ -716,7 +717,7 @@ static int get_panel_type(struct drm_i915_private *i915,
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(panel_types); i++) {
> -		panel_types[i].panel_type = panel_types[i].get_panel_type(i915, edid);
> +		panel_types[i].panel_type = panel_types[i].get_panel_type(i915, drm_edid);
>  
>  		drm_WARN_ON(&i915->drm, panel_types[i].panel_type > 0xf &&
>  			    panel_types[i].panel_type != 0xff);
> @@ -747,7 +748,7 @@ static int get_panel_type(struct drm_i915_private *i915,
>  static void
>  parse_panel_options(struct drm_i915_private *i915,
>  		    struct intel_panel *panel,
> -		    const struct edid *edid)
> +		    const struct drm_edid *drm_edid)
>  {
>  	const struct bdb_lvds_options *lvds_options;
>  	int panel_type;
> @@ -759,7 +760,7 @@ parse_panel_options(struct drm_i915_private *i915,
>  
>  	panel->vbt.lvds_dither = lvds_options->pixel_dither;
>  
> -	panel_type = get_panel_type(i915, edid);
> +	panel_type = get_panel_type(i915, drm_edid);
>  
>  	panel->vbt.panel_type = panel_type;
>  
> @@ -3092,11 +3093,11 @@ void intel_bios_init(struct drm_i915_private *i915)
>  
>  void intel_bios_init_panel(struct drm_i915_private *i915,
>  			   struct intel_panel *panel,
> -			   const struct edid *edid)
> +			   const struct drm_edid *drm_edid)
>  {
>  	init_vbt_panel_defaults(panel);
>  
> -	parse_panel_options(i915, panel, edid);
> +	parse_panel_options(i915, panel, drm_edid);
>  	parse_generic_dtd(i915, panel);
>  	parse_lfp_data(i915, panel);
>  	parse_lfp_backlight(i915, panel);
> diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
> index b112200ae0a0..7bcc818e8d80 100644
> --- a/drivers/gpu/drm/i915/display/intel_bios.h
> +++ b/drivers/gpu/drm/i915/display/intel_bios.h
> @@ -32,8 +32,8 @@
>  
>  #include <linux/types.h>
>  
> +struct drm_edid;
>  struct drm_i915_private;
> -struct edid;
>  struct intel_bios_encoder_data;
>  struct intel_crtc_state;
>  struct intel_encoder;
> @@ -234,7 +234,7 @@ struct mipi_pps_data {
>  void intel_bios_init(struct drm_i915_private *dev_priv);
>  void intel_bios_init_panel(struct drm_i915_private *dev_priv,
>  			   struct intel_panel *panel,
> -			   const struct edid *edid);
> +			   const struct drm_edid *drm_edid);
>  void intel_bios_fini_panel(struct intel_panel *panel);
>  void intel_bios_driver_remove(struct drm_i915_private *dev_priv);
>  bool intel_bios_is_valid_vbt(const void *buf, size_t size);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 64b6481225f1..2f47f1e7607b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5217,7 +5217,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  	intel_connector->edid = drm_edid;
>  
>  	intel_bios_init_panel(dev_priv, &intel_connector->panel,
> -			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
> +			      IS_ERR(drm_edid) ? NULL : drm_edid);
>  
>  	intel_panel_add_edid_fixed_modes(intel_connector,
>  					 intel_connector->panel.vbt.drrs_type != DRRS_TYPE_NONE,
> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
> index d4389054bf59..ed5fceb93952 100644
> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
> @@ -971,7 +971,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
>  	intel_connector->edid = drm_edid;
>  
>  	intel_bios_init_panel(dev_priv, &intel_connector->panel,
> -			      IS_ERR_OR_NULL(drm_edid) ? NULL : drm_edid_raw(drm_edid));
> +			      IS_ERR(drm_edid) ? NULL : drm_edid);
>  
>  	/* Try EDID first */
>  	intel_panel_add_edid_fixed_modes(intel_connector,
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
