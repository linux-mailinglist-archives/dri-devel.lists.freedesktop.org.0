Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BC672131
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70110E77D;
	Wed, 18 Jan 2023 15:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271DE10E76D;
 Wed, 18 Jan 2023 15:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674055484; x=1705591484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/lesKUnw4jZteLzWKpcsCKsdoF3v7zF1xLiHL1aJdGA=;
 b=bCIbIdvFtwNp6zDxA+IPM5KRQpOAITcRUVAQuI3S5w/Z1gKLerKF3jiD
 9OmPle/4UE5Ct9HL+nQsN1jIob2S3lvQkS/6VkiaVTDb6/xqMJV6r+MEZ
 e2fTyfJHoXbB8nD97A8LFHcXWxrRruR2a9EvyrgX6ltMyGVL/5AIXMAc3
 tOnkluCXvBMgcq94ELLbiFPHzf7mFoTbQlKsao2T7JUD7tnmGqLdrjUvS
 6MybSKmQB83BSNpBkanAxKLMbR6LRo0CH8NU57URa04dDEPTPUApfSppG
 UFYlUieIKtA6AVQAFYU1mB/StkNl4fRA+S7K23w670LXJ0COBWAiwlsBK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387354623"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387354623"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690227639"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690227639"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:24:41 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:24:40 +0200
Date: Wed, 18 Jan 2023 17:24:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 07/22] drm/edid: refactor CTA Y420CMDB parsing
Message-ID: <Y8gPOEqkE4F8F6+Z@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <7a0e5e99a83f203b6a8981d263b89b2bb7d2fe15.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0e5e99a83f203b6a8981d263b89b2bb7d2fe15.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:22PM +0200, Jani Nikula wrote:
> Now that we have pre-parsed CTA VDB VICs stored in info->vics, leverage
> that to simplify CTA Y420CMDB parsing. Move updating the y420_cmdb_modes
> bitmap to the display info parsing stage, instead of updating it during
> add modes. This allows us to drop the intermediate y420_cmdb_map from
> display info, and replace it with a local variable.
> 
> This is prerequisite work for overall better separation of the two
> parsing steps (updating display info and adding modes).
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c  | 86 ++++++++++++++++++-------------------
>  include/drm/drm_connector.h |  3 --
>  2 files changed, 43 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4e9108e9fc96..ead7a4ce0422 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4522,24 +4522,6 @@ static int do_y420vdb_modes(struct drm_connector *connector,
>  	return modes;
>  }
>  
> -/*
> - * drm_add_cmdb_modes - Add a YCBCR 420 mode into bitmap
> - * @connector: connector corresponding to the HDMI sink
> - * @vic: CEA vic for the video mode to be added in the map
> - *
> - * Makes an entry for a videomode in the YCBCR 420 bitmap
> - */
> -static void
> -drm_add_cmdb_modes(struct drm_connector *connector, u8 vic)
> -{
> -	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
> -
> -	if (!drm_valid_cea_vic(vic))
> -		return;
> -
> -	bitmap_set(hdmi->y420_cmdb_modes, vic, 1);
> -}
> -
>  /**
>   * drm_display_mode_from_cea_vic() - return a mode for CEA VIC
>   * @dev: DRM device
> @@ -4572,7 +4554,6 @@ EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>  static int add_cta_vdb_modes(struct drm_connector *connector)
>  {
>  	const struct drm_display_info *info = &connector->display_info;
> -	const struct drm_hdmi_info *hdmi = &info->hdmi;
>  	int i, modes = 0;
>  
>  	if (!info->vics)
> @@ -4583,18 +4564,6 @@ static int add_cta_vdb_modes(struct drm_connector *connector)
>  
>  		mode = drm_display_mode_from_vic_index(connector, i);
>  		if (mode) {
> -			/*
> -			 * YCBCR420 capability block contains a bitmap which
> -			 * gives the index of CEA modes from CEA VDB, which
> -			 * can support YCBCR 420 sampling output also (apart
> -			 * from RGB/YCBCR444 etc).
> -			 * For example, if the bit 0 in bitmap is set,
> -			 * first mode in VDB can support YCBCR420 output too.
> -			 * Add YCBCR420 modes only if sink is HDMI 2.0 capable.
> -			 */
> -			if (i < 64 && hdmi->y420_cmdb_map & (1ULL << i))
> -				drm_add_cmdb_modes(connector, info->vics[i]);
> -
>  			drm_mode_probed_add(connector, mode);
>  			modes++;
>  		}
> @@ -5188,20 +5157,26 @@ static int edid_hfeeodb_extension_block_count(const struct edid *edid)
>  	return cta[4 + 2];
>  }
>  
> -static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
> -				      const u8 *db)
> +/*
> + * CTA-861 YCbCr 4:2:0 Capability Map Data Block (CTA Y420CMDB)
> + *
> + * Y420CMDB contains a bitmap which gives the index of CTA modes from CTA VDB,
> + * which can support YCBCR 420 sampling output also (apart from RGB/YCBCR444
> + * etc). For example, if the bit 0 in bitmap is set, first mode in VDB can
> + * support YCBCR420 output too.
> + */
> +static void parse_cta_y420cmdb(struct drm_connector *connector,
> +			       const struct cea_db *db, u64 *y420cmdb_map)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> -	struct drm_hdmi_info *hdmi = &info->hdmi;
> -	u8 map_len = cea_db_payload_len(db) - 1;
> -	u8 count;
> +	int i, map_len = cea_db_payload_len(db) - 1;
> +	const u8 *data = cea_db_data(db) + 1;
>  	u64 map = 0;
>  
>  	if (map_len == 0) {
>  		/* All CEA modes support ycbcr420 sampling also.*/
> -		hdmi->y420_cmdb_map = U64_MAX;
> -		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
> -		return;
> +		map = U64_MAX;
> +		goto out;
>  	}
>  
>  	/*
> @@ -5219,13 +5194,14 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  	if (WARN_ON_ONCE(map_len > 8))
>  		map_len = 8;
>  
> -	for (count = 0; count < map_len; count++)
> -		map |= (u64)db[2 + count] << (8 * count);
> +	for (i = 0; i < map_len; i++)
> +		map |= (u64)data[i] << (8 * i);
>  
> +out:
>  	if (map)
>  		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
>  
> -	hdmi->y420_cmdb_map = map;
> +	*y420cmdb_map = map;
>  }
>  
>  static int add_cea_modes(struct drm_connector *connector,
> @@ -5864,6 +5840,26 @@ static void parse_cta_vdb(struct drm_connector *connector, const struct cea_db *
>  	}
>  }
>  
> +/*
> + * Update y420_cmdb_modes based on previously parsed CTA VDB and Y420CMDB.
> + *
> + * Translate the y420cmdb_map based on VIC indexes to y420_cmdb_modes indexed
> + * using the VICs themselves.
> + */
> +static void update_cta_y420cmdb(struct drm_connector *connector, u64 y420cmdb_map)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	struct drm_hdmi_info *hdmi = &info->hdmi;
> +	int i, len = min_t(int, info->vics_len, BITS_PER_TYPE(y420cmdb_map));
> +
> +	for (i = 0; i < len; i++) {
> +		u8 vic = info->vics[i];
> +
> +		if (vic && y420cmdb_map & BIT_ULL(i))
> +			bitmap_set(hdmi->y420_cmdb_modes, vic, 1);
> +	}
> +}
> +
>  static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
>  {
>  	const struct drm_display_info *info = &connector->display_info;
> @@ -6181,6 +6177,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  	const struct cea_db *db;
>  	struct cea_db_iter iter;
>  	const u8 *edid_ext;
> +	u64 y420cmdb_map = 0;
>  
>  	drm_edid_iter_begin(drm_edid, &edid_iter);
>  	drm_edid_iter_for_each(edid_ext, &edid_iter) {
> @@ -6218,7 +6215,7 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  		else if (cea_db_is_microsoft_vsdb(db))
>  			drm_parse_microsoft_vsdb(connector, data);
>  		else if (cea_db_is_y420cmdb(db))
> -			drm_parse_y420cmdb_bitmap(connector, data);
> +			parse_cta_y420cmdb(connector, db, &y420cmdb_map);
>  		else if (cea_db_is_vcdb(db))
>  			drm_parse_vcdb(connector, data);
>  		else if (cea_db_is_hdmi_hdr_metadata_block(db))
> @@ -6227,6 +6224,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			parse_cta_vdb(connector, db);
>  	}
>  	cea_db_iter_end(&iter);
> +
> +	if (y420cmdb_map)
> +		update_cta_y420cmdb(connector, y420cmdb_map);
>  }
>  
>  static
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d97ed06d5837..1c26c4e72c62 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -304,9 +304,6 @@ struct drm_hdmi_info {
>  	 */
>  	unsigned long y420_cmdb_modes[BITS_TO_LONGS(256)];
>  
> -	/** @y420_cmdb_map: bitmap of SVD index, to extraxt vcb modes */
> -	u64 y420_cmdb_map;
> -
>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
