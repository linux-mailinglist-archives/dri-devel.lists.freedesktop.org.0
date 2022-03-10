Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961134D44F9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 11:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CA610EB2E;
	Thu, 10 Mar 2022 10:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3610EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 10:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646909402; x=1678445402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IDSJDxWMfdHg9PEv2Ee9zUqGb5FzIofruDLGP6GrweQ=;
 b=kG92H8gYtCBlHE0WxMIxquYWLpbsP9wpRZgNzdorNlf+MRdUx1X+cxuW
 IqDbP+tAMZdgSYqrAYqaEmiF9imOkeHWHPyxX8XiFSLrYEbsR4VF9QUpX
 eMh7HEAHerTNP+tyx/sm++jLGUBpJjZxviZb/IVASs0kdB185L9p/cKfq
 f4bZKx/QY9yTS9s74sPmbxyOzSYoahYrMjWPye6pHHjHAh2Nf2JzJz75L
 15iorTZQd/bM5HnPaqFaWthd5ly33E0YvXFkuP6BagXSYDHs7+1paNTSw
 PC7iEaaXVKuLlgneHT1bUbuagvyYW398TFkdp3Siby8AQzFFIuEGj8p9G w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="252787941"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="252787941"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 02:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="688622544"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 10 Mar 2022 02:49:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Mar 2022 12:49:58 +0200
Date: Thu, 10 Mar 2022 12:49:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [v4 5/5] drm/edid: check for HF-SCDB block
Message-ID: <YinX1pX56kZTJp4L@intel.com>
References: <20220302093511.30299-1-shawn.c.lee@intel.com>
 <20220302093511.30299-6-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220302093511.30299-6-shawn.c.lee@intel.com>
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
Cc: jani.nikula@intel.com, ankit.k.nautiyal@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 05:35:11PM +0800, Lee Shawn C wrote:
> Find HF-SCDB information in CEA extensions block. And retrieve
> Max_TMDS_Character_Rate that support by sink device.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 2b8ddc956ce2..d6b48c543c23 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3350,6 +3350,7 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
>  #define EXT_VIDEO_DATA_BLOCK_420	0x0E
>  #define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
>  #define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
> +#define EXT_VIDEO_HF_SCDB_DATA_BLOCK	0x79
>  #define EDID_BASIC_AUDIO	(1 << 6)
>  #define EDID_CEA_YCRCB444	(1 << 5)
>  #define EDID_CEA_YCRCB422	(1 << 4)
> @@ -4277,6 +4278,20 @@ static bool cea_db_is_vcdb(const u8 *db)
>  	return true;
>  }
>  
> +static bool cea_db_is_hf_scdb(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 7)
> +		return false;
> +
> +	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_SCDB_DATA_BLOCK)
> +		return false;
> +
> +	return true;
> +}
> +
>  static bool cea_db_is_y420cmdb(const u8 *db)
>  {
>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> @@ -4987,6 +5002,25 @@ static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
>  		info->rgb_quant_range_selectable = true;
>  }
>  
> +static void drm_parse_hf_scdb(struct drm_connector *connector, const u8 *db)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	u32 max_tmds_clock;
> +
> +	DRM_DEBUG_KMS("HF-SCDB version 0x%02x\n", db[4]);
> +
> +	max_tmds_clock = db[5] * 5000;
> +	if (info->max_tmds_clock < max_tmds_clock) {
> +		info->max_tmds_clock = max_tmds_clock;
> +		DRM_DEBUG_KMS("HF-SCDB: max TMDS clock %d kHz\n",
> +			      info->max_tmds_clock);
> +	}
> +
> +	/*
> +	 * ToDo: Parse the remaining SCDB data if needed
> +	 */

If I'm reading the spec right this block should contain the exact same
stuff as the HF-VSDB. We should reuse the same code for parsing both.

> +}
> +
>  static
>  void drm_get_max_frl_rate(int max_frl_rate, u8 *max_lanes, u8 *max_rate_per_lane)
>  {
> @@ -5282,6 +5316,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			drm_parse_y420cmdb_bitmap(connector, db);
>  		if (cea_db_is_vcdb(db))
>  			drm_parse_vcdb(connector, db);
> +		if (cea_db_is_hf_scdb(db))
> +			drm_parse_hf_scdb(connector, db);
>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, db);
>  	}
> -- 
> 2.17.1

-- 
Ville Syrjälä
Intel
