Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4AA4C8DF5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073D10E60A;
	Tue,  1 Mar 2022 14:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4874910E606
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646145502; x=1677681502;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mFLIqCvAyY2/LrwoFiEHpZbCCXlpsUY1msyxQGoIlUY=;
 b=NbYO4WWX2MzdqGesmrWisH5vu1VuVQJApY34sR8MRsjlqvNSJEfZzd67
 5IU/1RYzluXhzhgegYdkt0pldsMIshRIGECJbNCqlANauTFM98sb051My
 jYIDEWwseVnUT4fuv9cF3tAO3B+MIs604KcY36UwA0wSvOPKhCKvg7QzX
 jLxhi7+7fbEA5+WlF8NfDIKItj+xInjTAdLaaxES8G2D+SeHOyhrnFJGH
 f0R2A4Kzq/7B4XthBS9bazbxYL4z+Z2qzYtyGYRFz5G9vasMojedOtI9v
 n+a3xhk5ttMyvbNoK7uF04MoyryT/zwE7gA/8cSG9JveGLJEYhFskP8TY Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240554555"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="240554555"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 06:38:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="507820319"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga002.jf.intel.com with SMTP; 01 Mar 2022 06:38:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Mar 2022 16:38:18 +0200
Date: Tue, 1 Mar 2022 16:38:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [v2 2/4] drm/edid: parse multiple CEA extension block
Message-ID: <Yh4v2qmkg6TGxntZ@intel.com>
References: <20220301081216.20368-1-shawn.c.lee@intel.com>
 <20220301081216.20368-3-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301081216.20368-3-shawn.c.lee@intel.com>
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

On Tue, Mar 01, 2022 at 04:12:14PM +0800, Lee Shawn C wrote:
> Try to find and parse more CEA ext blocks if edid->extensions
> is greater than one.
> 
> v2: split prvious patch to two. And do CEA block parsing
>     in this one.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 70 +++++++++++++++++++++-----------------
>  1 file changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 375e70d9de86..e2cfde02f837 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4319,47 +4319,53 @@ static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
>  static int
>  add_cea_modes(struct drm_connector *connector, struct edid *edid)
>  {
> -	const u8 *cea, *db, *hdmi = NULL, *video = NULL;
> -	u8 dbl, hdmi_len, video_len = 0;
> +	const u8 *cea;
>  	int modes = 0, ext_index = 0;
>  
> -	cea = drm_find_cea_extension(edid, &ext_index);
> -	if (cea && cea_revision(cea) >= 3) {
> -		int i, start, end;
> +	for (;;) {
> +		cea = drm_find_cea_extension(edid, &ext_index);
> +		if (!cea)
> +			break;
>  
> -		if (cea_db_offsets(cea, &start, &end))
> -			return 0;
> +		if (cea && cea_revision(cea) >= 3) {
> +			const u8 *db, *hdmi = NULL, *video = NULL;
> +			u8 dbl, hdmi_len, video_len = 0;
> +			int i, start, end;

This amount of indentation is pretty horrible. Pls reverse
this if-clause to get rid of one level. Should also make
the diff much nicer.

>  
> -		for_each_cea_db(cea, i, start, end) {
> -			db = &cea[i];
> -			dbl = cea_db_payload_len(db);
> +			if (cea_db_offsets(cea, &start, &end))
> +				continue;
>  
> -			if (cea_db_tag(db) == VIDEO_BLOCK) {
> -				video = db + 1;
> -				video_len = dbl;
> -				modes += do_cea_modes(connector, video, dbl);
> -			} else if (cea_db_is_hdmi_vsdb(db)) {
> -				hdmi = db;
> -				hdmi_len = dbl;
> -			} else if (cea_db_is_y420vdb(db)) {
> -				const u8 *vdb420 = &db[2];
> -
> -				/* Add 4:2:0(only) modes present in EDID */
> -				modes += do_y420vdb_modes(connector,
> -							  vdb420,
> -							  dbl - 1);
> +			for_each_cea_db(cea, i, start, end) {
> +				db = &cea[i];
> +				dbl = cea_db_payload_len(db);
> +
> +				if (cea_db_tag(db) == VIDEO_BLOCK) {
> +					video = db + 1;
> +					video_len = dbl;
> +					modes += do_cea_modes(connector, video, dbl);
> +				} else if (cea_db_is_hdmi_vsdb(db)) {
> +					hdmi = db;
> +					hdmi_len = dbl;
> +				} else if (cea_db_is_y420vdb(db)) {
> +					const u8 *vdb420 = &db[2];
> +
> +					/* Add 4:2:0(only) modes present in EDID */
> +					modes += do_y420vdb_modes(connector,
> +								  vdb420,
> +								  dbl - 1);
> +				}
>  			}
> +
> +			/*
> +			 * We parse the HDMI VSDB after having added the cea modes as we will
> +			 * be patching their flags when the sink supports stereo 3D.
> +			 */
> +			if (hdmi)
> +				modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> +							    video_len);
>  		}
>  	}
>  
> -	/*
> -	 * We parse the HDMI VSDB after having added the cea modes as we will
> -	 * be patching their flags when the sink supports stereo 3D.
> -	 */
> -	if (hdmi)
> -		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> -					    video_len);
> -
>  	return modes;
>  }
>  
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
