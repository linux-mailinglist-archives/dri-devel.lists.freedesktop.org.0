Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C33672154
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629C210E191;
	Wed, 18 Jan 2023 15:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D7710E191;
 Wed, 18 Jan 2023 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674055974; x=1705591974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QvVsZWj7d1SQmyC3akP+bn+90nFoRa1MDp9LhfhHLmw=;
 b=c1refoQQTYj+Ncz+pSuiJ7bmqQZllWjCEF1HwQeBmjnpokpniCylsK0p
 Yoc7BdqWcJ0SqXGV0y/f/c+zhAvMLUR51jZTlvbaJl4XU6T/ONX+QdQJw
 xFJNa/38H/h9J5mACA+gif7ldfnOmvCu8s6hg5aHLPacqDPU5hg0wIK2E
 iGy8TthEyNaUaZrmR0deihNyvSurwpVdRLxV/eYq9R/IpfKkpcSdc2wTC
 HJu2f15U2Wdra7rRvZviQOR+z0gNOIl9hljvHKbMo2QREQXVn454C1gZ9
 rKRF9n7M0rg3KlAb+BwvL2PlyDVxcB6FDGlfMpHWATWlCnKkZx4QpvPtv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="387357465"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387357465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:32:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690229569"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690229569"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:32:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:32:42 +0200
Date: Wed, 18 Jan 2023 17:32:42 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 08/22] drm/edid: split CTA Y420VDB info and mode parsing
Message-ID: <Y8gRGmldy0Kh+LRK@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <3bc5fe6650a6ce4249803f7192096764ea724e05.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bc5fe6650a6ce4249803f7192096764ea724e05.1672826282.git.jani.nikula@intel.com>
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

On Wed, Jan 04, 2023 at 12:05:23PM +0200, Jani Nikula wrote:
> Separate the parsing of display info and modes from the CTA
> Y420VDB. This is prerequisite work for overall better separation of the
> two parsing steps.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index ead7a4ce0422..076ba125c38d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4497,10 +4497,8 @@ drm_display_mode_from_vic_index(struct drm_connector *connector, int vic_index)
>  static int do_y420vdb_modes(struct drm_connector *connector,
>  			    const u8 *svds, u8 svds_len)
>  {
> -	int modes = 0, i;
>  	struct drm_device *dev = connector->dev;
> -	struct drm_display_info *info = &connector->display_info;
> -	struct drm_hdmi_info *hdmi = &info->hdmi;
> +	int modes = 0, i;
>  
>  	for (i = 0; i < svds_len; i++) {
>  		u8 vic = svd_to_vic(svds[i]);
> @@ -4512,13 +4510,10 @@ static int do_y420vdb_modes(struct drm_connector *connector,
>  		newmode = drm_mode_duplicate(dev, cea_mode_for_vic(vic));
>  		if (!newmode)
>  			break;
> -		bitmap_set(hdmi->y420_vdb_modes, vic, 1);
>  		drm_mode_probed_add(connector, newmode);
>  		modes++;
>  	}
>  
> -	if (modes > 0)
> -		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
>  	return modes;
>  }
>  
> @@ -5876,6 +5871,26 @@ static bool cta_vdb_has_vic(const struct drm_connector *connector, u8 vic)
>  	return false;
>  }
>  
> +/* CTA-861-H YCbCr 4:2:0 Video Data Block (CTA Y420VDB) */
> +static void parse_cta_y420vdb(struct drm_connector *connector,
> +			      const struct cea_db *db)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	struct drm_hdmi_info *hdmi = &info->hdmi;
> +	const u8 *svds = cea_db_data(db) + 1;

Sidenote: I wonder if we should abstract the payload handling
better for blocks using extended tag codes...

> +	int i;
> +
> +	for (i = 0; i < cea_db_payload_len(db) - 1; i++) {
> +		u8 vic = svd_to_vic(svds[i]);
> +
> +		if (!drm_valid_cea_vic(vic))
> +			continue;
> +
> +		bitmap_set(hdmi->y420_vdb_modes, vic, 1);

I'm thinking we should probably also add these to the vic list.
But I suppose we can take care of that with a separate patch.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		info->color_formats |= DRM_COLOR_FORMAT_YCBCR420;
> +	}
> +}
> +
>  static void drm_parse_vcdb(struct drm_connector *connector, const u8 *db)
>  {
>  	struct drm_display_info *info = &connector->display_info;
> @@ -6216,6 +6231,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			drm_parse_microsoft_vsdb(connector, data);
>  		else if (cea_db_is_y420cmdb(db))
>  			parse_cta_y420cmdb(connector, db, &y420cmdb_map);
> +		else if (cea_db_is_y420vdb(db))
> +			parse_cta_y420vdb(connector, db);
>  		else if (cea_db_is_vcdb(db))
>  			drm_parse_vcdb(connector, data);
>  		else if (cea_db_is_hdmi_hdr_metadata_block(db))
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
