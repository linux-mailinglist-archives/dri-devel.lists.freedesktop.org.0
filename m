Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC0467209B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E52410E764;
	Wed, 18 Jan 2023 15:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329A810E76D;
 Wed, 18 Jan 2023 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674054541; x=1705590541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n3xm6Jy+6Bkp9op+ltP6f4HBSA4En1GUZWp8ZkUyluc=;
 b=Smc+UOqh62AskuyWk+Yfn9YMP6Uq+ub4549K+iOGqi+BOTsJbBcIJWMR
 VvYMoCGv0ka3s1Yxm2lNwIMO10JgPgP1Sx3Pf450jpWfGrJdx56lDWUPP
 KV6vZRQX9QcapbQUPJcKTkiJfFr9Q7dlHHxDq/lxjIhZu2tgDYOwpOlsP
 qtQm/KmyHK+0AZuICmqH2102b2aj7S9gSZ81qlcv73RFc3CQVdbGlfRyb
 9PydmN3e4tKePtXnfW9bn/ku/oXVjrUkP62cSuTGU5nIv++B4uwlK9/UC
 cC32U3xyxoxU4/eExz7Os6Jxn+sh3wM21z4JptUbAinBSKLDfwfO2hhy/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308562061"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="308562061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:09:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690225023"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690225023"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:08:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:08:57 +0200
Date: Wed, 18 Jan 2023 17:08:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 04/22] drm/edid: Use the pre-parsed VICs
Message-ID: <Y8gLiSc3hrxfn9QH@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <30f1a97193171e70ec1c26c4b685d8930799b9a6.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30f1a97193171e70ec1c26c4b685d8930799b9a6.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:19PM +0200, Jani Nikula wrote:
> Now that we have all the VICs in info->vics, use them to simplify access
> based on VIC index, i.e. on the order of VICs in the EDID, and avoid
> passing CTA VDB pointers around.
> 
> This also fixes the highly unlikely scenarios of a) multiple HDMI VSDBs,
> and b) HDMI VSDB 3D modes using VIC indexes that span across multiple
> CTA VDBs, and the combination of the two.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Cool. Takes care of my previously stated concern of
multiple CTA/HDMI data blocks.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 92 +++++++++++++-------------------------
>  1 file changed, 32 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 90846dc69061..7f0386175230 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4468,28 +4468,20 @@ static u8 svd_to_vic(u8 svd)
>  	return svd;
>  }
>  
> +/*
> + * Return a display mode for the 0-based vic_index'th VIC across all CTA VDBs in
> + * the EDID, or NULL on errors.
> + */
>  static struct drm_display_mode *
> -drm_display_mode_from_vic_index(struct drm_connector *connector,
> -				const u8 *video_db, u8 video_len,
> -				u8 video_index)
> +drm_display_mode_from_vic_index(struct drm_connector *connector, int vic_index)
>  {
> +	const struct drm_display_info *info = &connector->display_info;
>  	struct drm_device *dev = connector->dev;
> -	struct drm_display_mode *newmode;
> -	u8 vic;
>  
> -	if (video_db == NULL || video_index >= video_len)
> +	if (!info->vics || vic_index >= info->vics_len || !info->vics[vic_index])
>  		return NULL;
>  
> -	/* CEA modes are numbered 1..127 */
> -	vic = svd_to_vic(video_db[video_index]);
> -	if (!drm_valid_cea_vic(vic))
> -		return NULL;
> -
> -	newmode = drm_mode_duplicate(dev, cea_mode_for_vic(vic));
> -	if (!newmode)
> -		return NULL;
> -
> -	return newmode;
> +	return drm_display_mode_from_cea_vic(dev, info->vics[vic_index]);
>  }
>  
>  /*
> @@ -4538,9 +4530,8 @@ static int do_y420vdb_modes(struct drm_connector *connector,
>   * Makes an entry for a videomode in the YCBCR 420 bitmap
>   */
>  static void
> -drm_add_cmdb_modes(struct drm_connector *connector, u8 svd)
> +drm_add_cmdb_modes(struct drm_connector *connector, u8 vic)
>  {
> -	u8 vic = svd_to_vic(svd);
>  	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
>  
>  	if (!drm_valid_cea_vic(vic))
> @@ -4577,16 +4568,20 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>  
> -static int
> -do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
> +/* Add modes based on VICs parsed in parse_cta_vdb() */
> +static int add_cta_vdb_modes(struct drm_connector *connector)
>  {
> +	const struct drm_display_info *info = &connector->display_info;
> +	const struct drm_hdmi_info *hdmi = &info->hdmi;
>  	int i, modes = 0;
> -	struct drm_hdmi_info *hdmi = &connector->display_info.hdmi;
>  
> -	for (i = 0; i < len; i++) {
> +	if (!info->vics)
> +		return 0;
> +
> +	for (i = 0; i < info->vics_len; i++) {
>  		struct drm_display_mode *mode;
>  
> -		mode = drm_display_mode_from_vic_index(connector, db, len, i);
> +		mode = drm_display_mode_from_vic_index(connector, i);
>  		if (mode) {
>  			/*
>  			 * YCBCR420 capability block contains a bitmap which
> @@ -4598,7 +4593,7 @@ do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  			 * Add YCBCR420 modes only if sink is HDMI 2.0 capable.
>  			 */
>  			if (i < 64 && hdmi->y420_cmdb_map & (1ULL << i))
> -				drm_add_cmdb_modes(connector, db[i]);
> +				drm_add_cmdb_modes(connector, info->vics[i]);
>  
>  			drm_mode_probed_add(connector, mode);
>  			modes++;
> @@ -4693,15 +4688,13 @@ static int add_hdmi_mode(struct drm_connector *connector, u8 vic)
>  }
>  
>  static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
> -			       const u8 *video_db, u8 video_len, u8 video_index)
> +			       int vic_index)
>  {
>  	struct drm_display_mode *newmode;
>  	int modes = 0;
>  
>  	if (structure & (1 << 0)) {
> -		newmode = drm_display_mode_from_vic_index(connector, video_db,
> -							  video_len,
> -							  video_index);
> +		newmode = drm_display_mode_from_vic_index(connector, vic_index);
>  		if (newmode) {
>  			newmode->flags |= DRM_MODE_FLAG_3D_FRAME_PACKING;
>  			drm_mode_probed_add(connector, newmode);
> @@ -4709,9 +4702,7 @@ static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
>  		}
>  	}
>  	if (structure & (1 << 6)) {
> -		newmode = drm_display_mode_from_vic_index(connector, video_db,
> -							  video_len,
> -							  video_index);
> +		newmode = drm_display_mode_from_vic_index(connector, vic_index);
>  		if (newmode) {
>  			newmode->flags |= DRM_MODE_FLAG_3D_TOP_AND_BOTTOM;
>  			drm_mode_probed_add(connector, newmode);
> @@ -4719,9 +4710,7 @@ static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
>  		}
>  	}
>  	if (structure & (1 << 8)) {
> -		newmode = drm_display_mode_from_vic_index(connector, video_db,
> -							  video_len,
> -							  video_index);
> +		newmode = drm_display_mode_from_vic_index(connector, vic_index);
>  		if (newmode) {
>  			newmode->flags |= DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF;
>  			drm_mode_probed_add(connector, newmode);
> @@ -4742,8 +4731,7 @@ static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
>   * also adds the stereo 3d modes when applicable.
>   */
>  static int
> -do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
> -		   const u8 *video_db, u8 video_len)
> +do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
>  {
>  	struct drm_display_info *info = &connector->display_info;
>  	int modes = 0, offset = 0, i, multi_present = 0, multi_len;
> @@ -4818,9 +4806,7 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
>  		for (i = 0; i < 16; i++) {
>  			if (mask & (1 << i))
>  				modes += add_3d_struct_modes(connector,
> -						structure_all,
> -						video_db,
> -						video_len, i);
> +							     structure_all, i);
>  		}
>  	}
>  
> @@ -4857,8 +4843,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
>  
>  		if (newflag != 0) {
>  			newmode = drm_display_mode_from_vic_index(connector,
> -								  video_db,
> -								  video_len,
>  								  vic_index);
>  
>  			if (newmode) {
> @@ -5249,20 +5233,16 @@ static int add_cea_modes(struct drm_connector *connector,
>  {
>  	const struct cea_db *db;
>  	struct cea_db_iter iter;
> -	const u8 *hdmi = NULL, *video = NULL;
> -	u8 hdmi_len = 0, video_len = 0;
> -	int modes = 0;
> +	int modes;
> +
> +	/* CTA VDB block VICs parsed earlier */
> +	modes = add_cta_vdb_modes(connector);
>  
>  	cea_db_iter_edid_begin(drm_edid, &iter);
>  	cea_db_iter_for_each(db, &iter) {
> -		if (cea_db_tag(db) == CTA_DB_VIDEO) {
> -			video = cea_db_data(db);
> -			video_len = cea_db_payload_len(db);
> -			modes += do_cea_modes(connector, video, video_len);
> -		} else if (cea_db_is_hdmi_vsdb(db)) {
> -			/* FIXME: Switch to use cea_db_data() */
> -			hdmi = (const u8 *)db;
> -			hdmi_len = cea_db_payload_len(db);
> +		if (cea_db_is_hdmi_vsdb(db)) {
> +			modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
> +						    cea_db_payload_len(db));
>  		} else if (cea_db_is_y420vdb(db)) {
>  			const u8 *vdb420 = cea_db_data(db) + 1;
>  
> @@ -5273,14 +5253,6 @@ static int add_cea_modes(struct drm_connector *connector,
>  	}
>  	cea_db_iter_end(&iter);
>  
> -	/*
> -	 * We parse the HDMI VSDB after having added the cea modes as we will be
> -	 * patching their flags when the sink supports stereo 3D.
> -	 */
> -	if (hdmi)
> -		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len,
> -					    video, video_len);
> -
>  	return modes;
>  }
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
