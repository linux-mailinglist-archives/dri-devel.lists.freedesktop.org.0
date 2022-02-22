Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477534BF2A3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 08:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC6210ED78;
	Tue, 22 Feb 2022 07:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E251E10ED78
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645514886; x=1677050886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=phJ3jMYpvlQOG5tISAV+f5vqDTYJ082I3mYy5egoioE=;
 b=LT/wFGkQZh0iivaziZc26ZCk/lrGE20HgP3r0+hI7Er7TJl9iiJM03lz
 4TuW/zq1q8I0nbCqo8JQ6BPB4QDE5vsROw8y9b7jcYg9FTpz1p26UPNuO
 qQcw4PgWdpvRQnskq/1V3aa+9Ecz3rTzAUxDxYqjiKQi0zk9yJzBZg25b
 sCAb1vOpY9/E7aaY5Rpty0m85EP2uY6mzQrTWQlVdrCouHXLH8/BFD6N8
 PRtCJLop15RfZEdsw+IeoGyhQKtxELKaLWr66z1DsWC8mzf3mGGGyBalX
 guNLRO6CnSGF8MM5juzdDw9FmfiC/IrTkwp4+BL7181CmPif8yujbUcLx w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251582764"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251582764"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 23:28:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="532119667"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 21 Feb 2022 23:28:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 09:28:02 +0200
Date: Tue, 22 Feb 2022 09:28:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lee Shawn C <shawn.c.lee@intel.com>
Subject: Re: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Message-ID: <YhSQgtQp7Ou2WqNB@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222063819.5279-1-shawn.c.lee@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 02:38:17PM +0800, Lee Shawn C wrote:
> Try to find and parse more CEA ext blocks if edid->extensions
> is greater than one.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 75 +++++++++++++++++++++++---------------
>  1 file changed, 45 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..3d5dbbeca7f9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4313,43 +4313,58 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
>  	const u8 *cea = drm_find_cea_extension(edid);
>  	const u8 *db, *hdmi = NULL, *video = NULL;
>  	u8 dbl, hdmi_len, video_len = 0;
> -	int modes = 0;
> +	int modes = 0, j;
>  
> -	if (cea && cea_revision(cea) >= 3) {
> -		int i, start, end;
> +	if (!cea)
> +		return 0;
>  
> -		if (cea_db_offsets(cea, &start, &end))
> -			return 0;
> +	for (j = (cea - (u8 *)edid) / EDID_LENGTH; j <= edid->extensions;) {

That looks rather illegible. I think we want a
drm_find_cea_extension(const struct edid *edid, int *ext_index)
and then just loop until it stops giving us stuff.

There are also several other callers of drm_find_cea_extension().
Why don't they require the same treatment?

> +		if (cea && cea_revision(cea) >= 3) {
> +			int i, start, end;
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
>  		}
> -	}
>  
> -	/*
> -	 * We parse the HDMI VSDB after having added the cea modes as we will
> -	 * be patching their flags when the sink supports stereo 3D.
> -	 */
> -	if (hdmi)
> -		modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> -					    video_len);
> +		/*
> +		 * We parse the HDMI VSDB after having added the cea modes as we will
> +		 * be patching their flags when the sink supports stereo 3D.
> +		 */
> +		if (hdmi) {
> +			modes += do_hdmi_vsdb_modes(connector, hdmi, hdmi_len, video,
> +						    video_len);
> +			hdmi  = NULL;
> +			video = NULL;
> +			hdmi_len = 0;
> +			video_len = 0;
> +		}
> +
> +		/* move to next CEA extension block */
> +		cea = drm_find_edid_extension(edid, CEA_EXT, &j);
> +		if (!cea)
> +			break;
> +	}
>  
>  	return modes;
>  }
> -- 
> 2.17.1

-- 
Ville Syrjälä
Intel
