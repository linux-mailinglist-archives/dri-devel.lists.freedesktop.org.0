Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FB1672063
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0B410E762;
	Wed, 18 Jan 2023 15:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25810E6F6;
 Wed, 18 Jan 2023 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674054047; x=1705590047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=68c325VjfL8aCYRg864MJ9CmsN2DN/rfduIGADfQYIk=;
 b=jFJYSePtamA8WF9boDAvxxjRYBu+HCGe8M/bPEuTCxBbZn9WA/I6x01/
 rMFpC9/1q8+qa3jQ3wlDXLDxiiNslhRcsUHp1srPSugfzMjtjRG4tJt6r
 EvMh2YGi8218OQ7TJvBNlBCCih6rP8joGI2elkflSbejE35Wp+VGvYoBR
 UnE3KoBBV8Qndeq5OZt/6kS5oBK7dSosGzV3H2LF+z7uv8KQvJ4cn+5Qs
 ZMbcq6G4cPKCMNXBGd60hGaOQfppjtvG80XC20DRu2QKCuHWTDX3tjprE
 /MIv2L0ttSaj5YOqEbhLe68fiKVmqVQMtocbs07Mq39KuvW/gx+2LLDOz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326264754"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326264754"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833606590"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="833606590"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga005.jf.intel.com with SMTP; 18 Jan 2023 07:00:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:00:27 +0200
Date: Wed, 18 Jan 2023 17:00:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 02/22] drm/edid: fix parsing of 3D modes from HDMI VSDB
Message-ID: <Y8gJi2tNyP20fHO9@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <cf159b8816191ed595a3cb954acaf189c4528cc7.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf159b8816191ed595a3cb954acaf189c4528cc7.1672826282.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 12:05:17PM +0200, Jani Nikula wrote:
> Commit 537d9ed2f6c1 ("drm/edid: convert add_cea_modes() to use cea db
> iter") inadvertently moved the do_hdmi_vsdb_modes() call within the db
> iteration loop, always passing NULL as the CTA VDB to
> do_hdmi_vsdb_modes(), skipping a lot of stereo modes.
> 
> Move the call back outside of the loop.
> 
> This does mean only one CTA VDB and HDMI VSDB combination will be
> handled, but it's an unlikely scenario to have more than one of either
> block, and it was not accounted for before the regression either.
> 
> Fixes: 537d9ed2f6c1 ("drm/edid: convert add_cea_modes() to use cea db iter")
> Cc: <stable@vger.kernel.org> # v6.0+
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 23f7146e6a9b..b94adb9bbefb 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5249,13 +5249,12 @@ static int add_cea_modes(struct drm_connector *connector,
>  {
>  	const struct cea_db *db;
>  	struct cea_db_iter iter;
> +	const u8 *hdmi = NULL, *video = NULL;
> +	u8 hdmi_len = 0, video_len = 0;
>  	int modes = 0;
>  
>  	cea_db_iter_edid_begin(drm_edid, &iter);
>  	cea_db_iter_for_each(db, &iter) {
> -		const u8 *hdmi = NULL, *video = NULL;
> -		u8 hdmi_len = 0, video_len = 0;
> -
>  		if (cea_db_tag(db) == CTA_DB_VIDEO) {
>  			video = cea_db_data(db);
>  			video_len = cea_db_payload_len(db);
> @@ -5271,18 +5270,17 @@ static int add_cea_modes(struct drm_connector *connector,
>  			modes += do_y420vdb_modes(connector, vdb420,
>  						  cea_db_payload_len(db) - 1);
>  		}
> -
> -		/*
> -		 * We parse the HDMI VSDB after having added the cea modes as we
> -		 * will be patching their flags when the sink supports stereo
> -		 * 3D.
> -		 */
> -		if (hdmi)
> -			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len,
> -						    video, video_len);
>  	}
>  	cea_db_iter_end(&iter);
>  
> +	/*
> +	 * We parse the HDMI VSDB after having added the cea modes as we will be
> +	 * patching their flags when the sink supports stereo 3D.
> +	 */
> +	if (hdmi)
> +		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len,
> +					    video, video_len);

I wonder if there are any EDIDs with multiple copies
of either data block... But the original code couldn't
deal with that either so not really a concern for this
patch.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +
>  	return modes;
>  }
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
